# IBI-G1B R3 — preregister exact original color-index consumer repair

Date: 2026-11-15 Pacific.
Status: **PROSPECTIVE / UNQUALIFIED** until independent strict CI.

## Boundary and minimal change

R2 [#43699776873](https://github.com/etblink/math/actions/runs/43699776873)
passed its 9,019-job original G1B cold source build with all seven
named roots using only accepted standard Lean axioms; consumer fails
on three `OfNat (ColorIndex 2) k` instances on two concrete positive
and negative Pauli orientation examples.

`OAI.BFSSQuantum.ColorIndex N` is `Fin (N ^ 2 - 1)`, so replace
the six consumer-only literal arguments in the two examples with
explicit constructor indices `(⟨0, by decide⟩ : ColorIndex 2)`,
`(⟨1, by decide⟩ : ColorIndex 2)`, and
`(⟨2, by decide⟩ : ColorIndex 2)` in the proper order.
Keep `rw [pairedColor_structureConstant]` and
`norm_num [FCP.BFSSSU2.epsilon3]` to test BOTH signs,
not merely restate equality on abstract variables.

## Exact-source guardrails

No change to G1B source blob
`b42291fe0aa5f8b22a31bad19b9de5c775372a71`,
imports, named proofs or theorem statements.
Keep all four independent consumer examples; only the six concrete
index literals are adjusted. Update consumer Git blob pin in workflow
atomically with this preregistration and the RED R2 record.
Maintain original source pins, Lean 4.34.1, pinned Mathlib,
strict cold source and independent consumer check, and
`#print axioms` standard-only audit. Do not infer success before
strict GREEN on a fresh exact tested SHA.

If the revised consumer fails, preserve its first causal diagnostic.
An actual sign mismatch is falsifying evidence for this bridge;
a further syntax/type-conversion failure is a proof-engineering issue,
not license to relax checks. Stop for architecture review upon two
*analogous* first-causal reds.
Original source G3A det-one, SU2→SO3 image, complete gauge orbits,
physical domain application and ontology are all still open.
