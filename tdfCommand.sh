#!bin/bash
# TDF command
rgt-TDF regiontest -r nfixedout.fa -bed bindingBed_01.bed -f background.bed -fr off -rn ecCEBPA -organism hg19 -o genomic_region_test/ecCEBPA -n 100 -l 10 -e 20 -c 2
