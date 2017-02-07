# MGH problem 26 - Trigonometric function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh26

"Trigonometric function"
function mgh26(n :: Int = 10)

  F(x) = [n - sum(cos(x)) + i*(1 - cos(x[i])) - sin(x[i]) for i = 1:n]
  x0 = ones(n)/n

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n)
end
