#!/bin/bash
#PJM -L "rscgrp=regular-a"
#PJM -L "elapse=xx:xx:xx"
#PJM -g mygroup
#PJM -L "node=8"
#PJM --mpi "proc=64"
set -euo pipefail

module load nvidia/25.9
module load nvmpi/25.9

export OMP_NUM_THREADS=1
export OMPI_MCA_plm_rsh_agent=/bin/pjrsh
export OMPI_MCA_orte_default_hostfile="${PJM_O_NODEINF}"

# num_procs: $PJM_MPI_PROC
# num_nodes: "$PJM_VNODE"
# or
# num_nodes: "$(wc -l < "$PJM_O_NODEINF")"
# procs per node (ppn): "$PJM_PROC_BY_NODE"

mpiexec \
    -n "${PJM_MPI_PROC}" \
    --map-by ppr:"${PJM_PROC_BY_NODE}":node \
    --bind-to none \
    ./your_program
