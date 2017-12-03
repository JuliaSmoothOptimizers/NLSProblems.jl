# MGH problem 16 - Brown and Dennis function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh16

"Brown and Dennis function"
function mgh16(m :: Int = 20)

  @assert m >= 4
  t = (1:m)/5
  F(x) = [(x[1] + t[i]*x[2] - exp(t[i]))^2 + (x[3] + x[4]*sin(t[i]) - cos(t[i]))^2 for i = 1:m]
  x0 = [25.0; 5.0; -5.0; -1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m, name="mgh16")
end
