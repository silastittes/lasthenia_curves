run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.127125739833097, 0.0599746919957455, 
-0.0809008757092518, -0.0243638687676029), p_value = c(0.0662072900852421, 
0.01385180140946, 0.118840320088708, 0.0808815110488029), rand_var = c(2.38709684901815, 
2.38709684901815, 2.38709684901815, 2.38709684901815), mean_rand = c(0.908571311241778, 
0.908571311241778, 0.908571311241778, 0.908571311241778), sim_n = c(60L, 
60L, 60L, 60L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.128280951938147, 0.0609049057245203, 
-0.215478603235715, -0.0197058859752476), prop = c(0.06, 0.095, 
0.0125, 0.04), rand_var = c(2.38709684901815, 2.38709684901815, 
2.38709684901815, 2.38709684901815), mean_rand = c(0.908571311241778, 
0.908571311241778, 0.908571311241778, 0.908571311241778), sim_n = c(60L, 
60L, 60L, 60L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 4.11998085649701, 
    shape2 = 2.57033706568582, stretch = 1.36543634369412, x_min = -1.26874557839969, 
    x_max = 4.57562552643375, maxima = 3.19316605011262, rep = 60L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
