# Lukšan and Vlček's problem 5.2 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon502

"""Lukšan and Vlček's problem 5.2 in NLS format:
Chained Wood function with Broyden banded constraints
"""
function LVcon502(n::Int = 20)
  if n < 8
    @warn(": number of variables must be ≥ 8. Using n = 8")
    n = 8
  elseif n % 2 != 0
    @warn(": number of variables must be even. Rounding up")
    n += 1
  end

  s = sqrt(10)
  N = div(n, 2) - 1

  model = Model()
  @variable(model, x[i = 1:n], start = (i % 2 == 1 ? -2.0 : 1.0))
  @NLexpression(model, F1[i = 1:N], 10 * (x[2i - 1]^2 - x[2i]))
  @expression(model, F2[i = 1:N], x[2i - 1] - 1)
  @NLexpression(model, F3[i = 1:N], 3s * (x[2i + 1]^2 - x[2i + 2]))
  @expression(model, F4[i = 1:N], x[2i + 1] - 1)
  @expression(model, F5[i = 1:N], s * (x[2i] + x[2i + 2] - 2))
  @expression(model, F6[i = 1:N], (x[2i] - x[2i + 2]) / s)
  @constraint(
    model,
    c[k = 1:(n - 7)],
    (2 + 5 * x[k + 5]^2) * x[k + 5] + 1.0 + sum(x[i] * (1 + x[i]) for i = max(k - 5, 1):(k + 1)) ==
    0
  )

  return MathOptNLSModel(model, [F1; F2; F3; F4; F5; F6], name = "Lukšan-Vlček 5.2")
end
