run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0633071036704358, 0.0510580892995314, 
-0.0453134114155012, -0.0362456433120271), p_value = c(0.129319047466973, 
0.00977444945156514, 0.186106279861832, 0.155105428932422), rand_var = c(2.66767347237993, 
2.66767347237993, 2.66767347237993, 2.66767347237993), mean_rand = c(-0.964668158001907, 
-0.964668158001907, -0.964668158001907, -0.964668158001907), 
    sim_n = c(67L, 67L, 67L, 67L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.726562053308931, 
    0.511481581812222, -0.490733760575672, -0.129097933787428
    ), prop = c(0.2175, 0.48, 0.0125, 0.17), rand_var = c(2.66767347237993, 
    2.66767347237993, 2.66767347237993, 2.66767347237993), mean_rand = c(-0.964668158001907, 
    -0.964668158001907, -0.964668158001907, -0.964668158001907
    ), sim_n = c(67L, 67L, 67L, 67L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.99260910093906, shape2 = 4.5447108260169, stretch = 1.02636593843289, 
    x_min = 0.207515679169991, x_max = 1.99129055149727, maxima = 1.33655194268188, 
    rep = 67L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
