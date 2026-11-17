# BFSS × QIT × SCC — Results: witness-completeness donor audit and four-gamma countermodel
Date: 2026-11-16 Pacific. Project Lead read-only Lean audit + independent finite-dimensional numerical control.
**Not a new source-exact Lean theorem or physics result.** Unified branch `integration/bfss-unified-research-20261108`, initial checkpoint `41709a64cc1490a90342731cf94c8d642c30c7f1`.

## Verdict
**Positive conceptual/math feasibility, not yet cheaper end-to-end proof.**
The full-generation and scalar-commutant results needed by the SCC/QIT witness-completeness formulation already exist in strict-qualified, original-carrier imports. The *new* work is a bounded exact labeled-gamma generation/crosswalk and witness-signature theorem. The major remaining risk is the final source-native Jacobi/covariance application, where historical CT1G0 encountered two recurring elaboration REDs. Do not rerun CT1G0 R3.

## Verified exact mathematical donors
1. **M3I**: `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean`, blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`: `originalComplexCliffordFockAlgEquiv : CliffordAlgebra (source48Quadratic.baseChange ℂ) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`. Parent source full image M3D, injectivity M3H, irreducibility M3A. Qualified historical unified source + independent consumer: [#42547700192](https://github.com/etblink/math/actions/runs/42547700192), GREEN.
2. **M3C**: `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean`, blob `6fefd9ae344df0b7247feb34c9bec5ea0a27aea0`: `originalComplexCliffordFock_scalarCommutant : Function.Bijective (algebraMap ℂ (Module.End A V))` on original A-module V. This is a much closer reuse target than proving a fresh full-matrix-algebra center theorem.
3. **OP3-A2**: `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean`, blob `a9db27fc28379b35ca85515d733cc0bc43376592`: exact equality of complex Clifford generator image on each source 8×2×3 coordinate axis with `sourceNormalizedGamma` on genuine `Fermion 2`. Check its own exact qualification receipt before current gate reuse; present source theorem is not by itself a current new acceptance.
4. **S1V0 + S1V5 + S1V7**: `Source48Label := Fin 24 × Fin 2`, `Source48Vector := Source48Label → ℝ`; `sourceBlockColorEquiv : (Fin 8 × Fin 2) × ColorLabel ≃ Source48Label` and `sourceBlockColorAxis = Pi.single` give the complete 48-coordinate indexing; S1V7 identifies this index ordering with original paired-label conventions. A new source-axis *spanning* lemma may still be needed.
5. **Pinned Mathlib** at `d13f23b723b8a846827a245b89c10fc7d3f11612` has theorem `CliffordAlgebra.adjoin_range_ι : Algebra.adjoin ℂ (Set.range (CliffordAlgebra.ι ...)) = ⊤` in `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`. The generator-span route is **available in the actual pinned toolchain**, not just latest online docs.
6. **LB1C1**: exact original real skew covariance `[K(A), Gamma_k] = sum_p A[p,k] Gamma_p` at [#43901524171](https://github.com/etblink/math/actions/runs/43901524171), source blob `c2e7a7c665121283cde13ae5dabc183362b6b420`.
7. **CT0**: original Fock trace cyclicity and `Tr K(A)=0` for skew real A at [#43983772199](https://github.com/etblink/math/actions/runs/43983772199), source blob `a6f93c62c83bf51a0b89691196f875399d2896fa`.
8. **QTC1G0**: accepted original-Fock real-quarter coefficient normalization [#44024718712](https://github.com/etblink/math/actions/runs/44024718712); source-specific K/Q equality remains unqualified.

## Revised proof architecture (research contract only)
**W0 source-independent or donor-thin:** On actual source Fock `Op`, prove that the family of *all 48* named normalized `Gamma_p` algebraically generates all complex endomorphisms via M3I, OP3-A2, `Pi.single` axes and pinned Mathlib `adjoin_range_ι`. Next, prove an injective witness signature `T ↦ (([T,Gamma_p])_p, originalFockTrace T)`. Prefer M3C's already typed Schur scalar-commutant after a local A-linear endomorphism adapter. Avoid direct K(A) substitution here. Separate original consumer and approved-axiom audit. This is the smaller candidate.

**W1 fully abstract Lie-bracket transport:** Given finite `ι`, `Gamma:ι→Op`, `K:Matrix ι ι ℝ→Op`, skew covariance and trace zero, prove via Jacobi and finite-index matrix contraction that `D(A,B)=[K(A),K(B)]-K([A,B])` commutes with every gamma and has trace zero, hence vanishes under W0. Keep `K` opaque; do not unfold 48-term source expressions.

**W2 independently audited source adapter:** Use existing LB1C1 and CT0 to instantiate W1, with strict source/consumer run and exact donor pinning. Historic CT1G0 [#43988822460](https://github.com/etblink/math/actions/runs/43988822460) and [#43991790285](https://github.com/etblink/math/actions/runs/43991790285) suffered recursive elaboration at the native source Jacobi expression and at the final `exact`. **W2 is therefore a high-risk distinct experiment, not a promised automatic payoff.** No new W2 until W0 and W1 have qualified and the adapter term has been explicitly re-architected.

## Quantitative four-gamma falsification control
See independently executed [Python control](countermodels/bfss_qit_scc_four_gamma_control.py). Use
```
Gamma_1 = X⊗I, Gamma_2 = Y⊗I, Gamma_3 = Z⊗X, Gamma_4 = Z⊗Y
K(A) = 1/4 sum_{p,q} A[p,q] Gamma_p Gamma_q
```
with fixed integer-entry real skew A, B. Each is 4×4; the complex operator space is 16-dimensional. The script evaluates complex-linear rank of `T↦([T,Gamma_i])`, and the same map augmented by trace:
| available gamma witnesses | commutator rank / 16 | plus trace rank / 16 |
|---|---:|---:|
| 1 | 8 | 9 |
| 2 | 12 | 13 |
| 3 | 14 | 15 |
| 4 | 15 | 16 |

CAR, covariance, `[K(A),K(B)]=K([A,B])` and skew K trace residuals each = **0** for these input matrices at machine precision. A scalar shift `1.5 I_4` commutes with all 4 gamma matrices but has trace 6, explicitly showing why trace closes the last missing witness. Three gammas **plus trace do not suffice**, a counterexample to prematurely claiming witness completeness from an incomplete family.

This is a small complex matrix control, **not** a computation on 48 Majoranas or a physical SU(2) singlet. It tests the structural proposition and catches missing-witness/central-term errors, not analytic BFSS domain properties.

## Route comparison and project decision
| Route | Qualified pieces | New work | Biggest risk |
|---|---|---|---|
| A: QTC1G1 direct typed source K/Q join, then QTC2 | QTC0D, QTC1G0, LB1C1 | source-native K/Q typed-kernel adapter; subsequent Lie conclusion | QTC1 R1/R2 recurring native specialization failures; need distinct opaque kernel |
| B: SCC/QIT witness-complete direct K bracket | M3C/M3I, OP3-A2 axes, LB1C1, CT0, pinned Mathlib Clifford generators | W0 generation/trace uniqueness; W1 abstract Jacobi/coefficient; W2 thin source adapter | CT1G0 R1/R2 already encountered native Jacobi recursion; extra independent gates |
| C: observable action only | M3I, OP3-C6A/P2b-B3 | operational equivalence result | weaker than exact generator identity; scalar center unresolved |
| D: fidelity/observable error certificate | auxiliary target literature and original M5 proposals | bounded-state trace-distance lemma | no ground-state existence or analytic state-specific bound |

**Decision:** evidence favors *researching and specifying* W0 as a distinct small hypothesis-checked gate, rather than immediately prioritizing all of W1/W2 or discarding QTC1G1. W0 is independently useful to source Spin(9) / Clifford verification even if W2 later fails. The overall cheaper route is **not yet determined**. Continue read-only theorem design until actual source types, pins, and independent consumer are audited. Preserve CT1G0 negative evidence and make no claims about full BFSS bracket, mass gap, physical singlet or ground-state fidelity.

## SCC interpretation
The result is a precise mathematical **witness-completeness criterion**, not proof of historical SCC's Minimal Carrier Selection (MCS), WeakGlue, uniqueness/completion, transport-stable identity or any claim about consciousness or physical ontology.
