# NLSProblems - Nonlinear Least Squares problems

[![Build Status](https://travis-ci.org/JuliaSmoothOptimizers/NLSProblems.jl.svg?branch=master)](https://travis-ci.org/JuliaSmoothOptimizers/NLSProblems.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/gvkfw6sxf1p2qewt/branch/master?svg=true)](https://ci.appveyor.com/project/dpo/nlsproblems-jl/branch/master)


This package provides some optimization problems using the
[https://github.com/JuliaSmoothOptimizers/NLPModels.jl](NLPModels.jl)
interface. It is similar to to
[https://github.com/JuliaSmoothOptimizers/OptimizationProblems.jl](OptimizationProblems.jl),
except that it's specific for Nonlinear Least Squares, using the subtype
of `AbstractNLSModel`s.

We welcome contributions.

## Install

Simply issue

```
Pkg.clone("https://github.com/JuliaSmoothOptimizers/NLSProblems.jl")
```

## LICENSE

This package is licensed under the MIT License (see
[LICENSE](LICENSE.md)). However, the problems have specific sources, and
you'll probably want to cite those sources, as well.
