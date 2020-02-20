# Lukšan and Vlček's problem 5.4 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon504

"""Lukšan and Vlček's problem 5.4 in NLS format:
Chained Cragg-Levy function with tridiagonal constraints.
"""
function LVcon504(n :: Int=20)

  if n < 4
    @warn(": number of variables must be ≥ 4. Using n = 4")
    n = 4
  elseif n % 2 != 0
    @warn(": number of variables must be even. Rounding up")
    n += 1
  end

  N = div(n, 2) - 1
  model = Model()
  @variable(model, x[i=1:n], start=(i % 4 == 1 ? 1.0 : 2.0))
  @NLexpression(model, F1[i=1:N], (exp(x[2i - 1]) - x[2i])^2)
  @NLexpression(model, F2[i=1:N], 10 * (x[2i] - x[2i + 1])^3)
  @NLexpression(model, F3[i=1:N], tan(x[2i + 1] - x[2i + 2])^2)
  @NLexpression(model, F4[i=1:N], x[2i - 1]^4)
  @NLexpression(model, F5[i=1:N], x[2i + 2] - 1)
  @NLconstraint(model, c[k=1:n-2], 8 * x[k + 1] * (x[k + 1]^2 - x[k]) -
                2 * (1 - x[k + 1]) + 4 * (x[k + 1] - x[k + 2]^2) == 0.0)

  return MathOptNLSModel(model, [F1; F2; F3; F4; F5],
                          name="Lukšan-Vlček 5.4")
end
