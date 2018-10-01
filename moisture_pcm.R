##LOAD FILES---------
source("load_data.R")

select <- dplyr::select
rename <- dplyr::rename

#nothing missing in either direction
tree_miss <- as.character(unique(emery$species))[!as.character(unique(emery$species)) %in% unique(grad$species)]
unique(grad$species)[!unique(grad$species) %in% as.character(unique(emery$species))]

col_match <- match(grad$species, as.character(unique(emery$species)))
col_match <- col_match[!is.na(col_match)]

wide_params <- gen_gradient_df(tolerance_df = draws)

draw_n <- 1:ndraws




##LASSO CLASSIFICATION BY HABITAT---------
lasso_all <- wide_params %>% 
  filter(draw %in% draw_n) %>%
  group_by(draw) %>%
  do({
    test_df <- . 
    test_df <- test_df %>%
      select(aqua_terr2terr_bin, stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
      drop_na()
      
    test_modmat <- model.matrix(aqua_terr2terr_bin ~ . -1, data = test_df)
      
    cv_coef <- cv.glmnet(test_modmat, 
                         test_df$aqua_terr2terr_bin,
                         family = "binomial", 
                         nfolds = nrow(test_modmat),
                         grouped = F
                         #lambda = exp(seq(log(0.01), log(10), length.out=100))
                         ) %>%
      coef(s = "lambda.min") %>% 
      as.matrix %>% 
      t %>% 
      as_tibble
  })


# perms <- 100
# lasso_permute <- wide_params %>% 
#   filter(draw %in% draw_n) %>%
#   #filter(species != "glaberrima") %>%
#   group_by(draw) %>%
#   do({
#     test_df <- . 
#     test_df %>% as.data.frame %>% set_rownames(.$species)
#     test_modmat <- test_df %>% select(contains("_sc")) %>%
#       select(stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
#       model.matrix(test_df$aqua_terr2terr_bin ~ . -1, data = .)
#     
#     1:perms %>% map_df(~{
#     cv_coef <- cv.glmnet(test_modmat, 
#                          sample(test_df$aqua_terr2terr_bin,replace = F),
#                          family = "binomial", 
#                          nfolds = nrow(test_modmat),
#                          grouped = F, 
#                          lambda = exp(seq(log(0.01), log(10), length.out=100))
#                          
# 
#     ) %>%
#       coef(s = "lambda.min") %>% 
#       as.matrix %>% 
#       t %>% 
#       as_tibble %>%
#       mutate(perm  = .x)
#     })
#   })


#wide_params %>% filter(draw == 1) %>% select(stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>% cov

#proprortion of draws where all feature coefficients are zero

count_empty <- function(df){
  df %>%
    ungroup() %>%
    select(stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
    rowSums() %>%
    (function(x) mean(x == 0))
  
}


summ_lasso <- function(df){
  df %>% 
    ungroup %>%
    select( stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
    summarise_all(
      funs(
        mean = mean(., na.rm = T),
        prop = mean(. > 0 & . !=0, na.rm = T),
        prop = mean(. > 0, na.rm = T),
        zero_eq = mean(. == 0, na.rm = T)
        
        # sign_bias = ifelse( mean(. > 0) / mean(. < 0) < 1,
        #                     1 / (mean(. > 0) / mean(. < 0)) ,
        #                     mean(. > 0) / mean(. < 0) )
        
      )
    ) %>% 
    gather(variable, value) %>%
    separate(variable, c("var", "stat"), sep = "_sc\\_") %>%
    spread(var, value) %>% 
    set_colnames(c(" ", "$optima$", "$stretch$", "$x_{max}$", "$x_{min}$")) %>%
    mutate(" " = c("coefficient mean", "prop. draws $>$ 0", "proportion of draws $=$ 0")) 
}


count_empty(lasso_all)

summ_lasso(lasso_all) %>%
  xtable(caption = "something here", digits = 3) %>% 
  print.xtable(include.rownames=FALSE, file = "derived_files/lasso.tex")


### lasso for depth ----------------

lasso_depth <- wide_params %>% 
  filter(draw %in% draw_n) %>%
  group_by(draw) %>%
  do({
    test_df <- . 
    test_df <- test_df %>%
      select(Mean, stretch_sc, maxima_sc, x_max_sc, x_min_sc) %>%
      drop_na()
    test_modmat <- model.matrix(Mean ~ . -1, data = test_df)
    
    cv_coef <- cv.glmnet(test_modmat, 
                         test_df$Mean,
                         nfolds = nrow(test_modmat),
                         grouped = F
    ) %>%
      coef(s = "lambda.min") %>% 
      as.matrix %>% 
      t %>% 
      as_tibble
  })


count_empty(lasso_depth)

summ_lasso(lasso_depth) %>%
  xtable(caption = "something here", digits = 3) %>%
  print.xtable(include.rownames=FALSE, file = "derived_files/lasso_depth.tex")



### Phylogenetic Independent Contrasts---------

pic_cor <- function(var1, var2){
  wide_params %>% 
    group_by(draw) %>%
    do({
      temp_df <- .
      trees_post %>% map_df(~{
        
        lasth_pic <- .x

        pic_cor <- cor(
          pic(temp_df[[var1]], lasth_pic),
          pic(temp_df[[var2]], lasth_pic), 
          method = "pearson"
        ) %>% as_tibble %>%
          rename(pic_cor = value)
        
        cor_cor <- cor(
          temp_df[[var1]],
          temp_df[[var2]], 
          method = "pearson"
        ) %>% as_tibble %>%
          rename(cor_cor = value)
        
        bind_cols(pic_cor, cor_cor)
      })
    })
} 
  
cor_c_e <- pic_cor("stretch", "x_max")

cor_c_e %>% 
  gather(corr_type, corr, -draw) %>%
  group_by(corr_type) %>%
  summarise(mean(corr),
            mean(corr > 0))

par(mfrow = c(1,2))
hist(cor_c_e$cor_cor, breaks = 500)
hist(cor_c_e$pic_cor, breaks = 500)





### simple model of depth and floral biomass -----------------

mean_inflor <- 
  emery %>%
  group_by(species) %>%
  summarise(mean_inflor = mean(Inflor_biomass))

mean_df <- 
  wide_params %>%
  group_by(species) %>%
  summarise(mean_depth = mean(Mean),
            mean_stretch = mean(stretch)) %>%
  full_join(., mean_inflor, by = "species")


cor.test(emery$Veg_biomass, emery$Inflor_biomass, method = "spearman")
cor.test(mean_df$mean_depth, mean_df$mean_inflor)
cor.test(mean_df$mean_stretch, mean_df$mean_inflor)

cairo_pdf("figures/B16.pdf")
mean_df %>%
  ggplot(aes(mean_inflor, mean_depth)) +
  geom_point() +
  geom_smooth(method = "lm") +
  xlab("Mean reproductive biomass") +
  ylab("Mean pool depth")
dev.off()

lm(mean_depth ~ mean_inflor, data = mean_df) %>%
  summary()


cairo_pdf("~/Desktop/stretch_pool.pdf")
mean_df %>%
  ggplot(aes(mean_depth, mean_stretch)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = F) +
  ylab("Mean Stretch") +
  xlab("Mean pool depth") +
  theme_classic(base_size = 20)
dev.off()



##POOL DEPTH REGRESSION---------
draw_n500 <- sample(1:ndraws, 500, replace = F)

mv_plgs <- wide_params %>% 
  filter(draw %in% draw_n500) %>%
  group_by(draw) %>%
  do({
    temp_df <- .
    #temp_df <- wide_params %>% filter(draw == 1)
    trees_post %>% map_df(~{
      #.x <- trees_post[[1]]
      0:1 %>% map_df(function(x){
        #x <- 0      
        mv_pgls_tree <- drop.tip(.x, tree_miss)
        
        mod_full <- temp_df %>%
          filter(species %in% grad$species) %>% 
          as.data.frame %>%
          set_rownames(.$species) %>%
          gls(Mean ~ stretch_sc + x_min_sc + x_max_sc +  maxima_sc, #keep maxima_sc? 
              data = .,
              correlation = corPagel(x, phy = mv_pgls_tree, fixed = T),
              method = "ML"
          )
        
        mod_intercept <- temp_df %>%
          filter(species %in% grad$species) %>% 
          as.data.frame %>%
          set_rownames(.$species) %>%
          gls(Mean ~ 1, 
              data = .,
              correlation = corPagel(x, phy = mv_pgls_tree, fixed = T),
              method = "ML"
          )
        
        aic_f <- AIC(mod_full)        
        aic_i <- AIC(mod_intercept)
        names(aic_f) <- "AIC_full"
        names(aic_i) <- "AIC_intercept"
        intercept <- coef(mod_intercept)
        pvals <- summary(mod_full)$tTable[,4]
        names(pvals) <- paste0(names(pvals), "_pvals")
        names(intercept) <- "intercept_1"
        c(coef(mod_full), pvals, intercept, aic_f, aic_i) %>% 
          rbind %>% 
          cbind(., x) %>% 
          as_tibble %>% 
          rename(pagel_lambda = x)
      })
    })
  })


mv_plgs %>%
  group_by(pagel_lambda) %>%
  summarise(mean(AIC_full < AIC_intercept))


mv_plgs_long <- mv_plgs %>% ungroup %>% 
  gather(
    param, slopes, 
    `(Intercept)`, stretch_sc, x_min_sc, x_max_sc, maxima_sc
  ) %>% 
  gather(params, pvals,
         `(Intercept)_pvals`,
         stretch_sc_pvals,
         x_min_sc_pvals,
         x_max_sc_pvals,
         maxima_sc_pvals
  )

mv_plgs_long %>% 
  group_by(pagel_lambda, params) %>%
  summarise(q_25 = quantile(pvals, 0.25) %>% round(2),
            q_50 = quantile(pvals, 0.5) %>% round(2),
            q_75 = quantile(pvals, 0.75) %>% round(2),
            harmonic_mean = round(1/mean(1/pvals), 4)) %>%
  arrange(params)

mv_plgs_long %>% 
  group_by(pagel_lambda, params) %>%
  summarise(hpdi_low = HPDI(pvals, 0.95)  %>% .[1] %>% round(2),
            q_50 = quantile(pvals, 0.5) %>% round(2),
            hpdi_high = HPDI(pvals, 0.95)  %>% .[2] %>% round(2))

pval_hm <- mv_plgs_long %>% 
  group_by(pagel_lambda, params) %>%
  summarise(harmonic_mean = round(1/mean(1/pvals), 5)) %>%
  arrange(params) %>%
  ungroup()


mv_plgs_long %>% 
  mutate(
    params = str_replace_all(params, 
                             c("^stretch_sc_pvals$" = "stretch", 
                               "\\(Intercept\\)_pvals" = "Intercept",
                               "^maxima_sc_pvals$" = "optima",
                               "^x_min_sc_pvals$" = "x_min", 
                               "^x_max_sc_pvals$" = "x_max")
    ),
    pagel_lambda = str_replace_all(pagel_lambda, 
                                   c("0" = "λ = 0",
                                     "1" = "λ = 1"))
  ) %>%
  ggplot(aes(x = pvals)) +
  facet_grid(params ~ pagel_lambda, scales = "free_y") +
  geom_histogram() +
  theme_minimal()


options(xtable.sanitize.colnames.function=identity,
        xtable.sanitize.rownames.function=identity)

mv_plgs_long %>% 
  group_by(param, pagel_lambda) %>%
  summarise(
    means = mean(slopes),
    prob_zero = mean(slopes > 0)) %>%
  ungroup() %>%
  mutate(
    pagel_lambda = as.integer(pagel_lambda),
    pval_hm = pval_hm$harmonic_mean
  ) %>%
  set_colnames(c(
    "parameter", 
    "Pagel's $\\lambda$", 
    "coefficient mean",
    "proportion of draws $>$ 0", 
    "harmonic mean of p values")
  ) %>%
  as.data.frame %>% 
  filter(parameter != "(Intercept)") %>%
  set_rownames(c("$optima $", "$optima$",
                 "$stretch $", "$stretch$", 
                 "$x_{max} $", "$x_{max}$",
                 "$x_{min} $", "$x_{min}$"
  )) %>%
  select(-parameter) %>%
  xtable(caption = "something here", digits = 4) %>% 
  print.xtable(file = "derived_files/pgls.tex")


#how do aic values and predictions compare for full models, but alternate pagel lambdas?
pg_0 <- mv_plgs_long %>% 
  filter(pagel_lambda == 0)

pg_1 <- mv_plgs_long %>% 
  filter(pagel_lambda == 1)

c("AIC_full", "AIC_intercept", "slopes")   %>%
  map(~ mean(pg_0[[.x]] < pg_1[[.x]]))

mean(pg_0$AIC_full < pg_1$AIC_full)
mean(pg_0$slopes > pg_1$slopes)


layout(
  mat = matrix(c(1,2,3,4), byrow = F, nrow = 2)
)

rdraw <- 155
rtree_int <- 24
for(i in 0:1){
  temp_df <- wide_params %>% 
    filter(draw == rdraw)
  
  mv_pgls_tree <- drop.tip(trees_post[[rtree_int]], tree_miss)
  
  mod_full <- temp_df %>%
    filter(species %in% grad$species) %>% 
    as.data.frame %>%
    set_rownames(.$species) %>%
    gls(Mean ~ stretch_sc + x_min_sc + x_max_sc +  maxima_sc, #keep maxima_sc? 
        data = .,
        correlation = corPagel(i, phy = mv_pgls_tree, fixed = T),
        method = "ML"
    )
  print(summary(mod_full))
  
  st_resid <- mod_full$residuals/attr(mod_full$residuals, "std")[1]
  plot(
    mod_full$fitted,
    st_resid,
    main = paste("λ = ", i),
    xlab = "fitted values",
    ylab = ifelse(i == 0, "standardized residuals", "" )
  )
  
  lines(
    loess.smooth(
      mod_full$fitted,
      st_resid
    )
  )
  abline(h = 0, lty = 2)
  qqnorm(
    st_resid, 
    main = "",
    ylab = ifelse(i == 0, "Sample Quantiles", "" )
  )
  abline(0,1, lty = 2)
}

