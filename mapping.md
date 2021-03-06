# BOWTIE2 (global y local)

## Indexar referencia
>$ bowtie2-build REFERENCIA.fasta REFERENCIA

## Correr bowtie2
>$ bowtie2 --no-unal -x REFERENCIA -1 READ_01.fastq -2 READ_02.fastq -S OUTPUT.sam

## En modo local para no perder información
>$ bowtie2 --local --no-unal -x REFERENCIA -1 READ_01.fastq -2 READ_02.fastq -S OUTPUT.sam

## Ver resultados: Cuantas lecturas alinearon
>$ grep -c -P '\t99\t|\t147\t|\t163\t|\t83\t|\t73\t|\t137\t|\t89\t|\t153\t'
OUTPUT.sam

# SMALT (para genomas grandes, local, no da el resultado tan bonito)

## Indexar referencia
>$ smalt index -k 13 -S 5 REFERENCIA REFERENCIA.fasta

## Mapeo
>$ smalt map -o OUTPUT.sam REFERENCIA READ_01.fastq READ_02.fastq

## Mapeo más estricto (opcional)
>$ smalt map -x -c 100 -o OUTPUT.sam REFERENCIA READ_01.fastq READ_02.fastq

## Ver resultados: Cantidad de lecturas alinearon
>$ grep -c -P '\t99\t|\t147\t|\t163\t|\t83\t|\t73\t|\t137\t|\t89\t|\t153\t'
OUTPUT.sam

# BWA

## Indexar
>$ bwa index REFERENCIA.fasta

## Para segmentos largos
>$ bwa mem REFERENCIA.fasta READ_01.fastq.gz READ_02.fastq.gz > OUTPUT.sam

>$ bwa aln REFERENCIA.fasta READ_01.fastq > OUTPUT.sai

>$ bwa samse REFERENCIA.fasta OUTPUT.sai READ_01.fastq > OUTPUT-se.sam

>$ bwa samse REFERENCIA.fasta OUTPUT_01.sai READ_01.fastq OUTPUT_02.sai READ_02.fastq > OUTPUT-pe.sam

>$ bwa bwasw REFERENCIA.fasta Long_READ.fastq > OUTPUT.SAM

## Para Nanopore (MinION):
>$ bwa mem -t 14 -x ont2d ~/workdir/assembly/assembly.contigs.fasta ~/workdir/basecall/ONT.fastq.gz | samtools view - -Sb | samtools sort - -@14 > ~/workdir/nanopore_mapping/mapping.sorted.bam

>$ samtools index ~/workdir/nanopore_mapping/mapping.sorted.bam

# SAMTOOLS
## Pasar de SAM a BAM
>$ samtools view -S -b -q 30 OUTPUT.sam > OUTPUT.bam

>$ samtools view -bSo OUTPUT.bam OUTPUT.sam

>$ samtools view -F 0x04 -c OUTPUT.bam
## Descartar reads menores de 15 de quality score
>$ samtools view -q 15 -b -o OUTPUT.bam OUTPUT.sam
## Ordenar archivos
>$ samtools sort OUTPUT.bam SORTED.bam

>$ samtools sort OUTPUT.bam -o SORTED.bam

>$ samtools sort -o SORTED.bam OUTPUT.bam
## Indexar bam
>$ samtools index SORTED.bam
## Visualizar
>$ samtools tview SORTED.bam REFERENCIA.fasta
## Obtener lecturas mapeadas:
>$ mkdir mapeadas

>$ samtools view -F 4 OUTPUT.sam -h -b -o mapeadas/OUTPUT.bam
## Obtener lecturas no mapeadas:
>$ mkdir NoMapeadas

>$ samtools view -f 4 OUTPUT.sam -h -b -o NoMapeadas/OUTPUT.bam
## Conversion de formato bam a fastq:
>$ java -jar /opt/picard.jar SamToFastq I=mapeadas/OUTPUT.bam F=mapeadas/READ_01_mapeadas.fastq F2=mapeadas/READ_02_mapeadas.fastq FU=mapeadas/READ_unpaired.fastq VALIDATION_STRINGENCY=LENIENT
rm -rf mapeadas/*_unpaired.fastq

>$ java -jar /opt/picard.jar SamToFastq I=NoMapeadas/OUTPUT.bam F=NoMapeadas/READ_01_NoMapeadas.fastq F2=NoMapeadas/READ_02_NoMapeadas.fastq FU=NoMapeadas/READ_unpaired.fastq VALIDATION_STRINGENCY=LENIENT
rm -rf mapeadas/*_unpaired.fastq

# weeSAM (evaluar QC del mapeo)
## Generar html
>$ weeSAM --bam SORTED.bam --html SORTED.weeSAM --out SORTED.weeSAM
## Visualizar con firefox

>$ firefox SORTED_html_result/SORTED.html &
