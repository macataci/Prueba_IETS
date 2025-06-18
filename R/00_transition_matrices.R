############################################################
# 00_transition_matrices.R
#
# Description:
# This script defines:
#   - The disease states names used in the model
#   - Time variables related to each state
#   - Transition probabilities between states
#   - Transition matrices for the two treatments
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
############################################################

# 1. Define disease state names----------------------------------------------------------

# D state, C state, S state and M state
states_n <- c("Desarrollo", "Crisis", "Sobrevivencia", "Muerte")

# 2. Define time variables (in days)---------------------------------------------------------

# Average time in mild symptoms/disease development state (D state), in days
tD <- 10

# Average time in (D state), in days
tC <- 2 * 7 #  2 weeks converted to days

# Average survival time (S state)
tS <- 10 * 365 # 10 years converted to days

# 3. Define transition probabilities----------------------------------------------------------

# Definition of parameters
param <- define_parameters(
  # From D
  pDC = 1 - exp(-1 / tD), # Probability to C
  pDD = 1 - pDC, # Probability to stay in D

  # From C
  pCM1 = 0.03, # Probability to M (Treatment 1)
  pCM2 = 0.15, # Probability to M (Treatment 2)
  pCS = 1 - exp(-1 / tC), # Probability to S
  pCC1 = 1 - pCM1 - pCS, # Probability to stay in C (Treatment 1)
  pCC2 = 1 - pCM2 - pCS, # Probability to stay in C (Treatment 2)

  # From S
  pSM = 1 - exp(-1 / tS), # Probability to M
  pSS = 1 - pSM, # Probability to stay in  S

  # Quality of life at D state
  qlD_max = 1, #  Maximum quality of life value (100%)

  # Quality of life detriment

  qlC1 = 0.12, # Quality of life reduced in C state for Treatment 1
  qlC2 = 0.5, # Quality of life reduced in C state for Treatment 2
  qlS1 = 0.12, # Quality of life reduced in S state for Treatment 1
  qlS2 = 0.04 # Quality of life reduced in S state for Treatment 2
)

# 4. Define transition matrices for each treatment----------------------------------------------------------

# Transition matrix for Treatment 1
mat_treat1 <- define_transition(
  pDD, pDC, 0, 0,
  0, pCC1, pCS, pCM1,
  0, 0, pSS, pSM,
  0, 0, 0, 1,
  state_names = states_n
)

# Transition matrix for Treatment 2
mat_treat2 <- define_transition(
  pDD, pDC, 0, 0,
  0, pCC2, pCS, pCM2,
  0, 0, pSS, pSM,
  0, 0, 0, 1,
  state_names = states_n
)

# 5. Plot transition graphs----------------------------------------------------------

plot(mat_treat1, relsize = 0.78)
plot(mat_treat2, relsize = 0.78)

# 6. Save transition graphs with numbers instead of variables-----------------------------------------------------------

# Uncomment to save the graph for Treatment 1
# mat_treat1 <- define_transition(
#   0.905, 0.095, 0, 0,
#   0,    0.90, 0.069, 0.03,
#   0,    0,    0.9997, 0.0003,
#   0,    0,    0,    1, state_names = states_n
# )
# png("figs/00_treat1_graph.png", width = 700, height = 650)
# plot(mat_treat1, relsize = 0.78)
# title(main = "Transition Graph for Treatment 1", line = 3, cex.main = 1.5)
# dev.off()

# Uncomment to save the graph for Treatment 2
# mat_treat2 <- define_transition(
#   0.905, 0.095, 0, 0,
#   0,    0.781, 0.069, 0.15,
#   0,    0,    0.9997, 0.0003,
#   0,    0,    0,    1, state_names = states_n
# )
# png("figs/00_treat2_graph.png", width = 700, height = 650)
# plot(mat_treat2, relsize = 0.78)
# title(main = "Transition Graph for Treatment 2", line = 3, cex.main = 1.5)
# dev.off()

############################################################
# End of 00_transition_matrices.R
############################################################
