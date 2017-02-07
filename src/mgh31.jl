# MGH problem 31 - Broyden banded function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh31

"Broyden banded function"
function mgh31(n :: Int = 10)

  F(x) = [x[i]*(2 + 5*x[i]^2) + 1 - sum(x[j]*(1 + x[j]) for j = max(1,i-5):min(n,i+1) if j != i) for i = 1:n]
  x0 = -ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n)
end
