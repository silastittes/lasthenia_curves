run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.141619235226018, 0.0461613648989179, 
-0.116582171340307, -0.0280238394356408), p_value = c(0.0587532855007542, 
0.0335446126869871, 0.0910637911099488, 0.0944316722671307), 
    rand_var = c(2.42727441182932, 2.42727441182932, 2.42727441182932, 
    2.42727441182932), mean_rand = c(0.956448303097987, 0.956448303097987, 
    0.956448303097987, 0.956448303097987), sim_n = c(61L, 61L, 
    61L, 61L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.276940792234654, 0.00344457856818225, 
0.0935180174485513, -0.0778372799706374), prop = c(0.1875, 0.045, 
0.155, 0.03), rand_var = c(2.42727441182932, 2.42727441182932, 
2.42727441182932, 2.42727441182932), mean_rand = c(0.956448303097987, 
0.956448303097987, 0.956448303097987, 0.956448303097987), sim_n = c(61L, 
61L, 61L, 61L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.32564319892008, 
    shape2 = 2.51763251394093, stretch = 1.48335109485521, x_min = -1.25409723594052, 
    x_max = 4.363996247499, maxima = 3.14209115632319, rep = 61L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
