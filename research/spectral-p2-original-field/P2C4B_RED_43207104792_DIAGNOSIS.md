# P2-C4B red-run diagnosis — #43207104792

**Date:** November 12, 2026 UTC / Pacific.
**Run:** https://github.com/etblink/math/actions/runs/43207104792
**Job:** 131144943874, failed source-and-independent-consumer, tested HEAD `557bc77149419ad6be33656f1c164b2197878f0f`.
**Artifact:** https://github.com/etblink/math/actions/runs/43207104792/artifacts/13938919093
**Artifact zip SHA-256:** `86b29973a333abd98321b27a9cc8e41a50d53dc70095c37b7524e18d71db7499`.
**Classification:** SOURCE-PROOF ASSEMBLY ERROR, not a failure of the original BFSS source or integrability mathematics. Full P2-C4B NOT QUALIFIED.

## First causal errors (exact job log)

- `BFSSP2C4BOriginalSourceIntegrability.lean:75:2`: `maximum recursion depth has been reached`. The attempted `simpa only [originalActualDensity]` induced expensive unfolding/simplification in the large original source expression.
- `BFSSP2C4BOriginalSourceIntegrability.lean:84:2`: `Type mismatch`, where `hi` is `Integrable ((fun x => V(x)*‖f x‖²) - (fun x => C*(‖x‖*‖f x‖²))) volume`, but the goal is `Integrable (originalLowerDensity f) volume`. These are mathematically pointwise equal after distributing `sub_mul` and associating products, but the broad `simpa` did not establish the function equality.
- Downstream `#print axioms` on these two declarations and `originalMasslessCoreForm_lower` included `sorryAx` from failed elaboration. The separate consumer NEVER ran; no qualification is licensed.

The original source-dependency preflight and Lean 4.34.1 / Mathlib d13f23b7 environment restore passed. Existing P2-C4A and `SpectralLinearMomentCompactness` compiled with standard-only axioms. **Three** actual P2-C4B theorems had clean reports with `propext, Classical.choice, Quot.sound`: `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, and `originalLinearMoment_integrable`. This is a useful partial success but not a completed strict gate.

## Bounded repair

Do NOT change the original energy, field, state carriers, three already clean proofs, theorem statements, imported source files, or the independent consumer. Only replace the two broad `simpa` implementations with explicit and local proof boundaries:

1. `originalActualDensity_integrable`: `change Integrable ((fun x => V(x)‖f x‖²) + (fun x => inner_R(f x,B(x)(f x)))) volume`, then apply the exact `Integrable.add` of the source witnesses. This avoids the expensive rewrite.
2. `originalLowerDensity_integrable`: establish the small function equality `originalLowerDensity f = (fun x => V(x)‖f x‖²) - (fun x => C*(‖x‖‖f x‖²))` with `funext x`, a local `change` to the literal identity, and `ring`. Rewrite once using that equality, then apply the existing `Integrable.sub` proof.

This repair intentionally does NOT raise maxRecDepth, increase heartbeats, change a dependency, weaken a theorem, use `sorry`, or loosen allowed-axiom enforcement. Update the P2-C4B strict workflow's exact source Git blob pin and let an independently checked new run decide validity.

## Proof ceiling / governance

Even if accepted, P2-C4B gives only the literal original SmoothCore 2 lower estimate without extra integrability assumptions. It says nothing by itself about a genuine Spin(9) reducing sector, closed physical Hamiltonian graph, eigenpair, spectral gap, or mass gap. Keep the November 12 operator-columns P3 research separate from P2-C4B source acceptance. Continue directly on unified; do not create a branch, modify main/FCP, or rewrite historical failure receipts.
