# Isotonic Quantile Regression Averaging
This repository is supplementary to the paper **A. Lipiecki & B. Uniejewski *Isotonic Quantile Regression Averaging for uncertainty quantification of electricity price forecasts* [arXiv.2507.15079](https://doi.org/10.48550/arXiv.2507.15079)**

Point forecasts from the ensemble of NARX models are provided in the `data` folder. 

Install the required packages, preprocess the ensembles, and create missing directories with:
```bash
julia --project setup.jl
```

To run all the postprocessing methods for each of the 24 hours, we recommend executing `run.jl` script with GNU Parallel:
```bash
parallel "julia --project run.jl {1} {2}" ::: cp hs idr qrm qra iqra lqra ::: {1..24}
```

The generated quantile forecasts are stored in the `outputs` directory, the evaluation is performed in `eval.ipynb`.
