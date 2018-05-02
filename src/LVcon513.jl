# Lukšan and Vlček's problem 5.13 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon513

"""Lukšan and Vlček's problem 5.13 in NLS format:
Chained modified HS48 problem.
"""
function LVcon513(n :: Int = 20)

  n < 5 && error(": number of variables must be ≥ 5")
  if n % 3 != 2
    warn(": number of variables must be of the form 3k + 2. Rounding up")
    n = div(n - 2, 3) * 3 + 5
  end

  N = div(n - 2, 3)
  x0s = [3.0; 5.0; -3.0]
  model = Model()
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 3 + 1])
  @NLexpression(model, F1[i=1:N], x[3i - 2] - 1)
  @NLexpression(model, F2[i=1:N], x[3i - 1] - x[3i])
  @NLexpression(model, F3[i=1:N], (x[3i + 1] - x[3i + 2])^2)

  for k = 1:2N
    ℓ = 3 * div(k - 1, 2)
    if k % 2 == 1
      @constraint(model, x[ℓ + 1] + x[ℓ + 2]^2 + x[ℓ + 3] + x[ℓ + 4] +
                  x[ℓ + 5] == 5)
    else
      @constraint(model, x[ℓ + 3]^2 - 2 * (x[ℓ + 4] + x[ℓ + 5]) == 3)
    end
  end

  return MathProgNLSModel(model, [F1; F2; F3], name="Lukšan-Vlček 5.13")
end
