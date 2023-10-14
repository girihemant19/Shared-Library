# Makefile

# Compiler
FC = nvfortran

# Compiler flags
FFLAGS = -acc -gpu=cc80
MINFO = -Minfo=accel

# Source files
LIBSRC = libgpu.f90
MAINSRC = main.f90

# Output files
LIBRARY = libgpu.so
EXECUTABLE = main

# Default target
all: $(LIBRARY) $(EXECUTABLE)

# Compile and link the shared library
$(LIBRARY): $(LIBSRC)
	$(FC) $(FFLAGS) $(MINFO) -shared -o $@ $^

# Compile and link the main program
$(EXECUTABLE): $(MAINSRC) $(LIBRARY)
	$(FC) $(FFLAGS) $(MINFO) -o $@ $< -L. -lgpu

.PHONY: run clean

run: $(EXECUTABLE)
	./$(EXECUTABLE)

clean:
	rm -f $(LIBRARY) $(EXECUTABLE)

