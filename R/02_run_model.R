
res_mod <- run_model(
  tratamiento_1 = strat_treat1,
  tratamiento_2 = strat_treat2,
  parameters = param,
  cycles = 15*365,
  cost = cost,
  effect = calidad_vida
)


summary(res_mod)

lineas_anuales <- seq(365, res_mod$cycles, by = 365)

# png("figs/02_life_quality.png", width = 600, height = 400)
plot(res_mod, type = "values", panels = "by_value", values = "calidad_vida" ) +
  ggtitle("Calidad de Vida Acumulada por Tratamiento (en el Tiempo)")+
  xlab("Tiempo (días)") + 
  ylab("Calidad de Vida Acumulada")+
  theme_bw() +
  theme(panel.grid = element_blank())+
  theme(plot.title = element_text(hjust=0.5))+
  scale_color_brewer(
    name = "Tratamiento",
    palette = "Set1",
    labels = c("Tratamiento 1", "Tratamiento 2")
  ) +  
  geom_vline(xintercept = lineas_anuales, linetype = "dashed", color = "grey")
# dev.off()


# png("figs/02_states_pop.png", width = 600, height = 400)
plot(res_mod, type = "counts") +
  ggtitle("Número de Individuos por Estado (en el Tiempo)")+
  xlab("Tiempo (días)") + 
  ylab("Número de Individuos")+
  theme_bw()+
  theme(panel.grid = element_blank())+
  theme(plot.title = element_text(hjust=0.5))+
  scale_color_brewer(
    name = "Estado",
    palette = "Dark2"
  )  +  
  geom_vline(xintercept = lineas_anuales, linetype = "dashed", color = "grey")
# dev.off()


# png("figs/02_states_pop_zoom.png", width = 600, height = 400)
plot(res_mod, type = "counts") +
  ggtitle("Número de Individuos por Estado (en el Tiempo)")+
  xlab("Tiempo (días)") + 
  xlim(0,180)+
  ylab("Número de Individuos")+
  theme_bw()+
  theme(panel.grid = element_blank())+
  theme(plot.title = element_text(hjust=0.5))+
  scale_color_brewer(
    name = "Estado",
    palette = "Dark2"
  )  +  
  geom_vline(xintercept = lineas_anuales, linetype = "dashed", color = "grey")
# dev.off()
