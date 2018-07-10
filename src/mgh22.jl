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
function mgh22(n :: Int=20)
  if n < 4
    warn(": number of variables must be ≥ 4. Using n = 4")
    n = 4
  elseif n % 4 != 0
    warn(": number of variables must be multiple of 4. Rounding up")
    n = div(n, 4) * 4 + 4
  end

  model = Model()
  x0s = [3.0; -1.0; 0.0; 1.0]
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 4 + 1])
  N = div(n, 4)
  @NLexpression(model, F1[i=1:N], x[4i - 3] + 10 * x[4i - 2])
  @NLexpression(model, F2[i=1:N], sqrt(5) * (x[4i - 1] - x[4i]))
  @NLexpression(model, F3[i=1:N], (x[4i - 2] - 2 * x[4i - 1]^2))
  @NLexpression(model, F4[i=1:N], sqrt(10) * (x[4i - 3] - x[4i])^2)

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="mgh22")
end
