############################################################
# 03_sensitivity_analysis.R
#
# Description:
# This script defines the deterministic sensitivity analysis (DSA),
# runs it for the model, and generates tornado plots:
#   - For Treatment 1
#   - For Treatment 2
#   - For the difference between treatments
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
############################################################

# 1. Define the DSA parameters and their ranges----------------------------------------------------------

# Parameter values with +-10%
sa <- define_dsa(
  qlC1, 0.108, 0.132,
  qlC2, 0.45, 0.55,
  qlS1, 0.108, 0.132,
  qlS2, 0.036, 0.044,
  pCM1, 0.027, 0.033,
  pCM2, 0.135, 0.165,
)

# 2. Run the DSA----------------------------------------------------------

res_dsa <- run_dsa(
  model = res_mod,
  dsa = sa
)

# 3. Plot DSA results: Treatment 1----------------------------------------------------------

# Uncomment to save as PNG
# png("figs/03_dsa_treat1.png", width = 650, height = 400)

plot(res_dsa,
  strategy = "tratamiento_1",
  result = "effect",
  type = "simple"
) +
  xlab("Calidad de Vida") +
  ggtitle("Resultado Análisis de Sensibilidad para el Tratamiento 1") +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.margin = margin(1, 1, 1, 1, "cm")
  )

# Uncomment when saving as PNG
# dev.off()

# 4. Plot DSA results: Treatment 2----------------------------------------------------------

# Uncomment to save as PNG
# png("figs/03_dsa_treat2.png", width = 650, height = 400)

plot(res_dsa,
  strategy = "tratamiento_2",
  result = "effect",
  type = "simple"
) +
  xlab("Calidad de Vida") +
  ggtitle("Resultado Análisis de Sensibilidad para el Tratamiento 2") +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.margin = margin(1, 1, 1, 1, "cm")
  )

# Uncomment when saving as PNG
# dev.off()

# 5. Plot DSA results: Difference between Treatments----------------------------------------------------------

# Uncomment to save as PNG
# png("figs/03_dsa_diff.png", width = 650, height = 400)

plot(res_dsa,
  strategy = "tratamiento_1",
  result = "effect",
  type = "difference"
) +
  xlab("Calidad de Vida") +
  ggtitle("Resultado Análisis de Sensibilidad para Diferencia entre
          Tratamientos") +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.margin = margin(1, 1, 1, 1, "cm")
  )

# Uncomment when saving as PNG
# dev.off()
