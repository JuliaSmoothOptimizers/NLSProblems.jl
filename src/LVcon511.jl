# Lukšan and Vlček's problem 5.11 in NLS format
#
#   Source:
#   L. Lukšan and J. Vlček
#   Sparse and Partially Separable Test Problems for Unconstrained and
#   Equality Constrained Optimization
#   Technical report 767, 1999
#
# A. S. Siqueira, Curitiba/BR, 05/2018.

using JuMP

export LVcon511

"""Lukšan and Vlček's problem 5.11 in NLS format:
Chained HS46 problem.
"""
function LVcon511(n :: Int=20)

  if n < 5
    Compat.@warn(": number of variables must be ≥ 5. Using n = 5")
    n = 5
  elseif n % 3 != 2
    Compat.@warn(": number of variables must be of form 3k + 2. Rounding up")
    n = div(n - 2, 3) * 3 + 5
  end

  N = div(n - 2, 3)
  model = Model()
  x0s = [2.0; 1.5; 0.5]
  @variable(model, x[i=1:n], start=x0s[(i - 1) % 3 + 1])
  @NLexpression(model, F1[i=1:N], x[3i - 2] - x[3i - 1])
  @NLexpression(model, F2[i=1:N], x[3i] - 1)
  @NLexpression(model, F3[i=1:N], (x[3i + 1] - 1)^2)
  @NLexpression(model, F4[i=1:N], (x[3i + 2] - 1)^3)
  for k = 1:2N
    ℓ = 3 * div(k - 1, 2)
    if k % 2 == 1
      @NLconstraint(model, x[ℓ + 1]^2 * x[ℓ + 4] + sin(x[ℓ + 4] - x[ℓ + 5]) == 1)
    else
      @NLconstraint(model, x[ℓ + 2] + x[ℓ + 3]^4 * x[ℓ + 4]^2 == 2)
    end
  end

  return MathProgNLSModel(model, [F1; F2; F3; F4], name="Lukšan-Vlček 5.11")
end
