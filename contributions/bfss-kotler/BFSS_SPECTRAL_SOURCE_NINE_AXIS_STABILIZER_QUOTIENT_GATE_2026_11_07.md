# Original source axis-stabilizer compact parametrization and quotient gate

Status: QUALIFIED at `8f22713d9e14a7e851badfb0f680056f1fab1987`,
strict run [42429216538](https://github.com/etblink/math/actions/runs/42429216538).
Exact parent: `a03066208190eac51fe00398c1ced690e134ccb7`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

The preceding path-connectedness package is qualified at
`19b007c2d46243a803a958c6595e61911d21e41c`, strict run
[42426258689](https://github.com/etblink/math/actions/runs/42426258689).
Its original sphere-image identity, continuous eight-word formula and exact
stabilizer range are reused byte-for-byte. The earlier perpendicular-word and
gamma-faithfulness qualifications remain unchanged.

## Exact target and independent consumer

In namespace FCP.BFSSSourceNineAxisStabilizerQuotient, the new function
source9Axis8EightUnitSpinWordToStabilizer has the explicit type

```lean
(Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1 ∧ u 8 = 0}) →
  {g : spinGroup source9Quadratic //
    source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8}
```

Its value is exactly the qualified source9Axis8EightUnitSpinWord with its
already proved membership certificate. No factorization is chosen and no
new group, representation, Clifford algebra or topology is constructed.

The primary target is

```lean
source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw :
  Topology.IsQuotientMap source9Axis8EightUnitSpinWordToStabilizer
```

The package also proposes compactness and closedness of the actual fixed-axis
set, named compact-space values for its original parameters and literal subtype,
surjectivity and continuity of this exact map, and its closed-map property.
The independent continuity-descent consumer is the theorem

```lean
source9Axis8Stabilizer_continuous_iff_pbw
    {X : Type*} [TopologicalSpace X]
    (f : {g : spinGroup source9Quadratic //
      source9SpinVectorRepresentation g (source9CoordinateVector 8) =
        source9CoordinateVector 8} → X) :
  Continuous f ↔ Continuous (f ∘ source9Axis8EightUnitSpinWordToStabilizer)
```

No new mathematical premises occur. In particular, the gate does not assume
continuity of the entire original nine-vector action. A later consumer must
still independently establish continuity of its composite with the word map
before using descent to prove continuity on the stabilizer.

## Proof and pinned interfaces

1. The finite-dimensional perpendicular subspace sphere is compact. Transport
   it through the original same-label inverse Euclidean equivalence and use
   the qualified exact sphere-image identity to obtain the original Q-unit,
   axis-perpendicular compact set. No subspace/ambient norm conversion is
   repeated here; no identification of the original Pi norm with L2 is made.
2. The literal parameter subtype is compact, hence its eight-fold product is
   compact. Its image under the unchanged qualified continuous word map is
   exactly the actual fixed-axis set, establishing compactness and closedness
   in the original Hausdorff PBW Spin-subtype topology.
3. Give the same formula its literal stabilizer codomain. The qualified range
   equality proves surjectivity. Continuous.subtype_mk proves continuity.
4. A continuous map from a compact space to a Hausdorff space is closed.
   A continuous, closed surjection is a quotient map. The quotient-map
   continuous_iff theorem supplies the stated universal continuity test.

Pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` interfaces were read
before writing the proof:

- Analysis/Normed/Module/FiniteDimension.lean, blob
  `7acfd4dbd8e38944b0e6b935086dda443187b532`: finite-dimensional real normed
  spaces are proper; the original perpendicular submodule has this structure.
- Topology/MetricSpace/ProperSpace.lean, blob
  `98fc4a762880408f9abf13a39b0f308e5341ce3a`: isCompact_sphere.
- Topology/Compactness/Compact.lean, blob
  `30fc9322f4ce78f847a592b0035bf5edfc65f33c`: isCompact_iff_compactSpace.
- Topology/Constructions.lean, blob
  `91a7136cc7b39e609f8becbf9e0785069bb2610d`: Continuous.subtype_mk.
- Topology/Separation/Hausdorff.lean, blob
  `c7c9a4de3b9c0ea0eef31a6f5b98170c89b7f98d`: Continuous.isClosedMap.
- Topology/Maps/Basic.lean, blob
  `363703f1c317ab357689082bc3ba98132f3f1cfa`: IsClosedMap.isQuotientMap,
  taking continuity then surjectivity, and Topology.IsQuotientMap.continuous_iff.

## Verification and failure controls

The exact imported non-Mathlib closure is 125 original modules and fourteen
qualified inherited sources, adding only the accepted path-connectedness source
to the preceding gate's inherited list. With the new source and its independent
consumer, the gate cold builds 141 modules. All inherited bytes and roots are
pinned unchanged. The manifest pins 171 inputs, including thirty environment
and verification controls. Require all 143 strict axiom reports and sixteen
exact completion markers. There are thirteen new public roots and sixteen
independent examples.

The independent consumer checks explicit original parameter and stabilizer
types; compact/closed sets; named compact-space values; literal equality of the
new map's underlying value with the old word formula; exact surjectivity,
continuity, closedness and quotient status; continuity equivalence and descent;
and preimages of both identity and the distinct actual negative central element.

Reuse the qualified cold source/consumer procedure and its sixteen adversarial
output/PBW-setup tests. Only the existing two named PBW values may be enabled
locally in the inherited continuity and connectedness sources and the two new
files. No new global instance, linter waiver, axiom, proof resource option,
dependency revision or BFSS proof-object cache is introduced. Lean 4.34.1,
all 42 locked package revisions, action pins, per-file 600-second limit,
70-minute cold build, 35-minute environment restoration and 110-minute job
limit are preserved. All strict-source/consumer warnings are fatal.

The known local Lean startup incompatibility remains; no local Lean proof
closure is claimed. Preflight and validator checks prepare a bounded candidate
submission. Acceptance requires the complete strict compiler run, independent
consumer and successful retained receipt at the exact tested commit. The owner
reports the terminal result; do not poll CI.

Stop on a changed topology or carrier, one-sign/dense image, assumed continuity
of the complete nine-vector action, a continuously chosen decomposition,
unexpected axioms, diagnostics, or failed source/consumer compilation. Preserve
and classify the first causal error before any repair.

## Boundary

This is a compact parametrization and topology-descent gate only. Perpendicular
SO(8) action construction and continuity, its exact kernel and surjectivity,
two-sheeted covering, Spin(8) classification, triality-safe torus binding,
branching, Fock-operator action, physical domains, coercivity and positive
eigenvalue existence remain separate obligations. No successor stage is admitted
by an abstract compactness argument or a green validator alone.

## Qualification: 42429216538

The owner reported the terminal green result. Independent retained-evidence
review confirms PASS at exactly `8f22713d9e14a7e851badfb0f680056f1fab1987`.
All 141 controlled modules cold compiled, including the complete new source
and sixteen independent examples. All 143 strict axiom reports and sixteen
completion markers match their exact inventories. Only propext, Classical.choice
and Quot.sound occur; no compiler warnings or recovery axioms occur. Review
verified all 171 input Git-blob/SHA-256 pins, 141 compiler-log digests and all
42 dependency revisions against archived inputs and the successful receipt.
The current checked source/control bytes also match those retained inputs.

Artifact `13596904866` has independently verified ZIP SHA-256
`9f4a5624fbad28202bd60add01135d05598d27010b4fd2fefdb4e47b1807525f`.
The PASS receipt SHA-256 is
`5744b43ed8e7bcbc8de04914b9ab3b85e3bc2e7a3bcb5c5f89cce89cb1a9e9f8`.
See [acceptance-42429216538.json](evidence/source-axis-stabilizer-2026-11-07/acceptance-42429216538.json)
for the scoped machine-readable record. Proof-object digests are recorded by
the successful compiler receipt; the archive contains no binary proof objects,
so no independent binary-object rehash or new local Lean compilation is claimed.

The compactness, closedness, literal continuous closed surjection, quotient-map
theorem and universal continuity test in this package are now qualified with
their original source types and PBW topology. The consumer separately checks
preimages of identity and the distinct actual negative center. This does not
qualify continuity of any particular vector projection merely by naming it.

## One next bounded milestone

Prove continuity of the EXISTING original SO(9)-valued vector projection when
restricted to the actual axis stabilizer, using the qualified quotient map.
The proposed source-exact target is

```lean
source9Axis8Stabilizer_vectorSO9_continuous_pbw :
  Continuous (fun g : {g : spinGroup source9Quadratic //
    source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} =>
    source9SpinVectorSpecialOrthogonalHom g.val)
```

The existing projection is the one defined in BFSSSourceNineOrientation, not
a new abstract SO(9) action. Establish continuity of its composite with the
original perpendicular eight-word map by the qualified ordered pair-action
formula and continuous source-coordinate polynomial operations, then descend.
Check all original matrix entries and the unchanged subtype topology explicitly.
Independent consumers should check literal action agreement and the identity
and actual negative-center images. Do not assume the desired projection
continuity to prove its composite continuity.

This milestone supplies a continuous original projection whose image fixes the
axis; it precedes constructing the actual perpendicular SO(8) target. Its kernel,
surjectivity onto that target, covering property, Spin(8) classification and torus
binding remain separate. Stop on a changed projection/topology, reflection-order
error, or a circular continuity premise. No successor Lean source or workflow
run is introduced by this documentation-only qualification.
