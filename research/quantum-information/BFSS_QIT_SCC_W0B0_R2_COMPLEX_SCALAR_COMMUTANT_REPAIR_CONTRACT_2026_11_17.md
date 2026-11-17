# BFSS × QIT × SCC W0B0 R2 — real-to-complex scalar commutant repair contract

Date: 2026-11-17 Pacific. **PRE-GATE CONTRACT, UNQUALIFIED.** Same unified branch `integration/bfss-unified-research-20261108`, `main` untouched.

## Exact donor and original R1 source RED

Last qualified W0A3 R1 [#44051746176](https://github.com/etblink/math/actions/runs/44051746176), source Git blob `3a8d37dd0b065345b0a27529830dd0a1ee99a5b3`, original GREEN ZIP blob `845be0ed709f4fe44e288f116cc17eba4fcc5b9d`. Original W0A4 two-source-RED `activeGammaComplexLinear` construction remains STOPPED (runs #44055363556 and #44059417729, original provider RED ZIP blobs `ef3ad039799680fde9f0d1669f130ef275f9a2a3` and `c1d7f4436e22dd5698058ea3b5557d131823de9d`). Never reopen that construction.

W0B0 R1 [#44064728599](https://github.com/etblink/math/actions/runs/44064728599) **original cold source RED** at tested `e668c0a6a542a5f5712c0bcaf9c219e96b3649ed`. Frozen R1 original source blob `d3cbdd7446f06e203959776abee3629b8269f572`, independent consumer `159c561d6e73e3c86959cd239deb10984064e92e`, strict workflow `5eef739aaf906f90c603fecc84dda28e2391c594`. Source error line 41:8: `Commute.smul_right (v p)` demands unavailable `SMulCommClass ℝ Op Op`. Original ZIP 13,540 bytes, SHA-256 `d7ade4d6b28b8ea442d2a7130b5c9a20a40e1d4481d0a7ff5d54704234483010`, Git blob `7a74c38049c3cff6e0bdd1c6e7d2ea72c75deb07`, independently preserved by [#44108072439](https://github.com/etblink/math/actions/runs/44108072439). Original full job log Git blob `9b450ff0e633f7fb3c908805754c7d95fb992808`.

## Single bounded source repair

Original source, consumer, theorem statements, physical carrier `Fermion 2`, original `Source48Vector`, Clifford/Fock equivalence `Φ`, and W0A3 donor remain unchanged **except** one explicit scalar coercion in Root 1:

```lean
  apply Commute.sum_right
  intro p hp
  rw [RCLike.real_smul_eq_coe_smul (K := ℂ)
      (v p) (sourceNormalizedGamma p)]
  exact (h p).smul_right (v p : ℂ)
```

The pinned Mathlib `Mathlib/Analysis/RCLike/Basic.lean` has the theorem `RCLike.real_smul_eq_coe_smul`, applying to any module with `IsScalarTower ℝ ℂ Op`. Existing original source defines the operator ring over ℂ and real coordinate gamma actions. The proof intentionally uses a ℂ-coefficient for `Commute.smul_right`, rather than assuming `SMulCommClass ℝ Op Op`. This is an **unverified** Lean repair until strict CI; do not infer that the required ℂ typeclass is present without original compilation.

Root 2 remains `TensorProduct.inductionOn` over the **commutation predicate**, using qualified W0A3 source and `Commute.add_right`. No new ℂ-linear gamma-map definition, Clifford word expansion, Schur theorem, new axiom, larger resource limit or replacement operator space.

## Strict acceptance and stop

Exact source and consumer hashes, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, two source-root `#print axioms`, separately importing two-root independent consumer with two controls, one real finite-sum proof, one full complexified generator-predicate proof, six negative auditor mutations, byte-exact W0A3 GREEN ZIP and W0B0 R1 plus W0A4 R1/R2 original RED ZIPs and full logs, cold source, permitted `propext`/`Classical.choice`/`Quot.sound` only, full provider-original ZIP and original job log with SHA-256 and Git blobs.

**Second analogous native R2 source RED = STOP** this W0B0 scalar-commutant proof architecture. Preserve the full original R2 job and ZIP before switching to a separate generic lemma. CI harness failures are classified separately. W0B1 (full Clifford induction), W0B2 (original M3B/M3C A-linear adapter), W0C (trace/witness injectivity), gauge/fermion parity physical measurement and BFSS spectral physics remain unproved.
