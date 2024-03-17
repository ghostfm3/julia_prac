include("../prac01/bernoulli.jl")

using .SetOptions
using Distributions
using PyPlot

struct Pram 
    num1::Int
    num2::Int
end

function MakeUniform(pram::Pram)
    # 一様分布の作成
    d = Uniform(pram.num1, pram.num2)

    # サンプリング
    X = rand(d, 10000)

    return X
end

function main()
    pram = Pram(0,1)
    X = MakeUniform(pram)
    fig, ax = subplots()
    ax.hist(X)

    # 描画
    SetOptions.set_options(ax, "x", "frequency", "histogram", "uniform"; gridy=true)
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()