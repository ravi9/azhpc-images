# Prepare HPC-ready VM

The script installs/sets up the following:

- Update memory limits
- Update ssh config
- Enable `zone_reclaim` mode
- Install Development tools and pre-reqs for MPI installations
- Install Mellanox OFED
- Install WALinuxAgent
- Setp IPoIB
- Install gcc v8.2
- Install MPI Libraries as modules
  - MVAPICH2 2.3
  - MPICH 3.3
  - HPC-X
  - OpenMPI 4.0.0
 
 # Run scripts:
 Run `./setup_node.sh`
