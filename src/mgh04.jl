# MGH problem 4 - Brown badly scaled function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh04

"Brown badly scaled function"
function mgh04()

  F(x) = [x[1] - 1e6;
          x[2] - 2e-6;
          x[1] * x[2] - 2.0]
  x0 = [1.0; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 3)
end
