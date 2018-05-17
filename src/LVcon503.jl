# Lukšan and Vlček's problem 5.3 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon503

"""Lukšan and Vlček's problem 5.3 in NLS format:
Chained Powell singular function with simplified
trigonometric-exponential constraints.
"""
function LVcon503(n :: Int = 20)

  if n < 4
    warn(": number of variables must be ≥ 4. Using n = 4")
    n = 4
  elseif n % 2 != 0
    warn(": number of variables must be even. Rounding up")
    n += 1
  end

  N = div(n, 2) - 1

  model = Model()
  x0s = [3.0; -1.0; 0.0; 1.0]
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 4 + 1])
  @NLexpression(model, F1[i=1:N], x[2i - 1] + 10 * x[2i])
  @NLexpression(model, F2[i=1:N], sqrt(5) * (x[2i + 1] - x[2i + 2]))
  @NLexpression(model, F3[i=1:N], (x[2i] - 2 * x[2i + 1])^2)
  @NLexpression(model, F4[i=1:N], sqrt(10) * (x[2i - 1] - x[2i + 2])^2)
  @NLconstraint(model, 3 * x[1]^3 + 2 * x[2] + sin(x[1] - x[2]) *
                sin(x[1] + x[2]) == 5)
  @NLconstraint(model, 4 * x[n] - x[n - 1] * exp(x[n - 1] - x[n]) == 3)

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="Lukšan-Vlček 5.3")
end
