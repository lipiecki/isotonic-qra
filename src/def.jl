using PostForecasts

const START = 20200101  # first date of the testing period
const STOP = 20241231   # last date of the testing period
const WINDOW = 364      # size of the rolling window for quantile regression
const QUANTILES = 99    # number of quantiles to compute

# set the grid of lambda values for the lasso quantile regression
setLAMBDA(10.0.^(range(-2, 1, 20)))

function run(::Val{:cp}, h::Int)
    pf = average(loadpointf("inputs/narx$(h)"))
    results = point2quant(pf, method=:cp, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/cp$(h)")
end

function run(::Val{:hs}, h::Int)
    pf = average(loadpointf("inputs/narx$(h)"))
    results = point2quant(pf, method=:hs, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/hs$(h)")
end

function run(::Val{:idr}, h::Int)
    pf = loadpointf("inputs/narx$(h)")
    results = point2quant(pf, method=:idr, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/idr$(h)")
end

function run(::Val{:qrm}, h::Int)
    pf = average(loadpointf("inputs/narx$(h)"))
    results = point2quant(pf, method=:qr, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/qrm$(h)")
end

function run(::Val{:qra}, h::Int)
    pf = loadpointf("inputs/narx$(h)")
    results = point2quant(pf, method=:qr, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/qra$(h)")
end

function run(::Val{:iqra}, h::Int)
    pf = loadpointf("inputs/narx$(h)")
    results = point2quant(pf, method=:iqr, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/iqra$(h)")
end

function run(::Val{:lqra}, h::Int)
    pf = loadpointf("inputs/narx$(h)")
    results = point2quant(pf, method=:lassoqr, window=WINDOW, quantiles=QUANTILES, start=START, stop=STOP)
    saveforecasts(results, "outputs/lqra$(h)")
end
