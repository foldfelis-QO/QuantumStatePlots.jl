module QuantumStatePlots

using Plots
using QuantumStateBase

export plot_real, plot_imag

# ##########
# # wigner #
# ##########

function Plots.surface(w::WignerSurface; kwargv...)
    lim = maximum(abs.(w.𝐰_surface))

    default_kwargv = Dict([
        :title => "Wigner Function",
        :xlabel => "X",
        :ylabel => "P",
        :zlabel => "Quasiprobability",
        :clim => (-lim, lim),
        :color => :coolwarm,
        :camera => (40, 30),
    ])

    return surface(w.x_range, w.p_range, w.𝐰_surface'; merge(default_kwargv, kwargv)...)
end

function Plots.heatmap(w::WignerSurface; kwargv...)
    lim = maximum(abs.(w.𝐰_surface))

    default_kwargv = Dict([
        :title => "Wigner Function",
        :xlabel => "X",
        :ylabel => "P",
        :clim => (-lim, lim),
        :color => :coolwarm,
        :aspect_ratio => :equal,
    ])

    return heatmap(w.x_range, w.p_range, w.𝐰_surface'; merge(default_kwargv, kwargv)...)
end

function Plots.contour(w::WignerSurface; kwargv...)
    lim = maximum(abs.(w.𝐰_surface))

    default_kwargv = Dict([
        :title => "Wigner Function",
        :xlabel => "X",
        :ylabel => "P",
        :clim => (-lim, lim),
        :color => :coolwarm,
        :aspect_ratio => :equal,
        :fill => true,
        :levels => 20,
    ])

    return contour(w.x_range, w.p_range, w.𝐰_surface'; merge(default_kwargv, kwargv)...)
end

# #####
# # ρ #
# #####

function plot_real(ρ, truncate=0; kwargv...)
    return plot_ρ(real(ρ), truncate; merge(Dict([:title => "Density Matrux (real part)"]), kwargv)...)
end

function plot_imag(ρ, truncate=0; kwargv...)
    return plot_ρ(imag(ρ), truncate; merge(Dict([:title => "Density Matrux (imag part)"]), kwargv)...)
end

function plot_ρ(ρ::AbstractMatrix, truncate::Integer; kwargv...)
    photon_number_range = Base.OneTo(size(ρ, 1))
    if truncate > 0
        photon_number_range = 1:truncate
        ρ = ρ[photon_number_range, photon_number_range]
    end
    photon_number_range = photon_number_range .- 1 # labels of m, n

    lim = maximum(abs.(ρ))

    default_kwargv = Dict([
        :title => "Density Matrux",
        :xlabel => "m",
        :ylabel => "n",
        :clim => (-lim, lim),
        :color => :coolwarm,
        :aspect_ratio => :equal,
    ])

    return heatmap(photon_number_range, photon_number_range, ρ; merge(default_kwargv, kwargv)...)
end

end
