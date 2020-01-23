#Install conda into your new Linux environment using Miniconda (https://github.com/kapsakcj/win10-linux-conda-how-to)
#Requests
##The Ubuntu distribution available through Microsoft store is 16.04 LTS, 
##comes pre-loaded with these (python 3.5.1). If your distribution doesn't have these, 
## running "sudo apt upgrade" or "sudo apt-get upgrade" may install them.
##You'll need to download the correct version of Miniconda (miniconda = conda installer) 
##dependent upon which version of python is installed into your linux environment. 
##Check by running which python, python --version, or python3 --version. 
##Here's the list of all Miniconda installers. https://conda.io/miniconda.html
## You'll want the "Linux 64-bit" installer, for the correct version of python that is installed into your Linux environment.
#1.Open your newly created Linux environment and download the miniconda installer bash script by entering the following in the terminal 
#(this command is for the Linux 64-bit python 3.7 script):
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
#2.Run the bash script:
bash Miniconda3-latest-Linux-x86_64.sh
#3.Follow the commands as prompted by the conda installer. You can accept the defaults, and change them later if you want.
#4.To make the changes take effect, close and then re-open the terminal window
#5.Test your installation by running:
conda list
#For a successful installation, a list of installed packages appears.
#Actualizar conda
conda update -n base -c  defaults conda

#Step 4. Set up Bioconda channels in conda
##The bulk of these instructions were copied and modified from here: https://bioconda.github.io/#using-bioconda
##Run the following three commands from the terminal (IN THIS ORDER!!!)
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
#You should see a warning message after running the first command, but that is OK, simply proceed with the three commands. 
#You will not see any message or output after entering the third command.
#That is OK, it just means that there is no output to the terminal.

#Step 5. Use conda to install any of the 3000+ bioinformatics tools available in the Bioconda repository
#Some examples of tools available on Bioconda's Repository. 
#Just try searching for you favorite tools here: https://bioconda.github.io/conda-recipe_index.html:
##fastqc - A quality control tool for high throughput sequence data
##SPAdes - An assembly toolkit containing various assembly pipelines
##bwa - The BWA read mapper
##samtools - Tools for dealing with SAM, BAM and CRAM files
##bamtools - C++ API and command-line toolkit for working with BAM data
##bedtools - a swiss army knife for genome arithmetic
##poretools - toolkit for extracting fastq data and producing run QC figures and statistics
##unicycler - de novo assembler used for hybrid short and long read assemblies
##abricate - mass screening of contigs for antibiotic resistance genes
##bamtools - C++ API and command-line toolkit for working with BAM data
##bedtools - a swiss army knife for genome arithmetic
##and many, many more
#I'm going to demonstrate this using the bacterial de novo genome assembly tool, 
#Unicycler, as an example but feel free to try it out with any of the tools listed in the bioconda repository: 
#"https://bioconda.github.io/conda-recipe_index.html
#"Create an environment for Unicycler, by running the following at the terminal:
conda create --name unicyclerEnvironment
#Now there is a new "environment" created for running unicycler. 
#It currently is empty and has almost nothing installed in the environment, but that will come in a second. 
#I'll use this to specify the versions of all the dependencies I need installed.
#Now activate the environment with:
conda activate unicyclerEnvironment
# You will now see (unicyclerEnvironment) in parenthesis show up prior to the normal 
# user@host~: tag that is shown at the terminal before you type anything. 
# This means that you are currently working in the environment that you created, running the versions of software that were installed with your program of interest.
# Install Unicycler and all of its dependencies :) into the current environment using:
(unicyclerEnvironment) user@host~:$ conda install unicycler
#Check the list of programs installed by using:
(unicyclerEnvironment) user@host~:$ conda list
#You can also run this same command from your root environment, but with different syntax:
conda list -n unicyclerEnvironment
#You should see a list of all dependencies that are installed into the specific environment that you are working in. 
#There are many ways to change and manipulate this list. See the one liners below.
#Most programs have a short command used to check the installation, either by running programName --version or programname --help
#or sometimes even simply programName. In the case of Unicycler, Run the following:
(unicyclerEnvironment) user@host~:$ unicycler --help
#When you would like to leave the unicyclerEnvironment and return to the root environment, use the following command:
(unicyclerEnvironment) user@host~:$ conda deactivate 
#You can combine many of the above steps with simple one-liner! 
#This is actually the preferred route, because you can install multiple tools at once, and ensure that conda installs 
#compatible dependencies.
conda create -n spadesEnv spades=3.11.1 bwa samtools fastqc

#Useful conda one-liners (with mynewenvironment as an example). I pulled most of these from here: 
#https://conda.io/docs/user-guide/tasks/manage-environments.html
#Create new conda environment
conda create -n mynewenvironment
#Activate environment (start working within the environment)
conda activate mynewenvironment
#Deactivate environment (leave environment)
(mynewenvironment} user@host~:$ conda deactivate
#Add a package to an existing environment, for example scipy
conda install -n mynewenvironment scipy
#Add a package to an existing environment with a specific version, like scipy 0.15.0
conda install -n mynewenvironment scipy=0.15.0
#List all environments that have been created by the user
conda info --envs
#List all packages currently installed into the environment
(mynewenvironment) user@host~:$ conda list
#Remove a conda environment and all of its installed packages
conda remove --name mynewenvironment --all
