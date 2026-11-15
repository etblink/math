# IBI-G1B R4 — canonical Fin3 orientation-layer architecture preregistration

**Date:** 2026-11-15 Pacific
**Branch:** `research/bfss-incidence-unified-20261114`
**Status:** PROSPECTIVE / UNQUALIFIED; *no local Lean compiler available* in this session.
**Supersedes proof approach of R2/R3 consumer fixtures only.** The original G1B source theorem and source blob remain untouched.

## Two related consumer-boundary REDs and stop-rule response

R2 [#43699776873](https://github.com/etblink/math/actions/runs/43699776873): original-source cold build and all seven standard-only axiom reports passed, but `OfNat (ColorIndex 2)` instances failed in two concrete sign examples.
R3 [#43700926730](https://github.com/etblink/math/actions/runs/43700926730): original-source cold build and all seven standard-only axiom reports passed, but explicitly constructed `⟨k, by decide⟩` indices left nested `epsilon3` pattern reductions unresolved.
These are **analogous finite-index consumer failures**, triggering the enforced architecture review recorded in `IBI_G1B_POST_R3_TWO_CONSUMER_REDS_ARCHITECTURE_REVIEW_2026_11_15.md`.
R3's first-causal RED and exact artifact are preserved in `IBI_G1B_R3_RED_43700926730_EPSILON_FIN_NORMALIZATION_2026_11_15.md`.

## Structural revision, rather than a third ad hoc simp replacement

Layer 1: two private *canonical Fin 3* lemmas, each using direct `rfl`, test literal upstream `FCP.BFSSSU2.epsilon3` at (0,1,2) and (0,2,1). The source-defined `epsilon3 : Fin 3 → Fin 3 → Fin 3 → ℝ` has precisely these branches. No `ColorIndex` dependent elaboration occurs in this layer.

Layer 2: two independent original paired-algebra examples take `(k : Fin 3)` as **concrete argument terms** to `pairedAlgebraData.structureConstant`. Original `Core.lean` defines `ColorIndex N := Fin (N ^ 2 - 1)`, so `ColorIndex 2` is definitionally `Fin 3`. Each example rewrites the accepted `pairedColor_structureConstant`, rewrites the respective canonical finite sign lemma, and finishes by `ring`. No textbook SO(3) substitution or new Pauli basis.

Layer 3: preserve verbatim the original-source independent examples on **arbitrary** `g : GaugeGroup 2`, `x : Boson 2`, and `i j k : SpaceIndex` that consume the signed triple normalization and gauge invariance. The consumer still has exactly four `example` declarations. The two finite sign lemmas are private proofs, not bypasses of the source.

## Specific falsifiers and qualification

- R4 is an **architectural one-shot** follow-up after two analogous consumer reds. The compiler must independently elaborate **both** canonical `rfl` lemmas; source patterns or type coercions may still fail—this is not pre-certified.
- The exact G1B source blob `b42291fe0aa5f8b22a31bad19b9de5c775372a71` stays byte-identical. The strict workflow changes only the consumer blob pin, in the same atomic commit as this preregistration.
- Preserve Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, all pinned imports, cold original-source build, warning-as-error independent consumer, seven allowed source axiom reports and explicit absence of `sorryAx`. No resource-limit or axiom-policy relaxation. A source-only PASS is not full qualification.
- Stop immediately after any R4 RED, capture its exact first causal boundary and do **not** make another ad hoc tactic change. If a concrete sign is opposite, report the source-level counterexample instead of suppressing it.

## Claim ceiling

Even with full strict GREEN, the conclusion is only original-source signed Pauli color-cross/triple normalization and gauge invariance. G0B1 exact native det-one, G0C source SO(3) surjectivity, G2 orbit reconstruction, physical Fock/Hardy/ground-state transfer and any ontology remain open. Source Spin9 octonion research is orthogonal to this SU(2) color gate.

Unified integration, main, FCP, original pilot and historical RED receipts untouched. Any future promotion requires separate clean bundle and owner approval.
