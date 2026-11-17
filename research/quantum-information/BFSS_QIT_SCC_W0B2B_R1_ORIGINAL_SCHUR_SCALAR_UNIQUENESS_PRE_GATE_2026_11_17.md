# BFSS × QIT × SCC — W0B2B R1 original Schur scalar uniqueness pre-gate contract

Date: 2026-11-17 Pacific. **FROZEN PRE-GATE CONTRACT — no W0B2B proof is qualified by this memorandum alone.** Stay on `integration/bfss-unified-research-20261108`; `main` untouched.

## Immutable accepted predecessor

W0B2A R1 original-source strict [#44174996514](https://github.com/etblink/math/actions/runs/44174996514) **GREEN** at exact tested SHA `c0ae4222093f5f922a25569098d420b63fb9e66e`; native 9,133 jobs, 3 source roots, 3 independent consumer roots, 3 controls, 6 negative auditor mutations; accepted axioms only `propext`, `Classical.choice`, `Quot.sound`. Source blob `58d852a27e84288c0b1f33d784940155e2f26d54`; consumer blob `85784957405d4740f7dddc9e04dc72ed4c9d3b7a`; strict workflow blob `903636c37e0794846146aadd3b175a09553d34e0`. Provider ZIP artifact #14370212842, original ZIP size 14,216, SHA-256 `36f960ad45b38c879929752d90745ee57cd6efe5473b835540e7a7d848e65dd7`, Git blob `e4d1fa8d7a87d5ce4fcfc5483c2308648762a62b`; complete original Actions job log 235,792 bytes, Git blob `bbe132b02b529ee8f43059f649574922404b6e80`; original integrity manifest Git blob `65051d4aac0862e7d1d4879dfa1b57e30ba3a55d`. Independent preservation [#44178068165](https://github.com/etblink/math/actions/runs/44178068165) GREEN; canonical acceptance commit `40fcdb0d033adde203c01149743626844b0d04b9`; independent roadmap [#44178728559](https://github.com/etblink/math/actions/runs/44178728559) GREEN.

Earlier original W0H1B R2 strict [#44164974919](https://github.com/etblink/math/actions/runs/44164974919) accepted, source blob `9139fba785aa31a1e1cde83419f9848ea67fc016` and original ZIP Git blob `7e49358ea47500a2b2e8ab0407e7db44c7871cb5`. Preserve W0H1B R1 source RED #44160611850 and permanently stopped original W0B1 R1/R2 source REDs #44117272657 and #44127193329, their provider-original ZIPs, complete logs, and manifests without rewriting historical file identity.

Exact donors remain unchanged:
- `SU2BFSSPhysicalDomainS1V52M3BOriginalComplexCliffordSimpleModuleProbe.lean` Git blob `e7de3612d83889d8e08318307b37b15ac6567202`: original `Module A (Fermion 2)` and scalar tower.
- `SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean` blob `6fefd9ae344df0b7247feb34c9bec5ea0a27aea0`: `originalComplexCliffordFock_scalarCommutant : Function.Bijective (algebraMap ℂ (Module.End A V))`, *the* Schur donor, not an admitted axiom.
- `SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean` blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`.
- W0B2A original `originalFockClifford_moduleEnd` and `originalFockClifford_moduleEnd_apply`, exact qualified source above.

## Bounded mathematical target — three source roots

With `A := CliffordAlgebra (source48Quadratic.baseChange ℂ)`, `V := Fermion 2`, `Op := V →L[ℂ] V`, and original `h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)`, establish:

1. **Scalar in original Module.End:** `∃! z : ℂ, (algebraMap ℂ (Module.End A V)) z = originalFockClifford_moduleEnd T h` via precisely M3C `Function.Bijective` (surjectivity for existence, injectivity for uniqueness).
2. **Original Fock pointwise scalar uniqueness:** `∃! z : ℂ, ∀ v : V, T v = z • v`, using `Module.algebraMap_end_apply ℂ A V z v` and the qualified W0B2A pointwise identification. Prove uniqueness back through algebraMap injectivity, NOT by assuming a nonzero vacuum or alternative Fock basis.
3. **Original continuous-linear scalar uniqueness:** `∃! z : ℂ, T = z • (1 : Op)`, via `ContinuousLinearMap.ext` and the previously established pointwise result. If exact source type mismatch makes this independently expensive, preserve native RED diagnostics and consider splitting a later W0B2C rather than weakening the scope or axiom policy.

**No other claims**: in particular no W0C trace witness, no trace of the identity, no QTC bivector bracket, parity/gauge physical observability, Spin(9) spectral conclusion, Hamiltonian ground-state existence, mass gap or SCC measurement theorem. The scalar commutant is conditional on commutation with **all 48 original Majorana generators**, not a statement about physically allowed observable gates.

## CI and evidence contract

New original source `P3M4W0B2BOriginalSchurScalarCommutant.lean`, separately importing original consumer `BFSSP3M4W0B2BOriginalSchurScalarIndependentConsumer.lean`, strictly pinned workflow, native Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Preserve exact source/consumer/donor and historical RED bytes via Git blob pin table; test three exact source `#print axioms` roots, three exact consumer roots, three original operator controls and six deliberately malformed axiom-log mutations. Fail closed on any `sorryAx`, unexpected axiom, missing/duplicate report, unexpected warning, diagnostic error, or changed original proof scope. Run cold source `lake build`, separately compile source and consumer with `-DautoImplicit=false -DwarningAsError=true`, capture provider original six-member ZIP (including tested SHA, preflight, cold-source, source-axioms, consumer and auditor logs). Do not infer qualification from a successful build alone: independent GitHub provider artifact SHA-256, ZIP CRC/member digest, full job log verification and Git preservation must precede canonical promotion and independent roadmap guard.

**Stop:** after two analogous original native source REDs, preserve exact original evidence and redesign the type bridge; do not run an R3 on cosmetic resource changes. Keep operational/harness REDs separate from native mathematical REDs.

W0B2B becomes qualified only after all the above gates. W0C trace and QTC follow-up remain `PROSPECTIVE_NOT_STAGED`.