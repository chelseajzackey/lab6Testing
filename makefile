PGMS=mmult_omp_timing matrix_times_vector hello pi mxv_omp_mpi mmult_mpi_omp2



all:	${PGMS}



mmult_mpi_omp2:		mmult2.o mmult_mpi_omp2.o

	mpicc -o mmult_mpi_omp2 -fopenmp -O3 mmult2.o mmult_mpi_omp2.o



mmult_mpi_omp2.o:	mmult_mpi_omp2.c

	mpicc -c -fopenmp -O3 mmult_mpi_omp2.c



mmult_omp_timing:	mmult2.o mmult_omp.o mmult_omp_timing.o

	gcc -o mmult2 -fopenmp -O3 mmult2.o mmult_omp.o mmult_omp_timing.o -o mmult_omp_timing



mmult2.o:	mmult2.c

	gcc -c -O3 mmult2.c



mmult_omp.o:	mmult_omp.c

	gcc -c -O3 -fopenmp mmult_omp.c



mmult_omp_timing.o:	mmult_omp_timing.c

	gcc -c -O3 mmult_omp_timing.c



matrix_times_vector:	matrix_times_vector.c

	mpicc -O3 -o matrix_times_vector matrix_times_vector.c



hello:	hello.c

	mpicc -O3 -o hello hello.c



pi:	pi.c

	mpicc -O3 -o pi pi.c



mxv_omp_mpi:	mxv_omp_mpi.c

	mpicc -fopenmp -O3 -o mxv_omp_mpi mxv_omp_mpi.c



clean:

	rm -f *.o

	rm -f ${PGMS}
