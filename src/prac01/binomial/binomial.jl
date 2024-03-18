include("bernoulli.jl")

function main()
    # 二項分布生成
    d = Binomial(20, 0.3)

    # 二項分布の確率質量関数の算出と可視化
    xs = range(0, 20, length=21)
    fig, ax = subplots()
    ax.bar(xs, pdf.(d, xs))
    set_options(ax, "x", "frequency", "probability mass function", "binomial";
    gridy=true)
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()
