################################
################################
### install missing packages ###
################################
################################

pkgs <- c("devtools", "scales", "tidyverse", "parallel", 
          "magrittr", "truncnorm", "geomorph", 
          "ape", "phytools", "rstan", 
          "gdata", "xtable", "abind",
          "glmnet", "nlme", "ggrepel",
          "ggjoy", "rlang", "stringr", "rethinking", 
          "patchwork", "ggridges"
)

needed <- pkgs[!(pkgs %in% installed.packages()[,"Package"])]

if(length(needed)) install.packages(needed, dependencies = TRUE)

devtools::install_github("silastittes/performr")

################
################
### packages ###
################
################

#performr package contains stan executable prior predictive function and more
library(performr)

#MARKDOWN AND GRAPHICS
library(rmarkdown)
library(knitr)
library(scales)

#tidy
library(tidyverse)
library(stringr)
library(magrittr)
library(patchwork)
library(ggridges)


#other
library(truncnorm)
library(gdata) #read.xls
library(xtable)
library(abind)
library(glmnet)
library(ggrepel)


#phylo comp tools
library(ape)
library(geomorph)
library(phytools)
library(nlme)

#rstan and bayesian stuff
library(rethinking)
library(rstan)
rstan_options(auto_write = TRUE)
options(mc.cores = parallel::detectCores())
extract <- rstan::extract

#overwrite to ensure right function namespace
summarise <- dplyr::summarise
map <- purrr::map

################################
################################
######### PAR SETTINGS #########
################################
################################

opar <- par()
opar$cin <- NULL
opar$cra <- NULL
opar$csi <- NULL
opar$cxy <- NULL
opar$din <- NULL
opar$page <- NULL

####################
####################
#### TRAIT DATA ####
####################
####################

load_emery <- function(){
  holo <- c("ferrisiae", "glabrata", "coulteri", "chrysantha")
  emery <- gdata::read.xls("data/Inundation_compiled_FINAL.xlsx") %>%
    rename(species = Species) %>%
    mutate(Inflor_biomass = ifelse(
      is.na(Inflor_biomass) &
        ifEmerge.Y.N. == 1, yes =  0,
      no = Inflor_biomass)) %>%
    mutate(
      treat = ifelse(
        Treatment == "F", yes = 5,
        no = ifelse(
          Treatment == "MF", yes = 4,
          no = ifelse(
            Treatment == "B", yes = 3,
            no = ifelse(
              Treatment == "MD", yes = 2,
              no = 1
            )
          )
        )
      )
    ) %>%
    filter(!is.na(Inflor_biomass)) %>%
    group_by(species) %>%
    mutate(sppint = as.integer(species)) %>%
    mutate(
      species_h = ifelse(
        as.character(species) %in% holo,
        "hologymne", as.character(species)
      ),
      sppint_h = as.integer(as.factor(species_h))
    ) %>% 
    ungroup() %>% 
    mutate(Inflor_biomass = Inflor_biomass/mean(Inflor_biomass)
           #treat = (treat  - mean(treat))
           )
           
  
  return(emery)
}

#HIGHEST POSTERIOR DENSITY INTERVAL

#From Max Joseph's course
HDI <- function(values, percent=0.95){
  sorted <- sort(values)
  index <- floor(percent * length(sorted))
  nCI <- length(sorted) - index
  width <- rep(0, nCI)
  for (i in 1:nCI){
    width[i] <- sorted[i + index] - sorted[i]
  }
  HDImin <- sorted[which.min(width)]
  HDImax <- sorted[which.min(width) + index]
  HDIlim <- c(HDImin, HDImax)
  return(HDIlim)
}

#################################
#################################
######## LOAD HMCMC DATA ########
#################################
#################################


load_stanDat <- function(){
  stan_samples <- list.files("bayes/samples/")[grep ("performance.samples",
                                                     list.files("bayes/samples/"))]
  rstan::read_stan_csv(paste0("bayes/samples/", stan_samples))
}


##############################################
##############################################
### CREATE HABITAT DATA FOR LASTHENIA TAXA ###
##############################################
##############################################

#THIS ISN'T IDEAL, BUT INFORMATION WAS PUT TOGETHER FROM PREVIOUS PUBLISHED PAPERS,
#SO HARD TO THINK OF AN ALTERNATIVE BESIDES HARD-CODING IT.

Genus_species <- c("debilis", "ferrisiae", "chrysantha", 
                   "fremontii", "coulteri", "microglossa",
                   "platycarpha", "conjugens", "gracilis", 
                   "minor", "glabrata", "burkei",
                   "californica", "glaberrima")

state_reg <- c("terrestrial", "vernal", "vernal",
               "vernal", "vernal", "terrestrial",
               "aqua_terr", "vernal", "aqua_terr",
               "terrestrial", "vernal", "vernal",
               "aqua_terr", "vernal")
names(state_reg) <- Genus_species

state_reg_aqua_terr2terr <- c("terrestrial", "vernal", "vernal",
                              "vernal", "vernal", "terrestrial",
                              "terrestrial", "vernal", "terrestrial",
                              "terrestrial", "vernal", "vernal",
                              "terrestrial", "vernal")
names(state_reg_aqua_terr2terr) <- Genus_species

state_reg_aqua_terr2vernal <- c("terrestrial", "vernal", "vernal",
                                "vernal", "vernal", "terrestrial",
                                "vernal", "vernal", "vernal",
                                "terrestrial", "vernal", "vernal",
                                "vernal", "vernal")
names(state_reg_aqua_terr2vernal) <- Genus_species


reg_df <- tibble(
  habit = state_reg, 
  aqua_terr2terr = state_reg_aqua_terr2terr, 
  aqua_terr2vernal = state_reg_aqua_terr2vernal, 
  species = names(state_reg)
) 







#########################################
#########################################
############ LOAD PHYLO DATA ############
#########################################
#########################################

#Load Tree
load_lasth <- function(addbr = 0.001){
  #set.seed(seed)
  lasth <- read.tree("data/LastheniaBayesian.tre")
  lasth <- root(phy = lasth, outgroup = c("eriophyllum", "amblyopappus"))
  lasth$node.label <- round(as.numeric(lasth$node.label), 2)
  
  lasth_tips <- unlist(strsplit(lasth$tip.label, split = "L."))
  lasth_tips <- unlist(strsplit(lasth_tips , split = "'"))
  lasth_tips <- lasth_tips[lasth_tips != ""]
  lasth$tip.label <- lasth_tips
  
  holoAdd <- which(lasth$tip.label =="sect.Hologymne")
  newtips <- c("coulteri", "glabrata", "ferrisiae", "chrysantha")
  
  addtree <- rtree(
    n = length(newtips), rooted = T, 
    tip.label = newtips, 
    #br = rexp(
    #  n = length(newtips), 
    #  rate = 0)
    
    br = rep(1e-6, length(newtips))
  )
  
  
  lasth <- bind.tree(x = lasth, y = addtree, where = holoAdd)
  
  #drop
  drop <- lasth$tip.label[!lasth$tip.label %in% unique(emery$species)]
  lasth <- drop.tip(phy = lasth, tip = drop)
  lasth <- di2multi(lasth, 1e-5)
  lasth <- chronos(lasth, lambda = 1)
  lasth <- ladderize(lasth, right = T)
  return(lasth)
}

#plot(load_lasth())


################################
################################
#### RUN STAN ON INPUT DATA ####
################################
################################


sim_tolerance_data <- function(
  n_spp = 3,
  mu_sig = 1,
  shape1_pr_mu = 4,
  shape2_pr_mu = 4,
  stretch_pr_mu = 0,
  min_pr_mu = -5,
  max_pr_mu = 5,
  nu_pr_shape = 5,
  nu_pr_scale = 2,
  pr_sig = 1
  ){
  
  
  mu_shape1 <- rnorm(1, shape1_pr_mu, mu_sig)
  shape1 <- truncnorm::rtruncnorm(n_spp, a = 2, mean = mu_shape1, sd = pr_sig)
  
  mu_shape2 <- rnorm(1, shape2_pr_mu, mu_sig)
  shape2 <- truncnorm::rtruncnorm(n_spp, a = 2, mean = mu_shape2, sd = pr_sig)
  
  mu_stretch <- rnorm(1, stretch_pr_mu, mu_sig)
  stretch <- truncnorm::rtruncnorm(n_spp, a = 0, mean = mu_stretch, sd = pr_sig)
  
  mu_min <- rnorm(1, min_pr_mu, mu_sig)
  x_min <- rnorm(n_spp, mu_min, pr_sig)
  
  mu_max <- rnorm(1, max_pr_mu, mu_sig)
  x_max <- rnorm(n_spp, mu_max, pr_sig)
  
  ed_test <- 1:n_spp %>% map_lgl(~x_min[.x] > x_max[.x]) %>% sum()
  if(ed_test > 0){
    stop("parameter x_min is greater than parameter x_max")
  }
  
  mu_nu <- truncnorm::rtruncnorm(1, a = 0, mean = nu_pr_scale, sd = 1)
  nu <- rgamma(n_spp, shape = nu_pr_shape, scale = mu_nu)
  
  list(shape1 = shape1, shape2 = shape2, stretch = stretch, x_min = x_min, x_max = x_max, nu = nu, 
       mu_shape1 = mu_shape1, mu_shape2 = mu_shape2, mu_stretch = mu_stretch, 
       mu_min = mu_min, mu_max = mu_max, mu_nu = mu_nu
  )
}


spp_order <- load_emery() %>% 
  select(species, sppint) %>%
  unique() %>%
  arrange(sppint) %>% 
  select(1) %>%
  as_vector()  


######################################
######################################
#### SIMULATE POSITION ALONG AXIS ####
######################################
######################################

rand_axis <- function(reps = 1){
  emery <- load_emery()
  s1 <- rgamma(n = 1, shape = 2, scale = 10)
  s2 <- rgamma(n = 1, shape = 2, scale = 10)
  treat_map <- rbeta(n = 5, shape1 = s1, shape2 = s2) %>% 
    sort() %>% (function(x) 1 + (x - min(x)) * ( 5 - 1 ) / (max(x) - min(x))) %>%
    tibble(treat = 1:5,
           rand_treat = .)
  left_join(emery, treat_map, by = "treat")
}



########################################
########################################
### LOAD AND PREP POOL GRADIENT DATA ###
########################################
########################################

load_gradient <- function(){
  emery <- load_emery()
  gradient <- read.xls("data/Pool depths_FINAL summary_REVISED.xls", 
                       header = T, skip = 1, stringsAsFactors = F) %>%
    mutate(taxa = strsplit(X, "_") %>% map_chr(~ .x[length(.x)]),
           taxa = ifelse(taxa == "deblilis", "debilis", taxa)) %>% 
    filter(taxa %in% as.character(unique(emery$species)))
  
  droppers <- which(gradient %>% select(-taxa, -X) %>% apply(1, function(x) mean(is.na(x))) == 1)
  gradient[-droppers,] %>% 
    select(Mean, SE, taxa) %>%
    rename(species = taxa)
}

#################################################
#################################################
### CONSTRUCT STAN AND GRADIENT COMBINED DATA ###
#################################################
#################################################

gen_gradient_df <- function(tolerance_df){
  
  grad <- load_gradient()
  #reg_df is constructed above
  wide_params <- full_join(x = tolerance_df, y = grad, by = "species") %>%
    full_join(., reg_df, by = "species")
  
  wide_params <- wide_params %>%
    ungroup() %>%
    select(-c(species, draw, Mean, SE, habit, aqua_terr2terr, aqua_terr2vernal)) %>% 
    scale %>% 
    as_tibble %>%
    set_colnames( paste0(names(.), "_sc" )) %>%
    bind_cols(., wide_params) %>%
    mutate(
      aqua_terr2terr_bin = ifelse(
        aqua_terr2terr == "vernal", 0, 1
      ),
      aqua_terr2vernal_bin = ifelse(
        aqua_terr2vernal == "vernal", 0, 1
      )
    )
  
  wide_params
}
