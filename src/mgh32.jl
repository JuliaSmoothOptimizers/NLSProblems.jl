# MGH problem 32 - Linear function - full rank
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh32

"Linear function - full rank"
function mgh32(m :: Int = 20, n :: Int = 10)

  @assert m >= n
  F(x) = [[x[i] - 2sum(x)/m - 1 for i = 1:n];
          [-2sum(x)/m - 1 for i = n+1:m]]
  x0 = ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m)
end
