SAMPLES = bayes/samples/performance.samples_*.csv

all: 	figures/fig1.pdf \
			derived_files/lasth_100_post.R \
			$(SAMPLES) \
			figures/figB12.pdf \
			figures/fig2.pdf \
			derived_files/curve_K.csv \
			figures/fig3.pdf \
			derived_files/pgls.tex \
			figures/validate_2.pdf

	
#make concept plot
figures/fig1.pdf: figures/reactionNorm_conceptPlots2.R
	Rscript figures/reactionNorm_conceptPlots2.R

#run stan, and tidy files for downstream analysis and plotting
$(SAMPLES): bayes/fit_with_performr.R tolerance_functions.R
	Rscript bayes/fit_with_performr.R
	
			 

#posterior predictive checks plot and pvalue
figures/figB12.pdf: bayes/postpred.R $(SAMPLES)
	Rscript bayes/postpred.R


#create 100 pruned, ultrametric posterior trees
derived_files/lasth_100_post.R: phylo_sig/generate_post_trees.R data/C1.trees
	Rscript phylo_sig/generate_post_trees.R


#phylogenetic signal for curves and parameters
derived_files/curve_K.csv: phylo_sig/phylo_signal.R $(SAMPLES) bayes/tidy_curves.csv  bayes/tidy_parameters.csv
	Rscript phylo_sig/phylo_signal.R

figures/fig3.pdf: $(SAMPLES) derived_files/curve_K.csv figures/tolerance_v3_plotting.Rmd tolerance_functions.R
	Rscript -e "rmarkdown::render('figures/tolerance_v3_plotting.Rmd')"

derived_files/pgls.tex: moisture_pcm.R $(SAMPLES)
	        Rscript moisture_pcm.R

figures/validate_2.pdf: tolerance_functions.R bayes/simulate_tolerance_scnorm.R
	Rscript bayes/simulate_tolerance_scnorm.R

