
states_n <- c("Desarrollo", "Crisis", "Sobrevivencia", "Muerte")

# Time variables

# Time in mild symptoms (M) state, in days.
tD <- 10

# Time in crisis (C) state, in days.
tC <- 14

# Time alive after crisis (S), in days.
tS <- 10*365


# Transition probabilities 

param <- define_parameters(
  pDC = 1-exp(-1/tD),
  pDD = 1-pDC,
  pCM1 = 0.03, 
  pCM2 = 0.15, 
  pCS = 1-exp(-1/tC),
  pCC1 = 1-pCM1-pCS,
  pCC2 = 1-pCM2-pCS,
  pSM = 1-exp(-1/tS),
  pSS = 1-pSM,
  qlD = 1,
  qlC1 = 0.12,
  qlC2 = 0.5,
  qlS1 = 0.12,
  qlS2 = 0.04,
)


# Transition matrices

# mat_treat1 <- define_transition(
#   0.905, 0.095, 0, 0,
#   0,    0.90, 0.069, 0.03,
#   0,    0,    0.9997, 0.0003,
#   0,    0,    0,    1, state_names = states_n
# )


mat_treat1 <- define_transition(
  pDD, pDC, 0, 0,
  0,    pCC1, pCS, pCM1,
  0,    0,    pSS, pSM,
  0,    0,    0,    1, state_names = states_n
)

# png("figs/00_treat1_graph.png", width = 700, height = 650)
# plot(mat_treat1, relsize = 0.78)
# title(main = "Grafo Asociado al Modelo con el Tratamiento 1", line=3, cex.main=1.5)
# dev.off()


# mat_treat2 <- define_transition(
#   0.905, 0.095, 0, 0,
#   0,    0.781, 0.069, 0.15,
#   0,    0,    0.9997, 0.0003,
#   0,    0,    0,    1, state_names = states_n
# )

mat_treat2 <- define_transition(
  pDD, pDC, 0, 0,
  0,    pCC2, pCS, pCM2,
  0,    0,    pSS, pSM,
  0,    0,    0,    1, state_names = states_n
)

# 
# png("figs/00_treat2_graph.png", width = 700, height = 650)
# plot(mat_treat2, relsize = 0.78)
# title(main = "Grafo Asociado al Modelo con el Tratamiento 2", line=3, cex.main=1.5)
# dev.off()
