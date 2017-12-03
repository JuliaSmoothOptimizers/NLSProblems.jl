# MGH problem 20 - Watson function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh20

"Watson function"
function mgh20(n :: Int = 6)

  @assert 2 <= n <= 31
  t = (1:29)/29
  F(x) = [[sum((j-1)*x[j]*t[i]^(j-2) for j = 2:n) - sum(x[j] * t[i]^(j-1) for j = 1:n)^2 - 1 for i = 1:29];
          x[1];
          x[2] - x[1]^2 - 1]
  x0 = zeros(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, 31, name="mgh20")
end
