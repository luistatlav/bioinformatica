# bcftools
>$ bcftools mpileup -Ou -f REFERENCIA.fasta SORTED.bam | bcftools call -v -c --ploidy 1 -Ob > OUTPUT.bcf
## Convertir BCF (binario) a VCF (Variant Call Format)
>$ bcftools view -H NV.bcf -Oz > OUTPUT.vcf.gz
## Indexar antes de ver en Artemis
> $ tabix OUTPUT.vcf.gz

# Filogenia de SNPs del Genoma completo 
(Ver Manual del Wellcome Trust 2019, página 47)
>$ bcftools mpileup -Ou --skip-indels -f REFERENCIA.fasta ../Mapping/SORTED.bam | bcftools call -v -c --ploidy 1 -Ob > OUTPUT_new.bcf

>$ bcftools index OUTPUT_new.bcf

>$ samtools faidx REFERENCIA.fasta AM884176.1 | bcftools consensus OUTPUT_new.bcf > OUTPUT_WGS.fasta

>$ perl -i -pe 's/AM884176\.1/NV/g' NV_WGS.fasta
