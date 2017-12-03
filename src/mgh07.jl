# MGH problem 7 - Helical valley function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh07

"Helical valley function"
function mgh07()

  θ(a, b) = atan(b/a)/2π + (a > 0 ? 0.0 : 0.5)
  F(x) = [10*(x[3] - 10*θ(x[1], x[2]));
          10*(sqrt(x[1]^2 + x[2]^2) - 1.0);
          x[3]]
  x0 = [-1.0; 0.0; 0.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 3, name="mgh07")
end
