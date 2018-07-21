#GENERATE DERIVED PARAMETERS AND ANALYSES FOR LASTHENIA TOLERANCE CURVE DATA
source("load_data.R")
source("derived_files/state_reg.R")

post_trees <- source("derived_files/lasth_100_post.R")$value

draws <- read.csv("bayes/tidy_parameters.csv") #draws for penalized zero model
#draw_fits <- read.csv("bayes/tidy_curves.csv")

fewer_draws <- ndraws
sub_draws <- sample(1:ndraws, fewer_draws)
draw_fits <- draws %>% filter(draw %in% sub_draws) %>%
  map_performance_fixed(x = 1:5, par_df = .)

###############################################################
##CURVE SIGNAL-------------------------------------------------
###############################################################

curve_sig <- sub_draws %>%
  map(~{
    d2 <- draw_fits %>% 
      filter(draw == .x)
    out <- abind(split(d2[,2:3], d2$species), along=3)
    post_trees %>% map_dbl(function(lasth_i){
      physignal(A = out, phy = lasth_i, iter = 1)$phy.signal  
    })
  }) %>% 
  flatten %>% 
  as_vector %>% 
  as_tibble %>%
  mutate(param = rep("curve", n()),
         tree = rep(1:length(post_trees), fewer_draws)) %>%
  rename(signal = value)


###############################################################
##PARAM SIGNAL-------------------------------------------------
###############################################################

param_names <- c("area", "x_min", "maxima", "x_max", "stretch", "breadth")
signal_df_pre <- param_names %>% map(function(var_i){
  sub_draws %>% map(~{
    param_df <- draws %>% 
      group_by(draw) %>%
      filter(draw == .x) %>% 
      select(draw, one_of(var_i), species)
    param <- param_df[[2]]
    names(param) <- param_df$species
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
          tree = rep(1:length(post_trees), length(param_names)*fewer_draws)) %>%
  rename(signal = value)


sig <- bind_rows(curve_sig, signal_df) %>%
  mutate(param = factor(param))

levels(sig$param) <- c("curve", param_names)

write_csv(sig, "derived_files/curve_K.csv")
#write.table(x = curveK_draws, file = "derived_files/curve_K.txt")

sig <- read_csv("derived_files/curve_K.csv")

HDI(rnorm(100),percent = 0.95)[1]

sig %>% group_by(param) %>%
  summarise(hdi = HDI(signal, percent = 0.95)[2],
            quant = quantile(signal, probs = 0.975)) %>%
  arrange(quant) 

#sig_den <- sig %>% group_by(param) %>%
#  do(den = density(sig$signal))

cairo_pdf("figures/C2.pdf")
#png(filename = "figures/signal.png")
sig %>%
  mutate(param = sub("maxima", "optima", param)) %>%
  filter(!param %in% c("special", "area")) %>%
  ggplot(aes(x = signal)) +
  geom_density(fill="blue", alpha = 0.8) +
  facet_wrap(~param, ncol = 2) +
  theme_classic() +
  scale_x_continuous(breaks = pretty(sig$signal, n = 4)) +
  theme(text = element_text(size = 16))
dev.off()


