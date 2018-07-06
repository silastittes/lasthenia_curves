run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0519629675833676, 0.042663257358821, 
0.0138018975260662, -0.0174998630473031), p_value = c(0.0264048898737719, 
0.0279612591005909, 0.16036670764908, 0.123217410114844), rand_var = c(3.99998663917421, 
3.99998663917421, 3.99998663917421, 3.99998663917421), mean_rand = c(-0.999998747417497, 
-0.999998747417497, -0.999998747417497, -0.999998747417497), 
    sim_n = c(100L, 100L, 100L, 100L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.402009710497432, 
    0.243889009632885, 0.0663643256352051, -0.156752333335993
    ), prop = c(0.01, 0.2075, 0.075, 0.0375), rand_var = c(3.99998663917421, 
    3.99998663917421, 3.99998663917421, 3.99998663917421), mean_rand = c(-0.999998747417497, 
    -0.999998747417497, -0.999998747417497, -0.999998747417497
    ), sim_n = c(100L, 100L, 100L, 100L)), .Names = c("var", 
"mean", "prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 4.17615621428479, shape2 = 4.57564509451487, stretch = 1.3808503071987, 
    x_min = -1.10923073341386, x_max = 3.73833865449689, maxima = 2.03303122735223, 
    rep = 100L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
