# C0-A5c: original Q-unit parameters and actual source Spin PBW compactness

**Candidate, unqualified.** Parent is the C0-A5b tested commit
`be0b80c0517bfbcccd2466662d7cbded58da570a`, qualified in
[run #42395290981](https://github.com/etblink/math/actions/runs/42395290981).

## Original objects and proof route

`SpectralSourceNineCompactness.lean` imports qualified source continuity
and the pinned Mathlib finite-dimensional and compact-space interfaces.
The original source coordinate space is `SpaceIndex → ℝ`; its standard
Pi norm is not identified with the original quadratic form. The accepted
same-label `source9ToEuclidean` equivalence identifies Q with the squared
L2 norm explicitly. Thus the original Q-unit locus is exactly the inverse
image of the native Euclidean unit sphere. The linear equivalence yields
a homeomorphism between these finite-dimensional real spaces; its compact
sphere preimage proves compactness of the ORIGINAL unit locus.

A proof-local CompactSpace value derived from that locus result gives
compactness of the exact finite eight-coordinate parameter space. The
qualified fixed word map is continuous and surjective onto the literal
source Spin group. Its compact image is therefore the whole source group.
No continuous choice of factorization is used.

The original F10BE named PBW values are activated locally by exactly the
same checked attribute line as in the accepted continuity source. No
new norm, topology, carrier, group operation or global instance is created.
The original source subgroup retains its inherited PBW subtype topology.

Eight proposed roots in `FCP.BFSSSourceNineCompactness` are:

| Root | Intended result |
| --- | --- |
| `source9QUnit_eq_euclidean_sphere_preimage` | Exact original Q-unit locus as same-label Euclidean sphere preimage |
| `source9QUnit_isCompact` | Compactness of the original Q-unit set in original coordinate topology |
| `source9EightUnitParameters_isCompact` | Compactness of the entire exact eight-input parameter space |
| `source9EightUnitSpinWord_range_eq_univ` | Actual qualified source surjectivity as a range equality |
| `source9Spin_univ_isCompact_pbw` | Compactness of the whole literal source Spin subtype in the original PBW topology |
| `source9Spin_compactSpace_pbw` | Named CompactSpace value, without global instance registration |
| `source9Spin_isCompact_pbw` | Compactness of the original source Spin set inside the PBW Clifford algebra |
| `source9Spin_isClosed_pbw` | Closedness of that same actual source set in its Hausdorff PBW ambient space |

These are unconditional target statements about the fixed original
objects, not theorems assuming compactness of an unexplained substitute.
They remain candidates pending actual compilation and evidence review.

## Independent strict boundary

The independent consumer has ten examples: all eight complete public
statement types, compactness of the range of an arbitrary continuous map
from the actual source group under an explicit continuity premise, and
compactness of the full fixed-word image in the original target topology.
It reprints all eight root reports and independently enables exactly the
same two original local PBW values.

The separate workflow is
`.github/workflows/bfss-spectral-source-nine-compactness-strict.yml`.
It pins 166 inputs: 125 unchanged original modules, nine qualified source
modules, two candidates and thirty controls. The complete closure is
rebuilt as 136 cold objects. Expect 95 exact strict reports and eleven
markers. All ten consumer proofs must compile; root reports or markers
after errors do not qualify the source or consumer.

The new qualifier retains the exact original local PBW setup check. It
also permits that already qualified line in the newly accepted continuity
source, identified by its exact module name; the other accepted spectral
sources must have no instance setup. The candidate's proof-local
CompactSpace value is derived from its unit-locus theorem and changes no
topology. Sixteen adversarial setup/report tests remain required. Existing
validators and accepted source files are unchanged.

Only `propext`, `Classical.choice` and `Quot.sound` are permitted. Nonzero
compilation, diagnostics, recovery/foreign axioms, setup, pin or inventory
mismatches and missing/duplicate markers reject acceptance. Proposed
inputs, all logs and receipt are retained on failure and success. Lean
4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, all 42
package revisions, default proof budgets, strict linting and no-BFSS-cache
policy remain unchanged. Local pin/closure checks, all sixteen tests,
YAML parsing and Bash syntax checks pass before publication. The dedicated
CI and archive review remain the compiler/acceptance boundary.

## Scientific boundary and next decision

If this qualifies, the C0-A route establishes compactness of the actual
source Spin group in its original topology. This does not by itself prove
a Spin covering theorem, Fock/operator implementation, gauge averaging
identity, physical closed-domain correspondence, branching/exclusion,
coercivity, confinement or spectral existence. A compact group result
cannot replace construction of the required action or its domain laws.

Next review the memorandum's original operator-column and gauge-action
obligations against these qualified interfaces before selecting the next
bounded formalization. Preserve conditional statements and unresolved
premises explicitly. Original branch and upstream PRs remain untouched.


## Run #42397460623 — scoped C0-A5c acceptance and C0-A completion

The [source compactness strict run](https://github.com/etblink/math/actions/runs/42397460623)
is green at exact tested commit `a78c80da46bc8167df4753017b37cf1323008ac1`.
Downloaded artifact 13584528960 has ZIP SHA-256
`f5af47764d1987613043a9a9d8e4fc3a759cb8cbd4f8c9905c6b485b7ac3d7a2`.
Full independent review verifies all 166 archived source/control pins against
the manifest and tested checkout, 136 successful cold exits and matching
log digests, 95 exact strict reports, eleven markers, ten consumers, all
42 package revisions, compiler identity, Lake environment digest and exact
local PBW setup. No Lean diagnostic, recovery axiom or foreign assumption.

All eight new roots qualify. The original Q-unit locus and its eight-input
parameter space are compact. The literal original source Spin group is
compact in its inherited original PBW topology; its ambient Clifford subset
is compact and closed. `source9Spin_compactSpace_pbw` is a named proof value,
not a globally registered instance. The original group and topology have
not been replaced. This completes the bounded C0-A compactness route through
actual reflection pairs, nine-vector orientation, ordered unit Cartan lists,
source two-sign recovery, exact eight-factor words, the fixed actual source
map and its PBW continuity.

The [scoped acceptance JSON](evidence/spectral-confinement-2026-11-06/source-nine-compactness-42397460623-acceptance.json),
receipt and complete source/consumer/all logs retain the verification. No
covering, Fock/operator action, gauge averaging, physical closed-domain,
branching, coercivity, confinement or spectral-existence result is admitted.
The memorandum's post-C0 audit selects the next source-recovery investigation;
this documentation-only completion adds no further Lean theorem.
