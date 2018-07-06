run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(-0.0415409384672291, 0.0595574142944227, 
0.0311571935434138, -0.0263768168455692), p_value = c(0.121705661663103, 
0.00284606336687938, 0.0891204342509283, 0.0933744290121181), 
    rand_var = c(0.971776741917159, 0.971776741917159, 0.971776741917159, 
    0.971776741917159), mean_rand = c(-0.248865838738622, -0.248865838738622, 
    -0.248865838738622, -0.248865838738622), sim_n = c(25L, 25L, 
    25L, 25L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.0142218041572879, 0.105163394411813, 
-0.0384941268612358, -0.0501067287485345), prop = c(0.045, 0.1575, 
0.035, 0.0125), rand_var = c(0.971776741917159, 0.971776741917159, 
0.971776741917159, 0.971776741917159), mean_rand = c(-0.248865838738622, 
-0.248865838738622, -0.248865838738622, -0.248865838738622), 
    sim_n = c(25L, 25L, 25L, 25L)), .Names = c("var", "mean", 
"prop", "rand_var", "mean_rand", "sim_n"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -4L)), summ_stan_df = structure(list(
    shape1 = 3.64136881056143, shape2 = 3.45066363623829, stretch = 1.63493287990629, 
    x_min = -0.627206244757221, x_max = 4.67185296048211, maxima = 2.9228533626367, 
    rep = 25L), .Names = c("shape1", "shape2", "stretch", "x_min", 
"x_max", "maxima", "rep"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -1L))), .Names = c("lm_df", "lasso_df", 
"summ_stan_df"))
