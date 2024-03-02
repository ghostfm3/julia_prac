using PyCall
using PyPlot

# numpy呼び出し
np = pyimport("numpy")

# 確率密度関数
function norm(x, mu, sigma)
    return np.exp(-((x .- mu) ./ sigma).^2 ./ 2) ./ (np.sqrt(2 * np.pi) .* sigma)
end

function main()
    mu, sigma = 0, 3.0
    x = np.arange(-12.0, 13.0, 0.01)
    xtick = np.arange(-12.0, 13.0, 1.0)

    #描画
    figure(figsize=(15, 10))
    plot(x, norm(x, mu, sigma), label="mu=$(mu) sigma=$(sigma)")
    xticks(xtick, fontsize=12)
    legend(fontsize=12)
    title("norm")  
    savefig("norm.png")
end

if abspath(PROGRAM_FILE) == abspath(@__FILE__)
    main()
end