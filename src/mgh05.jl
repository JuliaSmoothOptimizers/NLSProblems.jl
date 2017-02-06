# MGH problem 5 - Beale function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh05

"Beale function"
function mgh05()

  y = [1.5; 2.25; 2.625]
  F(x) = [y[i] - x[1]*(1 - x[2]^i) for i = 1:3]
  x0 = [1.0; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 3)
end
