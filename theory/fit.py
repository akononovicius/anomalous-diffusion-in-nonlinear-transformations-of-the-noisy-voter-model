#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from numpy import exp
from scipy.special import hyp1f1
from scipy.special import gamma

def yStationaryMoment(k, alpha, epsi1, epsi2):
    return gamma(epsi2-k/alpha)*gamma(epsi1+k/alpha)/(gamma(epsi1)*gamma(epsi2))

def yMoment(k, T, x0, alpha, epsi1, epsi2):
    y0 = (x0/(1-x0))**(1/alpha)
    sigmaSq = 2 / alpha**2
    
    if y0>1:
        eta = 1 + alpha / 2
        lamb = 1 + alpha*epsi2
    else:
        eta = 1 - alpha / 2
        lamb = 1 - alpha * epsi1

    tmp1 = eta-1
    tmp2 = 1 / tmp1 # 1/(eta-1)
    tmp3 = tmp2 / 2 # 1/(2*(eta-1))
    tmp4 = (lamb - 1) * tmp3 # (lambda - 1) / (2*(eta-1))
    tmp5 = k * tmp3 # k/(2*(eta-1))
    tmp6 = 2 * tmp1*tmp1 * sigmaSq * T # 2*((eta-1)^2)*(sigma^2)*t

    res = 1
    res *= gamma(tmp4 - tmp5) / gamma(tmp4)
    res *= tmp6**(-tmp5)
    res *= hyp1f1(tmp5,tmp4,-1/(tmp6*(y0**(2*tmp1))))

    return res

def yMean(T, x0, alpha, epsi1, epsi2):
    return yMoment(1, T, x0, alpha, epsi1, epsi2)

def ySqMean(T, x0, alpha, epsi1, epsi2):
    return yMoment(2, T, x0, alpha, epsi1, epsi2)

def yVariance(T, x0, alpha, epsi1, epsi2):
    mn = yMean(T, x0, alpha, epsi1, epsi2)
    sq = ySqMean(T, x0, alpha, epsi1, epsi2)
    return sq - mn**2
