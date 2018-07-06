run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.133273965814173, 0.0543217557538244, 
0.00572218818363625, -0.056420204428991), p_value = c(0.0120488650076084, 
0.00875896598566933, 0.0571089224008445, 0.0152525931604), rand_var = c(0.648790521887529, 
0.648790521887529, 0.648790521887529, 0.648790521887529), mean_rand = c(0.477767056695526, 
0.477767056695526, 0.477767056695526, 0.477767056695526), sim_n = c(17L, 
17L, 17L, 17L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.828654854298397, 0.0194969021983884, 
-0.210507879636894, -0.51943088923871), prop = c(0.215, 0.0425, 
0.0375, 0.0075), rand_var = c(0.648790521887529, 0.648790521887529, 
0.648790521887529, 0.648790521887529), mean_rand = c(0.477767056695526, 
0.477767056695526, 0.477767056695526, 0.477767056695526), sim_n = c(17L, 
17L, 17L, 17L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 3.82396882497374, 
    shape2 = 2.56208272589954, stretch = 1.16311444049993, x_min = -0.830096446672567, 
    x_max = 4.6181467680071, maxima = 3.16134712468245, rep = 17L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
