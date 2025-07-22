using Pkg
Pkg.add(url="https://github.com/lipiecki/PostForecasts.jl")
# add from url for a pre-release version that includes isotonic and lasso quantile regressions

using PostForecasts
mkpath("inputs")
mkpath("outputs")
for h in 1:24
    pf = (loaddlm("data/narx$(h).csv", idcol=1, obscol=2))
    sort!(pf.pred, dims=2)
    saveforecasts(pf, "inputs/narx$(h)")
end
