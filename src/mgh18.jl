# MGH problem 18 - Biggs EXP6 function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh18

"Biggs EXP6 function"
function mgh18(args...; m :: Int=13)
  if m < 6
    @warn(": number of functions must be ≥ 6. Using m = 6")
    m = 6
  end

  t = 0.1 * (1:m)
  y = exp.(-t) - 5exp.(-10t) + 3exp.(-4t)
  model = Model()
  @variable(model, x[1:6])
  setvalue(x, [1.0; 2.0; 1.0; 1.0; 1.0; 1.0])
  @NLexpression(model, F[i=1:m], x[3] * exp(-t[i] * x[1]) - x[4] *
                exp(-t[i] * x[2]) + x[6] * exp(-t[i] * x[5]) - y[i])

  return MathProgNLSModel(model, F, name="mgh18")
end
