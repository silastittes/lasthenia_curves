source("tolerance_functions.R")

set.seed(54678)

sim_curves <- function(n_spp,
                       n_axis,
                       n_reps,
                       mu_sig,
                       shape1_pr_mu,
                       shape2_pr_mu,
                       stretch_pr_mu,
                       min_pr_mu,
                       max_pr_mu,
                       nu_pr_shape,
                       nu_pr_scale,
                       pr_sig
){
  
  true_params <- sim_tolerance_data(
    n_spp = n_spp,
    mu_sig = mu_sig,
    shape1_pr_mu = shape1_pr_mu,
    shape2_pr_mu = shape2_pr_mu,
    stretch_pr_mu = stretch_pr_mu,
    min_pr_mu = min_pr_mu,
    max_pr_mu = max_pr_mu,
    nu_pr_shape = nu_pr_shape,
    nu_pr_scale = nu_pr_scale,
    pr_sig = pr_sig
  )
  
  #where along axis to sample
  amnt <- 0.9
  x_lo <- quantile(true_params$x_min, amnt)
  x_hi <- quantile(true_params$x_max, 1-amnt)
  
  #in case max is less than min
  if(x_lo > x_hi){
    x_lo <- x_lo + x_hi
    x_hi <- x_lo - x_hi
    x_lo <- x_lo - x_hi
  }
  
  xseq <- seq(x_lo, x_hi, length.out = n_axis) %>%
    rep(each = n_reps)
  
  #generated data 
  mu_df <- 1:n_spp %>% 
    map_df(~{
      true_df <- tibble(
        shape1 = true_params$shape1[.x], 
        shape2 = true_params$shape2[.x], 
        stretch = true_params$stretch[.x], 
        x_min = true_params$x_min[.x], 
        x_max = true_params$x_max[.x], 
        nu = true_params$nu[.x],
        species = .x,
        draw = 1
      )
      posterior_predict(xseq, true_df)
    })
  
  #run stan via performr package
  stan_out <- stan_performance(
    df = mu_df, 
    response = trait, 
    treatment = x, 
    group_ids = species,
    nu_pr_shape = nu_pr_shape[1], 
    nu_pr_scale = nu_pr_scale[1],
    stretch_pr_mu = stretch_pr_mu[1],
    shape1_pr_mu = shape1_pr_mu[1],  
    shape2_pr_mu = shape1_pr_mu[1],
    seed = 123
  )
  
  posts <- extract(stan_out)
  performance_mu
  #check performance
  params <- c("shape1", "shape2", "stretch", "x_min", "x_max", "nu")
  sim_val <- params %>% map(function(p){
    
    truth <- true_params[[p]]
    
    if(length(dim(posts[[p]])) == 1){
      qs <- quantile(posts[[p]], probs = c(0.025,0.975))
      lglz <- seq_along(truth) %>% map_lgl(~{
        qs[1] < truth[.x] & qs[2] > truth[.x] 
      }) %>% mean()
      
      probs <- 1:length(truth) %>%
        map_dbl(function(xx){mean(posts[[p]] > truth[xx])})
      
      diffs <- 1:length(truth) %>%
        map_dbl(function(xx){mean(posts[[p]] - truth[xx])})
      
    } else{
      
      qs <- apply(posts[[p]], 2, quantile, probs = c(0.025,0.975))  
      
      lglz <- seq_along(truth) %>% map_lgl(~{
        qs[1, .x] < truth[.x] & qs[2,.x] > truth[.x] 
      }) %>% mean()
      
      probs <- 1:ncol(posts[[p]]) %>%
        map_dbl(function(xx){mean(posts[[p]][,xx] > truth[xx])})
      
      diffs <- 1:ncol(posts[[p]]) %>%
        map_dbl(function(xx){mean(posts[[p]][,xx] - truth[xx])})
      
    }
    list(lglz = lglz, probs = probs, diffs = diffs)
  })
  
  names(sim_val) <- params
  
  true_curves <- true_params %>%
    data.frame() %>% 
    mutate(species = 1:n(),
           draw = 1) %>%
    map_performance(par_df = .) %>%
    rename(trait = y)
  
  
  par_df <- perform_df(stan_out, unique(mu_df$species))
  sim_curves_n <- par_df %>%
    filter(draw %in% 1:100) %>%
    map_performance(par_df = .) %>%
    rename(trait = y)
  
  
  list(
    true_params = true_params,
    sim_val = sim_val,
    mu_df = mu_df, 
    sim_curves_n = sim_curves_n,
    true_curves = true_curves
  )
}



n_spp <- 14
n_axis <- 5
n_reps <- 10

mu_sig <- c(1, 1)
shape1_pr_mu <- c(2, 2)
shape2_pr_mu <- c(2, 2) 
stretch_pr_mu <- c(2, 0.5)
min_pr_mu <- c(-5, -5)
max_pr_mu <- c(5, 5)
nu_pr_shape <- c(8, 2)
nu_pr_scale <- c(3, 2)
pr_sig <- c(1, 1)



simz_out <- 1:2 %>% 
  map(function(z){
    sim_curves(n_spp = n_spp,
               n_axis = n_axis,
               n_reps = n_reps,
               mu_sig= mu_sig[z], 
               shape1_pr_mu = shape1_pr_mu[z],
               shape2_pr_mu = shape2_pr_mu[z],
               stretch_pr_mu = stretch_pr_mu[z],
               min_pr_mu = min_pr_mu[z],
               max_pr_mu = max_pr_mu[z],
               nu_pr_shape = nu_pr_shape[z],
               nu_pr_scale = nu_pr_scale[z],
               pr_sig = pr_sig[z]
    )
  })


for(i in 1:2){
  
  cbind(
    simz_out[[i]]$sim_val %>% map(~{.$probs}) %>% map_dbl(mean),
    simz_out[[i]]$sim_val %>% map(~{.$diffs}) %>% map_dbl(mean),
    simz_out[[i]]$sim_val %>% map_dbl(~{.$lgl})
  ) %>%
    set_colnames(
      c("post > true", "difference", "w.in 0.95 cred)")
    ) %>%
    xtable(digits = 2) %>%
    print.xtable(comment = F, timestamp = F, file = str_glue("derived_files/validate_{i}.tex"))
  
  

  sim_i <- simz_out[[i]]$mu_df %>%
    ggplot(aes(x, trait)) +
    facet_wrap(~species, scales = "free_y") +
    geom_line(data = simz_out[[i]]$sim_curves_n, aes(x, trait, group = draw), alpha = 0.1, colour = "dodgerblue") +
    geom_line(data = simz_out[[i]]$true_curves, aes(x, trait), colour = "black") +
    geom_point(alpha = 0.9, size = 0.5, colour = "grey") +
    theme_minimal()
    ggsave(filename = str_glue("figures/B{i}.pdf"), sim_i)
}
