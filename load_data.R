source("tolerance_functions.R")
source("derived_files/lasth_100_post.R")

#LOAD DATA
emery <-load_emery()
stanDat <- load_stanDat()
posts <- rstan::extract(stanDat)
ndraws <- nrow(posts$lp__)
lasth <- load_lasth()
grad <- load_gradient()
<<<<<<< HEAD
draws <- read_csv("bayes/tidy_parameters.csv")
=======
draws <- read_csv("bayes/stan_par1_df.csv") #draws for penalized zero model
>>>>>>> 8bcad5c8891359760a8017d70fb8ca697e50d237
