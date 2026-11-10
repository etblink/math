# BFSS C48-0 — original Spin(9) and SU(2) commutation, 48-Majorana source handoff

**Working branch:** `integration/bfss-unified-research-20261108`  
**Date:** 2026-11-09 (Pacific time; CI may report 2026-11-10 UTC).  
**Scope:** one bounded original-source 48-real-label commutation candidate, with a separately compiled original 24-mode G3B coefficient bridge. **NOT qualified until its own strict gate is green.**

## 1. Accepted parent receipts

- P2b-B2 original physical star: green run [#42759465245](https://github.com/etblink/math/actions/runs/42759465245) at `f21db5d7fdf36b8ee07c230787af8691859956a9`.
- P2b-B3 full original Fock-operator `StarAlgEquiv` action: green run [#42764649026](https://github.com/etblink/math/actions/runs/42764649026) at `ac7438a9ae069db323863562c5462f3c59753a22`.
- T1 original Fock operator trace and independent Hilbert-Schmidt pairing: green run [#42769361446](https://github.com/etblink/math/actions/runs/42769361446) at `b05b97260bb56718110f014a1052b54bc74bafa2`; exact 55 source/consumer Git blob pins passed. Acceptance marker `T1_ORIGINAL_FOCK_TRACE_INDEPENDENT_STRICT_PASS`.

The original source-label and SU(2) matrices originate in these additional existing files:
- F10F source Spin(9) original paired-48 orthogonal group hom: `SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean`, Git blob `9dc5713dfea7c40d8c9f58088392e144c3c28517`.
- G1A paired 24 complex modes / 48 real Majorana labels: `OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean`, Git blob `152204ef15a6569534e0503824a697cb9ae8e4ce`.
- G3A exact SU(2) adjoint color matrix with B=output, A=input: `OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean`, Git blob `553869f1287c64893398c3b79c04fe010023bd08`.
- G3B real 24-mode matrix and original `colorModeEquiv` block theorem: `OperatorDependencies/SU2BFSSG3B24ModeOrthogonalLiftProbe.lean`, Git blob `3cdf867357ea2955bf9d88ec6f5f6a0f9228e92a`.
- Actual G1A paired Fock reindexing: `SU2PairedThetaLabelCrosswalkProbe.lean`, Git blob `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e`; `SU2BFSSPairedSpin9PlaneGeneratorProbe.lean`, Git blob `02b8e54464b0aea151c96cefd316a86270cf8871`.

## 2. C48-0 exact source construction

New source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean`, initial commit [`2614139e`](https://github.com/etblink/math/commit/2614139eb4ea3e7e8a026c1c5d85bb85772567a6), Git blob `b36ebf3277d932ea1113f7d17b5559a1cd034ed0`.

New independent audit: `lean/diagnostics/BFSSC48C0OriginalSpinGaugeMajoranaCommutationIndependentAudit.lean`, initial commit [`4ba078cf`](https://github.com/etblink/math/commit/4ba078cffdb6764bcb6f27fea67a96d699fc988e), blob `924d6bb330ea9e157164d20b60528de0b1eb35d7`.

Both actions are transported by the SAME literal G1A `pairedColorSpinEquiv : (ColorIndex 2 × SpinIndex) ≃ Source48Label`; the matrix target is **`Matrix Source48Label Source48Label ℝ`**, where `Source48Label` is the accepted `Fin 24 × Fin 2`. For genuine source Spin(9) `g`, SU(2) `q`, G3A color-adjoint matrix `R(q)`, and accepted original gamma-16 source matrix `D(g)`, define

```text
S_g = reindex_paired (I_color ⊗ D(g))     [EXISTING F10F]
C_q = reindex_paired (R(q) ⊗ I_spin16)    [NEW C48-0 source color lift]
```

The source proves candidate exact identity, group law and source index entries for `C_q`, including equality on each G1A spin pair, color and Majorana-real/imag component with the **existing G3B** `oneParticleMatrix q`. The main C48-0 goal is `S_g * C_q = C_q * S_g` on every original 48-real-label matrix and its independent original-vector consumer.

Algebraically, the proof reduces by the accepted `Matrix.reindexRingEquiv` and `Matrix.mul_kronecker_mul` to

```text
(I⊗D)(R⊗I) = (I R)⊗(D I) = R⊗D
(R⊗I)(I⊗D) = (R I)⊗(I D) = R⊗D.
```

This avoids an enormous source-index enumeration and uses no new formal Clifford/Fock carrier.

**Expected six source declarations:** `sourceGaugeOriginalPaired48`, `sourceGaugeOriginalPaired48_one`, `sourceGaugeOriginalPaired48_mul`, `sourceGaugeOriginalPaired48_entry`, `sourceGaugeOriginalPaired48_G3B_mode_entry`, `source9SpinOriginalPaired48_commutes_sourceGauge`. The separate consumer checks both multiplication directions, exact mode coefficients, and original 48-vector action.

## 3. Independent strict-gate state

New workflow: `.github/workflows/bfss-c48c0-original-spin-gauge-majorana-commutation-strict.yml`, initial commit [`e4167895`](https://github.com/etblink/math/commit/e41678954b814453a58de6bce116e036158772a2). Freezes **62 Git blobs**: 55 accepted T1-pinned source/consumer blobs, five additional G1A/G3A/G3B and original reindexing files, and two new C48-0 source/consumer files. Pins Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Preserves cold source builds, independent `-DwarningAsError=true` consumer, complete `#print axioms` reports restricted to `propext`, `Classical.choice`, `Quot.sound`, and retained evidence even on failure.

Candidate run: [#42775475732](https://github.com/etblink/math/actions/runs/42775475732), head `e41678954b814453a58de6bce116e036158772a2`, **IN PROGRESS at this handoff**. No success conclusion or scientific acceptance is assigned until the final strict gate independently qualifies.

The preserved Python numerical adversarial check in [`BFSS_ORIGINAL_FOCK_SU2_SPIN9_FORWARD_CHECKS_2026_11_09.py`](BFSS_ORIGINAL_FOCK_SU2_SPIN9_FORWARD_CHECKS_2026_11_09.py) samples a correctly reindexed tensor pair and deliberately an incorrectly indexed gauge matrix. The correct 48-label commutator vanishes numerically; the intentionally broken shared permutation does not. This is useful negative evidence, **not** a Lean proof.

## 4. Newly discovered direct downstream reuse

An additional read-only source investigation after submitting C48-0 confirms we do **not** need to reconstruct original SU(2) Fock-Majorana covariance. In `OperatorDependencies`:

- `SU2BFSSG4GMajoranaModeCovarianceProbe.lean`, Git blob `3714b1042583d91d02c6a39b8e1e8b045e42f1be`, proves actual original creator/annihilator-derived `majorana0/1_fermionGauge_covariant` on every original Fock mode.
- `SU2BFSSG4HExactThetaCovarianceProbe.lean`, Git blob `7f4a93221c8f1168b274155f482e2f5c61f72786`, packages the exact 48 `pairedAlgebraData.theta` field `pairedAlgebraData_fermion_adjoint`.
- `SU2BFSSG4JExactGaugeDataAssemblyProbe.lean`, Git blob `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`, already assembles the literal six-field upstream `pairedGaugeData`, including the real original Fock gauge unitary.
- `P2bB2OriginalFockGlobalPhysicalStar` and `P2bB3OriginalFockStarAutomorphismAction` can then supply the Spin(9) counterpart, once the exact original generator-bridge is established.

This should simplify **C48-1**, provided its own source-pinned gate checks the exact G1A theta-to-C48-0 source-generator crosswalk and the conjugation-action equality. It is not yet an accepted result that Spin(9) fixes the SU(2) gauge-implementing unitaries: **commuting adjoint actions only gives scalar ambiguity**, and the scalar gauge-character obstruction remains a separate proof obligation.

## 5. Next decision

- **If #42775475732 is green:** record tested commit, artifact digest, all six source and eight consumer axiom reports. Then design independent C48-1 through G4G/G4H/G4J, C6A, B3 and original Clifford generator extensionality.
- **If red:** inspect the **first causal error**. Repair only the minimal source proof, consumer elaboration or manifest mismatch, changing the relevant pins. No unjustified new axioms, heartbeats, source representation reordering, changed physical carrier, or weakening the frozen CI gate.
- **Later:** discharge the genuine SU(2) scalar-character obstruction before applying OP1/OP2b gauge-fixed projection; do not promote any Fock-vector implementation, topological continuity, unbounded original Hamiltonian domain or spectrum from this real-matrix gate.

**Working principle:** preserve positive and negative evidence with exact Git hashes and tested commits. The target is mathematical truth, not advancing a particular hypothesis at the expense of source fidelity.
