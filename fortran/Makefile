BUILD_DIR ?= build_local

BUILD_OPTIONS = -j 4

CMAKE_GENERATOR = Ninja

# PNETCDF_INC_DIR := $(shell dirname $$(locate -br pnetcdf.mod$$))
PNETCDF_INC_DIR := /usr/lib/x86_64-linux-gnu/fortran/gfortran-mod-15

# PNETCDF_LIB_DIR := $(shell dirname $$(locate -br libpnetcdf.so$$))
PNETCDF_LIB_DIR := /usr/lib/x86_64-linux-gnu

CMAKE_OPTIONS = \
    -DCMAKE_Fortran_COMPILER=mpif90 \
    -DFFLAGS="-Wall -Wextra -O2 -march=native -ffree-line-length-none -I$(PNETCDF_INC_DIR)" \
    -DLDFLAGS="-L$(PNETCDF_LIB_DIR) -lpnetcdf" \
    -DOPENACC_FLAGS=-fopenacc \
    -DOPENMP_FLAGS=-fopenmp \
    -DOPENMP45_FLAGS=-fopenmp \
    -DNX=400 \
    -DNZ=200 \
    -DSIM_TIME=100

include CMake.mk

test: $(BUILD_DIR)/check_output.sh

$(BUILD_DIR)/check_output.sh:
	ln -sf ../build/$(@F) $@
