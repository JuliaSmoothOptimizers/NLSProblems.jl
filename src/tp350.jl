# TP problem 350 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp350

"Test problem 350 in NLS format"
function tp350(args...)
  nls = Model()
  x0 = [0.25; 0.39; 0.415; 0.39]
  @variable(nls, x[i = 1:4], start = x0[i])

  y = [0.1957; 0.1947; 0.1735; 0.1600; 0.0844; 0.0627; 0.0456; 0.0342; 0.0323; 0.0235; 0.0246]
  u = [4.0000; 2.0000; 1.0000; 0.5000; 0.2500; 0.1670; 0.1250; 0.1000; 0.0833; 0.0714; 0.0625]
  @NLexpression(
    nls,
    F[i = 1:11],
    y[i] - (x[1] * (u[i]^2 + x[2] * u[i])) / (u[i]^2 + x[3] * u[i] + x[4])
  )

  return MathOptNLSModel(nls, F, name = "tp350")
end
