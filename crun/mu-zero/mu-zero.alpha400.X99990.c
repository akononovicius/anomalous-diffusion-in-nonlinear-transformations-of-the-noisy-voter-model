#include <math.h>
#include <stdio.h>
#include <time.h>

#include "nvm.h"

int main(int argc, char *argv[]) {
    // model parameters
    int    X0        = 99990;
    int    nAgents   = 100000;
    double alpha     = 4;
    double epsi1     = 3;
    double epsi2     = epsi1 + 2 / alpha; // Ito
    //double epsi2     = epsi1;             // Stratonovich
    // observation parameters
    double startTime = 1e-6;
    double endTime   = 3;
    int    obs       = 100;

    // main function body
    int i;

    // set times of observation
    // these should be log10-spaced
    double* times=(double *)malloc(obs*sizeof(double));
    times[0]=startTime;
    double mult=(log10(endTime)-log10(startTime))/((double)obs-1);
    mult=pow(10,mult);
    for(i=1;i<obs;i+=1) {
        times[i]=times[i-1]*mult;
    }

    // initialize the actual observations array
    int* xSeries=(int *)malloc(obs*sizeof(int));
    
    // get the seed
    int seed;
    sscanf(argv[2], "%d", &seed);

    // main simulation
    getTimeSeries(obs, times, X0, nAgents, epsi1, epsi2, seed, xSeries);

    // save to file
    FILE *fp;
    fp = fopen(argv[1], "w");
    for(i=0;i<obs;i+=1) {
        fprintf(fp,"%d\n",xSeries[i]);
    }
    fclose(fp);
}
