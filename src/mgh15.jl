# MGH problem 15 - Kowalik and Osborne function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh15

"Kowalik and Osborne function"
function mgh15()

  y = [0.1957; 0.1947; 0.1735; 0.1600; 0.0844; 0.0627; 0.0456; 0.0342; 0.0323;
       0.0235; 0.0246]
  u = [4.0000; 2.0000; 1.0000; 0.500; 0.2500; 0.1670; 0.1250; 0.1000; 0.0833;
       0.0714; 0.0625]
  F(x) = [y[i] - x[1]*(u[i]^2 + u[i]*x[2])/(u[i]^2 + u[i]*x[3] + x[4]) for i = 1:11]
  x0 = [0.25; 0.39; 0.415; 0.39]

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 11, name="mgh15")
end
