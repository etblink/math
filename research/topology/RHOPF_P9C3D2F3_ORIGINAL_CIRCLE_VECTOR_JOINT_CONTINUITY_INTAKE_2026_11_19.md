# RHOPF-P9C3D2F3 — original Gamma9 circle vector joint continuity intake

**Date:** 2026-11-19 (America/Los_Angeles).
**Branch:** `integration/bfss-unified-research-20261108`.
**Status:** UNQUALIFIED native/independent strict Lean source theorem.
**Accepted predecessor:** P9C3D2F2 R1 strict [#44657744184](https://github.com/etblink/math/actions/runs/44657744184), tested `e9a3ec93bb340676847378083273d61091c7e483`, acceptance `1dddd317ee0e78cf06332f6ef2bf4d1ede526bd9`.

## Scope and source-exact proof

The accepted original Gamma9 real 16-spinor Circle matrix representation is continuous (`FCP.RHOPFP9C3D1.relationalCircleMatrix_continuous`) and the source-defined vector action is `relationalCircleVector z v = (relationalCircleMatrix z).mulVec v`. P9C3D2F1 and F2 strictly qualified its algebraic action, image preservation, norm-one subtype action, and trivial unit-sphere point stabilizers.

The single new theorem target is *joint continuity* in circle phase **and** vector:
```lean
theorem relationalCircleVector_joint_continuous :
    Continuous (fun p : Circle × (SpinIndex → ℝ) =>
      relationalCircleVector p.1 p.2)
```
It is derived from the *previously accepted* continuous original `Circle → GammaMatrix` source, `continuous_fst` and `continuous_snd`, plus the exact pinned Mathlib `Continuous.matrix_mulVec` lemma from `Mathlib.Topology.Instances.Matrix`. This avoids introducing coordinate-expanded gamma matrices, duplicate source representations, a new global `MulAction` instance, or constructing topology from intuition. It does not yet show that the subtype-valued unit-circle action is jointly continuous; that must be checked independently by restricting and lifting via `continuous_subtype_val` and subtype topology.

## Strict qualification

Pin frozen original BFSS Core, real 16-spinor signed-permutation Gamma9 source, original projector, phase, orthogonality, algebraic Circle and certified source matrix continuity, accepted P9C3D2F2 and new source/consumer Git blobs. Preflight exact import and declaration contracts, no new axioms, `sorry`, or resource changes. Pinned Lean `4.34.1` / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source-independent original integer gamma fixture, cold accepted original dependency build, warning-as-error source-native and separately imported consumer, both `#print axioms` with no roots other than `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. Preserve original CI run and artifact, SHA-256, tested SHA, proof transcripts and any RED diagnostic.

## Limits and roadmap

If this gate passes, next isolate source-exact joint continuity for `relationalUnitCircleAction : Circle → RelationalUnitSpinor → RelationalUnitSpinor` on `Circle × RelationalUnitSpinor`, using the exact previous continuity and subtype topology. Separately establish nonemptiness of the norm-one P image and its source-exact 4-dimensional isometric model, followed by homeomorphism to the 3-sphere, a genuine topological quotient, and Hopf identification (not merely algebraic circle-action analogy).

The 12-dimensional complementary source spinor sector remains fixed; the ambient real 16-spinor circle action is not free. An original physical BFSS 48-Majorana/24-complex-mode Fock implementer, Spin(9) group compatibility, SU(2) Gauss/Hamiltonian covariance, protected solitonic hopfions, and Standard Model predictions remain separate unproved hypotheses. Preserve source-original REDs (D2F0 R1 notation, D2E1 R1 missing namespace, and other historical proof failures) in the negative knowledge corpus.
