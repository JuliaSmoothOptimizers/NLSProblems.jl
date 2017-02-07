# MGH problem 13 - Powell singular function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh13

"Powell singular function"
function mgh13()

  F(x) = [x[1] + 10x[2];
          sqrt(5)*(x[3] - x[4]);
          (x[2] - 2x[3])^2;
          sqrt(2)*(x[1] - x[4])^2]
  x0 = [3.0; -1.0; 0.0; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 4)
end
