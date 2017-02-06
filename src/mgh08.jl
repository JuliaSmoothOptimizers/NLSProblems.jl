# MGH problem 8 - Freudstein and Roth function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh08

"Freudstein and Roth function"
function mgh08()

  y = [0.14; 0.18; 0.22; 0.25; 0.29; 0.32; 0.35; 0.39; 0.37; 0.58; 0.73; 0.96;
       1.34; 2.10; 4.39]
  v = 16 - (1:15)
  w = min(1:15, v)
  F(x) = [y[i] - (x[1] + i/(v[i]*x[2] + w[i]*x[3])) for i = 1:15]
  x0 = ones(3)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 15)
end
