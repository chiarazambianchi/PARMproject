#!/bin/bash

# Check if a config file is passed as an argument
if [ "$#" -ne 1 ]; then
  echo "Usage: bash cmd.sh <config_file>"
  exit 1
fi

# Assign the passed argument to CONFIG
CONFIG="$1"

DRYRUN=""
#DRYRUN="--dryrun "

DATETAG="NK$( date +"%y%m%d_%Hh%Mm%Ss" )"
SNAKEFILE=/DATA/usr/n.klaassen/projects/SuRE_Promoter/src/Vini_Folds_Pipeline/Snakefile
LOGDIR="log"
LOG="${CONFIG%.yml}_run-${DATETAG}.log"
mkdir -p "${LOGDIR}"
LOGFILE="${LOGDIR}/${LOG}"
CONDA="conda"
CONDA_DIR="/DATA/usr/n.klaassen/projects/SuRE_Promoter/src/SuRE-CNN-Preprocessing-Pipeline-conda-env"

CMD="/usr/bin/time -v nice -19 snakemake "${DRYRUN}"-prs "${SNAKEFILE}" --use-conda --conda-prefix "${CONDA_DIR}" --conda-frontend "${CONDA}" --resources ram=200 --configfile "${CONFIG}" --cores 50 &> "${LOGFILE}""
echo "${CMD}"
eval ${CMD}

