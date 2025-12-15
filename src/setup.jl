using Pkg
Pkg.add("PostForecasts")

using PostForecasts
mkpath("inputs")
mkpath("outputs")
for h in 1:24
    pf = (loaddlm("data/narx$(h).csv", idcol=1, obscol=2))
    sort!(pf.pred, dims=2)
    saveforecasts(pf, "inputs/narx$(h)")
end
