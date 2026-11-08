# BFSS — Coordinate repair transfer and noncircular inverse audit

**Recorded:** 2026-11-07, America/Los_Angeles.  
**Repository:** etblink/math.  
**Inspected branch HEAD:** d0d3ee16d0deecc3a1d76e8f51eac78047771627.  
**Status:** Research and prospective proof audit only. No new Lean proof, diagnostic verdict, strict qualification or physical conclusion.

This audit follows the [procedural memorandum](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md).
The source candidate remains frozen at Git blob
`1f9e3dec2502446d3a95d138583c0bc400eb717c`. Strict run 42454470502 remains
rejected. Diagnostic repairs are distinct from original source qualification.
No owner-reported verdict for diagnostic 42459708602 was available to this audit;
CI results were not polled. Do not infer its outcome from the existence of this
document or from the current branch HEAD.

## 1. Exact transfer boundary after diagnostic success

The diagnostic at the inspected HEAD has nine conditional Mathlib-only roots.
Its latest correction supplies the explicit value `(1 : ℝ)` to three
Pi.single_eq_of_ne applications. Its arguments concern raw matrices on Fin 9
and the actual ordered Fin.castSucc inclusion from Fin 8; they are not new
premises licensed for the original BFSS theorems.

Only after the owner reports diagnostic success and its retained evidence is
verified should the corresponding proof shapes be instantiated in the original
source. Discharge fixed-axis premises by actual H membership and orthogonality
by the original matrix SO(9) membership. Preserve all fourteen public types.

| Original failing boundary | Prospective explicit transfer |
| --- | --- |
| Literal coordinate 8 versus Fin.last 8 | A checked finite-index equality, used explicitly rather than assumed definitionally |
| Dependent Pi.single family/value inference | State the full original vector type and provide the explicit real value |
| Sum versus dot product and reversed simplifier equality | Typed intermediate sum, single_one_dotProduct, and an oriented calc chain |
| Nine-dimensional versus eight-dimensional identity entries | Explicit identity_entry equality, composed with the existing sum equality |
| Last-column determinant branch | Convert the inequality to literal coordinate 8, prove the exact zero entry, then rewrite |
| Identity block for map_one | Matrix.submatrix_one with explicit dimension in Fin.castSucc_injective |
| Goal already closed by simp | Remove the extraneous tactic rather than suppressing the linter |

This table is a proof-transfer plan, not a claim that the diagnostic or the
original declarations compile. The current diagnostic does not directly test
all original multiplication, injectivity, continuity, source-action or independent
consumer proofs. Even a verified diagnostic green cannot qualify those remaining
interfaces by implication. The complete strict source and all 26 independent
consumers must still pass at one exact tested commit.

The first authorized transfer should change only justified proof bodies and
their source Git-blob/SHA-256 manifest pins. Preserve the accepted ancestry,
fourteen public types, consumer propositions, strict workflow/runner, warning
policy, dependency revisions and proof budgets. Do not import the exploratory
diagnostic into production to bypass independent source qualification. If a
consumer alone subsequently fails, freeze the successfully compiled source.

## 2. Circular inverse shortcut identified

Let H be the actual original fixed-axis SO(9) subgroup, and let R denote the
proposed coordinate restriction from H to standard SO(8). Its proposed theorem
source9Axis8Target_det_eq_coordinateBlock takes A : H. H membership already
contains determinant one and orthogonality through the ambient SO(9) subtype.

Therefore that theorem cannot establish that a newly constructed raw matrix
belongs to SO(9) or H. Supplying a provisional H element whose determinant proof
uses the same H-only theorem would be circular. This is a dependency obstruction
to that shortcut, not a mathematical obstruction to the inverse construction.

The raw-matrix determinant argument inspected in the diagnostic has the right
dependency direction: last-column Laplace expansion requires only the raw
fixed-column identity, not prior SO membership. Its proof technique can be
instantiated independently in a later strict inverse module, under the same
source-exact qualification policy.

## 3. Minimal noncircular inverse construction

For arbitrary B in standard SO(8), first construct a RAW matrix J(B) on the
original Fin 9 coordinates with precisely these entries:

| Original row/column | Entry |
| --- | --- |
| i.castSucc, j.castSucc | B(i,j) |
| i.castSucc, Fin.last 8 | 0 |
| Fin.last 8, j.castSucc | 0 |
| Fin.last 8, Fin.last 8 | 1 |

Construct and prove these four entry equations before bundling membership.
Finite row/column case analysis then gives J(B)-transpose times J(B) equal to
the diagonal blocks B-transpose B and 1. The actual last column gives axis
fixing. Raw last-column determinant expansion gives det J(B) = det B = 1.
Only then form the actual SO(9) value and its H membership certificate.
No source Spin preimage or already-existing H preimage is an input premise.

A small constructor worth testing is nested Fin.snoc on explicitly typed rows.
Pinned Mathlib Data/Fin/Tuple/Basic.lean, revision
`d13f23b723b8a846827a245b89c10fc7d3f11612`, blob
`75f997b1c4605ced1d3ce7b55549c4a853b4362e`, defines snoc as appending the last
entry and provides snoc_castSucc and snoc_last. This preserves the original
labels directly and avoids an additional sum-index reindexing equivalence.
This constructor has been inspected, not implemented or compiler-tested here.
Do not guess generated lemma argument order or omit the explicit row/scalar
types; those are exactly the dependent-family mistakes exposed by recent reds.

Raw determinant support is pinned Matrix.det_succ_column in
LinearAlgebra/Matrix/Determinant/Basic.lean, blob
`66f8b885e8ce08fecc06336d6a26d5eff6c15aa6`. No new Clifford algebra,
Lie-group model, PBW topology or global source instance is needed.

## 4. Avoid unnecessary inverse multiplication and topology work

After the forward restriction has independently qualified, the four entry
equations prove R(J(B)) = B. The qualified fixed row/column formulas for A : H
prove J(R(A)) = A. These two identities and the already qualified multiplicativity
of R suffice to build the group equivalence with R as its forward function.
There is no need first to prove a separate nine-index multiplication theorem
for J; multiplication preservation of the inverse follows from the equivalence.

For topology, prove J continuous entrywise: every entry is either a constant
or one actual entry of B. Together with the qualified continuity of R and the
same two inverse identities, this gives a homeomorphism with exactly the same
underlying functions as the group equivalence. This route does not need a new
compactness theorem for abstract SO(8), nor any assertion that the inverse of
an arbitrary continuous bijection is continuous.

The full original-vector check is stronger than a name-level group comparison:
J(B) acting on z has first eight coordinates B acting on the original first
eight coordinates of z, and last coordinate z(8). Both statements must be
checked on the original ordered labels. Keep this as an independent consumer.

## 5. Sign and point-stabilizer adverse cases

The correct inverse appends +1 in the ninth coordinate. Appending -1 moves e8
to -e8 and has determinant -det B; it is not an inverse into H. Similarly,
diag(B,det B) for arbitrary B in O(8) fixes the AXIS LINE but need not fix the
actual vector e8. For det B = -1 it sends e8 to -e8. That shortcut constructs
the wrong stabilizer and must be rejected.

The mixed source e0e8 pair is the existing guard against confusing line and
point stabilizers. The original negative central source element must remain
distinct from identity even though its vector image, and hence its coordinate
SO(8) image, is identity. Standard -I8 should extend to diag(-I8,+1); this does
not identify a source volume element or establish any gamma/chirality sign.

These are analytical dependency/sign checks. No new Lean counterexample,
Spin(8) classification, triality transport, root-data identification, Fock
action, physical coercivity or spectral existence is claimed.

## 6. Single immediate milestone and stop condition

The immediate milestone remains the unchanged fourteen-root forward restriction
gate. Await the owner's diagnostic verdict; inspect its exact retained evidence;
on verified success, transfer only checked proof shapes and run one complete
strict source/consumer gate. On another diagnostic red, isolate the first new
causal error before any further compilation. Do not duplicate the current run,
poll its result, or launch the inverse stage while the forward boundary remains
unqualified.

This preservation changes documentation only. Original source, diagnostic,
consumers, manifest, workflows, accepted results and proof limits remain frozen.
