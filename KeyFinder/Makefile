CPPSRC:=$(wildcard *.cpp)

all:
ifeq ($(BUILD_CUDA), 1)
	${CXX} -DBUILD_CUDA -o cuKeyFinder${EXE_EXT} ${CPPSRC} ${INCLUDE} -I${CUDA_INCLUDE} ${CXXFLAGS} ${LIBS} -L${CUDA_LIB} -lkeyfinder -laddressutil -lsecp256k1 -lcryptoutil -lsecp256k1 -lcudautil -llogger -lutil -lCudaKeySearchDevice -lcudadevrt -lcudart -lcmdparse
-mkdir $(BINDIR)
	cp cuKeyFinder${EXE_EXT} $(BINDIR)/cuBitCrack${EXE_EXT}
endif
ifeq ($(BUILD_OPENCL),1)
	${CXX} -DBUILD_OPENCL -o clKeyFinder${EXE_EXT} ${CPPSRC} ${INCLUDE} -I${OPENCL_INCLUDE} ${CXXFLAGS} ${LIBS} -L${OPENCL_LIB} -lkeyfinder -laddressutil -lsecp256k1 -lcryptoutil -lsecp256k1 -lCLKeySearchDevice -lclutil -lOpenCL -llogger -lutil -lcmdparse
-mkdir $(BINDIR)
	cp clKeyFinder${EXE_EXT} $(BINDIR)/clBitCrack${EXE_EXT}
endif

clean:
	rm -rf cuKeyFinder${EXE_EXT}
	rm -rf clKeyFinder${EXE_EXT}
