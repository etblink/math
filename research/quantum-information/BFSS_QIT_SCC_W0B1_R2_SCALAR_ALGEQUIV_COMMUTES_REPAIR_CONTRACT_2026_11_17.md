# BFSS × QIT × SCC W0B1 R2 — source-exact scalar `AlgEquiv.commutes` repair contract

Date: 2026-11-17 Pacific. **FROZEN PRE-GATE CONTRACT, UNQUALIFIED**. Only unified branch `integration/bfss-unified-research-20261108`; never touch `main`.

## Qualified donor and original failed gate

- W0B0 R2 original strict [#44109519633](https://github.com/etblink/math/actions/runs/44109519633): GREEN QUALIFIED; source `c67f30bb76a9990e508a8a050a8c3313e694bda7`, independent consumer `159c561d6e73e3c86959cd239deb10984064e92e`, original provider ZIP Git-pinned `abbebbf9e7d2eeefeeef901a415030e09551c2d6`, full job log `d2b6066d6911de727f69a671218c1e87e7ed60d0`.
- W0B1 R1 [#44117272657](https://github.com/etblink/math/actions/runs/44117272657): original source RED, tested `c486662c149af872a88e97f485befe61fe1522f5`. Source `6c9cae683665fb6cda2a6e8ff10d388f6a268a05`, independent consumer `9ea114c7f8a8c26b814b3abe9fd5c6a1e853e53a`, workflow `6565dd372ccb5ba6f553242b3180de8de1ac7e21`.
- W0B1 R1 provider original 13,688-byte RED ZIP SHA-256 `3fd4c088723dae5cee7fdb68db391b482d26e1af5a241b1cb27541b11948b1b9`, exact Git blob `a448d2ae775926ee05ab4a9028e29e8061fecdac`. Full job log Git blob `7e8310126b2e5af543ec1f7274ce5467dbc59552`, evidence manifest Git blob `a78963305bb75e7ab154f8c40a0c8d5ab7299f29`. [Preservation #44126231073](https://github.com/etblink/math/actions/runs/44126231073) GREEN.
- W0A4 R1/R2 original source RED artifacts remain immutable and the `activeGammaComplexLinear` architecture stays permanently STOPPED. W0B0 R1 negative evidence remains pinned.

## Bounded mathematical atom

Retain **exactly** the W0B1 R1 source theorem declaration:

```lean
theorem originalComplexEquiv_allClifford_commutes
    (T : Fermion 2 →L[ℂ] Fermion 2)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (a : CliffordAlgebra (source48Quadratic.baseChange ℂ)) :
    Commute T (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a)
```

Its four `CliffordAlgebra.induction` cases are `algebraMap` (scalar), `ι` (qualified original W0B0), multiplication and addition. In R1, the `algebraMap` case used an undefined `map_algebraMap`; the type mismatch is the missing rewrite from `Φ (algebraMap ℂ Cl z)` to `algebraMap ℂ Op z`.

The **only authorized Lean proof change** for R2 is to substitute the pinned Mathlib theorem `AlgEquiv.commutes` into the original `simpa only` scalar case:

```lean
| algebraMap z =>
    simpa only [AlgEquiv.commutes] using
      (Algebra.commutes z T).symm
```

Pinned `Mathlib/Algebra/Algebra/Equiv.lean` at `d13f23b723b8a846827a245b89c10fc7d3f11612` defines `AlgEquiv.commutes`. This substitution is an untested implementation hypothesis until original cold Lean succeeds; **do not count it as proved** before source and independent consumer qualification.

## Acceptance conditions

One exact original source theorem, unchanged original independent consumer theorem with two independent controls, `#print axioms` for both roots, only `propext`, `Classical.choice`, `Quot.sound`, six auditor negative mutants, cold original source + consumer, original provider ZIP and full log rehashed and permanently pinned, independent roadmap consistency GREEN. Preserve Lean 4.34.1, pinned Mathlib revision, accepted source-equivalence and original 48 generators. Update source/workflow/checkpoint/guard together with exact Git hashes. Do not alter theorem statement, original Fock carrier, consumer, donor, semantics, toolchain, resource limits, or already stopped branches. R1 original source and source log, RED ZIP, exact checksum, manifest must remain unchanged and locally readable by the strict preflight/guard.

**Stop condition:** if R2 has an analogous *second* original-source failure, preserve original provider ZIP and job log, record RED/STOP, and reconsider the generic algebra adapter. Do not launch an unchanged retry or grant Lean resource increases.

**Claim ceiling:** W0B1 would establish commutation with the full original Clifford image, **not** scalar commutant W0B2, trace witness W0C, parity-sensitive operational completeness W0D, physical SU(2) gauge observables, original BFSS Lie K(A), or physical ground state/mass gap.
