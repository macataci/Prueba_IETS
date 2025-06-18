############################################################
# 01_strategies.R
#
# Description:
# This script defines:
#   - The disease states
#   - The treatment strategies
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
############################################################

# 1. Define states----------------------------------------------------------

# D state
sD <- define_state(
  cost = 0,
  calidad_vida = qlD_max
)

# C state
sC <- define_state(
  cost = 0,
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlD_max - qlC1,
    tratamiento_2 = qlD_max - qlC2
  )
)

# S state
sS <- define_state(
  cost = 0,
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlD_max - qlS1,
    tratamiento_2 = qlD_max - qlS2
  )
)

# M state
sM <- define_state(
  cost = 0,
  calidad_vida = qlD_max - 1
)

# 2. Define treatment strategies----------------------------------------------------------

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