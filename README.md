# Installation Script

Este script de Bash está diseñado para configurar un entorno de desarrollo y herramientas de pentesting en un sistema basado en Debian, como Kali Linux. Automatiza la instalación y configuración de varios paquetes y aplicaciones esenciales.

## Descripción

El script realiza las siguientes tareas:

- Actualiza los repositorios y paquetes instalados.
- Instala herramientas necesarias para la visualización de imágenes en la terminal y `Visual Studio Code`.
- Configura `rclone` para la sincronización de almacenamiento en la nube.
- Instala y configura `BloodHound` junto con sus dependencias.
- Instala `dirsearch` y `PowerShell`.
- Realiza varias configuraciones de sistema, como la instalación de VMware guest tools y la configuración de la red.

## Requisitos

- Sistema operativo basado en Debian (preferiblemente Kali Linux).
- Derechos de superusuario (sudo) para la instalación de paquetes.

## Uso

Para ejecutar este script:

1. Descarga el script en tu máquina.
2. Abre un terminal y navega hasta el directorio donde se encuentra el script.
3. Haz el script ejecutable con el siguiente comando:

   ```bash
   chmod +x install.sh
