run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0403351124601189, 0.0619745082461727, 
-0.00881226383489066, -0.0119106307511933), p_value = c(0.0554814732926356, 
0.0135664708741284, 0.294787580409779, 0.159898669653061), rand_var = c(1.5774167720474, 
1.5774167720474, 1.5774167720474, 1.5774167720474), mean_rand = c(0.624250625075715, 
0.624250625075715, 0.624250625075715, 0.624250625075715), sim_n = c(40L, 
40L, 40L, 40L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.0806673960430666, 0.0584589636752736, 
-0.0405206245079179, -0.0723462304385789), prop = c(0.045, 0.075, 
0.005, 0.02), rand_var = c(1.5774167720474, 1.5774167720474, 
1.5774167720474, 1.5774167720474), mean_rand = c(0.624250625075715, 
0.624250625075715, 0.624250625075715, 0.624250625075715), sim_n = c(40L, 
40L, 40L, 40L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.39178650778184, 
    shape2 = 2.85768147349398, stretch = 1.07270242162206, x_min = -0.773912102187962, 
    x_max = 4.94414823748048, maxima = 3.14738797762781, rep = 40L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
