# Prueba de Conocimiento - Simulador/Modelador

## Descripción

Este repositorio presenta la solución a la Prueba Práctica para el cargo de Simulador/Modelador del Instituto de Evaluación Tecnológica en Salud (IETS), por parte de Maria Camila Tavera Cifuentes, haciendo uso del paquete [*heemod*](https://cran.r-project.org/web/packages/heemod/index.html).

La prueba presenta una situación de un fenómeno en salud teórico y busca que el aplicante genere el modelo asociado y los desarrollos pertinentes para responder las preguntas planteadas. Se puede encontrar más detalle respecto al caso planteado en `docs/Prueba_Practica_Simulador.docx`.

A continuación se presenta la estructura del proyecto.

## Estructura del proyecto

```         
project/
*    ├── data/
*    │   ├── raw
*    │   └── processed
     ├── docs/
*    ├── figs/
*    ├── output/
     ├── R/
*    └── README.md
```

En la carpeta `docs` se presentan los documentos asociados a la prueba tales como el documento base enviado desde Talento Humano, al igual que un archivo con la información de las matrices de transición, que fue usado para visualizar de una mejor manera el problema y el documento resumen de la solución. Además, en la carpeta `figs` se presentan las figuras generadas y en `R` los diferentes scripts que llevaron a la generación de las figuras y resultados asociados a la prueba.

Aunque para esta ocasión no se requirió cargar archivos de datos, ni se almacenaron resultados diferentes a figuras, se tienen las carpetas `data` y `output` en caso de que estos datos sean manejados o almacenados en el futuro.

## Instrucciones para correr los scripts

En el archivo `main.R` se cargan las librerias necesarias y se ejecutan, en orden, todos los scipts del proyecto. Por lo tanto, si se corre este archivo completo, se generarán automáticamente todas las figuras de resultados en la carpeta `figs`.

Ahora bien, si el usuario prefiere ejecutar cada script de forma individual, debe primero cargar las librerías indicadas en `main.R` y luego correr los scripts uno a uno, empezando por `00_transition_matrices.R` y siguiendo el orden númerico ascendente hasta `03_sensitivity_analysis.R`.

## Contacto

**Correo electrónico:** macataci\@hotmail.com
