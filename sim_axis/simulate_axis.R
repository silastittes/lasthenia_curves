source("load_data.R")

set.seed(541)
total_n <- 1e4
treat_var_df <- 1:total_n %>% map_df(~{
  s1 <- rgamma(n = 1, shape = 2, scale = 10)
  s2 <- rgamma(n = 1, shape = 2, scale = 10)
  treat_map <- rbeta(n = 5, shape1 = s1, shape2 = s2) %>%
    sort() %>% (function(x) (1 + (x - min(x)) * ( 5 - 1 ) / (max(x) - min(x)) ))
  #treat_map <- runif(5, 1,5) %>% sort()
   treat_var <- treat_map %>% sort() %>% diff() %>% var()
  rbind(treat_map) %>% cbind(., treat_var) %>% as_tibble()
}) %>% arrange(treat_var)

n_reps <- 100
rand_grad <- seq(min(treat_var_df$treat_var), max(treat_var_df$treat_var), length.out = n_reps)
grad_idx <- rand_grad %>% map_int(~ which.min((treat_var_df$treat_var - .x)^2))
unif_var_df <- treat_var_df %>% slice(grad_idx)
unif_var_df[1,] <- c(1,2,3,4,5, 0)
range(unif_var_df$treat_var)

apply(unif_var_df[, 1:5], 1, function(x) length(unique(x)))


#generate random locations for x axis 
#output is original data "emery" data frame with rand_treat column appended

treats <- emery$treat %>% unique() %>% sort()
spp_order <- data.frame(Sp = emery$species, int = emery$sppint) %>%
  unique() %>%
  arrange(int) %>% select(1) %>%
  as_vector()


#########################################################
## commented out to avoid overwriting existing results ##
#########################################################

zz <- file("sim_axis/simulate_axis_messages.Rout", open="wt")
sink(zz, type="message")

for(x in 1:n_reps){

  message(paste0("simulation number:", x))

  rand_df <- tibble(treat = treats,
                    rand_treat = as.vector(t(unif_var_df[x, 1:5]))
  )
  emery_r <- left_join(emery, rand_df, by = "treat")

  rand_var <- unif_var_df$treat_var[x]
  mean_rand <- emery_r$rand_treat %>% unique() %>% sort() %>% mean() - 3

  #c(1,1,1,1,5) %>% sort() %>% diff() %>% var()
  #expand.grid(1:5, 1:5, 1:5, 1:5, 1:5) %>% apply(1, function(x) sort(x) %>% diff() %>% var()) %>% summary()

  stan_out <- stan_performance(df = emery_r,
                            response = Inflor_biomass,
                            treatment = rand_treat,
                            group_ids = sppint,
                            iter = 200,
                            max_treedepth = 15)


  sim_grad_df <- gen_gradient_df(tolerance_df = perform_df(stan_out, spp_order))


  summ_stan_df <- sim_grad_df %>%
    select(shape1, shape2, stretch, x_min, x_max, maxima) %>%
    group_by() %>%
    summarise_all(.funs = mean) %>%
    mutate(rep = as.integer(x))


  lasso_depth <- sim_grad_df %>%
    group_by(draw) %>%
    do({
      test_df <- .
      test_df <- test_df %>%
        select(Mean, stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
        drop_na()
      test_modmat <- model.matrix(Mean ~ . -1, data = test_df)

      cv_coef <- cv.glmnet(test_modmat,
                           test_df$Mean,
                           nfolds = nrow(test_modmat),
                           grouped = F
      ) %>%
        coef(s = "lambda.min") %>%
        as.matrix %>%
        t %>%
        as_tibble
    })


  lasso_all <- sim_grad_df %>%
    group_by(draw) %>%
    do({
      test_df <- .
      test_df <- test_df %>%
        select(aqua_terr2terr_bin, stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
        drop_na()

      test_modmat <- model.matrix(aqua_terr2terr_bin ~ . -1, data = test_df)

      cv_coef <- cv.glmnet(test_modmat,
                           test_df$aqua_terr2terr_bin,
                           family = "binomial",
                           nfolds = nrow(test_modmat),
                           grouped = F
      ) %>%
        coef(s = "lambda.min") %>%
        as.matrix %>%
        t %>%
        as_tibble
    })

  lasso_df <- lasso_all %>%
    ungroup %>%
    select(-draw, -`(Intercept)`) %>%
    summarise_all(
      funs(
        mean = mean(., na.rm = T),
        prop = mean(. > 0, na.rm = T)
      )
    ) %>%
    gather(variable, value) %>%
    separate(variable, c("var", "stat"), sep = "_sc\\_") %>%
    spread(stat, value) %>%
    mutate(rand_var = rand_var,
           mean_rand = mean_rand,
           sim_n = as.integer(x))


  lasso_depth_df <- lasso_depth %>%
    ungroup %>%
    select(-draw, -`(Intercept)`) %>%
    summarise_all(
      funs(
        mean = mean(., na.rm = T),
        prop = mean(. > 0, na.rm = T)
      )
    ) %>%
    gather(variable, value) %>%
    separate(variable, c("var", "stat"), sep = "_sc\\_") %>%
    spread(stat, value) %>%
    mutate(rand_var = rand_var,
           mean_rand = mean_rand,
           sim_n = as.integer(x))


  run_x <- list(lasso_df = lasso_df, lasso_depth = lasso_depth_df, summ_stan_df = summ_stan_df)
  #run_x <- list(lm_df = lm_df, lasso_df = lasso_df, summ_stan_df = summ_stan_df)

  dump(file = str_glue("sim_axis/simulate_axis_results_{x}.R"), list = "run_x", append = T)
  
  
  
  # tidy_rand_mod <- unique(sim_grad_df$draw) %>% map_df(~ {
  #   sim_grad_df %>% filter(draw == .x) %>%
  #     lm(Mean ~ stretch_sc + x_min_sc + x_max_sc +  maxima_sc, data = .) %>%
  #     broom::tidy()
  # })
  
  # lm_df <- tidy_rand_mod %>%
  #   group_by(term) %>%
  #   filter(term != "(Intercept)") %>%
  #   summarise(coef = mean(estimate),
  #             #p_value = mean(p.value)) %>%
  #             p_value =  1/mean(1/p.value)) %>%
  #   mutate(rand_var = rand_var,
  #          mean_rand = mean_rand,
  #          sim_n = as.integer(x))
  
  
  
  #NON PHYLOGENETIC LASSO CLASSIFICATION BY HABITAT
  # lasso_all <- sim_grad_df %>%
  #   group_by(draw) %>%
  #   do({
  #     test_df <- .
  #     test_df %>% as.data.frame #%>% set_rownames(.$)
  #     test_modmat <- test_df %>% select(contains("_sc")) %>%
  #       select(stretch_sc, x_min_sc, x_max_sc,  maxima_sc) %>%
  #       model.matrix(test_df$aqua_terr2terr_bin ~ . -1, data = .)
  #
  #     cv_coef <- cv.glmnet(test_modmat,
  #                          test_df$aqua_terr2terr_bin,
  #                          family = "binomial",
  #                          nfolds = nrow(test_modmat),
  #                          grouped = F) %>%
  #       coef(s = "lambda.min") %>%
  #       as.matrix %>%
  #       t %>%
  #       as_tibble
  #   })
  
  
}

sink(type="message")
close(zz)

rand_sim <- list.files("sim_axis/", full.names = T)[grep("simulate_axis_results", list.files("sim_axis/"))] %>% 
  map(~source(.x)$value)


# rand_sim <- c("sim_axis//simulate_axis_results_1.R", "sim_axis//simulate_axis_results_50.R", "sim_axis//simulate_axis_results_100.R")%>% 
#   map(~source(.x)$value)

lm_all <- rand_sim %>% map_df(~{
  .x$lasso_depth
})

#range(lm_all$rand_var, na.rm = T)

lasso_all <- rand_sim %>% map_df(~{
  .x$lasso_df
})

sum_all <- rand_sim %>% map_df(~{
  .x$summ_stan_df
}) 


sum_all %>%
  ggplot(aes(rep, x_max, fill = )) +
  geom_point()

theme_set(theme_minimal())


cairo_pdf(filename = "figures/B15.pdf")
par(mfrow = c(1, 1))
plot(NA, NA, type = "n", xlim = c(1,5), ylim =c(100,1),
     ylab = "simulation index", xlab = "treatment value")
#axis(2)
1:n_reps %>% walk(~{
  points(t(unif_var_df[.x,1:5]), 
         rep(.x,5), asp = 0.1, 
         col = alpha(colour = "black", 0.6), 
         pch = "|", cex = 0.5)
})
c(1, 25, 50, 75, 100) %>% walk(~{
  points(t(unif_var_df[.x,1:5]), 
         rep(.x,5), asp = 0.1, 
         col = alpha(colour = 1:5, 0.6), 
         pch = 19, cex = 2)
})
dev.off()



alph <- 0.2
p1 <- lm_all %>% 
  ggplot(aes(rand_var, mean, colour = var)) +
  geom_point(alpha = alph) +
  geom_smooth(method = "lm", se=F) +
  ggtitle("pool depth gradient") +
  ylab("coefficient mean") +
  xlab("") +
  theme(legend.position = "none") 

p2 <- lm_all %>% 
  ggplot(aes(rand_var, prop, colour = var)) +
  geom_point(alpha = alph) +
  geom_smooth(method = "lm", se=F) +
  xlab("variance of differences") +
  ylab("proportion of coefficients > 0") +
  theme(legend.position = "none")


p3 <- lasso_all %>% 
  ggplot(aes(rand_var, mean, colour = var)) +
  geom_point(alpha = alph) +
  geom_smooth(method = "lm", se=F) +
  ggtitle("habitat") + 
  ylab("") +
  xlab("") +
  guides(colour=guide_legend(title="Coefficients")) +
  scale_color_discrete()

p4 <- lasso_all %>% 
  ggplot(aes(rand_var, prop, colour = var)) +
  geom_point(alpha = alph) +
  geom_smooth(method = "lm", se=F) +
  xlab("variance of differences") +
  ylab("") +
  theme(legend.position = "none")

cairo_pdf(filename = "figures/B16.pdf", width = 7, height = 5)
p1 + p3 + p2 + p4
dev.off()


cairo_pdf(filename = "figures/B17.pdf")
sum_all %>%
  #select(-) %>%
  group_by(rep) %>%
  #rename(α=a, β = b, ζ = c, δ = d, ε = e, β_0 = beta_0,  β_1 = beta_1, optimum = maxima) %>%
  summarise_all(.funs = mean) %>%
  gather(param, value, -rep) %>%
  ggplot(aes(x = value)) +
  geom_histogram() +
  facet_wrap(~param, scales = "free")
dev.off()



# full_join(
#   lasso_all,
#   unif_var_df %>%
#     mutate(sim_n = 1:n()), 
#   by = "sim_n"
# ) %>%
#   mutate(hi_diff = V5 - V4) %>%
#   filter(var %in% c("x_min", "x_max")) %>%
#   #mutate(var = gsub(pattern = "d", replacement = "δ", var)) %>%
#   #mutate(var = gsub(pattern = "e", replacement = "ε", var)) %>%
#   rename(parameter = var) %>%
#   ggplot(aes(hi_diff, prop, colour = parameter)) +
#   geom_point() +
#   geom_smooth(method = lm, se = F) +
#   xlab("Treatment 5 - Treatment 4") +
#   ylab("proportion of coefficients > 0")
