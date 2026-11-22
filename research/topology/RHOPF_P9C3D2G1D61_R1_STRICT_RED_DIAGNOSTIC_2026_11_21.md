# RHOPF-P9C3D2G1D61 R1 — strict RED at source import contract, pre-Lean

**Pacific date:** 2026-11-21. **Disposition: R1 STRICT RED; D61 UNQUALIFIED.**

Original [run #44980266856](https://github.com/etblink/math/actions/runs/44980266856), job `137079029902`, attempt 1, exact tested commit `98d68b121927e510751569c7b9a6c0b15d6483b3`.

## Independently preserved RED artifact and scope
Original [artifact #14737805761](https://github.com/etblink/math/actions/runs/44980266856/artifacts/14737805761) independently downloaded. Exact original ZIP SHA256 `0266560840053adc430894d2d2e254af642914064ae06b7c97eb2cb4c228a006` independently recalculated and matching GitHub digest. `ZipFile.testzip() == None`; archive has precisely TWO members (`exact-tested-commit.txt`, `toolchain-sha256.txt`). Embedded commit equals `98d68b121927e510751569c7b9a6c0b15d6483b3`, and toolchain and manifest hashes recorded. Archive size 462 bytes. There are **no original native or independent proof logs**, because the gate stopped at the source-contract preflight BEFORE toolchain restoration, original integer fixture, or any Lean proof compilation.

## Exact root cause
The workflow's Python preflight raised `AssertionError` at the source imports assertion (inline script line 131). Its exact expected imports included:
```
'Mathlib.Tactic',
'Mathlib.Topology.Constructions',
'Mathlib.LinearAlgebra.Projectivization.Basic',
'OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D60OriginalStandardCircleOrbitQuotientHomeomorph'
```
The actual D61 source Git blob `2afbaa7d8341ff31b6d6bcac8a9931d3a8d25c47` had all of these EXCEPT `Mathlib.Topology.Constructions`. The extra expected import was inadvertently inherited while adapting the D60 workflow. The D61 goal is *algebraic* projective-point invariance and explicitly does not create a projective topology, so `Mathlib.Topology.Constructions` is not needed for its intended source contract. This is not a mathematical refutation, not a kernel or native Lean error, and not a missing Mathlib projectivization theorem result.

## R2 bounded preflight correction
Remove only the extraneous `'Mathlib.Topology.Constructions',` line from the exact expected-source-imports list in the strict D61 workflow, leaving its exact comparison against the three actual imports in place. All original/accepted SHA pins, original frozen Gamma9 sources, independent integer fixture checks, warnings-as-errors, native+independent consumer proof contract, no-`sorryAx`/axiom whitelist, independent original artifact archive, toolchain and CI build remain exactly as before. **D61 original source and D61 independent consumer are byte-identical across R1 and R2.** No changes to D45–D60, any prior successful math gate or `main`.

The R1 original RED artifact remains immutable as negative knowledge. Do not accept D61 until a separate R2 original-source build and imported consumer pass plus all four native and four imported exact axioms reports, and new ZIP SHA/CRC/embedded tested commit audit.

## Scientific boundary
D61 seeks only algebraic invariance of `Projectivization ℂ (EuclideanSpace ℂ (Fin 2))` under accepted standard Circle phases. The pinned Mathlib algebraic projectivization exists but its *newer projectivization topology module* is unavailable at the fixed Mathlib SHA. No CP¹ quotient equivalence, S² homeomorphism, Chern/Hopf class or physical BFSS Fock/Gauss/Hamiltonian hopfion claim follows from this attempt.
