## Instalar repositorio de GUPPY (Ubuntu):
```sh
sudo apt-get update
sudo apt-get install wget lsb-release
export PLATFORM=$(lsb_release -cs)
wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | sudo apt-key add -
echo "deb http://mirror.oxfordnanoportal.com/apt ${PLATFORM}-stable non-free" | sudo tee /etc/apt/sources.list.d/nanoporetech.sources.list
sudo apt-get update
```

## Instalar GUPPY en procesador:
```sh
sudo apt update
sudo apt install ont-guppy-cpu
```

## Inspeccionar FAST5:
```sh
guppy_basecaller --print_workflows | grep "FLOWCELL" | grep "KIT NAME"
```

## Llamado de bases:
```sh
guppy_basecaller --compress_fastq -i FAST5/ -s FASTQ/ --cpu_threads_per_caller 14 --num_callers 1 -c CONFIG_NAME.cfg
```

## Fusionar outputs:
```sh
cat FASTQ/pass/*.fastq.gz > FASTQ/pass/GUPPY_basecall.fastq.gz
```

## Contabilizar FASTQ
```sh
zcat FASTQ/pass/GUPPY_basecall.fastq.gz | wc -l | awk '{print $1/4}'
```

## Control de calidad con FASTQC
```sh
fastqc -t 14 -o OUTPUT/ INPUT.fastq
cd OUTPUT
firefox OUTPUT.html
```
