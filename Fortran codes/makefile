FC = gfortran -fmax-array-constructor=10000000

### FLAGS ###
SHAREDLIBFLAGS = -shared  -fPIC
FC_FREEFORM = -ffree-form
FC_CHECKBOUNDS = -fcheck=bounds
FC_CONVERT = -fconvert=little-endian
FC_STD = -std=f2003

FCFLAGS = $(FC_FREEFORM) $(FC_CHECKBOUNDS) $(FC_CONVERT) $(SHAREDLIBFLAGS) $(FC_STD) 
LDFLAGS = -L/usr/lib/x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/4.6.3 -ldl -lgfortran

EXE = rhs

# SRCS settings

FILES = MLP_structure_1.f90 
FILES = MLP_structure_2.f90 
FILES = MLP_structure_3.f90

OBJS  = commonData.o MLP_structure_1.o MLP_structure_2.o MLP_structure_3.o MLP_layer.o MLP_network.o MLP.o Main.o

all: $(EXE)

$(EXE): $(OBJS)
	$(FC) $(LDFLAGS) -o $(EXE) $(OBJS)

%.o: $(SPATH)/%.f90
	$(FC) $(FCFLAGS) -c $(SPATH)/$*.f90
%.o: %.f90
	$(FC) $(FCFLAGS) -c $*.f90

clean:
	-rm -f $(EXE) $(OBJS) *.mod *.o


