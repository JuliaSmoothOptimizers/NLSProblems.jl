# MGH problem 27 - Brown almost-linear function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh27

"Brown almost-linear function"
function mgh27(n::Int = 10)
  if n < 2
    @warn(": number of variables must be ≥ 2. Using n = 2")
  end

  model = Model()
  @variable(model, x[1:n], start = 0.5)
  @NLexpression(model, F1[i = 1:(n - 1)], x[i] + sum(x[j] for j = 1:n) - n - 1)
  @NLexpression(model, F2, prod(x[j] for j = 1:n) - 1)

  return MathOptNLSModel(model, [F1; F2], name = "mgh27")
end
