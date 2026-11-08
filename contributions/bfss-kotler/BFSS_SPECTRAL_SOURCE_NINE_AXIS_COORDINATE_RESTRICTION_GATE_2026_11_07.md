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


## Diagnostic red #42459708602 — dependent-family failure isolated

Run [#42459708602](https://github.com/etblink/math/actions/runs/42459708602)
is RED at exact tested commit d0d3ee16d0deecc3a1d76e8f51eac78047771627.
The archive [13608918861](https://github.com/etblink/math/actions/runs/42459708602/artifacts/13608918861)
was downloaded, CRC-checked and rehashed at ZIP SHA-256
322dccaa49dae5ae44d6791db2436ca41045a816e7878e74a94a5e6abcbc7a27.
The archived tested SHA, diagnostic Git blob/SHA-256, workflow Git blob,
toolchain pin, 42-package lock, source hash listing, compiler exit 1 and
ordered nine root reports were checked. The diagnostic log SHA-256 is
feb04fa2af5ed6fab760157c4caa7178bf9d13af4ab01951b9ef9e5f9c3610cd.
The [rejected diagnostic record](evidence/source-axis-stabilizer-2026-11-07/diagnostic-failure-42459708602.json)
preserves the complete compiler output and all eight retained-file hashes.

There are exactly three direct errors, at diagnostic lines 48, 75 and 121.
Adding the explicit scalar value was insufficient: the dependent codomain
family of Pi.single_eq_of_ne remained a metavariable, so even the real value
1 was rejected against an unresolved family applied to coordinate 8.
Five root reports contain only permitted axioms; the two zero-entry roots
and downstream orthogonality/determinant roots contain recovery sorryAx.
Neither those five reports nor the completion marker qualifies this failed
diagnostic. This is the same unresolved dependent-family interface, not a
new mathematical counterexample, import failure or resource timeout.

The third-red stop condition was applied before any further run: inspect
the first failure and the FULL pinned declaration context rather than add
another guessed argument. Pinned Mathlib Algebra/Notation/Pi/Basic.lean,
blob 1f0d6aa8e4dcc65dbd97ecc3739192f740c1fbc6, first declares the DEPENDENT
family M : index -> Type and the generated single_eq_of_ne theorem. Later
it provides a NONDEPENDENT single_apply identity for an actual scalar type:
a fully typed singleton value at j equals if j = i then x else 0.
The file explicitly discusses nondependent specialization and dependent
congruence pitfalls. The current diagnostic already uses this scalar
single_apply interface elsewhere.

Change the proof route at those THREE sites: retain the explicit original
real-vector ascription and rewrite Pi.single_apply followed by if_neg with
the already proved literal-index inequality. This eliminates the dependent
singleton-lemma application instead of retrying its family inference.
Preserve all nine diagnostic theorem types, reports, imports, workflow,
warning-as-error and proof budgets. A single bounded diagnostic can now
discriminate this concrete scalar rewrite; it is not a rerun of the original
full strict gate or a claim that the revised proofs already compile.

The original source remains blob 1f9e3dec2502446d3a95d138583c0bc400eb717c.
Its fourteen declaration types, twenty-six independent propositions, manifest,
strict runner/workflow, accepted ancestors and mathematical assumptions stay
frozen. No new Lean source dependency or global instance is introduced.
On diagnostic success, verify retained evidence before transferring checked
proof shapes. On another red, inspect the next precise failure and do not
return to blind argument-annotation retries. No original source theorem is
qualified by this diagnostic repair.


## Diagnostic red #42460938380 — singleton conversion resolved; Core alias rejected

Run [#42460938380](https://github.com/etblink/math/actions/runs/42460938380)
is RED at exact tested commit d4ee137126c619190ceab849b04cb32c7fb63ccd.
Its sole direct diagnostics are the three if_neg deprecation errors at
diagnostic lines 48, 75 and 121. The previous dependent-family/type errors
are gone. All nine root reports contain only permitted axioms, with NO
recovery sorryAx. Nonetheless compiler exit 1 and warningAsError correctly
reject the diagnostic; no original source theorem is qualified.

I introduced the deprecated Core alias in the scalar-rewrite repair. The
pinned Lean compiler source was inspected before the replacement: at Lean
commit 5045d0056413266e57c625dcd7c365b10e377c52, src/Init/Core.lean,
Git blob d55190c7a9f9de89bc671813e643a22b016bfb39, ite_eq_right takes the
same non-equality proof and states the same right-branch equality. The
old if_neg theorem is explicitly deprecated since 2026-07-21 and its
body is ite_eq_right applied to that proof. Replace only those THREE
identifier references; retain the scalar rewrite, all nine diagnostic
types, imports, reports, workflow and default proof limits.

The rejected artifact
[13609329872](https://github.com/etblink/math/actions/runs/42460938380/artifacts/13609329872)
was downloaded and CRC/SHA-256 verified at
5467f9b3490258bc23b7f186c050871764658c0ec15277ba5abc9e144e64ea08.
The archived tested SHA, diagnostic/workflow Git blobs, diagnostic hash
listing, toolchain, 42-package lock, compiler exit and ordered nine
reports were checked. Full compiler output and all eight retained-file
hashes are preserved in the
[rejected diagnostic record](evidence/source-axis-stabilizer-2026-11-07/diagnostic-failure-42460938380.json).
The reports without recovery are useful first-cause evidence, not an
accepted diagnostic outcome or a complete strict source/consumer receipt.

This is an exact alias correction supported by the pinned Core declaration,
not another dependent-family annotation attempt or a relaxation of warnings.
The interface checklist must cover Lean Core names as well as Mathlib,
including familiar proof lemmas. Preserve all earlier red verdicts.

Original source blob 1f9e3dec2502446d3a95d138583c0bc400eb717c, its fourteen
public types, twenty-six independent consumer propositions, manifest,
strict runner/workflow, accepted ancestry, environment pins and budgets
remain unchanged. Submit only the bounded diagnostic. A diagnostic green
would still require retained-evidence review followed by a separately
justified proof-body transfer and full strict original-source qualification.

## Diagnostic pass #42461564621 — checked source-interface transfer, not full qualification

The bounded original-coordinate Mathlib diagnostic [run #42461564621](https://github.com/etblink/math/actions/runs/42461564621) completed **GREEN** at exact tested commit `c800a96899a9e7597b78903891a07bd6401917f7`. Artifact [13609569230](https://github.com/etblink/math/actions/runs/42461564621/artifacts/13609569230) was downloaded, ZIP/CRC checked and independently SHA-256 verified as `d71e6eee5b896c3b06b16b91f82a5e1f17c467654fdaf51cf53f932a7de2f80e`. The archived `tested-sha.txt`, diagnostic SHA-256 listing, Lean 4.34.1 toolchain and 42-package Mathlib lock match the intended run. Compiler exit was 0, the exact diagnostic completion marker was emitted, and all nine explicit root axiom reports contain only `propext`, `Classical.choice` and `Quot.sound`, with no recovery `sorryAx` or Lean file-line errors or warnings. Compiler-log SHA-256: `e4c0bd76a16120211db754af7ea682b3d54151f409df96c21d92fcd55a9c8b1`. See [scoped diagnostic acceptance](evidence/source-axis-stabilizer-2026-11-07/diagnostic-acceptance-42461564621.json).

**Evidential boundary:** This is a Mathlib-only nine-lemma diagnostic, not a qualification of the actual original BFSS source, all fourteen theorem roots, twenty-six independent consumers or the complete 136-module cold strict gate. Historical red artifacts #42454470502, #42456290249, #42456930099, #42459708602 and #42460938380 remain rejected and archived.

**Bounded follow-up:** Transfer only the diagnostic-proven source proof patterns into the literal original-source coordinate restriction file: explicit equality of Fin.last 8 with original coordinate 8; same-index matrix column and orthogonality-derived row; typed scalar Pi.single and nondeprecated `ite_eq_right`; castSucc zero cross entries; eight/nine-dimensional identity entry transport; explicit determinant-minor cancellation; and `Matrix.one_apply` with `Fin.castSucc_inj` for the bundled identity. One private coordinate lemma is added; all 14 public original theorem statements, ordered original coordinate inclusion, 26 consumer propositions, independent audits, strict controls, import list, environment pins, workflow and resource limits are preserved. Only the candidate source Git blob/SHA-256 pins are updated in the unchanged manifest.

Proposed repaired candidate source Git blob `7df84b75d2d18fca18cc34e515359aa70e994cb0`, SHA-256 `6cfa55ae2108bcce60db1f50cff6911ad83f87e4dee5159ee8119f569378d9ac`. A new strict run must compile all original/accepted ancestors, repaired source and untouched independent consumer before accepting the mathematical result. No proof-limit increase, source topology change, new axiom, global instance, cache or claimed SO(8) inverse equivalence is authorized.

## Strict red #42462519467 — source accepted by compiler; one independent-consumer rewrite failure

[Strict run #42462519467](https://github.com/etblink/math/actions/runs/42462519467) is **RED** at exact tested commit `b6ba566d1cd1a4ca58bd2d7c9e238aa571be302b`. Source-closure preflight, pinned Lean/Mathlib environment and all **134 inherited source modules** passed. The repaired, unchanged-original-carrier coordinate source itself compiled successfully, printing 14 permitted-axiom root reports and its source completion marker. The independent consumer alone failed at line 75: `rw [source9Axis8Target_lastColumn]` could not match the theorem's private matrix abbreviation under Lean's implicit transparency against the independently authored `M A` abbreviation. Compiler recovery did not license acceptance; the receipt remains `INCOMPLETE` (135/136 actual compiler exits zero).

The retained run artifact [13610389459](https://github.com/etblink/math/actions/runs/42462519467/artifacts/13610389459) was downloaded and CRC-verified. Its ZIP SHA-256 `d3de271bb7d952ecc945a1af90ffafd9fed3469a58af8707d86793e1cd0a819d` matches GitHub's artifact digest. See [the scoped rejected evidence record](evidence/source-axis-stabilizer-2026-11-07/strict-failure-42462519467.json). The source proof success is *component evidence* but not a qualified strict gate and never retroactively promotes the red run.

Apply the frozen-source consumer-repair procedure from the [process optimization memorandum](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md): **do not change one byte of the now-compiling source**. In the existing bottom-right-axis consumer example, replace only the tactic rewrite with a typed `calc` whose first equality is `source9Axis8Target_lastColumn A (Fin.last 8)` and whose second is `norm_num [source9CoordinateVector]`. The same source theorem was already used successfully by the consumer's immediately preceding example. This changes no proposition, no mathematical source, no independent negative example, and no verified ancestor; only the consumer proof and its two integrity pins change.

Proposed consumer blob `7ad094b0b245149338c6c6579393dc3581d64853`, SHA-256 `cf007e0f263bd2033ab316e8b1c1ea953e7c3dbc0a27a18cdf221d73ce4b8924`. Maintain all 26 independent propositions and the original source blob `7df84b75d2d18fca18cc34e515359aa70e994cb0`. No new imports, modified strict runner, suppressed compiler error, altered axiom policy, heartbeat increase, cache or mathematical theorem weakening. The correction is proof-engineering hypothesis until a **fresh full strict run** passes source, consumer, all roots, and receipt.


## Strict red #42464034784, attempt 1 — pinned-toolchain HTTP 504

Run [#42464034784](https://github.com/etblink/math/actions/runs/42464034784)
at exact tested commit 3085d66bcd22972d1455582d1c8b6fa52e3b5768 failed
during environment restoration. Source-closure preflight and all ten
adversarial validator tests passed. The pinned Lean 4.34.1 binary download
from releases.lean-lang.org returned HTTP 504. The cold source/consumer
compilation step was SKIPPED: zero Lean compilations, no compiler receipt
and no newly tested consumer result. This is an infrastructure failure,
not evidence of a source or consumer proof failure. The earlier elan
self-update warning is retained; the fatal download 504 is the first
causal failure preventing compilation.

Artifact [13611500084](https://github.com/etblink/math/actions/runs/42464034784/artifacts/13611500084)
was downloaded and ZIP/CRC verified at SHA-256
aca1a51038db96d59e684b92270165e7686eceeb76f5e2a0d72026665cdbd1db.
It contains the tested SHA and nine proposed input files in the input
archive. All eight applicable archived input Git-blob/SHA-256 pins were
checked against the retained manifest; the ninth file is that manifest
itself. The toolchain pin and 42-package lock were retained and checked;
no installed environment is claimed after a failed restoration.
The source remains blob 7df84b75d2d18fca18cc34e515359aa70e994cb0 and
the consumer remains blob 7ad094b0b245149338c6c6579393dc3581d64853.
See [the environment failure record](evidence/source-axis-stabilizer-2026-11-07/environment-failure-42464034784-attempt-1.json)
for all retained input hashes, decoded job-log digest and causal log excerpt.

Do not modify Lean proofs, dependency pins, workflow, restoration timeout,
proof budgets, warning policy or cache behavior to address this isolated
download failure. GitHub accepted one request to rerun the failed job
of the SAME run at the SAME tested commit. This retries the complete strict
procedure, including restoration and fresh controlled source/consumer
compilation; it does not reuse a successful proof result from this attempt.
The historical attempt remains rejected. Await the owner's report of
the retry outcome without polling. No new mathematical qualification follows
from an accepted rerun request.


## Strict red #42464034784, attempt 2 — final consumer scalar conversion

The owner's reported retry is **RED** at the same tested commit
`3085d66bcd22972d1455582d1c8b6fa52e3b5768`. Unlike attempt 1, the
environment restored successfully. All 134 inherited modules and the unchanged
fourteen-root source compiled. The independent consumer alone failed at
line 78 with `Pi.single 8 1 (Fin.last 8) = 1`. Its preceding typed
matrix-to-coordinate equality now succeeds; the final normalization step
was incomplete. Imported source-root reports and the printed marker do not
qualify an anonymous consumer with compiler exit 1. The receipt remains
`INCOMPLETE`, with 135 of 136 compiler exits zero.

Artifact [13620159781](https://github.com/etblink/math/actions/runs/42464034784/artifacts/13620159781)
was downloaded and ZIP/CRC verified at SHA-256
`49a3dbdbed792e2bbd2f2e5d09dd0c74617ceb05e092b9390db4814a5979b0d5`.
All 166 archived input pins, 136 ordered log digests, ten successful
report/marker sets and 42 installed dependency revisions were checked.
The [rejected attempt-2 record](evidence/source-axis-stabilizer-2026-11-07/strict-failure-42464034784-attempt-2.json)
preserves the actual consumer error and the source's component success.
No archived object binaries were available for independent rehashing.

The [causal review and implemented recovery plan](BFSS_COORDINATE_RESTRICTION_ATTEMPT_REVIEW_AND_RECOVERY_PLAN_2026_11_08.md)
compares this sequence with the evergreen, recent procedural review and
V9Z/F10BY/F10DF recoveries. It records an avoidable procedural error: repairing
the first calc equality without explicitly checking the final index conversion.

Keep source blob `7df84b75d2d18fca18cc34e515359aa70e994cb0` fixed.
Replace only the final proof in the existing consumer example with:
a checked equality `Fin.last 8 = (8 : SpaceIndex)`; a typed real
singleton same-coordinate equality using pinned `Pi.single_apply` and
nondeprecated Core `ite_eq_left`; and `congrArg` transport through
the actual original coordinate function. All 26 consumer propositions,
imports, root inventories, original carriers/actions, accepted ancestry,
workflow, runner, dependency pins and proof budgets remain unchanged.

Proposed consumer blob `14317fec3f6034baa870f5dbe436587e214157e6`,
SHA-256 `f64aced066d6d56aafad5eb44bb45d32d701aa365432edecf9a39aca9723ae9a`.
Only its two manifest integrity fields change. Static source-closure preflight
and all ten validator tests pass in the reconstructed pinned closure. These are
static checks, not local Lean compilation or mathematical qualification.

Submit one complete unchanged strict procedure at the new tested commit.
Accept only all 136 cold builds, all 26 consumers, 121 strict reports,
eleven markers and a complete receipt with the permitted axioms and no
unexpected warnings. If the same scalar/index boundary persists, stop full
retries and obtain a minimal working typed reproducer. Do not poll CI.
No SO(8) inverse, Spin(8) classification or physical assertion follows here.



## Qualification 42491448288

The owner reported strict run [42491448288](https://github.com/etblink/math/actions/runs/42491448288)
GREEN. Independent retained-evidence review qualifies the coordinate restriction
at exact tested commit `b4bf6de6572b4686d7858b204032698d1e928621`.
Artifact [13621543227](https://github.com/etblink/math/actions/runs/42491448288/artifacts/13621543227)
was downloaded, ZIP/CRC checked and independently SHA-256 verified as
`1b7429b11c353859ce3a60e19de597f8c8fd67266e1daa793d03839f2968eb29`.
The complete PASS receipt hashes to
`2cd12ee7ef1dea5dead4b1efb57413b88b7b6529634e402980a599cc85d1d8ce`.
See [the scoped machine-readable qualification](evidence/source-axis-stabilizer-2026-11-07/qualification-42491448288.json).

All 136 cold compiler exits are zero. Review verified 166 exact input Git/SHA-256
pins, all 136 ordered compiler-log digests, all 26 independent examples,
121 strict axiom reports, eleven completion markers, the pinned Lean compiler
identity and all 42 installed package revisions. No compiler warning/error or
recovery axiom occurs. All audited roots use only propext, Classical.choice
and Quot.sound. Object/compiler binary hashes are retained receipt records;
archived binaries were not supplied for independent rehashing.

The source remains blob `7df84b75d2d18fca18cc34e515359aa70e994cb0` and the
qualified consumer is blob `14317fec3f6034baa870f5dbe436587e214157e6`.
The earlier strict and diagnostic reds remain rejected. The final repair's
explicit finite-index equality and typed scalar singleton evaluation close the
previously incomplete consumer calc chain, without changing any proposition,
source theorem, carrier, topology, dependency, strict control or proof budget.

**Qualified scope:** the actual original fixed-axis SO(9) subgroup has its
coordinate-exact faithful continuous group homomorphism into SO(8), on original
labels 0 through 7, with determinant and arbitrary-original-vector action
bindings. Surjectivity and an inverse are not included in this qualification.

**Next single bounded gate:** construct the raw original-coordinate extension
`diag(B,+1)` for arbitrary B, establish its orthogonality, raw determinant and
fixed-axis identity before bundling SO(9)/H membership, then prove restriction
and extension are inverse on their actual carriers. Surjectivity follows.
Do not use an H-only determinant theorem to establish initial H membership.
Full topological group equivalence, source Spin(8) classification, common torus
and branching, Fock action, physical domains, coercivity and spectral existence
remain separate obligations. The owner authorizes progression after each
verified qualification without a separate continue instruction; CI is not polled.
