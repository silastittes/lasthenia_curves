run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.000163271236346728, 0.0507194294447945, 
-0.040464862133778, -0.0161924599035244), p_value = c(0.302629510243731, 
0.0093167567151048, 0.229959361432307, 0.308976421909563), rand_var = c(3.27043036823035, 
3.27043036823035, 3.27043036823035, 3.27043036823035), mean_rand = c(-1.1051932063129, 
-1.1051932063129, -1.1051932063129, -1.1051932063129), sim_n = c(82L, 
82L, 82L, 82L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.193925167438198, 0.328685981565535, 
-0.33832342537948, -0.0131326469717232), prop = c(0.055, 0.25, 
0.0075, 0.0925), rand_var = c(3.27043036823035, 3.27043036823035, 
3.27043036823035, 3.27043036823035), mean_rand = c(-1.1051932063129, 
-1.1051932063129, -1.1051932063129, -1.1051932063129), sim_n = c(82L, 
82L, 82L, 82L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.83112012973386, 
    shape2 = 4.72959690307581, stretch = 0.828631827743308, x_min = 0.0384578484520714, 
    x_max = 2.08823356847553, maxima = 1.28807659478598, rep = 82L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
