using QuantumStatePlots
using QuantumStateBase
using Test

@testset "QuantumStatePlots.jl" begin

ENV["GKSwstype"]="nul"

@testset "plot wigner" begin
    x_range = -5:1.0:5
    p_range = -5:1.0:5
    wf = WignerFunction(x_range, p_range)

    state = VacuumState()
    ws = wf(state)

    file_path = "wigner.png"

    plot_wigner(ws, Heatmap, file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)

    plot_wigner(ws, Contour, file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)

    plot_wigner(ws, Surface, file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)
end

@testset "plot ρ" begin
    file_path = "rho.png"

    plot_ρ(VacuumState(), file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)

    plot_ρ(VacuumState(), state_n=5, file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)
end

@testset "plot all" begin
    x_range = -5:1.0:5
    p_range = -5:1.0:5
    wf = WignerFunction(x_range, p_range)

    state = VacuumState()
    ws = wf(state)

    file_path = "all.png"

    plot_all(ws, state, file_path=file_path)
    @test isfile(file_path)
    isfile(file_path) && rm(file_path)
end

end
