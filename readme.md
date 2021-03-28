# A machine learning based full-spectrum correlated k-distribution model for nonhomogeneous gas–soot mixtures
# Abstract：



# Dependencies:
Compulsory libraries

GNU Fortran

Python


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

# Citation

@article{ML:Zwr21,

title = {A machine learning based full-spectrum correlated k-distribution model for nonhomogeneous gas-soot mixtures},

journal = {Journal of Quantitative Spectroscopy and Radiative Transfer},

year = {2021},

author = {Ya Zhou and Chaojun Wang and Tao Ren and Changying Zhao}.

}


@article{ML:Zwr20,

title = {A machine learning based efficient and compact full-spectrum correlated $k$-distribution model},

journal = {Journal of Quantitative Spectroscopy and Radiative Transfer},

year = {2020},

author = {Ya Zhou and Chaojun Wang and Tao Ren},

}

