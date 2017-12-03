# MGH problem 25 - Variably dimensioned function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh25

"Variably dimensioned function"
function mgh25(n :: Int = 10)

  F(x) = [[x[i] - 1 for i = 1:n];
          sum(j*(x[j]-1) for j = 1:n);
          sum(j*(x[j]-1) for j = 1:n)^2]
  x0 = 1 - collect(1:n)/n

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n+2, name="mgh25")
end
