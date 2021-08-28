# Anomalous diffusion in nonlinear transformations of the noisy voter model

This repository contains Python (Jupyter Notebooks), C and Shell code, which
was used to generate figures in [1].

All C programs are contained within `crun` directory. They can be compiled
by running `crun/compile-all.sh` script (dependencies: GCC, GSL). After
compilation all programs can be run by executing `crun/run-all.sh` script
(dependencies: GNU parallel, paste).
C programs will generate multiple temporary `*.series` files, which will be
later combined into `*.data` files, which will be stored in the `data`
directory (it will be created as needed).

For exact details about our implementation of the noisy voter model using
Gillespie method see [1]. In short, we adjust the number of agents in real time
to make the simulation run faster (minutes instead of weeks).

`*.data` files are CSV files, which contain time series of separate runs as
rows. All runs within same file were obtained using the same parameter set.
For actual parameter set see the corresponding `*.c` file.

`*.data` files are analyzed by `convert-*.ipynb` notebooks
(dependencies: numpy, scipy, matplotlib). These notebooks
will convert data into `*.csv` files, which can be then used to produce figures
from the paper (either using matplotlib, gnuplot or any other graphing library).
Columns of the `*.csv` file correspond to:

* log10(time)
* log10(empirical mean)
* log10(empirical variance)
* log10(theoretical mean)
* log10(theoretical variance)
* log10(steady state mean)
* log10(steady state variance)

## License

Feel free to copy, use and modify our code as you see fit (see the `LICENSE`
file for legal details). That said, referencing the paper would be appreciated.

## Reference

1. R. Kazakevičius, A. Kononovicius. *Anomalous diffusion in nonlinear transformations of the noisy voter model*. Physical Review E **103**: 032154 (2021). [doi: 10.1103/PhysRevE.103.032154](https://doi.org/10.1103/PhysRevE.103.032154). [arXiv:2011.02927 [cond-mat.stat-mech]](https://arxiv.org/abs/2011.02927).
