# MGH problem 20 - Watson function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh20

"Watson function"
function mgh20(n :: Int=6)
  if !(2 <= n <= 31)
    @warn(": number of variables must be between 2 and 31. Adjusting to closer bound ")
    n = min(31, max(2, n))
  end

  t = (1:29) / 29
  model = Model()
  @variable(model, x[1:n], start=0.0)
  @NLexpression(model, F1[i=1:29],
                sum((j - 1) * x[j] * t[i]^(j - 2) for j = 2:n) -
                sum(x[j] * t[i]^(j - 1) for j = 1:n)^2 - 1)
  @NLexpression(model, F2, x[1] + 0.0) # x[1] alone won't work
  @NLexpression(model, F3, x[2] - x[1]^2 - 1)

  return MathProgNLSModel(model, [F1; F2; F3], name="mgh20")
end
