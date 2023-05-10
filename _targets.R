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
  tar_quarto(asphalt, "asphalt.qmd"),
  tar_target(bAnova, "bAnova.Rmd", format = "file"),
  tar_render(bAnova_slides, "bAnova_slides.Rmd"),
  tar_target(bAncova, "bAncova.Rmd", format = "file"),
  tar_render(bAncova_slides, "bAncova_slides.Rmd"),
  tar_target(bCluster, "bCluster.Rmd", format = "file"),
  tar_render(bCluster_slides, "bCluster_slides.Rmd"),
  tar_target(bFactor, "bFactor.Rmd", format = "file"),
  tar_render(bFactor_slides, "bFactor_slides.Rmd"),
  tar_target(bManova, "bManova.Rmd", format = "file"),
  tar_render(bManova_slides, "bManova_slides.Rmd"),
  tar_target(bootstrap_R, "bootstrap_R.Rmd", format = "file"),
  tar_render(bootstrap_R_slides, "bootstrap_R_slides.Rmd"),
  tar_target(bootstrap, "bootstrap.Rmd", format = "file"),
  tar_render(bootstrap_slides, "bootstrap_slides.Rmd"),
  tar_target(bProfile, "bProfile.Rmd", format = "file"),
  tar_render(bProfile_slides, "bProfile_slides.Rmd"),
  tar_target(bRegression, "bRegression.Rmd", format = "file"),
  tar_render(bRegression_slides, "bRegression_slides.Rmd"),
  tar_target(choosing_R, "choosing_R.Rmd", format = "file"),
  tar_render(choosing_R_slides, "choosing_R_slides.Rmd"),
  tar_quarto(dates_and_times, "dates_and_times.qmd"),
  tar_quarto(dip, "dip.qmd"),
  tar_quarto(discrim, "discrim.qmd"),
  tar_target(functions, "functions.Rmd", format = "file"),
  tar_render(functions_slides, "functions_slides.Rmd"),
  tar_target(graphs_R, "graphs_R.Rmd", format = "file"),
  tar_render(graphs_R_slides, "graphs_R_slides.Rmd"),
  tar_target(inference_1_R, "inference_1_R.Rmd", format = "file"),
  tar_render(inference_1_R_slides, "inference_1_R_slides.Rmd"),
  tar_quarto(inference_2, "inference_2.qmd"),
  tar_quarto(inference_3, "inference_3.qmd"),
  tar_target(inference_4a_R, "inference_4a_R.Rmd", format = "file"),
  tar_render(inference_4a_R_slides, "inference_4a_R_slides.Rmd"),
  tar_target(inference_4b_R, "inference_4b_R.Rmd", format = "file"),
  tar_render(inference_4b_R_slides, "inference_4b_R_slides.Rmd"),
  tar_quarto(inference_5a, "inference_5a.qmd"),
  tar_quarto(inference_5b, "inference_5b.qmd"),
 tar_quarto(logistic, "logistic.qmd"),
  tar_target(mapping, "mapping.Rmd", format = "file"),
  tar_render(mapping_slides, "mapping_slides.Rmd"),
  tar_quarto(multiway, "multiway.qmd"),
 tar_target(numsum_R, "numsum_R.Rmd", format = "file"),
  tar_render(numsum_R_slides, "numsum_R_slides.Rmd"),
  tar_target(outline_c32, "outline_c32.Rmd", format = "file"),
  tar_render(outline_c32_slides, "outline_c32_slides.Rmd"),
tar_target(outline_c33, "outline_c33.Rmd", format = "file"),
tar_render(outline_c33_slides, "outline_c33_slides.Rmd"),
tar_target(outline_d29, "outline_d29.Rmd", format = "file"),
tar_render(outline_d29_slides, "outline_d29_slides.Rmd"),
tar_quarto(princomp, "princomp.qmd"),
tar_target(readfile_R, "readfile_R.Rmd", format = "file"),
tar_render(readfile_R_slides, "readfile_R_slides.Rmd"),
tar_target(reports_R, "reports_R.Rmd", format = "file"),
tar_render(reports_R_slides, "reports_R_slides.Rmd"),
tar_target(rstan, "rstan.Rmd", format = "file"),
tar_render(rstan_slides, "rstan_slides.Rmd"),
tar_target(running_R, "running_R.Rmd", format = "file"),
tar_render(running_R_slides, "running_R_slides.Rmd"),
tar_quarto(survival, "survival.qmd"),
tar_target(tidy_extra_R, "tidy_extra_R.Rmd", format = "file"),
tar_render(tidy_extra_R_slides, "tidy_extra_R_slides.Rmd"),
tar_target(tidying_R, "tidying_R.Rmd", format = "file"),
tar_render(tidying_R_slides, "tidying_R_slides.Rmd"),
tar_target(wider_wrong, "wider_wrong.Rmd", format = "file"),
tar_render(wider_wrong_slides, "wider_wrong_slides.Rmd"),
tar_quarto(windmill, "windmill.qmd"),
tar_target(with_categ_R, "with_categ_R.Rmd", format = "file"),
tar_render(with_categ_R_slides, "with_categ_R_slides.Rmd")
)
