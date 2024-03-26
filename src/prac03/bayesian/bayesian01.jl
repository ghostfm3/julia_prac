using Turing, ArviZ, PyPlot 
using Random, KernelDensity
using Distributions

@model function bernoulli_model(X)
    p ~ Uniform(0.0, 1.0)  
    X ~ Bernoulli(p)
end

function plot_trace(samples)
    figure(figsize=(12, 6))

    subplot(2, 1, 1)
    plot(samples)
    xlabel("Sample")
    ylabel("p")

    subplot(2, 1, 2)
    hist(samples, bins=30, density=true)
    xlabel("p")
    ylabel("Density")
    savefig("trace_plot.png")
end

function posterior_plot(samples)
    kde_result = KernelDensity.kde(samples[:])

    figure(figsize=(8, 6))
    plot(kde_result.x, kde_result.density, label="p")
    xlabel("p")
    ylabel("Density")
    xlim(0, 1)
    legend()
    savefig("posterior_plot.png")
end

function main()
    Random.seed!(42)
    X = [1, 0, 0, 1, 0]
    model = bernoulli_model(X)

    # モデルのサンプリング
    chain = sample(model, NUTS(), MCMCThreads(), 2000, 3, discard_adapt=true)

    # p パラメータのトレースとヒストグラムをプロット
    p_samples = Array(chain[:p])

    # trance
    plot_trace(p_samples)

    # posterior
    posterior_plot(p_samples)
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()