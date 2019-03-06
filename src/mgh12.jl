# MGH problem 12 - Box three-dimensional function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh12

"Box three-dimensional function"
function mgh12(args...; m :: Int=10)
  if m < 3
    @warn(": number of functions must be ≥ 3. Using m = 3")
    m = 3
  end

  model = Model()
  @variable(model, x[1:3])
  setvalue(x, [0.0; 10.0; 20.0])
  @NLexpression(model, F[i=1:m], exp(-0.1i*x[1]) - exp(-0.1i*x[2]) -
                x[3]*(exp(-0.1i) - exp(-i)))

  return MathProgNLSModel(model, F, name="mgh12")
end
