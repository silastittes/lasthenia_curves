#GENERATE DERIVED PARAMETERS AND ANALYSES FOR LASTHENIA TOLERANCE CURVE DATA
source("load_data.R")
source("derived_files/state_reg.R")

post_trees <- source("derived_files/lasth_100_post.R")$value

draws <- read.csv("bayes/stan_par1_df.csv") #draws for penalized zero model
draw_fits <- read.csv("bayes/fitted_points_mod1.csv")

n_draws <- posts$lp__ %>% nrow

mapsims <- 100
par_draws <- 100

regime_list <- list(
  state_reg, 
  state_reg_aqua_terr2terr, 
  state_reg_aqua_terr2vernal
  )

set.seed(12345)
reg_fit <- regime_list %>% map(~{
  make.simmap(tree = lasth, .x, model = "ER", nsim = mapsims)
})


#1. model (BM1, OU1, or OUM), 
#2. regime list (index or value??)
#3. model parameter (listed in draws)
#4. index for simmap (100 in all)
#5. index for draw (100 in all)

mod <- "OU1"
r <- 3 #one of three regime types declared above
var <- "e"
draw_i <- 2
sim_i <- 4

states <- colnames(reg_fit[[r]][[1]]$mapped.edge)

simstates <- reg_fit[[r]] %>% map(~ states[apply(.x$mapped.edge, 1, which.max)])
anc_sims <- simstates %>% map(~ .x[lasth$edge[,2] >= length(lasth$tip.label)])

ou_test <- draws %>% 
  mutate(Reg = regime_list[[r]][match(Species, Genus_species)]) %>%
  filter(draw == draw_i) %>%
  select(Species, Reg, one_of(var)) 

lasth$node.label <- anc_sims[[sim_i]]

ou_sim <- OUwie(lasth, data = ou_test,
                model = mod, root.station = T)

ou_sim$AIC
ou_sim$loglik
names(ou_sim$solution[1,])
ou_sim$solution[1,]
ou_sim$solution[2,]
ou_sim$theta[,1]




###############################################################
##CURVE SIGNAL-------------------------------------------------
###############################################################
n_draws <- 9

xseq_comm <- seq(1,5,length.out=100)
signal_set1 <- draws %>% revmap_kumara(xseq_comm, .)

curve_sig <- 1:n_draws %>%
  map(~{
    d2 <- signal_set1 %>% 
      filter(draw == .x) %>%
      mutate(y = ifelse(is.na(y), 0, y))
    out <- abind(split(d2[,2:3], d2$Species), along=3)
    post_trees %>% map_dbl(function(lasth_i){
      physignal(A = out, phy = lasth_i, iter = 1)$phy.signal  
    })
  }) %>% 
  flatten %>% 
  as_vector %>% 
  as_tibble %>%
  mutate(param = rep("curve", n()),
         tree = rep(1:length(post_trees), n_draws)) %>%
  rename(signal = value)


###############################################################
##PARAM SIGNAL-------------------------------------------------
###############################################################


param_names <- c("area", "d", "maxima", "e", "c", "special", "breadth")
signal_df_pre <- param_names %>% map(function(var){
  1:n_draws %>% map(~{
    param_df <- draws %>% 
      group_by(Species) %>%
      filter(draw == .x) %>% 
      select(Species, one_of(var))
    param <- param_df[[2]]
    names(param) <- param_df[[1]]
      post_trees %>% map_dbl(function(lasth_i){
        physignal(A = param, phy = lasth_i, iter = 1)$phy.signal  
      })
  })
}) %>% do.call(cbind, .) %>% 
  as_tibble %>% 
  set_colnames(param_names) %>%
  gather("param", "signal")

signal_df <- signal_df_pre$signal %>%
  flatten %>% 
  as_vector %>% 
  as_tibble %>%
  mutate( param = rep(signal_df_pre$param, each = length(trees_post)),
          tree = rep(1:length(post_trees), length(param_names)*n_draws)) %>%
  rename(signal = value)
  

all_sig <- bind_rows(curve_sig, signal_df) %>%
  mutate(param = factor(param))

levels(all_sig$param) <- c("curve", param_names)

write_csv(all_sig, "derived_files/curve_K.csv")
#write.table(x = curveK_draws, file = "derived_files/curve_K.txt")
