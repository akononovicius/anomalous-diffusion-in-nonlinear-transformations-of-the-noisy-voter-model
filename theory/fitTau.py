#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from numpy import exp
from scipy.special import hyp1f1
from scipy.special import gamma

def xStationaryMean(eta, epsi1, epsi2):
    epsiEta = epsi1 + 1 - 2*eta
    return epsiEta / (epsiEta + epsi2)

def xStationaryVariance(eta, epsi1, epsi2):
    epsiEta = epsi1 + 1 - 2*eta
    epsiSum = epsiEta + epsi2
    return epsiEta*epsi2/((epsiSum**2)*(epsiSum+1))

def xMoment(k, T, x0, eta, epsi1, epsi2):
    sigmaSq = 2
    lamb = 2*eta - epsi1

    tmp1 = eta-1
    tmp2 = 1 / tmp1 # 1/(eta-1)
    tmp3 = tmp2 / 2 # 1/(2*(eta-1))
    tmp4 = (lamb - 1) * tmp3 # (lambda - 1) / (2*(eta-1))
    tmp5 = k * tmp3 # k/(2*(eta-1))
    tmp6 = 2 * tmp1*tmp1 * sigmaSq * T # 2*((eta-1)^2)*(sigma^2)*t

    res = 1
    res *= gamma(tmp4 - tmp5) / gamma(tmp4)
    res *= tmp6**(-tmp5)
    res *= hyp1f1(tmp5,tmp4,-1/(tmp6*(x0**(2*tmp1))))

    return res

def xMean(T, x0, eta, epsi1, epsi2):
    return xMoment(1, T, x0, eta, epsi1, epsi2)

def xSqMean(T, x0, eta, epsi1, epsi2):
    return xMoment(2, T, x0, eta, epsi1, epsi2)

def xVariance(T, x0, alpha, epsi1, epsi2):
    mn = xMean(T, x0, alpha, epsi1, epsi2)
    sq = xSqMean(T, x0, alpha, epsi1, epsi2)
    return sq - mn**2
