# IBI-G1B R1 — RED_UNQUALIFIED, original signed-cross normalization

Date: 2026-11-15 Pacific.
**No accepted G1B theorem**; the existing G0A, G0B0 and G1A strict greens remain unchanged.

## Exact verdict and first-causal evidence

- [Strict run #43695261997](https://github.com/etblink/math/actions/runs/43695261997), attempt 1, tested exact commit `28a0efe59fb31d5a07cf07da219b77bc731c8db5`, completed **failure**.
- Job `132754259067`: pinned source/consumer preflight **PASS** and Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration **PASS**.
- Cold build **RED** in source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG1BOriginalSignedCross.lean` at **84:2**, exact first causal message: `simp made no progress`.
- The failing tactic is the final `simp` in `originalLieTriple_eq_crossTriple`, after `unfold originalLieTriple originalCrossTriple; rw [pairedColorLie_eq_sourceCross]`. The original source-defined inner-product scaling was not discharged.
- Earlier five roots in the same source emitted only accepted `propext`, `Classical.choice`, `Quot.sound`; **the two dependent declarations** `originalLieTriple_eq_crossTriple` and `originalCrossTriple_gauge` explicitly report **`sorryAx`**. Do not count their superficial printed statements as proof.
- Cold source target did not build and native independent consumer **did not run**. The GREEN marker was not emitted.
- Uploaded diagnostic [artifact #14154003545](https://github.com/etblink/math/actions/runs/43695261997/artifacts/14154003545), 4,894 bytes; upload-log ZIP SHA256 `9f64f5df56442566f92711197768c80704b10f704af9a52324c07355f3adb341`; independently rehashing the downloaded ZIP was not performed.
- Source blob `5cbab8c706edd239e593c3da45c94fa13c256a35`; independent consumer blob `8ab857bdbc77e01ec0e5c4dd1138cc1698f12244`; workflow blob `a3948aaeb2e855a91cfd55f5bcb5928e4f7ba361`.

## Response and scientific boundary

This is a definite Lean proof/qualification failure, **not a counterexample** to original Pauli orientation. The exact first cause is a missing explicit scalar-inner rewrite, not a wrong quaternion/octonion normalization. A future repair must be preregistered and restricted to the failing proof. In particular, expose the exact `inner_smul_left` / real Hilbert-space scalar lemma and type at the goal instead of masking with broad `simp`/resource escalation; requalify a fresh exact source SHA plus independently compiled, byte-identical consumer.

**Do not launch another G1B run from this record alone.** Finish typed proof-shape inspection, preregister the source-only change, and preserve this red. Do not advance G0B1 direct native determinant gate by pretending G1B passed. No `main`, unified integration or FCP change is authorized.
