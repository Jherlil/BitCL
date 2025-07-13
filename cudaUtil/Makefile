NAME = cudautil
SRC  := $(wildcard *.cpp)
OBJS := $(SRC:.cpp=.o)

all: $(LIBDIR)/lib$(NAME).a

$(LIBDIR)/lib$(NAME).a: $(OBJS)
       -mkdir $(LIBDIR)
	ar rvs $@ $^

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) -I$(CUDA_INCLUDE) $(CXXFLAGS)

clean:
	rm -rf *.o
