# MGH problem 35 - Chebyquad function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh35

function Tsim(x, n)
  if n == 0
    return 1
  elseif n == 1
    return x
  else
    return 2*x*Tsim(x,n-1) - Tsim(x,n-2)
  end
end

T(x, n) = Tsim(2x-1, n)

"Chebyquad function"
function mgh35(m :: Int = 10, n :: Int = 10)

  @assert m >= n

  I = [i%2 == 0 ? -1/(i^2-1) : 0 for i = 1:n]
  F(x) = [sum(T(x[j], i) for j = 1:n)/n - I[i] for i = 1:n]
  x0 = collect(1:n)/(n+1)

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, m, name="mgh35")
end
