BUILD_DIR ?= build_local

BUILD_OPTIONS = -j 4

CMAKE_GENERATOR = Ninja

# PNETCDF_INC_DIR := $(shell dirname $$(locate -br pnetcdf.h$$))
PNETCDF_INC_DIR := /usr/include

# PNETCDF_LIB_DIR := $(shell dirname $$(locate -br libpnetcdf.so$$))
PNETCDF_LIB_DIR := /usr/lib/x86_64-linux-gnu

CMAKE_OPTIONS = \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCXXFLAGS="-Wall -Wextra -O2 -march=native -I$(PNETCDF_INC_DIR)" \
    -DLDFLAGS="-L$(PNETCDF_LIB_DIR) -lpnetcdf" \
    -DOPENMP_FLAGS=-fopenmp \
    -DOPENMP45_FLAGS=-fopenmp \
    -DNX=400 \
    -DNZ=200 \
    -DSIM_TIME=100

include ../CMake.mk

test: $(BUILD_DIR)/check_output.sh

$(BUILD_DIR)/check_output.sh:
	ln -sf ../build/$(@F) $@
