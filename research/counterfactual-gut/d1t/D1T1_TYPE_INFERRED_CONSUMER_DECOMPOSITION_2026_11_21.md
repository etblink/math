# D1T1 prospective consumer decomposition — type inference before public source expansion

**2026-11-21 / design only.** No D1T1 Lean source, CI workflow or run created. This specification preserves the negative results of D1S1 independent consumer [R2 #44965032924](https://github.com/etblink/math/actions/runs/44965032924) and typed D1T0 [R1 #44966825031](https://github.com/etblink/math/actions/runs/44966825031). Their failures are at the second consumer theorem declaration, not in the original compiled source proof.

## A. Source result not to change

Frozen `D1S1OriginalFrequencyGaugeTransportProbe.lean` blob `c2946bab3f82bf1ba57574a6a9d18258c185ef99`, strict source proof `FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge` reports only `[propext, Classical.choice, Quot.sound]` on real `FrequencyMatrix 2`, genuine `Fermion 2`, source `pairedAlgebraData.quantizeFrequency`, and `pairedGaugeData.fermion` (through source's exact typed private abbreviations). Do not import the D1R0 rejected quadratic or change the source proof.

## B. Diagnostic decomposition, deliberately not an acceptance theorem

1. In a new independent file, first import the source and request its exact declaration type using `#check FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge`. Avoid opening or expanding source names yet. A `#check` alone is not an independent theorem.
2. Test an **inferred-type** certificate such as `theorem inferred_covariance := FCP.BFSSHopfD1S1.originalQuantizeFrequency_gauge` without manually re-elaborating the large proposition. Note: proposed syntax is *unverified* at the pinned Lean toolchain. Check `#print` and axioms only if Lean compiled.
3. Separately test application to literal `g : GaugeGroup 2`, `K : FrequencyMatrix 2`, `v : Fermion 2`. Avoid converting both sides by large-scale unfolding; do not use `maxRecDepth` workaround. If the inferred declaration fails, stop and preserve this focused trace.
4. Independently use the already compiled D1T0 `exact_original_fermion_alias` and `exact_original_quantizer_alias` declarations to confirm literal public-source binding. A successful inferred re-export plus aliases is **weaker** than the original independent theorem with public names; do not relabel as complete independent acceptance.
5. Only after those narrow checks pass, attempt one **separate** explicit original public interface bridge. If it fails, the source proof stays accepted while the public consumer remains unqualified. Preserve diagnostic info with Lean `set_option diagnostics true` only within an isolated diagnostic if needed; do not mask errors by raising recursion limits.

## C. Gate policy

No D1T0 R2 and no D1S1 R3. This plan may be authorized separately only after source-level static review. Every new CI gate must pin the same Lean 4.34.1/Mathlib/source blobs, check original source and independent consumer axioms separately, retain warning-as-error and unconditional artifact preservation, stop after two failures, and mark partial results precisely.

**Physical ceiling:** coefficient/operator gauge covariance only; no Gaussian projection topology, normalized spectral gap, physical BFSS Hopfion, Standard Model or GUT consequence.
