
sa <- define_dsa(
  qlC1, .108, .123,
  qlC2, .45, .55,
  qlS1, .108, .123,
  qlS2, 0.036, 0.044,
  pCM1, 0.027, 0.033,
  pCM2, 0.135, 0.165
)

res_dsa <- run_dsa(
  model = res_mod,
  dsa = sa
)

png("figs/03_dsa_treat1.png", width = 650, height = 400)
plot(res_dsa,
     strategy = "tratamiento_1",
     result = "effect",
     type = "simple") + xlab("Calidad de Vida") +
  ggtitle("Resultado Análisis de Sensibilidad para el Tratamiento 1")+
  theme(plot.title = element_text(hjust=0.5), plot.margin = margin(1, 1, 1, 1, "cm"))
dev.off()

png("figs/03_dsa_treat2.png", width = 650, height = 400)
plot(res_dsa,
     strategy = "tratamiento_2",
     result = "effect",
     type = "simple") + xlab("Calidad de Vida")+
  ggtitle("Resultado Análisis de Sensibilidad para el Tratamiento 2")+
  theme(plot.title = element_text(hjust=0.5), plot.margin = margin(1, 1, 1, 1, "cm"))
dev.off()

png("figs/03_dsa_diff.png", width = 650, height = 400)
plot(res_dsa,
     strategy = "tratamiento_1",
     result = "effect",
     type = "difference")+ xlab("Calidad de Vida") +
  ggtitle("Resultado Análisis de Sensibilidad Respecto al Valor Base")+
  theme(plot.title = element_text(hjust=0.5), plot.margin = margin(1, 1, 1, 1, "cm"))
dev.off()
