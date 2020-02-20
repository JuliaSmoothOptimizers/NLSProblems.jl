# Lukšan and Vlček's problem 5.15 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon515

"""Lukšan and Vlček's problem 5.15 in NLS format:
Chained modified HS50 problem.
"""
function LVcon515(n :: Int=21)

  if n < 5
    @warn(": number of variables must be ≥ 5. n = 5")
    n = 5
  elseif n % 4 != 1
    @warn(": number of variables must be of the form 4k + 1. Rounding up")
    n = div(n - 1, 4) * 4 + 5
  end

  N = div(n - 1, 4)
  x0s = [35.0; 11.0; 5.0; -5.0]
  model = Model()
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 4 + 1])
  @NLexpression(model, F1[i=1:N], x[4i - 3] - x[4i - 2])
  @NLexpression(model, F2[i=1:N], x[4i - 2] - x[4i - 1])
  @NLexpression(model, F3[i=1:N], (x[4i - 1] - x[4i])^2)
  @NLexpression(model, F4[i=1:N], (x[4i] - x[4i + 1])^2)

  for k = 1:3N
    ℓ = 4 * div(k - 1, 3)
    if k % 3 == 1
      @constraint(model, x[ℓ + 1]^2 + 2 * x[ℓ + 2] + 3 * x[ℓ + 3] == 6)
    elseif k % 3 == 2
      @constraint(model, x[ℓ + 2]^2 + 2 * x[ℓ + 3] + 3 * x[ℓ + 4] == 6)
    else
      @constraint(model, x[ℓ + 3]^2 + 2 * x[ℓ + 4] + 3 * x[ℓ + 5] == 6)
    end
  end

  return MathOptNLSModel(model, [F1; F2; F3; F4], name="Lukšan-Vlček 5.15")
end
