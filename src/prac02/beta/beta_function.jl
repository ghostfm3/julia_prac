using PyPlot
using SpecialFunctions

struct Pram
    p::AbstractRange{Float64}
    alpha::Float64
    beta::Float64
end

function Beta(pram::Pram)
    C = gamma(pram.alpha + pram.beta - 1) / 
        (gamma(pram.alpha) * gamma(pram.beta))
    return (C * pram.p .^ (pram.alpha - 1)) .* 
           ((1 .- pram.p) .^ (pram.beta - 1))
end

function main()
    alpha = 2.0 + 1.0
    beta = 3.0 + 1.0
    p = range(0.0, stop=1.0 - 0.01, step=0.01)
    pram01 = Pram(p, alpha, beta)

    # 描画
    plot(p, Beta(pram01))
    title("beta function alpha=$(alpha) beta=$(beta)")
    xlabel("p")
    ylabel("likelihood")
    savefig("beta_func.png")
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()