NAME = CLKeySearchDevice
CPPSRC := $(wildcard *.cpp)
OBJS := $(CPPSRC:.cpp=.o) bitcrack_cl.o

all: $(LIBDIR)/lib$(NAME).a

bitcrack_cl.cpp: ../clMath/sha256.cl ../clMath/secp256k1.cl ../clMath/ripemd160.cl keysearch.cl
	cat $^ > bitcrack.cl
	$(BINDIR)/embedcl bitcrack.cl $@ _bitcrack_cl

$(LIBDIR)/lib$(NAME).a: $(OBJS)
	-mkdir $(LIBDIR)
	ar rvs $@ $^

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) -I$(OPENCL_INCLUDE) $(CXXFLAGS)

clean:
	rm -rf *.a *.o bitcrack.cl bitcrack_cl.cpp
