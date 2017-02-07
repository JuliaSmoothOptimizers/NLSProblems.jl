# MGH problem 14 - Wood function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh14

"Wood function"
function mgh14()

  F(x) = [10*(x[2] - x[1]^2);
          1 - x[1];
          sqrt(90)*(x[4] - x[3]^2);
          1 - x[3];
          sqrt(10)*(x[2] + x[4] - 2);
          (x[2] - x[4])/sqrt(10)]
  x0 = [-3.0; -1.0; -3.0; -1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 6)
end
