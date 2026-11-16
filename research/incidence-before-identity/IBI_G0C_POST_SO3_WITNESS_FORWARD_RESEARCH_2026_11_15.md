# IBI/FCP forward research — post-Euler BFSS color cover and incidence-orbit program

**Date:** 2026-11-15 Pacific (repository current research interval)  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Mode:** research/evidence-only; NO new Lean source claims accepted or workflow run triggered by this memo.  
**Concurrent gate:** [original source SO3 witness R2 #43778732001](https://github.com/etblink/math/actions/runs/43778732001), tested commit `639c9cbeb2d2188ee83f32cfd9b988beab3682da`. It was still **in_progress** with cold source and consumer audit underway at the latest check. Do not prejudge its status.

## Critical rediscovery — the +1 determinant is ALREADY QUALIFIED

The original BFSS source directly proves:
```lean
FCP.BFSSIBIG0B1NativeDetOne.originalAdjointColorMatrix_det_one
  (g : OAI.BFSSQuantum.GaugeGroup 2) :
  (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det = 1
```
with its entire original-source closure in [GREEN run #43733883094](https://github.com/etblink/math/actions/runs/43733883094), exact tested commit `a899735669e71609a2f418075826b5c1db629b2a`, source blob `0b82625932304f9e03f07850cef674689475fc09`, job `132872099781`, full strict source/independent consumer, accepted axioms only, artifact #14169627035. **Its bytes at the current research HEAD still match the accepted blob**.

The original [G3A representation source](https://github.com/etblink/math/blob/639c9cbeb2d2188ee83f32cfd9b988beab3682da/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean), blob `553869f1287c64893398c3b79c04fe010023bd08`, already proves `adjointColorMatrix_one`, `adjointColorMatrix_mul`, and `adjointColorMatrix_orthogonal` (transpose * matrix = 1). Hence no new determinant, continuity, quaternion, SU2 connectedness, or Lie-group orientation proof should be attempted for this specific interface.

**Small next proof microgate — IBI-G0C-SO3-HOM** (separate new module / consumer / strict workflow):
```lean
noncomputable def originalAdjointSO3 (g : GaugeGroup 2) :
    Matrix.specialOrthogonalGroup (Fin 3) ℝ :=
  ⟨FCP.BFSSSU2GaugeG3A.adjointColorMatrix g, by
    rw [Matrix.mem_specialOrthogonalGroup_iff]
    exact ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mpr
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix_orthogonal g),
      FCP.BFSSIBIG0B1NativeDetOne.originalAdjointColorMatrix_det_one g⟩⟩
```
This is a **proposed code sketch, NOT Lean-compiled**. Verify exact expected orthogonal group membership orientation and subtype structure. Then package `GaugeGroup 2 →* Matrix.specialOrthogonalGroup (Fin 3) ℝ` via `adjointColorMatrix_one`, `adjointColorMatrix_mul`, and subtype extensionality. The codomain is the actual `Matrix.specialOrthogonalGroup`, not `O(3)`, and the source is the original BFSS `GaugeGroup 2`.

Once R2 universal-witness theorem is strictly qualified, establish `Function.Surjective originalAdjointSO3Hom` by that already constructed source witness, not by a separate generic cover theorem.

## Follow-up kernel classification — distinct, source-exact proof

**Goal:** `ker originalAdjointSO3Hom = {1, -1}` (as appropriate typed subgroup/set statement). Surjectivity and orthogonality alone DO NOT prove this; add an independent finite 2×2 Pauli-centralizer gate.

Recommended decomposition:
1. Define the genuine central `negativeIdentityGauge : GaugeGroup 2`, membership of `-I₂` to `SU(2)` by unitarity and det `(-I₂)=+1`; check both `R(1)=I₃` and `R(-I₂)=I₃`.
2. If `R(g)=I₃`, use accepted G3A basis action `adjointCoefficient_on_basis` plus accepted original normalized Pauli color reconstruction to show `g σ_A g⁻¹ = σ_A` for each A; matrix inverse/star adapter is accepted [G0C inverse-Pauli](https://github.com/etblink/math/actions/runs/43750250997).
3. Commutation with source diagonal `σ_z` forces `g_{01}=g_{10}=0`. Commutation with `σ_x` forces `g_{00}=g_{11}=λ`. Original `det g=1` then implies `λ²=1`, hence over ℂ `λ=1` or `λ=-1`. Conclude exact central two-element kernel.
4. Independently verify the orientation/sign conventions in source `FCP.BFSSSU2.pauli`; prove the source-specific Pauli-basis is complete rather than merely relying on equality of trace coefficients. This intermediate may need its own strict gate.

The kernel is that of the **bosonic color-adjoint representation**. Do not infer that `-1` acts trivially on the original Fock/fermionic spin lifts, Gauss-law constraints, physical Hilbert space or any other representation. A two-sign kernel is not a proof of the entire physical representation's faithfulness.

## Higher-value incidence-before-identity direction

Previously independently qualified source invariants:
- [G0A Gram #43689689837](https://github.com/etblink/math/actions/runs/43689689837), source `IBIG0AOriginalBosonGram.lean` blob `382315f9e9442f8506bcbe5b42dbc2bad4e7d86d`.
- [G1A original Lie triple #43693100174](https://github.com/etblink/math/actions/runs/43693100174), `IBIG1AOriginalLieTriple.lean` blob `0e6f3748632f96824f14b808cc2f33f2085276fb`.
- [G1B signed source cross triple #43703395473](https://github.com/etblink/math/actions/runs/43703395473), `IBIG1BOriginalSignedCross.lean` blob `b42291fe0aa5f8b22a31bad19b9de5c775372a71`.
- [FIN-DET3 #43705949773](https://github.com/etblink/math/actions/runs/43705949773), `IBIG0B1FinDet3.lean` blob `c53fe995551ec85af6c66f9a5939dd421bbc9c10`, supplies exact signed source cross triple = finite 3×3 determinant on ordered columns.
- [Native SO3 det+1 #43733883094](https://github.com/etblink/math/actions/runs/43733883094), as above.
The source `Boson 2` is nine spatial color 3-vectors `spatialColor x i`; the source G2A boson action is original gauge conjugation. These gate results currently show **invariance**, not full orbit classification.

Potential precise completeness statement, after source SO3 surjectivity is accepted and the G2A action is source-exactly bridged to G3A matrix multiplication:

```text
(∀ i j, originalGram x i j = originalGram y i j)
∧ (∀ i j k, originalCrossTriple x i j k = originalCrossTriple y i j k)
↔ (∃ g : GaugeGroup 2, bosonGauge g x = y)
```

This is a research hypothesis with a **known finite Euclidean proof route**, not a qualified Lean theorem. Abstractly, for any finite family of vectors in ℝ³, matching Gram matrices gives an isometry between their linear spans and an extension `O∈O(3)`. If rank of the span is **3**, a nonzero ordered triple distinguishes det `+1` versus det `−1`; equality of signed triples forces the isometry to be proper. If rank is **≤2**, an orientation-reversing extension can be corrected by reflecting in an orthogonal-complement direction while fixing the lower-dimensional span, yielding `SO(3)`. Thus Gram + signed triple is complete for SO3-orbits; Gram alone is complete on rank<3 but **incomplete** at full rank.

**Adversarial exact counterexample to Gram-only classification:** `(e₁,e₂,e₃)` and `(e₁,e₂,-e₃)` have equal Gram `I₃`, but signed triple values `+1` and `−1`; no rotation in SO3 maps one ordered triple to the other. Append six zero color vectors for the source nine-direction carrier. **Rank-two control:** `(e₁,e₂,0)` versus `(e₁,-e₂,0)` have equal Gram and zero signed triples; `diag(1,-1,-1)∈SO3` maps one to the other. This forces the proper rank split, not a fake generic nonzero determinant assumption.

Proposed gates:
- **IBI-ORBIT-GEOM0:** pure finite Euclidean matrix/Gram isometry extension to O3, including rank0/1/2/3, with independent consumer and counterexample.
- **IBI-ORBIT-ORIENT1:** SO3 correction for rank≤2; determinant-sign orientation for rank3, using the qualified unit-circle/Euler and signed 3×3 determinant infrastructure.
- **IBI-ORBIT-SOURCE2:** source exact `Boson 2` finite-to-abstract color-vector, G2A↔G3A action adapter, signed Lie-triple↔determinant bridge, and the universal source SU2 witness. Independent arbitrary source-pair consumer.

## Priorities and stop rules

1. **FIRST:** qualify or diagnose [source SO3 witness R2 #43778732001](https://github.com/etblink/math/actions/runs/43778732001). Preserve typed failure details; no waiting-based assumption of GREEN.
2. **NEXT:** source-specific SO3-valued hom packaging using already accepted G0B1 source determinant-one. It is independent of the universal-witness R2 CI result and may be qualified as its own gate.
3. **THEN:** exact kernel ±1 as distinct finite Pauli centralizer; do not infer from surjectivity alone.
4. **PARALLEL mathematical research:** source-independent Gram+signed-triple orbit completeness including degeneracies; bridge only after strict qualified source surjectivity. This is the most direct way to turn incidence-before-identity intuition into a falsifiable, complete mathematical classification.
5. **PHYSICS BOUNDARY:** no claims about original physical-state quotient, fermionic Fock sign, all Spin groups, spectral ground state, mass gap or ToE.

Preserve G0A/G1A/G1B/G0B1/G0C accepted source bytes; never modify `main` or `integration/bfss-unified-research-20261108`. This memo is evidence-only and does not modify the concurrent CI candidate or its workflow.
