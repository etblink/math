# BFSS W0C2B2 E0 — opaque original Fock equality-of-actions pre-gate

**2026-11-18 Pacific.** Project Lead diagnostic child of blocked original W0C2B2, **NOT** the 28th accepted anchor and **NOT** source-specific all-48 centrality. Work strictly on `integration/bfss-unified-research-20261108`, leave `main` untouched.

## Preserved entry state and rationale

The accepted [W0C2B1 R2 #44267283653](https://github.com/etblink/math/actions/runs/44267283653) proves Jacobi and conditional coefficient covariance for **opaque** true original `Op = Fermion 2 →L[ℂ] Fermion 2`. Original B2 R1 #44274131658 and R2 #44280267807 each failed native source on the concrete K(A) subtraction bridge. D0 R1 #44330552342 was a cold-build timeout; D0 R2 #44336446671 failed source elaboration while applying a generic additive map to raw K(A). D1 R1 #44344524186 failed `rfl` on new concrete definitions. D2A R1 #44350891866 and R2 #44355713875 failed, respectively, an unfinished goal and a recursive reflexivity check of the concrete W0C2A defect equation; [two-RED stop](BFSS_W0C2B2_D2A_TWO_NATIVE_SOURCE_REDS_STOP_AND_SOURCE_ACTION_ROUTE_2026_11_18.md) remains binding. All original CI providers, full logs and integrity manifests are independently Git-archived.

**Key methodological correction:** Stop asking Lean to elaborate the expanded K(A) operator as part of a generic algebraic lemma application. First independently qualify the missing purely algebraic *equality-of-actions* implication with P,Q,X opaque, and explicitly separate it from the unproved concrete equal-action hypotheses.

## E0 exact source contract

New source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/ProbeW0C2B2E0OpaqueFockEqualActions.lean`.
Original real or complex Spin9 matrix, Clifford equivalence, gamma or K(A) definitions are **not** unfolded here. The only operator type is the genuine original `Op` defined above, using qualified B1 and Mathlib. Three source results:

1. `originalFock_equal_actions_implies_difference_commutes`: for `P Q X : Op`, assuming `P*X-X*P=Q*X-X*Q`, prove `Commute (P-Q) X` by distributivity and a single `abel` on the opaque variables.
2. `originalFock_equal_columns_implies_difference_commutes`: accept *separately* `[P,X]=C` and `[Q,X]=C` with `C:Op`, yielding `Commute (P-Q) X`. Does NOT fabricate either action equality.
3. `originalFock_equal_column_family_implies_difference_commutes`: index-wise transport of separately stated columns for a family `x:ι→Op`.

New independent consumer `lean/diagnostics/BFSSW0C2B2E0OpaqueFockEqualActionsIndependentConsumer.lean` imports only E0 and qualified W0C2A. It checks three independent theorem boundaries, including **actual original `sourceNormalizedGamma : Source48Label → Op`** as a family with **explicit** (unproved) bracket and target columns, and two controls on identical opaque operator operands `P-P`. It does not instantiate P,Q with raw K(A) and does not assert original gamma centrality.

Separate strict native CI contract: actual Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact hashed source+consumer+qualified B1/W0C2A/B0N/LB1C1 inputs, frozen B2 and D0/D1/D2A RED artifact hashes, 27 canonical qualified anchors unchanged, original B2 status BLOCKED and W0C2B3 PROSPECTIVE_NOT_STAGED. Cold source build, independent native consumer, three source and three consumer `#print axioms` reports permit only `propext`, `Classical.choice`, `Quot.sound`. Six adversarial audit mutations must fail when they introduce `sorryAx`, foreign axioms, duplicate/missing report, warning or error. No proof-limit escalation. Original artifact ZIP/complete job log/CRC manifest to be preserved independently for GREEN or RED; no qualification from workflow preflight or roadmap guard alone.

## Scope ceiling / next gate decision

If E0 independently qualifies, a *new separately reviewed source-specific microgate* can attempt to provide true independent bracket and target `sourceNormalizedGamma` action equalities using the accepted B1, B0N and LB1C1 theorems. **The source-exact specialization to `originalSource48K_lieDefect A B` remains open**; if Lean still requires full concrete-expression normalization, stop rather than repeat D2A, and study the separate Clifford derivation/centralizer membership route.

E0 alone does NOT establish all-48 centrality, unconditional original K(A) Lie bracket, new accepted W0C2B2 anchor, group-valued Spin9, original physical domain, Hamiltonian symmetry, spectral gap/mass gap, or SCC operational conclusions. Preserve the negative evidence even if a later proof route succeeds.
