# MGH problem 24 - Penalty function II
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh24

"Penalty function II"
function mgh24(n :: Int=4)
  if n < 2
    warn(": number of variables must be ≥ 2. Using n = 2")
  end

  y = [exp(i / 10) + exp((i - 1) / 10) for i = 1:n]
  model = Model()
  @variable(model, x[1:n], start=0.5)
  @NLexpression(model, F1, x[1] - 0.2)
  @NLexpression(model, F2[i=1:n-1], sqrt(1e-5) *
                (exp(x[i + 1] / 10) + exp(x[i] / 10) - y[i]))
  @NLexpression(model, F3[i=1:n-1], sqrt(1e-5) *
                (exp(x[i + 1] / 10) - exp(-1 / 10)))
  @NLexpression(model, F4, sum((n - j + 1) * x[j]^2 for j = 1:n) - 1)

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="mgh24")
end
