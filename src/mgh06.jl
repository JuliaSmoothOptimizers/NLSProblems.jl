# MGH problem 6 - Jennrich and Sampson function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh06

"Jennrich and Sampson function"
function mgh06(m :: Int = 10)

  F(x) = [2 + 2i - exp(i*x[1]) - exp(i*x[2]) for i = 1:m]
  x0 = [0.3; 0.4]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m)
end
