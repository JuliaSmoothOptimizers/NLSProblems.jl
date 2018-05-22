# MGH problem 26 - Trigonometric function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh26

"Trigonometric function"
function mgh26(n :: Int = 10)

  model = Model()
  @variable(model, x[1:n], start=1/n)
  @NLexpression(model, F[i=1:n], n - sum(cos(x[j]) for j = 1:n) +
                i * (1 - cos(x[i])) - sin(x[i]))

  return MathProgNLSModel(model, F, name="mgh26")
end
