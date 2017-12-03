# MGH problem 28 - Discrete boundary value function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh28

"Discrete boundary value function"
function mgh28(n :: Int = 10)

  h = 1/(n+1)
  t = (1:n)*h
  F(x) = [2x[1] - x[2] + h^2*(x[1] + h + 1)^3/2;
          [2x[i] - x[i-1] - x[i+1] + h^2*(x[i] + i*h + 1)^3/2 for i = 2:n-1];
          2x[n] - x[n-1] + h^2*(x[n] + n*h + 1)^3/2]
  x0 = t.*(t-1)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n, name="mgh28")
end
