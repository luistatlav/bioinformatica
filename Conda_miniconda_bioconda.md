# Cómo instalar conda en Linux usando Miniconda (en Windows) o Ubuntu
Traducido y modificado de: https://github.com/kapsakcj/win10-linux-conda-how-to
## Ventajas:

 - Reproducibilidad
 - Fácil instalación

1. Actualizar lista de  repositorios en Ubuntu
	> $ sudo apt update
1. Actualizar repositorios
	> $ sudo apt upgrade --YES
1. Descargar la versión correcta de Miniconda (miniconda = conda installer) 
	> Lista de los instaladores de Miniconda (BioConda): https://conda.io/miniconda.html
	1. Elegir según corresponda: Windows, Linux o Mac.
1. Abrir el terminal de Linux (Ubuntu) y descargar el instalador de miniconda (ejemplo):
	>$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
1. Correr el script en bash (ejemplo):
	>$ bash Miniconda3-latest-Linux-x86_64.sh
1. Aceptar los parámetros por defecto (se pueden cambiar después si desea).
1. Cerrar y reabrir el terminal para asegurarse que los cambios surgan efecto.
1. Evaluar la instalación (Debería aparecer una lista de paquetes)
	> $ conda list
1. Actualizar conda
	> $ conda update -n base -c  defaults conda
1. Actualizar lista de  repositorios en Ubuntu
	> $ sudo apt update
1. Actualizar repositorios
	> $ sudo apt upgrade --YES
1. Descargar la versión correcta de Miniconda (miniconda = conda installer) 
	> Lista de los instaladores de Miniconda (BioConda): https://conda.io/miniconda.html
1. Elegir según corresponda: Windows, Linux o Mac.
1. Abrir el terminal de Linux (Ubuntu) y descargar el instalador de miniconda (ejemplo):
	>$ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
1. Correr el script en bash (ejemplo):
	>$ bash Miniconda3-latest-Linux-x86_64.sh
1. Aceptar los parámetros por defecto (se pueden cambiar después si desea).
1. Cerrar y reabrir el terminal para asegurarse que los cambios surgan efecto.
1. Evaluar la instalación (Debería aparecer una lista de paquetes)
	> $ conda list
1. Actualizar conda y aceptar
	> $ conda update -n base -c  defaults conda
1. Configurar el canal Bioconda en conda (https://bioconda.github.io/#using-bioconda)
1. Correr los comandos en el siguiente orden:
	> $ conda config --add channels defaults

	> $ conda config --add channels bioconda

	> $ conda config --add channels conda-forge

	Se mostraran mensajes de advertencias después de correr el primer comando, pero ingnorelas y prosiga con los demás comandos.
	No se verá ningún mensaje o OUTPUT después de ingresar el tercer comando.
1. Usar conda para installar alguno de los más de 3,000 herramientas bioinfomáticas disponibles en el repositorio de Bioconda.
	> https://bioconda.github.io/conda-recipe_index.html:
