# TP problem 204 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 282,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp204

"Test problem 204 in NLS format"
function tp204()

  nls = Model()
  x0  = [0.1; 0.1]
  @variable(nls, x[i=1:2], start=x0[i])

  A = [0.13294; -0.244378; 0.325895]
  D = [2.5074; -1.36401; 1.02282]
  H = [-0.564255 0.392417;
       -0.404979 0.927589;
       -0.0735084 0.535493]
  B = [5.66598 2.77141;
  	   2.77141 2.12413]

  # F = A + Hx + ½(xᵀBx)D
  @NLexpression(nls, F[k=1:3], A[k] + sum(x[i] * H[k,i] for i=1:2) + 0.5 * D[k] * sum(B[i,j] * x[i] * x[j] for i=1:2, j=1:2))

  return MathProgNLSModel(nls, F, name="tp204")
end