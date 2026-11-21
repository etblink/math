# RHOPF-P9C3D2G1D37 R1 — strict original-source RED, class reducibility warning

**Pacific date:** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.  
**Original run:** [#44866969452](https://github.com/etblink/math/actions/runs/44866969452), attempt 1 FAILURE, exact tested commit `b186add883f13ba9491ce7ee4d18caccff5c3f64`, job `136732689782`, branch `integration/bfss-unified-research-20261108`.
**Original artifact:** [#14692688205](https://github.com/etblink/math/actions/runs/44866969452/artifacts/14692688205). **Original ZIP independently computed SHA-256:** `c4413f04b1f406297701ffefe716cb0550bbae39cb187909bb44146d5be99f29`, identical to original CI upload and GitHub metadata. Five ZIP files checked; embedded tested SHA matches.

## Original-source findings
- Exact frozen Gamma9/P/J/Circle/accepted D36 source preflight PASS, original independent signed-permutation integer fixture PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS, original dependency build **9,084 jobs** PASS.
- Native D37 original-source compilation **RED**, independent imported consumer SKIPPED, original RED ZIP preserved.
- Single native compiler failure: `.../RHOPFP9C3D2G1D37OriginalGammaComplexInnerProductCore.lean:54:0`: `Definition 'FCP.RHOPFP9C3D2G1D37.relationalSourceComplexFourInnerProductCore' of class type is semireducible. Most type class instances should be instance-reducible, so consider marking this definition with @[instance_reducible].`
- Five native `#print axioms` reports show only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`, no native field proof failure reported, but the warning-as-error prevents any D37 acceptance.

## Bounded recovery R2
Set the recommended `@[instance_reducible]` directly on the **existing noncomputable class-valued definition** `relationalSourceComplexFourInnerProductCore : InnerProductSpace.Core ℂ RelationalSourceComplexFour`. Leave source H fields, all theorem statements, consumer, Gamma9 source, `main`, original Q, no new norm/topology/typeclass instance. Update only the D37 original-source blob pin in the strict workflow. Re-run native/independent strict with ten clean axiom reports and verify original ZIP digest and tested SHA before acceptance.

Original D37 R1 remains negative knowledge. Do not silently promote source-declared definitions after a red. No bundled `InnerProductSpace ℂ`, norm, C² frame, Hopf quotient/Chern charge, physical Fock/Gauss/Hamiltonian or stable hopfion claim.
