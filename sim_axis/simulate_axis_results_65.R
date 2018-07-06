run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0633493389146919, 0.0373063296665607, 
-0.0530551814024197, -0.0282514239041837), p_value = c(0.15621783711733, 
0.00226095963269408, 0.138504366409641, 0.015627867041132), rand_var = c(2.58648852371873, 
2.58648852371873, 2.58648852371873, 2.58648852371873), mean_rand = c(-0.265758318354183, 
-0.265758318354183, -0.265758318354183, -0.265758318354183), 
    sim_n = c(65L, 65L, 65L, 65L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.324216022183134, 
    0.196466809904611, 0.203989892268315, 0.0655693294494724), 
    prop = c(0.05, 0.1975, 0.0975, 0.0375), rand_var = c(2.58648852371873, 
    2.58648852371873, 2.58648852371873, 2.58648852371873), mean_rand = c(-0.265758318354183, 
    -0.265758318354183, -0.265758318354183, -0.265758318354183
    ), sim_n = c(65L, 65L, 65L, 65L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 4.23812226041885, shape2 = 3.01538127196449, stretch = 3.66399279041343, 
    x_min = -0.662622842574646, x_max = 3.84851090582025, maxima = 2.71155649388847, 
    rep = 65L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
