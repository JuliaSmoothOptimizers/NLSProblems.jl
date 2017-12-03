# MGH problem 23 - Penalty function I
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh23

"Penalty function I"
function mgh23(n :: Int = 4)

  F(x) = [[sqrt(1e-5)*(x[i] - 1) for i = 1:n];
          sum(x[j]^2 for j = 1:n) - 0.25]
  x0 = collect(1:n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n+1, name="mgh23")
end
