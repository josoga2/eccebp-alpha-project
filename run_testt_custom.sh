#!/bin/sh -e 

DIR=`dirname $0`

# -----------------------------------------------------
# Location of programs used by triplex inspector
# -----------------------------------------------------
# triplex-inspector
INSPECTOR=/home/josoga2/Documents/ecebpa/analysis/probes_mut_met
# triplexator executable
TRIPLEXATOR=/home/josoga2/Downloads/triplexator-1.3.2-Linux/bin/triplexator
# cicos executable
CIRCOS=/home/josoga2/Downloads/software/circos/circos-0.69-9
# BEDtools folder containing the executables
BEDTOOLS=/home/josoga2/bedtools2/bin/

# -----------------------------------------------------
# Location of the data
# -----------------------------------------------------
# annotation file
ANNOTATION=/home/josoga2/rgtdata/hg19/gencode.v19.annotation.gtf
# genome in fasta format
GENOME=/home/josoga2/rgtdata/hg19/genome_hg19.fa
# chromosome sizes
GENOMESIZE=/home/josoga2/rgtdata/hg19/chrom.sizes.hg19
# region of interest
TARGETREGION=/home/josoga2/Documents/ecebpa/analysisv.5/probes_mut_met/probes_mut_met_bed.bed

# -----------------------------------------------------
# Location where the results are expected
# -----------------------------------------------------
RESULTS=${DIR}/results

# -----------------------------------------------------
# Parameters
# -----------------------------------------------------
# setting for primary targets
TTSOPTIONS="--lower-length-bound 10 --consecutive-errors 1 --error-rate 20 --runtime-mode 2 --output-format 0 --filter-repeats off --filtering-mode 0 -ssd on -mpmg 40"
# setting for off-targets (relaxed constraints)
TPXOPTIONS="--lower-length-bound 10 --consecutive-errors 1 --error-rate 10 --runtime-mode 2 --output-format 0 --filter-repeats off --filtering-mode 0"

# -----------------------------------------------------
# test-related preparations
# -----------------------------------------------------
# extract test data
#[ ! -d ${DIR}/data ] && tar xf ${DIR}/data.tar.gz

# -----------------------------------------------------
# start triplex inspector
# -----------------------------------------------------
${INSPECTOR}/run_inspector.sh \
	-g ${GENOME} \
	-s ${GENOMESIZE} \
	-1 ${TARGETREGION} \
	-a ${ANNOTATION} \
	-B ${BEDTOOLS} \
	-T ${TRIPLEXATOR} \
	-l "${TTSOPTIONS}" \
	-o "${TPXOPTIONS}" \
	-v \
	${RESULTS}
	
	
# -----------------------------------------------------
# finished
# -----------------------------------------------------
echo "Hooray! Everything went through smoothly!"
