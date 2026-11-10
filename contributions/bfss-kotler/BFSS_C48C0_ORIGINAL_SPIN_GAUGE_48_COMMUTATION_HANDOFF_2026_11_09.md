# BFSS C48-0 — original Spin(9) and SU(2) commutation, 48-Majorana source handoff

**Working branch:** `integration/bfss-unified-research-20261108`  
**Date:** 2026-11-09 (Pacific time; CI may report 2026-11-10 UTC).  
**Scope:** one bounded original-source 48-real-label commutation candidate, with a separately compiled original 24-mode G3B coefficient bridge. **NOT qualified until its own strict gate is green.**

> **Active handoff revision:** The original C48-0 decision in Section 5 is preserved as historical provenance. The approved downstream sequence now starts with C48-0B exact equality to existing S1J gauge matrices, then staged operator commutation, the source character/trace alternatives, and OP1 projection fixedness. See [Section 6](#6-approved-strategy-pivot-after-source-inventory-review) and the [living roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md#8-late-2026-11-09-strategy-revision--c48-original-gauge-compatibility-pivot).

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

## 6. Approved strategy pivot after source inventory review

**Owner directive:** Changes to research strategy must be documented. This section is the currently approved **operational queue**, without altering the earlier C48-0 candidate contract, its workflow or accepted B2/B3/T1 ancestors. All work described in this section is **proposed** until its own exact pinned strict run qualifies.

**First necessary bridge — C48-0B (original actual SU(2) matrix identity):** The earlier C48-0 candidate builds
`sourceGaugeOriginalPaired48 q` by reindexing the existing G3A adjoint color matrix `R_3(q) ⊗ I_16` through `FCP.BFSSPairedSpin9Plane.pairedColorSpinEquiv`. The **preexisting independent source** `FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q` is `G3B.oneParticleMatrix q ⊗ I_2`, on the literal `OriginalMajoranaLabel = Fin 24 × Fin 2` already used by `Source48Label`. Prove directly:

```lean
theorem sourceGaugeOriginalPaired48_eq_S1J
    (q : GaugeGroup 2) :
    sourceGaugeOriginalPaired48 q =
      FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q
```

The exact equality is an **open Lean obligation**. Prove by `Matrix.ext`, transporting arbitrary source entries back through the paired equivalence and invoking the C48-0 G3B mode-entry theorem and `S1J.sourceRealMajoranaMatrix_entry`. Check G1A spin-pair equality and the real/imaginary `Fin 2` delta separately; preserve output-color/input-color orientation. An independently compiled consumer must verify the literal source original matrix, not a newly redefined permutation surrogate. Source S1J blob `de0a042cb39f58b81a0ebd54ce64912bff481a80`.

**C48-1A/B (commutation on original Fock operators):**
- Existing `OP3C6C.source9Spin_originalFockOperatorAutomorphismHom_activeGamma` gives exact source Spin(9) covariance on the **active** original `sourceGammaRealLinear`, with M3I/C6B donor-to-active equality. Source OP3C6C blob `2d6f777568b0026737112ff8256e5ed50fc9e6e6`.
- Existing `G4G.majorana0/1_fermionGauge_covariant` and `G4H.pairedAlgebraData_fermion_adjoint` give the exact **genuine SU(2) action** on the accepted 48 paired theta generators, and G4J packages the six-field original gauge data. Source blobs G4G `3714b1042583d91d02c6a39b8e1e8b045e42f1be`, G4H `7f4a93221c8f1168b274155f482e2f5c61f72786`, G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`.
- First prove equality of the generator transformations using the exact C48-0B source matrix, then extend to the **full original Fock operator algebra** using M3I/Clifford generator induction and B3. The eventual target is `α_g ∘ Ad(U_q) = Ad(U_q) ∘ α_g`; **only commutation of conjugation automorphisms** is inferred at C48-1B.

**C48-2 (genuine unitary gauge-operator fixedness):** Define `V_g(q)=α_g(U_q)` using the accepted B3 star algebra equivalence and actual OP2a/OP2b/G4E `Fermion 2` gauge unitary. Check its same-order group law and construct the exact complex-linear equivalence-valued homomorphism. From C48-1B derive the source `pairedTheta` gauge covariance premise for `V_g`; this is **not automatic merely from 48-matrix commutation**. Two independent proof routes:

1. **Primary, if historical strict qualification is demonstrated:** `FCP.BFSSSU2PhysicalDomainS1G.original_relativeGaugeScalar_trivial` and `FCP.BFSSSU2PhysicalDomainS1H.original_source_gauge_representation_unique` were located in the older `OperatorDependencies` inventory. They work with the true original SU(2) group and paired `Fermion 2` theta family, and appear tailored to precisely the scalar-character obstruction. Source S1G blob `cf672337fc1196b1383eeb293a627383fdb0a3ca`, S1H blob `eacab43f1b9112e9e1920e656bdf1166f824a5a8`. **Their exact historical strict green runs and full parent qualification are not yet independently verified**. Do not cite a source file alone as accepted proof.
2. **Independent fallback using accepted T1:** if `α_g(U_q)=c_g(q) U_q`, trace preservation gives `(c_g(q)-1)\operatorname{Tr}_F(U_q)=0`. The original finite-dimensional gauge representation has `U_1=1` and nonzero trace at identity; source G4E/G4IC2 continuity should give nonzero trace in an identity neighborhood. A multiplicative character trivial on a neighborhood is trivial globally **if source SU(2) connectedness / generation by every identity neighborhood is established**. This avoids requiring the full character formula `2^{24}\cos^{16}\theta`, which remains a computational cross-check, not a qualified Lean lemma. Explicitly check scalar character multiplicativity, operator trace continuity and source group connectedness.

**C48-3 (actual fermionic gauge-fixed projection):** Only *after* the pointwise equality `α_g(U_q)=U_q`, instantiate existing `FCP.BFSSGaugeFixedProjectionOP1.starAlgEquiv_fixed_gaugeFixedProjection` with `FCP.BFSSOriginalGaugeProjectionOP2B.originalGaugeLinearAction`, `originalGaugeContinuousAction` and `originalGaugeOperators_exact`. This targets the literal source `originalFermionGaugeProjection`; it does **not** establish full bosonic × fermionic gauge-physical covariance or invariance of the original unbounded Hamiltonian domain.

**Independent HS-0 lane:** Accepted B3 and T1 supply an algebraic Spin(9) action preserving the trace pairing `Tr_F(S†T)`. Package this as the original finite-dimensional Fock **operator** Hilbert-space unitary representation using suitable exact Mathlib/OAI Hilbert–Schmidt infrastructure, if doing so shortens the path to operator-fiber `M=12` weights. The Fock-vector `M=6` route is separate; continuity, actual weights, physical form domains and spectral conclusions remain open.

**Execution and acceptance rules:** Keep C48-0's submitted 62-pin gate unchanged until a verified red requires a bounded repair or its exact strict green qualifies. Do not poll or rewrite the running job merely because the strategy evolved. Then prefer C48-0B over jumping directly to C48-1; preflight S1G/S1H qualification *before* relying on C48-2; test the typed C6C/G4H generator crosswalk before any full-algebra induction. One new high-risk obligation per strict gate, frozen Git source/consumer hashes, exact original carrier, independent consumer and fail-closed axiom audit. Preserve red evidence, scalar ambiguity and unfavorable results as negative knowledge.

**Canonical current plan:** [`BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md`, Section 8](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md#8-late-2026-11-09-strategy-revision--c48-original-gauge-compatibility-pivot). Earlier sections and the [Python forward checks](BFSS_ORIGINAL_FOCK_SU2_SPIN9_PYTHON_FORWARD_RESEARCH_2026_11_09.md) remain preserved as provenance.

## 7. C48-0 initial strict RED and bounded source-index repair

**Initial RED:** [#42775475732](https://github.com/etblink/math/actions/runs/42775475732), tested commit `e41678954b814453a58de6bce116e036158772a2`. GitHub Actions independently confirms: all **62** expected source/consumer Git blob hashes passed, pinned Lean 4.34.1 / Mathlib restoration passed, the 9,023 source dependencies compiled, but the new C48-0 source failed to cold-build. The independent consumer and strict final axiom gate were **not reached**.

**First causal error:** `C48C0OriginalSpinGaugeMajoranaCommutation.lean:80:2`: a `change` tactic attempted to identify a `Matrix.reindexRingEquiv`-transported **literal original** `Source48Label` gauge matrix entry with its color Kronecker coefficient by *definitional equality*. Lean correctly rejected that definitional reduction. The obstacle is the explicit G1A `pairedColorSpinEquiv`/inverse transport; it is not a mathematical refutation of the commutator. Subsequent `#print axioms` results for `sourceGaugeOriginalPaired48_entry` and its G3B dependent included `sorryAx` due to incomplete elaboration: **those results were not qualified**. The other source theorem bodies had no reported Lean errors in that initial log, but they likewise cannot be independently promoted from a failed build.

**Bounded repair:** [commit `1fdb592c`](https://github.com/etblink/math/commit/1fdb592c64f40d136d5b8a1d78ce980c5b0555e3) replaces only that single failed proof tactic with `simp [sourceGaugeOriginalPaired48, Matrix.reindex, Matrix.kronecker, Matrix.one_apply]`, following the same accepted explicit `Matrix.reindex` simp strategy used by G3B's `oneParticleMatrix_block`. The corresponding new source blob is `86ee46c2d657164f3fd631c08cfc5636663a4f94`; the strict workflow manifest alone was updated to pin that replacement, preserving all **other 61 Git blob pins**. No theorem statements, accepted B2/B3/T1 proof blobs, source index order, original real color representation, resource ceilings, allowed axioms, or independent consumer were altered.

**Retry:** [#42777976822](https://github.com/etblink/math/actions/runs/42777976822) was **QUEUED** at this preservation point on exact tested commit `1fdb592c64f40d136d5b8a1d78ce980c5b0555e3`. C48-0 remains `CANDIDATE / NOT QUALIFIED` until that exact retry passes cold source and consumer builds, full source/consumer axiom audits and the final strict acceptance marker.

**Methodological lesson:** A proposition proven with `Matrix.reindexRingEquiv` may not be definitionally equal at explicit coordinates to an untransported Kronecker coefficient. Prefer the already accepted `Matrix.reindex` and `Matrix.kronecker` simplifier path, preserving the source equivalence and *both* index-order checks. This is an interface-elaboration error, not grounds to weaken the gate or change mathematical strategy. The already documented C48-0B → C48-1 → C48-2 → C48-3 pivot remains intact.

## 8. C48-0 second RED — mathematical source proof completes; strict warning-as-error repair

**Second RED:** [run #42777976822](https://github.com/etblink/math/actions/runs/42777976822), exact tested commit `1fdb592c64f40d136d5b8a1d78ce980c5b0555e3`. All **62 frozen Git blob pins** and pinned Lean/Mathlib restore passed. The source reached **`Build completed successfully (9024 jobs)`**, and **all six C48-0 source `#print axioms` reports** were limited to `propext`, `Classical.choice`, and `Quot.sound`; in particular there was **no `sorryAx`**. The earlier `change`/reindexing elaboration failure was resolved, demonstrating that the explicit simplifier route really discharged the original gauge-matrix entry lemma and its dependent original G3B coefficient equality.

**Actual second failure:** the strict `lake env lean -DautoImplicit=false -DwarningAsError=true` source audit reported `C48C0OriginalSpinGaugeMajoranaCommutation.lean:81:4: error: This simp argument is unused: Matrix.kronecker`. The cold build reported it as a **warning** and the warning-as-error Lean invocation promoted it to an error. Lean explicitly suggested the narrower `simp [sourceGaugeOriginalPaired48, Matrix.reindex, Matrix.one_apply]`. No independent consumer was reached; **C48-0 is still unqualified**. This is not the same mathematical or index-transport failure repeating a second time: the original proof is now solved, and the new blocker is strict proof-script lint.

**Bounded repair:** [commit `b9bc5674`](https://github.com/etblink/math/commit/b9bc56747d22ba2dae721aff91b47f6e7c2ce1b9) removed only `Matrix.kronecker` from that one simp argument list and updated the corresponding C48-0 source blob pin in the unmodified **62-file** strict workflow. Exactly two files were changed, no statements or original labels were modified, and `warningAsError=true` remains enforced. The new source Git blob is `9f9a5ce2186ded98a251efbc24c2b66f416044d5`; workflow Git blob `c01eacae09826552049db70582dc1ffd2ccd9080`.

**Third validation:** [run #42779878513](https://github.com/etblink/math/actions/runs/42779878513) was **QUEUED** when this record was created, tested commit `b9bc56747d22ba2dae721aff91b47f6e7c2ce1b9`. Await clean source **and independent consumer**, exact axiom reports, and final `C48C0_ORIGINAL_SPIN_GAUGE_48_INDEPENDENT_STRICT_PASS` before qualifying C48-0.

**Methodological distinction:** preserve `source compiles with an unused-simp warning` separately from `all acceptance steps passed`. A run can contain successful proof compilation and allowed kernel axioms yet fail rigorous lint and consumer requirements. Do not relax lint or resource budgets. Our active strategy remains C48-0 → exact S1J bridge C48-0B → original Fock-operator commutation C48-1 → scalar uniqueness C48-2 → OP1/OP2b projection C48-3.

## 9. C48-0 strictly qualified — final exact green

**Accepted strict GREEN:** [run #42779878513](https://github.com/etblink/math/actions/runs/42779878513), tested commit `b9bc56747d22ba2dae721aff91b47f6e7c2ce1b9`, attempt 1, job `original-spin-gauge-source-commutator` SUCCESS. All **62 frozen Git blob pins** matched, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored, cold source built, source `-DwarningAsError=true` passed, and the independent consumer compiled with the same fail-closed warning and axiom check. All six original-source and eight independent-consumer `#print axioms` reports stayed within `[propext, Classical.choice, Quot.sound]`, without `sorryAx`.

**Exact final log marker:** `C48C0_ORIGINAL_SPIN_GAUGE_48_INDEPENDENT_STRICT_PASS`. Evidence artifact [#13745119861](https://github.com/etblink/math/actions/runs/42779878513/artifacts/13745119861), checksum `sha256:d4c70877ff9ebb2a1c7f35c82a30e855d97ade66828779f2f644f67d2060c528`.

**Qualified mathematical scope:** same-order source SU(2) G3A/G3B real 48-label color action through the **literal G1A crosswalk**, its identity and multiplication, entry formula and original 24-mode coefficient bridge, and the exact commutator `S_g C_q = C_q S_g` with the genuine source Spin(9) F10F orthogonal action on original `Source48Label = Fin 24 × Fin 2`; independent reverse/real-vector consumers. This does **not** yet establish equality with the separately defined `S1J.sourceRealMajoranaMatrix q`, commutation of Fock-level automorphisms, equality of genuine gauge operators, fermionic projection invariance, continuity or spectral claims.

**Historical red provenance retained:** initial [#42775475732](https://github.com/etblink/math/actions/runs/42775475732) failed at the nondefinitional reindexed entry `change` tactic; second [#42777976822](https://github.com/etblink/math/actions/runs/42777976822) passed mathematical cold compilation but failed strict warnings due to an unused `Matrix.kronecker` simp argument. Both were repaired without modifying statement, accepted ancestors, gate budget or independent consumer.

**Authorized next research gate:** C48-0B — show the existing original source SU(2) `S1J.sourceRealMajoranaMatrix q` equals the strictly accepted C48-0 `sourceGaugeOriginalPaired48 q` on all 48 labels, via exact source G1A `colorModeEquiv`, paired `Fin 2` and the already accepted `sourceGaugeOriginalPaired48_G3B_mode_entry` coefficient theorem. This is a new separate qualification and must not be retroactively included in C48-0.
