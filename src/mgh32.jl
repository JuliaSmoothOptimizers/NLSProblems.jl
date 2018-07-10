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
function mgh32(n :: Int=10; m :: Int=20)
  if m < n
    warn(": number of functions must be ≥ number of variables. Adjusting to m = n")
    m = n
  end

  model = Model()
  @variable(model, x[1:n], start=1)
  @NLexpression(model, F1[i=1:n], x[i] - (2 / m) * sum(x[j] for j = 1:n) - 1)
  @NLexpression(model, F2[i=1:m-n], -(2 / m) * sum(x[j] for j = 1:n) - 1)

  return MathProgNLSModel(model, [F1; F2], name="mgh32")
end
