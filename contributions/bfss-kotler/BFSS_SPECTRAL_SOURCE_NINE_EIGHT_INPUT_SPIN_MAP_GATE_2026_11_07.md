# C0-A5a: fixed eight-input map into the actual source Spin group

**Candidate, unqualified.** Parent is the C0-A4c tested commit
`2eea63f03a0746b1b243a75676050580aab92a17`, qualified in
[run #42375541902](https://github.com/etblink/math/actions/runs/42375541902).

## Proposed source and actual target

`SpectralSourceNineEightInputSpinMap.lean` imports only the accepted
exact-eight source. Its domain is exactly
`Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}` and its target is
the existing `spinGroup source9Quadratic`. The domain uses original source
coordinates and Q-unit premises; no substitute Spin group is introduced.

Four public roots in `FCP.BFSSSourceNineEightInputSpinMap` are proposed:

| Root | Intended result |
| --- | --- |
| `source9CliffordWord_ofFn_eight` | Natural Fin 8 word equals the ordered four consecutive Clifford pairs |
| `source9EightUnitSpinWord` | Fixed product of four actual F10BH source Spin pairs |
| `source9EightUnitSpinWord_coe` | Its original Clifford value is exactly that same eight-vector word |
| `source9EightUnitSpinWord_surjective` | Every actual source Spin element is attained by this fixed map |

The map is an explicit formula for every input. Surjectivity uses the
qualified exact-eight witnesses, packages their original Q-unit proofs,
and uses source subtype extensionality on the exact Clifford equality.
It does not select lifts to define the map or require continuously chosen
factorizations of g. This gate establishes no continuity theorem.

## Independent strict boundary

`BFSSSpectralSourceNineEightInputSpinMapIndependentAudit.lean` has eight
consumers: all four complete source interfaces, arbitrary actual source
attainment with word equality, identity attainment, actual negative
central attainment with Clifford value -1, and equality of the actual
source outputs when their literal words agree. All four root axiom
reports are repeated in the independent consumer.

The dedicated workflow is
`.github/workflows/bfss-spectral-source-nine-eight-input-spin-map-strict.yml`.
It pins 164 inputs: 125 unchanged original modules, seven already accepted
spectral source modules, two new candidates and thirty controls. The exact
imported closure is rebuilt as 134 cold objects. Expect 79 strict root
reports and nine markers. All eight consumers must compile; reports or
markers after errors cannot qualify them.

Only `propext`, `Classical.choice` and `Quot.sound` are permitted. Nonzero
compilation, diagnostics, recovery/foreign axioms, changed input pins,
inventory mismatches and missing/duplicate markers reject acceptance.
Proposed inputs, all compiler logs and the receipt are retained on failure
and success, with fourteen-day Actions retention. Lean 4.34.1, Mathlib
`d13f23b723b8a846827a245b89c10fc7d3f11612`, all 42 package revisions,
default proof budgets, strict linting and no-BFSS-cache policy remain
unchanged. Local source-pin/closure checks, ten adversarial validator tests,
YAML parsing and Bash syntax checks pass before publishing; the dedicated
CI remains the source/consumer compiler test.

## Later topology gate

After qualification, prove continuity of the fixed formula in the existing
F10BF/F10BG PBW topology, using the original Clifford embedding and
multiplication with the inherited source subtype topology. Prove compactness
of the original Q-unit locus via its explicit same-label Euclidean norm
bridge, then compactness of the finite eight-coordinate parameter space.
Combine continuity and actual surjectivity to conclude source compactness.
These remain proof obligations, not consequences admitted by this record.

No original norm, quadratic form, source topology, group operation or
carrier changes. No covering, Fock/gauge implementation, physical closed
domain, branching, coercivity or spectral-existence result follows here.
Original branch and upstream PRs remain untouched.
