run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0390263016378663, 0.0702282644189236, 
-0.0232573581301581, -0.00365730205897282), p_value = c(0.0656473431735265, 
0.0027274967361332, 0.124737577911359, 0.216006154215933), rand_var = c(0.0430543574996468, 
0.0430543574996468, 0.0430543574996468, 0.0430543574996468), 
    mean_rand = c(-0.114748091854353, -0.114748091854353, -0.114748091854353, 
    -0.114748091854353), sim_n = c(2L, 2L, 2L, 2L)), .Names = c("term", 
"coef", "p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.0396045586152534, 
    0.131662699537898, -0.154678564802653, -0.0569184276969219
    ), prop = c(0.03, 0.115, 0.0025, 0.02), rand_var = c(0.0430543574996468, 
    0.0430543574996468, 0.0430543574996468, 0.0430543574996468
    ), mean_rand = c(-0.114748091854353, -0.114748091854353, 
    -0.114748091854353, -0.114748091854353), sim_n = c(2L, 2L, 
    2L, 2L)), .Names = c("var", "mean", "prop", "rand_var", "mean_rand", 
"sim_n"), class = c("tbl_df", "tbl", "data.frame"), row.names = c(NA, 
-4L)), summ_stan_df = structure(list(shape1 = 3.33865497497549, 
    shape2 = 3.61760836743378, stretch = 0.881989860091923, x_min = -0.646402431017035, 
    x_max = 4.62299852864859, maxima = 2.63889505189302, rep = 2L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
