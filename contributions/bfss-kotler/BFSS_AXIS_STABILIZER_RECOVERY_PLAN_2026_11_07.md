# Axis-stabilizer gate: procedural review and implemented diagnostic plan

Status: UNQUALIFIED DIAGNOSTIC. Owner authorized committing these six diagnostic files and triggering the bounded run on 2026-11-07. No Lean result or CI result is claimed.
Baseline: `f8b58b96a2b30334348347d2e5dbb7d7649675fb`.
Authorized diagnostic write target:
`research/bfss-original-gamma-faithfulness-20261107`.

The owner requires the original exact-eight perpendicular-word equivalence,
source and independent consumer proofs to close before committing, no CI
polling, no assumption changes, and no proof-budget increases. The later
instruction asks for a historical procedural analysis, a recovery plan and its
implementation. The owner subsequently granted the specific exception needed to commit the
unqualified diagnostic and trigger its bounded run. Final BFSS theorem
acceptance still requires the unchanged source/consumer procedure.

## Reviewed evidence

- FCP evergreen at `cc608e2282e1b32bb11bbb64424e4775b28138e2`, blob
  `f5b53f680e7b3c119491be01306a33d83586bd9a`:
  `handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md`.
- `FCP_DD_AI_CACHE_PILOT_2026_11_06.md`, especially the repeated wrapper
  failures, separately bounded diagnostic and eventual cold/warm qualification.
- `FCP_K1D18V10E_GATE2_RED_DEFINITIONAL_EQUALITY_FAILURE_REVIEW_2026_10_31.md`.
- `FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md`, including
  F10AW dependent-conditional diagnosis and subsequent accepted typed bridges.
- Source-nine reflection-pair gate, even-list-lift and exact-eight retained
  failure records, and gamma-faithfulness red/green records.
- Pinned Mathlib `Projection/FiniteDimensional.lean`, including the complete
  `LinearIsometryEquiv.reflections_generate_dim_aux` induction.
- Lean v4.34.1 `src/runtime/io.cpp`, `src/util/shell.cpp`, and `Lean/Util/Path.lean`.

## What worked, what failed, and the resulting decision

| Observed history | Successful mechanism or failure | Application here |
| --- | --- | --- |
| F10AW repeated coercion failures, then diagnostic and accepted repair | Split the same dependent conditionals in both the equality and target; qualify a small exact interface before composition | Test the fixed-axis Cartan invariant before the BFSS word construction |
| F10E red | A proposed scalar `change` was not definitionally equal to the real algebra-map target | Use typed equalities and actual accepted source interfaces; avoid speculative unfolding |
| Even-list consumer red 42369068339 | Broad membership simplification produced nested empty-tail cases; unused simp arguments were fatal | Use explicit List.mem_cons elimination in the support proof |
| Exact-eight source red 42373838709 | Padded-list case analysis lost hypothesis transport; dependent Fin witnesses retained the old domain | Reuse the accepted equality-transport and fresh-length elimination code verbatim at composition |
| Gamma-faithfulness red 42406810092, then green 42408460376 | Source passed; one no-op `change` in an independent example was rejected | Retain warnings-as-errors; remove redundant tactics instead of waiving the linter |
| DD/AI pilot wrapper reds | Repeating full ancestry builds did not resolve the audit generator defect | Use a separate diagnostic with no BFSS ancestor rebuild |
| Historical and current local compiler startup failures | Official toolchain download did not fix application-path discovery | Stop reinstalling or retrying PATH changes; use a working execution environment |
| Accepted source-nine gates | Exact closure, cold source build, independent consumers, exact root/axiom reports and retained evidence | Preserve this procedure for final qualification; diagnostic success adds no BFSS acceptance |

The evidence supports a two-lane procedure: first discriminate the missing
interface with a bounded compiler experiment, then compose source-specific
premises and run the original strict acceptance lane. Generic structural
proofs cannot supply their own original-source realization.

## Concrete startup cause, independently reproduced

The installed official Lean 4.34.1 executable fails for `--version`,
`--print-prefix` and a minimal definition, including with PATH and LEAN_SYSROOT
configured. Lake's version command works; its installation discovery also fails.

Pinned `lean_io_app_path` calls getpid(), then readlink on `/proc/<pid>/exe`.
Pinned compiler startup calls init_search_path before processing its ordinary
command-line options. That initializes the search path from getBuildDir,
which requires IO.appDir. LEAN_SYSROOT's documented override belongs to the
separate findSysroot function and does not replace this startup call.

A separate Python process reproduced the distinguishing filesystem behavior:
`os.readlink('/proc/self/exe')` succeeds; reading `/proc/{os.getpid()}/exe`
raises FileNotFoundError with errno 2. The observed process ID was 5.
This establishes an execution-environment incompatibility at the precise
operation used by Lean. It is not a theorem, import, heartbeat or source-pin
failure. No alternate compiler, runtime shim, patched binary or permission
escalation is adopted.

## Cartan route comparison

Approach A is mathematically viable: restrict to the perpendicular space,
factor the eight-dimensional isometry, transport each reflection, and compare
the lifted ambient action on the perpendicular space and the axis. Its new
proof surface includes restriction, ambient reflection compatibility and
reassembly. It is not necessary to establish determinant one on the restricted
space separately if parity is instead checked on the transported ambient list.

Approach B retains the pinned induction in the original Euclidean space.
Its fixed space W is contained in the next fixed space V. The selected v and
phi(v) lie in W-perp, so x = v-phi(v) lies in W-perp. If a is fixed, x is
orthogonal to a. The correction reflection fixes a, and the induction continues
with rho * phi. The final list starts with x and satisfies
phi = rho * product(tail), exactly as in the pinned proof. No list reversal is
introduced. A nonzero fixed vector gives fixed-space dimension at least one;
in dimension nine the moved-space dimension is at most eight.

Select B for the smaller new proof surface. The planned complete source reuse
closure has 134 existing non-Mathlib modules, 120 contribution modules and zero
OperatorDependencies. This is an import-graph observation, not compilation.
The first diagnostic imports Mathlib only and therefore builds no BFSS ancestors.

## Local implementation ready for review

- `lean/diagnostics/BFSSAxisCartanSupportDiagnostic.lean`: generic invariant
  induction plus a nine-dimensional, nonzero-fixed-vector specialization.
- `lean/diagnostics/BFSSAxisCartanSupportDiagnosticConsumer.lean`: six independent
  examples checking exact types, identity/empty list, a perpendicular reflection,
  an axial reflection's failure to fix a nonzero axis, and product order.
- `tools/diagnose_axis_cartan_support.py`: source/control preflight, original
  42-dependency environment verification, fresh compilation of both diagnostic
  files, complete logs, exact root/axiom/marker checks and retained receipt.
- `BFSS_AXIS_CARTAN_SUPPORT_DIAGNOSTIC_MANIFEST_V1.json`: exact diagnostic and
  control input pins. No BFSS theorem or legacy manifest is changed.
- `.github/workflows/bfss-axis-cartan-support-diagnostic.yml`: the existing pinned
  checkout, environment restore and artifact mechanism; only two new objects
  compiled; strict warnings and default Lean budgets remain.

The report validator is reused without modification from the source-nine gamma
covariance gate, including its ten existing adversarial tests. The runner writes
DIAGNOSTIC_PASS, never a BFSS qualification status. No admissions, extra axioms,
global instances, linter waivers or proof-budget options are introduced.

## One next milestone and stop rules

Compile the fixed-axis Cartan support lemma and independent diagnostic consumer
in the unchanged pinned environment. A pass resolves only this structural
interface. On failure, inspect the first causal diagnostic; do not automatically
repeat a full BFSS build. No polling: the owner supplies the terminal result.

After that milestone, specialize to the actual transported source action; prove
support survives zero removal and nonzero normalization; reuse even-list lifting
and the exact two-sign fibers; pad with e0 pairs before first-factor sign
absorption; then transport the full dependent witness to Fin 8. The final gate
still requires original identity and negative-center cases, e0e1 and e0e8,
actual plane rotors, sign absorption and both directions of the fixed-axis iff.
These original-source consumers have not been implemented or qualified here.

The owner explicitly authorized the diagnostic exception after reviewing the
six prepared files. Commit only this diagnostic package and trigger its bounded
run; do not poll CI for results. A diagnostic green cannot substitute for the
final source-exact theorem or its independent cold source/consumer qualification.

## Retained diagnostic red: 42418408846

Exact tested commit: `7ac6e4a193be3484277f6a045f2be5b743370267`.
Artifact: `13592831542`; ZIP SHA-256:
`bae3f837d7b417609aabc422acc7f64f79f78e4f94a6e6dfc112fdc9a26d2521`.
The downloaded ZIP passed integrity and digest checks. All 33 archived input
Git-blob and SHA-256 pins, the retained compiler-log digest, and the tested
commit were verified. All 42 installed package identities were recorded.

Classification: missing explicit Mathlib import at the structural-to-concrete
specialization boundary. The first error is the unknown `EuclideanSpace`
identifier in the type of `reflections_generate_fixing_nine`. The source imported
`Projection.FiniteDimensional`, which supplies the generic reflection argument
but does not supply that concrete Euclidean carrier. The later unknown symbols,
unsolved specialization and missing second axiom report follow from that error.

The generic `reflections_generate_fixing_aux` proof emitted no diagnostic and
printed only propext, Classical.choice and Quot.sound. This is useful diagnostic
evidence; the complete source compiler exit was 1, the receipt is INCOMPLETE,
and no independent consumer was attempted. Neither the diagnostic package nor
any new BFSS source theorem is accepted by this run. A marker following errors
does not override the failed exit.

Verified repair: pinned Mathlib `Analysis/InnerProductSpace/PiL2.lean`, blob
`2b67b8cc8a3eab5000f6646b8c9115c5b55a963f`, defines `EuclideanSpace` and its
finite-dimensional finrank simp theorem. Add precisely this Mathlib import to
the diagnostic source, make the preflight require precisely the resulting two
imports, and refresh the source/runner hash pins. All proof bodies, theorem and
consumer types, package revisions, compiler, workflow, budgets, warning policy
and axiom controls remain unchanged. No BFSS dependency is added. The original
consumer remains byte-identical and must compile in the next bounded run.

This run tested the mathematical proof boundary rather than failing in the
wrapper. The explicit import adds new source-interface evidence for a fresh
diagnostic attempt. Do not begin full source-exact word composition before the
complete diagnostic and its independent consumer pass. The owner supplies the
next terminal result; do not poll CI.
