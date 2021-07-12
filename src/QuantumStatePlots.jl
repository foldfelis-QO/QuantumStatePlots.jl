module QuantumStatePlots

using Plots
using QuantumStateBase

export
    Heatmap,
    Contour,
    Surface,
    plot_wigner,
    plot_ρ,
    plot_all

DEFAULT_SIZE = (1100, 900)

abstract type PlotMethod end

struct Heatmap <: PlotMethod end

struct Contour <: PlotMethod end

struct Surface <: PlotMethod end

function plot_wigner(
    ws::WignerSurface, ::Type{Heatmap};
    size=DEFAULT_SIZE,
    file_path=nothing
)
    !isnothing(size) && (gr(size=size) isa Plots.GRBackend) || gr()

    lim = maximum(abs.(ws.𝐰_surface))
    p = Plots.heatmap(
        ws.x_range, ws.p_range, ws.𝐰_surface',
        title="Wigner Function",
        xlabel="X",
        ylabel="P",
        clim=(-lim, lim),
        c=:coolwarm,
    )

    isnothing(file_path) || savefig(p, file_path)

    return p
end

function plot_wigner(
    ws::WignerSurface, ::Type{Contour};
    levels=20,
    size=DEFAULT_SIZE,
    file_path=nothing
)
    !isnothing(size) && (gr(size=size) isa Plots.GRBackend) || gr()

    lim = maximum(abs.(ws.𝐰_surface))
    p = Plots.contour(
        ws.x_range, ws.p_range, ws.𝐰_surface',
        title="Wigner Function",
        xlabel="X",
        ylabel="P",
        clim=(-lim, lim),
        fill=true,
        levels=levels,
        c=:coolwarm,
    )

    isnothing(file_path) || savefig(p, file_path)

    return p
end

function plot_wigner(
    ws::WignerSurface, ::Type{Surface};
    size=DEFAULT_SIZE,
    file_path=nothing
)
    !isnothing(size) && (gr(size=size) isa Plots.GRBackend) || gr()

    lim = maximum(abs.(ws.𝐰_surface))
    p = Plots.surface(
        ws.x_range, ws.p_range, ws.𝐰_surface',
        title="Wigner Function",
        xlabel="X",
        ylabel="P",
        clim=(-lim, lim),
        zlim=(-lim, lim),
        c=:coolwarm,
        # fillalpha=0.99, # this cause Pluto crash, work with DisplayAs
        camera=(40, 30),
    )

    isnothing(file_path) || savefig(p, file_path)

    return p
end

function plot_ρ(
    state::AbstractState;
    state_n=0,
    size=DEFAULT_SIZE,
    file_path=nothing
)
    ρᵣ = real(𝛒(state))
    if state_n != 0
        ρᵣ = ρᵣ[1:state_n+1, 1:state_n+1]
    else
        state_n = Base.size(ρᵣ)[1] - 1
    end

    !isnothing(size) && (gr(size=size) isa Plots.GRBackend) || gr()

    lim = maximum(ρᵣ)
    p = Plots.heatmap(
        0:state_n, 0:state_n, ρᵣ,
        title="Density Matrix (Real part)",
        xlabel="m",
        ylabel="n",
        c=:coolwarm,
        clim=(-lim, lim)
    )

    isnothing(file_path) || savefig(p, file_path)

    return p
end

function plot_all(
    ws::WignerSurface, state::AbstractState;
    state_n=0,
    size=DEFAULT_SIZE,
    file_path=nothing
)
    !isnothing(size) && (gr(size=size) isa Plots.GRBackend) || gr()

    l = @layout [
		a{0.55h}
		grid(1, 2)
	]
    p = plot(
        plot_wigner(ws, Surface, size=nothing),
        plot_wigner(ws, Heatmap, size=nothing),
        plot_ρ(state, state_n=state_n, size=nothing),
        layout=l
    )

    isnothing(file_path) || savefig(p, file_path)

    return p
end

end
