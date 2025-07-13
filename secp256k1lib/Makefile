NAME = secp256k1
SRC  := $(wildcard *.cpp)
OBJS := $(SRC:.cpp=.o)

all: $(LIBDIR)/lib$(NAME).a

$(LIBDIR)/lib$(NAME).a: $(OBJS)
	mkdir -p $(LIBDIR)
	ar rvs $@ $^

%.o: %.cpp
	$(CXX) -c $< $(INCLUDE) $(CXXFLAGS) $(LIBS) -lcryptoutil

clean:
	rm -rf *.o
