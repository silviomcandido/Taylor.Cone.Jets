# TaylorConeJet
Automated script using .m4 files to generate a 2D axis-symmetric or Full 3D simulation of a Taylor Cone Jet

Overview
========
+ Template case for axisymmetric EHD jet flow
+ Template case for Full 3D EHD jet flow
+ The main purpose of this template is to demonstrate a simple, reliable meshing
  strategy for axisymmetric flow
+ These templates are intended to run with the solver interFoamEHD and interIsoFoamEHD developed by S. Cândido, if interested in the model please feel free to contact me!

Meshing of the 2D Axisymmetric
=======
+ The blockMeshDict file contains a backgroundMesh subditionary
+ In backgroundMesh set the geometry radius and length and jet radius
+ Set the number of cells in the length and radial directions
+ Run blockMesh to generate a 2D "domain" mesh
+ Run extrudeMesh to convert the mesh into a 2D axisymmetric mesh with wedge
  front and back patches

Initialisation
==============
+ In the field files in the 0 directory, set inlet values
+ For example, in 0/U, set the inlet velocity Uinlet
+ Set the electrohydrodynamic properties in constant/transportProperties

Output
======
+ Graph data of field values along the centreline are written to files in
  postProcessing/graph

Cite
======
+ 2D Axisymmetric
  + S. Cândido, J. C. Páscoa, On modal decomposition as surrogate for charge-conservative EHD modelling of Taylor Cone jets, International Journal of Engineering Science, 2023. https://doi.org/10.1016/j.ijengsci.2023.103947
+ Full 3D
  + S. Cândido, J. C. Páscoa, Dynamics of three-dimensional electrohydrodynamic instabilities on Taylor cone jets using a numerical approach, Physics of Fluids, 2023. https://doi.org/10.1063/5.0151109
+ Coupled isoAdvector with EHD
  + S. Cândido, J. C. Páscoa, Numerical Simulation of Electrified Liquid Jets Using a Geometrical VoF Method, International Mechanical Engineering Congress and Exposition, Virtual, Online. 2021 https://doi.org/10.1115/imece2021-69817
