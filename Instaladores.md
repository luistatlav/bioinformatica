#Programas para Bioinformática en UBUNTU.

##How to change the font and window colors so that your eyes don't bleed from Microsoft's awful choice of default colors
##https://medium.com/@jgarijogarde/make-bash-on-ubuntu-on-windows-10-look-like-the-ubuntu-terminal-f7566008c5c2
######################################################################################################

#Actualizar repositorios del sistema
sudo apt-get update; sudo apt-get upgrade --yes

#Instalar terminator
sudo apt install terminator --yes
which terminator > LOG.txt

#Instalar htop
sudo apt install htop
which terminator >> LOG.txt

#Ir a directorio principal
cd
#Crear carpeta donde se instalaran los programas
mkdir TOOLS
cd TOOLS

#Instalar notepadqq (Similar a notpad++)
sudo add-apt-repository ppa:notepadqq-team/notepadqq #presione enter
sudo apt-get update 
sudo apt-get install notepadqq --yes
which notepadqq >> LOG.txt

#confirmar que haya git
sudo apt install git --yes
which git >> LOG.txt

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

#Instalar pip
sudo apt install python-pip
which python-pip >> LOG.txt
##pip install --upgrade setuptools 
##or(on Ubuntu)
sudo apt-get install python-setuptools --yes
#You may also use old-style installation scripts: ./install.sh or ./install_full.sh
which python-setuptools >> LOG.txt


#Java Run Environment.
sudo apt-get install default-jre --yes
sudo apt-get install default-jdk --yes

#wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz"
#tar -xvzf jdk-8u144-linux-x64.tar.gz
#sudo install /usr/bin/java java 
#cd ~/TOOLS

#Instalar apache (Pre-requisito para Jmodeltest)
sudo apt install ant --yes
which ant >> LOG.txt

##Cmake
sudo apt-get install cmake --yes

##Boost Libraries
sudo apt-get install libboost-all-dev --yes

##Eigen Libraries
wget http://bitbucket.org/eigen/eigen/get/3.3.4.tar.gz
sudo tar -xvzf 3.3.4.tar.gz
mkdir build_eigen_dir
cd build_eigen_dir
cmake ~/TOOLS/eigen-eigen-5a0156e40feb
sudo make install
source ~/.bashrc
cd ~/TOOLS/

#DEPENDENCIAS:
##instalar cpan
sudo  apt-get install build-essential
##instalar pdflatex (requerido para velvet)
sudo apt install texlive-latex-base
##Zlib (para bioawk)
sudo apt-get install zlib1g-dev libncurses5-dev --yes
##Bio::SeqIO module (para velvetoptimiser)
cpan
install Bio::SeqIO module
sudo
exit

#instalar Bioperl
#sudo apt-get install bioperl
cpan[3]> install Bio::Seq
#Bio::Phylo is not installed
#Inline::C is not installed

#sudo apt install perlbrew
#Instalar el modulo requerido como super usuario
#cpan[1]> install VelvetOpt::Assembly module
#VelvetOptimizer 2.2.5
# http://bioinformatics.net.au/software.velvetoptimiser.shtml
wget http://www.vicbioinformatics.com/VelvetOptimiser-2.2.5.tar.gz
sudo tar -zxvf VelvetOptimiser-2.2.5.tar.gz
cd VelvetOptimiser-2.2.5
PATH=$PATH:~/TOOLS/VelvetOptimiser-2.2.5
export PATH
source ~/.bashrc
cd ~/TOOLS

######################################################################################################

#1-Manipulación de Fastq a Fasta
##FastX Toolkit: Fastq_to_Fasta
sudo apt install fastx-toolkit --yes
which fastq_to_fasta >> LOG.txt
#$ fastq_to_fasta -h
	#usage: fastq_to_fasta [-h] [-r] [-n] [-v] [-z] [-i INFILE] [-o OUTFILE]
#	version 0.0.6
	#   [-h]         = This helpful help screen.
	 #  [-r]         = Rename sequence identifiers to numbers.
	  # [-n]         = keep sequences with unknown (N) nucleotides.
			 # Default is to discard such sequences.
	   #[-v]         = Verbose - report number of sequences.
			 # If [-o] is specified,  report will be printed to STDOUT.
			 # If [-o] is not specified (and output goes to STDOUT),
			 # report will be printed to STDERR.
	   #[-z]         = Compress output with GZIP.
	   #[-i INFILE]  = FASTA/Q input file. default is STDIN.
	   #[-o OUTFILE] = FASTA output file. default is STDOUT.



##Instalar Bioawk depends on zlib
sudo apt install byacc git
#git clone git://github.com/lh3/bioawk.git && cd bioawk && make && mv awk bioawk && sudo cp bioawk /usr/local/bin/
git clone --recursive git://github.com/lh3/bioawk.git
cd bioawk
make 
sudo cp bioawk /usr/local/bin
cd .. && rm -rf bioawk

##Obtener contigs más grandes
#$ time bioawk -c fastx '{if(length($seq)>1000){print ">"$name;print $seq}}' *.fasta > MasDe1000.fa

#2-Control de Calidad de los READS
##SeqStat - Ver estadisticas de secuencias
##Dependencias cmake
sudo apt install cmake
sudo apt install biosquid --yes
which seqstat >> LOG.txt
##assembly-stats - Estadísticas de ensamblaje
git clone --recursive git://github.com/sanger-pathogens/assembly-stats.git
cd assembly-stats
mkdir build
cd build
cmake ..
make
make test
sudo make install
#agregar manualmente el archivo /build/assembly-stats al usr/local/bin
#cd ~/TOOLS
sudo cp assembly-stats /usr/local/bin

#Perl modules for prinseq-lite
##Getopt::Long
##Pod::Usage
##File::Temp qw(tempfile)
##Fcntl qw(:flock SEEK_END)
##Digest::MD5 qw(md5_hex)
##Cwd
##List::Util qw(sum min max)
$ sudo cpan Getopt::Long Pod::Usage File::Temp Fcntl Digest::MD5 Cwd List::Util
#Perl modules for prinseq-graphs
##Getopt::Long
##Pod::Usage
##File::Temp qw(tempfile)
##Fcntl qw(:flock SEEK_END)
##Cwd
##JSON
##Cairo
##Statistics::PCA
##MIME::Base64
$ sudo cpan Getopt::Long Pod::Usage File::Temp Fcntl Cwd JSON Cairo Statistics::PCA MIME::Base64
##Installation
$ cd /programinstallers/
$ wget -N http://downloads.sourceforge.net/project/prinseq/standalone/prinseq-lite-0.20.4.tar.gz
$ tar -zxvf prinseq-lite-0.20.4.tar.gz
##Install
$ cp -puv prinseq-lite-0.20.4/prinseq-lite.pl /usr/local/bin/prinseq-lite && chmod +x /usr/local/bin/prinseq-lite
$ cp -puv prinseq-lite-0.20.4/prinseq-graphs.pl /usr/local/bin/prinseq-graphs && chmod +x /usr/local/bin/prinseq-graphs
##For web page documentation
$ mkdir web/prinseq
$ cp -puv prinseq-lite-0.20.4/README web/prinseq/README.txt
$ cp -puvr prinseq-lite-0.20.4/example web/prinseq
##Cleanup
$ rm prinseq-lite-0.20.4 -rf

##Fastp (También para PacBio, Nanopore e Illumina)
cd ~/TOOLS
#Descargar de github
git clone --recursive git://github.com/OpenGene/fastp.git 
# build
cd fastp
make
# Install
sudo make install

######################################################################################################

##Fastqc
#git clone --recursive git://github.com/s-andrews/FastQC.git
sudo apt install fastqc --yes
which fastqc >> LOG.txt
##SolexaQA(Dynamictrim)-v3.1.7.1
mkdir SolexaQA
cd SolexaQA
wget https://sourceforge.net/projects/solexaqa/files/src/SolexaQA%2B%2B_v3.1.7.1.zip
unzip SolexaQA++_v3.1.7.1.zip
rm -r SolexaQA++_v3.1.7.1.zip
rm -r Windows_x64
rm -r MacOs_10.7+
rm -r source
cd Linux_x86 
#PATH=$PATH:~/TOOLS/SolexaQA++
#export PATH
#source ~/.bashrc
sudo cp SolexaQA++ /usr/local/bin
cd ~/TOOLS
##TrimGalore
###Instalar cutadapt
sudo apt install cutadapt
ó
sudo apt install python-cutadapt
git clone --recursive git://github.com/FelixKrueger/TrimGalore.git



##Trimmomatic
#sudo apt install trimmomatic --yes
git clone --recursive git://github.com/timflutre/trimmomatic.git
cd trimmomatic
make
make check
sudo make install INSTALL="/usr/local/"


#Instalar Multiqc (evaluar fastq pre y post cortados)
#actualizar pip
sudo pip install --upgrade pip
#instalar multiqc
sudo pip install multiqc

######################################################################################################



#3-Ensambladores de novo

#instalar a5-miseq
wget https://downloads.sourceforge.net/project/ngopt/a5_miseq_linux_20160825.tar.gz
sudo tar -xzvf a5_miseq_linux_20160825.tar.gz
#Otra versión "a5"
git clone --recursive git://github.com/levinas/a5

#instalar kmergenie 1.7048
##requiere python y R
wget http://kmergenie.bx.psu.edu/kmergenie-1.7048.tar.gz
sudo tar -xzvf kmergenie-1.7048.tar.gz
cd kmergenie-1.7048
make
PATH=$PATH:~/TOOLS/kmergenie-1.7048
export PATH
source ~/.bashrc
cd ~/TOOLS



#Velvet.
git clone --recursive git://github.com/dzerbino/velvet.git
cd velvet 
#compilar para que use al menos 191 kmers (tb puede hacerse solo para max 101)
make 'MAXKMERLENGTH=191'
#make BUNDLEDZLIB=1 ##puede malograr la compilacion de 101
#Si no funciona, entonces primero eliminar velveth y velvetg de usr/bin y repetir el make.
PATH=$PATH:~/TOOLS/velvet
export PATH
source ~/.bashrc
#sudo apt install velvet --yes
cd ~/TOOLS
which velvetg >> LOG.txt
which velveth >> LOG.txt

#Velvetoptimiser:
##falta copiarla al path
cd ~/TOOLS
git clone --recursive git://github.com/tseemann/VelvetOptimiser.git
PATH=$PATH:~/TOOLS/VelvetOptimiser
export PATH
source ~/.bashrc
cd ~/TOOLS
#sudo cp VelvetOptimiser /usr/local/bin
#cd .. && rm -rf VelvetOptimiser
#Verificar instalación:
cd ~/TOOLS/VelvetOptimiser/test
./run_test.sh

#SPADES
wget http://cab.spbu.ru/files/release3.13.0/SPAdes-3.13.0-Linux.tar.gz
$ tar -xzf SPAdes-3.13.0-Linux.tar.gz
$ cd SPAdes-3.13.0-Linux
#copiar al path o en usr/local/bin
$ PATH=$PATH:~/TOOLS/SPAdes-3.13/bin
$ export PATH
$ source ~/.bashrc
$ cd ~/TOOLS

#Oases(Ensamblador para transcriptómica, usa velvet).
cd ~/TOOLS
git clone --recursive git://github.com/dzerbino/oases.git
cd oases
make BUNDLEDZLIB=1
make ’MAXKMERLENGTH=101’
sudo PATH=$PATH:~/TOOLS/oases
export PATH
source ~/.bashrc
cd ~/TOOLS

#MIRA
#wget https://downloads.sourceforge.net/project/mira-assembler/MIRA/stable/mira_4.0.2_linux-gnu_x86_64_static.tar.bz2
#sudo tar -xjvf mira_4.0.2_linux-gnu_x86_64_static.tar.bz2
#cd mira_4.0.2_linux-gnu_x86_64_static/bin
#PATH=$PATH:~/TOOLS/mira_4.0.2_linux-gnu_x86_64_static/bin
#export PATH
#source ~/.bashrc
#cd ~/TOOLS
sudo apt install mira-assembler --yes


##QUAST, tambien se puede correr online
sudo apt-get install -y pkg-config libfreetype6-dev libpng-dev python-matplotlib --yes
wget https://downloads.sourceforge.net/project/quast/quast-5.0.2.tar.gz
tar -xzf quast-5.0.2.tar.gz
cd quast-5.0.2
sudo ./setup.py install_full
cd ~/TOOLS

######################################################################################################

##K-mer Analysis Tolkit (KAT)
##Requisitos
#GCC V4.8+
sudo apt-get install gcc
#make
#autoconf V2.53+
sudo apt-get install autoconf
#automake V1.11+
sudo apt-get install automake
#libtool V2.4.2+
sudo apt-get install libtool
#pthreads
#zlib
#Python V3.5+
sudo apt-get install python3.5-dev
###numpy para python 2+
sudo pip install numpy scipy
pip install --upgrade pip
###numpy, scipy, matplotlib, tabulate para python 3+
sudo apt update  
sudo apt install --no-install-recommends python3-minimal python3  
sudo apt install python3-numpy python3-scipy python3-matplotlib python3-tabulate --yes
#Python V3.6
sudo add-apt-repository ppa:jonathonf/python-3.6
sudo apt-get update
sudo apt-get install python3.6 --yes
#Sphinx-doc V1.3+
sudo apt-get install libpthread-stubs0-dev
cd ~/TOOLS
#Clone the git repository  (For ssh: git clone git@github.com:TGAC/KAT.git; or for https: git clone https://github.com/TGAC/KAT.git)
git clone --recursive git://github.com/TGAC/KAT.git
#Change directory into KAT project
cd KAT
#Build boost (this may take some time)
./build_boost.sh
#Setup the KAT configuration scripts by typing
./autogen.sh
#Generate makefiles and confirm dependencies usr/local/bin:
./configure
##ERROR
#checking consistency of all components of python development environment... no
#configure: WARNING:
 # Could not link test program to Python. Maybe the main Python library has been
  #installed in some non-standard library path. If so, pass it to configure,
  #via the LIBS environment variable.
  #Example: ./configure LIBS="-L/usr/non-standard-path/python/lib"
  #============================================================================
   #ERROR!
   #You probably have to install the development version of the Python package
   #for your distribution.  The exact name of this package varies among them.
  #============================================================================
#
#configure: error:
#                Python3 not detected.
#                We suggest installing python3 via conda with the required packages (numpy, scipy, matplotlib, sphinx).
#                Please see .travis/install.sh for details of how we do this.
#                Alternatively, try installing python anaconda.

#Compile software with 4 cores
make -j 4
#run tests
make check
#Install
sudo make install



#4-Instalar alineadores
##Dependencias para mummer:
sudo apt install fig2dev --yes
sudo apt install gnuplot-nox --yes
#sudo apt install gnuplot-qt 
#sudo apt install gnuplot-x11
sudo apt install xfig --yes
##mummer
sudo apt install mummer --yes
which mummer >> LOG.txt
##Bowtie
sudo apt install bowtie --yes
which bowtie >> LOG.txt
##bowtie2
sudo apt install bowtie2 --yes
which bowtie2 >> LOG.txt
##bwa-->También para reads grandes
sudo apt install bwa --yes
which bwa >> LOG.txt
##cufflinks
sudo apt install cufflinks --yes
which cufflinks >> LOG.txt
##smalt
sudo apt install smalt --yes
which smalt >> LOG.txt
##Samtools
###sudo apt install samtools --yes
###which samtools >> LOG.txt
git clone --recursive https://github.com/samtools/samtools.git
cd samtools
autoheader
autoconf
./configure
make
sudo make install
cd ~/TOOLS
##blasr--> Para PacBio
sudo apt install blasr

##weeSAM
#weeSAM is a python script which produces coverage statistics and coverage plots from an input SAM or BAM file. 
#Figures and stats are written up in HTML so users can easily view the coverage for their reference assembly.
git clone --recursive https://github.com/centre-for-virus-research/weeSAM.git
cd weeSAM
sudo cp weeSAM /usr/local/bin/
cd ~/TOOLS

#Picard (Java tools for working with NGS data in the BAM format)
conda install -c bioconda picard 
conda install -c bioconda/label/cf201901 picard 

#gecode: A tool to GENerate COnsensus REads.
# step 1: download and compile htslib from: https://github.com/samtools/htslib
# step 2: get gencore source (you can also use browser to download from master or releases)
git clone https://github.com/OpenGene/gencore.git
# step 3: build
cd gencore
make
# step 4: install
sudo make install
#Sino funciona posiblemente hay que isntalar htslib
git clone https://github.com/samtools/htslib.git
cd htslib
make
sudo make install
export LD_LIBRARY_PATH=/home/luis/TOOLS/htslib/

##TopHat
sudo apt install tophat
which tophat-2 >> LOG.txt

##BLAST
sudo apt install ncbi-blast+ --yes
#which blastn >> LOG.txt
#which blastp >> LOG.txt
sudo apt install blast2 --yes
##Sino funciona blastall por no reconocer la base de datos, entonces volver a exportarla
#$export BLASTDB=/path/to/blastdbs/of/your/chosing
##Instalar bases de datos nr
#cd $BLASTDB
#sudo update_blastdb --passive --timeout 300 --force --verbose nr
#ls *.gz |xargs -n1 tar -xzvf
#rm *.gz.*
#Dar formato a multifasta
##Nucleotidos
### makeblastdb -dbtype nucl -in MULTI.fasta -input_type fasta -title NUEVO-titulo -parse_seqids -hash_index
##Proteinas
### makeblastdb -dbtype prot -in MULTI.fasta -input_type fasta -title NUEVO-titulo -parse_seqids -hash_index
#Ejemplo de aplicación de BLASTp:
$ makeblastdb -dbtype prot -in Proteoma_Humano.fasta -input_type fasta -title Proteoma_Humano.fasta -parse_seqids -hash_index
$ blastp -query Spike.fasta -db ../Proteoma_Humano.fasta -max_target_seqs 1 -outfmt "6 qseqid qlen sseqid slen qstart qend sstart send evalue bitscore score length pident nident mismatch positive gapopen gaps ppos frames qframe sframe staxids lcaid lcataxid" > SpikeTODO_output.csv


#Instalar herramientas de búsqueda de ncbi
sudo apt install ncbi-entrez-direct
##esearch

######################################################################################################

#5-Instalar visualizadores
##Artermis
sudo apt install artemis --yes
which artemis >> LOG.txt
##Circos (No funcionaba en ubuntu 16.04LTS
sudo apt install circos --yes
which circos >> LOG.txt

######################################################################################################

#wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.3/bowtie2-2.3.3-linux-x86_64.zip
#unzip bowtie2-2.3.3-linux-x86_64.zip
#cd bowtie2-2.3.3 
#PATH=$PATH:~/TOOLS/bowtie2-2.3.3
#export PATH
#source ~/.bashrc
#cd ~/TOOLS



##TopHat
#wget https://ccb.jhu.edu/software/tophat/downloads/tophat-2.1.1.Linux_x86_64.tar.gz
#sudo tar xvfz tophat-2.1.1.Linux_x86_64.tar.gz
#cd tophat-2.1.1.Linux_x86_64
#sudo PATH=$PATH:~/TOOLS/tophat-2.1.1.Linux_x86_64
#export PATH
#source ~/.bashrc
#cd ~/TOOLS/

##Cufflinks
#wget http://cole-trapnell-lab.github.io/cufflinks/assets/downloads/cufflinks-2.2.1.Linux_x86_64.tar.gz
#cd cufflinks-2.2.1.Linux_x86_64
#tar -xvzf cufflinks-2.2.1.Linux_x86_64.tar.gz
#sudo PATH=$PATH:~/TOOLS/cufflinks-2.2.1.Linux_x86_64
#export PATH
#source ~/.bashrc
#which cufflinks-2 >> LOG.txt

#6-Alineamiento y filogenia
##Instalar MAFFT
sudo apt install mafft --yes
which mafft >> LOG.txt
##Instalar clustalw
sudo apt install clustalw --yes
which clustalw >> LOG.txt
##Instalar clustalx
sudo apt install clustalx --yes
which clustalx >> LOG.txt

#7-Varios propositos
##UGENE(No funciona interfaz gráfica)
#sudo apt install ugene --yes

#which ugene >> LOG.txt
##r ¿? No se pudo usar después de su instalación
sudo apt install r-base-core
which r-base-core >> LOG.txt
##r
sudo apt install r-cran-littler
which r-base-core >> LOG.txt


#Desistalar programas
#sudo apt-get remove Programa
#sudo apt-get remove --auto-remove Programa
#sudo apt-get purge PROGRAMA

#Metagenomica
##Instalar KRAKEN1
##sudo apt install kraken

#Instalar KRAKEN2
#git clone 
git clone --recursive git://github.com/DerrickWood/kraken2.git
cd kraken2
mkdir bin
sudo ./install_kraken2.sh /bin
cd ~/TOOLS/
mkdir 
kraken2-build --standard --threads 32 --db KRAKEN-DB/


#Instalar KRONA
#git clone 
git clone --recursive git://github.com/marbl/Krona.git
cd Krona/KronaTools
sudo ./install.pl

#Install VIP (an integrated pipeline for metagenomics of virus identification and discovery)
git clone --recursive git://github.com/keylabivdc/VIP.git
cd VIP/installer
chmod 755 *
sudo sh dependency_installer.sh #--y --y
sudo sh db_installer.sh -r [PATH]/[TO]/[DATABASE] #Carpeta donde se instalara la base de datos

#127.0.0.1:7922
#Instalar pavian (Metagenomica)
git clone --recursive git://github.com/fbreitwieser/pavian.git
#ejecutar R
#R
#*Instalar pavian en R
#options(repos = c(CRAN = "http://cran.rstudio.com"))
#if (!require(remotes)) { install.packages("remotes") }
#remotes::install_github("fbreitwieser/pavian")
#*Correr pavian:
#pavian::runApp(port=5000)
##Si no funciona o da error de "had non-zero exit status"
#sudo apt-get install curl libssl-dev libcurl4-openssl-dev libxml2-dev

#Instalar Bioconda para Metaplha2
cd ~/TOOLS/
##Descargar conda
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sudo bash Miniconda3-latest-Linux-x86_64.sh
#enter, yes, yes
#cerrar y abrir nuevo terminal
#revisar paquetes:
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
#Ejemplo: instalar bwa (bwa, perl, ca-certificates, openssl, certifi, conda
conda install bwa
#y
##Lista de paquetes:
#https://bioconda.github.io/recipes.html#recipes

#Instalando Metaphlan2
sudo apt install metaphlan2
yes #pemritir generarse base de datos por el script que tarda unos 20 min
#ó por conda 
#conda install -c bioconda metaphlan2 
#pide downgraded python de 3.7 a 2.7 conda-forge
#n

#Instalando fastq-mcf
git clone --recursive git://github.com/ExpressionAnalysis/ea-utils.git

#Analisis de metilación: (PaBio) --
sudo apt-get install kineticstool

######################################################################################################

##RATT
#Descargar de https://ratt.svn.sourceforge.net/svnroot/ratt o
mkdir ratt
cd ratt 
sudo apt install subversion
svn co "https://svn.code.sf.net/p/ratt/code/" ratt-code
sudo cp start.ratt.sh /usr/local/bin
RATT_HOME=~/TOOLS/ratt/; export RATT_HOME
RATT_CONFIG=$RATT_HOME/RATT.config_bac; export RATT_CONFIG
cd ratt-code
sudo cp star.ratt.sh /usr/local/bin/

######################################################################################################

#Herramientas para metagenomas

##VirusDetect
git clone git://github.com/kentnf/VirusDetect.git
###verificar si está isntalado: bwa, samtools, velvet, blast, hisat2
##instalar hisat2
sudo apt install hisat2
##instalar bioperl
sudo apt-get install bioperl
##Prorbar 
perl virus_detect.pl
##Si da error, entonces instalar por cpan lo indicado en la advetencia.
##Cuando funcione apropiadamente virus_detect.pl (mostrar ayuda), entonces copiar en usr/locall/bin
sudo ln  -s  ~/TOOLS/VirusDetect/virus_detect.pl
