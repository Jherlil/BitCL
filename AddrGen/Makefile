CPPSRC := $(wildcard *.cpp)

all:
	$(CXX) -o addrgen$(EXE_EXT) $(CPPSRC) $(INCLUDE) -I$(CUDA_INCLUDE) $(CXXFLAGS) $(LIBS) -laddressutil -lsecp256k1 -lcryptoutil -lsecp256k1 -lutil -lcmdparse
       -mkdir $(BINDIR)
	cp addrgen$(EXE_EXT) $(BINDIR)/addrgen$(EXE_EXT)

clean:
	rm -rf addrgen$(EXE_EXT)
