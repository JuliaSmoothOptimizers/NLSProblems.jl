# Lukšan and Vlček's problem 5.1 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.
using JuMP

export LVcon501

"""Lukšan and Vlček's problem 5.1 in NLS format:
Chained Rosenbrock function with trigonometric-exponential constraints
"""
function LVcon501(n :: Int=20)

  if n < 3
    @warn(": number of variables must be ≥ 3. Using n = 3")
    n = 3
  end

  model = Model()
  @variable(model, x[i=1:n], start=(i % 2 == 1 ? -1.2 : 1.0))
  @NLexpression(model, F1[i=1:n-1], 10 * (x[i]^2 - x[i+1]))
  @NLexpression(model, F2[i=1:n-1], x[i] - 1.0)
  @NLconstraint(model, c[k=1:n-2], 3 * x[k+1]^3 + 2 * x[k+2] - 5 +
                       sin(x[k+1] - x[k+2]) * sin(x[k+1] + x[k+2]) +
                       4 * x[k+1] - x[k] * exp(x[k] - x[k+1]) - 3 == 0)

  return MathOptNLSModel(model, [F1; F2], name="Lukšan-Vlček 5.1")
end
