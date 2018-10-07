# MGH problem 17 - Osborne 1 function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh17

"Osborne 1 function"
function mgh17(args...)

  t = 10 * ((1:33) .- 1)
  y = [0.844; 0.908; 0.932; 0.936; 0.925; 0.908; 0.881; 0.850; 0.818;
       0.784; 0.751; 0.718; 0.685; 0.658; 0.628; 0.603; 0.580; 0.558;
       0.538; 0.522; 0.506; 0.490; 0.478; 0.467; 0.457; 0.448; 0.438;
       0.431; 0.424; 0.420; 0.414; 0.411; 0.406]
  model = Model()
  @variable(model, x[1:5])
  setvalue(x, [0.5; 1.5; -1.0; 0.01; 0.02])
  @NLexpression(model, F[i=1:33], y[i] -
                (x[1] + x[2] * exp(-t[i] * x[4]) +
                 x[3] * exp(-t[i] * x[5])))

  return MathProgNLSModel(model, F, name="mgh17")
end
