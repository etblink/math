# P3-D5B4A strict GREEN — source-original finite-column L2 surjectivity acceptance
**Adjudication date:** 2026-11-12 Pacific (CI 2026-11-13 UTC)
**Status:** ACCEPTED; M1 remains open; next B4B NOT YET TESTED
**Repository/branch:** etblink/math / `integration/bfss-unified-research-20261108`

## Exact evidence
- Exact strict run: https://github.com/etblink/math/actions/runs/43336725804 — completed SUCCESS, attempt 1, head `9ac8e7dd389b12c0dc1db596f176493a0c2628e4`.
- Job `131594648555` `source-and-independent-consumer`: all steps GREEN. Strict preflight verified original accepted 75 source pins and 2 B4A candidate blobs = 77 exact pins, pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
- Exact cold build: **9,182** jobs successful. Independently compiled actual original Boson 2 / Fermion 2 consumer; source and consumer axiom audit passed, no `sorryAx`.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B4AOriginalFockL2ColumnSurjectivity.lean`, Git blob `c49f9217aa6092d80a1652d0b8ea04cd011535d9`.
- Independent consumer: `lean/diagnostics/BFSSP3D5B4AOriginalFockL2ColumnSurjectivityIndependentConsumer.lean`, blob `2a0c0b6143759785acde3a36e568e0fbf317da7b`.
- Workflow: `.github/workflows/bfss-p3-d5b4a-original-fock-l2-column-surjectivity-strict.yml`, blob `0bb1b2e785e02d5476476109e43c1eb10d369731`.
- Evidence artifact ID **13998782921**, digest `sha256:61a860fbb01dc6f5f2f25862185bf4b84fdd212798dd7e35b8e97a3bf2b17c08`.
- The run was on `9ac8e7dd389b12c0dc1db596f176493a0c2628e4`; afterward a checkpoint-only commit `8e96af9b4611bf8d1f282778637be6f58486d405` recorded the run ID without changing accepted proof source. Proof authority stays with exact tested SHA.

## Exactly accepted declarations
1. `FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity.originalFockL2ColumnProjections_jointly_surjective`: every finite family of original-Fermion-2 L2 columns is the family of accepted D5B0 projections of an actual L2 PiLp2-valued field.
2. `FCP.BFSSP3D5B4AOriginalFockL2ColumnSurjectivity.originalFockL2ColumnsIsometry_surjective`: accepted D5B3 complex-linear isometry is onto its finite PiLp2 column target.

Both `#print axioms` outputs and the independent audit list only `propext`, `Classical.choice`, `Quot.sound`. Source uses abstract-first `generic_finite_piLp_L2_assembly`, `WithLp.toLp`, `MemLp.of_eval_piLp`, `Lp.ext`, D5B0 projected-a.e. theorem, and D5B3 application identity. No large Fock unfolding, no extra axioms. The source deliberately does NOT define `LinearIsometryEquiv` yet.

## M1 next gate — P3-D5B4B
- **Hypothesis/goal:** from exact B3 `originalFockL2ColumnsIsometry μ` and exact B4A `originalFockL2ColumnsIsometry_surjective μ`, construct a genuine `LinearIsometryEquiv` over `ℂ` on the same original `Fermion 2` finite-coordinate L2 fields.
- **Likely Mathlib adapter:** use pinned `LinearIsometryEquiv.ofSurjective` at abstract Hilbert-space carriers first (avoid elaborating huge Fock aliases), then specialize to `Fermion 2`. Check pinned signature before construction; do not assume a modern unpinned Mathlib API.
- **Consumers:** exact forward application to accepted original columns; inverse/left-right identities; original `Boson 2` specialization; separate axioms, independent consumer.
- **Expected strict gate:** preserve 77 source/consumer pins and add new B4B source+consumer to 79, exact tested commit, pinned toolchain, cold build, axiom check and archived green/red artifact.
- **Fail controls:** no operator-norm/HS norm equality, no operator-field gauge fixedness, no SU(2)/Spin(9) source covariance, no `H_phys` graph/domain identification, no spectrum/eigenpair.
- **Sequence:** this accepted B4A checkpoint must be committed BEFORE any B4B source-gate commit. After a B4B green, update the canonical gate and crosswalk before moving into M2.

## Research boundaries
The external Bajaj–Lin positive-energy/superspin and historical gamma `36+84` computations are documented in a separate exploratory memorandum, not imported into this acceptance. The monograph Edition 0.7 and its 38-item atlas remain pinned, unmerged and historically scoped. No change to `main`, no new branch, no branch deletion.

## Control outcome
The previous watchdog hard-coded next M1 gate B4A; this acceptance replaces that fragile constant with the explicit accepted-gate sequence `B3 → B4A → B4B` and requires any active GREEN checkpoint to agree exactly with its accepted run. This is a governance rule change, not another mathematical theorem.
