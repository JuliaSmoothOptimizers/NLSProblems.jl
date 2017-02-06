# MGH problem 9 - Gaussian function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh09

"Gaussian function"
function mgh09()

  y = [0.0009; 0.0044; 0.0175; 0.0540; 0.1295; 0.2420; 0.3521; 0.3989]
  y = [y; y[7:-1:1]]
  t = 4 - (1:15)/2
  F(x) = [x[1] * exp(-x[2]*(t[i] - x[3])^2/2) - y[i] for i = 1:15]
  x0 = [0.4; 1.0; 0.0]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 15)
end
