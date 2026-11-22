# MASSLESS-D0b1 — two original native REDs, frozen gate, replacement proof architecture

**Date:** 2026-11-22 (America/Los_Angeles). **Owner:** BFSS Project Lead. **Disposition:** D0b1 original five-root workflow **FROZEN / UNQUALIFIED** after two native REDs. **No R3 or configuration increase.** This is a *read-only architectural disposition*; the source and workflow of the failed D0b1 remain as historical evidence, not promoted proof.

## I. Exact failures and original archive integrity

| Property | R1 | R2 |
| --- | --- | --- |
| Original run | [#44999415076](https://github.com/etblink/math/actions/runs/44999415076) | [#45017316087](https://github.com/etblink/math/actions/runs/45017316087) |
| Tested commit | `bd581010aa384b66f1e6d64e172bf132b6165a6f` | `8fe10828d8907caa8a40f7ec1651f19b9260ba04` |
| Source blob | `a1b0f6e9a3cf4a6f8f107dcd2854c28a05cfb92d` | `9d14c73b7361131fb8d64dec5b8a51b38c17d868` |
| Job ID | `137137438241` | `137192311180` |
| Preflight/pins/cache | PASS | PASS |
| Imported source prerequisites | 8,999 jobs PASS | 8,999 jobs PASS |
| Native first causal line | `BFSSMasslessD0b1OriginalPartialMultiplierGraph.lean:82:8` | `BFSSMasslessD0b1OriginalPartialMultiplierGraph.lean:82:2` |
| Failure text | `maximum recursion depth has been reached` | **same** `maximum recursion depth has been reached` |
| Original four generic roots | Printed; only `propext, Classical.choice, Quot.sound` | Printed; only `propext, Classical.choice, Quot.sound` |
| Fifth paired source root | **FAILED; `sorryAx` in axiom report** | **FAILED; `sorryAx` in axiom report** |
| Standalone strict compilation | Not reached (native RED) | Not reached (native RED) |
| Original artifact | [#14745482198](https://github.com/etblink/math/actions/runs/44999415076/artifacts/14745482198) | [#14752324304](https://github.com/etblink/math/actions/runs/45017316087/artifacts/14752324304) |
| ZIP bytes, contents | 8,474 bytes; **five files** | 8,562 bytes; **five files** |
| Original ZIP SHA256 | `80169177b597b3ec8ee12a468f32bbd8b62af0967aff4bb3b1321c22efeaf9ca` | `1e05032a27e565069a78a7bdbb6d92e36852c956bd27d802b68103bbacbc38f5` |

Both ZIP SHA256 values were independently recomputed; R2's five ZIP members `cache.log`, `environment-sha256.txt`, `native-source.log`, `preflight.log`, `tested-sha.txt` were read and CRC/length checked. Its `tested-sha.txt` matches the exact run SHA, `preflight.log` reports `BFSS_MASSLESS_D0B1_SOURCE_PIN_PREFLIGHT_PASS`, the original native log shows the same line 82 error and four clean root reports. The absence of `strict-axioms.log` is **EXPECTED**, not an archival failure.

R1 paired consumer proof was `exact originalMasslessMultiplier_ae pairedAlgebraData ψ`. R2 changed **only that proof** to `simpa only [originalMasslessAction] using (originalMasslessMultiplier_ae pairedAlgebraData ψ)`. Both force Lean to elaborate/match a very large explicit lambda involving the literal paired SU2/48-Majorana source. **Observed** is recursion-depth exhaustion at the fifth theorem. **Hypothesis**, not formally demonstrated root cause: definitional unfolding/elaboration of the explicit paired source RHS is too expensive, rather than mathematical failure of the generic operator/graph.

## II. Acceptance boundary and what is NOT a proof

The first four *generic* D0b1 declarations compiled and printed permitted axiom sets in both failed native jobs:
- `originalMasslessMultiplier : (originalMasslessDomain M) →ₗ[ℂ] FullL2 N`;
- `originalMasslessMultiplier_ae`;
- `originalMasslessGraph : Submodule ℂ (FullL2 N × FullL2 N)`;
- `originalMasslessGraph_mem`.

They are **promising separately qualified targets**, but **not accepted declarations** because the original five-root native workflow did not complete and the standalone strict consumer was never reached. The fifth `pairedOriginalMasslessMultiplier_ae` remains unproved in the failed source; its `sorryAx` means the whole source is unqualified. Do not treat a partial `#print axioms` log as a strict GREEN.

Accepted upstream remains the **six-file source chain** M0→M1a→M1b→M1c→D0a→D0b0, including D0b0 original [strict #44998375996](https://github.com/etblink/math/actions/runs/44998375996). No source donor, `main`, or unified integration change is warranted.

## III. NEW proof architecture, not a hidden R3

**A. Separate generic mathematical content from the specialized emitter.** Design a new, separately named source module (not a revision to frozen D0b1) that imports **only accepted D0b0** and contains the same four generic declarations, with *their exact statements and proofs* source-compared to the four R2 compiled declarations. Use a new strictly scoped workflow that requires source full native build, independent warning-as-error compile, exactly four roots and original artifact; no paired source/explicit 48-Majorana theorem in that module. This is an **architecturally different qualification object**, not an R3 attempt on D0b1. Retain original failed R1/R2 with links and hashes. Do not copy a proof without independently checking the new source's exact axioms and own CI.
 
**B. Named-interface paired consumer only after A independently qualifies.** Create a *separate* tiny `paired` adapter module, with a fully elaborated source type written in terms of the **existing named** original `originalMasslessAction pairedAlgebraData ψ`, not the expanded `fun x => pairedAlgebraData.quantizeFrequency ...`. Require exact original paired Fock carrier and the same actual D0b0 domain; do not substitute concrete theta or a convenient model. The most conservative initial theorem is the paired instantiation of the generic `originalMasslessMultiplier_ae` expressed with the named action. Any need for the **fully expanded** paired lambda must be tested in another independent typed interface/bridge theorem; its acceptance is optional for the algebraic graph qualification, not silently assumed.

**C. Typed bridge and independent consumer rather than more tactic search.** If the named paired adapter also exhibits costly elaboration, isolate a type-labelled `have` for the generic theorem at `M=pairedAlgebraData` and perform an explicit `change`/source-level equality rewrite in the small adapter, *without* expanding the original 48-Majorana `pairedAlgebraData` internals. Record first cause. Do not use `maxRecDepth`, `maxHeartbeats`, `sorry`, reduced checking, hidden axioms or larger CI budgets as proof substitutes.

**D. Density and physics gates remain distinct.** Original `Core.coreToL2_dense` plus accepted D0b0 smooth-core inclusion should yield a densely defined domain after suitable source glue. **Not** yet: closed graph, global self-adjointness, Gauss-invariant maximal domain, Hamiltonian equality, spectral gap, topological particle, SM, or GUT conclusion. Future gauge-domain proof should reuse source `CovariantFields.GaugeData.deformedFermionField_covariant` rather than reprove it.

## IV. Concrete stop and integration instructions

- **Hard STOP on D0b1 R1/R2**. No R3, no rerun of either original failed job, no in-place failed module modification or workflow weakening. Mark original D0b1 in README, canonical ledger and selective unified manifest as **FROZEN / NATIVE RED ×2**.
- **Preserve original 5-file artifacts**, tested commits, SHA256 and the unsuccessful paired source consumer so future research leads can understand the negative result.
- **No new CI run in this diagnosis interval.** A future independently named generic-only proof module, if undertaken, needs its own tightly scoped gate and traceable relation to frozen D0b1, rather than silently resetting the old gate's two-RED count.
- **Unified integration** remains intended, **but only six independently original strict qualified source files** are presently candidates. Never import frozen D0b1 or generic-only future candidates until their independent original strict gate passes on their own source and an independent new unified-based integration candidate passes.

**Scientific interpretation:** The evidence supports a practical Lean formalization bottleneck in the specialized consumer, *not* any new failure of BFSS dynamics or physical predictions. Preserving the failed path is valuable negative knowledge.


## Architectural follow-up — D0c0 independent generic-only proof gate launched

The frozen D0b1 original R1/R2 **have not been changed, rerun or worked around**. A **new source and workflow pair** now implements Section III.A as a separately qualified object: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMasslessD0c0OriginalGenericPartialMultiplierGraph.lean`, original Git blob SHA-1 **`2fc90310c9ac476d8e52ba0176ecc94f8994d1c9`**, created commit [`c2bb043fb8ee94f491448b4b6c8eb789a033967d`](https://github.com/etblink/math/commit/c2bb043fb8ee94f491448b4b6c8eb789a033967d). Exact four generic `def/theorem` blocks were source-compared **byte-for-byte** with the original D0b1 R2 source `9d14c73b7361131fb8d64dec5b8a51b38c17d868`; only namespace, source header and removal of failing fifth paired root differ. Named namespace is `FCP.BFSSMasslessD0c0`, so there is no collision with frozen D0b1. One direct import: original accepted D0b0.

Original source-path [strict **D0c0 R1 #45039242640**](https://github.com/etblink/math/actions/runs/45039242640) tested commit `2a3c2860275146e946d88ed0abadd4526b8e39ef`, source + workflow immutably pinned; at launch **IN PROGRESS / UNQUALIFIED**. It requires frozen exact original BFSS/M0–M1c/D0a/D0b0 source blobs, Lean 4.34.1 and pinned Mathlib, full native build, strict warning-as-error, **four** exact clean axiom roots, green sentinel `BFSS_MASSLESS_D0C0_GENERIC_GRAPH_STRICT_GREEN` and independently verifiable original artifact. Do not infer qualifier from D0b1's four native-only reports. This is an **architectural split**, not D0b1 R3. Section III.B paired original SU2 adapter remains unimplemented and unqualified. Closedness, gauge-domain invariance, self-adjointness and physical spectral claims remain separate open obligations. Unified integration remains unchanged and only six previously qualified source files can currently be selectively imported.
