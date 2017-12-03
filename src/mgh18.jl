# MGH problem 18 - Biggs EXP6 function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh18

"Biggs EXP6 function"
function mgh18(m :: Int = 13)

  @assert m >= 6
  t = 0.1*(1:m)
  y = exp.(-t) - 5exp.(-10t) + 3exp.(-4t)
  F(x) = [x[3]*exp(-t[i]*x[1]) - x[4]*exp(-t[i]*x[2]) + x[6]*exp(-t[i]*x[5]) - y[i] for i = 1:m]
  x0 = [1.0; 2.0; 1.0; 1.0; 1.0; 1.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m, name="mgh18")
end
