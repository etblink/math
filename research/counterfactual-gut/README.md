# BFSS hopfion → particle physics → possible GUT: counterfactual research

**Status:** exploratory, explicitly **not a GUT claim, physical discovery, or Lean-qualified theorem**.  
**Created:** 2026-11-21. **Owner-authorized separate research branch** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Branch point:** `07d6a13c365ffcc581efcad25424025482c493ba` from `integration/bfss-unified-research-20261108` (fixed snapshot, not a live mirror).  
**Canonical scientific policy:** [Truth-first foundational research charter](../../research/methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md).

## Purpose and isolation

Use structural counterfactuals to discover what *would have to be true* if an original-BFSS physical hopfion contributed to chiral particles or a genuine unified gauge theory. Preserve both promising implications and decisive negative findings. This branch is a **research notebook and decision ledger**, not a second proof integration branch.

- Do not change `main`, the unified RHOPF branch, frozen original Gamma9/Fock source, accepted gate receipts, or canonical `BFSS_GATE_STATE.json`.
- No Lean modules, CI workflows, merges, PRs, or formal-gate promotions in this initial documentation-only intake. Later development requires an explicit narrow decision.
- No automatic source searches or dependency upgrades. Cite exact external sources or file/commit refs when available.
- Green Lean CI means a bounded theorem on exact source types under specified axioms, *not* that nature implements the model.
- A negative candidate result is preserved with the same fidelity as a positive one. Do not rewrite old entries to erase failed predictions; append dated dispositions.

## Counterfactual premise (not established)

**H0:** Assume the *original interacting BFSS theory* has a normalizable, dynamically persistent excitation with a nontrivial topology-protected Hopf invariant that survives **all admissible physical configurations and gauge operations**, rather than only a chosen finite-dimensional geometry or restricted ansatz. Assume a clear meaning for the relevant spatial topology and for the physical Hilbert/Gauss/domain conditions.

H0 is deliberately stronger than current RHOPF mathematics. Source-derived `S^1` actions, a (\mathbb C^2) model, a classical Hopf map, or finite-dimensional algebra **do not** establish H0. A topology on internal indices is not automatically a topological charge on emergent physical three-space.

**Counterfactual ladder (each arrow independently unproved):**

```text
H0 physical, stable original-BFSS hopfion
 -> H1 quantizable excitation with observable quantum numbers
 -> H2 coupled original Fock operator with protected states/zero modes
 -> H3 3+1-dimensional relativistic effective dynamics + chiral matter
 -> H4 consistent SM gauge reps, hypercharges, anomalies, EWSB, masses/mixings
 -> H5 candidate parent unification + breaking and new testable predictions
```

Failure of any arrow **does not** negate earlier established mathematics or automatically falsify H0. If H3/H4/H5 fail, hopfions might exist without being fundamental matter or a GUT.

## Five competing approaches (not a forced succession)

| Route | Mechanism to test | First discriminating obstruction |
| --- | --- | --- |
| A. Soliton as quantum excitation | Collective coordinates, spin/statistics, finite energy, normalizability | A topological soliton need not be a fermion or a Standard Model particle |
| B. Soliton-bound fermion modes | Original 48 Majoranas / 24-mode Fock operators in a topological background; spectral flow and index when defined | Hopf invariant is not a Dirac index; zero modes may be paired or unprotected |
| C. Emergent gauge connection | Hopf bundle connection, Berry holonomy, possibly higher Hopf structures | Fiber (U(1)) is not automatically electromagnetic gauge symmetry; (S^7) is not a Lie group |
| D. Emergent geometry / large-N limit | Relate finite SU(2) matrix excitation to an appropriate large-N, spacetime/local-QFT description | Finite matrix quantum mechanics is 0+1D; four-dimensional chirality does not follow |
| E. Representation-theoretic unification | Classify Spin(9), Spin(48), Spin(6) and Fock commutants; compare to SO(10)/Pati–Salam | Spatial Spin(6) ≠ internal SU(4) of Pati–Salam; BFSS gauge SU(2) ≠ SM weak SU(2) |

**Preferred order of research questions:** define admissible physical topology and quantum numbers; seek original-source fermion operators coupled to the texture; test for genuinely protected modes; demand a 3+1D chiral effective theory; only then compare unified gauge candidates. Other routes remain open as neutral controls. No favored answer.

## Nonnegotiable reality checks

Any candidate must eventually explain a *local* four-dimensional effective theory with observed Lorentz/causal structure; `SU(3)_C × SU(2)_L × U(1)_Y` and the correct chiral representations and hypercharges; three observed families without inferring them from color-index count; perturbative and global anomaly cancellation; electroweak symmetry breaking, Yukawa/mass/mixing structure (including neutrinos); and compatibility with precision tests, coupling evolution, proton-decay limits, and cosmology. An internally consistent GUT is a model, not proof nature uses it.

## Reuse boundaries and sources to inspect

- **Current original Hopf track:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/RHOPFP9C3D2G1D42OriginalGammaCircleComplexScalarBridge.lean` and `...G1D43OriginalGammaComplexFinrankTwo.lean` on the unified branch. D44/D45 qualifications are dynamic and **not inferred** from this branch snapshot.
- **Original gauge/Spin9 source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean`. This is label-level commutation, not a full 4D gauge or physical spectral theorem.
- **Fock/gauge source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2aOriginalFockGaugeSource.lean` and related original source adapters. Do not replace their carrier with a convenient model.
- **Pinned Mathlib:** `d13f23b723b8a846827a245b89c10fc7d3f11612`, especially `Mathlib/Analysis/InnerProductSpace/PiL2.lean`, `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`, `Mathlib/LinearAlgebra/Projectivization/Basic.lean`.
- **External Physlib (read-only):** [SM gauge groups](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/StandardModel/GaugeGroup/Basic.lean), [anomaly equations](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/StandardModel/AnomalyCancellation/Basic.lean), [unbounded operators](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/QuantumMechanics/Operators/Unbounded.lean). **Toolchain mismatch:** external Physlib Lean 4.36.0 vs pinned project Lean 4.34.1; no imports presumed compatible.
- **External GUT notes:** Physlib [Spin10](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/BeyondTheStandardModel/Spin10/Basic.lean) and [Pati–Salam](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/BeyondTheStandardModel/PatiSalam/Basic.lean) use `informal_definition` / `informal_lemma` for the embeddings. They **do not** constitute kernel-checked unification proofs.
- **Published reduction to cross-check:** [Bajaj–Lin, “Solving the SU(2) BFSS model”](https://arxiv.org/abs/2611.14512), a 2026 preprint, not a replacement for original-source proofs or empirical tests.

## Evaluation policy

Every ledger claim gets an **ID**, **premises**, **status**, **positive evidence**, **negative/alternative explanation**, **decisive falsification or gap**, and **next bounded test**. Use exact mathematical objects and typed maps where possible. Distinguish proofs from literature suggestions, external claims from source-qualified declarations, and 0+1D matrix quantum mechanics from 3+1D physics.

Use [COUNTERFACTUAL_LEDGER.md](./COUNTERFACTUAL_LEDGER.md) as the single entry point for updates. Add dated entries and keep prior negative results accessible. No present result is asserted to prove a GUT.

## First bounded test (2026-11-21)

[D0 / D1 original-source configuration topology and Fock index audit](./D0_D1_ORIGINAL_CONFIGURATION_TOPOLOGY_AND_FOCK_INDEX_AUDIT_2026_11_21.md) and the appended [ledger entries CF-016–CF-021](./COUNTERFACTUAL_LEDGER.md) document two narrow obstructions (ordinary bosonic orbit-space contractibility; zero full finite even/odd Fock Fredholm index), plus the **positive** original source supercharge/gauge/Fock operator interface. Both obstructions are carefully distinguished from a potential gauge-equivariant/gapped-sector topology or an index on the infinite-dimensional physical Hilbert space. **No new Lean or physical theorem is claimed.**
