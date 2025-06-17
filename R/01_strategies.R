

# States definition
sD <- define_state(
  cost = 0,
  calidad_vida = qlD
)

sC <- define_state(
  cost = 0, 
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlD - qlC1,
    tratamiento_2 = qlD - qlC2)
)

sS <- define_state(
  cost = 0,
  calidad_vida = dispatch_strategy(
    tratamiento_1 = qlD - qlS1,
    tratamiento_2 = qlD - qlS2)
)

sM <- define_state(
  cost = 0, 
  calidad_vida = qlD-1
)

# Strategies

strat_treat1 <- define_strategy(
  transition = mat_treat1,
  Desarrollo = sD,
  Crisis = sC,
  Sobrevivencia = sS,
  Muerte = sM
)

strat_treat2 <- define_strategy(
  transition = mat_treat2,
  Desarrollo = sD,
  Crisis = sC,
  Sobrevivencia = sS,
  Muerte = sM
)


