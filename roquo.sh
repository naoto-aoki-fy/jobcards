#!/bin/bash

module purge
module load gcc/14 cuda/13.3 hpcx/2.50

# num_nodes: "$SLURM_JOB_NUM_NODES"
# num_gpus_per_node: "$SLURM_GPUS_ON_NODE"
# num_gpus: "$((SLURM_JOB_NUM_NODES * SLURM_GPUS_ON_NODE))"
# nodelist: "$SLURM_JOB_NODELIST"
# gpus (0,1,2,3): "$SLURM_STEP_GPUS"

mpirun \
  -np "$((SLURM_JOB_NUM_NODES * SLURM_GPUS_ON_NODE))" \
  --map-by ppr:${SLURM_GPUS_ON_NODE}:node \
  ./your_program
