run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0228075058404137, 0.0570561389841266, 
-0.0231594713585525, -0.0150030470914907), p_value = c(0.137892669622365, 
0.00438356544664703, 0.15043404655076, 0.131479279280423), rand_var = c(1.41586353557413, 
1.41586353557413, 1.41586353557413, 1.41586353557413), mean_rand = c(-0.442041621464583, 
-0.442041621464583, -0.442041621464583, -0.442041621464583), 
    sim_n = c(36L, 36L, 36L, 36L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.127795607814222, 
    0.155130110452087, -0.0240184429899352, -0.140623093881239
    ), prop = c(0.0675, 0.165, 0.04, 0.01), rand_var = c(1.41586353557413, 
    1.41586353557413, 1.41586353557413, 1.41586353557413), mean_rand = c(-0.442041621464583, 
    -0.442041621464583, -0.442041621464583, -0.442041621464583
    ), sim_n = c(36L, 36L, 36L, 36L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.47629288671328, shape2 = 4.2222851166933, stretch = 0.842219732095997, 
    x_min = -0.168317380246451, x_max = 3.86762451739167, maxima = 2.23149250350202, 
    rep = 36L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
