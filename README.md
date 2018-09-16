Data and code for "Grow where you thrive, or where only you can survive? An analysis of performance curve evolution in a clade with diverse habitat affinities".

Please note, there is now a separate [repository](https://github.com/silastittes/lasthenia_docker) and [Docker container](https://hub.docker.com/r/silastittes/lasthenia_docker/) to facilitate reproducing these analyses. Those interested in reproducing analyses of the paper are highly encourage to follow the README for the container (readme is the same for both pages linked above). 

The manuscript is currently in review. Below are some details about how this repository is organized for those interested in reproducing analyses reported in the paper.

Firstly, readers are encouraged to peruse the performr package's [vignette page](https://silastittes.github.io/performr/), which contains helpful details about installation and usage.

As described in the vignette, if you are not using a computer with Linux, be sure to install the `performr` package with:

    devtools::install_github("silastittes/performr", local = FALSE)


I have attempted to write code to install missing packages, but inevitably, users that want to reproduce ALL analyses will need to spend some time getting all the dependencies working on their machines (hence, the containerized version above). Fortunately, R and GNU make do a pretty good job of raising errors readable errors.

Details about files and subdirectories in this repository are as follows:

Files
=====


Makefile
--------

The makefile will run the majority of the analyses reported in the paper, which should take somewhere around 20 - 40 minutes to complete. In the terminal, write:

    #change the date on files to trigger make to run
    touch */*
    #run make
    make


If you are familiar with GNU make, reading the `Makefile` will likely be a helpful guide for what is needed to reproduce the data.


tolerance_functions.R and load_data.R
----------------------

Helper scripts that contain functions and function calls NOT in the `performr` package.


moisture_pcm.R
--------------

Code for regressions and correlations of tolerance curve parameters and habitat.


randeffect_block.R
-------------------

A secondary analysis to defend our not using block in the model.


Directories
=============

bayes/
-----

Files related to fitting the model, model validation with simulated data, and computing Bayesian p-values. The posterior draws (and other model outputs) are also written to file and contained within the `samples/` subdirectory. Hopefully the names are clear as to what they contain. Please ask me if not.


data/
------

Just like it sounds! All the data needed to run the analyses are here -- plus a few things we did not end up using.


derived_files/
------------

Various files output by analyses.

figures/
--------

Also just like it sounds! Figures are ignored to save space, so running make is essential if you want to look at. The `tolerance_v3_plotting.Rmd` contains code to generate almost all the figures. I used Rmd to help keep the code organized, the html output is very boring. Some last minute changes to figure names were made, so these do not match the paper at the moment, unfortunately.

phylo_sig/
--------

Code to run phylogenetic signal analyses. 

sim_axis/
--------

In the paper, we simulated random spacing in the environmental access to see what effect it would have on our inferences. This required running the core model 100 times. This takes a few days to run, so was not included in the make file, but it quite easy to run. Lines 204 onward can be used with the 100 existing files.


That pretty much does it. Please let me know if anything fails, or if you have general questions about what was done.
