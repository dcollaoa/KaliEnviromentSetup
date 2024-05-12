# Script de Configuración

Este script de shell automatiza la configuración inicial de tu entorno en Kali Linux. Realiza las siguientes acciones:

1. Actualiza los repositorios e instala las actualizaciones disponibles.
2. Instala la herramienta `timg`.
3. Configura el repositorio de Visual Studio Code y lo instala.
4. Descarga, instala y configura `rclone` para la sincronización remota de archivos.
5. Configura el mapa de teclado en español para el usuario actual.
6. Asigna permisos al usuario `kali` para archivo target en .config/bin/target
7. Notifica cuando la instalación está completa.

## Uso

1. Clona el repositorio en tu máquina Kali Linux.
2. Ejecuta el script `start.sh` con permisos de superusuario.

```bash
sudo ./start.sh
