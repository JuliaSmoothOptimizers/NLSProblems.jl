# Biegler et al. (2000) example 2
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

export BNST2

"""Biegler et al. (2000) example 2 in NLS format.
"""
function BNST2(n :: Int = 200)

  if n < 2
    @warn("number of variables must be ≥ 2. Setting to 2")
    n = 2
  end
  model = Model()
  @variable(model, x[1:n], start=0.1)
  @NLexpression(model, F[i=1:n], 1.0 * x[i])
  @NLconstraint(model, c[j=1:n-1], x[1] * (x[j+1] - 1) - 10x[j+1] == 0)

  return MathOptNLSModel(model, F, name="BNST2")
end
