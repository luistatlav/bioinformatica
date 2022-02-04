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
```sh
h5ls batch1.fast5 | wc -l
h5ls batch10.fast5 | wc -l
h5ls batch151.fast5 | wc -l
h5ls batch170.fast5 | wc -l
```

### Inspeccionar FAST5 con guppy_basecaller:
Buscar en el archivo: "Final_summary_....txt" la celda y el kit
```sh
guppy_basecaller --print_workflows | grep "FLOWCELL" | grep "KIT NAME"
```

### Llamado de bases con guppy_basecaller (por defecto: High Accuracy (HAC); Q-score: ON; en ARN cambiar U a T: OFF):
```sh
guppy_basecaller --compress_fastq -i INPUT_FAST5/ -s OUTPUT_FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 -c CONFIG_NAME.cfg
```
si son muchos subfolders:
```sh
guppy_basecaller --compress_fastq -i INPUT_FAST5/ --recursive -s OUTPUT_FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 -c CONFIG_NAME.cfg
```
ó
```sh
guppy_basecaller --compress_fastq -i INPUT_FAST5/ -s OUTPUT_FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 --flowcell FLOCELL_Version --kit KIT_version
```
ó
```sh
ls INPUT_FAST5/*.fast5 | guppy_basecaller --save_path OUTPUT_FASTQ/ --config CONFIG_NAME.cfg
```
ó BARCODING en simultaneo
```sh
guppy_basecaller --compress_fastq --input_path INPUT_FAST5/ --save_path OUTPUT_FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 -c CONFIG_NAME.cfg --barcode_kits SQK-RBK001
```

### Barcoding/demultiplexing:
```sh
guppy_barcoder --print_kits
guppy_barcoder --input_path INPUT_FASTQ/ --save_path OUTPUT_FASTQ/ --config CONFIG_NAME.cfg
```
ó
```sh
guppy_barcoder --input_path INPUT_FASTQ/ --save_path OUTPUT_FASTQ/ --config CONFIG_NAME.cfg --barcode_kits SQK-RPB004
```

### Eliminar barcodes
```sh
guppy_barcoder --input_path INPUT_FASTQ/ --save_path OUTPUT_FASTQ/ --config CONFIG_NAME.cfg --trim_barcodes
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
