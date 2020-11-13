#!bin/bash
# TDF command
rgt-TDF regiontest -r nfixedout.fa -bed bindingBed_01.bed -f background.bed -fr off -rn ecCEBPA -organism hg19 -o genomic_region_test/ecCEBPA -n 100 -l 10 -e 20 -c 2

# IntersectBed
sort -k 1,1 -k2,2n imargi_genomic.bed
intersectBed -b imargi_genomic.bed -a ecCEBPA.bed > out.bed
intersectBed -a imargi_genomic.bed -b triplexatorBinding -loj > out.bed

# Subtract Bed
bedtools subtract -a chromosome.bed -b nobindingBed.bed > background.bed #both are sorted



