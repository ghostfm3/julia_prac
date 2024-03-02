using PyCall
np = pyimport("numpy")
x = np.sin(np.pi / 4)  
println(x)