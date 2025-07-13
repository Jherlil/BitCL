
CUR_DIR:=$(CURDIR)
DIRS=util AddressUtil CmdParse CryptoUtil KeyFinderLib CLKeySearchDevice CudaKeySearchDevice cudaMath clUtil cudaUtil secp256k1lib Logger embedcl

INCLUDE = $(foreach d, $(DIRS), -I$(CUR_DIR)/$d)

LIBDIR=$(CUR_DIR)/lib
BINDIR=$(CUR_DIR)/bin
LIBS+=-L$(LIBDIR)

# C++ options
EXE_EXT ?=
CXX=g++
CXXFLAGS=-O3 -std=c++11
ifeq ($(MINGW),1)
EXE_EXT=.exe
CXX=x86_64-w64-mingw32-g++
NVCC=nvcc -ccbin $(CXX)
CXXFLAGS+=-static
LIBS+=-static-libstdc++ -static-libgcc
else
CXXFLAGS+=-march=native
endif
BUILD_OPENCL ?= 1
BUILD_CUDA ?= 0


# CUDA variables
COMPUTE_CAP=30
NVCC=nvcc
NVCCFLAGS=-std=c++11 -gencode=arch=compute_${COMPUTE_CAP},code=\"sm_${COMPUTE_CAP}\" -Xptxas="-v" -Xcompiler "${CXXFLAGS}"
CUDA_HOME=/usr/local/cuda
CUDA_LIB=${CUDA_HOME}/lib64
CUDA_INCLUDE=${CUDA_HOME}/include
CUDA_MATH=$(CUR_DIR)/cudaMath

# OpenCL variables
OPENCL_LIB=${CUDA_LIB}
OPENCL_INCLUDE=${CUDA_INCLUDE}
OPENCL_VERSION=110

export INCLUDE
export LIBDIR
export BINDIR
export NVCC
export NVCCFLAGS
export LIBS
export CXX
export CXXFLAGS
export EXE_EXT
export CUDA_LIB
export CUDA_INCLUDE
export CUDA_MATH
export OPENCL_LIB
export OPENCL_INCLUDE
export BUILD_OPENCL
export BUILD_CUDA

TARGETS=dir_addressutil dir_cmdparse dir_cryptoutil dir_keyfinderlib dir_keyfinder dir_secp256k1lib dir_util dir_logger dir_addrgen

ifeq ($(BUILD_CUDA),1)
	TARGETS:=${TARGETS} dir_cudaKeySearchDevice dir_cudautil
endif

ifeq ($(BUILD_OPENCL),1)
	TARGETS:=${TARGETS} dir_embedcl dir_clKeySearchDevice dir_clutil dir_clunittest
	CXXFLAGS:=${CXXFLAGS} -DCL_TARGET_OPENCL_VERSION=${OPENCL_VERSION}
endif

all:	${TARGETS}

dir_cudaKeySearchDevice: dir_keyfinderlib dir_cudautil dir_logger
	mingw32-make --directory CudaKeySearchDevice

dir_clKeySearchDevice: dir_embedcl dir_keyfinderlib dir_clutil dir_logger
	mingw32-make --directory CLKeySearchDevice

dir_embedcl:
	mingw32-make --directory embedcl

dir_addressutil:	dir_util dir_secp256k1lib dir_cryptoutil
	mingw32-make --directory AddressUtil

dir_cmdparse:
	mingw32-make --directory CmdParse

dir_cryptoutil:
	mingw32-make --directory CryptoUtil

dir_keyfinderlib:	dir_util dir_secp256k1lib dir_cryptoutil dir_addressutil dir_logger
	mingw32-make --directory KeyFinderLib

KEYFINDER_DEPS=dir_keyfinderlib

ifeq ($(BUILD_CUDA), 1)
	KEYFINDER_DEPS:=$(KEYFINDER_DEPS) dir_cudaKeySearchDevice
endif

ifeq ($(BUILD_OPENCL),1)
	KEYFINDER_DEPS:=$(KEYFINDER_DEPS) dir_clKeySearchDevice
endif

dir_keyfinder:	$(KEYFINDER_DEPS)
	mingw32-make --directory KeyFinder

dir_cudautil:
	mingw32-make --directory cudaUtil

dir_clutil:
	mingw32-make --directory clUtil

dir_secp256k1lib:	dir_cryptoutil
	mingw32-make --directory secp256k1lib

dir_util:
	mingw32-make --directory util

dir_cudainfo:
	mingw32-make --directory cudaInfo

dir_logger:
	mingw32-make --directory Logger

dir_addrgen:	dir_cmdparse dir_addressutil dir_secp256k1lib
	mingw32-make --directory AddrGen
dir_clunittest:	dir_clutil
	mingw32-make --directory CLUnitTests

clean:
	mingw32-make --directory AddressUtil clean
	mingw32-make --directory CmdParse clean
	mingw32-make --directory CryptoUtil clean
	mingw32-make --directory KeyFinderLib clean
	mingw32-make --directory KeyFinder clean
	mingw32-make --directory cudaUtil clean
	mingw32-make --directory secp256k1lib clean
	mingw32-make --directory util clean
	mingw32-make --directory cudaInfo clean
	mingw32-make --directory Logger clean
	mingw32-make --directory clUtil clean
	mingw32-make --directory CLKeySearchDevice clean
	mingw32-make --directory CudaKeySearchDevice clean
	mingw32-make --directory embedcl clean
	mingw32-make --directory CLUnitTests clean
	rm -rf ${LIBDIR}
	rm -rf ${BINDIR}
