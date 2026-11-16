# BFSS M4-LB0 — original 48-Majorana bivector first native CAR microgate

**Date:** 2026-11-15 Pacific; remote GitHub Actions logs may record 2026-11-16 UTC.  
**Branch:** `integration/bfss-unified-research-20261108` ONLY per owner.  
**Status:** `STAGED_UNQUALIFIED` until the strict gate actually completes, the three native source and three original-Fock independent consumer axiom reports are accepted, and the exact tested hash/artifact evidence is preserved.

## Rationale and explicit frozen scope

The now-qualified operator-HS group hom [HS1 #43806197198](https://github.com/etblink/math/actions/runs/43806197198) and genuine original negative-central gamma sign [CS0 #43806215702](https://github.com/etblink/math/actions/runs/43806215702) do NOT provide a physical original Fock-vector group representation. The next direct connection is the infinitesimal CAR action on original `Fermion 2`, but avoid a 48×48 skew sum and Lie-bracket/group integration before elementary source CAR and star identities are qualified.

Define `c_p := sourceNormalizedGamma p : Fermion 2 →L[ℂ] Fermion 2` with exact `Source48Label = Fin 24 × Fin 2`, original `sqrt 2` normalized Majorana generators (square 1) and real source 48 CAR. The first source theorem states exactly

```text
(c_p * c_q) * c_k - c_k * (c_p * c_q)
  = c_p * ((if q=k then 2 else 0) • 1)
    - ((if p=k then 2 else 0) • 1) * c_q
```

The second normalizes the central complex scalar factors to
`(if q=k then 2 else 0) • c_p - (if p=k then 2 else 0) • c_q`.
The third proves `star (c_p*c_q) = -(c_p*c_q)` for `p≠q`, using actual source Fock Hilbert adjoint, not a mismatched Clifford odd-star convention.

## Source exactness and strict live gate

- [Strict LB0 R1 #43809206569](https://github.com/etblink/math/actions/runs/43809206569), workflow created at exact commit `2ac81b61d96ad8535e4839a4ca49f4f42f55f054` (status to be verified by live API; no green asserted here).
- Original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB0OriginalSource48MajoranaBivectorCAR.lean`, pinned Git blob `f96f407ac7abbc7c1c7077e5dadf09e9211a358c`.
- Independent original source consumer `lean/diagnostics/BFSSP3M4LB0OriginalSource48MajoranaBivectorCARIndependentConsumer.lean`, pinned Git blob `7875dfc64ca1a6c56f02306bf7c35c4b11dd996d`.
- Explicit frozen donor SHA `SU2BFSSSource48NormalizedFockGammaProbe.lean` `7abc03723b3111e4a03389b722054e50d6a9bf30` and `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` `98889cb8607ccc64091165fbca585acb898b9ddc`. The latter donor's historical header labels it a candidate: use its actual source in the cold dependency build and the new end-to-end axiom gate; do not infer prior independent qualification from its presence.
- Cold `lake build OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4LB0OriginalSource48MajoranaBivectorCAR`, verify that exact `.olean`, followed by fresh warning-as-error source `lake env lean` and separate original-Fock independent consumer compilation.
- Fixed Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, pinned source and consumer, exact `#print axioms` cardinalities 3+3, whitelist `{propext, Classical.choice, Quot.sound}`, no `sorryAx`, no unbounded heartbeats.
- Correct original-source carriers, no surrogate Fock matrix, no alternate 48-label order, no rescaled CAR. Any RED must be preserved with tested SHA, first causal failure, artifact and bounded repair on the same unified branch.

## If LB0 succeeds: the more substantive full K(A) gate

For REAL original `Source48Label × Source48Label` skew matrix `A`, propose

\[
K(A)=\frac14\sum_{p,q\in\mathrm{Source48Label}} A_{pq}\,c_p c_q.
\]

Using qualified LB0 summands plus `A_{pq}=-A_{qp}`, derive
`[K(A),c_k]=∑_p A_{pk}c_p` (the factor 1/4 is fixed by CAR, not adjustable) and `K(A)†=-K(A)`. The diagonal terms cancel in a real skew `A`. First isolate algebraic finite-sum identities; only afterward use `F10BB` original `so(9)→so(16)` LieHom and the source `gamma16ToOriginalPaired48` transport to construct the source-`so(9)` Fock-vector infinitesimal action. A later separately qualified Lie bracket/generator-to-group integration theorem is required for a global source Spin9 physical Fock unitary. Gauge SU2, bosonic pullback, source supercharges and their joint invariant domain remain distinct proofs.

**Stop rule:** even complete finite `K(A)` CAR covariance is not a physical 16-supercharge equality, Hardy/fidelity theorem or gap result. The operator-HS identity singlet remains distinct from a physical Fock-vector singlet. Do not change `main` or create separate research branches; preserve exact failed and accepted records on unified.
