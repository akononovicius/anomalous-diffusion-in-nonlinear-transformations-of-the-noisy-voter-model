#include <math.h>
#include <stdlib.h>
#include <gsl/gsl_rng.h>
#include <gsl/gsl_randist.h>

extern void getTimeSeries(int points, double* times, int from, int nAgents, double eBirth, double eDeath, int fourEta, int rngSeed, int* output);
