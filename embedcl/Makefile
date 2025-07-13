CPPSRC := $(wildcard *.cpp)
NAME = embedcl

all:
	$(CXX) -o $(NAME)$(EXE_EXT) $(CPPSRC) $(INCLUDE) $(CXXFLAGS)
       -mkdir $(BINDIR)
	cp $(NAME)$(EXE_EXT) $(BINDIR)/$(NAME)$(EXE_EXT)

clean:
	rm -rf $(NAME)$(EXE_EXT)
