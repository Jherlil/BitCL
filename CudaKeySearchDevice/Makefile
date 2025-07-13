NAME = CudaKeySearchDevice
CPPSRC := $(wildcard *.cpp)
CUSRC := $(wildcard *.cu)
CPP_OBJS := $(CPPSRC:.cpp=.o)
CU_OBJS := $(CUSRC:.cu=.cu.o)

all: $(LIBDIR)/lib$(NAME).a

$(LIBDIR)/lib$(NAME).a: $(CPP_OBJS) $(CU_OBJS) cuda_libs.o
	mkdir -p $(LIBDIR)
	ar rvs $@ $^

cuda_libs.o: $(CU_OBJS)
	$(NVCC) -dlink -o $@ $^ -lcudadevrt -lcudart

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) -I$(CUDA_INCLUDE) $(CXXFLAGS)

%.cu.o: %.cu
	$(NVCC) -c $< -o $@ $(NVCCFLAGS) -rdc=true $(INCLUDE) -I$(CUDA_INCLUDE) -I$(CUDA_MATH)

clean:
	rm -f *.o *.cu.o cuda_libs.o
	rm -f *.a
