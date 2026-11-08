# Original SO(9) arbitrary-target Euclidean bridge gate

Status: CANDIDATE, pending complete strict source and independent consumer qualification.
Exact parent: `fd1383cca8aa14e2cca67ef9726a73c3349d4260`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

This implements the smaller first subgate permitted by the
[source Spin(8) covering research memorandum](BFSS_SPECTRAL_SOURCE_SPIN8_COVERING_FORWARD_RESEARCH_2026_11_07.md),
sections 3, 4 and 11. The latest qualified restricted vector-continuity source
at tested commit `74f8c0624d61527bda7aec3a2b38f8c13475e1d1`, run
[42435908276](https://github.com/etblink/math/actions/runs/42435908276), remains unchanged.

## Missing interface and bounded decision

The existing source9SpinEuclideanIsometry begins with an actual original Spin
input. It cannot furnish a preimage of an arbitrary target matrix; using it for
that existence argument would be circular. The immediate gate therefore starts
with arbitrary A in Matrix.specialOrthogonalGroup SpaceIndex ℝ. There is no
premise that A is source-attained or fixes an axis.

The public construction in FCP.BFSSSourceNineTargetEuclideanBridge is

```lean
source9TargetEuclideanIsometry
    (A : Matrix.specialOrthogonalGroup SpaceIndex ℝ) :
  EuclideanSpace ℝ SpaceIndex ≃ₗᵢ[ℝ] EuclideanSpace ℝ SpaceIndex
```

Its principal consumer interface is

```lean
source9TargetEuclideanIsometry_apply_source
    (A : Matrix.specialOrthogonalGroup SpaceIndex ℝ) (z : SpaceIndex → ℝ) :
  source9TargetEuclideanIsometry A (source9ToEuclidean z) =
    source9ToEuclidean ((A : Matrix SpaceIndex SpaceIndex ℝ).mulVec z)
```

The companion determinant theorem has the unconditional original target type

```lean
source9TargetEuclideanIsometry_det_one
    (A : Matrix.specialOrthogonalGroup SpaceIndex ℝ) :
  LinearMap.det (source9TargetEuclideanIsometry A).toLinearMap = (1 : ℝ)
```

An exact fixed-axis iff additionally relates A.mulVec e8=e8 to its transported
isometry fixing source9ToEuclidean e8. Original labels, matrix action and source
quadratic form are retained; there is no abstract SO action replacement.

## Construction and inspected primary interfaces

Extract A's orthogonal membership and call the existing
Matrix.UnitaryGroup.toLinearEquiv on that same underlying matrix. Its original
coordinate action is literally matrix multiplication. Orthogonality gives
A.transpose*A=1; the pinned dotProduct_transpose_mulVec and mulVec_mulVec
identities prove preservation of the original Q(z)=dotProduct z z.

Conjugate the resulting vector linear equivalence through the qualified
source9ToEuclidean. The exact Q=L2-norm-squared identity gives norm preservation
and hence a genuine Euclidean LinearIsometryEquiv. This does not identify the
ordinary source Pi norm with L2. The fixed-axis iff follows by injectivity of
that same original coordinate transport.

For the determinant, LinearEquiv.det_conj preserves the determinant under the
actual conjugacy. LinearEquiv.coe_det and LinearMap.det_toLin' identify it with
A.det=1. Units.val_one is handled explicitly, retaining the coercion lesson from
the earlier unit-Cartan repair. Typed equalities precede any normalization;
there are no broad source unfoldings or resource-limit options.

Pinned Mathlib revision: `d13f23b723b8a846827a245b89c10fc7d3f11612`.

- LinearAlgebra/UnitaryGroup.lean, blob
  `2bc60a3c9927cdbf9c28371d1b4e9f66b7447583`: exact original-matrix
  toLinearEquiv; orthogonal and special-orthogonal membership orientations.
- Data/Matrix/Mul.lean, blob
  `ff91eb667e375c22bc6d8973fa706f9dd1f9d100`: dotProduct_transpose_mulVec,
  mulVec_mulVec, and one_mulVec with their exact multiplication order.
- LinearAlgebra/Determinant.lean, blob
  `986ae30a9d7245d1525fb35f1ffc55e0c22209f5`: LinearMap.det_toLin',
  LinearEquiv.coe_det and LinearEquiv.det_conj.
- The source nine-vector unit-Cartan proof and historical source48 determinant
  transport were inspected for the typed conjugacy pattern. No source48 file
  is imported or treated as a nine-dimensional theorem.

## Independent consumers

Fourteen independently stated examples check arbitrary-target vector action,
original quadratic preservation, transported norm, the literal Fin 9 Euclidean
isometry type, exact matrix action and determinant, the fixed-axis iff and
both its accepting/rejecting uses, agreement on existing original source images,
identity action, inverse cancellation, the ordered original Clifford unit-pair
reflection action, and preservation of original Q-unit vectors.

The source-image and ordered-pair checks are consumers only. They are not
premises in constructing the arbitrary-target isometry. No target Spin preimage,
source two-sign fiber, or stabilizer covering is claimed in this bridge gate.

## Exact dependency closure and verification

Choose the smaller existing unit-Cartan source/consumer procedure: 94 original
modules plus the three unchanged qualified Lipschitz, orientation and reflection
sources. The bridge imports only orientation, reflection and the two explicit
Mathlib interfaces above. No accepted Cartan source, recent stabilizer chain,
source48 chain, OperatorDependencies, Clifford donor or Fock package is needed
in its imported proof closure. Those previously qualified files remain untouched.

The two new Lean files make 99 cold compilations. The manifest pins 129 inputs,
including the same thirty environment/verification controls. All 94 original
and three inherited source pins and the 27 shared controls are byte-identical
to the existing procedure; only the new runner, test and workflow identities
replace their old gate counterparts. Nine public roots require 53 strict axiom
reports, including the inherited roots and their repeated independent-consumer
reports, and five exact completion markers. The ten existing adversarial output
validator tests are reused.

Lean 4.34.1, all 42 locked package revisions, checkout/upload action pins,
strict warnings-as-errors, permitted propext/Classical.choice/Quot.sound axioms,
600 seconds per file, 70-minute cold build, 35-minute restoration and 110-minute
job limits are preserved. No new instance, PBW registration, topology, axiom,
proof-budget increase, linter waiver or BFSS proof-object cache is introduced.

The work is isolated in a fresh worktree based on the exact memorandum commit.
Existing local work and prior candidate files are not overwritten. The known
local Lean startup incompatibility is not bypassed or retried by patching the
compiler. Static preflight, syntax and validator tests prepare a candidate;
only a complete retained strict source/consumer PASS at the exact tested commit
can qualify it. The owner supplies terminal CI results; do not poll.

## Failure conditions and next use

Reject a changed target matrix, coordinate permutation, source-preimage premise,
Pi/L2 norm conflation, wrong orthogonality orientation, determinant coercion gap,
reflection-order mismatch, incomplete consumer, warning or unexpected axiom.
Preserve the first causal failure before any bounded repair. A green preflight
is not theorem acceptance.

After this bridge qualifies, the next bounded task is generic Cartan
factorization of this independently constructed target isometry, zero-normal
removal, unit normalization and parity, followed by the existing original
even-list source lift. Exact full-action equality would place the lifted source
element in the actual stabilizer whenever A fixes e8. This future source-lifting
claim has not been implemented here.

Source stabilizer subgroup packaging, exact fibers/kernel, quotient covering,
coordinate SO(8) identification, triality-safe torus and branching remain later
obligations. No Fock action, physical Hamiltonian domain, coercivity, confinement,
mass gap or positive eigenvalue statement follows from this bridge.
