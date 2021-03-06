using QuantumStatePlots
using Documenter

DocMeta.setdocmeta!(QuantumStatePlots, :DocTestSetup, :(using QuantumStatePlots); recursive=true)

makedocs(;
    modules=[QuantumStatePlots],
    authors="JingYu Ning <foldfelis@gmail.com> and contributors",
    repo="https://github.com/foldfelis-QO/QuantumStatePlots.jl/blob/{commit}{path}#{line}",
    sitename="QuantumStatePlots.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://foldfelis-QO.github.io/QuantumStatePlots.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/foldfelis-QO/QuantumStatePlots.jl",
    devbranch="master",
)
