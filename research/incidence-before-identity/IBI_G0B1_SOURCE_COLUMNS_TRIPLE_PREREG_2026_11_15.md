# IBI-G0B1 source columns and signed color-triple covariance — strict preregistration

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Status:** PROSPECTIVE / UNQUALIFIED pending exact strict CI on the tested commit.

## Qualified donors and exact purpose

- FIN-DET3 [run #43705949773](https://github.com/etblink/math/actions/runs/43705949773) GREEN_QUALIFIED at tested `35e0a754fc9ba07223492b8e108c60d30bc6b8ea`; the actual source Pauli `colorCross` column polynomial equals determinant, even for genuine G3A source adjoint matrices, with an independent det=-1 orientation-reversal control.
- G1B [run #43703395473](https://github.com/etblink/math/actions/runs/43703395473) GREEN_QUALIFIED, signed exact `+sqrt(2)` Pauli colorLie/sourceCross relation and gauge-invariant original bosonic triple.
- Original source G3A `adjointCoefficient_on_basis` identifies genuine matrix column A with color-conjugation of original `colorUnit A` at output row B. Original upstream `M.colorConjugate_lie` and `M.colorConjugate_inner` supply exact Lie-triple covariance.

The new candidate is a **bounded three-theorem source adaptor**, not the native determinant-one theorem:

1. `sourceColumn_apply` makes the original G3A output-row/input-column identity explicit without inventing a new representation.
2. `sourceColorLieTriple_conjugate` proves inner Lie-triple invariance for *arbitrary source* `ColorVector 2` variables under actual paired SU(2) color conjugation (not only spatial bosonic fields).
3. `sourceCrossTriple_conjugate` rewrites the same source Lie bracket through already-qualified G1B `pairedColorLie_eq_sourceCross`, invokes pinned Mathlib `real_inner_smul_left`, and cancels the positive original `sqrt 2`, preserving orientation sign.

The original G1B scalar identity and FIN-DET3 source/consumer/workflows remain byte-identical. This does NOT assert `(G3A.adjointColorMatrix g).det=1`, source image = SO(3), full classical orbit classification or any BFSS physical theorem.

## Pinned exact files and independent verification

- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1SourceColumnsTriple.lean`, blob `7022f0759fd761791132857e8c07bf8b442d9c43`.
- Consumer `lean/diagnostics/BFSSIBIG0B1SourceColumnsTripleIndependentConsumer.lean`, blob `8d03cae2dce474afaf6712d7aa4bb710d59dd82a`, separately compiled examples on arbitrary real original gauge element, input/output indices, and original three-vectors; **exactly three** examples.
- Workflow `.github/workflows/bfss-ibi-g0b1-source-columns-triple-strict.yml`, blob `779b3b732918dcbaf2e3fd9d5944958bd58cb5b8`.
- Strict frozen import pins: FIN-DET3 `c53fe995551ec85af6c66f9a5939dd421bbc9c10`, G1B `b42291fe0aa5f8b22a31bad19b9de5c775372a71`, original G3A `553869f1287c64893398c3b79c04fe010023bd08`, source Pauli cross `209b3808222730ca5e817d83ed32253a67513f7f`, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold source build; fresh source and separately compiled independent consumer under warning-as-error; three source `#print axioms` reports allowing only `propext`, `Classical.choice`, `Quot.sound`, zero `sorryAx`, and preserved artifact/green completion marker. No new source axioms, `sorry`, theorem assumption, or resource-limit escalation.

## First-red and next-stage controls

This prospective proof has been checked structurally against exact existing source signatures; it has **not** been run in local Lean. A first causal RED must be preserved before any bounded repair. Two analogous source/consumer REDs trigger proof-architecture review rather than recurrent tactic changes. No reuse of an unqualified prior theorem as a donor.

Only after strict GREEN should a separate G0B1 native determinant-one gate combine:
(1) the three literal original conjugated basis columns,
(2) this source-signed triple invariance and identity-unit orientation +1,
(3) FIN-DET3's signed determinant polynomial.
Keep source image surjectivity G0C, rank-split G2 and original physical-domain relevance as independent falsifiable obligations.

All writes confined to incidence research branch; unified integration, main, FCP, original pilot and original source untouched.
