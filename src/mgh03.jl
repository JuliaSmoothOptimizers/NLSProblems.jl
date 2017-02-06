# MGH problem 3 - Powell badly scaled function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh03

"Powell badly scaled function"
function mgh03()

  F(x) = [1e4 * x[1] * x[2] - 1;
          exp(-x[1]) + exp(-x[2]) - 1.0001]
  x0 = [0.0; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 2)
end
