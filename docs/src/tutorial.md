# NLSProblems.jl Tutorial

You can obtain the list of problems currently defined with `names(NLSProblems)` that returns the list of exported names of the module. The symbol `:NLSProblems` is itself in this list.
``` @example ex1
using NLSProblems
problems = setdiff(names(NLSProblems), [:NLSProblems])
length(problems)
```
Then, it suffices to select any of this problem to get the `MathOptNLSModel` model [NLPModelsJuMP.jl](https://github.com/JuliaSmoothOptimizers/NLPModelsJuMP.jl).
``` @example ex1
nls_model = hs01()
```
Note that some of these problems are scalable, i.e., their size depends on some parameters that can be modified.
``` @example ex1
nls_model_12 = BNST2(12)
```
``` @example ex1
nls_model_120 = BNST2(120)
```
