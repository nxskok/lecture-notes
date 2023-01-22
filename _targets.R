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
  tar_target(asphalt, "asphalt.Rmd", format = "file"),
  tar_render(asphalt_slides, "asphalt_slides.Rmd"),
  tar_target(bAnova, "bAnova.Rmd", format = "file"),
  tar_render(bAnova_slides, "bAnova_slides.Rmd"),
  tar_target(bAncova, "bAncova.Rmd", format = "file"),
  tar_render(bAncova_slides, "bAncova_slides.Rmd"),
  tar_target(bCluster, "bCluster.Rmd", format = "file"),
  tar_render(bCluster_slides, "bCluster_slides.Rmd"),
  tar_target(bDiscrim, "bDiscrim.Rmd", format = "file"),
  tar_render(bDiscrim_slides, "bDiscrim_slides.Rmd"),
  tar_target(bFactor, "bFactor.Rmd", format = "file"),
  tar_render(bFactor_slides, "bFactor_slides.Rmd"),
  tar_target(bLogistic, "bLogistic.Rmd", format = "file"),
  tar_render(bLogistic_slides, "bLogistic_slides.Rmd"),
  tar_target(bManova, "bManova.Rmd", format = "file"),
  tar_render(bManova_slides, "bManova_slides.Rmd"),
  tar_target(bMultiway, "bMultiway.Rmd", format = "file"),
  tar_render(bMultiway_slides, "bMultiway_slides.Rmd"),
  tar_target(bootstrap_R, "bootstrap_R.Rmd", format = "file"),
  tar_render(bootstrap_R_slides, "bootstrap_R_slides.Rmd"),
  tar_target(bootstrap, "bootstrap.Rmd", format = "file"),
  tar_render(bootstrap_slides, "bootstrap_slides.Rmd"),
  tar_target(bPrincomp, "bPrincomp.Rmd", format = "file"),
  tar_render(bPrincomp_slides, "bPrincomp_slides.Rmd"),
  tar_target(bProfile, "bProfile.Rmd", format = "file"),
  tar_render(bProfile_slides, "bProfile_slides.Rmd"),
  tar_target(bRegression, "bRegression.Rmd", format = "file"),
  tar_render(bRegression_slides, "bRegression_slides.Rmd"),
  tar_target(bSurvival, "bSurvival.Rmd", format = "file"),
  tar_render(bSurvival_slides, "bSurvival_slides.Rmd"),
  tar_target(choosing_R, "choosing_R.Rmd", format = "file"),
  tar_render(choosing_R_slides, "choosing_R_slides.Rmd"),
  tar_target(dates_and_times, "dates_and_times.Rmd", format = "file"),
  tar_render(dates_and_times_slides, "dates_and_times_slides.Rmd"),
  
  
  tar_target(functions, "functions.Rmd", format = "file"),
  tar_render(functions_slides, "functions_slides.Rmd"),
  tar_target(numsum_R, "numsum_R.Rmd", format = "file"),
  tar_render(numsum_R_slides, "numsum_R_slides.Rmd")
)
