NAME = clutil
SRC  := $(wildcard *.cpp)
OBJS := $(SRC:.cpp=.o)

all: $(LIBDIR)/lib$(NAME).a

$(LIBDIR)/lib$(NAME).a: $(OBJS)
	mkdir -p $(LIBDIR)
	ar rvs $@ $^

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) -I$(OPENCL_INCLUDE) $(CXXFLAGS)

clean:
	rm -rf *.o