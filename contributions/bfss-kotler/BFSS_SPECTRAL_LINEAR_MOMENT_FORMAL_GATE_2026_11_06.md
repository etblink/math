# BFSS linear-moment analysis gate — 2026-11-06

**Status: proposed Lean source and independent consumers; compilation pending.**
This bounded implementation follows the [E audit](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md).
It does not admit the confinement inequality, a physical Spin(9) action, or spectral existence.
AI-assisted implementation and gate design require compiler and subsequent scope review.

## Exact mathematical scope

For a continuous compactly supported function `f : EuclideanSpace ℝ ι → H`, with
finite `ι` and a real inner-product target `H`, a smooth bump `φ` satisfies

\[
\phi.rIn\,\|f-\phi f\|_{L^2}^2
\leq \int \|x\|\,\|f(x)\|^2\,dx.
\]

The statement uses the original `OAI.BFSSRellich.compactLp` construction and the
Euclidean volume measure. Both `φ.rIn` and the radial weight have power one.
Inside the inner ball the error vanishes; outside it, `0 ≤ φ ≤ 1` bounds the
pointwise error by `‖f‖`, and `φ.rIn ≤ ‖x‖`. Integrability follows from compact support.

For an arbitrary index type `J`, suppose each `u j` is continuous with compact
support, a single nonnegative real `C` bounds every first radial moment, and the
family restricted to every positive-radius closed ball is totally bounded in
the original local L2 interface. Then the global `compactLp` family is totally
bounded. Choose `R=(C+1)/ε²`; cutoff errors are strictly below `ε` uniformly.
Reuse the existing bump-family and uniform-approximation lemmas.

These are analysis statements. Local total boundedness is **assumed**, not
derived from a BFSS energy bound. The result does not yet extend the coercivity
estimate to a closed form, construct a reducing sector, identify an operator,
or assert that the physical Hamiltonian has compact resolvent.

## Source, consumers and proof gate

- Source: [SpectralLinearMomentCompactness.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralLinearMomentCompactness.lean).
- Consumer: [BFSSSpectralLinearMomentIndependentAudit.lean](../../lean/diagnostics/BFSSSpectralLinearMomentIndependentAudit.lean).
- Exact pins: [manifest](BFSS_SPECTRAL_LINEAR_MOMENT_MANIFEST_V1.json).
- Gate: [workflow](../../.github/workflows/bfss-spectral-linear-moment-strict.yml)
  and [qualifier](tools/qualify_spectral_linear_moment.py).

Two named declarations are proposed:

1. `OAI.BFSSRellich.compactLp_bump_error_linear`.
2. `OAI.BFSSRellich.linear_moment_tight_compactness`.

Six independently elaborated examples consume the exact cutoff statement,
arbitrary indexed families, sequences, an enlarged moment bound, the original
`Boson 2`/`Fermion 2` cutoff, and the exact original `FullL2 2` conclusion.
No alternate Fock carrier or physical-sector definition is introduced.

The dedicated workflow runs only on this exploratory branch (or explicit
manual dispatch). It pins Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`,
the Lake environment files, all 33 transitive original analysis sources, and
the source/consumer/helper/workflow bytes. The dependency graph is checked
against that exact closure and topological build order before setup.

The environment may download the pinned upstream Mathlib cache. All 35
controlled BFSS/consumer objects are removed and rebuilt. No BFSS proof-object
cache, existing DD/AI cache contract, or existing workflow is changed. Each
compilation has a 300-second wall bound; the job has a 60-minute ceiling.
There are no proof-budget increases in the new source or consumer.

Both new files compile with warnings treated as errors, print precisely the
two named roots' axiom reports, and emit separate completion markers. Only
`propext`, `Classical.choice`, and `Quot.sound` are permitted in those reports;
the actual sets must be retained and reviewed. The gate rejects admissions,
unsafe/native-decide proofs and mismatched source/control pins. Legacy parent
warnings are recorded separately; they do not waive candidate warnings.

Artifacts retain the exact tested commit, proposed inputs even on setup
failure, all parent/compiler/consumer logs and an object/log hash receipt.
Formal qualification requires a successful actual run plus review of its
retained evidence. Static preflight alone is not Lean acceptance.

## Decision after the gate

On success, admit only these two pure-analysis interfaces under their stated
hypotheses. Continue toward local compactness and extension on the actual
closed form, keeping source obligations P1–P3 explicit. On a Lean failure,
classify the first diagnostic and make a bounded correction without changing
the statement to a quadratic moment or increasing proof budgets. After two
wrapper failures, stop full retries and diagnose the wrapper separately.

The original F10DW branch and upstream PRs remain outside this gate's scope.
