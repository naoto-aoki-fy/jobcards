#!/bin/bash
#SBATCH --partition=qc-a100
#SBATCH --nodes=2
#SBATCH --gpus=16
#SBATCH --ntasks-per-node=8
#SBATCH --gpus-per-task=8

mpirun ./your_program
