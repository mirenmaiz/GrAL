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

//int main(int argc, int ** argi[], char ** argv[]){

int main(int argc, char * argv[]){

//int main(void){

	int coreNum = argc/2+1;
//	int counter;
//	for(counter=1; counter<argc; counter++){
//	for(counter=1; counter<coreNum; counter++){
//		printf("argv[%2d]:%s \n", counter, argv[counter]);
//	}
/*	int i;
	for(i=coreNum; i<argc; i++){
		printf("prog, argv[%2d]:%s \n", i, argv[i]);
	}*/
	cpu_set_t mask;

	print_affinity();
	printf("sched_getcpu = %d\n", sched_getcpu());
	CPU_ZERO(&mask);
//	CPU_SET(0,&mask);
	int j;
	int e;
//	for(j=1; j<argc; j++){
	for(j=1; j<coreNum; j++){
		e=atoi(argv[j]);
		CPU_SET(e,&mask);
	}

	int i, id, id1, id2;

	if(argc<=2){
		fprintf(stderr, "Errorea: %s \n", argv[0]);
		exit(1);
	}

	for(i=coreNum; i<argc; i++){
		switch((id1=fork())){
		case -1:
			perror("fork");
			exit(1);
		case 0:
			if(execlp(argv[i], argv[i], NULL) == -1){
				fprintf(stderr, "%s programa ezin izan da exekutatu\n", argv[i]);
				continue;
			}
			break;
		default:
			switch((id2=fork())){
			case -1:
				perror("fork");
				exit(1);
			case 0:
				if(execlp(argv[i], argv[i], NULL) == -1){
					fprintf(stderr, "%s programa ezin izan da exekutatu\n", argv[i]);
					continue;
				}
				break;
			default:
				break;
			}
			sleep(40);
			if((id=wait(NULL)) == id1){
				kill(id2, SIGKILL);
				fprintf(stderr, "Abortatua %i, %s\n", id1, argv[i]);
			}
			else{
				kill(id1, SIGKILL);
				fprintf(stderr, "Amaitua %i %s\n", id2, argv[i]);
			}
			wait(NULL);
		}
	}
	while((wait(NULL)) != (-1));

	if(sched_setaffinity(0, sizeof(cpu_set_t), &mask)== -1){
		perror("sched_setaffinity");
		assert(false);
	}
	print_affinity();
	printf("sched_getcpu = %d\n", sched_getcpu());
	return EXIT_SUCCESS;
}

