using PyPlot

function lh(p)
    return map(x -> x^2 * (1-x)^3, p)
end

function main()
    p = 0.0:0.01:1.0

    # Plot
    PyPlot.rc("figure", figsize=(6,4))
    plot(p, lh(p))
    xlabel("p")
    ylabel("mle")
    title("mle func")
    savefig("mle_plot.png")
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()