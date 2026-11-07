# BFSS linear-moment analysis gate — 2026-11-06

**Status: strict source/consumer gate passed in run #42315568670; two analysis interfaces qualified under their stated hypotheses.**
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

The successful run qualifies two named analysis declarations:

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

Lake's environment is now resolved once, with its stderr retained in
`lake-environment.log`. The compiler is then invoked directly with that
environment. Compiler version, executable digest and Lean search path are
recorded in the receipt; compiler output is never filtered. This separates
Lake dependency diagnostics from the compiler log without allowing a Lean
warning or changing a proof statement. Dependency revisions remain checked;
this does not assert that all downloaded package working trees are clean.

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

## First run and bounded wrapper correction

[Run #42312000477](https://github.com/etblink/math/actions/runs/42312000477)
tested `34e5c48836b5fea62465851fb328cc919cb7e143`. Environment restoration and
all 33 cold parent compilations succeeded. The candidate source also returned
zero, produced an object, printed both exact roots with only `propext`,
`Classical.choice`, `Quot.sound`, and emitted its completion marker.

The wrapper then rejected eleven Lake dependency-repository local-change
warnings mixed into the candidate's output by `lake env lean`. These same
warnings occur in the parent logs. No Lean diagnostic appears in the source
compiler output. The consumer did not execute, and the formal gate remains
unaccepted. This is the first wrapper failure; it is not a failed proof or a
reason to alter the statement, permit compiler warnings, or raise budgets.

The digest-checked artifact is `13549686395`, ZIP SHA-256
`9bcb0602620c14e553ba57f0415ff384c147a1f6ff4f0ee04552b1388fdde398`.
The [exact mixed source log](evidence/spectral-confinement-2026-11-06/linear-moment-42312000477-source-log.txt),
[original incomplete receipt](evidence/spectral-confinement-2026-11-06/linear-moment-42312000477-receipt.json)
and [failure record](evidence/spectral-confinement-2026-11-06/linear-moment-42312000477-failure.json)
are preserved. Eight regression tests exercise this actual output, genuine
compiler warning/error rejection, axiom and completion failures, and mocked
environment-resolution failures. These tests are wrapper checks, not a Lean
consumer run. The source and consumer bytes remain identical to the failed
run. A fresh strict run must still compile and independently consume them.

## Second run: actual SU(2) consumer elaboration boundary

[Run #42313963781](https://github.com/etblink/math/actions/runs/42313963781)
tested `71d1cef68ae4d97074e1c19cf000f87a203b999f`. The environment/compiler
diagnostic separation worked. All 33 original parents cold-compiled and the
candidate source passed both strict compiler and exact two-root axiom checks.

The independent consumer then reported a deterministic `whnf` timeout at
line 58, column 61, on `hF.smul_left` in the fifth example's SU(2) cutoff
statement, at the unchanged default of 200,000 heartbeats. This is a Lean
elaboration resource failure, not a second wrapper failure. The source
proofs were not failing. The consumer printed its final marker and the
imported root reports after the error; its nonzero exit correctly kept the
gate red. A completion marker alone is not acceptance.

The bounded correction supplies the scalar function explicitly:
`HasCompactSupport.smul_left (f := fun x : Boson 2 => φ x) hF`.
The original `Core.lean` already uses this named-argument pattern in
`AlgebraData.smoothMultiplier`. The pinned Mathlib support theorem has an
implicit scalar function `f` and vector function `f'`; the correction names
the same real-valued bump instead of asking elaboration to recover it from
the pointwise scalar action on the concrete Fock carrier. It adds no
hypothesis, surrogate carrier, local instance or resource option. The
mathematical source and five other consumer examples remain unchanged.
Whether this resolves the measured resource boundary still requires Lean.

Artifact `13550560757` has checked ZIP SHA-256
`51ff7875be904d36a4eb701b57d02ae7f4be3d8b985a51885583245c953ea404`.
Preserved evidence: [source log](evidence/spectral-confinement-2026-11-06/linear-moment-42313963781-source-log.txt),
[consumer log](evidence/spectral-confinement-2026-11-06/linear-moment-42313963781-consumer-log.txt),
[incomplete receipt](evidence/spectral-confinement-2026-11-06/linear-moment-42313963781-receipt.json),
and [failure record](evidence/spectral-confinement-2026-11-06/linear-moment-42313963781-failure.json).
Replaying the report validator accepts the actual clean source output and
rejects the actual timed-out consumer output despite its marker. Eight
wrapper regression tests still pass. No formal acceptance or source BFSS
confinement/spectral conclusion follows from this partial run.

## Scoped acceptance: complete cold run #42315568670

[Run #42315568670](https://github.com/etblink/math/actions/runs/42315568670)
passed on exact commit `6b7f43be416bcfcef6d293dff423e13d2468f9d7`.
All eight wrapper regression tests and the full strict compiler gate passed.
The retained artifact is `13551435466`, ZIP SHA-256
`058f843557efe5db637d0cf2cb1c4ca754ab02bb31247c3db0244b3449816a19`.
The original receipt SHA-256 is
`f29934df52e8eb66a5a2b5cfe224b97a095a4470d4cd3e4670506869a19dda55`.

Evidence review checked all 42 pinned source/control files against both the
artifact and tested checkout, all 42 locked dependency revisions, the pinned
compiler executable digest, all 35 successful cold compilation entries and
compiler-log digests, all recorded fresh object digests, and both exact
completion markers. All 33 original parent compiler logs were empty. The
source and consumer each reported both named roots with exactly
`propext`, `Classical.choice`, `Quot.sound`, without compiler diagnostics.
All six independent examples compiled, including the original SU(2)
`Boson 2`, `Fermion 2`, and `FullL2 2` carriers. The explicit scalar-function
argument resolved the observed consumer timeout at the unchanged default
resource limits. No mathematical source proof changed across the three runs.

The artifact uploader excludes hidden input directories, so the workflow's
copy under `inputs/.github` is absent. Its exact pinned bytes were separately
recovered and checked from the retained `proposed-inputs.tar.gz`; no workflow
evidence was inferred from an absent file. Lake environment warnings remain
in their separately retained log; they are not compiler warnings.

Durable evidence:

- [Scoped acceptance record](evidence/spectral-confinement-2026-11-06/linear-moment-42315568670-acceptance.json).
- [Original PASS receipt](evidence/spectral-confinement-2026-11-06/linear-moment-42315568670-receipt.json).
- [All 35 compiler logs and separate Lake environment log](evidence/spectral-confinement-2026-11-06/linear-moment-42315568670-all-logs.json).
- [Source reports](evidence/spectral-confinement-2026-11-06/linear-moment-42315568670-source-log.txt)
  and [independent consumer reports](evidence/spectral-confinement-2026-11-06/linear-moment-42315568670-consumer-log.txt).

**Lead decision.** Qualify only the linear cutoff-error bound and the
arbitrary-family tightness theorem under the hypotheses stated above. In
particular, local total boundedness remains assumed. This run does not prove
a source BFSS coercivity estimate, global physical action, physical reducing
sector, closed-source Hamiltonian identification, compact resolvent, or
positive eigenpair. Source obligations P1–P3 remain open. This is internal
Lean compilation/consumer evidence, not independent human or peer review.

The next bounded analysis bridge is to derive local total boundedness from
the original smooth-core gradient and L2 bounds, then combine it with the
qualified first-moment estimate. Reuse the derivative estimate and
`localRellich_on` from the original `core_moment_totallyBounded` proof, while
replacing only its quadratic-moment tightness step. A subsequent closure
bridge must use the actual weighted closure with a linear radial weight;
neither bridge is asserted by this acceptance record. Keep both separate
from P1–P3 and from any proposed physical confinement inequality.
