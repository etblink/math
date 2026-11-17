# BFSS × QIT × SCC W0A3 R1 — STRICT GREEN acceptance

Date: 2026-11-17 Pacific. **STRICT GREEN / QUALIFIED FOR W0A3 ONLY**, exact original 24-mode `Fermion 2`, original 48-real Source48Vector and original complex Clifford/Fock equivalence.

## Original strict run and proof

[Run #44051746176](https://github.com/etblink/math/actions/runs/44051746176) SUCCESS, job `133930997733`, tested commit `eb248117ccf9913c837c7ce3d113be1384a11377`.

Exact source Git blob `3a8d37dd0b065345b0a27529830dd0a1ee99a5b3`, independent consumer Git blob `18ebec2e1265b2efd5e78baa69e0fbe9675f8c32`, strict workflow Git blob `4ca801d2566c846b97b13e41f8965c277e285daf`. Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

- Cold original source build: **9,127 jobs PASS**; donor exact preflight PASS.
- Exactly one source theorem and independent importing consumer theorem PASS, with two consumer controls.
- Both actual `#print axioms`: **only `propext`, `Classical.choice`, `Quot.sound`**, no `sorryAx`.
- Six auditor negative mutations rejected.

Mathematical conclusion, for all `z : ℂ` and `v : Source48Vector`:

```lean
FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
 (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
   (z ⊗ₜ[ℝ] v)) =
 z • FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear v
```

## Original provider evidence

Provider artifact [#14314887042](https://github.com/etblink/math/actions/runs/44051746176/artifacts/14314887042), **13,857 bytes**, exact SHA-256 `a7cf6534bc40bdc1edd5ef99e7c7519f9d4cfec85339e2dd5d24ce076a3d578d`; ZIP integrity PASS, six exact members independently SHA-256 checked. Independent preservation [run #44054210444](https://github.com/etblink/math/actions/runs/44054210444) re-downloads, rehashes, audits source+consumer and commits *the provider-original ZIP bytes* under `research/quantum-information/diagnostics/BFSS_M4_W0A3_R1_44051746176_evidence.zip` to the unified integration branch.

Original full job log Git blob `9ed614bf6fdb5c35cfc61a744cde7729206b9878` preserved verbatim as `research/quantum-information/diagnostics/BFSS_W0A3_R1_44051746176_complete_job.log`. Exact member digests and provenance in `research/quantum-information/diagnostics/BFSS_W0A3_R1_44051746176_evidence_manifest.json`. The original ZIP's Git blob SHA must be verified in the canonical acceptance guard after preservation completes; never claim qualification without this.

## Predecessors and strict claim ceiling

W0A2 [#44048184200](https://github.com/etblink/math/actions/runs/44048184200) remains an accepted ancestor; W0A1 and W0A0 GREEN, original W0A0 R1 RED and CT1/QTC1 stopped native join attempts remain preserved.

**No general arbitrary complexified-vector equality is established yet.** That is separate W0A4 using genuine tensor-product induction. Neither full Clifford generation, exact scalar commutant, trace scalar elimination, complete W0 signature injectivity, original BFSS `K(A)` Lie bracket, physical Spin(9)/gauge state nor BFSS Hamiltonian ground-state is implied.

No accepted donor, original theorem or consumer was modified in the preservation operation; `main` untouched.
