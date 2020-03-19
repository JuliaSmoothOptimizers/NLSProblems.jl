# TP problem 294, 295, 296, 297, 298 and 299 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 294,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp294, tp295, tp296, tp297, tp298, tp299

"Test problem 294 in NLS format"
function tp294(n :: Int=6; version :: String="tp294")

  nls = Model()
  x0  = [(n ≤ 16 && i % 2 == 0) ? 1.0 : -1.2 for i=1:n]
  @variable(nls, x[i=1:n], start=x0[i])

  @NLexpression(nls, FA[k=1:n-1], 10 * (x[k+1] - x[k]^2))
  @NLexpression(nls, FB[k=1:n-1], 1 - x[k])

  return MathOptNLSModel(nls, [FA; FB], name=version)
end

"Test problem 295 in NLS format"
tp295(args...) = tp294(10, version="tp295")

"Test problem 296 in NLS format"
tp296(args...) = tp294(16, version="tp296")

"Test problem 297 in NLS format"
tp297(args...) = tp294(30, version="tp297")

"Test problem 298 in NLS format"
tp298(args...) = tp294(50, version="tp298")

"Test problem 299 in NLS format"
tp299(args...) = tp294(100, version="tp299")