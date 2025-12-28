# Scripts para agilizar la realización de las prácticas de Minix

Una colección de scripts en Bash diseñados para optimizar tareas de administración y desarrollo en Minix.
Este repositorio contiene actualmente herramientas para automatizar la recompilación constante del kernel (es un rollo hacerlo a mano todo el rato).

---

## rec_kernel.sh (Script Principal)

Este script automatiza el proceso de copia, compilación e instalación de un nuevo fichero `main.c` dentro del código fuente del kernel. Incluye manejo de señales para una salida limpia y feedback visual por colores.

### Características
* **Validación de Archivos:** Comprueba la existencia del fichero fuente antes de proceder.
* **Compilación Automatizada:** Ejecuta `make` y `make install` de forma silenciosa, reportando solo el resultado final.
* **Interfaz de Colores:** Feedback visual claro para estados de éxito, error e información.
* **Gestión de Interrupciones:** Control mediante `Ctrl+C` para evitar estados inconsistentes.

### ¿Cómo probarlo?
únicamente hay que especificar dentro del script la ruta absoluta (/root/p6-conf-pag/main.c) donde está nuestro fichero con el que queremos recompilar el kernel.
Sigue estos pasos para clonar el repositorio y ejecutar el script en tu máquina:

1. **Clonar el repositorio dentro del directorio /home/alumno/Disco**
   ```bash
   git clone https://github.com/a-cabello/Rec_Kernel_SO
   ```
2. **Ejecutar start_minix y copyhost para copiarnos el directorio Disco del host a minix**
   ```bash
   start_minix &
   (iniciar sesión con nuestro ususario y clave)
   su -
   copyhost
   ´´´
  3. **Ejecutar script rec_kernel.sh como root (#)**
     ```bash
     bash rec_kernel.sh
     ```
