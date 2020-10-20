#include "nvm.h"

#define MIN_AGENTS 1000
#define SWITCH_AT 100
#define CHANGE_FACTOR 10

double birthRate(double n, double x, double e) {
    return (n-x)*(e+x);
}

double deathRate(double n, double x, double e) {
    return x*(e+n-x);
}

void gillespieStep(double n, double* x, double eBirth, double eDeath, double* clock, double rexp, double runi) {
    double bRate=birthRate(n,*x,eBirth);
    double dRate=deathRate(n,*x,eDeath);
    double tRate=bRate+dRate;
    double dt=rexp/tRate;
    if(runi*tRate<bRate) {
        *x+=1;
    } else {
        *x-=1;
    }
    *clock+=dt;
}

void getTimeSeries(int points, double* times, int from, int nAgents, double eBirth, double eDeath, int rng_seed, int* output) {
    /* initialize GSL random number generator*/
    gsl_rng_env_setup();
    gsl_rng* rng=gsl_rng_alloc(gsl_rng_taus);
    long seed=(long)rng_seed;
    gsl_rng_set(rng,seed);
    /* initial state */
    double clock=0;
    double x=(double)from;
    double lastX=x;
    /* generate event series */
    long idt=0;
    double rexp=0;
    double runi=0;
    int outMult=1;
    int lastMult=1;
    double altSwitch=nAgents-SWITCH_AT;
    for(;idt<points;idt+=1) {
        while(clock<times[idt]) {
            rexp=gsl_ran_exponential(rng,1.0);
            runi=gsl_rng_uniform(rng);
            lastX=x;
            lastMult=outMult;
            gillespieStep(nAgents,&x,eBirth,eDeath,&clock,rexp,runi);
            if(nAgents>MIN_AGENTS) {
                if((lastX<SWITCH_AT && x==SWITCH_AT) || (lastX>altSwitch && x==altSwitch)) {
                    outMult=outMult*CHANGE_FACTOR;
                    x=x/CHANGE_FACTOR;
                    nAgents=nAgents/CHANGE_FACTOR;
                    altSwitch=nAgents-SWITCH_AT;
                }
            }
        }
        output[idt]=lastX*lastMult;
    }
    /* destroy GSL random number generator*/
    gsl_rng_free(rng);
}
