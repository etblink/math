# IBI quantum-facing no-go — an orientation-odd, gauge-invariant Schwartz witness

**Date:** 2026-11-14 Pacific / 2026-11-15 UTC.
**Classification:** conventional finite-dimensional analytic proof and exact
symbolic check; **NOT source-specific Lean qualification, original
FullL2 physical vector, original Hamiltonian domain result or ontology claim**.
Companion: [rank-two smooth-quotient investigation](IBI_RANK2_LOCAL_ORBIT_GEOMETRY_FORWARD_RESEARCH_2026_11_14.md).

## Motivation: loss of legitimate scalar states

In the standard nine-vector real SU(2)-adjoint / effective SO(3)
classical model, put `X=(x_0,...,x_8)∈(R^3)^9`, `r²=∑||x_i||²`,
and `D(X)=det(x_0,x_1,x_2)`. Define

  f(X) = D(X) exp(-r²).

This is a nonzero smooth, rapidly decreasing function on R^27.
For R∈SO(3), `f(RX)=det(R) f(X)=f(X)`.
For a fixed improper reflection S∈O(3) with det S=-1,
`f(SX)=-f(X)`. Meanwhile `G(SX)=G(X)` for
the entire Gram tensor. Hence **f is a legitimate scalar
SO(3)-gauge-invariant L² function but cannot be represented
by any function of G alone**, not even almost everywhere.

More quantitatively, if `h(G(X))∈L²(R^27)` is any complex
Gram-only scalar state, reflection invariance of Lebesgue measure
gives

  <f,h∘G> = -<f,h∘G> = 0.

Thus the Gram-only sector is a proper (O(3)-even) subspace of the
SO(3)-invariant scalar L² space. The orientation-odd scalar sector
is nonzero, not merely a choice of redundant coordinates.

## Nonzero norm and simple kinetic diagnostic

D is homogeneous of degree 3 and harmonic on R^27:
`sum X_a ∂_a D=3D`, `ΔD=0`. The second identity holds because
each of the 3x3 determinant terms is degree at most one in each
individual coordinate. Consequently, by the Gaussian product rule,

  Δ f = (4r² - 2·27 - 4·3) f
      = (4r² - 66) f.

So f is in the Schwartz domain of the ordinary bosonic Laplacian
and all polynomial multiplication operators. This does not prove
membership in the **original gauge/Fock** charge domain.

The 3x3 determinant involves only the first nine scalar
coordinates. Under normalized Gaussian density proportional
to `exp(-2r²)`, each real coordinate has variance 1/4.
Expanding det² and using independence gives

  ∫_(R^27) |f(X)|² dX
    = 3! (1/4)^3 (π/2)^(27/2)
    = (3/32) (π/2)^(27/2)  > 0.

A direct SymPy exact symbolic test on the 3x3 determinant
confirmed Euler homogeneity, ΔD=0, variance coefficient 3/32,
and 27D Gaussian Laplacian constant 66.
This is a conventional closed-form calculation, not an
independent source-pinned Lean/CI certificate.

## Implications and strict stopping conditions

- Even a complete Gram description of the **bosonic potential**
  does not make Gram-only a complete bosonic quantum coordinate
  system. The kinetic operator acts on legitimate SO(3)-invariant
  scalar L² states that distinguish the signed D.
- This f is **not automatically a physical original BFSS state**.
  The original `FullL2 2` has a nontrivial Fock fiber and genuine
  SU(2) equivariance; an original source invariant fermion vector,
  exact center action, source color normalization, true measure,
  smooth-core inclusion and charge-domain membership must be audited.
- The full original BFSS supercharges may couple these
  O(3)-parity-labelled scalar subspaces through fermionic terms.
  Do NOT claim the odd scalar subspace is a reducing sector of
  the original Hamiltonian without separate source proof.
- This witness gives a small, falsifiable consumer for G1 and
  a potential route to a genuine source physical test vector
  **if** a certified Fock gauge-singlet and smooth-core map are
  supplied. Do not infer a ground state, spectral gap or fidelity
  certificate from the existence of a Schwartz function.

**Research conclusion:** Gram-only quantization would impose an
extra disconnected O(3) reflection equivalence not supplied by the
effective source SU(2) color gauge symmetry. The signed incidence
tensor D is necessary to preserve these scalar states. Whether this
validates an incidence-first *ontology* is still completely open.
