using Knet
using PyPlot

mutable struct Pram
    epoch::Int
    lr::Float32
    p::Param
    logs::Matrix{Float64}
end

function log_lh(p)
    return 2 * Knet.log.(p) + 3 * Knet.log.(1 .- p)
end

function loss_fn(p)
    return -sum(log_lh(p))
end

function CalcLinerParam(pram::Pram)
    for epoch in 1:pram.epoch

        # 自動微分を使用
        J = @diff loss_fn(pram.p)
        
        # 勾配を取得
        grad = Knet.grad(J, pram.p)
        
        # パラメータを更新
        pram.p .-= pram.lr * grad
        
        # ログを更新
        loss = value(loss_fn(pram.p))
        log = Float64[epoch, pram.p.value[1], loss]
        pram.logs = vcat(pram.logs, reshape(log, 1, length(log)))
    end
    
    return pram.logs
end

function main()
    epoch = 40
    lr = 0.01
    p = param([0.1f0])  
    logs = zeros(0,3)
    
    pram = Pram(epoch, lr, p, logs)
    logs = CalcLinerParam(pram)

    # プロット
    PyPlot.rc("figure", figsize=(8,4))
    fig, axes = PyPlot.subplots(1,2)
    axes[1].plot(logs[:,1], logs[:,2], label="p value")
    axes[2].plot(logs[:,1], logs[:,3], label="Loss")
    for ax in axes
        ax.legend()
    end
    PyPlot.tight_layout()
    PyPlot.savefig("CalcLinerPram.png")
end

# 実行
abspath(PROGRAM_FILE) == abspath(@__FILE__) && main()