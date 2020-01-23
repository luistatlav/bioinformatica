# DYNAMICTRIM (Estricto)
>$ Dynamictrim.pl READS_01.fastq
## Visualizar PDF
>$ evidence READS01.fastq.trimmed_segments.hits.pdf
## Verificar reporte y comparar tamaño previo y nuevo
>$ ls -la ../FASTQS/ #Originales

>$ ls -la #Final

# TRIM GALORE (No siempre elimina por completo los adaptadores)
> $ trim_galore --fastqc --paired --retain_unpaired READS_01.fastq.gz READS_02.fastq.gz

> $ trim_galore --fastqc --paired --retain_unpaired --q 28 --lenght_1 40 --length_2 40 READS_01.fastq.gz READS_02.fastq.gz --output_dir TRIM_GALORE/READS_paired_50
## Ver contenido del zip
>$ unzip READS_01.zip

>$ eog inflating: READS01/Images/kmer_profile.png
## Comparar los archivos output
### archivos val: Archivos que si pasaron
### archivos unpair: Archivos que no pasaron, pero podrían ser buenos.

# TRIMMOMATIC 
Recorta más, No corre los 3 programas, no da resultados gráficos
>$ trimmomatic PE -trimlog infoTrim READS_01.fastq READS_02.fastq READS_01.Tp.fastq READS_01.Tu.fastq READS_02.Tp.fastq READS_02.tu, 
fastq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 Milen:3:6

# SICKLE
> $ sickle pe -g -t sanger -f READS_01.fastq.gz -r READS_02.fastq.gz -o READS_01-trim.fastq.gz -p READS_02-trim.fastq.gz -s READS-singles.fastq.gz-q 28

>$ sickle pe -f READS_01.fastq -r READS_02.fastq -t sanger -o trimmed_output_READS_01.fastq -p trimmed_output_READS_02.fastq -s trimmed_singles_READS.fastq

>$ sickle pe -f READS_01.fastq -r READS_02.fastq -t sanger -o trimmed_output_READS_01.fastq -p trimmed_output_READS_02.fastq -s trimmed_singles_READS.fastq -q 12 -l 15

>$ sickle pe -f READS_01.fastq -r READS_02.fastq -t sanger -o trimmed_output_READS_01.fastq -p trimmed_output_READS_02.fastq -s trimmed_singles_READS.fastq -n

>$ sickle pe -c combo.fastq -t sanger -m combo_trimmed.fastq -s trimmed_singles_file.fastq -n

>$ sickle pe -t sanger -g -f READS_01.fastq -r input_READS_02.fastq -o trimmed_output_READS_01.fastq.gz -p trimmed_output_READS_02.fastq.gz -s trimmed_singles_READS.fastq.gz

>$ sickle pe -c combo.fastq -t sanger -M combo_trimmed_all.fastq


