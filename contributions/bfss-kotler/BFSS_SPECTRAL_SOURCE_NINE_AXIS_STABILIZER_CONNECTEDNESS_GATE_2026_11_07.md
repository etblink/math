# Original source axis-stabilizer path connectedness gate

Status: CANDIDATE, pending complete strict compilation and independent consumer.
Exact parent: `8f6b2e44fa3b76bdc8c1e8a81be4d7d80ae2972e`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

The preceding exact-eight-word characterization is qualified at
`7bea5ca3353dd64d8c8b68ec3229aadc9296ec56`, run 42421286452. This gate consumes
that unchanged theorem and the unchanged original eight-word continuity.
It does not assume the source group has already been classified as Spin(8).

## Exact main result

Namespace `FCP.BFSSSourceNineAxisStabilizerConnectedness`:

```lean
source9Axis8Stabilizer_isPathConnected_pbw :
  IsPathConnected {g : spinGroup source9Quadratic |
    source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8}
```

The companion source9Axis8Stabilizer_isConnected_pbw states IsConnected of
the same literal set. A named PathConnectedSpace value is also supplied for
the actual stabilizer subtype; no global instance is registered. There are
no new mathematical hypotheses on these conclusions.

The topology on the source Clifford algebra and Spin subtype uses exactly
the existing source9PBWNormedAddCommGroup and source9PBWNormedSpace values,
enabled only locally as in the qualified continuity/compactness gates. The
original nine-coordinate topology and same-label Euclidean transport are
unchanged. No alternative Spin group, source representation or Clifford
algebra is defined.

## Proof architecture and pinned interfaces

1. Define the Euclidean perpendicular subspace of the transported ORIGINAL
   ninth axis, inside EuclideanSpace over the original SpaceIndex. Prove the
   axis is nonzero and its perpendicular has finrank eight using the pinned
   finrank_orthogonal_span_singleton theorem. The dimension fact is discharged
   locally, not assumed as a new model premise.
2. Show the image of this subspace's unit sphere under the original inverse
   Euclidean transport is exactly the ORIGINAL locus Q(u)=1 and u(8)=0.
   The proof uses the qualified Q=L2-norm-squared and exact axis-inner-product
   identities. It does not equate the original Pi norm with the Euclidean norm.
3. Apply the pinned real normed-space isPathConnected_sphere theorem after
   proving rank > 1 from finrank eight. Continuous image gives path connectedness
   of the original perpendicular Q-unit locus and its subtype.
4. Define the eight-input restriction by forgetting only the perpendicular
   proof and calling the EXISTING source9EightUnitSpinWord formula. Its
   continuity is composition of the existing PBW-continuous map with continuous
   coordinate/subtype maps.
5. Use the accepted source-exact iff and literal Clifford value of the existing
   word map to prove its range is exactly the actual source axis stabilizer.
   This includes the actual negative central sign.
6. The eight-fold parameter space is path connected. Its continuous full image
   gives the stated path-connected set, connected set and named subtype value.

This route needs no new theorem asserting continuity of the complete original
nine-vector action. That action defines the literal fixed-axis set, whose
topology is obtained here from an independently continuous exact-range map.
No continuously chosen word decomposition is asserted.

Pinned Mathlib sources inspected:

- Analysis/Normed/Module/Connected.lean, blob
  `be023593ffc517a932a8b8af3c1cbdb4465b1346`: isPathConnected_sphere with
  rank > 1 and nonnegative radius.
- Analysis/InnerProductSpace/Orthogonal.lean, blob
  `0f349bcd1adcfc5fd6bc344ad81dcf7d62b55541`: exact singleton orthogonality
  orientations, including the inner-right membership theorem.
- Topology/Connected/PathConnected.lean, blob
  `063522ce3ac7a6b2b9113ff2bea3bb3021155b3c`: continuous images, subtype
  equivalence, Pi path connectedness, connectedness and JoinedIn consumers.
- Existing accepted Projection/FiniteDimensional and PiL2 interfaces, including
  finrank of the perpendicular complement and EuclideanSpace finrank.

## Independent consumers

Fourteen examples check the exact perpendicular dimension, original parameter
locus, named parameter-subtype value, eight-fold parameter space, exact range,
literal source-map continuity, main path-connected and connected sets, and
named original stabilizer subtype. Further consumers obtain JoinedIn paths
from identity to arbitrary stabilizer elements and from identity to the actual
negative center while retaining its source inequality from identity. They
also check path-connected continuous images, an explicit original e0 parameter,
and membership of each restricted source word.

No abstract covering, triality choice, root-data identification or physical
action is supplied as a premise by the consumers.

## Strict source/consumer controls

The exact closure contains 125 original modules and thirteen checked inherited
sources. The latter are the preceding gate's ten ancestors, its qualified
axis-word source, the eight-input map and word continuity. Their source bytes
match existing qualification manifests. There are no OperatorDependencies.
With the two candidates, cold compilation covers 140 modules. The manifest
pins 170 inputs, including the unchanged thirty verification/environment
controls. Require all 130 strict root/axiom reports and fifteen exact markers.

Reuse the qualified source-nine cold-build procedure: remove all controlled
objects, rebuild the complete closure, strictly compile all inherited checked
sources and both candidates, retain complete compiler logs and exact inputs,
and require a successful final receipt. Lean 4.34.1, Mathlib
`d13f23b723b8a846827a245b89c10fc7d3f11612`, all 42 package revisions,
checkout/upload action pins and environment restoration remain unchanged.
No BFSS proof-object cache is introduced. Historical ancestor warnings remain
retained; strict source/consumer warnings are fatal.

The exact existing two-value PBW local setup is allowed only in the inherited
word-continuity source, the new source and its consumer. The reused sixteen
adversarial tests cover root/marker integrity, forbidden diagnostics/axioms
and missing, foreign, duplicate or global PBW instance registration. No linter
waiver, new global instance, theorem weakening or proof-budget increase is used.
The same 600-second per-file, 70-minute cold-build, 35-minute restoration and
110-minute job limits apply. The owner reports terminal CI results; do not poll.

Static preflight, validator and syntax results are preparation. The local
compiler startup incompatibility remains documented in the recovery record;
no local Lean compilation is claimed.

## Boundary and stop conditions

Acceptance requires the exact source and every independent consumer to compile
with the specified topology and actual source types, with only propext,
Classical.choice and Quot.sound in their transitive axiom reports. A partial
compile, printed marker, or pending CI status cannot qualify the gate. Classify
and preserve the first causal failure before changing the proof.

Wrong inner-product orientation, confusion between the original Pi norm and
Euclidean norm, an unproved rank premise, a changed PBW topology, a merely dense
or one-sign image, or accidental continuity assumptions hold this gate.

The proposed result establishes path connectedness of the actual source
stabilizer. Compactness/closedness packaging, a surjection onto actual
perpendicular SO(8), a two-sheeted covering, topological Spin(8) identification,
the common torus/branching rule, a Fock-operator action and physical spectral
claims remain separate obligations.
