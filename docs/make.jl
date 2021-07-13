using QuantumStateBase
using QuantumStatePlots
using Documenter

############
# gen logo #
############

ENV["GKSwstype"]="nul"

logo_path = mkpath(joinpath(@__DIR__, "src/assets"))

state = displace!(
    squeeze!(
        SinglePhotonState(rep=StateMatrix),
        ξ(0.6, 1π),
    ),
    α(5., 3π/2)
)

@time wf = WignerFunction(-10:0.1:10, -10:0.1:10)

plot_wigner(wf(state), Heatmap, size=(600, 550), file_path=joinpath(logo_path, "heatmap.png"))
plot_all(wf(state), state, levels=8, size=(600, 550), file_path=joinpath(logo_path, "all.png"))

##################
# build document #
##################

DocMeta.setdocmeta!(QuantumStatePlots, :DocTestSetup, :(using QuantumStatePlots); recursive=true)

makedocs(;
    modules=[QuantumStatePlots],
    authors="JingYu Ning <foldfelis@gmail.com> and contributors",
    repo="https://github.com/foldfelis-QO/QuantumStatePlots.jl/blob/{commit}{path}#{line}",
    sitename="QuantumStatePlots.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://foldfelis-qo.github.io/QuantumStatePlots.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/foldfelis-QO/QuantumStatePlots.jl",
)
