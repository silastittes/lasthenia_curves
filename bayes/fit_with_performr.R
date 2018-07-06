source("tolerance_functions.R")
#devtools::install_github("silastittes/performr", force = T)
emery <- load_emery()
options(mc.cores = parallel::detectCores())
extract <- rstan::extract

stan_out <- stan_performance(df = emery,
                           response = Inflor_biomass,
                           treatment = treat,
                           group_ids = sppint, 
                           nu_pr_shape = 5, 
                           nu_pr_scale = 2,
                           adapt_delta = 0.95,
                           max_treedepth = 15,
                           file_id = "bayes/samples/performance",
                           seed = 35
                           )
posts <- rstan::extract(stan_out)

spp_order <- emery %>% select(sppint, species) %>% unique() %>% arrange(sppint) %>% pull(species)
stan_df <- perform_df(stan_out, spp_order)


curve_df <- 1:nrow(stan_df) %>% map_df(~{
  map_performance(x = seq(0, 1, length.out = 100), par_df = stan_df[.x,])
}) %>%
  rename(treat = x,
         Inflor_biomass = y)


write.csv(stan_df, file = "bayes/tidy_parameters.csv", quote = F, row.names = F)
write.csv(curve_df, file = "bayes/tidy_curves.csv", quote = F, row.names = F)


# 
# posts$stretch %>%
#   data.frame() %>%
#   gather("e", "val") %>%
#   ggplot(aes(x = val, colour = e)) +
#   geom_density()
# 
# posts$x_max %>%
#   data.frame() %>%
#   gather("e", "val") %>%
#   ggplot(aes(x = val, colour = e)) +
#   geom_density()
# 
# ndraw <- length(posts$lp__)
# emery %>%
#   ggplot(aes(treat, Inflor_biomass, colour = species)) +
#   facet_wrap(~species) +
#   geom_line(data = filter(curve_df, draw %in% sample(1:ndraw, 100)),
#             aes(treat, Inflor_biomass, group  = draw),
#             alpha = 0.1, inherit.aes = F) +
#   geom_point(alpha = 0.5) +
#   geom_smooth(se = F, lwd = 0.5, alpha = 0.5) +
#   theme(legend.position = "none")
#
# 
# stan_df %>%
#   ggplot(aes(x_max, species, fill = species)) +
#   geom_density_ridges(colour = "white") +
#   theme(legend.position = "none")


#excited this is working, but needs some serious refactoring
# plot_postpred <- function(data_df, data_df_x, data_df_y, par_df, draws, species_id, x_seq, edge = T, qs = 0.95){
#   
#   lo <- (1 - qs)/2
#   hi <- 1 - (1 - qs)/2
#   
#   df_species <- data_df %>% filter(species == species_id)
#   stan_df <- par_df %>% filter(species == species_id, draw %in% draws)
#   curve_df <- map_performance(par_df = stan_df)
#   xrng <- stan_df %>% 
#     filter(species == species_id) %>%
#     summarise(mn = min(x_min),
#               mx = max(x_max))
#   post_p1 <- posterior_predict(x = x_seq, stan_df) 
#   if(edge){
#     post_low <- post_p1 %>%
#       group_by(x) %>%
#       filter(
#         (trait - quantile(trait, probs = lo))^2 == 
#           min((trait - quantile(trait, probs = lo))^2)
#       ) %>%
#       arrange(x)
#     
#     post_hi <- post_p1 %>%
#       group_by(x) %>%
#       filter(
#         (trait - quantile(trait, probs = hi))^2 == 
#           min((trait - quantile(trait, probs = hi))^2)
#         ) %>%
#       arrange(x)
#     plot(post_hi$x, post_hi$trait, col = alpha("dodgerblue", 0.9), type = "n", 
#          xlim = c(xrng$mn, xrng$mx), 
#          ylim = c(0, max(max(df_species[[data_df_y]]),
#                          max(post_hi$trait))
#                   )
#          )
#     polygon(c(post_hi$x, rev(post_low$x)), c(post_hi$trait, rev(post_low$trait)), 
#             col = alpha("dodgerblue", 0.4), border = F)
#   } else{
#     plot(post_p1$x, post_p1$trait, col = alpha("dodgerblue", 0.1), pch = 19)  
#   }
#   curve_df %>% group_by(draw) %>%
#     do({
#       lines(.$x, .$y, col = alpha("black", 0.5))
#       tibble()
#     })
#   points(jitter(df_species[[data_df_x]], amount = 0.1), 
#          df_species[[data_df_y]], pch = 19, cex = 0.5)
#   # lines(loess.smooth(df_species[[data_df_x]], 
#   #                    df_species[[data_df_y]]), col = "green")
# }
# 
# ndraw <- 4000
# onespp <- unique(emery$species) %>% sample(1)
# d100 <- sample(1:ndraw, size = 10, replace = F)
# plot_postpred(data_df = emery,
#               data_df_x = "treat",
#               data_df_y = "Inflor_biomass", 
#               par_df = stan_df, 
#               draws = d100, 
#               qs = 0.5,
#               species_id = onespp, 
#               x_seq = rep(seq(-8, 8, length.out = 50), each = 100)
#               )
# mtext(text = onespp, side = 3)

# 
# for(i in 1:14){
#   for(j in 1:14){
#     if(i != j){
#       comp <- 1 - mean(posts$x_max[,i] > posts$x_max[,j])
#       if(comp > 0.975 | comp < 0.025) {
#         print(paste0(comp, "*") )
#       } else {
#         0
#         #print(comp)
#       }
#     }
#   }
# }
# 
# 
