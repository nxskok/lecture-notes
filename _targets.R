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
  tar_quarto(ancova, "ancova.qmd"),
  tar_quarto(anova, "anova.qmd"),
  tar_quarto(asphalt, "asphalt.qmd"),
  tar_target(bCluster, "bCluster.Rmd", format = "file"),
  tar_render(bCluster_slides, "bCluster_slides.Rmd"),
  tar_target(bootstrap_R, "bootstrap_R.Rmd", format = "file"),
  tar_render(bootstrap_R_slides, "bootstrap_R_slides.Rmd"),
  tar_target(bootstrap, "bootstrap.Rmd", format = "file"),
  tar_render(bootstrap_slides, "bootstrap_slides.Rmd"),
  tar_target(bRegression, "bRegression.Rmd", format = "file"),
  tar_render(bRegression_slides, "bRegression_slides.Rmd"),
  tar_quarto(choosing, "choosing.qmd"),
  tar_quarto(dates_and_times, "dates_and_times.qmd"),
  tar_quarto(dip, "dip.qmd"),
  tar_quarto(discrim, "discrim.qmd"),
  tar_quarto(factor, "factor.qmd"),
  tar_quarto(functions, "functions.qmd"),
  tar_quarto(graphs, "graphs.qmd"),
  tar_target(inference_1_R, "inference_1_R.Rmd", format = "file"),
  tar_render(inference_1_R_slides, "inference_1_R_slides.Rmd"),
  tar_quarto(inference_2, "inference_2.qmd"),
  tar_quarto(inference_3, "inference_3.qmd"),
  tar_quarto(inference_4a, "inference_4a.qmd"),
  tar_quarto(inference_4b, "inference_4b.qmd"),
  tar_quarto(inference_5a, "inference_5a.qmd"),
  tar_quarto(inference_5b, "inference_5b.qmd"),
  tar_quarto(logistic, "logistic.qmd"),
  tar_quarto(manova, "manova.qmd"),
  tar_quarto(mapping, "mapping.qmd"),
  tar_quarto(multiway, "multiway.qmd"),
  tar_quarto(numsum, "numsum.qmd"),
  tar_quarto(outline_c32, "outline_c32.qmd"),
  tar_quarto(outline_c33, "outline_c33.qmd"),
  tar_quarto(outline_d29, "outline_d29.qmd"),
  tar_quarto(princomp, "princomp.qmd"),
  tar_quarto(profile, "profile.qmd"),
tar_target(readfile_R, "readfile_R.Rmd", format = "file"),
tar_render(readfile_R_slides, "readfile_R_slides.Rmd"),
tar_target(reports_R, "reports_R.Rmd", format = "file"),
tar_render(reports_R_slides, "reports_R_slides.Rmd"),
tar_target(rstan, "rstan.Rmd", format = "file"),
tar_render(rstan_slides, "rstan_slides.Rmd"),
tar_target(running_R, "running_R.Rmd", format = "file"),
tar_render(running_R_slides, "running_R_slides.Rmd"),
tar_quarto(survival, "survival.qmd"),
tar_quarto(tidying, "tidying.qmd"),
tar_target(tidy_extra_R, "tidy_extra_R.Rmd", format = "file"),
tar_render(tidy_extra_R_slides, "tidy_extra_R_slides.Rmd"),
tar_quarto(wider_wrong, "wider_wrong.qmd"),
tar_quarto(windmill, "windmill.qmd"),
tar_quarto(with_categ, "with_categ.qmd")
)
