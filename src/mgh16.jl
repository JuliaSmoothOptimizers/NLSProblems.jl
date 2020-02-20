# MGH problem 16 - Brown and Dennis function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh16

"Brown and Dennis function"
function mgh16(args...; m :: Int=20)
  if m < 4
    @warn(": number of functions must be ≥ 4. Using m = 4")
    m = 4
  end

  t = (1:m) / 5
  model = Model()
  @variable(model, x[1:4])
  set_start_value.(x, [25.0; 5.0; -5.0; -1.0])
  @NLexpression(model, F[i=1:m], (x[1] + t[i] * x[2] - exp(t[i]))^2 +
                (x[3] + x[4] * sin(t[i]) - cos(t[i]))^2)

  return MathOptNLSModel(model, F, name="mgh16")
end
