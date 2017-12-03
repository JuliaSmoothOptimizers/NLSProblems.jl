# MGH problem 22 - Extended Powell singular function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh22

"Extended Powell singular function"
function mgh22(n :: Int = 20)

  @assert n%4 == 0

  F(x) = [if j%4 == 1
            x[j] + 10x[j+1]
          elseif j%4 == 2
            sqrt(5)*(x[j+1] - x[j+2])
          elseif j%4 == 3
            (x[j-1] - 2x[j])^2
          elseif j%4 == 0
            sqrt(10)*(x[j-3] - x[j])^2
            end for j = 1:n]
    x0 = repmat([3.0; -1.0; 0.0; 1.0], div(n,4))

  #return SimpleNLSModel(x0, 2, F=F)
  return ADNLSModel(F, x0, n, name="mgh22")
end
