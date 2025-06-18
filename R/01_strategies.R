#-----------------------------------------------------------------------#
# 01_strategies.R
#
# Description:
# This script defines:
#   - The disease states, including the cost and calidad_vida variables
#   - The treatment strategies
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
#-----------------------------------------------------------------------#

# 1. Define states-------------------------------------------------------

# Even though no cost is given in the instructions, this variable must be
# included in order to run the model

# D state
sD <- define_state(
  cost = 0,
  calidad_vida = qlmax
)

# C state
sC <- define_state(
  cost = 0,
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlmax - qlC1,
    tratamiento_2 = qlmax - qlC2
  )
)

# S state
sS <- define_state(
  cost = 0,
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlmax - qlS1,
    tratamiento_2 = qlmax - qlS2
  )
)

# M state
sM <- define_state(
  cost = 0,
  calidad_vida = qlmax - 1
)

# 2. Define treatment strategies-----------------------------------------

# Strategy for Treatment 1
strat_treat1 <- define_strategy(
  transition = mat_treat1,
  Desarrollo = sD,
  Crisis = sC,
  Sobrevivencia = sS,
  Muerte = sM
)

# Strategy for Treatment 2
strat_treat2 <- define_strategy(
  transition = mat_treat2,
  Desarrollo = sD,
  Crisis = sC,
  Sobrevivencia = sS,
  Muerte = sM
)
