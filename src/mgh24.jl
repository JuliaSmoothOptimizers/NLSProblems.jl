# MGH problem 24 - Penalty function II
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh24

"Penalty function II"
function mgh24(n :: Int = 4)

  y = [exp(i/10) + exp((i-1)/10) for i = 1:n]
  F(x) = [x[1] - 0.2;
          [sqrt(1e-5)*(exp(x[i]/10) + exp(x[i-1]/10) - y[i]) for i = 2:n];
          [sqrt(1e-5)*(exp(x[i+1]/10) - exp(-1/10)) for i = 1:n-1];
          sum((n-j+1)*x[j]^2 for j = 1:n) - 1]
  x0 = 0.5*ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 2n)
end
