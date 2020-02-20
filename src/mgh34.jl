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
function mgh34(n :: Int=10; m :: Int=20)
  if m < n
    @warn(": number of functions must be ≥ number of variables. Adjusting to m = n")
    m = n
  end

  model = Model()
  @variable(model, x[1:n], start=1.0)
  @NLexpression(model, F1, -1.0)
  @NLexpression(model, F2[i=1:m-2], i * sum(j * x[j] for j = 2:n-1) - 1)
  @NLexpression(model, F3, -1.0)

  return MathOptNLSModel(model, [F1; F2; F3], name="mgh34")
end
