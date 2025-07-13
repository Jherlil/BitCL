NAME = CLUnitTests

all: $(BINDIR)/clunittest$(EXE_EXT)

$(BINDIR)/clunittest$(EXE_EXT): main.cpp secp256k1test.cl
	cat ../clMath/secp256k1.cl secp256k1test.cl > cltest.cl
	$(BINDIR)/embedcl cltest.cl cltest.cpp _secp256k1_test_cl
	$(CXX) -o clunittest$(EXE_EXT) main.cpp cltest.cpp $(INCLUDE) -I$(OPENCL_INCLUDE) $(CXXFLAGS) $(LIBS) -L$(OPENCL_LIB) -lclutil -lutil -lOpenCL
	mkdir -p $(BINDIR)
	cp clunittest$(EXE_EXT) $@

clean:
	rm -rf *.a *.o clunittest$(EXE_EXT) cltest.cl cltest.cpp
