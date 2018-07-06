run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0627123960747089, 0.0486837657239386, 
-0.0247801870042346, -0.0116910158048746), p_value = c(0.126896591046937, 
0.0219516572155284, 0.310878446841959, 0.180903563075339), rand_var = c(1.21413922380447, 
1.21413922380447, 1.21413922380447, 1.21413922380447), mean_rand = c(0.724904577206205, 
0.724904577206205, 0.724904577206205, 0.724904577206205), sim_n = c(31L, 
31L, 31L, 31L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.104000139859618, 0.0446808750011308, 
-0.010081676597807, -0.0434687725769288), prop = c(0.2525, 0.0375, 
0.045, 0.035), rand_var = c(1.21413922380447, 1.21413922380447, 
1.21413922380447, 1.21413922380447), mean_rand = c(0.724904577206205, 
0.724904577206205, 0.724904577206205, 0.724904577206205), sim_n = c(31L, 
31L, 31L, 31L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.22453841598776, 
    shape2 = 2.5127443767833, stretch = 1.01783555029329, x_min = -1.6603715066639, 
    x_max = 4.7339907035883, maxima = 3.20915679802136, rep = 31L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
