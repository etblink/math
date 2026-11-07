# C0-A5b: fixed source Spin word continuity in the original PBW topology

**Candidate, unqualified.** Parent is the C0-A5a exact tested commit
`fc3c9f16b52e65c1db67dfd6cca73463a5fcfc09`, qualified in
[run #42392763939](https://github.com/etblink/math/actions/runs/42392763939).

## Exact topology and proposed statements

`SpectralSourceNineSpinWordContinuity.lean` imports the qualified fixed-map
source and original F10BU. Its input space remains
`Fin 8 → {u : SpaceIndex → ℝ // source9Quadratic u = 1}` with the standard
original-coordinate Pi and subtype topologies. Its target is the literal
source Spin subtype in the original accepted PBW Clifford topology.

F10BE deliberately defines the PBW normed structures as named values and
requires downstream files to enable those same values locally. Both new
source and independent consumer therefore contain exactly:

```lean
attribute [local instance] source9PBWNormedAddCommGroup source9PBWNormedSpace
```

This registers no global instance and constructs no replacement norm,
topology, carrier or operation. The structures are precisely the original
F10BE values used by F10BF, F10BG and F10BU, with no new finite-dimensional
or topological-ring instance supplied by the candidate.

Four roots in `FCP.BFSSSourceNineSpinWordContinuity` are proposed:

| Root | Intended result |
| --- | --- |
| `source9VectorEmbedding_continuous_pbw` | Continuity of the original Clifford vector embedding, reused from F10BU's exact continuous linear map |
| `source9EightUnitCoordinateClifford_continuous_pbw` | Continuity of every original Q-unit input coordinate embedded into that Clifford algebra |
| `source9EightUnitSpinWord_coe_continuous_pbw` | Continuity of the fixed map's original Clifford value via seven applications of original F10BF multiplication continuity |
| `source9EightUnitSpinWord_continuous_pbw` | Continuity into the original source Spin subtype with its inherited PBW topology |

The formula and source-group surjectivity are unchanged. The proof uses
coordinate evaluation, source subtype projection, the actual embedding,
original Clifford multiplication, and the inherited-target continuity
criterion. No chosen lift or continuous word selection is introduced.

## Independent strict boundary and topology validation

The independent consumer has eight examples: the four complete public
interfaces, continuous precomposition by an arbitrary continuous input
map, pointwise continuity, a compact-image consequence under an explicit
`IsCompact K` premise, and continuity paired with the already qualified
actual source surjectivity. The compact-image example does not assert
compactness of the whole input space or source group.

The separate strict workflow is
`.github/workflows/bfss-spectral-source-nine-spin-word-continuity-strict.yml`.
It pins 165 inputs: 125 unchanged original modules, eight accepted spectral
sources, two candidates and thirty controls. The exact closure is rebuilt
as 135 cold objects. Expect 83 exact strict root reports and ten markers.
All eight consumers must compile; no report or marker bypasses errors.

Because topology is now part of the statement, the new qualifier checks
that each candidate enables exactly the single local-attribute line above,
then rejects every other instance-registration token. Accepted spectral
source files must contain no such registration. This replaces the new
gate's inherited blanket prohibition with an exact allowlist for reuse of
the two existing PBW values; it does not allow arbitrary local structures.
Six additional adversarial tests cover valid setup, missing setup,
duplication, a replacement norm, global registration and an extra instance.
The ten existing output-adversary tests remain: sixteen tests in total.
Existing gate validators and policies are unchanged.

Only `propext`, `Classical.choice` and `Quot.sound` are permitted. Nonzero
compilation, diagnostics, recovery/foreign axioms, setup, inventory or pin
mismatches, and missing/duplicate markers reject acceptance. Complete
inputs, receipt and all logs are retained on failure and success. Lean
4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, all package
pins, default proof budgets, strict linting and no-BFSS-cache policy remain
unchanged. Local closure/pin checks, sixteen validator tests, YAML parsing
and Bash syntax checks pass before publication; compiler qualification is
pending the dedicated run and retained-evidence review.

## Next separate compactness gate

After qualification, prove compactness of the original Q-unit locus via
its exact same-label Euclidean norm bridge, and compactness of the finite
eight-coordinate parameter space. Only then combine this continuity with
actual source surjectivity for compactness of the literal source Spin group
in its original PBW topology. No source compactness, covering, Fock/gauge
implementation, physical domain, branching, coercivity or spectral-existence
claim is admitted here. Original branch and upstream PRs remain untouched.


## Run #42395290981 — scoped C0-A5b acceptance

The [PBW continuity strict run](https://github.com/etblink/math/actions/runs/42395290981)
is green at exact tested commit `be0b80c0517bfbcccd2466662d7cbded58da570a`.
Downloaded artifact 13583726993 has ZIP SHA-256
`4c6fa8612ee4a3e3e09f4de282b6e1d5dfa4363bd91174b068cb7ee26508c1ff`.
Full review verifies all 165 archive pins against the manifest and tested
checkout, 135 successful cold builds and log digests, 83 exact strict
reports, ten markers, eight consumers, 42 locked packages, compiler
identity, Lake environment digest and the exact local PBW setup. No Lean
diagnostic, recovery axiom or foreign assumption occurs.

C0-A5b qualifies original vector/coordinate embedding continuity, the fixed
formula's original Clifford-value continuity, and continuity into the actual
source Spin subtype for its inherited original PBW topology. The consumer
compact-image result retains its explicit IsCompact K premise. Neither
parameter-space nor source compactness is admitted by this record.

The [acceptance JSON](evidence/spectral-confinement-2026-11-06/source-nine-spin-word-continuity-42395290981-acceptance.json),
receipt and all source/consumer/compiler logs preserve this qualification.
The [original source compactness gate](BFSS_SPECTRAL_SOURCE_NINE_COMPACTNESS_GATE_2026_11_07.md)
is the next separate candidate; its statement is not admitted until review.
