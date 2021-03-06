```@meta
CurrentModule = QuantumStatePlots
```

# QuantumStatePlots

Documentation for [QuantumStatePlots](https://github.com/foldfelis-QO/QuantumStatePlots.jl).

## About

### Render Wigner function

Based on the definition of Wigner function in Fock basis:

```math
W_{mn}(x, p) = \frac{1}{2\pi} \int_{-\infty}^{\infty} dy \, e^{-ipy/h} \psi_m^*(x+\frac{y}{2}) \psi_n(x-\frac{y}{2})
```

Owing to the fact that the Moyal function is a generalized Wigner function. We can therefore implies that

```math
W(x, p) = \sum_{m, n} \rho_{m, n} W_{m, n}(x, p)
```

Here, ``\rho`` is the density matrix of the quantum state, defined as:

```math
\rho = \sum_{m, n, i} \, p_i \, | n \rangle \langle n | \hat{\rho}_i | m \rangle \langle m |
```

```math
\hat{\rho}_i = | \psi_i \rangle \langle \psi_i |
```

```math
\hat{\rho}_i \, \text{is a density operator of pure state.}
```

And, ``W_{m, n}(x, p)`` is the generalized Wigner function

```math
W_{m, n} = \{ \begin{array}{rcl}
\frac{1}{\pi} exp[-(x^2 + y^2)] (-1)^m  \sqrt{2^{n-m} \frac{m!}{n!}} (x-ip)^{n-m} L_m^{n-m} (2x^2 + 2p^2), \, n \geq m \\
\frac{1}{\pi} exp[-(x^2 + y^2)] (-1)^n  \sqrt{2^{m-n} \frac{n!}{m!}} (x+ip)^{m-n} L_n^{m-n} (2x^2 + 2p^2), \, n < m \\
\end{array}
```

### Example

The quantum state and its wigner function:

```julia-repl
julia> using QuantumStateBase

julia> ρ = SqueezedState(0.8, π/8, Matrix, dim=100)

julia> w = wigner(ρ, LinRange(-3, 3, 101), LinRange(-3, 3, 101));
```

#### Wigner function

**Surface**

```julia-repl
julia> using QuantumStatePlots, Plots

julia> surface(w)
```

![](assets/surface.png)

**Heatmap**

```julia-repl
julia> using QuantumStatePlots, Plots

julia> heatmap(w)
```

![](assets/heatmap.png)

**Contour**

```julia-repl
julia> using QuantumStatePlots, Plots

julia> contour(w)
```

![](assets/contour.png)

#### Density matrix

**Real part**

```julia-repl
julia> using QuantumStatePlots, Plots

julia> plot_real(ρ, 35)
```

![](assets/real.png)

**Imag part**

```julia-repl
julia> using QuantumStatePlots, Plots

julia> plot_imag(ρ, 35)
```

![](assets/imag.png)

### Reference

* [Quantum mechanics as a statistical theory](https://doi.org/10.1017/S0305004100000487)

## Index
```@index
```

## APIs
```@autodocs
Modules = [QuantumStatePlots]
```
