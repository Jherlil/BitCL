CPPSRC:=$(wildcard *.cpp)

all:
	    ${CXX} -o cudainfo${EXE_EXT} ${CPPSRC} ${INCLUDE} -I${CUDA_INCLUDE} ${CXXFLAGS} ${LIBS} -L${CUDA_LIB} -lcudautil -lcudart
       -mkdir $(BINDIR)
	    cp cudainfo${EXE_EXT} $(BINDIR)/cudainfo${EXE_EXT}

clean:
	rm -rf cudainfo${EXE_EXT}
