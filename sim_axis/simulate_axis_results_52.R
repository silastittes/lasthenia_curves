run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0484903128481354, 0.0473222290313117, 
-0.0572463200230847, -0.0738729084214771), p_value = c(0.191312269413367, 
0.0124427666759552, 0.195355779512882, 0.0437587742585173), rand_var = c(2.06228174343822, 
2.06228174343822, 2.06228174343822, 2.06228174343822), mean_rand = c(-0.809219968998975, 
-0.809219968998975, -0.809219968998975, -0.809219968998975), 
    sim_n = c(52L, 52L, 52L, 52L)), .Names = c("term", "coef", 
"p_value", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), lasso_df = structure(list(
    var = c("maxima", "stretch", "x_max", "x_min"), mean = c(0.00973528199036926, 
    0.0992971530324777, -0.196241386998494, -0.166334736499647
    ), prop = c(0.075, 0.1575, 0.0375, 0.005), rand_var = c(2.06228174343822, 
    2.06228174343822, 2.06228174343822, 2.06228174343822), mean_rand = c(-0.809219968998975, 
    -0.809219968998975, -0.809219968998975, -0.809219968998975
    ), sim_n = c(52L, 52L, 52L, 52L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 4.79371738708005, shape2 = 3.31661988512558, stretch = 1.52387227556673, 
    x_min = -0.139991011767832, x_max = 2.19867341179302, maxima = 1.55623331880165, 
    rep = 52L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
