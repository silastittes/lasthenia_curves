#POSTERIOR PREDICTIVE CHECKS FOR LASTHENIA TOLERANCE CURVE MODEL
source("tolerance_functions.R")
#source("load_data.R")

emery <- load_emery() %>%

  select(species, sppint, Inflor_biomass, treat)

tidy_draws <- read.csv("bayes/tidy_parameters.csv")

post_pred <- 1:nrow(tidy_draws) %>% 
  map_df(~{
    
    draw_i <- tidy_draws[.x, ]
    tidy_spp <- tidy_draws$species[.x]
    emery_i <- emery %>% filter(species == tidy_spp)
    
    mus <- performance_mu(xs = emery_i$treat, 
                          shape1 = draw_i$shape1, 
                          shape2 = draw_i$shape2, 
                          stretch = draw_i$stretch, 
                          x_min = draw_i$x_min,
                          x_max = draw_i$x_max
    )
    
    pseudo <- posterior_predict(x = emery_i$treat, draw_i)  
    
    # plot(emery_i$treat, emery_i$Inflor_biomass)
    # points(pseudo$x+0.1, pseudo$trait, pch = 19)
     
    data.frame(
      ssq_obs = sum((mus - emery_i$Inflor_biomass)^2),
      ssq_pseudo = sum((mus - pseudo$trait)^2),
      species = tidy_spp
    )
    
  })

mean(post_pred$ssq_obs > post_pred$ssq_pseudo)
hist(post_pred$ssq_obs - post_pred$ssq_pseudo, breaks = 100)


pred_spp <- post_pred %>% group_by(species) %>%
  summarise(lab = as.character(mean(ssq_obs > ssq_pseudo) %>% round(2)),
            ssq_obs_mean = ssq_obs %>% mean(),
            ssq_pseudo_mean = ssq_pseudo %>% mean())

post_pred_pv <- full_join(post_pred, pred_spp, by = "species") %>%
  mutate(species_pv = paste0(species, " (",lab,")"))

write_csv(pred_spp, "bayes/postpred_out.csv")

post_plot <- post_pred_pv %>% ggplot(aes(x = log(ssq_obs), y = log(ssq_pseudo))) +
  geom_point(alpha = 0.1, aes(colour = species_pv)) +
  #geom_point(alpha = 0.1, aes(colour = species_pv)) +
  #geom_text_repel(data = pred_spp, label = pred_spp$lab, size = 4) +
  #facet_wrap(~species, scales = "free") +
  geom_abline(intercept = 0, slope = 1, lty = 2, col = "blue") +
  ylab("Log posterior predictive ssq") +
  xlab("Log observed ssq") +
  theme_minimal() +
  guides(colour = guide_legend(title = "species", override.aes = list(alpha = 1))) + 
  theme(text = element_text(size = 10),
        legend.text=element_text(size=5))


post_plot

ggsave("figures/figB12.pdf", width = 5, height = 4, plot = post_plot, device = "pdf")
#ggsave("analyses_and_viz/postpred.png", plot = post_plot, device = "png")



# Modeling checking instead using sampled posterior p-values

#Grab a posterior parameter vector at random
df_draw1 <- tidy_draws %>% filter(
  draw == sample(1:max(tidy_draws$draw), 1)
)

#simulate n data sets from the random post vector
n <- 1:100
post_pred <- n %>% 
  map_df(~{
    1:nrow(df_draw1) %>% 
      map_df(~{
        draw_i <- df_draw1[.x, ]
        tidy_spp <- df_draw1$species[.x]
        emery_i <- emery %>% filter(species == tidy_spp)
        
        
        mus <- performance_mu(xs = emery_i$treat, 
                              shape1 = draw_i$shape1, 
                              shape2 = draw_i$shape2, 
                              stretch = draw_i$stretch, 
                              x_min = draw_i$x_min,
                              x_max = draw_i$x_max
        )
        
        pseudo <- posterior_predict(x = emery_i$treat, draw_i)  
        
        data.frame(
          ssq_obs = sum((mus - emery_i$Inflor_biomass)^2),
          ssq_pseudo = sum((mus - pseudo$trait)^2),
          species = tidy_spp
        )        

      })
  })

#compare ssqs by species

post_pred %>% group_by(species) %>%
  summarise(lab = as.character(mean(ssq_obs > ssq_pseudo) %>% round(2)),
            ssq_obs = ssq_obs %>% max*.9,
            ssq_pseudo = ssq_pseudo %>% max*.9)

#compare whole ssqs
mean(post_pred$ssq_obs > post_pred$ssq_pseudo)
