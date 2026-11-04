# F10DC candidate — actual derivative-range Lie packaging

**Status:** CANDIDATE / NOT YET QUALIFIED  
**Date:** 2026-11-04  
**Repository:** `etblink/math`  
**Write target:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`

## Question

Can the already established actual identity-chart derivative range be given its canonical ambient Clifford-commutator `LieSubalgebra` structure, and can the existing native real-linear equivalence be packaged as a genuine `LieEquiv` without changing its values or inverse?

This is deliberately a packaging step. It should consume the exact F10DB closure and bracket-preservation interfaces rather than reproduce the bracket calculation.

## Exact parent checkpoint

F10DB's strict workflow [#41913435697](https://github.com/etblink/math/actions/runs/41913435697) completed successfully on tested commit `abedd367f58f34054ba9bb9a4e2507a4eb1ba576`. The current branch head at candidate preparation is `0d9b530d0703886eeded0017b81a0767934d2bbe`, whose parent is that tested commit; the current head adds the F10DB acceptance record.

Exact F10DB source and independent-audit blobs:

- `SU2BFSSPairedSpin9V10HF10DBDerivativeRangeCommutatorClosure.lean`: `12c3397a06a6e9ef634c69bae075c20564bb1e4c`
- `FCP_K1D18V10HF10DBIndependentAudit.lean`: `19e04f3e39986081154adccfb35e3f9d1db62407`

The accepted environment remains Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Candidate construction

1. Define `source9IdentityChartDerivativeLieSubalgebra` on the exact existing `source9IdentityChartDerivativeRange` submodule. Its only bracket-closure premise is discharged by F10DB's `source9IdentityChartDerivativeRange_commutator_mem`.
2. Define `source9NativeSkewDerivativeRangeLieEquiv` from the existing `source9NativeSkewDerivativeRangeEquiv`. Its bracket law is discharged by F10DB's `source9NativeSkewDerivativeRangeEquiv_commutator`.
3. Keep the subtype conversions explicit in the forward and inverse functions. Do not alter the original range values, native source space, source label ordering, or half-bivector normalization.

## Candidate files and immutable blobs

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DCDerivativeRangeLiePackaging.lean`
  - blob `0231391e37f7c72ae1dfcd3e4ee6670869a1d800`
- Independent audit: `lean/diagnostics/FCP_K1D18V10HF10DCIndependentAudit.lean`
  - blob `cd72a540378e7b7e29a6637f1bd43fa0267f40a9`
- Strict workflow: `.github/workflows/bfss-kotler-v10h-f10dc-derivative-range-lie-packaging-strict.yml`
  - blob `85261d28331ea0c98f3bc0fd554447cb17e82863`

The strict workflow pins the full F10DB accepted source ancestry, F10DB source and audit blobs, exact candidate blobs, and Lean/Mathlib revisions. The tested F10DB commit is recorded above; the workflow deliberately keeps checkout shallow and relies on the exact immutable source pins. It rebuilds the DA ancestry, freshly compiles the exact F10DB parent, compiles F10DC with warnings treated as errors, then runs an independent consumer audit. A separate direct source-interface diagnostic is being added before another full strict-gate attempt.

## Acceptance requirements

- Fresh source compilation and nonempty native object.
- Exact two declaration names and complete independent type/axiom audit.
- Only `propext`, `Classical.choice`, and `Quot.sound` permitted in reported axiom dependencies.
- No `sorryAx`, authored proof holes, unauthorized axioms, source diagnostics, or relaxed resource/linter settings.
- Independent checks of the unchanged underlying submodule, ambient/subtype bracket, native linear values, inverse, and LieHom law.
- Preserve exact candidate source, audit, workflow, logs, and terminal outcome.

No F10DC declaration is counted as a new accepted root unless the exact strict workflow and independent audit complete successfully.

## Boundaries

Even if the gate passes, this is only a Lie-algebra packaging result. It does **not** establish:

- closure under ordinary Clifford multiplication or an associative/unital subalgebra;
- identification with the source manifold tangent space;
- translated chart compatibility or a source manifold/Lie-group structure;
- global Spin(9) integration, covering, target surjectivity, or a group-level lift;
- any additional BFSS physical, gauge-domain, or spectral conclusion.

A red compiler or audit result must be classified at its earliest causal diagnostic. A type/subtype mismatch is an interface failure to investigate, not a mathematical counterexample. A missing closure proof or failed exact bracket equality would be a different and materially stronger result.


## First preflight attempt — 2026-11-04

[Run #41921763563](https://github.com/etblink/math/actions/runs/41921763563) failed before Lean setup. All listed historical source/audit blob checks and the exact F10DC source/audit blob checks completed successfully. The additional `git merge-base --is-ancestor` assertion then failed with `fatal: Not a valid commit name`: the checkout action's default shallow history did not include the historical F10DB tested commit object.

Classification: **workflow/infrastructure wrapper failure**. No Lean source compilation, candidate declaration, or independent audit ran. This supplies no evidence for or against the F10DC mathematical interfaces. The assertion is removed rather than expanding checkout depth; the exact accepted-parent source and audit hashes remain pinned. No F10DC roots are accepted from this run.




## Second preflight attempt — 2026-11-04

[Run #41922137755](https://github.com/etblink/math/actions/runs/41922137755) also failed before Lean setup. All exact parent/candidate source and audit blob checks passed. The Python preflight then raised `AssertionError: source9IdentityChartDerivativeLieSubalgebra` because it searched for a fully qualified `#print axioms FCP.BFSSPairedSpin9Clifford.<name>` string in the audit source. The audit correctly writes the unqualified declaration name inside its namespace; Lean resolves it there.

Classification: **workflow-validator assertion failure**. No Lean environment restore, source compilation, or independent audit ran. No F10DC roots are accepted from this run. The offline correction is to check the in-namespace spelling `#print axioms <name>`, while the Lean output is still expected to report the fully qualified declaration.

## Stop-rule action and direct diagnostic

Two consecutive F10DC attempts have now failed before testing any Lean obligation, for two independent wrapper defects. In accordance with the FCP stop rule, no third full strict-gate retry will be launched yet.

A separate, non-acceptance source-interface diagnostic has been added:

- `.github/workflows/bfss-kotler-v10h-f10dc-source-interface-diagnostic.yml`
- Blob: `7990f156ac102258caec09c0cac812103921aea7`

It pins the F10DB parent and candidate source, restores the pinned Lean/Mathlib environment, builds the exact F10DB import closure, and compiles only the F10DC source with warnings treated as errors. It does not run the independent audit and cannot qualify or accept F10DC. Its purpose is to expose actual Lean type/interface errors before the strict wrapper is repaired and retried.


## Source diagnostic RED and bounded strict-gate repair — 2026-11-04

[Direct diagnostic run #41922732725](https://github.com/etblink/math/actions/runs/41922732725), attempt 1, completed/failure at `6a0e798a63399d4ee14313b01658015119945623`, tree `2fac149f22451f05426930ce9dbc237d95ee9643`. Job `126899107511` passed exact pins, pinned Lean/Mathlib restore and the accepted DB import-closure build, then failed fresh source compilation under warnings-as-errors. The only source diagnostics were unused-tactic linter errors at lines 67 and 77: the two subtype-bridge `change ... in source9IdentityChartDerivativeRange` commands did nothing. Both reported candidate roots used only propext, Classical.choice and Quot.sound, but the compile failed and no independent audit ran. The diagnostic accepts no DC root.

Artifact [13367699828](https://github.com/etblink/math/actions/runs/41922732725/artifacts/13367699828) is 820 bytes; GitHub reports ZIP SHA256 `469ff68ca88a1d625abb2e47e7928170e6ff5fe3ab7eea8d1ef261a11172a73d`. The earlier wrapper artifacts remain [13366109934](https://github.com/etblink/math/actions/runs/41921763563/artifacts/13366109934), 183 bytes, reported digest `9d3ce2d4666eb9b92cb1aaa562b8b7b1dde7ef4b2238f330e23d77451df49633`, and [13367272327](https://github.com/etblink/math/actions/runs/41922137755/artifacts/13367272327), 183 bytes, reported digest `6bb65674f1a1221dd22c44e515c6d740fe7056354a44c5d2aaf2dbf30a1cb0b0`. These are provider-reported metadata, not independently hashed binary downloads.

The diagnostic has now exposed the actual source failure, completing the purpose of the wrapper-failure stop-rule investigation. The next full strict run uses a targeted repair with locally executed wrapper checks; it is not an unchanged retry.

The repair deletes exactly the two source no-op tactics, leaving the same explicit subtype values and membership proofs. In the independent audit it removes the corresponding redundant inverse-bridge tactic and an unnecessary subtype-bracket change, marks the section explicitly noncomputable for its value aliases, and adds inverse bracket preservation `LieEquiv.map_lie e.symm x y`. Every existing audit proposition/control remains, and both public source declaration types and value functions are unchanged.

The strict preflight now checks the unqualified in-namespace audit print spelling, while the compiler-output validator still requires the exact fully qualified root names. Its two candidate pins advance atomically. The direct diagnostic changes only its source pin. No warning/linter policy, proof/time limit, accepted parent pin or mathematical premise is relaxed.

Repaired immutable blobs:
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DCDerivativeRangeLiePackaging.lean` — `ddf714a495217826446f059144169fd53761d77e`.
- `lean/diagnostics/FCP_K1D18V10HF10DCIndependentAudit.lean` — `96e36c17b56fe17d3b6fb5d6e49f23cf64bfcd3a`.
- `.github/workflows/bfss-kotler-v10h-f10dc-derivative-range-lie-packaging-strict.yml` — `60f1b6fd21c23117e2b4e83c4c8301f28793a32e`.
- `.github/workflows/bfss-kotler-v10h-f10dc-source-interface-diagnostic.yml` — `43b99d10a57e51ed1d3602887acd4c4470dc6e7e`.

Local validation passed YAML, all run-block bash syntax, every embedded Python parse and actual execution of the strict source-scope preflight. All 102 accepted DB pin lines remain verbatim, with 104 total strict pins. Ninety-six local blobs and eight authoritative remote blobs matched. Exactly two public definitions and two print roots per candidate file remain. Strict timeouts are unchanged at 1500/3150/840/840/600 seconds; diagnostic timeouts remain 1500/3150/840 seconds. No local Lean elaboration is claimed.

The repaired full gate must freshly check DB's nine accepted roots, both candidate roots in source and audit (four candidate reports), the permitted axioms, all original value/bracket/inverse controls and the added inverse bracket control, with no diagnostics or sorryAx. Only its terminal `V10H_F10DC_LIE_SUBALGEBRA_LIE_EQUIV_TYPES_AXIOMS_PASS` and complete exact-head success can qualify DC. A green direct diagnostic alone cannot.

The canonical current-state handoff is updated in the same repair commit, preserving its historical body and recording this DC work plus all three failed runs. F10DB remains accepted pending full strict DC qualification.
