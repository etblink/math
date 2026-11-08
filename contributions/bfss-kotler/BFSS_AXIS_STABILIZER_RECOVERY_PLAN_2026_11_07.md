# Axis-stabilizer gate: procedural review and implemented diagnostic plan

Status: STRUCTURAL DIAGNOSTIC PASSED at run 42419684762; original-source
axis-stabilizer exact-eight-word theorem QUALIFIED at run 42421286452,
exact tested commit `7bea5ca3353dd64d8c8b68ec3229aadc9296ec56`.
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

## Retained diagnostic red: 42419001149

Exact tested commit: `ae7363778ff18fcb90e4f96840d0ace25adf6666`.
Artifact: `13592778004`; ZIP SHA-256:
`72bab0dc84cfe51ac0d84fe8e3393f1647d71db28bece2bb8e73d04231f77873`.
The downloaded ZIP passed integrity and digest checks. All 33 archived input
Git-blob/SHA-256 pins, the compiler-log digest and the tested commit were checked;
the receipt records the unchanged 42-package environment.

The explicit PiL2 import resolved the earlier concrete-carrier errors. The only
compiler error in this attempt is at the span inclusion witness in the
nine-dimensional specialization: the proof used
`Submodule.span_singleton_le_iff_mem.mpr haW` without instantiating the lemma's
explicit arguments. Pinned `Mathlib/LinearAlgebra/Span/Defs.lean`, blob
`605c85954ec81f5b2e229329727572aa78f84ff6`, declares at line 544:

```lean
theorem span_singleton_le_iff_mem (m : M) (p : Submodule R M) :
    R ∙ m ≤ p ↔ m ∈ p
```

Repair that single proof line to
`(Submodule.span_singleton_le_iff_mem a W).mpr haW` and refresh only the source
blob and SHA-256 pins. The complete theorem types, generic induction, remaining
specialization proof, independent consumer, imports, diagnostic runner, workflow,
dependency revisions, budgets and warning/axiom policy remain unchanged.

The generic induction again printed only the permitted foundational axioms.
The failed specialization printed sorryAx, which is recovery output and is
explicitly rejected. The source compiler exit was 1, the receipt is INCOMPLETE,
and the consumer was not attempted. No new theorem or diagnostic package is
accepted by this run.

The FCP evergreen was reread at its pinned revision. Its first-cause/source-API
rule supports this exact-signature argument repair. Its stop rule against two
wrapper-only reds does not authorize skipping this error: both attempts reached
the actual source, and this run distinguishes the missing-import issue from a
separate explicit-argument issue. The next bounded attempt tests the complete
nine-dimensional specialization and, if it succeeds, the previously unrun
consumer. An identical surviving error would require further primitive
isolation before another retry. No full BFSS gate or CI polling is introduced.

## Structural diagnostic passed: 42419684762

The run at exact commit `a9c84b0194f02304f45bc6ae37eec10dad8700fe` succeeded.
Artifact `13593400402` has independently verified ZIP SHA-256
`28e1c8e3d9d01a1e77f249a526aa12669172dc6b88ba44bd225e9439a5e3d5f7`.
ZIP integrity, all 33 archived Git-blob/SHA-256 input pins, both compiler-log
digests, the exact tested commit and receipt status DIAGNOSTIC_PASS were checked.
Both diagnostic files compiled with zero exit under warnings-as-errors; the
two source roots and two consumer reports matched exactly and contained only
propext, Classical.choice and Quot.sound. All six independent structural
examples compiled. All 42 dependency identities were retained in the receipt.

This establishes the fixed-vector invariant induction and its nonzero-fixed-axis
nine-dimensional specialization as checked structural inputs. It does not by
itself bind the original source axis, normalization support, Clifford words,
central signs or the requested source-exact iff. The original-source gate now
imports this byte-identical structural source, cold rebuilds it with the full
source closure, and separately checks the original-source theorem and consumer.
See BFSS_SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_WORDS_GATE_2026_11_07.md.

## Original-source gate qualified: 42421286452

The exact requested original-source perpendicular exact-eight-word iff and
original gamma8 commutator companion passed at
`7bea5ca3353dd64d8c8b68ec3229aadc9296ec56`. The strict run cold rebuilt all 137
controlled modules, compiled all sixteen independent original-source examples,
and passed all 107 strict root reports. Independent retained-evidence replay
verified all 167 input pins, 137 log digests, twelve markers and all 42 locked
package revisions, with only the three permitted foundational axioms and zero
compiler warnings. See the full scoped acceptance record in
BFSS_SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_WORDS_GATE_2026_11_07.md.

The earlier reds remain failed and preserved. Approach B's successful generic
invariant is now bound to the actual source axis, Q-unit normalization, ordered
even-word lift, two-sign fibers, perpendicular padding and central sign
absorption. There is no new Clifford algebra or even-Clifford faithfulness
assumption. Source connectedness and subsequent covering/torus identification
are separate next-stage obligations; no physical spectral conclusion follows.

## Original-source path connectedness qualified: 42426258689

The successor gate qualifies path connectedness of the literal original ninth-
axis stabilizer in the existing PBW topology at
`19b007c2d46243a803a958c6595e61911d21e41c`. The strict source and all fourteen
independent examples passed: 140 cold builds, 130 strict axiom reports, fifteen
markers, 170 exact input pins and 42 locked dependency revisions were checked
against retained evidence, with only the three permitted foundational axioms
and zero compiler warnings. See
[the scoped qualification](BFSS_SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_CONNECTEDNESS_GATE_2026_11_07.md#qualification-42426258689)
and its machine-readable acceptance record.

The earlier connectedness red 42424031388 is retained in that gate record. Its
two failures were resolved by explicit subspace/ambient norm conversion and a
typed coordinate continuity proof followed by subtype construction. No theorem
type, inherited source, consumer, topology, dependency or budget changed.

The single next milestone is the compact exact parametrization and quotient-map
package for the same source stabilizer. It precedes descent of perpendicular
vector-action continuity and the actual SO(8) covering identification. Path
connectedness alone does not establish those claims, Spin(8) classification,
branching, an operator action or a physical spectral result.

## Original-source compact quotient qualified: 42429216538

The compact-parametrization successor qualifies at exact tested commit
`8f22713d9e14a7e851badfb0f680056f1fab1987`. Independent retained-evidence
review confirms all 141 cold builds, sixteen independent examples, 143 strict
axiom reports, sixteen markers, 171 input pins and 42 dependency revisions,
with only the three permitted foundational axioms and no compiler warnings.
See [the scoped qualification](BFSS_SPECTRAL_SOURCE_NINE_AXIS_STABILIZER_QUOTIENT_GATE_2026_11_07.md#qualification-42429216538)
and its machine-readable acceptance record.

The literal original fixed-axis set is compact and closed in the established
PBW topology. The unchanged original perpendicular eight-word formula, with
its stabilizer membership certificate, is a continuous closed surjective
quotient map onto the literal stabilizer subtype. Its universal continuity
test and both central-sign preimage consumers are qualified. No chosen
continuous decomposition or whole-nine-vector continuity premise was needed.

The next bounded milestone is continuity of the existing original SO(9)-valued
vector projection restricted to this stabilizer: prove its parameter composite
continuous from the ordered source pair-action formula and descend via the
qualified quotient map. That particular continuity assertion is not yet proved.
Perpendicular SO(8) construction, surjectivity, kernel/covering identification,
Spin(8) classification, branching and every physical conclusion remain separate.

## Arbitrary original-target Euclidean bridge qualified: 42441345508

At tested commit `cf9c247cc6b2297ddb243a8ac8d2be16d59a0b67`, the arbitrary
original SO(9) matrix-to-Euclidean-isometry bridge and its exact matrix action,
determinant-one and fixed-axis equivalence passed the strict gate. Independent
retained-evidence review verified all 99 cold builds, fourteen independent
examples, 53 strict axiom reports, five markers, 129 input pins and 42 package
revisions, with only the three permitted foundational axioms and no compiler
warnings. See [the scoped acceptance](BFSS_SPECTRAL_SOURCE_NINE_TARGET_EUCLIDEAN_BRIDGE_GATE_2026_11_07.md#qualification-42441345508)
and machine-readable qualification record.

The earlier red 42440025364 remains preserved and rejected. Its sole diagnostic
was an uninstantiated primed orthogonality iff before .mp; the one-line explicit
matrix instantiation changed no statement, consumer, dependency or proof budget.

This resolves the noncircular arbitrary-target isometry/determinant interface.
The next bounded milestone is a genuine original source preimage for each
fixed-axis target, by generic target Cartan factorization and the accepted
original even-list lift. Full-action equality must precede deducing stabilizer
membership. Source-preimage existence, subgroup surjectivity, exact fibers,
covering, coordinate SO(8) equivalence and all physical claims remain unqualified.

## Arbitrary fixed-axis target preimages qualified: 42444640879

At exact tested commit `bafe84205a6197b8e01fe796e1847274714230e6`, every
arbitrary original SO(9) target fixing the ninth axis has a genuine original
source Spin stabilizer preimage, agreeing on every original vector and admitting
an exact original even Q-unit Clifford word of length at most eight. Independent
evidence review confirms 102 cold builds, sixteen independent examples,
76 strict axiom reports, eight markers, 132 input pins and 42 package revisions,
with only the permitted foundational axioms and no compiler warnings. See
[the scoped acceptance](BFSS_SPECTRAL_SOURCE_NINE_AXIS_TARGET_PREIMAGE_GATE_2026_11_07.md#qualification-42444640879)
and its machine-readable record.

The earlier red 42443227754 is retained. Its main source passed unchanged;
two consumer conversions were repaired using the qualified Q-unit basis fact,
polar_self and explicit Matrix.col_apply. No statement, source proof, dependency
or budget changed. Negative-center and mixed-axis consumers now compile fully.

The next bounded milestone is subgroup packaging of the EXACT source and target
stabilizers, the unchanged original projection, its surjectivity and exact
two-sign fibers/kernel. Continuity transfer and topological covering follow as
separate obligations. Coordinate SO(8), Spin(8) classification, torus/branching
and every physical spectral assertion remain outside this qualification.

## Original stabilizer projection and exact fibers qualified: 42448494747

At exact tested commit `d8ff8d32982a341d39745360a2b1b434f305e6f8`, the actual
source axis stabilizer and actual fixed-axis SO(9) target are bundled subgroups,
and their original projection is surjective with exactly two distinct original
signs in every fiber and kernel carrier exactly identity and the genuine negative
central element. Retained-evidence review confirms 135 cold builds, 22 independent
examples, 110 strict axiom reports, ten completion markers, 165 input pins and
42 package revisions. All roots use only the permitted foundational axioms;
all compiler logs have zero warnings. See
[the scoped acceptance](BFSS_SPECTRAL_SOURCE_NINE_AXIS_PROJECTION_GATE_2026_11_07.md#qualification-42448494747)
and its machine-readable record.

Red 42446746331 remains preserved: all 133 ancestors passed, but the kernel
set-equality proof left the subgroup-to-Set membership coercion opaque to its
restricted simplifier. Adding the pinned SetLike.mem_coe lemma repaired that
one proof line. All theorem types, the complete independent consumer, inherited
source bytes, dependency pins and resource controls remained unchanged.

The single next bounded milestone is the exact original projection's topological
covering gate. Transfer already qualified PBW continuity/compactness to the same
subgroup carrier, establish quotient-map status and discrete exact finite kernel,
and use the pinned quotient-covering criterion under the actual subgroup
topologies. These obligations remain unqualified here. Coordinate SO(8), Spin(8)
classification, torus/branching, Fock-operator action and every physical spectral
claim remain separate. No new proof gate is launched by this acceptance record.

## Original stabilizer two-sheeted covering qualified: 42452043377

At exact tested commit `f47dd34b869a1aec39e95a2ccb852f4ba67f5b22`, the original
source ninth-axis stabilizer is a compact, path-connected topological group
in its qualified PBW topology, and the unchanged original projection to the
actual fixed-axis SO(9) subgroup is continuous, closed, a quotient map and
a quotient covering by its exact discrete kernel. The kernel and every fiber
have exactly two elements. Independent retained-evidence review confirms
146 cold builds, 26 independent examples, 192 strict axiom reports, 21 markers,
176 input pins and 42 package revisions, with zero compiler warnings and only
the permitted foundational axioms. See
[the scoped qualification](BFSS_SPECTRAL_SOURCE_NINE_AXIS_COVERING_GATE_2026_11_07.md#qualification-42452043377)
and its machine-readable record.

Red 42450508588 remains preserved: all 144 ancestors passed; the strict source
rejected the deprecated Set.mem_setOf_eq alias in its fiber-count proof.
Replacing it with the exact pinned successor Set.mem_ofPred_eq repaired that
one line. The complete consumer, theorem types, topologies, inherited sources,
dependency pins and strict warning/resource policy remained unchanged. A source
with diagnostic output was not accepted merely because its reports and marker
printed without recovery axioms.

The single next bounded milestone is coordinate-exact identification of the
actual target H with SO(8) on original coordinates 0 through 7 as a topological
group, preserving the actual vector projection. Audit last-row/column,
cross-block multiplication and determinant reduction before formalization.
This does not yet classify the source as a separately constructed Spin(8), bind
the common torus/root data, transfer branching or construct a Fock-operator
action. Every physical spectral claim remains outside the qualification.
No new proof gate is launched by this acceptance record.


## 2026-11-07 — Process optimization and failure-class review

The 20-run original source-geometry success/failure census, ten causal red classifications, source-frozen consumer repair pattern, exact pinned-interface checklist, DD/AI cache timing controls and prospective two-lane procedure are preserved in [BFSS source geometry procedural success/failure review](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md).

This methodological memorandum is dated **research evidence**, not an update to the FCP evergreen, a theorem qualification, or an alteration of in-progress coordinate restriction run #42454470502. Its strict acceptance standard and inherited source controls remain unchanged.


## 2026-11-07 — Coordinate transfer and inverse dependency audit

The frozen-coordinate proof-transfer ledger, raw-matrix determinant dependency,
minimal inverse construction and point-versus-line stabilizer guards are preserved
in [the coordinate transfer and inverse audit](BFSS_SOURCE_NINE_COORDINATE_TRANSFER_AND_INVERSE_AUDIT_2026_11_07.md).
This is prospective research, with no diagnostic verdict or new qualification;
original source and all verification controls remain frozen pending the owner's
reported diagnostic outcome.
