library(lme4)
source("tolerance_functions.R")
emery <- load_emery()

emery %>%
  ggplot(aes(treat, Inflor_biomass, colour = Block)) +
  geom_jitter(height = 0)

#no interaction between treatment and species
full <- lmer(Inflor_biomass ~ Treatment + species + (1|Block), data = emery)
no_block <- lm(Inflor_biomass ~ Treatment + species, data = emery)
anova(full, no_block)

#interaction between treatment and species
full <- lmer(Inflor_biomass ~ Treatment*species + (1|Block), data = emery)
no_block <- lm(Inflor_biomass ~ Treatment*species, data = emery)
anova(full, no_block)