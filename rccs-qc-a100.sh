#!/bin/bash
#SBATCH --partition=qc-a100
#SBATCH --nodes=2
#SBATCH --gpus-per-task=8

mpirun ./your_program
