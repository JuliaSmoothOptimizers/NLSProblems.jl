# MGH problem 21 - Extended Rosenbrock function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh21

"Extended Rosenbrock function"
function mgh21(n :: Int=20)
  if n < 2
    warn(": number of variables must be ≥ 2. Using n = 2")
    n = 2
  elseif n % 2 == 1
    warn(": number of variable must be even. Rounding up")
    n += 1
  end

  model = Model()
  @variable(model, x[i=1:n], start=(i % 2 == 0 ? 1.0 : -1.2))
  N = div(n, 2)
  @NLexpression(model, F1[i=1:N], 10 * (x[2i] - x[2i - 1]^2))
  @NLexpression(model, F2[i=1:N], 1 - x[2i - 1])

  return MathProgNLSModel(model, [F1; F2], name="mgh21")
end
