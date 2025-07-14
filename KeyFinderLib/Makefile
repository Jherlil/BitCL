NAME = keyfinder
CPPSRC := $(wildcard *.cpp)
OBJS := $(CPPSRC:.cpp=.o)

all: $(LIBDIR)/lib$(NAME).a

$(LIBDIR)/lib$(NAME).a: $(OBJS)
	-mkdir $(LIBDIR)
	ar rvs $@ $^

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) -I$(CUDA_INCLUDE) $(CXXFLAGS)

clean:
	rm -f *.o *.cu.o
	rm -f *.a
