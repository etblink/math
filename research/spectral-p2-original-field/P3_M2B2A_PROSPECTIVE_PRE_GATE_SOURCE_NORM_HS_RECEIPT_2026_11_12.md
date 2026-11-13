# P3-M2B2A — PROSPECTIVE pre-gate evidence receipt
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC. **Owner:** BFSS Project Lead.
**Status:** CONDITIONAL GO FOR BOUNDED SOURCE-EXACT TEST; no M2B2A Lean source/consumer, CI run, or theorem has been staged or qualified.
**Canonical starting ref:** `integration/bfss-unified-research-20261108` at `9716f3441ee2def8ffc268faac114f4bde917e2d`.

## A. Exact mathematical contract
Let `F := Fermion 2 = EuclideanSpace ℂ (Fin (2 ^ (8 * colorDim 2)))` from original BFSS/Core.lean, `T : F →L[ℂ] F` with its unchanged **original operator norm**, and `b : OrthonormalBasis ι ℂ F` with `[Fintype ι]`. The already-qualified `originalFockOperatorToHSFiber b T` has a distinct finite `PiLp 2` Hilbert-column norm.

Targets, with exact source `T` and `b`:
1. `‖originalFockOperatorToHSFiber b T‖ ^ 2 = ∑ i : ι, ‖T (b i)‖ ^ 2`.
2. `‖T‖ ≤ ‖originalFockOperatorToHSFiber b T‖`.
3. `‖originalFockOperatorToHSFiber b T‖ ≤ Real.sqrt (Fintype.card ι : ℝ) * ‖T‖`.

For the concrete original basis `EuclideanSpace.basisFun (Fin (2 ^ (8 * colorDim 2))) ℂ`, the cardinal is `2^24` and prospective constant `4096`; do not enumerate 16,777,216 basis vectors. The identity operator is a negative control: operator norm 1, HS norm sqrt(card), so norm equality is false. The inequalities are not new spectral/coercivity results.

## B. Retrieval performed and scope limitations
- Read original `lean/OAI/MathematicalPhysics/BFSS/Core.lean` at blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- Read qualified M2A `P3M2AOriginalFockHSFiber.lean` at blob `89543ae62bc971303cbb15d3a0c3207e114d57fa`, exact strict GREEN [#43351955062](https://github.com/etblink/math/actions/runs/43351955062), and D5A `P3D5AOriginalFockHilbertColumns.lean` blob `b5ab5d1fe86eaf5720eb22f9c70a666477f3fa79`, strict GREEN [#43306016092](https://github.com/etblink/math/actions/runs/43306016092).
- Read `lean/OAI/RepresentationTheory/RowColumn/CopyOverlap.lean` at current blob `0fd282a5d4e54733288b267dfd7916302a7968fb`, source-available donor only, NOT separately strict-qualified by this retrieval.
- Inspected pinned Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`: `Mathlib/Analysis/Normed/Lp/PiLp.lean` has `PiLp.norm_sq_eq_of_L2` and `PiLp.norm_eq_of_L2`; `Mathlib/Analysis/Normed/Operator/Basic.lean` has `ContinuousLinearMap.le_opNorm`; `Mathlib/Analysis/InnerProductSpace/PiL2.lean` has `OrthonormalBasis.norm_eq_one` and genuine `EuclideanSpace.basisFun`.
- Checked M2B1 exact acceptance [#43356859031](https://github.com/etblink/math/actions/runs/43356859031), source SHA `f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6`, 83 exact pins; H1 16-record pilot, dated reusable evidence map, existing pre-gate protocol, and M2A R1/R2 red memoranda. H1/H2 and these notes are DISCOVERY, not new proof authority.
- NOT performed: exhaustive FCP 99-branch search, execution of historical lookup CLI on a complete FCP checkout, local Lean compilation, or transitive import cost benchmark. Do not claim those were done.

## C. Candidate evidence matrix
| Source | Exact content/evidence | Type match and disposition |
|---|---|---|
| `OAI.RowColumn.norm_sq_le_hilbertSchmidtSq` | `RowColumn/CopyOverlap.lean`, blob `0fd282a5d4e54733288b267dfd7916302a7968fb` | `B : V →L[ℂ] W`, finite-dimensional complex Hilbert V,W; states `‖B‖^2 ≤ hilbertSchmidtSq B`. SPECIALIZE V=W=original Fermion 2; DIRECT REUSE from source, not independently adjudicated strict GREEN. |
| `OAI.RowColumn.hilbertSchmidtSq_eq_sum` | Same donor and blob; trace of `B.adjoint.comp B` | Exactly `hilbertSchmidtSq B = ∑ i, ‖B (b i)‖^2` for genuine ONB. DIRECT REUSE; import closure untested here. |
| `PiLp.norm_sq_eq_of_L2` | Pinned Mathlib PiLp.lean | Exactly squared HS norm = finite column-square sum. DIRECT REUSE. |
| `ContinuousLinearMap.le_opNorm` + `OrthonormalBasis.norm_eq_one` | Pinned Mathlib operator and PiL2 | Each source `‖T (b i)‖ ≤ ‖T‖`; sum of finite squares gives upper bound. DIRECT REUSE plus small source adapter. |
| `originalFockOperatorToHSFiber b` and `originalFockHilbertColumns_apply` | Accepted M2A/D5A blobs and run IDs above | Literal original operator-to-column evaluation; exact source-specific adapter, NOT operator-norm isometry. |
| M2B1 original HS-column L² equivalence | [strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031), blob `e51e9db6d99adfdd9b077ffb846aef6155fecac6` | Distinct Hilbert carrier; source operator-L² reconstruction remains open. Background/BOUNDARY ONLY. |

## D. Novelty, negative precedents and proof plan
Novelty is only the exact source operator-norm versus separate HS-column norm bounds. Avoid a parallel abstract Clifford/Fock construction, adding a Hilbert norm instance to original bounded operators, or reproving RowColumn generic lemmas.
1. Prove the HS column-square identity by pinned `PiLp.norm_sq_eq_of_L2` and the qualified D5A column evaluation.
2. Combine exact donor `norm_sq_le_hilbertSchmidtSq T`, `hilbertSchmidtSq_eq_sum T b` and the source HS square identity; compare nonnegative norms to get the lower inequality.
3. Bound each `‖T (b i)‖` using `T.le_opNorm (b i)` and `b.norm_eq_one i`; sum squares, then use `Real.sq_sqrt` and nonnegativity for upper inequality. Derive concrete constant 4096 separately without Fock coordinate expansion.
4. Independent consumer must use the **original** `Fermion 2 →L[ℂ] Fermion 2`, abstract original ONB plus `EuclideanSpace.basisFun (Fin (2^(8*colorDim 2))) ℂ`; check all statements and axiom lists. Identity-operator non-equality is a diagnostic guard, not necessarily required as a first Lean lemma.
5. M2B2B separately covers source operator-valued `Lp` measurability/a.e. reconstruction; M3 gauge, M4 Spin9, M5 closed Hamiltonian and M6–M8 spectrum remain OPEN.

Negative knowledge: M2A R1 [#43349181533](https://github.com/etblink/math/actions/runs/43349181533) had 81 textual pins but only 79 unique keys after workflow global renaming; protect inherited hashes and reject duplicate keys before any CI. M2A R2 [#43349543790](https://github.com/etblink/math/actions/runs/43349543790) had opaque-`def` Hilbert typeclass cascade; maintain transparent accepted M2A `abbrev` and do not increase heartbeat limits to disguise a mismatch.

## E. Strict operational contract and decision
Prior M2B1 manifest is **83 unique pins**. `RowColumn/CopyOverlap.lean` is NOT already pinned: add its exact Git blob `0fd282a5d4e54733288b267dfd7916302a7968fb`, plus new source+consumer pins, making **86 unique exact pins**. Note the additional donor's transitive import roots must be inspectable and all original source restrictions preserved; a source file being pinned is not itself a theorem qualification.
Use Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Verify YAML, shell/Python syntax, all inherited pins and 86 unique paths before costly CI. Strict gate: cold genuine source build, separate genuine-Fock consumer, warning-as-error and permitted-axiom audits, exact run SHA and retained evidence artifact/digest. A RED is first-causal evidence; after two analogous failures stop tactic cycling.
**Project Lead decision: CONDITIONAL GO for the smallest source-specific M2B2A operator/HS squared identity plus two bounds.** This receipt must commit before the first new source/consumer commit. No mathematical M2B2A implementation or CI qualification is created by this receipt. HOLD M2B2B, M3-M8 and unification/speculative promotion.
