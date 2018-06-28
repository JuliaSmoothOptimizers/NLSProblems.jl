# TP problem 288 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 288,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp288

"Test problem 288 in NLS format"
function tp288()

  nls = Model()
  x0  = [3*ones(5); -ones(5); zeros(5); ones(5)]
  @variable(nls, x[i=1:20], start=x0[i])

  @NLexpression(nls, FA[i=1:5], x[i] + 10*x[i+5])
  @NLexpression(nls, FB[i=1:5], sqrt(5)*(x[i+10] - x[i+15]))
  @NLexpression(nls, FC[i=1:5], (x[i+5] - 2*x[i+10])^2)
  @NLexpression(nls, FD[i=1:5], sqrt(10)*(x[i] - x[i+15])^2)  	

  return MathProgNLSModel(nls, [FA; FB; FC; FD], name="tp288")
end