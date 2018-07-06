run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0616490071729462, 0.0771101419048725, 
0.0129086075101895, -0.0273119503798218), p_value = c(0.00319599109289614, 
0.000449302951684156, 0.197071926848282, 0.149119912533685), 
    rand_var = c(2.3024537533914, 2.3024537533914, 2.3024537533914, 
    2.3024537533914), mean_rand = c(0.94172521453843, 0.94172521453843, 
    0.94172521453843, 0.94172521453843), sim_n = c(58L, 58L, 
    58L, 58L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.0937995751062868, 0.17943925835299, 
-0.0692524334747064, -0.171440084077139), prop = c(0.015, 0.2725, 
0.0075, 0.0075), rand_var = c(2.3024537533914, 2.3024537533914, 
2.3024537533914, 2.3024537533914), mean_rand = c(0.94172521453843, 
0.94172521453843, 0.94172521453843, 0.94172521453843), sim_n = c(58L, 
58L, 58L, 58L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.25269884917845, 
    shape2 = 3.76401937798306, stretch = 1.00495870273813, x_min = 0.113915017270837, 
    x_max = 5.92460108759901, maxima = 3.48587194791584, rep = 58L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
