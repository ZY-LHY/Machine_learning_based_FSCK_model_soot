# A Machine Learning Based Full-spectrum Correlated k-distribution Model for Nonhomogeneous Gas–soot Mixtures
# Abstract:
The machine learning based full-spectrum correlated k-distribution (FSCK) model previously developed by Zhou et al.~(2020), provides a compact prediction model with good efficiency and accuracy for the evaluation of radiative spectral calculations in nonhomogeneous gaseous media. However, the model is only for gas mixture of CO2, CO, H2O, and cannot be used for gas–soot mixtures that are found in most combustion scenarios. In addition, the previous machine learning based-FSCK model was trained in Python and requires several Python packages to run the model for radiative heat transfer calculations, which limits its portability to other computational fluid dynamics (CFD) platforms. In this paper, a new machine learning based-FSCK model is developed for the radiatively participating species CO2, H2O, CO, and soot, by accurately fitting the gas–soot FSCK look-up table. Major improvements include: (1) The Bayesian optimization method is used to select optimal hyperparameters of the machine learning model; (2) The developed machine learning based-FSCK model now includes gas-soot mixtures, but with a smaller model size of 47.1 MB, which is significantly smaller than the original gas–soot FSCK look-up table of Wang et al.~(2018), with a size of 12.45 GB; (3) The machine learning based-FSCK model is now in stand-alone Fortran modules, which make it easier to be implemented into other CFD platforms. The new model has been successfully implemented in OpenFOAM and tested with two scaled flames.

# Dependencies:
Compulsory libraries

GNU Fortran



# Quick Start
Instructions (A Machine Learning Based Full-spectrum Correlated k-distribution Model for Nonhomogeneous Gas–soot Mixtures):

!-The program is used to calculate k-distributions (32 Gaussa Chebyshev quadrature points)

!-The thermodynamic states for the gas mixture profiles with soot can be changed in "Main.f90":

Clean up
command: make clean

Compile the Fortran program
command: make

Get the k-distributions:
command: ./rhs

Plot the results
command: python plot.py
