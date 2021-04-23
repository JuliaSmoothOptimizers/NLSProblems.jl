# MGH problem 23 - Penalty function I
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh23

"Penalty function I"
function mgh23(n::Int = 4)
  model = Model()
  @variable(model, x[i = 1:n], start = i)
  @NLexpression(model, F1[i = 1:n], sqrt(1e-5) * (x[i] - 1))
  @NLexpression(model, F2, sum(x[i]^2 for i = 1:n) - 0.25)

  return MathOptNLSModel(model, [F1; F2], name = "mgh23")
end
