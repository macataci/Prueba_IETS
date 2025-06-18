#-------------------------------------------------------------------#
# Main Script
#
# Description:
# This script serves as the main point for running the entire model.
# It performs the following tasks:
#   1. Loads the necessary libraries.
#   2. Loads and executes the supporting scripts in the
#      appropriate order:
#      - Transition matrices
#      - States and strategies definitions
#      - Model execution, results summary, and plots
#      - Deterministic sensitivity analysis and its plots
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
#-------------------------------------------------------------------#

# 1. Load required libraries-----------------------------------------

# Uncomment the following line to install 'heemod' if not installed
# install.packages("heemod")

library(heemod)
library(ggplot2)

# 2. Load and run scripts in order-----------------------------------

# Load transition matrices
source("R/00_transition_matrices.R")

# Load states and strategies definitions
source("R/01_strategies.R")

# Run the model, generate summary results and plots
source("R/02_run_model.R")

# Perform deterministic sensitivity analysis and generate plots
source("R/03_sensitivity_analysis.R")
