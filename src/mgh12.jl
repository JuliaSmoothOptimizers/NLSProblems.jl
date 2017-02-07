# MGH problem 12 - Box three-dimensional function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh12

"Box three-dimensional function"
function mgh12(m :: Int = 10)

  @assert m >= 3
  F(x) = [exp(-0.1i*x[1]) - exp(-0.1i*x[2]) - x[3]*(exp(-0.1i) - exp(-i)) for i = 1:m]
  x0 = [0.0; 10.0; 20.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m)
end
