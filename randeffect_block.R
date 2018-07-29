library(flextable)
library(officer)
library(lme4)

source("tolerance_functions.R")
emery <- load_emery()

emery %>%
  ggplot(aes(treat, Inflor_biomass, colour = Block)) +
  geom_jitter(height = 0)

#no interaction between treatment and species
full <- lmer(Inflor_biomass ~ Treatment + species + (1|Block), data = emery)
no_block <- lm(Inflor_biomass ~ Treatment + species, data = emery)
anova1 <- anova(full, no_block) %>% 
  as.data.frame() %>%
  regulartable()

doc <- read_docx()
doc <- body_add_flextable(doc, value = anova1)
print(doc, target = "~/Desktop/anova1.docx")  

#interaction between treatment and species
full <- lmer(Inflor_biomass ~ Treatment*species + (1|Block), data = emery)
no_block <- lm(Inflor_biomass ~ Treatment*species, data = emery)
anova2 <- anova(full, no_block) %>% 
  as.data.frame() %>%
  regulartable()

doc <- body_add_flextable(doc, value = anova2)
print(doc, target = "~/Desktop/anova2.docx")  
