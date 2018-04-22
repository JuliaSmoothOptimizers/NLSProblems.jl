using NLPModels, NLSProblems
using Base.Test

# Test that every problem can be instantiated.
for prob in names(NLSProblems)
  prob == :NLSProblems && continue
  println(prob)
  prob_fn = eval(prob)
  nls = prob_fn()

  x = nls.meta.x0
  Fx = residual(nls, x)
  Jx = jac_op_residual(nls, x)
  println("  ‖F(x₀)‖ = $(norm(Fx))")
  println("  ‖J(x₀)ᵀF(x₀)‖ = $(norm(Jx'*Fx))")
  if nls.meta.ncon > 0
    println("  ‖c(x₀)‖ = $(norm(cons(nls, x)))")
  end
end
