# Original source Spin preimages of arbitrary fixed-axis SO(9) targets

Status: CANDIDATE, pending complete strict source and independent consumer compilation.
Exact parent: `32cea17d8ea8510c58fee656866cf2b79c3778f7`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

The arbitrary-target Euclidean bridge qualified at
`cf9c247cc6b2297ddb243a8ac8d2be16d59a0b67`, strict run
[42441345508](https://github.com/etblink/math/actions/runs/42441345508).
This gate consumes that unchanged bridge and the qualified original Cartan
cleanup and even-list lift. It implements the next bounded existence milestone
in the covering research memorandum, without packaging a covering or Spin(8).

## Exact public target

In namespace FCP.BFSSSourceNineAxisTargetPreimage:

```lean
source9Axis8Target_hasOriginalSourcePreimage
    (A : Matrix.specialOrthogonalGroup SpaceIndex ℝ)
    (hfix : (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec
      (source9CoordinateVector 8) = source9CoordinateVector 8) :
  ∃ g : spinGroup source9Quadratic,
    source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8 ∧
    ∀ z : SpaceIndex → ℝ,
      source9SpinVectorRepresentation g z =
        (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec z
```

There is no premise that A is already source-attained. The target is an arbitrary
original matrix fixing the actual ninth axis. The witness belongs to the actual
original Clifford spinGroup source9Quadratic, and equality covers every original
nine-vector, not just the axis or a source-generated subset.

There are four public roots:

1. source9TargetEuclidean_unitCartan_le_eight: generic target isometry factorization
   into an ordered list of unit Euclidean normals, even length at most eight.
2. source9Target_sourceUnitCartan_le_eight: the same factorization with original
   Q-unit vectors and the original native reflection-word definition.
3. source9Axis8Target_hasOriginalSourceWordPreimage: the main witness together with
   its exact original Clifford word, Q-unit factors, even length and bound eight.
4. source9Axis8Target_hasOriginalSourcePreimage: the minimal public endpoint above.

The first two helper theorems accept arbitrary original SO(9) matrices without
an axis-fixing assumption. The public source-preimage endpoints retain hfix;
no broader global source Spin surjectivity theorem is added.

## Noncircular proof and preserved order

Apply pinned Mathlib LinearIsometryEquiv.reflections_generate_dim directly to
source9TargetEuclideanIsometry A. This is the independently constructed target
isometry, not source9SpinEuclideanIsometry of an assumed source preimage.

Reuse source9EuclideanUnitNormals to remove zero identity reflections before
parity reasoning, normalize nonzero normals, and preserve the complete ordered
reflection product. The raw dimension bound is nine. The bridge's determinant
one and the qualified unit-list determinant theorem give even length, hence
length at most eight. Convert normals through the same original inverse Euclidean
transport; Q equals squared L2 norm under that transport.

Apply source9EvenUnitList_lift to that even original Q-unit list. This yields
a genuine source element with its exact original Clifford word and the same
ordered native reflection action. Prove equality on ALL original vectors using
injectivity of source9ToEuclidean and the bridge's exact matrix-action theorem.
Only after this equality is established does hfix imply membership in the
literal source axis stabilizer.

No perpendicular-normal constraint is imposed: it is unnecessary for this
existence statement. No source-element Cartan theorem is used to supply a
preimage of an arbitrary target. No new Clifford algebra, even-Clifford
injectivity, chosen continuous factorization or group-classification premise
is introduced.

Pinned Mathlib interfaces were inspected at
`d13f23b723b8a846827a245b89c10fc7d3f11612`:

- Analysis/InnerProductSpace/Projection/FiniteDimensional.lean, blob
  `03df40376462cddf15be1598c4e201a610830a31`: generic
  LinearIsometryEquiv.reflections_generate_dim, with length bounded by finrank
  and exact original product order.
- Data/Matrix/Mul.lean, blob
  `ff91eb667e375c22bc6d8973fa706f9dd1f9d100`: mulVec_single_one for exact
  column/basis evaluation. This avoids relying on a guessed scalar version of
  mulVec_single, whose result involves a MulOpposite scalar action.

The existing source nine-vector Cartan and even-list proofs were inspected
for their exact normalization, list transport and action interfaces. Reuse their
qualified helpers rather than re-proving structural reflection generation.

## Independent and adversarial consumers

Sixteen independent examples check both target-factorization types, the complete
word-preimage type, the explicit minimal source-exact endpoint, length and word
witness retention, actual original SO(9) matrix equality, Q preservation and
pointwise action, identity, the empty-list lift, zero-normal deletion, and the
determinant-parity interface. The final checks establish:

- The ACTUAL source negative central element remains distinct from identity and
  acts as identity on every original nine-vector, by direct original Clifford
  conjugation and the qualified vector projection. Its inverse Clifford value
  is checked explicitly. No fermionic or gamma action is identified with this
  vector action, and no kernel-exhaustion claim is made.
- The perpendicular e0e1 source pair fixes the actual axis; its target receives
  a source stabilizer preimage agreeing on every vector. No uniqueness of that
  preimage is asserted.
- The mixed e0e8 pair sends e8 to -e8. No source element fixing e8 can have its
  full original action. This is a concrete rejecting test of the target boundary.
- The ordered original unit-pair action agrees with the same ordered pair of
  native hyperplane reflections.

Private consumer helper proofs establish the concrete axis/central facts without
adding source assumptions or importing later two-sign or gamma-faithfulness
packages. The original source already supplies negative-central membership and
distinctness; these bytes remain unchanged.

## Exact source closure and qualification policy

The new source imports precisely the qualified target bridge and original
even-list lift. Its complete non-Mathlib closure has 94 original modules and
six qualified inherited sources: Lipschitz, orientation, reflection, unit Cartan,
even-list lift and target bridge. The two new Lean files make 102 cold builds.
The manifest pins 132 inputs including thirty environment/verification controls.
Require all 76 strict axiom reports and eight exact completion markers.

All original and qualified source pins are preserved, including the exact bridge
source accepted at cf9c247. The 27 shared controls are unchanged; only the new
runner, test and workflow identities replace their even-list gate counterparts.
Reuse that gate's ten adversarial report-validation tests, complete cold-source
procedure, exact input and log retention, warnings-as-errors and permitted
propext/Classical.choice/Quot.sound axiom checks.

Lean 4.34.1, all 42 package revisions, action pins, 600-second per-file limit,
70-minute cold build, 35-minute restoration and 110-minute job remain unchanged.
No PBW registration, global instance, linter waiver, new axiom, proof-budget
increase, BFSS proof-object cache, OperatorDependencies or source48 donor import
is introduced. Existing local work and qualified theorem statements are preserved.

The known local Lean startup incompatibility is not bypassed by modifying the
compiler. Static preflight, Python/workflow syntax checks and validator tests
prepare a bounded candidate; they do not constitute Lean theorem qualification.
Acceptance requires the complete strict source and all sixteen independent
examples, exact reports and markers, and a retained PASS receipt at the exact
tested commit. The owner supplies terminal CI results; do not poll.

## Stop conditions and boundary

Reject circular source-attainment premises, changed source/target labels, zero
normals counted as determinant-minus-one reflections, wrong product order,
unsupported norm transport, dropped full-action equality, mixed-axis acceptance,
collapsed central signs, diagnostics or unexpected axioms. Preserve the first
causal failure before any bounded repair.

This is an existential original source-preimage gate. Subgroup versions of source
and target stabilizers, their bundled continuous homomorphism, exact two-sign
fibers/kernel, quotient/covering packaging and coordinate SO(8) equivalence remain
separate obligations. No topological Spin(8) classification, torus/branching,
Fock-operator action, physical domain correspondence, coercivity, confinement,
mass gap or positive eigenvalue theorem follows from the candidate alone.
