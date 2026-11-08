# BFSS — Exact original-target topological group equivalence

**Recorded:** 2026-11-08, America/Los_Angeles.  
**Branch:** research/bfss-original-gamma-faithfulness-20261107.  
**Qualified extension:** f31418acb402e97def0a9289dde45f11614238f1, run 42494594055.  
**Qualification record / candidate parent:** 8498cae4a751569ccb8bccda3819adf0fbe43280.  
**Status:** Bounded source/consumer candidate; static checks pass; strict qualification pending.

## 1. Single objective and exact carrier boundary

Prove continuity of the already qualified raw positive-axis extension, lift
continuity through the SAME original SO(9) and fixed-axis H subtypes, and package
the exact qualified restriction R and extension E as a ContinuousMulEquiv.
No new inverse is selected or independently constructed.

The public candidate has the source-exact type:

```lean
noncomputable def source9Axis8CoordinateContinuousMulEquiv :
    source9Axis8MatrixStabilizer ≃ₜ* Matrix.specialOrthogonalGroup (Fin 8) ℝ
```

Its source is the actual original target point stabilizer H in SO(9), not the
source Spin stabilizer K. These are different carriers. A homeomorphic group
identification of H with SO(8) alone neither classifies K as a separately defined
Spin(8), transports the already qualified source covering, identifies a torus
or root datum, nor licenses branching or physical conclusions.

The existing original coordinate order, literal e8 vector, two-sign source
kernel, matrix subtype topologies, source actions and all qualified source and
consumer bytes remain fixed. No new topology or global instance is introduced.

## 2. Dependency direction and eight public roots

| Root in FCP.BFSSSourceNineAxisCoordinateEquivalence | Exact role |
| --- | --- |
| source9Axis8CoordinateExtensionMatrix_continuous | Continuous J : M8 to the original M9 for every raw real matrix |
| source9Axis8CoordinateExtension_continuous | Continuous E : SO(8) to the actual H, with both unchanged target subtype topologies |
| source9Axis8CoordinateContinuousMulEquiv | The multiplicative homeomorphism, using R/E as its literal forward/inverse functions |
| source9Axis8CoordinateContinuousMulEquiv_apply | C(A) = R(A) for every actual A : H |
| source9Axis8CoordinateContinuousMulEquiv_symm_apply | C.symm(B) = E(B) for every B : SO(8) |
| source9Axis8CoordinateContinuousMulEquiv_entry | Forward entries are the original A i.castSucc j.castSucc |
| source9Axis8CoordinateContinuousMulEquiv_symm_coe | Both inverse target coercions give the qualified raw J(B) = diag(B,+1) |
| source9Axis8CoordinateContinuousMulEquiv_mulVec | Forward action agrees on every original nine-vector's first eight coordinates |

Raw continuity is proved entrywise. For each fixed original row/column index,
the qualified four-entry formulas reduce the entry function either to an actual
entry of B or to a constant 0/1. The finite index cases are independent of B;
no continuity of a parameter-dependent decomposition or measurable choice is
assumed. The existing E carrier equality binds raw continuity to its actual
SO(9) value, and the established subtype continuity method lifts it to H.

ContinuousMulEquiv.mk receives an explicit MulEquiv whose toFun is R, invFun
is E, inverse witnesses are the qualified two inverse identities and map_mul
is the qualified homomorphism law. The two continuity witnesses are proved
separately. The exact apply/symm_apply identities are checked by rfl. No compact
bijective-map shortcut, abstract SO(8) compactness premise or choice inverse
is used. This package constructs no source Spin or Clifford representation.

## 3. Qualified prerequisites and pinned interfaces inspected

The qualified restriction at b4bf6de / run 42491448288 supplies exact original
entries, forward continuity, injectivity and arbitrary-vector action. The
qualified extension at f31418a / run 42494594055 supplies raw entries,
noncircular SO/H membership and both inverse identities. The exact acceptance
records and all previous negative findings remain preserved.

The candidate source imports exactly SpectralSourceNineAxisCoordinateExtension
and Mathlib.Topology.Algebra.ContinuousMonoidHom. Its exact BFSS closure adds
only the one new source module. The independently authored consumer imports
only the candidate source. No donor Clifford/Fock package is recovered.

At Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 the following interfaces
were inspected before implementation:

| File / Git blob | Inspected contract |
| --- | --- |
| Topology/Algebra/ContinuousMonoidHom.lean / 9964093026c16aad055213171fe220519a135177 | ContinuousMulEquiv extends MulEquiv and Homeomorph; mk takes the explicit MulEquiv and two continuity witnesses; symm, apply_symm_apply and symm_apply_apply retain the underlying functions |
| Algebra/Group/Equiv/Defs.lean / ffd737f90f10e5d50aed54fd44ac9c958eb5438d | The MulEquivClass to MonoidHomClass instance supports the consumer's native identity, multiplication and inverse checks |

The entrywise continuous_pi/continuous_apply composition and subtype_mk
patterns already occur in the pinned, qualified original source closure.
The consumer's last coordinate uses the qualified explicit finite equality
Fin.last 8 = (8 : SpaceIndex), rather than assuming definitional equality.
No deprecated alias, guessed dependent scalar family, new mathematical
hypothesis or proof resource override is introduced.

## 4. Independent consumers and adverse cases

Twenty-six separate examples check the exact public carrier, literal forward
and inverse functions, toMulEquiv/toHomeomorph projections, both continuities,
both native inverse identities and native identity/multiplication/inverse laws.
They check forward and inverse matrix carriers, every original vector's first
eight components and the inverse's literal ninth component without a zero-axis
premise. Explicit typed carrier equalities transport matrix/vector statements.

The actual original negative central Clifford value remains -1 and distinct
from the source identity, although its target and coordinate image are identity.
The exact source two-sign kernel is checked through the new equivalence.
Perpendicular e0e1 reconstructs its same actual target; mixed e0e8 remains outside
the point stabilizer. The candidate cannot replace the point stabilizer with
the axis-line stabilizer or promote target faithfulness to source injectivity.

## 5. Preserved evidence-staging defect and prospective guard

Successor workflow review discovered that the qualified extension workflow's
push-path filter and early proposed-input tar named the older RESTRICTION
manifest. Its actual runner/preflight used the correct EXTENSION manifest,
and its complete successful artifact independently contained that correct
manifest, all 167 pinned inputs, all logs and the full PASS receipt. Those
verified bytes support the qualification. The defect concerns early staging
and the manifest-only push trigger; it is not a new mathematical failure.
See the [preserved qualification caveat](BFSS_SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EXTENSION_GATE_2026_11_08.md#early-input-manifest-staging-caveat-discovered-during-successor-review).

Do not edit the qualified workflow or its control pins in this successor.
The new workflow names its OWN EQUIVALENCE manifest in both places. A small
preflight check enforces these two path identities in the controlled workflow
template, without a new YAML dependency. Two regression tests check a valid
template and reject the inherited wrong manifest in the push path, tar input
or both. The exact old workflow is also rejected by this guard when checked
against its intended extension manifest; the new workflow passes. This is a
template identity check, not a general YAML or shell security validator.

The ten inherited strict-output tests remain unchanged. The new gate therefore
has twelve validator tests; report parsing, compiler invocation, environment
verification, cold object removal and proof budgets are unchanged. The guard
strengthens preflight and does not waive any existing acceptance requirement.

## 6. Exact verification inventory and next boundary

The manifest pins 125 original ancestors, eleven qualified source modules,
one new source, one independent consumer and 30 controls: 138 cold builds and
168 exact input pins. Acceptance requires all 26 examples, 137 ordered strict
root reports, thirteen exact markers and a complete retained PASS receipt.
All 42 package revisions and Lean 4.34.1 remain pinned. Only propext,
Classical.choice and Quot.sound are permitted. The prior consumers retain
their own exact qualifications; no prior source or control bytes are changed.

Limits remain 600 seconds per compiler file, 35 minutes for restoration,
70 minutes for the cold build and 110 minutes for the job. Mathlib dependency
restoration is unchanged and every controlled BFSS object is removed before
compilation. No BFSS proof-object cache, linter waiver or budget increase.
Static preflight, all twelve validator tests and Python/YAML/bash checks pass.
These are static checks; no local Lean compilation is claimed.

Submit one full strict run at its exact candidate commit. Reject any compiler
failure even if imported root reports and a completion marker print cleanly.
On red, preserve the first actual failing boundary and phase; freeze compiling
components, inspect the complete pinned interface and obtain a typed reproducer
before a near-identical retry. Never substitute a different group or add an
assumption to force acceptance. Do not poll CI; the owner supplies the verdict.

After independent qualification, the single next bounded milestone is transport
of the already qualified original two-sheeted covering through this exact
target homeomorphism to actual coordinate SO(8), preserving the original source
map, kernel and action binding. That composition is not established here.
Source Spin(8) classification, common torus/root conventions and branching,
Fock actions, closed domains, coercivity and spectral existence remain separate.
