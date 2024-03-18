include("../../prac01/bernoulli/bernoulli.jl")

using .SetOptions
using Distributions
using PyPlot

struct Pram
    alpha::Float64
    beta::Float64
end

function MakeBeta(pram::Pram)
    dist = Beta(pram.alpha, pram.beta)

    X = rand(dist, 1000)

    return X
end

function main()
    alpha = 2.0 + 1
    beta = 3.0 + 1
    pram = Pram(alpha,beta)
    X = MakeBeta(pram)
    fig, ax = subplots()
    ax.hist(X)

    # 描画
    SetOptions.set_options(ax, "p", "frequency", "histogram", "beta"; gridy=true)
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()