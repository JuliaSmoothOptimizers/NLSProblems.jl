# MGH problem 27 - Brown almost-linear function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh27

"Brown almost-linear function"
function mgh27(n :: Int = 10)

  F(x) = [[x[i] + sum(x) - n - 1 for i = 1:n-1];
          prod(x) - 1]
  x0 = 0.5*ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n, name="mgh27")
end
