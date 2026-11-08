# Original source axis-stabilizer vector-projection continuity gate

Status: CANDIDATE, pending strict source and independent consumer compilation.
Exact parent: `ebfecd8b57dae98eb3ed73fc10c1ae703d0abb33`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

The compact quotient gate qualified at
`8f22713d9e14a7e851badfb0f680056f1fab1987`, strict run
[42429216538](https://github.com/etblink/math/actions/runs/42429216538).
This successor consumes its unchanged exact quotient map and continuity test.

## Exact main theorem

In namespace FCP.BFSSSourceNineAxisStabilizerVectorContinuity:

```lean
source9Axis8Stabilizer_vectorSO9_continuous_pbw :
  Continuous (fun g : {g : spinGroup source9Quadratic //
    source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8} =>
    source9SpinVectorSpecialOrthogonalHom g.val)
```

The codomain is the EXISTING Matrix.specialOrthogonalGroup SpaceIndex ℝ,
with its original matrix/subtype topology. The domain is the literal original
fixed-axis subtype in the existing source PBW topology. No group or action is
replaced, and no mathematical premise is added to the main theorem.

The other public results identify the original matrix entries with original
coordinate-vector images, establish continuity of the original word-parameter
composites into the Clifford algebra, original vectors, matrices and SO(9),
and give the restricted matrix continuity and jointly continuous original
vector action on stabilizer × original nine-vector space. There are eight roots.

## Smaller source-native proof found during interface audit

The preceding qualification proposed reconstructing parameter continuity from
the ordered reflection-pair formula. Inspection revealed a smaller established
input already inside the exact original source closure: F10BU's jointly smooth
ambient extension of the actual original vector conjugation. Reuse it instead
of repeating the pair-action polynomial proof. This changes the implementation
route, not the requested source theorem or its assumptions.

The original source is SU2BFSSPairedSpin9V10HF10BUAmbientVectorActionSmoothness,
Git blob `aa38de95852718445ddd0448068592f9cefe4db4`, SHA-256
`c8e8a13a4e341c60155e5d5eb96aeee58cca9c275d127e62cd4e9e16534a0613`.
Its original declarations provide:

- source9AmbientVectorConjugation_contDiff_pbw: joint smoothness in the actual
  PBW Clifford element and original vector, for every order;
- source9AmbientVectorConjugation_eq_spin: exact agreement on original Spin
  elements, using their actual reversal/inverse identity.

The original finite-plane-word smoothness source was inspected as an existing
example of exactly this extension-and-equality pattern; it is not newly imported.
The ambient source itself is already cold-built in the inherited original closure.
The new strict root reports will check its actual transitive axiom contribution.

Proof sequence:

1. Coerce the qualified perpendicular eight-word map continuously into the
   actual PBW Clifford algebra. Compose the original ambient continuity theorem
   (smoothness at order zero) with this map and a constant original vector.
   Use a typed equality of functions and the source agreement theorem to obtain
   continuity of the actual parameterized vector action.
2. Read every matrix entry as the image of the original coordinate basis vector.
   Prove continuity entry by entry, then use subtype construction for the existing
   original SO(9)-valued homomorphism. No abstract representation is substituted.
3. Apply the qualified source9Axis8Stabilizer_continuous_iff_pbw theorem to this
   independently proved parameter composite. The literal quotient map's underlying
   source value is the same original word formula, so the composite matches.
4. Forget only the SO(9) membership proof to obtain underlying matrix continuity.
   Continuous matrix-vector multiplication and the original matrix/action identity
   give joint continuity of the restricted original vector action.

This proof does not assume continuity of the full source Spin vector projection,
nor assert it as a separate new public theorem. The parameter continuity proof
does not depend on the restricted projection conclusion. Reflection multiplication
order is preserved by reusing the unchanged word formula throughout.

## Pinned Mathlib interfaces

Mathlib remains `d13f23b723b8a846827a245b89c10fc7d3f11612`.

- Topology/Instances/Matrix.lean, blob
  `13c038a9628a9a641cd8dff30d79c52506d2b847`: continuous_matrix,
  Continuous.matrix_elem and Continuous.matrix_mulVec, with original finite
  coordinate labels and the standard Pi matrix topology.
- LinearAlgebra/Matrix/ToLin.lean, blob
  `e27ea745bb8ab9f7766890e55c6a48e85d89a370`: the definitional
  LinearMap.toMatrix'_apply identity on Pi.single basis vectors. The existing
  source matrix homomorphism is exactly this canonical matrix construction.
- The already inspected Topology/Constructions Continuous.subtype_mk interface
  and qualified original quotient continuous_iff theorem are reused unchanged.

## Independent consumers and strict controls

Sixteen independent examples check the original matrix-entry identity;
Clifford, vector, matrix and SO(9) parameter continuity; the explicit original
stabilizer/SO(9) main type; underlying matrix and joint vector-action continuity;
the original matrix/action identity and fixed-axis image; identity and distinct
negative-center images; quotient-composite continuity; all restricted matrix
entries; fixed-vector action continuity; and continuous postcomposition from
the actual original SO(9) target.

The negative central element is proved to act as identity in this VECTOR
projection while remaining distinct from the source identity. This does not
collapse its gamma action, supply an operator-algebra action, or identify an
operator action with a Fock-vector lift.

The exact non-Mathlib closure is 125 original modules plus fifteen inherited
qualified sources: the preceding list and its unchanged quotient source.
With the two new files, cold compilation covers 142 modules. The manifest pins
172 inputs including thirty verification/environment controls; require all
146 strict axiom reports and seventeen exact completion markers. No
OperatorDependencies or extra donor modules are introduced. The shared 27
controls and all original/inherited source pins remain unchanged; the new
runner, tests and workflow replace only their preceding gate counterparts.

Reuse the existing sixteen adversarial report/PBW-setup tests and cold-build
procedure. Enable only the same two named PBW values, locally, in the inherited
word-continuity, connectedness, quotient and two new files. Preserve Lean 4.34.1,
all 42 package revisions, action pins, warnings-as-errors for strict sources,
the 600-second per-file limit, 70-minute build, 35-minute restoration and
110-minute job. No linter waiver, proof-budget increase, new axiom or BFSS
proof-object cache is introduced.

The known local Lean startup incompatibility remains; static preflight and
validator checks do not establish Lean proof closure. Submit a bounded candidate;
qualification requires the complete source/consumer compiler pass, exact roots,
permitted propext/Classical.choice/Quot.sound axioms and retained PASS receipt
at the exact tested commit. The owner supplies terminal CI results; do not poll.

## Boundaries and stop conditions

Stop on a source/action or topology mismatch, circular continuity argument,
changed word order, collapsed central signs, unsupported matrix-entry conversion,
diagnostics or unexpected axioms. Preserve the first causal failure before
repairing. A smooth abstract ambient model without exact original-source
agreement is insufficient.

Perpendicular SO(8) target construction, its actual projection kernel and
surjectivity, two-sheeted covering, topological Spin(8) classification,
triality-safe torus binding and branching remain separate obligations.
No Fock-operator action, physical domain identification, coercivity, confinement,
mass gap or positive eigenvalue existence is claimed by this gate.

## Run 42432065694 — first red, bounded continuity-proof repair (2026-11-07)

Run [42432065694](https://github.com/etblink/math/actions/runs/42432065694), exact tested commit `d736ff886911d3688b38c356e7994aebb08869e3`, is **RED / INCOMPLETE**, not a mathematical acceptance. Retained artifact `13598573370` has ZIP SHA-256 `ff62d9ce5f3370e1bc97c94deb8e1fce7a64bf6a3a3305f4a7d7bc0e7f63123c`; its receipt is `INCOMPLETE`. The pinned original and fifteen accepted ancestor modules compiled. The first new source failure was in `source9Axis8EightWord_vector_continuous_pbw`, at candidate line 44: deterministic `whnf` timeout at 200000 heartbeats while composing `(source9AmbientVectorConjugation_contDiff_pbw 0).continuous` with the word inputs. The later `sorryAx` reports were emitted by recovery after that failed theorem; the independent consumer was not compiled.

**Bounded candidate repair:** remove only the resource-intensive generic `ContDiff`-to-`Continuous` composition in that proof. Instead compose existing, qualified, source-exact PBW-continuous maps for Clifford multiplication, reversal, and the vector projection, with explicit intermediate `Continuous` goals and the *unchanged* literal ambient-conjugation equality. Preserve all public theorem statements, the original source carrier/action, local PBW topology, dependency pins, strict controls, consumer, workflow, and proof budgets. Update only the candidate source Git blob/SHA-256 integrity pins. The archive inputs were staged locally, and the updated 172-input static preflight and all sixteen adversarial validator tests passed; this is **not** a Lean compilation or mathematical acceptance.

A fresh strict cold source **and independent consumer** run must pass before qualification. Do not accept a partial source compile, recovered `sorryAx` result, or the validator alone.

## Run #42434082524 — second red, typed independent-consumer composition (2026-11-07)

Run [#42434082524](https://github.com/etblink/math/actions/runs/42434082524) tested commit `9a6777bdd32973b9260521006d8475dcdf97153b` and is **RED / INCOMPLETE**. Archived artifact `13599027663`, GitHub ZIP SHA-256 `fbd3a717fbd1ea6de6f15dd67ba8c24fbb702949ca77d8e811e0b7cabb181cae`, has receipt SHA-256 `04c1154d2eb54db462e9e17c9117329670d9a5ad2f14d84ff827a9f414e6c2ba` and status `INCOMPLETE`.

**First cause:** all 140 accepted and original ancestor modules *and the complete new source* compiled strictly, with eight source public axiom reports free of recovery axioms. The first error then occurred in the independent consumer `BFSSSpectralSourceNineAxisStabilizerVectorContinuityIndependentAudit.lean:105:2`: deterministic `whnf` timeout at the unchanged 200000-heartbeat limit, while elaborating the untyped composition `source9Axis8Stabilizer_vectorAction_continuous_pbw.comp (continuous_id.prodMk continuous_const)` for a fixed original vector. The full independent consumer did **not** compile; this run does not qualify the gate. This is evidence of an elaboration cost, not a counterexample to the proved source continuity.

**Bounded proposed repair:** retain all mathematical source declarations, complete source file, other 15 independent consumer examples, 125 original modules, 15 qualified inherited modules, physical and mathematical definitions, pinned dependencies and workflow unchanged. Replace *only* that consumer example's proof term with typed `hpair : Continuous (fun g : K => (g,z))` and `h : Continuous ((source9Axis8Stabilizer_vectorAction) ∘ (fun g => (g,z)))`, followed by `simpa only [Function.comp_def]`. Preserve the exact example statement, do not increase heartbeat or relax linter/axioms. Change only the consumer's Git blob/SHA-256 pins in the manifest. The static exact-closure preflight and all 16 adversarial validator tests pass on the staged proposed inputs. They are not a Lean compilation.

A new complete strict cold source and independent-consumer run is mandatory. Keep both earlier red runs as failed evidence, and do not accept the new candidate before a PASS receipt and independent axiom/consumer review.
