# BFSS CT1-G0 R2 — RED_UNQUALIFIED; two-failure stop applied

Date: 2026-11-16 Pacific. Exact branch: `integration/bfss-unified-research-20261108`.

## Source-exact verdict and first cause

**Original strict [#43991790285](https://github.com/etblink/math/actions/runs/43991790285) completed RED/FAILURE.** Tested Git commit `f6b651c8b60afbb5821c4439111babd4278b4f9a` and job `133733961479`. Source/consumer/donor/toolchain/checkpoint preflight PASS; Lean 4.34.1 pinned Mathlib restoration PASS; cold native source compilation FAIL; original independent consumer and 3+3 strict axiom auditor NOT REACHED.

First causal error:

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean:79:8: maximum recursion depth has been reached
```

This is exactly the application of the generic `originalFock_commutator_jacobi` to the literal original `originalSource48BivectorK A`, `originalSource48BivectorK B` and `sourceNormalizedGamma k` inside the shortened Fock-commutator adapter. R2 successfully moved the error from R1 declaration elaboration line 53 to R2's proof application line 79, **but did not qualify the source adapter**. The two generic Fock Jacobi/commutator-sub lemmas printed only `propext`, `Classical.choice`, `Quot.sound`; the native source adapter printed `sorryAx` due to its failed proof. None of the three R2 roots or the consumer roots is accepted.

The earlier [R1 #43988822460 RED](https://github.com/etblink/math/actions/runs/43988822460) failed native declaration at line 53 with the same recursion class. Its full ZIP, complete original job log, independent rehash [#43991194687](https://github.com/etblink/math/actions/runs/43991194687) and [negative receipt](BFSS_M4_CT1G0_R1_RED_43988822460_RECURSIVE_NATIVE_ADAPTER_2026_11_16.md) remain unchanged. **This is the second analogous source48 native elaboration RED. Apply the stop rule; do not stage CT1G0 R3.** A failed Lean elaboration is not a mathematical contradiction of Jacobi or BFSS.

## Original R2 negative evidence permanently preserved

- Provider artifact [#14288643341](https://github.com/etblink/math/actions/runs/43991790285/artifacts/14288643341), 17,642 exact bytes, ZIP SHA-256 `a4611075b4eb0ce42f010e2530e1b2d351c5adc3eee43a3709c091b296a2efe8`.
- Full original ZIP committed [here](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R2_43991790285_evidence.zip), Git blob `95cef252603501aa9cca2e2fba1339b90e6bb7dc`. ZIP entries `tested-commit.txt`, `preflight.log`, `cold-source.log`; no `source-axioms.log` or `consumer.log` existed because the cold source failed.
- Complete original strict [job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R2_43991790285_complete_job.log), Git blob `e9d4ad2be354ee60cdd7a5f7503d6c8cfe397bd2`.
- Independently verified re-download and provider SHA256 in GREEN [preservation #43994555555](https://github.com/etblink/math/actions/runs/43994555555), job `133743264603`; complete [preservation log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R2_43994555555_preservation_job.log), blob `fc7a031459d52ca08ce69545b34207b0f79fffce`. Per-entry [manifest](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R2_43991790285_evidence_manifest.json), blob `87efa60e2341c7ebac9781599a26b7bfb940804d`.
- Frozen original source blob `df368f58b722ec8cd33a5e8656700cbe06badbe6`, independent consumer `299475618bdf1b0e6a43326c51f15640fa58c397`, workflow `072516db95e9d09b1aa7555173660104653c0c9c`, all left untouched. No new donor, global instance, axiom, source rewrite, or resource escalation.

## Governance and scientific conclusion

Canonical active gate `P3-M4-CT1G0 R2` is **RED_UNQUALIFIED — STOPPED_AFTER_TWO_ANALOGOUS_NATIVE_REDS**. The last qualified mathematical theorem stays **CT0 R2 STRICT GREEN #43983772199**: original skew `K(A)` has zero original Fock trace, with full independently rehashed accepted artifact. CT1-G1 source-bound covariance remains **not staged**. We do **not** assert `[[K(A),K(B)],Γ_k]` has the desired coefficient action, source bracket defect commutes with all gammas, full so(48) K-Lie homomorphism, original Fock-vector Spin(9), physical gauge/charge-domain theorem, Hardy/fidelity certificate, mass gap or BFSS ground-state existence.

See [architecture decision](research/spectral-p2-original-field/BFSS_M4_CT1_TWO_REDS_ARCHITECTURE_DECISION_2026_11_16.md) for the route comparison, frozen stop, and recommended sparse four-Majorana microgate only **after** source-shaped design review. `main` untouched.
