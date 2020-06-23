#define _GNU_SOURCE
#include <assert.h>
#include <sched.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <math.h>


void print_affinity(){
	cpu_set_t mask;
	long nproc, i;

	if(sched_getaffinity(0, sizeof(cpu_set_t), &mask) == -1){
		perror("sched_getaffinity");
		assert(false);
	}
	nproc = sysconf(_SC_NPROCESSORS_ONLN);
	printf("sched_getaffinity = ");
	for(i=0; i<nproc; i++){
		printf("%d ", CPU_ISSET(i, &mask));
	}
	printf("\n");
}


int main(int argc, char * argv[]){

	int coreNum = floor(argc/2);

	printf("%d\n", coreNum);
	cpu_set_t mask;

	print_affinity();
	printf("sched_getcpu = %d\n", sched_getcpu());

	int e;

	int i, id1;

	if(argc<=2){
		fprintf(stderr, "Errorea: %s \n", argv[0]);
		exit(1);
	}

	for(i = 0; i < coreNum; i++){
		switch((id1=fork())){
		case -1:
			perror("fork");
			exit(1);
		case 0:
			e = atoi(argv[2*i+1]);
			CPU_ZERO(&mask);
			CPU_SET(e,&mask);
			if(sched_setaffinity(0, sizeof(cpu_set_t), &mask)== -1){
				perror("sched_setaffinity");
				assert(false);
			}

			print_affinity();
			printf("sched_getcpu = %d\n", sched_getcpu());
			if(execlp(argv[2*i+2], argv[2*i+2], NULL) == -1){
				fprintf(stderr, "%s programa ezin izan da exekutatu\n", argv[i]);
			}
			break;
		default:
			break;
		}
	}
	while((wait(NULL)) != (-1));

	return EXIT_SUCCESS;
}

