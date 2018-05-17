# MGH problem 19 - Osborne 2 function
#
#   Source:
#   J. J. Moré, B. S. Garbow and K. E. Hillstrom
#   Testing Unconstrained Optimization Software
#   ACM Transactions on Mathematical Software, 7(1):17-41, 1981
#
# A. S. Siqueira, Curitiba/BR, 02/2017.

export mgh19

"Osborne 2 function"
function mgh19()

  t = ((1:65) - 1)/10
  y = [1.366; 1.191; 1.112; 1.013; 0.991; 0.885; 0.831; 0.847; 0.786;
       0.725; 0.746; 0.679; 0.608; 0.655; 0.616; 0.606; 0.602; 0.625;
       0.651; 0.724; 0.649; 0.649; 0.694; 0.644; 0.624; 0.661; 0.612;
       0.558; 0.533; 0.495; 0.500; 0.423; 0.395; 0.375; 0.372; 0.391;
       0.396; 0.405; 0.428; 0.429; 0.523; 0.562; 0.607; 0.653; 0.672;
       0.708; 0.633; 0.668; 0.645; 0.632; 0.591; 0.559; 0.597; 0.625;
       0.739; 0.710; 0.729; 0.720; 0.636; 0.581; 0.428; 0.292; 0.162;
       0.098; 0.054]
  model = Model()
  @variable(model, x[1:11])
  setvalue(x, [1.3; 0.65; 0.65; 0.7; 0.6; 3.0; 5.0; 7.0; 2.0; 4.5; 5.5])
  @NLexpression(model, F[i=1:65], y[i] - x[1] * exp(-t[i] * x[5]) +
                x[2] * exp(-(t[i] - x[9])^2 * x[6]) +
                x[3] * exp(-(t[i] - x[10])^2 * x[7]) +
                x[4] * exp(-(t[i] - x[11])^2 * x[8]))

  return MathProgNLSModel(model, F, name="mgh19")
end
