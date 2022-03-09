# QuantumStatePlots

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://foldfelis-qo.github.io/QuantumStatePlots.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://foldfelis-qo.github.io/QuantumStatePlots.jl/dev)
[![CI](https://github.com/foldfelis-QO/QuantumStatePlots.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/foldfelis-QO/QuantumStatePlots.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/foldfelis-QO/QuantumStatePlots.jl/branch/master/graph/badge.svg?token=6VKJECY4CX)](https://codecov.io/gh/foldfelis-QO/QuantumStatePlots.jl)

## Example

The quantum state and its wigner function:

```julia
julia> using QuantumStateBase

julia> ρ = SqueezedState(0.8, π/8, Matrix, dim=100)

julia> w = wigner(ρ, LinRange(-3, 3, 101), LinRange(-3, 3, 101));
```

### Wigner function

**Surface**

```julia
julia> using QuantumStatePlots, Plots

julia> surface(w)
```

![](docs/src/assets/surface.png)

**Heatmap**

```julia
julia> using QuantumStatePlots, Plots

julia> heatmap(w)
```

![](docs/src/assets/heatmap.png)

**Contour**

```julia
julia> using QuantumStatePlots, Plots

julia> contour(w)
```

![](docs/src/assets/contour.png)

### Density matrix

**Real part**

```julia
julia> using QuantumStatePlots, Plots

julia> plot_real(ρ, 35)
```

![](docs/src/assets/real.png)

**Imag part**

```julia
julia> using QuantumStatePlots, Plots

julia> plot_imag(ρ, 35)
```

![](docs/src/assets/imag.png)

## Reference

* [Quantum mechanics as a statistical theory](https://doi.org/10.1017/S0305004100000487)
