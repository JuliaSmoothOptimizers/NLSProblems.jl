# Biegler et al. (2000) example 3
#
#   Source:
#   L. T. Biegler, J. Nocedal, C. Schmid and D. Ternet
#   Numerical Experience with a Reduced Hessian Method for Large Scale Constrained
#   Optimization
#   Computational Optimization and Applications, 15(45):45-67, 2000
#   DOI 10.1023/A:1008723031056
#   [https://doi.org/10.1023/A:1008723031056
#
# A. S. Siqueira, Curitiba/BR, 01/2019.
using JuMP

export BNST3

"""Biegler et al. (2000) example 3 in NLS format.
"""
function BNST3(n :: Int = 200)

  if n < 2
    @warn("BNST2: number of variables must be ≥ 2. Setting to 2")
    n = 2
  elseif n % 2 == 1
    @warn("BNST3: n must be even. Rounding up")
    n += 1
  end
  N = div(n, 2)

  model = Model()
  @variable(model, x[1:n], start=0.1)
  @NLexpression(model, F[i=1:n], 1.0 * x[i])
  @NLconstraint(model, c[j=1:N], x[j] * (x[N+j] - 1) - 10x[N+j] == 0)

  return MathProgNLSModel(model, F, name="BNST3")
end
