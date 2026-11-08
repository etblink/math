# Original fixed-axis target: coordinate SO(8) restriction gate

Status: CANDIDATE, pending complete strict source and independent consumer qualification.
Exact parent: `51db118b6f54a11f5307a015f4e672433fbe6fa3`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

## Decision and exact staging boundary

The original source stabilizer's two-sheeted covering of the actual fixed-axis
SO(9) subgroup qualified at tested commit
`f47dd34b869a1aec39e95a2ccb852f4ba67f5b22`, strict run
[42452043377](https://github.com/etblink/math/actions/runs/42452043377).
The next research milestone is coordinate-exact identification of that target
with SO(8). Its first unqualified source interface is proving that the literal
upper-left eight-coordinate block is itself in SO(8), with the right product
and original vector action.

Isolate that interface first. This gate proposes a faithful continuous group
homomorphism H -> SO(8), where H is EXACTLY the already qualified
source9Axis8MatrixStabilizer. It does not propose surjectivity or an equivalence.
The inverse diagonal embedding and its two-sided/continuous inverse proofs are
the single next bounded gate after this restriction qualifies. This staging
preserves the full equivalence objective while making its new algebraic
boundary independently reviewable before composing additional interfaces.

## Literal coordinates and theorem statements

In FCP.BFSSSourceNineAxisCoordinateRestriction, use the actual H subgroup of
Matrix.specialOrthogonalGroup SpaceIndex Real, where SpaceIndex is Fin 9.
For i : Fin 8, the inclusion is the original ordered Fin.castSucc i. It sends
coordinate 0 to 0 and coordinate 7 to 7; no basis permutation or triality choice
is made. Define only the actual submatrix:

```lean
source9Axis8CoordinateBlock (A : source9Axis8MatrixStabilizer) :
    Matrix (Fin 8) (Fin 8) ℝ :=
  (((A : Matrix.specialOrthogonalGroup SpaceIndex ℝ) :
    Matrix SpaceIndex SpaceIndex ℝ)).submatrix Fin.castSucc Fin.castSucc
```

The fourteen proposed public roots give the actual last column and row,
their vanishing cross entries, this block definition, orthogonality,
determinant equality/one, multiplication, and the following main interfaces:

```lean
source9Axis8CoordinateRestrictionHom :
  source9Axis8MatrixStabilizer →*
    Matrix.specialOrthogonalGroup (Fin 8) ℝ

source9Axis8CoordinateRestrictionHom_injective :
  Function.Injective source9Axis8CoordinateRestrictionHom

source9Axis8CoordinateRestrictionHom_continuous :
  Continuous source9Axis8CoordinateRestrictionHom
```

The exact entry theorem binds output (i,j) to the ORIGINAL matrix entry
(i.castSucc,j.castSucc). The vector-action theorem applies to EVERY original
nine-vector z, without a source-attainment or perpendicular-vector premise:

```lean
((source9Axis8CoordinateRestrictionHom A : Matrix (Fin 8) (Fin 8) ℝ).mulVec
  (fun j : Fin 8 => z j.castSucc)) i =
  (((A : Matrix.specialOrthogonalGroup SpaceIndex ℝ) :
    Matrix SpaceIndex SpaceIndex ℝ).mulVec z) i.castSucc
```

All roots are unconditional on these literal carriers. The parameter A : H
contains its ACTUAL original fixed-axis membership. No new orthogonality,
determinant, invertibility, continuity or source-generation premise is assumed.
H and standard SO(8) retain their existing matrix subtype topologies. No PBW
instance registration or new topology is needed in this matrix-only gate.

## Proof and pinned interfaces

1. Original H membership fixes the original coordinate vector e8. The qualified
   Matrix.mulVec_single_one and explicit Matrix.col_apply convert this to the
   literal last column. No opaque matrix column is treated as a reducible entry
   without its explicit interface.
2. From A-transpose times A = identity, inspect entry (8,j). Replace the first
   factor by the known last column, and use single_dotProduct to obtain the last
   row. Fixed last column alone would not justify the row conclusion.
3. Expand block orthogonality by entries and split ONLY the original nine-index
   sum using the explicitly typed Fin.sum_univ_castSucc function. Its last-row
   term vanishes. The eight-index sum is precisely the original upper-left block.
4. Expand det(A) along the actual last column with Matrix.det_succ_column.
   Only row 8 survives; the sign (-1)^(8+8) is +1. The deleted-axis minor is the
   exact castSucc submatrix, by Fin.succAbove_last. Original determinant one
   therefore gives block determinant one.
5. For A,B : H, split the ORIGINAL matrix-product sum. The cross-block term
   vanishes because the last column above the axis is zero. This proves
   multiplicativity on H, not on arbitrary matrices.
6. Bundle the actual block in standard SO(8). Equality of its entries, together
   with both fixed row/column formulas, recovers every original matrix entry;
   use Fin.eq_castSucc_or_eq_last, preserving ordered coordinates.
7. Continuity is the double subtype projection followed by the pinned
   Continuous.matrix_submatrix and explicit subtype construction. The action
   companion uses the same typed sum split and vanishing last-column term.

Pinned Mathlib revision: `d13f23b723b8a846827a245b89c10fc7d3f11612`.

| Inspected source | Git blob | Relevant interface |
| --- | --- | --- |
| LinearAlgebra/UnitaryGroup.lean | `2bc60a3c9927cdbf9c28371d1b4e9f66b7447583` | Actual SO membership and explicitly instantiated transpose orthogonality |
| LinearAlgebra/Matrix/Determinant/Basic.lean | `66f8b885e8ce08fecc06336d6a26d5eff6c15aa6` | det_succ_column with exact row/column minor order |
| Data/Fin/SuccPred.lean | `25a960243cc9bc2cfb7c59662de33e40e3ede29c` | castSucc_ne_last, eq_castSucc_or_eq_last, succAbove_last |
| Algebra/BigOperators/Fin.lean | `0925d3fd11f19650de9a7f095870f5d1382ff44a` | sum_univ_castSucc generated from the inspected product theorem, remaining sum FIRST |
| Topology/Instances/Matrix.lean | `13c038a9628a9a641cd8dff30d79c52506d2b847` | Continuous.matrix_submatrix |

Use the previously qualified explicit Matrix.col_apply and single_dotProduct
interfaces and the source's actual e8 normalization. Do not substitute an
abstract eight-dimensional module or a Fock-vector representation.

## Adversarial findings and independent consumers

An exact rational-arithmetic research check gives a concrete obstruction to
unrestricted block shortcuts. Let R be identity on coordinates 1 through 7,
with the (0,8)-plane block [[0,-1],[1,0]]. Then R-transpose R is identity and
det(R)=1, but R e8=-e0, so R is not in H. Its upper-left eight-block has
determinant zero. Moreover block(R*R) has entry (0,0)=-1, whereas
block(R)*block(R) has entry (0,0)=0. Thus even an arbitrary SO(9) matrix does
not give an SO(8) block or a multiplicative block restriction. This finite
check is research evidence, not a new Lean-qualified counterexample declaration.
A perpendicular (0,1)-plane quarter-turn independently satisfies the expected
fixed-axis block determinant and product identities in exact arithmetic.

The 26 independent Lean examples check the literal H carrier, both fixed
row/column formulas and vanishing cross entries, the bottom-right value 1,
the exact original block entries, orthogonality, determinant equality/one,
block multiplication, homomorphism entry, injectivity, continuity, identity,
multiplication, inversion, and recovery of original matrices from image equality.
They check the vector formula both on arbitrary original z and on every
original source stabilizer element through the qualified projection.

The actual negative central source still has Clifford value -1 and remains
distinct from identity while its coordinate vector image is identity. An
independent composed-kernel consumer retains the original two-sign kernel;
faithfulness of H -> SO(8) is not confused with faithfulness of the original
Spin vector representation. Perpendicular e0e1 has an exact coordinate image,
and mixed e0e8 is rejected from the source stabilizer. Their helper proofs are
copied byte-for-byte from the already qualified projection consumer, including
the explicit Q-unit self-polar repair. An arbitrary raw SO(9) matrix with its
actual fixed-axis proof tests the coordinate interface without source attainment.

## Exact closure and strict procedure

Import only the qualified original algebraic projection source and the four
inspected Mathlib modules. The exact reachable original closure is the same
125 original modules plus nine qualified inherited sources: Lipschitz,
orientation, reflection, unit Cartan, even-list lift, signed word, arbitrary
target bridge, fixed-axis target preimages and the algebraic projection.
The already qualified covering/topology modules remain unchanged and are not
re-imported to prove this smaller independent matrix-coordinate interface.

The two new modules make 136 cold builds, with 166 exact input pins,
121 strict axiom reports and eleven completion markers. Preserve all 27 shared
environment controls; replace only the new runner, validator test and workflow
pins. All ten inherited adversarial output tests remain. Every inherited source
and dependency pin is immutable; no new donor reconstruction is introduced.

Preserve Lean 4.34.1, Mathlib and all 42 package revisions, action pins,
warningAsError, default proof budgets, 600 seconds per file, 70 minutes for cold
compilation, 35 minutes for restoration and the 110-minute job. Remove all
controlled BFSS proof objects before compiling the complete ordered closure;
retain all exact proposed inputs, compiler logs, compiler/environment digests,
package revisions and receipt on either outcome. Only propext, Classical.choice
and Quot.sound are permitted axioms. No linter waiver or BFSS proof-object cache.

Local Lean startup remains unavailable in this execution environment. Static
preflight and syntax/validator tests do not qualify the Lean proofs. Qualification
requires a complete strict source and independent consumer PASS at one exact
tested commit with retained evidence. Confirm creation of one run, then await
the owner's terminal report without polling its result. On red, preserve and
classify the earliest causal diagnostic before any bounded repair.

## Acceptance boundary and single next milestone

Reject a changed axis, relabelled inclusion, false generic submatrix hom,
lost determinant sign, omitted last-row argument, collapsed original central
sign, mixed-axis membership, added mathematical premise or diagnostic/recovery
axiom. No proof resource increase may conceal a failure.

This candidate establishes only the forward faithful continuous coordinate
restriction if it qualifies. Its inverse diagonal embedding and the resulting
two-sided continuous group equivalence are the single next milestone. Do not
claim surjectivity, homeomorphism or transport the covering to standard SO(8)
from this gate alone. Spin(8) classification, source torus/root data, B4/D4
branching, Fock-operator action, physical domains, coercivity, confinement and
spectral existence remain separate obligations.


## Run #42454470502 — RED; diagnostic-first source-interface isolation

The exact tested commit b07f2799853cc4f9665eeb73b67add4c9bf04e98 failed [strict run #42454470502](https://github.com/etblink/math/actions/runs/42454470502). All **134 original and accepted inherited modules** compiled successfully after strict source-closure preflight and pinned environment restoration. The **new coordinate source** failed; independent consumer never ran. The archive is artifact 13606469514, independently downloaded ZIP SHA-256 3cd510fefbe2f1bcc28e4015741abe0e95f0673687e7dc6387fc5dc1d903d183, with an INCOMPLETE receipt and no accepted proof result.

First actual diagnostics in new source are at lines 41, 49–50, 56, 63, 81, 96, 98 and 131: literal coordinate 8 versus Fin.last 8, Pi.single type inference, matrix multiplication sum versus dot-product expression and transposed equality, identity entry transport between 9x9 and 8x8 matrices, final-column determinant sum branch, unused simp argument, and ineffective map_one simp. Recovered sorryAx reports and the source completion marker are rejected. There is no verified mathematical counterexample and no source root qualified by this run. Workflow environment/setup/manifest pins passed; this is a **source interface** failure, not cache or runtime failure.

Per [the scoped procedural optimization memorandum](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md) and pinned Mathlib:

- Pin and inspect Matrix.single_one_dotProduct, Matrix.mulVec_single_one, Matrix.col_apply, Matrix.one_apply and Matrix.submatrix_one; Fin.castSucc_ne_last, Fin.castSucc_injective, Fin.succAbove_last and Fin.sum_univ_castSucc; Matrix.det_succ_column. Their actual declarations occur in pinned Data/Matrix/Mul.lean, Data/Matrix/Diagonal.lean, Data/Fin/SuccPred.lean, Algebra/BigOperators/Fin.lean and LinearAlgebra/Matrix/Determinant/Basic.lean.
- **First test in a minimal independent Mathlib-only diagnostic**, not another full 134-ancestor build. Proposed diagnostic file: lean/diagnostics/BFSSSourceNineCoordinateInterfaceDiagnostic.lean; workflow: .github/workflows/bfss-source-nine-coordinate-interface-diagnostic.yml. It tests the same original-index row/column, exact identity, orthogonality and last-column determinant conversions, *only conditionally* proving mathematical helper examples.
- Preserve the actual candidate's 14 public theorem types, full source bytes, 26 consumer propositions, all accepted ancestors, unchanged original source carrier/topology, frozen manifest, compiler/dependency pins, and strict workflow **while diagnostic outcome is unknown**.
- A diagnostic PASS does **not** qualify original source or consumer. Only then assess a proof-body-only correction to the strict source, refresh its candidate-only Git-blob/SHA-256 integrity pins and require a fresh complete strict source+consumer run. If the diagnostic fails, inspect its first causal error; do not run another full gate on unverified guesses.

No proof-budget escalation, relaxed linter/axiom guard, source substitution, global typeclass change, new cache or Spin(8) classification is introduced. The diagnostic source and workflow are distinct from the exact strict candidate's watched paths.

## Diagnostic red #42456290249 — first-cause import and bounded diagnostic repair

[Run #42456290249](https://github.com/etblink/math/actions/runs/42456290249) tested exactly ad1c727926a2eb916488352aca704f3897b8a68d, concluded RED, and is NOT ACCEPTED. Its pinned preflight and environment restoration passed. Retained artifact 13608046814 has independently rehashed ZIP SHA-256 927d282c5b68b44b225334e87c702d97f98587a777b2ee4e078ce04cea85db7f, with failed compiler exit 1, diagnostic errors, and recovery sorryAx.

First causal failure: Unknown identifier for real-number notation at diagnostic line 22. The minimal Mathlib imports omitted real scalar notation and instance infrastructure. Pinned Mathlib Basic/Real/Basic.lean defines the real-number notation, and the prior qualified structural diagnostic imports Analysis/InnerProductSpace/PiL2.lean to provide a full working real scalar context. Add both exact nondeprecated imports to the exploratory diagnostic only. Subsequent OfNat matrix failures, ill-formed dependent Pi.single expressions and sorryAx reports are not mathematical counterexamples.

Two independent diagnostic proof-shape errors are also explicit in the log: Fin.castSucc_injective needs the dimension argument 8 when supplied to Matrix.submatrix_one; and the determinant-minor simp only [Fin.succAbove_last] completely closed the goal, leaving an extraneous rfl. Replace two fragile Pi.single simp expressions with explicit Pi.single_eq_of_ne; pinned Mathlib Data/Matrix/Mul.lean uses that exact lemma. These edits only alter proof of diagnostic interfaces, not BFSS source statements.

A wrapper defect is also verified directly from the artifact: the diagnostic.log begins with Lake warnings about package repositories having local changes. The previous broad warning: grep would have falsely failed a successful Lean proof. Narrow that diagnostic-only grep to compiler file/line warnings, keeping -DwarningAsError=true and rejection of compiler errors and sorryAx. The formal strict workflow is not changed.

Only one further bounded Mathlib-only diagnostic is justified by these concrete changed observations. If it fails, inspect its new first causal error rather than re-run the full 134-ancestor gate. A diagnostic green is exploratory and never qualifies original BFSS theorems. The original candidate source remains blob 1f9e3dec2502446d3a95d138583c0bc400eb717c; its 14 theorem statements, 26 consumer propositions, manifest, strict workflow and qualified ancestors are byte-identical.

## Diagnostic red #42456930099 — exact value-argument failure

Run [#42456930099](https://github.com/etblink/math/actions/runs/42456930099) is RED at exact tested commit f8f08f5ab1ee3df8ab2260fe448fb2f0b86e59dc. Preflight and pinned Lean/Mathlib restore passed. Artifact 13608351659 was downloaded and ZIP-verified at SHA-256 52ade0ca1688263d181d94e973c56e0731f945e1d915a5a1338dc2ec609b5c0c, matching GitHub. The retained compiler exit is 1; the output preserves all three error locations and recovery reports. The missing real-number notation in the previous diagnostic run is now resolved.

The **only direct source diagnostics** are at diagnostic lines 48, 75 and 121. All three invoke Pi.single_eq_of_ne with just a non-equality proof, omitting the theorem's **explicit value parameter**. In the pinned Mathlib/Algebra/Notation/Pi/Basic.lean, the additive Pi.single_eq_of_ne theorem is generated from mulSingle_eq_of_ne with signature (h : i' ≠ i) (x : M i). The missing x leaves a dependent target family metavariable and unsolved Zero (?m i) instances. Supply (1 : ℝ) explicitly in precisely these three proof lines. Five roots printed only allowed axioms; the two directly failed roots and two downstream dependents printed recovery sorryAx and are NOT qualified.

This is a fresh specific API-argument finding after the prior missing-import red, not a repeated wrapper-only failure without information. The source/math and strict gate remain frozen; the **diagnostic alone** can be rerun to discriminate whether these three substitutions resolve all its typed Fin9/Fin8 matrix interfaces. The next diagnostic green (if any) would be exploratory only. If a third diagnostic remains red, stop further speculative compilation loops and isolate the earliest failure before any additional run. Preserve both red artifacts and the original rejected strict run #42454470502.

This correction leaves all fourteen candidate declaration types, twenty-six independent propositions, source blob 1f9e3dec2502446d3a95d138583c0bc400eb717c, frozen manifest, accepted ancestors, strict workflow, environment pin, axiom policy, warning-as-error and default proof budgets unchanged.
