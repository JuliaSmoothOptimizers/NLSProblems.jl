# MGH problem 30 - Broyden tridiagonal function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh30

"Broyden tridiagonal function"
function mgh30(n :: Int = 10)

  F(x) = [(3-2x[1])*x[1] - 2x[3] + 1;
          [(3-2x[i])*x[i] - x[i-1] - 2x[i+1] + 1 for i = 2:n-1];
          (3-2x[n])*x[n] - x[n-1] + 1]
  x0 = -ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n)
end
