# BFSS — Original-coordinate extension into the actual fixed-axis target

**Recorded:** 2026-11-08, America/Los_Angeles.  
**Branch:** research/bfss-original-gamma-faithfulness-20261107.  
**Qualified prerequisite:** coordinate restriction at b4bf6de6572b4686d7858b204032698d1e928621, strict run 42491448288.  
**Qualification record commit / candidate parent:** b781f2b365ac62c75628cffa8c0ef447e0b7dbc3.  
**Status:** Isolated Lean candidate and static verification; strict qualification pending.

## 1. Single bounded objective

Construct the explicit inverse coordinate extension for the SAME actual
original fixed-axis SO(9) target H. For arbitrary B in SO(8) on Fin 8,
append a positive ninth entry and zero cross entries, preserving the original
Fin.castSucc labels 0 through 7. Prove the raw matrix belongs to SO(9) and
fixes the literal original source9CoordinateVector 8 before constructing H.
Then prove the two inverse identities with the qualified restriction R.

This gate establishes neither inverse continuity nor a bundled topological
group equivalence. Those are the next bounded composition/continuity obligations
after this candidate qualifies. Source Spin(8) classification, common torus
and B4/D4 branching, Fock action, closed physical domains, coercivity and every
spectral existence statement remain outside the gate.

## 2. Source-to-theorem dependency map

| Input | Status and exact use |
| --- | --- |
| Literal source SpaceIndex, source9CoordinateVector 8 and actual target subgroup source9Axis8MatrixStabilizer | Qualified original carriers and point-stabilizer predicate; unchanged |
| Actual original projection and two-sign source kernel | Qualified at 42448494747; independent consumer guards preserve the genuine negative center and mixed-axis rejection |
| Coordinate restriction source, blob 7df84b75d2d18fca18cc34e515359aa70e994cb0 | Qualified at 42491448288; exact entries, injectivity, multiplication and arbitrary-original-vector action are reused unchanged |
| Fin.snoc with explicitly constant full codomain families | Raw new nine-coordinate matrix; no new representation or Clifford algebra |
| Raw eight-coordinate orthogonality and determinant | Used before any SO(9) or H element exists; eight-coordinate SO membership discharges the orthogonality premise |
| Two inverse identities | The right inverse is checked entrywise; the left inverse follows from the qualified injectivity of R |

The candidate source imports exactly the qualified coordinate restriction and
Mathlib.Data.Fin.Tuple.Basic. Its BFSS dependency closure is unchanged apart
from the one new source. The independently authored consumer imports only
the new source. None of the old sources, 26 qualified restriction examples,
manifests, workflows or runners is modified.

## 3. Exact public interface and noncircular construction

Let M8 be Matrix (Fin 8) (Fin 8) real, M9 the matrix on the literal original
SpaceIndex, SO8 the standard eight-index special orthogonal group and H the
actual original target stabilizer. These are notation for the same Lean
carriers, not substitute models.

The fourteen printed public roots in
FCP.BFSSSourceNineAxisCoordinateExtension are:

| Root suffix | Statement / carrier |
| --- | --- |
| source9Axis8CoordinateExtensionMatrix | Raw J(B) : M9 for every B : M8 |
| source9Axis8CoordinateExtensionMatrix_castSucc_castSucc | J(B) i.castSucc j.castSucc = B i j |
| source9Axis8CoordinateExtensionMatrix_castSucc_last | J(B) i.castSucc (Fin.last 8) = 0 |
| source9Axis8CoordinateExtensionMatrix_last_castSucc | J(B) (Fin.last 8) j.castSucc = 0 |
| source9Axis8CoordinateExtensionMatrix_last_last | J(B) (Fin.last 8) (Fin.last 8) = 1 |
| source9Axis8CoordinateExtensionMatrix_orthogonal | For raw B with B-transpose times B = 1, J(B)-transpose times J(B) = 1 |
| source9Axis8CoordinateExtensionMatrix_det | det J(B) = det B for every raw B |
| source9Axis8CoordinateExtensionMatrix_fixes | J(B) fixes the literal source9CoordinateVector 8 for every raw B |
| source9Axis8CoordinateExtensionMatrix_mem_SO9 | For B : SO8, J(B) belongs to original SO(9) |
| source9Axis8CoordinateExtension | Explicit E : SO8 to H, bundled only after the preceding identities |
| source9Axis8CoordinateExtension_coe | Both original subtype coercions of E(B) give exactly J(B) |
| source9Axis8CoordinateRestriction_extension | R(E(B)) = B for every B : SO8 |
| source9Axis8CoordinateExtension_restriction | E(R(A)) = A for every A : H |
| source9Axis8CoordinateRestrictionHom_surjective | Function.Surjective R |

The only orthogonality hypothesis is on the raw eight-dimensional matrix in
its general raw lemma. It is discharged from B.property when constructing
SO(9). There is no assumed H preimage, source Spin preimage, even-Clifford
injectivity or new mathematical axiom. The final public surjectivity statement
has no new hypothesis:

```lean
theorem source9Axis8CoordinateRestrictionHom_surjective :
    Function.Surjective source9Axis8CoordinateRestrictionHom
```

The raw determinant uses the pinned last-column Laplace formula and the four
raw entries. It never calls the H-only determinant identification to establish
initial H membership. This avoids the circular shortcut identified in the
[coordinate inverse audit](BFSS_SOURCE_NINE_COORDINATE_TRANSFER_AND_INVERSE_AUDIT_2026_11_07.md).
The right inverse is entrywise on original Fin.castSucc labels; the left inverse
uses already qualified restriction injectivity. No second nine-dimensional
inverse multiplication theorem or chosen source lift is constructed.

## 4. Pinned interface review and previous failure controls

All Mathlib interfaces below were read at
d13f23b723b8a846827a245b89c10fc7d3f11612:

| File / Git blob | Inspected interface |
| --- | --- |
| Data/Fin/Tuple/Basic.lean / 75f997b1c4605ced1d3ce7b55549c4a853b4362e | Fin.snoc, snoc_castSucc and snoc_last; full constant dependent families are explicitly supplied in J |
| Data/Fin/SuccPred.lean / 25a960243cc9bc2cfb7c59662de33e40e3ede29c | eq_castSucc_or_eq_last, castSucc_ne_last and succAbove_last |
| LinearAlgebra/Matrix/Determinant/Basic.lean / 66f8b885e8ce08fecc06336d6a26d5eff6c15aa6 | Matrix.det_succ_column, exact original last-column minor and order |
| LinearAlgebra/UnitaryGroup.lean / 2bc60a3c9927cdbf9c28371d1b4e9f66b7447583 | Explicitly instantiated mem_orthogonalGroup_iff' and mem_specialOrthogonalGroup_iff |
| Data/Matrix/Mul.lean / ff91eb667e375c22bc6d8973fa706f9dd1f9d100 | Matrix.neg_mulVec has vector then matrix argument order |

The scalar singleton and Core ite_eq_left/ite_eq_right proof shapes are those
already checked in the qualified restriction consumer/source. Fin.last 8 versus
literal original coordinate 8 is proved by an explicit finite equality. Matrix
identity conversions are typed and use Matrix.one_apply explicitly. No deprecated
if_pos/if_neg alias, guessed dependent singleton family, broad normalization of
an opaque matrix identity, extra global instance or proof-budget workaround
is introduced. Every calc branch is reviewed, including the final scalar/index
step that caused the previous consumer failure.

## 5. Independent consumer and adversarial guards

The consumer contains 24 separate example propositions, covering all raw
entries, determinant and orthogonality, actual SO membership, both carrier
coercions, both inverse identities, surjectivity, inverse injectivity and
identity/multiplication compatibility derived through the qualified R.

Arbitrary original nine-vectors are tested in both their first eight and last
coordinates; their ninth component is not assumed zero. The last component is
bound to literal coordinate 8 by a checked equality. The actual original
negative central element remains a distinct Clifford value -1, although its
target projection and coordinate image are identity. The exact two-sign source
kernel is retained. Perpendicular e0e1 reconstructs its actual target, and
mixed e0e8 is still rejected from the point stabilizer.

Two raw sign guards supplement those source tests: -I8 extends with positive
ninth entry, and negating an extension sends e8 to -e8 and therefore fails to
fix e8. The latter is a raw wrong-sign test, not a claim that the negated matrix
has SO(9) membership. The actual mixed source element supplies the stronger
line-versus-point guard inside the original source group. No gamma chirality
or source volume-element identification follows from the -I8 entry check.

## 6. Exact qualification procedure and stop rules

The manifest pins 125 original ancestors, ten qualified source modules, one
new candidate source, one independent consumer and 30 controls: 137 cold builds
and 167 exact input pins. Its acceptance inventory is 135 ordered strict root
reports and twelve exact completion markers. All 42 package revisions and
Lean 4.34.1 remain pinned. The old 26-example consumer remains qualified at its
own exact recorded commit; this successor has its own 24-example consumer.

The new runner reuses the established cold-build/environment procedure,
removes all controlled BFSS object files, enforces autoImplicit=false and
warningAsError=true on qualified and new modules, rejects forbidden/recovery
axioms, requires every compiler exit zero and retains all inputs/logs/receipt.
Only propext, Classical.choice and Quot.sound are permitted. The ten inherited
adversarial validator tests still reject malformed reports, missing/duplicate
markers, recovery axioms and diagnostics. No report parser is weakened.

Existing limits remain 600 seconds per compiler file, 35 minutes for environment
restoration, 70 minutes for the cold build and 110 minutes for the job. Mathlib
dependency restoration is unchanged; no BFSS proof-object cache is introduced.
Source-closure preflight and all ten validator tests pass. Python, workflow and
shell checks are static validation; no local Lean execution is claimed.

Submit one full strict run tied to its exact candidate commit. Accept only the
complete retained PASS receipt, all 137 compiler exits, all 24 consumers, all
135 ordered reports/twelve markers and independently verified input/log pins.
Source-only success, imported-root reports and a marker do not qualify a failed
anonymous consumer. Retain the first actual failure and its phase on any red.
Repair only the identified boundary, keeping compiling ancestors frozen;
never replace the original carrier or add a hypothesis to force acceptance.

If a new matrix/Fin interface fails, require the exact pinned declaration and
a typed reproducer before a near-identical retry. Distinguish infrastructure
failures from Lean failures. Do not poll CI. The owner reports the verdict;
after independent qualification, proceed to the next bounded step without
requiring a separate continue instruction.


## Qualification 42494594055

The owner reported [strict run 42494594055](https://github.com/etblink/math/actions/runs/42494594055)
GREEN. Independent retained-evidence review qualifies this bounded extension
at exact tested commit `f31418acb402e97def0a9289dde45f11614238f1`.
Artifact [13623433553](https://github.com/etblink/math/actions/runs/42494594055/artifacts/13623433553)
was downloaded, ZIP/CRC checked and independently SHA-256 verified as
`4e05440fd989167df70552235a467bad123e6d624d7d8e2095e5642f2e0416cb`.
The complete PASS receipt hashes to
`7fa3a3cb1cd43b201e2f2d902999e94add50cbd56cc9cca3997add9cfe895f56`.
See [the scoped qualification and retained receipt](evidence/source-axis-stabilizer-2026-11-07/qualification-42494594055.json).

Review verifies all 137 zero compiler exits, 167 archived input Git/SHA-256
pins, 137 ordered compiler-log digests, 24 independent examples, 135 strict
root reports, twelve exact markers, the pinned compiler identity and all 42
installed dependency revisions. Compiler logs contain no warnings/errors or
recovery axioms. Every audited root uses only propext, Classical.choice and
Quot.sound. Object/compiler binary hashes are receipt records; binaries were
not archived for independent rehashing. Workflow preflight, environment,
complete cold build and evidence retention steps all succeeded.

Qualified source blob: `376b0409836bc3b6ddaf77bc0cfebf11080e7cb1`.
Qualified consumer blob: `bd548b0798ac740a69a498eec9b734e94d0f21c1`.
The source is the literal raw diag(B,+1) on original coordinates, with raw
orthogonality, determinant and axis fixing established before SO(9)/H membership.
Both inverse identities and restriction surjectivity qualify without an assumed
H/source preimage. The point/sign and arbitrary-vector consumers passed.

This qualification does not yet establish continuity of the extension or a
bundled topological group equivalence. The next single bounded gate proves
raw entrywise continuity, lifts it through the SAME two target subtypes, and
packages the existing R/E pair in Mathlib's ContinuousMulEquiv. Preserve both
underlying functions and exact original entry/vector bindings. Do not reconstruct
an inverse using choice or invoke an unverified compactness shortcut. Transport
of the original source covering to SO(8), source Spin(8) classification, torus
and branching, Fock actions and all physical conclusions remain separate.
The owner authorizes direct progression after verified qualification; no CI polling.
