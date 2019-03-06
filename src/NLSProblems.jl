module NLSProblems

using NLPModels, NLPModelsJuMP, JuMP

path = dirname(@__FILE__)
files = filter(x->x[end-2:end] == ".jl", readdir(path))
for file in files
  if file == "NLSProblems.jl"; continue; end
  include(file)
end

end # module
