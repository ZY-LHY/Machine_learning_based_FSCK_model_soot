import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from matplotlib import cm
from pandas import read_csv
from matplotlib import rc

############################################
rhs2 = read_csv('results/k_new.dat',  header=None, delimiter=r"\s+").values
rhs2=np.transpose(rhs2) 

XX=np.linspace(0,1,32)
print(rhs2.shape)
############################################
plt.figure(figsize=(5,4))
plt.ylabel(r'k [cm$^{-1}$]',fontdict={'family' : 'serif', 'style':'normal','weight':'bold'})
plt.xlabel(r'g [-]',fontdict={'family' : 'serif', 'style':'normal','weight':'bold'})
plt.semilogy(XX, rhs2, 'g',linestyle=':',marker='x', markersize=3)
plt.tight_layout()
plt.savefig('results/ k-distributions.tif')
############################################
