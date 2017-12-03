# MGH problem 21 - Extended Rosenbrock function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh21

"Extended Rosenbrock function"
function mgh21(n :: Int = 20)

  F(x) = [j%2 == 0 ? 1 - x[j-1] : 10*(x[j+1] - x[j]^2) for j = 1:n]
  x0 = [j%2 == 0 ? 1.0 : -1.2 for j = 1:n]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n, name="mgh21")
end
