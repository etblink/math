# Project Lead — Original paired-label Spin(9) first formal theorem design (2026-10-30)

**Disposition:** SOURCE-EXACT THEOREM SPECIFIED; ZERO new Lean roots, ZERO new CI gates.
**Repository:** `etblink/math`, research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
**Inherited milestone:** strict-qualified K1D18V7Z Gate 2 #41133563019, tested `ec9ebc8c38a9be5cd4d52a60dbdfa12dc8a89961`; documentation HEAD on intake `33f7bc33fe8eba1e3ba7c07104fefd40a425b6e6`.
**Governing rule:** algebraic quotient != topological covering != global Spin(9) lift != original physical BFSS theorem. Preserve negative findings and do not count candidate statements as accepted.

## 1. Verified existing source interfaces

1. `FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv : (SpinIndex × ColorIndex 2) ≃ (Fin 24 × Fin 2)`, module `SU2PairedThetaLabelCrosswalkProbe.lean`, blob `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e`. Its four label/CAR roots were accepted by strict math run [40573189822](https://github.com/etblink/math/actions/runs/40573189822) on `integration/community-20261027-bfss`.
2. `FCP.BFSSSource48FockIndexBridge.sourceBlockColorMajorana_eq_G1APairedTheta`, module `SU2BFSSSource48FockIndexBridgeProbe.lean`, blob `6d732c1acea271b7aba948c95755ac73d2d0fc0a`. One operator-index root passed math run [40581813437](https://github.com/etblink/math/actions/runs/40581813437).
3. `FCP.BFSSSource48FockCliffordUniversalLift.sourceFockCliffordAlgHom` and generator theorem, module blob `f057756e42d30c8069a9c934001cf75c1e2d1ed2`, have a successful strict workflow [40593379663](https://github.com/etblink/math/actions/runs/40593379663). The file's historical exploratory banner predates that workflow; acceptance is bounded by its actual audited roots. It does **not** prove a global Spin(9) Fock action.
4. The real source 48-vector labeling `FCP.BFSSS1V0.Source48Label = Fin 24 × Fin 2` and original `source48Quadratic` are frozen; these are not replaceable by convenient color-major data.
5. `FCP.BFSSGamma9.gamma : SpaceIndex → GammaMatrix` in math `SU2RealGammaProbe.lean`, blob `b9b8192055c70f0d001d7982669b9823c55562ed`, contains the original literal nine signed-permutation real 16×16 gamma matrices. The source text through the end of its FCP module is byte-for-byte identical to FCP `experiments/openai-math-su2-concrete-potential/SU2RealGammaProbe.lean`, blob `5ec0fcb039fb5c1367f72b2bd0f8c05fcd936587`; math adds a provenance-only terminal comment. **Do not infer independent owner-root strict acceptance of gamma solely from this equality**: independently verify its six source roots in the new exact Lean dependency closure.
6. Original FCP's finite read-only checker `bfss_original_paired_majorana_spin9_reindex_2026_10_27.py` was accepted at FCP [40478381697](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40478381697). It checked exact original gamma inputs, 48-label permutation, 972 B-tensor spatial cases, 1296 Lie-bracket cases, and 108 gauge/spin commutators. **ZERO new Lean theorem roots** resulted. In particular its negative control rejects all 27 untransported color-major B tensors as original-source identifications.

## 2. Exact indexing contract, not a guessed basis

For `α = 2*j + r` (with `j : Fin 8`, `r : Fin 2`) and `a : ColorIndex 2 = Fin 3`, the actual original Fock flattened label is

```text
ℓpaired(α,a) = 2*(3*j+a)+r
ℓcolorMajor(α,a) = 16*a+α
```

These differ in 44 of the 48 positions. Source proof objects must be expressed using the actual `pairedLabelEquiv` from the owner module, not an independently invented `Fintype.equivFin` or an untransported `16*a+α` interpretation.

## 3. First genuinely missing Lean theorem — bounded target

Build the real source 48×48 **infinitesimal** spin-plane matrix using the accepted gamma source and the exact paired label:

```text
labelUnpair(p) := pairedLabelEquiv.symm p  -- (α,a)
K16(r,s) := -(gamma r * gamma s)          -- for r != s
K48(r,s)[p,q] :=
  if labelUnpair(p).2 = labelUnpair(q).2 then
    K16(r,s)[labelUnpair(p).1,labelUnpair(q).1]
  else 0
```

All indices `p,q` must have type `Source48Label`. This is equivalent to `P (I_3 ⊗ K16(r,s)) Pᵀ` for the **source-derived** permutation `P`, not an assumption of equality between paired and color-major label maps.

**First target declaration roots:**

- `originalPairedSourceSpinPlane_transpose_eq_neg (r s : SpaceIndex) (hrs : r ≠ s) : (K48 r s).transpose = -(K48 r s)`.
- `originalPairedSourceSpinPlane_sq_eq_neg_one (r s : SpaceIndex) (hrs : r ≠ s) : K48 r s * K48 r s = -(1 : Matrix Source48Label Source48Label ℝ)`.

These are **candidates** until original-source type signatures, actual pinned Mathlib API, fresh strict compilation, and independent exact root/axiom evidence pass. The first proof should use source `gamma_symmetric` and `gamma_clifford` to derive `K16ᵀ=-K16` and `K16²=-I16`, and transport those via a *named* index equivalence. Prefer general matrix reindexing/finite product statements over expanding 48 indices. A generic reindex helper must be accompanied by the actual source-specialization root; it is not a source-result substitute.

**Next substantive roots after this gate**, not bundled into it: source 48-label `so(9)` Lie commutator closure and commutation with literal original SU(2) color generators. Avoid merely reasserting a generic Kronecker commutation that is disconnected from the original paired source labels.

## 4. Preflight and negative controls

- Pin unchanged source blobs for source Q, actual paired label, original gamma, source Fock index bridge, and candidate code. For gamma, compare exact source through the FCP namespace end; the appended ownership comment has no effect on definitions.
- Qualify existing gamma imports and the candidate roots under pinned `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, with fresh warning-as-error compilation.
- Independently `#check` the exact fully elaborated declaration types and `#print axioms` for each root; allow only `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, suppressed warnings, altered labels, proxy spin actions, increased limits and unproved source bridges.
- Preserve a discriminator for the FCP negative result: the naive untransported color-major tensor cannot be identified with original paired B tensor; test at least one pinned exact differing source entry, without treating a finite Python check as a Lean theorem.
- If the generic matrix reindex route triggers repeated recursive elaboration, stop that proof shape. Introduce an explicitly typed intermediate matrix/equivalence instead of increasing `maxRecDepth` or timeouts. Document first causal errors with commit, source blob, job, and retained artifact.

## 5. Independent topological frontier — not discharged by these two lemmas

Do not claim a continuous `Spin(9) → Spin(48)` lift from `K48` and its finite bracket identities. A global theorem requires a real source Spin(9) domain and its continuous 16-spinor representation, the 48-label Euclidean action, the corresponding actual Spin(48) topology and continuous double-cover, a lifting theorem with central-sign consistency, and the original CAR/Fock implementation. The existing V7Z `MulEquiv` is **algebraic only**. The historical source Clifford PBW finite-dimensionality module `SU2BFSSPhysicalDomainS1V52L9E5F20BOriginalSource48CliffordPBWBasisFiniteDimensionalProbe.lean` has a provisional owner qualification status: do not quietly import it as an accepted topological-algebra premise.

## 6. Research governance and next execution boundary

This document establishes a **testable theorem scope** but **does not compile it** and **does not authorize promotion**. The next execution is to create an isolated source module for the exact original `K48` matrix identity, after inspecting the pinned Lean matrix reindex/transpose/multiplication APIs and verifying existing dependency qualification. Only then launch one source-pinned strict gate. If the direct 48-source elaboration is unsound or infeasible, stop and report that interface instead of publishing substitute claims.

Do not change previously accepted modules, canonical FCP, math `main`, or upstream mathcommunity; do not create an upstream PR. Negative results retain first-class evidentiary status.
