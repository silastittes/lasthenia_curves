run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.028206327518436, 0.0530196370332709, 
0.00571259786882536, -0.0147316889184041), p_value = c(0.0489899662302344, 
0.00426504824986906, 0.265507820261334, 0.155761812674279), rand_var = c(2.1836698127325, 
2.1836698127325, 2.1836698127325, 2.1836698127325), mean_rand = c(-0.213798776270943, 
-0.213798776270943, -0.213798776270943, -0.213798776270943), 
    sim_n = c(55L, 55L, 55L, 55L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(-0.0794136355939063, 
    0.124287201922338, -0.0204259816454205, -0.0912901795245112
    ), prop = c(0.01, 0.1475, 0.04, 0.0125), rand_var = c(2.1836698127325, 
    2.1836698127325, 2.1836698127325, 2.1836698127325), mean_rand = c(-0.213798776270943, 
    -0.213798776270943, -0.213798776270943, -0.213798776270943
    ), sim_n = c(55L, 55L, 55L, 55L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.36458085963779, shape2 = 4.1306990926554, stretch = 1.13866895348708, 
    x_min = -1.02945787758081, x_max = 5.91301768309003, maxima = 3.07178890012504, 
    rep = 55L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
