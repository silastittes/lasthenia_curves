run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.000860473046825055, 0.0415607757376252, 
0.00746313612979603, -0.00966477157303709), p_value = c(0.0502046106538343, 
0.00558462937373103, 0.230533734637896, 0.0519427957413732), 
    rand_var = c(3.61044650703335, 3.61044650703335, 3.61044650703335, 
    3.61044650703335), mean_rand = c(-1.16065676943421, -1.16065676943421, 
    -1.16065676943421, -1.16065676943421), sim_n = c(90L, 90L, 
    90L, 90L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.0383266315603573, 0.423076284351735, 
-0.0628435369728582, -0.203998477621121), prop = c(0.0425, 0.2925, 
0.0125, 0.0375), rand_var = c(3.61044650703335, 3.61044650703335, 
3.61044650703335, 3.61044650703335), mean_rand = c(-1.16065676943421, 
-1.16065676943421, -1.16065676943421, -1.16065676943421), sim_n = c(90L, 
90L, 90L, 90L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.59058967673508, 
    shape2 = 5.00212302707079, stretch = 1.26014735095691, x_min = -0.713758818624424, 
    x_max = 1.99481445812951, maxima = 0.876005463883222, rep = 90L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
