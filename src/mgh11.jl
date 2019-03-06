# MGH problem 11 - Gulf research and development function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh11

"Gulf research and development function"
function mgh11(args...; m :: Int=100)
  if !(3 <= m <= 100)
    @warn(": number of functions must be between 3 and 100. Adjusting to closer bound")
    m = min(100, max(3, m))
  end

  t = (1:m) ./ 100
  y = 25 .+ (-50 * log.(t)).^(2 / 3)
  model = Model()
  @variable(model, x[1:3])
  setvalue(x, [5.00; 2.50; 0.15])
  @NLexpression(model, F[i=1:m], exp(-abs(y[i] * m * i * x[2])^x[3] / x[1]) - t[i])

  return MathProgNLSModel(model, F, name="mgh11")
end
