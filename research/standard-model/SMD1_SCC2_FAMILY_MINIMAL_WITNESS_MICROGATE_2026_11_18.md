# SM-D1-SCC2 — finite family-level witness minimality microgate

**2026-11-18 | STAGED, UNQUALIFIED.** No native CI result or archive is implied by file creation.

## Logical target

Lift the accepted SCC1 pairwise `FiniteSeparates` and `UniformlySeparates` definitions to genuine **family-level** `UniformDeletionMinimal`, and show equivalence with Mathlib's inclusion-minimal `Minimal` predicate using *pinned* `Finset.minimal_iff_forall_erase`:

- Exact Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`;
- `Mathlib/Order/CompleteLattice/Finset.lean` blob `fce1b985bf079d153d2774d0c7c370b3048589ab`, theorem around line 109;
- Upward monotonicity discharged from accepted SCC1 `uniform_separation_mono`.

The independent consumer gives the first non-singleton example: two synthetic scenario instances in one family, one in the other, and two Boolean observations. One experiment detects one cross-family pair, the other detects the other; neither alone suffices. Deleting either witness invalidates universal separation. This tests family-level minimality, **not uniqueness**.

## Original native gate contract

Pinned Lean 4.34.1 and Mathlib; cold source build; strict warning-as-error standalone check; importing consumer; 5 source and 5 consumer theorem axiom roots; 2 examples; 6 negative auditor mutations; original SM-Y0/SM-D0, independently archived SCC0/SCC1, and 27 BFSS anchors protected by Git-blob assertions. Build **all imported SCC1 and SCC2 modules**, avoiding the previous SCC1 R2 omitted-module dependency.

No `sorry`, custom axioms, `unsafe`, warning suppression, weakened resource guards, or conditional NFC SCC theorem import. Source and independent consumer statements must be preserved verbatim across retries unless an explicit failure diagnosis justifies a scoped mathematical edit. No import of phenomenology or data into the toy model.

## Qualification ceiling

A successful native gate proves a small family-level deterministic Boolean mathematical interface and counterexample only. It does *not* provide a physically derived SM/BFSS prediction, uncertainty likelihood, quantitative separation bound, continuous parameter theorem, SCC MCS uniqueness claim, or any evidence that one foundational model is correct. Full SM-D1 remains prospective. Archive original strict CI evidence and independent preservation before acceptance.

## Next boundary

After acceptance, separate finite rational probability / total-variation and distinguishability under partial predictions, without modifying the accepted SCC0 comparator implicitly. Consider true experimental likelihood and model-specific maps only with valid primary-source predictions.
