# D1K1A R1 — strict RED: original color-index literal elaboration

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Tested commit:** `225e837b98f3d8e34e11ff1f68835a05fe2af109`.
**Run:** [#44947732882](https://github.com/etblink/math/actions/runs/44947732882), **completed failure**, attempt 1, original job ID `136978646529`.
**Archived native evidence:** [artifact #14724253418](https://github.com/etblink/math/actions/runs/44947732882/artifacts/14724253418), ZIP SHA256 `fdf94ef2e4fdeeb42d2651a1211d4e10a3460b26b0d1a9233cec91bd80d8d0e0`, 10,869 bytes as reported by GitHub.
**Status:** **RED; NO PROOF QUALIFIED.** No repair or rerun authorized by this record.

## Independently checked step-by-step status

- Checkout exact tested source: **PASS**.
- Original-source blob pins and fixed source/consumer shapes: **PASS**.
- Restore Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: **PASS**.
- Cold build: **RED at final module 9069/9069**; G4J and the preceding 9068 modules built, including pinned original `pairedGaugeData`.
- First causal compiler errors: `D1K1AOriginalFockSeedGaugeTransport.lean:37:31`, failed to synthesize `OfNat (ColorIndex 2) 1`, and `39:34`, failed to synthesize `OfNat (ColorIndex 2) 2`. These are the color labels in `sourceOccupiedOrbital`:
  ```lean
  mode (colorModeEquiv (j, (1 : ColorIndex 2)))
  ...
  mode (colorModeEquiv (j, (2 : ColorIndex 2)))
  ```
- Three nominal source `#print axioms` statements exist but each includes **`sorryAx`** due to the upstream elaboration errors. **No axiom-free theorem accepted**.
- Independent consumer: **NOT REACHED**, because `lake build` failed and the shell uses `set -euo pipefail`.
- On-failure artifact upload: **PASS**, including first-causal compiler and setup evidence. No runtime or CI infrastructure failure.

## Interpretation and bounded possible repair

Original `Core.lean` declares `ColorIndex (N) := Fin (colorDim N)` and `colorDim N := N^2-1`. For SU(2), this has three elements, but the candidate's `OfNat` elaboration does not synthesize the requested numerals in the current typeclass context. Explicit `Fin` constructors with proofs of the bounds (e.g. `⟨1, by decide⟩` and `⟨2, by decide⟩` or source-existing witnesses) are a plausible **unverified** local repair. No such repair was implemented or tested; the theorem statements themselves were never qualified.

The error is in this *new proof representation*, not a falsification of the analytic eight-particle state, stabilizer-phase cancellation, gauge action, source massless expectation, or D1L variational program. Conversely, it **cannot** be promoted to a proved source-equivariant state until a clean native+consumer strict gate with permitted axioms passes.

## Project-lead stop/next decision

Honor the current **Python-first** priority. Do not initiate a speculative R2, force source typeclass coercions or spend another 9000-module cold build on two untested literals. Leave D1K1A RED in the ledger and return to **D1L adversarial physical-energy prescreen**: test full spatial/fermion/cutoff terms, exact source massless expectation, Gaussian normalization/Jacobian effects and alternative tube widths with independent symbolic/numerical checks, then revisit only a materially useful source-typed Lean gate. D1F R1/R2/R3 REDs retained. No original sources, main or live RHOPF changed.
