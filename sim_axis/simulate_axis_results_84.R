run_x <-
structure(list(lm_df = structure(list(term = c("maxima_sc", "stretch_sc", 
"x_max_sc", "x_min_sc"), coef = c(0.0969624903356681, 0.0310548494557328, 
-0.0743474468612592, -0.0446550902795745), p_value = c(0.0450811780359205, 
0.00836446370170093, 0.0556160024977681, 0.0149881201770061), 
    rand_var = c(3.35222154906228, 3.35222154906228, 3.35222154906228, 
    3.35222154906228), mean_rand = c(0.359570778642323, 0.359570778642323, 
    0.359570778642323, 0.359570778642323), sim_n = c(84L, 84L, 
    84L, 84L)), .Names = c("term", "coef", "p_value", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), lasso_df = structure(list(var = c("maxima", 
"stretch", "x_max", "x_min"), mean = c(0.772423710484424, 0.111591479760155, 
0.310907078367116, -0.315024464294224), prop = c(0.1375, 0.17, 
0.015, 0.005), rand_var = c(3.35222154906228, 3.35222154906228, 
3.35222154906228, 3.35222154906228), mean_rand = c(0.359570778642323, 
0.359570778642323, 0.359570778642323, 0.359570778642323), sim_n = c(84L, 
84L, 84L, 84L)), .Names = c("var", "mean", "prop", "rand_var", 
"mean_rand", "sim_n"), class = c("tbl_df", "tbl", "data.frame"
), row.names = c(NA, -4L)), summ_stan_df = structure(list(shape1 = 5.40723636411317, 
    shape2 = 2.64763837897089, stretch = 4.99686604929931, x_min = -1.47877986695504, 
    x_max = 4.35701599684419, maxima = 3.30128259182258, rep = 84L), .Names = c("shape1", 
"shape2", "stretch", "x_min", "x_max", "maxima", "rep"), class = c("tbl_df", 
"tbl", "data.frame"), row.names = c(NA, -1L))), .Names = c("lm_df", 
"lasso_df", "summ_stan_df"))
