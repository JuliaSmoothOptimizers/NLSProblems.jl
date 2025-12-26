ENV["GKSwstype"] = "100"
using Documenter, NLSProblems

makedocs(
  modules = [NLSProblems],
  doctest = true,
  linkcheck = true,
  format = Documenter.HTML(
    assets = ["assets/style.css"],
    ansicolor = true,
    prettyurls = get(ENV, "CI", nothing) == "true",
  ),
  sitename = "NLSProblems.jl",
  pages = [
    "Home" => "index.md",
    "Tutorial" => "tutorial.md",
    "Benchmark" => "benchmark.md",
    "Reference" => "reference.md",
  ],
)

deploydocs(
  repo = "github.com/JuliaSmoothOptimizers/NLSProblems.jl.git",
  push_preview = true,
  devbranch = "main",
)
