# C0-A1: original source nine-vector reflection-pair gate

**Status: candidate, pending strict Lean compilation and retained-evidence review.**
This gate follows section J.6 of the [forward research memorandum](BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md).
The memorandum remains research. Its subsequent determinant, compactness,
operator-column and spectral proposals are not accepted by this gate.

## Question and exact target

For source vectors `u,v,z : SpaceIndex → ℝ` with
`source9Quadratic u = source9Quadratic v = 1`, test

\[
 E\bigl(R_9(\iota(u)\iota(v))z\bigr)
 =H_{Eu}\bigl(H_{Ev}(Ez)\bigr).
\]

Here the group element is the **existing** F10BH
`source9UnitVectorPairSpin u v hu hv`; the action is the **existing**
F10BP `source9SpinVectorRepresentation`; `E` is the same-label canonical
`WithLp.linearEquiv` into `EuclideanSpace ℝ SpaceIndex`; and
`H_a = (ℝ ∙ a)ᗮ.reflection` is the native Mathlib hyperplane reflection.
No new Spin carrier, quadratic form, topology or global instance is introduced.
The ordinary Pi norm is not definitionally equated with Euclidean L2 norm.

The new public target is
`FCP.BFSSSourceNineReflection.source9UnitVectorPairSpin_eq_native_hyperplane_pair`.
Its only vector hypotheses are the two actual source-Q unit equalities.
The action applies the `v` reflection first, then `u`, matching multiplication
in the original Clifford algebra and the existing representation convention.

## Reuse and bounded proof architecture

Read the unchanged FCP evergreen at
`cc608e2282e1b32bb11bbb64424e4775b28138e2`, blob
`f5b53f680e7b3c119491be01306a33d83586bd9a`.
Use its structure, source specialization, premise discharge and composition
method. The accepted 48-dimensional V7B/F/G modules supply a proof pattern,
not the nine-dimensional conclusion and not new imports here.

1. Prove source Q equals the squared same-label Euclidean norm, then transport
   polarization and Q-unit normalization.
2. Use the Clifford anticommutation identity to prove single-vector conjugation
   is `polar Q u z • u - z`. In positive Clifford signature this is a line
   reflection. No individual source vector is asserted to lie in Spin.
3. Compute the literal accepted pair's inverse, retaining the reversed factors,
   and identify its action through the accepted source vector embedding.
4. Match the single-vector formula with native line reflection, hence **minus**
   native hyperplane reflection. Two signs cancel in the ordered pair.

The pinned Mathlib SpinGroup source was inspected: its Spin inverse is
Clifford `star`; `star_ι` negates each vector. The existing source9 unit-pair,
vector recovery and representation declarations were inspected directly.
Do not substitute the gamma16 determinant or a source48 action for this target.

## Independent verification and failure controls

The [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineReflectionPair.lean)
has nine public roots. The [independent consumer](../../lean/diagnostics/BFSSSpectralSourceNineReflectionPairIndependentAudit.lean)
contains eight explicitly typed examples, including coordinate transport,
Q-unit norm, Clifford conjugation, inverse order, the single-factor minus
sign, the actual representation's pair identity, function equality, and
the original vector-conjugation presentation. It repeats all nine axiom
reports. Consumer compilation is mandatory; a printed marker after an error
cannot qualify anything.

The [manifest](BFSS_SPECTRAL_SOURCE_NINE_REFLECTION_PAIR_MANIFEST_V1.json)
pins 124 inputs: 92 inherited original modules, two candidates, and 30
controls. All 92 originals were compared against preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e` and have identical blobs.
Their count reflects the inherited F10BP import closure, including its
gamma/PBW infrastructure; it is not a runtime forecast or an assertion
that every imported theorem is mathematically necessary for reflection.
No separate operator snapshot is imported.

The [qualifier](tools/qualify_spectral_source_nine_reflection_pair.py)
reuses the unchanged pinned-environment utilities. It deletes all 94
controlled Lean objects, cold-builds the exact dependency closure, and
compiles both candidates with warnings as errors, default proof budgets,
and only `propext`, `Classical.choice`, `Quot.sound` permitted in the 18
public-root reports. Historical ancestor warnings are retained explicitly;
candidate warnings are fatal. Exact inputs, complete per-file logs,
object/log digests, compiler/dependency provenance and a tested-commit
receipt are retained. No BFSS proof-object cache is used or changed.

Ten adversarial report tests check missing, duplicate and foreign roots,
recovery and unauthorized axioms, warnings, errors, and incomplete or
duplicate completion markers. These and source preflight passed locally.
They are static/validator checks, **not Lean proof acceptance**. Local Lean
startup failed to locate its application in this execution environment;
the dedicated GitHub gate is the compiler test. No local proof success
is claimed. Wall limits are 600 seconds per file, 70 minutes for rebuilding
and 110 minutes for the job; no Lean heartbeat or recursion option is raised.

Classify the earliest failure before editing. A genuine sign, action or
carrier mismatch holds C0-A1 and the dependent fixed-word route; a syntax,
conversion or infrastructure failure does not refute the mathematics.
Reuse the earlier exact interfaces and bounded pointwise bridges; do not
respond with a large definitional expansion or a replacement representation.

## Acceptance boundary and next decision

Acceptance requires the exact source and all eight consumers to compile,
the complete gate to pass, and retained evidence tied to the exact commit
to survive review. Even then this proves only the stated pair identity
and its audited prerequisites. Native nine-vector determinant +1,
fixed-eight factorization, continuity/compactness in the original PBW
topology, the Fock operator action, gauge character, closed-Hamiltonian
column correspondence, full-sector branching and coercivity remain open.

If C0-A1 qualifies, next assess C0-A2's **nine-vector** determinant theorem
using the memorandum's volume/word alternatives. The global algebraic
gamma-covariance candidate remains a separate bounded opportunity.
Do not promote a matrix target's compactness into source-group compactness.
