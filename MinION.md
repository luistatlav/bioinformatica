# Llamado de bases

## Instalar repositorio de GUPPY (Ubuntu):
```sh
sudo apt-get update
sudo apt-get install wget lsb-release
export PLATFORM=$(lsb_release -cs)
wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | sudo apt-key add -
echo "deb http://mirror.oxfordnanoportal.com/apt ${PLATFORM}-stable non-free" | sudo tee /etc/apt/sources.list.d/nanoporetech.sources.list
sudo apt-get update
```

## Instalar ONT-FAST5: Para visualizar HD5:
```sh
pip install ont-fast5-api
fast5_subset -h
```

## Instalar GUPPY en procesador:
```sh
sudo apt install ont-guppy-cpu
guppy_basecaller --version
```

### Instalar herramientas HDF5:
```sh
sudo apt-get install hdf5-tools
```

### Ver el número de lecturas en el archivo FAST5
´´´sh
h5ls batch1.fast5 | wc -l
h5ls batch10.fast5 | wc -l
h5ls batch151.fast5 | wc -l
h5ls batch170.fast5 | wc -l
´´´

### Inspeccionar FAST5 con guppy_basecaller:
```sh
guppy_basecaller --print_workflows | grep "FLOWCELL" | grep "KIT NAME"
```

### Llamado de bases con guppy_basecaller:
```sh
guppy_basecaller --compress_fastq -i FAST5/ -s FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 -c CONFIG_NAME.cfg
```

### Fusionar outputs:
```sh
cat FASTQ/pass/*.fastq.gz > FASTQ/pass/GUPPY_basecall.fastq.gz
```

### Contabilizar FASTQ:
```sh
zcat FASTQ/pass/GUPPY_basecall.fastq.gz | wc -l | awk '{print $1/4}'
```

# Control de calidad

### Instalar Porechop (en la carpeta TOOLS):
```sh
sudo apt install git
git clone http://github.com/rrwick/Porechop.git
cd Porechop/
make
./porechop-runner.py -h
```

## Instalar FASTQC:
```sh
sudo apt install fastqc
```

## Instalar pycoQC:
```sh
pip install pycoQC
```

## Instalar NanoPlot:
```sh
pip install pycoQC
pip install NanoPlot
```

### Correr Porechop
```sh
time porechop-runner.py -i INPUT.fastq.gz -o OUTPUT_trimming_reads.fastq.gz --verbosity 2
```

### Control de calidad con FASTQC:
```sh
fastqc -t 14 -o OUTPUT/ INPUT.fastq
cd OUTPUT
firefox OUTPUT.html
```

### Control de calidad con NanoPlot:
```sh
fastqc -t 14 -o OUTPUT/ INPUT.fastq
cd OUTPUT
firefox OUTPUT.html
```
