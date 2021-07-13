var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = QuantumStatePlots","category":"page"},{"location":"#QuantumStatePlots","page":"Home","title":"QuantumStatePlots","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for QuantumStatePlots.","category":"page"},{"location":"#About","page":"Home","title":"About","text":"","category":"section"},{"location":"#Render-Wigner-function","page":"Home","title":"Render Wigner function","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Based on the definition of Wigner function in Fock basis:","category":"page"},{"location":"","page":"Home","title":"Home","text":"W_mn(x p) = frac12pi int_-infty^infty dy  e^-ipyh psi_m^*(x+fracy2) psi_n(x-fracy2)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Owing to the fact that the Moyal function is a generalized Wigner function. We can therefore implies that","category":"page"},{"location":"","page":"Home","title":"Home","text":"W(x p) = sum_m n rho_m n W_m n(x p)","category":"page"},{"location":"","page":"Home","title":"Home","text":"Here, rho is the density matrix of the quantum state, defined as:","category":"page"},{"location":"","page":"Home","title":"Home","text":"rho = sum_m n p_m n  m rangle langle n ","category":"page"},{"location":"","page":"Home","title":"Home","text":"And, W_m n(x p) is the generalized Wigner function","category":"page"},{"location":"","page":"Home","title":"Home","text":"W_m n =  beginarrayrcl\nfrac1pi exp-(x^2 + y^2) (-1)^m  sqrt2^n-m fracmn (x-ip)^n-m L_m^n-m (2x^2 + 2p^2)  n geq m \nfrac1pi exp-(x^2 + y^2) (-1)^n  sqrt2^m-n fracnm (x+ip)^m-n L_n^m-n (2x^2 + 2p^2)  n geq m \nendarray\n","category":"page"},{"location":"#Example","page":"Home","title":"Example","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The quantum state:","category":"page"},{"location":"","page":"Home","title":"Home","text":" psi rangle = hatD(alpha) hatS(xi)  1 rangle","category":"page"},{"location":"","page":"Home","title":"Home","text":"with, alpha = 5 times exp(-i frac3pi4) and xi = 06 times exp(-i pi)","category":"page"},{"location":"","page":"Home","title":"Home","text":"using QuantumStateBase\nusing QuantumStatePlots\n\nstate = displace!(squeeze!(SinglePhotonState(), ξ(0.6, 1π)), α(5., 3π/2))\nwf = WignerFunction(-10:0.1:10, -10:0.1:10)\n\nplot_wigner(wf(state), Heatmap) # Wigner function in `Heatmap` representation\nplot_all(wf(state), state) # summery plot","category":"page"},{"location":"#Result","page":"Home","title":"Result","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Wigner function in Heatmap representation","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"","page":"Home","title":"Home","text":"Summery plot","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: )","category":"page"},{"location":"#Reference","page":"Home","title":"Reference","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Quantum mechanics as a statistical theory","category":"page"},{"location":"#Index","page":"Home","title":"Index","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"#APIs","page":"Home","title":"APIs","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [QuantumStatePlots]","category":"page"},{"location":"#QuantumStatePlots.Contour","page":"Home","title":"QuantumStatePlots.Contour","text":"Contour <: PlotMethod\n\nContour representation for Wigner function of quantum state.\n\n\n\n\n\n","category":"type"},{"location":"#QuantumStatePlots.Heatmap","page":"Home","title":"QuantumStatePlots.Heatmap","text":"Heatmap <: PlotMethod\n\nHeatmap representation for Wigner function of quantum state.\n\n\n\n\n\n","category":"type"},{"location":"#QuantumStatePlots.Surface","page":"Home","title":"QuantumStatePlots.Surface","text":"Surface <: PlotMethod\n\nSurface representation for Wigner function of quantum state.\n\n\n\n\n\n","category":"type"},{"location":"#QuantumStatePlots.plot_all-Tuple{WignerSurface, AbstractState}","page":"Home","title":"QuantumStatePlots.plot_all","text":"plot_all(\n    ws::WignerSurface, state::AbstractState;\n    state_n::Integer=0, size=(1100, 900), file_path=nothing\n)\n\nPlot Wifner function and density matrux of given quantum state in both Surface and Contour representation.\n\nstate_n=n: truncate to nth photon number\n\nExamples\n\njulia> using QuantumStateBase\njulia> state = CoherentState(α(5., π/4));\njulia> wf = WignerFunction(-10:0.1:10, -10:0.1:10);\njulia> plot_all(wf(state), state)\n\n\n\n\n\n","category":"method"},{"location":"#QuantumStatePlots.plot_wigner-Tuple{WignerSurface, Type{Contour}}","page":"Home","title":"QuantumStatePlots.plot_wigner","text":"plot_wigner(ws::WignerSurface, Contour; size=(1100, 900), file_path=nothing)\n\nPlot Wigner function of given quantum state in Contour representation.\n\nExamples\n\njulia> using QuantumStateBase\njulia> state = CoherentState(α(5., π/4));\njulia> wf = WignerFunction(-10:0.1:10, -10:0.1:10);\njulia> plot_wigner(wf(state), Contour)\n\n\n\n\n\n","category":"method"},{"location":"#QuantumStatePlots.plot_wigner-Tuple{WignerSurface, Type{Heatmap}}","page":"Home","title":"QuantumStatePlots.plot_wigner","text":"plot_wigner(ws::WignerSurface, Heatmap; size=(1100, 900), file_path=nothing)\n\nPlot Wigner function of given quantum state in Heatmap representation.\n\nExamples\n\njulia> using QuantumStateBase\njulia> state = CoherentState(α(5., π/4));\njulia> wf = WignerFunction(-10:0.1:10, -10:0.1:10);\njulia> plot_wigner(wf(state), Surface)\n\n\n\n\n\n","category":"method"},{"location":"#QuantumStatePlots.plot_wigner-Tuple{WignerSurface, Type{Surface}}","page":"Home","title":"QuantumStatePlots.plot_wigner","text":"plot_wigner(ws::WignerSurface, Surface; size=(1100, 900), file_path=nothing)\n\nPlot Wigner function of given quantum state in Surface representation.\n\nExamples\n\njulia> using QuantumStateBase\njulia> state = CoherentState(α(5., π/4));\njulia> wf = WignerFunction(-10:0.1:10, -10:0.1:10);\njulia> plot_wigner(wf(state), Surface)\n\n\n\n\n\n","category":"method"},{"location":"#QuantumStatePlots.plot_ρ-Tuple{AbstractState}","page":"Home","title":"QuantumStatePlots.plot_ρ","text":"plot_ρ(state::AbstractState; state_n::Integer=0, size=(1100, 900), file_path=nothing)\n\nPlot density matrux of given quantum state.\n\nstate_n=n: truncate to nth photon number\n\nExamples\n\njulia> using QuantumStateBase\njulia> state = CoherentState(α(5., π/4));\njulia> plot_ρ(state)\n\n\n\n\n\n","category":"method"}]
}
