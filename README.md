

# Dependencies:
Compulsory libraries

GNU Fortran



# Quick Start：
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
