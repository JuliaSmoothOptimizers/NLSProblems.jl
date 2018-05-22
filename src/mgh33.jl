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
  if m < n
    warn(": number of functions must be ≥ number of variables. Adjusting to m = n")
    m = n
  end

  model = Model()
  @variable(model, x[1:n], start=1.0)
  @NLexpression(model, F[i=1:m], i * sum(j * x[j] for j = 1:n) - 1)

  return MathProgNLSModel(model, F, name="mgh33")
end
