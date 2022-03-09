using QuantumStatePlots
using Plots
using QuantumStateBase
using VisualRegressionTests
using Test

@testset "QuantumStatePlots.jl" begin

ENV["GKSwstype"]="nul"

ρ = SqueezedState(0.8, π/8, Matrix, dim=100)
w = wigner(ρ, LinRange(-3, 3, 101), LinRange(-3, 3, 101))

# ##########
# # wigner #
# ##########

@plottest begin
    surface(w)
end "assets/surface.png"

@plottest begin
    heatmap(w)
end "assets/heatmap.png"

@plottest begin
    contour(w)
end "assets/contour.png"

# #####
# # ρ #
# #####

@plottest begin
    plot_real(ρ, 35)
end "assets/real.png"

@plottest begin
    plot_imag(ρ, 35)
end "assets/imag.png"

end
