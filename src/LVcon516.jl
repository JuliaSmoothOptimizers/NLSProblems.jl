# Lukšan and Vlček's problem 5.16 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon516

"""Lukšan and Vlček's problem 5.16 in NLS format:
Chained modified HS51 problem.
"""
function LVcon516(n :: Int = 21)

  if n < 5
    warn(": number of variables must be ≥ 5. n = 5")
    n = 5
  elseif n % 4 != 1
    warn(": number of variables must be of the form 4k + 1. Rounding up")
    n = div(n - 1, 4) * 4 + 5
  end

  N = div(n - 1, 4)
  x0s = [2.5; 0.5; 2.0; -1.0]
  model = Model()
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 4 + 1])
  @NLexpression(model, F1[i=1:N], (x[4i - 3] - x[4i - 2])^2)
  @NLexpression(model, F2[i=1:N], x[4i - 2] + x[4i - 1] - 2)
  @NLexpression(model, F3[i=1:N], x[4i] - 1)
  @NLexpression(model, F4[i=1:N], x[4i + 1] - 1)

  for k = 1:3N
    ℓ = 4 * div(k - 1, 3)
    if k % 3 == 1
      @constraint(model, x[ℓ + 1]^2 + 3 * x[ℓ + 2] == 4)
    elseif k % 3 == 2
      @constraint(model, x[ℓ + 3]^2 + x[ℓ + 4] - 2 * x[ℓ + 5] == 0)
    else
      @constraint(model, x[ℓ + 2]^2 - x[ℓ + 5] == 0)
    end
  end

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="Lukšan-Vlček 5.16")
end
