# Prepare HPC-ready VM

The script installs/sets up the following:

- Update memory limits
- Enable `zone_reclaim` mode
- Install Development tools and pre-reqs for MPI installations
- Install Mellanox OFED (4.5-1.0.1.0-rhel7.6-x86_64)
- Install WALinuxAgent (2.2.38)
- Setp IPoIB
- Install gcc v8.2
- Install MPI Libraries as modules
  - MVAPICH2 2.3
  - MPICH 3.3
  - HPC-X
  - OpenMPI 4.0.0
 
 # Run scripts:
 Run `./setup_node.sh`
