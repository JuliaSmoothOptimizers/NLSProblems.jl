# MGH problem 34 - Linear function - rank 1 with zero columns and rows
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh34

"Linear function - rank 1 with zero columns and rows"
function mgh34(m :: Int = 20, n :: Int = 10)

  @assert m >= n
  F(x) = [-1;
          [(i-1)*sum(j*x[j] for j = 2:n-1) - 1 for i = 2:m-1];
          -1]
  x0 = ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m)
end
