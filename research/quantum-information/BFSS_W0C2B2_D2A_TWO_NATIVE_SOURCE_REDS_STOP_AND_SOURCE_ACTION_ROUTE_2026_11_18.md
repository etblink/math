# BFSS × QIT × SCC W0C2B2 D2A: native two-RED stop and source-action research redirect

**Project Lead disposition, 2026-11-18 Pacific.** This is a source-exact evidence and research-plan document, not a theorem qualification. Branch **only** `integration/bfss-unified-research-20261108`. No `main` edit, no old D2A R1/R2 source/workflow rewrite, no mutation of the 27 accepted anchors or original B2 R1/R2/D0/D1 REDs.

## 1. Native D2A stop and exact evidence

| Run | Tested commit, failure | Independent preservation |
| --- | --- | --- |
| [D2A R1 #44350891866](https://github.com/etblink/math/actions/runs/44350891866) | `27812dc16049f4c620b93b3580818747806a3a28`. Original Lean source line 35:53: `unsolved goals`, same printed expression both sides after `unfold originalSource48K_lieDefect`. One generated `sorryAx`; consumer not reached. | [Archive #44355190510](https://github.com/etblink/math/actions/runs/44355190510) GREEN, commit `bd31f291095d2088c74c38ff22a9c666fdd58be5`. Original ZIP SHA256 `90d9b0bfcbae790c2825531fdf4083d685a337bdeacef7905e1bce5dead2f81c`, full 330,655-byte job log SHA256 `3dec72dc893df2df6338737061a43ae5d2d22fa432db0cff7b622af42f2f0b94`. |
| [D2A R2 #44355713875](https://github.com/etblink/math/actions/runs/44355713875) | `1532bb8cc0abd6a6f9e0f73fe8aa7392327a07bb`. Original Lean source line 37:8 `maximum recursion depth has been reached` at `exact Eq.refl _` after the same controlled unfold. One generated `sorryAx`; consumer not reached. | [Archive #44360841140](https://github.com/etblink/math/actions/runs/44360841140) GREEN, commit `ad12eb74763edf3dbea2010c85ce3ba002c0dc7a`. Original ZIP 20,103 B SHA256 `9b12156a79e903099c4d6490dfa1505d4f63623f438c1ab0ae9a0a9067fb0c58`; full 329,965-B job log SHA256 `8cd52f22b818ec1f6818a533f0bc24b28a14abdd802730a821ea4197dd50f4a1`. |

Source R1 blob `50f1092d7c6efe7795bde79429e3b263fc12f604`, source R2 blob `ada49449b77e145cdcb754edc5c43f57242a3c96`; same separate independent consumer blob `3c621fe16b16610cf02c0bba2547bb5961a19f6d`, not compiled in either native run. Pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and 27-anchor B2 stop preflights passed in both. Original artifact ZIP bytes, complete log, SHA-256 and per-member CRC manifests are Git-pinned; expiration of the Actions host originals does not discard the repository evidence.

**STOP** D2A controlled-unfold/reflexivity architecture after two native source REDs. Do **not** propose unchanged D2A R3, replace `Eq.refl` with repeated global `rfl`/`simp` variants, raise Lean resource ceilings, introduce an axiom/sorry, change the original `Fermion 2` operator model, edit accepted donors, or claim an algebraic counterexample. The R2 error is proof elaboration/definitional checking, not a mathematical falsification.

The old D2A R1 workflow was designed to insist on immutable R1 source hash; its [#44355713665](https://github.com/etblink/math/actions/runs/44355713665) RED at the R2 commit was the **expected source-blob preflight rejection**, not a third native mathematical RED. Future distinct candidate source filenames avoid its old push path and preserve the historical workflow.

## 2. What succeeded / why D2A was a poor target

Accepted source-exact [W0C2A #44213315719](https://github.com/etblink/math/actions/runs/44213315719) **already defines** the literal original operator `originalSource48K_lieDefect A B`, proves its trace zero for real transpose-skew A,B, and proves unconditional bracket equality **conditional on all-48 original gamma centrality**. It did not require a separate redundant theorem that the definition equals its own expression. Our D2A attempt added this redundant statement and encountered an avoidable kernel conversion bottleneck before reaching real physics/mathematics.

Accepted [B1 #44267283653](https://github.com/etblink/math/actions/runs/44267283653) already proves abstract original-Fock `originalFock_commutator_covariance_bracket`, plus Jacobi and complex weighted-sum covariance, for opaque generic original `Op = Fermion 2 →L[ℂ] Fermion 2`. Accepted [B0N #44260119108](https://github.com/etblink/math/actions/runs/44260119108) supplies exact real `Source48Label` → complex column and commutator transport. Accepted original `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` supplies the true source gamma covariance `[K(A),Γ_k] = Σ_p A_{pk}Γ_p`.

The stopped original B2 R2 source `P3M4W0C2B2OriginalSource48KLieDefectGammaCentralityR2.lean`, frozen Git blob `d52f48a79750846231c306d9e9ac8ceda25d37be`, has *two clean source-axiom roots* in its historical native RED: original skew-K single gamma covariance and original K commutator covariance. Its third step is the elaboration-heavy direct subtraction on raw K(A) operands. Reuse the **mathematical ideas** of the first two roots in a separately reviewed candidate, not the unqualified third/fourth roots. Source-only successful fragments within a RED file are not themselves an independently qualified NEW gate.

Historical lessons already summarized in [methods atlas](BFSS_W0C2B2_METHODS_FAILURE_ATLAS_AND_D2_EXECUTION_PLAN_2026_11_18.md): generic finite-sum first, explicit typed real-to-complex adapter, `Finset.sum_congr`, small directed `calc`, qualified-source reuse, independent importing consumer, source/consumer standard axiom auditing, six adversarial negative auditor mutants and immutable evidence archiving. **Failed patterns**: expanded `abel`, `exact` of abstract lemma onto huge concrete source expressions, new `def` wrappers followed by `rfl`, additive-map instantiation that still unfolds K(A), the new controlled `unfold; Eq.refl` on the same enormous expression, and attempts to increase Lean resources.

## 3. Proposed distinct alternative — source-action equality, not defect-definition equivalence

Let the **genuine original expressions** be:
[
P(A,B) = K(A)K(B)-K(B)K(A), quad
Q(A,B)=K(AB-BA), quad X_k=Gamma_k.
]
These are *mathematical notation*, not new Lean `def` wrappers. The actual source formulas and original Fock carrier must remain unchanged.

1. **New preflight design review, no Lean code staged now:** confirm the two original-source covariance propositions have exactly compatible true `Op` statement types and right-column coefficient order; compare accepted original B1, B0N and LB1C1 signatures. In particular, the first two B2 roots share the complex column `Σ_q ((complexify A * complexify B - complexify B * complexify A) q k) • Γ_q`; after skewness of `AB-BA`, the accepted LB1C1 and B0N give the same action for Q. No direct source-defect equality needed in this part.
2. **One generic opaque-Op research microgate, separate from concrete source:** for `P Q X : Op` and an *explicit hypothesis* `P*X-X*P=Q*X-X*Q`, prove `Commute (P-Q) X` using algebraic additive rearrangement on variables only. This generic fact is not a source-specific gamma theorem, and should not be called the 28th anchor.
3. **Only after a native generic GREEN:** investigate source-adapter specialization to the exact P,Q expressions, with *independent consumer* and no raw source-expression `rfl`/unfold in proof. A separate source-specific equation `Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k)` is the actual centrality obligation. If instantiation still demands large definitional conversion, **stop** and assess a second route via Clifford algebra derivations or an original-source centralizer membership interface; do not loop over identical terms with different tactics.
4. **Only after qualified centrality:** use existing W0C2A conditional trace/witness theorem to obtain the unconditional original K bracket. Stage W0C2B3 only after exact source+consumer strict GREEN and original artifact preservation.

The **source-action approach is still hypothetical**: equal action on each gamma plus matching trace gives a mathematically motivated faithfulness route, but converting it to a Lean theorem on the original Source48 `Op` remains unproved. Alternative Clifford generator-centralizer route must preserve exact original M3I equivalence and original central sign, not silently replace source Fock action or assume a group lift.

## 4. Current governance

**Canonical active: W0C2B2 BLOCKED** after original two native source REDs; **27 accepted anchors**, W0C2B1 R2 last qualified run #44267283653; **D0 R1** infrastructure timeout, **D0 R2** native source RED, **D1 R1** native source RED, **D2A R1/R2** two native source REDs, independently preserved. **W0C2B3 PROSPECTIVE_NOT_STAGED.** All higher physical/gauge/closed-operator/spectral/mass-gap/SCC operational conclusions remain excluded.

No new mathematical module, CI gate or proof-root acceptance is authorized merely by this document. Review the next distinct source-action microgate before implementation, retain the stop on D2A and all immutable historical failures.
