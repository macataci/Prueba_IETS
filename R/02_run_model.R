#-------------------------------------------------------------------#
# 02_run_model.R
#
# Description:
# This script runs the model for both treatments (strategies),
# summarizes the results, and generates plots:
#   - Accumulated quality of life over time
#   - Number of individuals in each state over time
#   - Zoomed-in plot for early states population
#
# Author: Maria Camila Tavera Cifuentes
# Date: 13/06/2025
#-------------------------------------------------------------------#

# 1. Run the model-----------------------------------------------------------

res_mod <- run_model(
  tratamiento_1 = strat_treat1,
  tratamiento_2 = strat_treat2,
  parameters = param,
  cycles = 15 * 365, # simulate for 15 years (in days)
  cost = cost,
  effect = calidad_vida
)

# Display summary of model results
summary(res_mod)

# Create vector with yearly time points for vertical lines
annual_lines <- seq(365, res_mod$cycles, by = 365)

# 2. Plot: Accumulated Quality of Life----------------------------------------

# Uncomment to save as PNG
# png("figs/02_life_quality.png", width = 600, height = 400)

plot(res_mod, type = "values", panels = "by_value", values = "calidad_vida") +
  ggtitle("Calidad de Vida Acumulada por Tratamiento (en el Tiempo)") +
  xlab("Tiempo (días)") +
  ylab("Calidad de Vida Acumulada") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_brewer(
    name = "Tratamiento",
    palette = "Set1",
    labels = c("Tratamiento 1", "Tratamiento 2")
  ) +
  geom_vline(xintercept = annual_lines, linetype = "dashed", color = "grey")

# Uncomment when saving as PNG
# dev.off()

# 3. Plot: Population per State (Full Time)-----------------------------------

# Uncomment to save as PNG
# png("figs/02_states_pop.png", width = 600, height = 400)

plot(res_mod, type = "counts") +
  ggtitle("Número de Individuos por Estado (en el Tiempo)") +
  xlab("Tiempo (días)") +
  ylab("Número de Individuos") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_brewer(
    name = "Estado",
    palette = "Dark2"
  ) +
  geom_vline(xintercept = annual_lines, linetype = "dashed", color = "grey")

# Uncomment when saving as PNG
# dev.off()

# 4. Plot: Population per State (Zoomed In: First 6 Months)------------------

# Uncomment to save as PNG
# png("figs/02_states_pop_zoom.png", width = 600, height = 400)

plot(res_mod, type = "counts") +
  ggtitle("Número de Individuos por Estado (en el Tiempo)") +
  xlab("Tiempo (días)") +
  xlim(0, 180) +
  ylab("Número de Individuos") +
  theme_bw() +
  theme(panel.grid = element_blank()) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_color_brewer(
    name = "Estado",
    palette = "Dark2"
  ) +
  geom_vline(xintercept = annual_lines, linetype = "dashed", color = "grey")

# Uncomment when saving as PNG
# dev.off()
