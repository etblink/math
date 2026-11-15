# IBI-G0C — source-exact SU(2)→SO(3) surjectivity donor audit and next decision gate

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Status:** FORWARD RESEARCH / READ-ONLY DONOR AUDIT; **G0C remains OPEN and NOT Lean-qualified**.
**Last strictly accepted gate:** native G0B1 determinant-one
[run #43733883094](https://github.com/etblink/math/actions/runs/43733883094)
at exact tested `a899735669e71609a2f418075826b5c1db629b2a`.
Acceptance record: `IBI_G0B1_NATIVE_DET_ONE_R3_GREEN_43733883094_ACCEPTANCE_2026_11_15.md`.

## Exact mathematical gap

The accepted literal BFSS source `GaugeGroup 2` is definitionally
`Matrix.specialUnitaryGroup (Fin 2) ℂ`, and the exact original
`FCP.BFSSSU2GaugeG3A.adjointColorMatrix g` is a real 3×3
output-row/input-column matrix. Accepted original G3A orthogonality and
G0B1 det-one imply its image lies in
`Matrix.specialOrthogonalGroup (Fin 3) ℝ`.

**G0C target:**
```lean
∀ Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ,
  ∃ g : GaugeGroup 2,
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q.1
```
This is a strictly stronger existential claim than determinant one.
The kernel `{±1}`/double covering, global orbit reconstruction, and
physical/Fock equivariance are further distinct theorems and are NOT
imported with this statement.

## High-value external formalization located, but NOT an admitted donor

The public `LionSR/QICLean` source at exact main branch commit
`603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac` contains:

- [`QICLean/Algebra/SpinCover/Basic.lean`](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/Basic.lean)
  (blob `b134940b9587e1f7063db0d1146a01a93b36e356`):
  `SpinCover.pauli` explicitly uses exactly the original source's
  ordered `σₓ, σᵧ, σ_z` matrices; `pauliConjAd` computes the
  Pauli conjugation trace `tr(σ_B U σ_A U⁻¹)/2`;
  `spinHalfCoverSO3` maps genuine matrix SU(2) to SO(3).
- [`QICLean/Algebra/SpinCover/EulerAngles.lean`](https://github.com/LionSR/QICLean/blob/603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac/QICLean/Algebra/SpinCover/EulerAngles.lean)
  (blob `53df9ef6848c1df8f3e6ddaf06417b0129e2ccab`):
  source lines 326–343 give `SpinCover.spinHalfCover_surjective_onto_SO3`
  with an explicit Z-X-Z SU(2) witness using `so3_euler_decomp`;
  lines 348–359 prove
  `SpinCover.spinHalfCoverSO3_surjective :
  Function.Surjective spinHalfCoverSO3`.
  These are *source texts*, not a reproduced qualified result inside
  `etblink/math`.

**Critical incompatibility:** this public QICLean snapshot pins
Lean **4.36.0-rc1** and Mathlib **v4.36.0-rc1**, whereas our
exact accepted BFSS source toolchain is Lean **4.34.1**,
Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`.
It also brings its own package/dependency closure.
Do not import it wholesale, change our pins, quote its theorem as
if it were available in our Mathlib, or treat its public implementation
as a qualified BFSS donor without separate version/provenance,
licensing and independent-consumer audits.

## Exact SOURCE↔Pauli bridge is the economical first gate

Our existing source:
- `pairedAlgebraData.color A` is already identified with the
  source `FCP.BFSSSU2.normalizedPauli A` by accepted G1A
  `pairedAlgebraData_color`.
- `normalizedPauli A = pauliScale • pauli A`, where
  `pauliScale^2 = 1/2`, proved by source `SU2ColorCrossProbe`.
- `G3A.adjointColorMatrix g B A =
  pairedAlgebraData.adjointCoefficient g A B`; by actual
  `AlgebraData.adjointCoefficient`, this is the real trace
  pairing of original normalized Pauli output-color B and the
  original SU(2)-conjugated normalized Pauli input-color A.

Hence a **candidate** source-exact 3×3 coefficient identity is:
```text
(G3A.adjointColorMatrix g) B A =
    (Matrix.trace (pauli B * (g * pauli A * gᴴ))).re / 2
```
where `pauli` must be the SOURCE `FCP.BFSSSU2.pauli`,
`g : GaugeGroup 2`, B=output and A=input, with no index transpose.
The algebraic reason is that both Pauli factors contribute one
`pauliScale` and `pauliScale^2=1/2`.
This formula is a **prospective theorem**, not yet an accepted exact
identity. Its proof should use pinned source facts and separate
normalization/conjugate-transpose correspondence, not an assumed
QICLean package import.

**Recommended next bounded CI gate, G0C-PAULI-TRACE:** establish that
coefficient identity for arbitrary source g,A,B, then package the
matrix-level equality. Use one separate independent consumer with
(a) arbitrary symbolic source g,A,B, (b) exact source identity g=1,
(c) nontrivial source orientation controls. Freeze source G0B1/G3A/
G1A/SU2ColorCross donors and standard-only `#print axioms`.
Do NOT attempt to prove surjectivity merely by creating a Pauli matrix
formula: it establishes representation identification, not image.

## Alternative native route and explicit stop rule

Our preexisting
`S1V52C1` original quaternion coordinates,
`S1V52C2C` original whole matrix reconstruction,
`S1V52L9C3` exact quaternion adjoint matrix, and
`S1V52L7C7` native ZYZ witness are potential donor code.
Their source headers label important parts **STAGED/UNQUALIFIED**;
an existing theorem statement is NOT a strict-green qualification.
L7C7 also factorizes **SU(2) inputs**, not necessarily arbitrary
**SO(3) targets**; the latter is precisely the G0C quantifier gap.
Auditing exact green receipts and dependency closures is required
before reusing any staged result.

Compare three prospective ways after the source-exact Pauli coefficient
bridge: (1) port/adapt the narrow external Euler rotation decomposition
to our frozen Mathlib version under independent strict CI with provenance
and licensing, (2) construct internal original-native rotation generators
and prove an SO(3) Euler-factorization theorem, or (3) a source-adapted
unit-quaternion inverse map. Choose by **smallest independently qualified
dependency DAG**, not by the number of existing staged source files.
A verified external donor may reduce proof search but cannot replace
a source-exact identity.

## Promotion and scientific boundary

No G0C green, no universal original-source SO(3) witness, no proven
two-point kernel or original bosonic orbit separation follows from G0B1.
Do not merge incidence branch to unified integration; G2/G3/Fock/source
charge domain and spectral ground-state fidelity remain open. Stop after
two analogous consumer/source failures at any new microgate; preserve
positive and negative data, exact commits and logs.

This donor audit is documentation only. It touches no Lean declarations,
strict workflows, accepted source pins, unified integration, main,
frozen FCP or original incidence pilot.
