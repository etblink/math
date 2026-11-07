# C0-A2 first bridge: actual source nine-vector Lipschitz representation

**Status: candidate, pending strict compilation and retained-evidence review.**
This discharges neither C0-A2 determinant +1 nor compactness. It isolates
the source-action/restriction obligation in memorandum section K before
attempting a generator determinant or subgroup-closure argument.

## Exact question and construction

Does the literal `lipschitzGroup source9Quadratic` act by invertible real
linear maps on **exactly** `SpaceIndex → ℝ`, with the source Clifford
conjugation formula, and does restricting that action along the actual
`spinGroup.toUnits` map give the existing F10BP representation?

The [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineLipschitzRepresentation.lean)
proposes ten public roots:

1. A real-linear map for each actual source Lipschitz element, defined
   through the accepted `source9CliffordVectorProjection` applied to
   untwisted Clifford conjugation.
2. Its exact embedded-vector identity. The actual Mathlib Lipschitz
   range theorem discharges range preservation; it is not assumed.
3. The global representation with identity and same-order multiplication.
4. A real-linear equivalence, whose inverse uses that representation at
   the inverse Lipschitz unit, with both inverse laws proved.
5. The homomorphism into real-linear equivalences.
6. Its determinant **unit** character into `ℝˣ`.
7. The actual source Spin-to-Lipschitz monoid homomorphism.
8. Its exact equality with the existing `spinGroup.toUnits` value.
9. Pointwise equality of the restricted action with the original
   `source9SpinVectorRepresentation`.
10. Equality of the entire restricted representation with F10BP.

No new norm, topology, group carrier, Clifford form, relabeling or global
instance is registered. The scalar field is real and the labels are the
original nine spatial indices. There is no assumed orthogonal action or
assumed restriction equality. The group here is the actual **algebraic**
Lipschitz subgroup; subgroup closure is not topological closure.

## Inspected inputs and proof method

The unchanged evergreen recommends structure, exact source specialization,
premise discharge and short composition bridges. Reuse F10BO's original
vector projection/left inverse and F10BP's original Clifford embedding
injectivity. The old source48 K1D18F/G/H construction supplies proof
patterns for conjugation linearity, group order, invertible linear action
and the determinant character. No source48 module or conclusion is imported.

The pinned Mathlib source
`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` at
`d13f23b723b8a846827a245b89c10fc7d3f11612`, blob
`f06d1130ec5d8d4a552fdb9e670c650135e75f9c`, was inspected directly.
It supplies `lipschitzGroup.conjAct_smul_ι_mem_range_ι`, requiring invertible
2, available over the actual real scalar field; and
`spinGroup.units_mem_lipschitzGroup`. The existing Spin unit's value and
inverse are used explicitly in the restriction proof. Named map and
pointwise embedding identities keep conversion bounded.

The determinant character is only the composition of the actual
real-linear representation with `LinearEquiv.det`. Its codomain `ℝˣ`
records invertibility, **not orientation**. No generator value +1, all-group
value +1 or special-orthogonal membership is stated here.

## Independent consumer and gate

The [consumer](../../lean/diagnostics/BFSSSpectralSourceNineLipschitzRepresentationIndependentAudit.lean)
has twelve explicit-type examples. They check the original real-linear
carrier, exact Clifford embedding, full representation, multiplication
order, both inverse cancellations, the linear-equivalence inverse,
determinant-unit codomain/multiplicativity, literal Spin unit inclusion,
pointwise restriction and whole-representation equality. It repeats all
ten root axiom audits, for twenty reports across two strict files.

The [manifest](BFSS_SPECTRAL_SOURCE_NINE_LIPSCHITZ_REPRESENTATION_MANIFEST_V1.json),
[qualifier](tools/qualify_spectral_source_nine_lipschitz_representation.py),
[tests](tools/test_spectral_source_nine_lipschitz_representation.py) and
[workflow](../../.github/workflows/bfss-spectral-source-nine-lipschitz-representation-strict.yml)
reuse the successful gamma/reflection gate method with an independent
inventory. All 124 inputs are pinned: 92 unchanged original modules,
two candidates and 30 controls. The original closure matches preserved
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`. None of the newly qualified
reflection or gamma-covariance files is an extra dependency of this test.

Delete all 94 controlled objects before rebuilding. Require both candidate
files to compile with warnings as errors and default proof budgets; accept
only `propext`, `Classical.choice`, `Quot.sound` in all twenty reports.
Retain all inputs, complete logs, compiler/dependency provenance, object/log
digests and the exact tested-commit receipt. Ten adversarial report tests
remain mandatory. Environment utilities are reused unchanged; no accepted
helper globals, BFSS caches, qualified workflows or proof limits are changed.
Per-file wall limit remains 600 seconds, build step 70 minutes and job 110.

Local preflight and static/test checks are preparation, not Lean acceptance.
Actual compiler qualification is the dedicated GitHub gate followed by
retained-evidence review. Classify the earliest causal failure before any
repair. Preserve the original source map if a conversion or wrapper fails;
do not infer a mathematical counterexample from a tooling failure.

## What would follow and what remains

After qualification, the actual nine-vector Lipschitz action and its exact
Spin restriction could be used in the next C0-A2 stage: source-normalized
generator-matrix identification, the odd-nine rank-one determinant +1,
and propagation through the algebraic Lipschitz closure. That remains a
separate unqualified obligation. Volume and normalized-word alternatives
remain available if this approach fails.

Even full C0-A2 would not prove bounded Cartan factorization, continuity of
the fixed-word map or source Spin compactness in the original PBW topology.
Fock action, gauge character, closed-Hamiltonian columns, full-sector
branching, coercivity and spectral existence retain their separate gates.


## Run #42342751657 — source elaboration failure and bounded repair

**RED, not qualified.** The failed tested commit is
`f7a2927b5082e41134d84bd93100905840c17374`. Reviewed retained artifact
13562648689: all 124 input pins and all 93 attempted log digests match;
all 92 inherited modules compiled without warnings. The new source
returned a nonzero compiler exit and the independent consumer did not run.
The completion marker printed after errors and eight public reports
contained `sorryAx`; the gate correctly rejected them. The other two clean
reports do not independently qualify any part of this gate.

The [failure record](evidence/spectral-confinement-2026-11-06/source-nine-lipschitz-representation-42342751657-failure.json),
receipt, complete logs, source log and verbatim failed source are retained.
Both observed causes are source elaboration errors, not a demonstrated
mathematical contradiction or an infrastructure/cache failure:

- At line 38, bare `rw [map_smul]` selected the *outer* vector projection
  with the conjugation group as scalar. It requested unintended
  `SMul (ConjAct ...) (SpaceIndex → ℝ)` and action-hom instances. The intended
  inner real-scalar rewrite was never reached. Unlike the older source48
  proof, this expression has an extra outer real-linear projection; the
  uninstantiated rewrite cannot be copied unchanged.
- At line 171, annotating the unit *input* before inversion did not prevent
  the expected Clifford-algebra result from driving inverse elaboration.
  Lean requested `Inv (CliffordAlgebra source9Quadratic)`. No such global
  inverse structure is required or introduced by the mathematical claim.

**Repair:** instantiate the actual iota real-scalar law at `c`, carry it
through the Clifford conjugation/projection with `congrArg`, commute `c`
with conjugation in the Clifford algebra, and apply the projection's
real-scalar law at `c`. Separately, annotate the inverse **result** as
`(CliffordAlgebra source9Quadratic)ˣ` before coercing it into the algebra.
This preserves the same actual unit and inverse.

Only those source proof/type-expression sites and their candidate manifest
pin change. All ten public declaration headers, all twelve consumers,
qualifier, tests, workflow, original dependencies, options and root lists
remain unchanged. No new instance, extra hypothesis, axiom, proof-limit
increase or validator waiver is used. The source-header equality check,
preflight and ten report tests pass locally. These are not Lean qualification.
Require a fresh full gate and retained-evidence review; inspect the first
new failure if red. Determinant +1 and all later research remain open.


## Run #42344283019 — repaired bridge accepted in scope

Green run at exact commit `ce15a36619804d51aff1c958ff3dd5f398ba416e`
passed retained-artifact review. Artifact 13563626232 contains matching
124 input blob/SHA256 pins, 94 cold-build exits/log digests, twenty root
reports, two completion markers, twelve consumers, all 42 dependency
revisions and the qualified compiler/environment digests. No original
or candidate compiler warnings occur; no recovery axioms remain.

The [scoped acceptance](evidence/spectral-confinement-2026-11-06/source-nine-lipschitz-representation-42344283019-acceptance.json),
receipt, complete logs and source/consumer logs are retained alongside the
previous red evidence. Qualify all ten roots: actual real-linear Lipschitz
conjugation and inverse laws, determinant-unit character, actual Spin
inclusion and exact pointwise/whole-representation restriction to F10BP.
The two explicit scalar/inverse repairs resolved the observed elaboration
failures without changing public statements, consumers or verification policy.

Determinant +1 is not part of this acceptance. The next
[source-nine orientation candidate](BFSS_SPECTRAL_SOURCE_NINE_ORIENTATION_GATE_2026_11_06.md)
attempts the actual normalized generator matrices, odd-nine determinant,
Lipschitz closure and restriction to the existing nine-vector matrix hom.
Fixed-eight factorization, source compactness and spectral claims remain open.
