# BFSS M4-LB1P0 — elementary skew-plane alternative to native full 48×48 expansion

**Date:** 2026-11-16 (Pacific). **Status:** FORWARD RESEARCH / bounded design, **not a new Lean theorem**. Existing LB1L2 **STRICT GREEN** is accepted; earlier direct native LB1L0/D0/D1 attempts remain RED.

## Problem and decision

The now-qualified LB1L2 theorem gives an opaque hypothesis-first Fock-operator commutator rule, but source instantiation `T=originalSource48BivectorK A`, `X=sourceNormalizedGamma p`, `Y=sourceNormalizedGamma q` has caused either elaboration recursion or kernel timeout when attempted with literal full source terms. A second route should avoid putting the entire `originalSource48BivectorK A` definition into elaboration at once.

## Native skew-plane generators

For two distinct `i,j : Source48Label`, define `E^{ij}` on the original 48 real-mode labels by

```text
E^{ij}[p,q] = δ[p,i]δ[q,j] - δ[p,j]δ[q,i].
```

It is skew: `(E^{ij})ᵀ=-E^{ij}`. With literal original source `K(A)=¼∑_(p,q) A[p,q] Γ_pΓ_q` and source CAR `Γ_iΓ_j=-Γ_jΓ_i` for `i≠j`,

```text
K(E^{ij}) = ¼(Γ_iΓ_j-Γ_jΓ_i) = ½Γ_iΓ_j.
```

This *must be separately proven in Lean on the exact Source48Label and real/complex scalar interface*; do not assume a convenient Clifford-algebra isomorphism or replace original `Fermion 2`. It is one sparse finite-sum contraction rather than an arbitrary 48×48 expansion.

Then set `J_{ij}=½Γ_iΓ_j` for `i≠j`, with sign conventions fixed by the accepted LB1C1 source. For arbitrary indices, the candidate universal bivector commutator is

```text
[Γ_iΓ_j,Γ_kΓ_l]
  = 2δ[j,k]Γ_iΓ_l − 2δ[i,k]Γ_jΓ_l
    + 2δ[j,l]Γ_kΓ_i − 2δ[i,l]Γ_kΓ_j.
```

This can be checked by CAR and noncommutative ring normalization, or via the already accepted original LB0 triple commutator plus opaque operator Leibniz from LB1L2. Keep duplicated/ordered labels and zero-diagonal cases explicit, and check the ½ versus ¼ scaling.

The elementary real skew matrices satisfy

```text
[E^{ij},E^{kl}]
 = δ[j,k]E^{il} − δ[i,k]E^{jl}
   + δ[j,l]E^{ki} − δ[i,l]E^{kj}.
```

The bracket signs should be checked against native `A[p,q]` index convention and `[K(A),Γ_k]=∑_p A[p,k]Γ_p`, rather than copying a Lie-algebra formula from an alternate left/right action convention. A basis-level `K([E,F])=[K(E),K(F)]` can then be proved on `J_{ij}`.

## Proposed staged proof and stop rules

**P0 — sparse source-plane normalization:** isolate an explicit original off-diagonal basis `E^{ij}`, its transpose skewness and exact `K(E^{ij})=½Γ_iΓ_j` on real original Fock carrier, each with independent consumer. Do not combine the full Lie bracket at this step. Pin qualified LB0/LB1S/LB1C1/LB1L2 donor bytes. Bound the finite sum simplification and use a tiny source **only at this one sparse matrix**. Keep scalar coefficient transfer original.

**P1 — four-Majorana bivector CAR:** for original labels prove the four-gamma commutator identity by CAR and noncommutative distributivity, preferably using opaque atom hypotheses. Independently compare 2-, 3- and 4-overlap cases so signs/diagonal conventions are protected. If native elaboration explodes, reduce to a generic four-operator theorem whose hypotheses are the literal original CAR propositions, and treat the bridge separately.

**P2 — plane-bracket preservation:** certify the matrix-basis bracket and Fock-bivector bracket on generators. Build an independent source-side consumer to rule out silent basis or sign changes.

**P3 — finite linear extension:** prove every real skew `Source48Label×Source48Label` matrix is a finite linear combination of `E^{ij}`; prove native K linearity, then extend bracket-preservation bilinearly. Do not assume Lie-homomorphism of all `so(48)` prior to this.

Each stage must have a concrete mathematical statement, isolated original operator source, independent consumer, exact pinning, frozen Lean 4.34.1/Mathlib and no sorry/limit inflation before launching its strict CI. At first RED preserve diagnosed cause and stop; do not simply swap full-source tactics again.

## Alternative path, if the sparse source plane itself times out

A generic indexed abstract **finite double-sum transport lemma** on the genuine original Fock carrier can avoid literal 48-label expansion. Prove using LB1C0-style additive commutator and real-smul adapters on opaque families and matrix entries. At the final boundary, use a single source-exact data interface: finite `K(A)` sum expansion is definitional by the fixed accepted original source and `∀k` covariance is LB1C1; do not broaden the abstract theorem by assuming hidden properties of gamma.

## What this is NOT

No evidence for an independent 1128-dimensional Hamiltonian symmetry; no Spin(9) or SU(2) group-level implementation, physical singlet, supercharge domain invariance, 2066-state count or spectral gap is claimed. A Lie bracket for all skew 48×48 matrices is a *kinematic Fock representation fact* and must be distinguished from the physical BFSS Hamiltonian invariance (39-dimensional subalgebra candidate).

## Next decision

Recommend **P0 sparse plane only** for next CI, after preflight reading the actual original `Source48Label` equality/Fintype API and available native real scalar simplification lemmas. If defining `E^{ij}` cannot preserve correct `Source48Label` and `K(E)` with a small, source-exact Lean proof, fall back to the abstract finite-sum transport route. Never build a new synthetic Clifford model or alter the accepted donor.
