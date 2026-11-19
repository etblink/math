# RHOPF-P9C3D0 R3 — independent consumer unmatched unnamed section; R4 bounded recovery

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**R3 original strict run:** [#44618214974](https://github.com/etblink/math/actions/runs/44618214974), attempt 1, FAILURE.
**Exact tested commit:** `f493558d4b2af6281b046783f0ea3812abd07432`.
**Original CI job:** `135892506860`.
**Archived diagnostics:** [artifact #14575982935](https://github.com/etblink/math/actions/runs/44618214974/artifacts/14575982935), independently downloaded original ZIP SHA-256 `67418fc2f7703eed6849016a30aa0d2a6356bb066bfd07dde2df85a97cfaef76`, matching GitHub digest, embedded `exact-tested-commit.txt` matching original commit. Archive includes original independent integer source fixture, toolchain SHA manifests, original dependency build, native and independent consumer Lean/axiom logs.

## Qualification evidence and diagnosis

- Source-exact hash/shape preflight, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original Gamma9 fixture, and accepted dependency build: PASS.
- Native Gamma9 `Circle →* GammaMatrix` source warning-as-error compilation: PASS. All source-original declarations `relationalCircleMatrix_one`, `relationalCircleMatrix_mul`, `relationalCircleMatrix_orthogonal`, `relationalCircleRepresentation` report only `propext`, `Classical.choice`, `Quot.sound`. No source `sorryAx`.
- Independent consumer R2 `dependsOnNoncomputable` error was resolved by the R3 `noncomputable section` insertion. R3 imported consumer now typechecks all independent examples and prints four allowed-only source axioms, with zero `sorryAx`.
- The sole native consumer compilation error is **line 32:0**:
  `Unexpected name 'FCP.RHOPFP9C3D0Independent' after 'end': The current section is unnamed`.
  The newly inserted unnamed `noncomputable section` was not explicitly terminated; its following `end FCP.RHOPFP9C3D0Independent` tried to close the namespace while still inside the unnamed section. This is a lexical section-closure error in the independent consumer, not a failed theorem. The workflow remains RED because independent consumer compilation is mandatory. No strict qualification has been promoted.

## R4 one-line bounded repair

Insert precisely one unnamed `end` directly before `end FCP.RHOPFP9C3D0Independent` in the consumer, closing the `noncomputable section` before the namespace. Update only the independent consumer's frozen exact hash in the strict workflow. The source-native Circle representation file and its public theorem statements/definitional contract, original Gamma9/Core/Fock/Hamiltonian, Mathlib/Lean pins, previous exact hashes, original source independent gamma fixture, compiler warnings-as-errors, native+consumer axiom check policy, and CI resource limits remain unchanged.

Upon R4 original strict GREEN, require independent verification of full exact source/native and independent compiler logs, all eight allowed-only `#print axioms` outputs with no `sorryAx`, original ZIP SHA-256 and embedded tested commit before acceptance.

## Preserved negative knowledge

- R1 [#44614805120](https://github.com/etblink/math/actions/runs/44614805120): Python preflight mistakenly required bundled `noncomputable def` to be a `theorem`, stopping before Lean.
- R2 [#44615621684](https://github.com/etblink/math/actions/runs/44615621684): native source GREEN; consumer plain example depended on noncomputable bundled hom.
- R3 [#44618214974](https://github.com/etblink/math/actions/runs/44618214974): native source GREEN; consumer noncomputable declaration fixed but unnamed section not closed.

The R1/R2/R3 REDs are distinct independent audit/test-interface failures, not counterexamples to the mathematical source. This repeated sequence calls for stronger local consumer syntax prechecks before launching high-cost cold CI, while preserving the stop against source mathematical changes and all separate Hopf/Fock/physical obligations. A strict CI GREEN is still required.
