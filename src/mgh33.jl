# MGH problem 33 - Linear function - rank 1
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh33

"Linear function - rank 1"
function mgh33(m :: Int = 20, n :: Int = 10)

  @assert m >= n
  F(x) = [i*sum(j*x[j] for j = 1:n) - 1 for i = 1:m]
  x0 = ones(n)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m, name="mgh33")
end
