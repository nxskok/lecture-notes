# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint

# Set target options:
tar_option_set(
  packages = c("tidyverse"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multicore")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Run the R scripts in the R/ folder with your custom functions:
# tar_source()
# source("other_functions.R") # Source other scripts as needed. # nolint

# Replace the target list below with your own:
list(
  tar_quarto(index, "index.qmd"),
  tar_quarto(alternative_c33, "alternative_c33.qmd"),
  tar_quarto(assumptions_c33, "assumptions_c33.qmd"),
  tar_quarto(ancova, "ancova.qmd"),
  tar_quarto(anova, "anova.qmd"),
  tar_quarto(asphalt, "asphalt.qmd"),
  tar_quarto(bootstrap, "bootstrap.qmd"),
  tar_quarto(bootstrap_c33, "bootstrap_c33.qmd"),
  tar_quarto(bootstrap_R, "bootstrap_R.qmd"),
  tar_quarto(choosing, "choosing.qmd"),
  tar_quarto(cluster, "cluster.qmd"),
  tar_quarto(dates_and_times, "dates_and_times.qmd"),
  tar_quarto(dip, "dip.qmd"),
  tar_quarto(discrim, "discrim.qmd"),
  tar_quarto(factor, "factor.qmd"),
  tar_quarto(functions, "functions.qmd"),
  tar_quarto(graphs_c32, "graphs_c32.qmd"),
  tar_quarto(graphs_c33, "graphs_c33.qmd"),
  tar_quarto(inference_1, "inference_1.qmd"),
  tar_quarto(inference_2, "inference_2.qmd"),
  tar_quarto(inference_3, "inference_3.qmd"),
  tar_quarto(inference_4b, "inference_4b.qmd"),
  tar_quarto(inference_5a, "inference_5a.qmd"),
  tar_quarto(inference_5b, "inference_5b.qmd"),
  tar_quarto(inference_c33, "inference_c33.qmd"),
  tar_quarto(logistic, "logistic.qmd"),
  tar_quarto(manova, "manova.qmd"),
  tar_quarto(multiway, "multiway.qmd"),
  tar_quarto(numsum, "numsum.qmd"),
  tar_quarto(outline_c32, "outline_c32.qmd"),
  tar_quarto(outline_c33, "outline_c33.qmd"),
  tar_quarto(outline_d29, "outline_d29.qmd"),
  tar_quarto(power_c33, "power_c33.qmd"),
  tar_quarto(princomp, "princomp.qmd"),
  tar_quarto(profile, "profile.qmd"),
  tar_quarto(readfile, "readfile.qmd"),
  tar_quarto(regression, "regression.qmd"),
  tar_quarto(reports, "reports.qmd"),
  tar_quarto(rstan, "rstan.qmd"),
  tar_quarto(running, "running.qmd"),
  tar_quarto(survival, "survival.qmd"),
  tar_quarto(tidying, "tidying.qmd"),
  tar_quarto(tidy_extra, "tidy_extra.qmd"),
  tar_quarto(vector_matrix, "vector_matrix.qmd"),
  tar_quarto(wider_wrong, "wider_wrong.qmd"),
  tar_quarto(windmill, "windmill.qmd"),
  tar_quarto(with_categ, "with_categ.qmd")
)
