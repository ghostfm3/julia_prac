using PyCall
np = pyimport("numpy")
x = np.sin(np.pi / 4)  # 例: NumPy の sin 関数を使用
println(x)