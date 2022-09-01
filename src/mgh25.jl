# MGH problem 25 - Variably dimensioned function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh25

"Variably dimensioned function"
function mgh25(n::Int = 10)
  model = Model()
  @variable(model, x[i = 1:n], start = 1 - i / n)
  @expression(model, F1[i = 1:n], x[i] - 1)
  @expression(model, F2, sum(j * (x[j] - 1) for j = 1:n))
  @NLexpression(model, F3, sum(j * (x[j] - 1) for j = 1:n)^2)

  return MathOptNLSModel(model, [F1; F2; F3], name = "mgh25")
end
