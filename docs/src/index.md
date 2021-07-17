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
\rho = \sum_{m, n} p_{m, n} | m \rangle \langle n |
```

And, ``W_{m, n}(x, p)`` is the generalized Wigner function

```math
W_{m, n} = \{ \begin{array}{rcl}
\frac{1}{\pi} exp[-(x^2 + y^2)] (-1)^m  \sqrt{2^{n-m} \frac{m!}{n!}} (x-ip)^{n-m} L_m^{n-m} (2x^2 + 2p^2), \, n \geq m \\
\frac{1}{\pi} exp[-(x^2 + y^2)] (-1)^n  \sqrt{2^{m-n} \frac{n!}{m!}} (x+ip)^{m-n} L_n^{m-n} (2x^2 + 2p^2), \, n < m \\
\end{array}
```

### Example

The quantum state:

```math
| \psi \rangle = \hat{D}(\alpha) \hat{S}(\xi) | 1 \rangle
```

with, ``\alpha = 5 \times exp(-i \frac{3\pi}{4})`` and ``\xi = 0.6 \times exp(-i \pi)``

```julia
using QuantumStateBase
using QuantumStatePlots

state = displace!(squeeze!(SinglePhotonState(), ξ(0.6, 1π)), α(5., 3π/2))
wf = WignerFunction(-10:0.1:10, -10:0.1:10)

plot_wigner(wf(state), Heatmap) # Wigner function in `Heatmap` representation
plot_all(wf(state), state) # summery plot
```

#### Result

* **Wigner function in `Heatmap` representation**

![](assets/heatmap.png)

* **Summery plot**

![](assets/all.png)

### Reference

* [Quantum mechanics as a statistical theory](https://doi.org/10.1017/S0305004100000487)

## Index
```@index
```

## APIs
```@autodocs
Modules = [QuantumStatePlots]
```
