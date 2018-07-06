run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.022110740923518, 0.0644556910567662, 
-0.00935293275291026, 0.00824196508082003), p_value = c(0.0566272738193633, 
0.00151454492415623, 0.248695475448479, 0.27932562695229), rand_var = c(0.164213127020369, 
0.164213127020369, 0.164213127020369, 0.164213127020369), mean_rand = c(-0.0589382096559756, 
-0.0589382096559756, -0.0589382096559756, -0.0589382096559756
), sim_n = c(5L, 5L, 5L, 5L)), .Names = c("term", "coef", "p_value", 
"rand_var", "mean_rand", "sim_n"), class = c("tbl_df", "tbl", 
"data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.0165891460586427, 
    0.129435446259354, -0.0174278325840671, 0.039595659582223
    ), prop = c(0.0125, 0.1625, 0.015, 0.045), rand_var = c(0.164213127020369, 
    0.164213127020369, 0.164213127020369, 0.164213127020369), 
    mean_rand = c(-0.0589382096559756, -0.0589382096559756, -0.0589382096559756, 
    -0.0589382096559756), sim_n = c(5L, 5L, 5L, 5L)), .Names = c("var", 
"mean", "prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 2.86994690828927, shape2 = 3.0770603818194, stretch = 1.11085468421019, 
    x_min = -0.451874700475304, x_max = 4.90350520515213, maxima = 2.83840794084846, 
    rep = 5L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
