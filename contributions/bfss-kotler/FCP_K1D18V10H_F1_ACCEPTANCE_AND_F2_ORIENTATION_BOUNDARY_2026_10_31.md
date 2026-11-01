# K1D18V10H F1 accepted — F2 source-exact orientation equivalence candidate

Date: 2026-10-31 PDT. Owner research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Accepted V10H-F1 — immutable strict evidence

- [Strict run #41258388286](https://github.com/etblink/math/actions/runs/41258388286), attempt 1, completed success, job `124706328548`, exact tested SHA `054bf3dda6f94255c8253ce60c33abd2addf92e8`.
- Exact source `SU2BFSSPairedSpin9V10HTypedDeterminantFixture.lean` Git blob `87b5e9ef8a241c6f16e488e4355d3aca12ff519a`; accepted pinned Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` plus V10G ancestry.
- Pinned source preflight, accepted V10G rebuild, fresh strict `-DwarningAsError=true` proof compilation, exact two independent declaration-type elaborations and axiom audit all PASS. `gammaDetSquareOne`, `pairedDetEqualGamma` each depend only on `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- [Artifact #13064137132](https://github.com/etblink/math/actions/runs/41258388286/artifacts/13064137132), SHA256 `04853c3bff06b97ae71c910816f4787603bceb48ec55d5b6d998ff23d7b341b9`, nonexpired on verification.
- Accepted exact math: `det rho16(g)^2=1` by source O16 orthogonality; and `det rho48(g)=det rho16(g)` by the genuinely qualified original G1A paired-label V10G determinant cube transport. The proofs import only accepted ancestors. They **do not** prove `det rho16(g)=1`.

## Retained two V10H reds / negative knowledge

- Gate 1 red [#41257058496](https://github.com/etblink/math/actions/runs/41257058496), job `124702348480`, artifact `13063922758`: incorrect unapplied `Matrix.mem_orthogonalGroup_iff.mp` and costly `change` normalization on composed determinant homomorphism.
- Gate 2 red [#41257744030](https://github.com/etblink/math/actions/runs/41257744030), job `124704418686`, artifact `13063553565`: recursion exhaustion at composed determinant character `rfl` and unspecialized iff projection; dependent results unqualified. Those failed sources remain in Git provenance and are NOT imported by F1 or F2.
- Lesson: derive small typed equalities directly from existing original matrix terms, not from default unfolding of high-level composed MonoidHom operations; retain errors rather than increasing recursion or heartbeat limits.

## V10H-F2 — candidate only

Exactly three typed source obligations:
1. `pairedDetSquareOne`: the genuine original paired48 determinant also has square 1.
2. `pairedSO_iff_gammaDetOne`: source image on original paired48 is SO iff gamma16 determinant is +1.
3. `pairedSO_iff_gammaSO`: exact equivalence of SO membership on the original source paired48 and original gamma16 representation.

The F2 proof uses the pinned `Matrix.mem_specialOrthogonalGroup_iff` already exercised successfully in accepted V10G and the exact F1 `pairedDetEqualGamma` bridge. Strict gate requires own pinned hash, fresh `warningAsError` build, 3 independent type-checks and 3 root axiom whitelist reports. It is **UNQUALIFIED until CI green**.

The mathematical goal `∀g : spinGroup source9Quadratic, det rho16(g)=+1` remains genuinely OPEN. A proof of mere `det^2=1` or conditional membership must NEVER be misrepresented as that result. Further source-group topology/continuity, Spin48 lifting or covering, BFSS Fock unitary, physical gauge and spectral statements also OPEN. No main, upstream, accepted theorem, pinned dependency or resource limit changes.
