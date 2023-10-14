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

# Docker command
DOCKER_CMD = docker run -it --rm --gpus all --ipc=host --net=host --cap-add=SYS_ADMIN --privileged -v '/raid/home/hemantg/shared_lib/cuda_openacc/fortran/matrix_mul':/host_pwd -w /host_pwd nvcr.io/nvidia/nvhpc:23.7-devel-cuda12.2-ubuntu20.04

# Default target
all: $(LIBRARY) $(EXECUTABLE)

# Compile and link the shared library
$(LIBRARY): $(LIBSRC)
	$(FC) $(FFLAGS) $(MINFO) -shared -o $@ $^

# Compile and link the main program
$(EXECUTABLE): $(MAINSRC) $(LIBRARY)
	$(FC) $(FFLAGS) $(MINFO) -o $@ $< -L. -lgpu

.PHONY: run clean docker

run: $(EXECUTABLE)
	./$(EXECUTABLE)

docker: clean
	$(DOCKER_CMD) make -C /host_pwd -f /host_pwd/Makefile run

clean:
	rm -f $(LIBRARY) $(EXECUTABLE)

