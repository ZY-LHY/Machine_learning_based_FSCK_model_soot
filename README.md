# A Machine Learning Based Full-spectrum Correlated $k$-distribution Model for Nonhomogeneous Gas–soot Mixtures
# Abstract:
The machine learning based full-spectrum correlated $k$-distribution (FSCK) model previously published by the authors zhou et al. (2020), with a compact model size of only about 35 MB, provides great efficiency and accuracy for the evaluation of radiative transfer in nonhomogeneous gaseous media. However, preceding machine learning FSCK model can not be used for gas–soot mixtures that are found in most combustion scenarios since the training data of the model did not include soot. In addition, prior machine learning FSCK model has not been embedded to any computational fluid dynamics (CFD) platform. In this paper, Multi-layer Perceptron (MLP) neural network was also employed approach to accurately fit the entire FSCK look-up table with a size about 12.45 GB including CO2, CO, H2O and soot. With the increase of training data, it is difficult to choose the tunable hyper-parameters of the machine learning model, such as hidden layers, nodes, alphs and so on. In order to obtain a model with high accuracy, bayesian optimization was introduced to tune the hyper-parameters. After bayesian optimization, the optimal hyper-parameters of the new machine learning based FSCK model can be obtained and capsulated by MODULE in Fortran. Finally, the total size of the new model in Fortran is only 47.1 MB. For improving the radiative heat transfer calculation eﬀiciency and easily embedding the Python model into CFD platform, the forward propagation of the new machine learning based FSCK model was written by Fortran. Finally, the new machine learning model has been successfully implemented into CFD platform and validated by two scaled flames.

# Dependencies:
Compulsory libraries

GNU Fortran

Python

# Quick Start
Instructions (A Machine Learning Based Full-spectrum Correlated $k$-distribution Model for Nonhomogeneous Gas–soot Mixtures):

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
