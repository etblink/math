# Original source stabilizer projection, two-sign fibers and kernel

Status: CANDIDATE, pending complete strict source and independent consumer compilation.
Exact parent: `2d8a3c6980697b8db3b9e3628ab15d1f05a4da0b`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

The arbitrary fixed-axis target preimage theorem qualified at
`bafe84205a6197b8e01fe796e1847274714230e6`, strict run
[42444640879](https://github.com/etblink/math/actions/runs/42444640879).
This gate packages that existence result and the already qualified original
full-action two-sign theorem. All inherited declarations remain unchanged.

## Exact source and target

In namespace FCP.BFSSSourceNineAxisProjection, define two genuine subgroups:

```lean
source9Axis8SpinStabilizer : Subgroup (spinGroup source9Quadratic)
source9Axis8MatrixStabilizer :
  Subgroup (Matrix.specialOrthogonalGroup SpaceIndex ℝ)
```

Their carriers are DEFINITIONALLY the original predicates

```lean
{g : spinGroup source9Quadratic |
  source9SpinVectorRepresentation g (source9CoordinateVector 8) =
    source9CoordinateVector 8}

{A : Matrix.specialOrthogonalGroup SpaceIndex ℝ |
  (A : Matrix SpaceIndex SpaceIndex ℝ).mulVec (source9CoordinateVector 8) =
    source9CoordinateVector 8}
```

Identity, multiplication and inverse closure are proved directly using the
original representation and actual matrix multiplication. Axis evaluation is
not treated as an additive group homomorphism or used to define a false kernel.
The source carrier agrees with the already qualified literal stabilizer subtype;
no new vector action, quadratic form, Clifford algebra, or axis is introduced.

## Original projection and exact target statements

The primary construction is

```lean
source9Axis8ProjectionHom :
  source9Axis8SpinStabilizer →* source9Axis8MatrixStabilizer
```

Its underlying SO(9) value on g is exactly
source9SpinVectorSpecialOrthogonalHom g.val. The source9Axis8ProjectionHom_mulVec
companion binds every original vector action, and
source9Axis8ProjectionHom_surjective claims every original fixed-axis matrix
has a preimage in the actual source subgroup.

The negative sign source9Axis8NegativeCentral is the existing genuine
source9NegativeCentral, supplied with its source stabilizer membership. Its
underlying original Clifford value remains -1. Its inequality from identity and
identity vector projection are preserved separately.

The main fiber and kernel claims are

```lean
source9Axis8ProjectionHom_eq_iff_two_sign_fiber
    (g h : source9Axis8SpinStabilizer) :
  source9Axis8ProjectionHom g = source9Axis8ProjectionHom h ↔
    g = h ∨ g = source9Axis8NegativeCentral * h

source9Axis8ProjectionHom_mem_ker_iff
    (g : source9Axis8SpinStabilizer) :
  g ∈ source9Axis8ProjectionHom.ker ↔
    g = 1 ∨ g = source9Axis8NegativeCentral

source9Axis8ProjectionHom_ker_eq :
  (source9Axis8ProjectionHom.ker : Set source9Axis8SpinStabilizer) =
    {1, source9Axis8NegativeCentral}
```

The final source9Axis8ProjectionHom_fiber_exact_pair theorem combines surjectivity
and exact fibers: over EVERY target, a preimage g exists, all preimages are
precisely g and source9Axis8NegativeCentral*g, and those two elements are distinct.
No cardinality hypothesis or target-attainment premise is assumed. There are
seventeen public roots in total, including the exact carrier interfaces.

## Proof reuse and noncircularity

Surjectivity applies the qualified source9Axis8Target_hasOriginalSourcePreimage
to the arbitrary target element and its actual fixed-axis membership. Full
original vector equality gives equality of the original matrices by the pinned
Matrix.mulVec_injective interface, then equality in the two literal subtypes.
No generation hypothesis or source-element Cartan shortcut is introduced.

Fiber classification passes equality of the new projection values to equality
of the full original vector actions, then applies the existing qualified
source9Action_eq_iff_two_sign_fiber. Equality in the source subgroup is obtained
by Subtype.ext on those ACTUAL original group elements. The reverse direction
uses the original projection's multiplicativity and the original negative
center's qualified identity natural-matrix image.

Kernel membership specializes the exact fiber to the source identity. The set
formula retains both distinct elements. Fiber distinctness reuses the original
source9NaturalMatrix_fiber_signs_distinct, not a new injectivity assumption.
The projection is deliberately non-injective; it must not be confused with the
separately qualified faithful gamma representation or a Fock-vector lift.

Inspected pinned Mathlib source: Algebra/Group/Subgroup/Defs.lean, blob
`25b204a70eaa95f84c361f95c836d9bf9ac92eb0`, at revision
`d13f23b723b8a846827a245b89c10fc7d3f11612`: subgroup fields, inherited group
operations and exact coe_mul/coe_one/coe_inv identities. Matrix.mulVec_mulVec
and Matrix.mulVec_injective are reused in the same orientations as the already
qualified original source proofs. No new Mathlib import is required beyond the
two qualified source imports.

## Independent consumers and adverse tests

Twenty-two independent examples check exact source/target carrier equalities,
literal projection values and original vector action, surjectivity, an arbitrary
raw fixed-axis matrix preimage, identity and multiplication laws, actual source
and Clifford values of the negative sign, its distinctness and identity image,
the exact two-sign fibers, exact kernel membership and carrier pair, and
nonempty exhaustive fibers with distinct signs.

They additionally check inverse closure in both subgroups, a direct adapter to
the previously qualified literal source subtype, the perpendicular e0e1 pair's
membership, the mixed e0e8 pair's nonmembership, and explicit rejection of
projection injectivity. The concrete polar/axis helper proofs are reused from
the independently qualified preimage consumer, including its repaired explicit
Q-unit self-polar calculation. They are compiled again in this consumer.

No result about the negative center's vector identity is substituted for its
distinct gamma/fermionic action. No upper-left submatrix or abstract triality
identification occurs in this gate.

## Exact closure and strict verification

The complete imported closure is the existing 125 original modules needed for
the qualified natural two-sign theorem and eight qualified inherited sources:
Lipschitz, orientation, reflection, unit Cartan, even-list lift, signed word,
target Euclidean bridge and fixed-axis preimages. The 94 original modules of
the preceding preimage gate are an unchanged subset of this original closure.
The additional original ancestors come from the established exact two-sign
source dependency, not a new donor reconstruction.

The two candidates make 135 cold builds. The manifest pins 165 inputs, including
thirty environment/verification controls. Require all 110 strict axiom reports
and ten exact completion markers. All original and qualified source pins, and
all 27 shared environment controls, remain unchanged; the new runner, validator
tests and workflow replace only their signed-word gate counterparts. Reuse the
same ten adversarial output validation tests and complete retained-input/log
procedure. Every strict source and consumer warning is fatal.

Preserve Lean 4.34.1, Mathlib and all 42 package revisions, action pins, the
600-second per-file limit, 70-minute cold build, 35-minute restoration and
110-minute job. No new axiom, assumption, global instance, PBW registration,
linter waiver, proof-budget increase, OperatorDependencies or BFSS proof-object
cache is introduced. The known local Lean startup incompatibility is not
bypassed by modifying the compiler. Static preflight and syntax/validator tests
prepare a candidate; they do not qualify Lean proof closure.

Acceptance requires the complete strict source and all independent examples,
only propext/Classical.choice/Quot.sound in the exact root reports, and a retained
PASS receipt at the exact tested commit. The owner supplies terminal CI results;
do not poll. On red, preserve and classify the first causal failure before any
bounded repair.

## Boundaries and stop conditions

Reject a changed carrier or projection, source-attainment premise, collapsed
central signs, one-sign kernel, missing fiber, mixed-axis inclusion, altered
product order, diagnostic or unexpected axiom. Preserve the original predicates
so the existing PBW subtype topology can be used in the next stage.

This is an ALGEBRAIC projection/fiber gate only. Continuity of the newly bundled
subgroup map must be transferred from the already qualified restricted original
projection before asserting its topological quotient or covering properties.
The existing parameter quotient theorem is not a covering theorem for this
projection. A two-element fiber alone does not establish a topological covering.

A subsequent bounded topology gate may combine the established source compactness,
source topological group structure and continuity with the exact finite kernel,
then apply the pinned quotient-covering theorem. Coordinate SO(8) identification,
topological Spin(8) classification, source torus/branching, Fock-operator action,
physical domains, coercivity, confinement and positive spectral existence remain
separate obligations. No physical spectral statement is authorized by this gate.
