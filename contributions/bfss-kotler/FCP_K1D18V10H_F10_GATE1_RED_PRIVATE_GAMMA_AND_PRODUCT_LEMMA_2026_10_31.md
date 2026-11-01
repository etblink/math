# V10H-F10 Gate 1 RED: original private gamma reduction / incorrect pinned product lemma

Date: 2026-10-31 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Unqualified failure, immutable audit

- [Strict F10 run #41266215820](https://github.com/etblink/math/actions/runs/41266215820): `completed/failure`, attempt 1, job `124729447040`, exact tested commit `4170d1f17973e74b20ead538ad69f7bd7feb87f3`; pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Exact preflight source/hash PASS, toolchain restore PASS, accepted F9 rebuild PASS, **fresh F10 warning-as-error compiler FAIL**, independent exact three-declaration/axiom audit SKIPPED.
- [Immutable F10 Gate 1 artifact #13067525972](https://github.com/etblink/math/actions/runs/41266215820/artifacts/13067525972), SHA256 `00255572d92dd995973c82924c9811d112a85de303466e394b1ac6728cbc3245`. Failure evidence includes full compiler diagnostics.
- Line 43: `originalGamma8_eq_diagonal` generated 256 matrix-entry goals from `fin_cases i; fin_cases j`. The tactic `norm_num [gamma, Matrix.diagonal, Matrix.map_apply]` did NOT unfold `FCP.BFSSGamma9.gammaInt✝` (private original integer signed-permutation matrix), leaving obligations like `gammaInt✝ 8 0 0 = 1` and `gammaInt✝ 8 0 1 = 0` still open. Private definitions may still be definitionally evaluated by kernel `rfl` on concrete finite indices; this is a **technique hypothesis**, not yet a qualified proof.
- Lines 51–53: `Finset.prod_univ_succ` is an **unknown identifier** in the pinned library, leaving `(∏ i : Fin 16, if i.val < 8 then (1 : ℝ) else -1) = 1` unresolved.
- All 3 F10 `#print axioms` responses contain `sorryAx` because Lean accepted incomplete declarations internally; **NONE qualifies**. The mathematical statement was not refuted. The fourth-to-ninth predecessors F1–F9 remain independently qualified and unchanged.

## Source-exact correction candidate

- Pinned Mathlib source `Mathlib/Algebra/BigOperators/Fin.lean` defines the REAL `Fin.prod_univ_succ` theorem, line 76. It is imported transitively through accepted ancestor's `Mathlib` import. Replace the single invalid identifier with `Fin.prod_univ_succ` in the determinant product proof and source preflight.
- For each original finite index pair, try `rfl` FIRST after `fin_cases i; fin_cases j` to definitionally evaluate the **actual immutable private** `gammaInt`, rather than repeating the failed `norm_num` alone. Retain `norm_num` as a fallback to simplify any remaining transported Int-to-Real cast, then `rfl`. This is a narrow source proof-technique repair, not a new gamma representation, sorry/axiom, resource-limit increase, or weakened theorem.
- Exact F10 Lean source changes only those two proof-tactic points. Workflow changes only pinned source blob hash and correct product lemma positive guard. Dedicated strict gate still rebuilds F9, freshly compiles F10 under `-DwarningAsError=true`, independently elaborates all 3 exact theorem types, checks axiom whitelist `[propext, Classical.choice, Quot.sound]`, saves SHA/compiler/audit artifact.
- **F10 remains UNQUALIFIED** until the new strict run succeeds. Source positive-axis determinant proof does NOT by itself show universal gamma-vector positivity, Lipschitz closure, source Spin9 orientation character triviality, global original paired SO48, continuous Spin48 lift, implemented Fock unitary, or BFSS physics.

## Preserved negative knowledge

The original V10H composite determinant gates #41257058496 and #41257744030 (recursive definitional reducer and orthogonal membership mismatch); F4 Gate1 #41260509990 (missing `Submonoid.coe_one`), F5 Gate1 #41261931766 (comment-sensitive preflight false positive), and this original F10 Gate1 red retain their immutable status. Never raise limits, edit accepted sources or merge to main/upstream merely to obtain a green.
