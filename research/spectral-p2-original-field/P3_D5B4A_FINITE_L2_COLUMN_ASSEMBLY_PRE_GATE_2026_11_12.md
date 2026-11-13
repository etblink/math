# P3-D5B4A planned finite original-Fock L² assembly/surjectivity gate

**Date:** 2026-11-12 Pacific. **Milestone:** M1. **Last accepted:** D5B3 exact strict green #43325774438 (75 pins), accepted source blob `e17a6e5d174ba9362d9dc201b07d88bec723c18d` and independent consumer `ca560ddfe3b5494dcad5560f9c7fa715a5ab918a`.

## One new mathematical obligation

Given `v : PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)`, assemble `g(x) = WithLp.toLp 2 (fun i => (v i : X→Fermion 2) x)`. Prove `MemLp g 2 μ` via pinned `MemLp.of_eval_piLp` and `Lp.memLp`, then take `hg.toLp g` and use `MemLp.coeFn_toLp`. Accepted `originalFockL2ColumnProjection_apply_ae` and `Lp.ext` show every source projection recovers precisely `v i`. Finally apply accepted D5B3 `originalFockL2ColumnsIsometry_apply` to prove `Function.Surjective`.

**Generic-first:** the proof's assembly lemma is abstract over `E : Type*` and `NormedAddCommGroup E`; specialize to the full original physical Fock carrier only once after the generic equality is established. Preserve exact `Fermion 2` and `Boson 2` in the independent consumer. The actual accepted isometry, the original field and all 75 predecessor blobs remain unchanged.

**Strict qualification:** new source + independent consumer only, total 77 pinned blobs; Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, cold source, warning-as-error, independent literal `Boson 2`, all reported axioms subset of [propext, Classical.choice, Quot.sound]. CI green alone is accepted only at exact tested SHA.

**Exclusions:** no full `LinearIsometryEquiv` yet (B4B separate), no operator-valued HS/fiber norm equivalence (M2), no SU2 fixed-space (M3), source Spin9 full symmetry (M4), original Hamiltonian form/graph (M5), high-type coercivity (M6/M7), eigenpair/mass gap (M8).

**Parallel scientific experiment:** Registered E-M7-001-R1 independent finite coefficient-model replication #43335892084 green, status `SURVIVED_FINITE_TESTS` only. Its first red #43335288061 is preserved in experiment registry and no source field/coercivity theorem is inferred. The experiment is a distinct M7 prospect, not a premise of this B4A theorem.
