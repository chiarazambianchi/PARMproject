# PARMproject
Repository containing files, scripts and explanations using my internship in BvS lab (April-August 2025)

E2775 data analysis: 
To run the count pipeline (1 step of PARM preprocessing, instead of XX use the appopriate config file ):
snakemake --configfile config_counts_XX.yaml --use-conda --cores 50 --resources mem_mb=300 --printshellcmds --snakefile /DATA/usr/v.franceschini/GitHub/process_focused_library/Snakefile

To sum the pDNA files (2 step of PARM preprocessing, copy the script in the folder created by the previous step): 
bash sum_pDNA_CZ20250414.sh

To normalise and divide in folds (3 step of PARM preprocessing, in the main folder):
bash cmd_folds.sh Config_Folds_MH4_PC9_dmso_gef_sch77_20250423.yaml 

The data that is produced from this pipeline is used bith for SuRE measured count analysis (Scripts in SuRE_Analysis) and for training PARM model (downstream analysis in PARM ANALYSIS script). 

To further details on PARM model training https://github.com/vansteensellab/PARM
