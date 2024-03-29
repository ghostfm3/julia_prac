module SetOptions
using Distributions
using PyPlot


function set_options(ax, xlabel, ylabel, title, filename;
                    grid=true, gridy=false, legend=false)
    ax.set_xlabel(xlabel)
    ax.set_ylabel(ylabel)
    ax.set_title(title)

    if grid
        if gridy
            ax.grid(axis="y")
        else
            ax.grid()
        end
    end
    legend && ax.legend()
    savefig("$(filename).png")
end
end #module

function main()
    # 分布作成
    d = Bernoulli(0.3)

    # 確率質量関数をpdf関数によって得る
    println(pdf(d,1)) # 1が出る確率
    println(pdf(d,0)) # 0が出る確率
    
    # 分布の平均, 分散, 標準偏差
    println("mean = $(mean(d)), var = $(var(d)), std = $(std(d))")

    # 得た実数値を元に分布を可視化
    fig, ax = subplots()
    ax.bar([0,1], pdf.(d, [0,1]))
    set_options(ax, "x", "probability", "probability mass function", "bernoulli";
                gridy=true)
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()
