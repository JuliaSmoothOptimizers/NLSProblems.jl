# MGH problem 11 - Gulf research and development function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh11

"Gulf research and development function"
function mgh11(m :: Int = 100)

  if !(3 <= m <= 100)
    error("Argument must be between 3 and 100")
  end
  t = (1:m)/100
  y = 25 + (-50*log.(t)).^(2/3)
  F(x) = [exp(-abs(y[i] * m * i * x[2])^x[3]/x[1]) - t[i] for i = 1:m]
  x0 = [5.00; 2.50; 0.15]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m, name="mgh11")
end
