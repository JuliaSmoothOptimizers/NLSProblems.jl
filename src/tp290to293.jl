# TP problem 290, 291, 292 and 293 in NLS format
#
#   Source:
#   Klaus Schittkowski,
#   More test examples for nonlinear programming codes,
#   Lecture Notes in Economics and Mathematical Systems 290,
#   Springer Verlag Berlin Heidelberg, 1987
#   10.1007/978-3-642-61582-5
#
# A. Montoison, Montréal, 06/2018.

export tp290, tp291, tp292, tp293

function tp290to293(n :: Int=2, version :: String="tp290")

  nls = Model()
  @variable(nls, x[i=1:n], start=1)

  @NLexpression(nls, F, sum(i * x[i]^2 for i=1:n))

  return MathProgNLSModel(nls, [F], name=version)
end

"Test problem 290 in NLS format"
tp290() = tp290to293(2, "tp290")

"Test problem 291 in NLS format"
tp291() = tp290to293(10, "tp291")

"Test problem 292 in NLS format"
tp292() = tp290to293(30, "tp292")

"Test problem 293 in NLS format"
tp293() = tp290to293(50, "tp293")
