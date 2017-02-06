# MGH problem 2 - Freudstein and Roth function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh02

"Freudstein and Roth function"
function mgh02()

  F(x) = [-13 + x[1] + ((5-x[2])*x[2] - 2) * x[2];
          -29 + x[1] + ((x[2]+1)*x[2] - 14) * x[2]]
  x0 = [0.5; -2.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 2)
end
