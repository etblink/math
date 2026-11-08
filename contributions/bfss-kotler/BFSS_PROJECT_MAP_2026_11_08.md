# BFSS Project Map — navigation, interfaces, and evidence

**Date:** 2026-11-08  
**Repository:** `etblink/math`  
**Research branch:** `research/bfss-original-gamma-faithfulness-20261107`  
**Inventory baseline:** `22767adb51188d0e1f0ef6ff2be708225f5257b9`  
**Status:** Navigational index. **Not** a mathematical proof, source qualification, or claim of exhaustive dependency analysis.

> Seek truth. Preserve results, not theories. Preserve negative knowledge. Every acceptance is tied to an exact source commit and actual consumer gate.

## Cross-repository retrieval gateway (2026-11-08)

**Canonical entry:** [cross-repo branch locator — 99-branch dated inventory](BFSS_CROSS_REPO_BRANCH_LOCATOR_2026_11_08.json).
It records the observed remote head SHA and live/immutable GitHub URLs for
**25 `etblink/math` branches** and **74 `etblink/Foundational-Convergence-Program` branches**.
It also contains direct pointers to original BFSS carriers, OP0/OP1, the
import graph, and the separate OP2 Fock dependency snapshot.

**Division of responsibilities:**
- [`etblink/math`](https://github.com/etblink/math): original BFSS/Lean source, theorem implementations, independent consumers, qualification gates and publication-facing integration.
- [`Foundational-Convergence-Program`](https://github.com/etblink/Foundational-Convergence-Program): research provenance, comparison rules, source registers, claim ledger, and prior falsification/negative findings. Its [`CURRENT_STATE.md`](https://github.com/etblink/Foundational-Convergence-Program/blob/main/CURRENT_STATE.md) on `main` is authoritative **for FCP program routing**, not for the exact BFSS Lean gate.
- The [original-Fock research branch](https://github.com/etblink/math/tree/research/bfss-original-gamma-faithfulness-20261107) is the current BFSS workbench. The [separately pinned BFSS v0.4.0 contribution snapshot](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f) holds candidate original Fock/gauge ancestry for OP2, not automatically imported or requalified here.

**Accepted abstract anchors (do not broaden their scope):**
- OP0: [run #42516531636](https://github.com/etblink/math/actions/runs/42516531636), tested commit `93e58dab8d077306250e7fb1140dc1dc1a5dd8c2` — literal finite-dimensional fixed-space projection and basic properties.
- OP1: [warning-clean corrected gate #42518687725](https://github.com/etblink/math/actions/runs/42518687725), tested commit `44ea6b8001209d92f0e023a7f30f5125cde127e9` — star-algebra automorphism invariance of that abstract projection with explicit assumptions. Earlier [run #42517863002](https://github.com/etblink/math/actions/runs/42517863002) compiled the mathematics, but revealed an insufficient warnings-as-errors check; later run corrected and passed it.
- **OP2 remains OPEN**: original SU(2) Fock source binding requires exact dependency ancestry and fresh qualification, not a surrogate carrier or an assumption about an already-imported module.

**How to locate an artifact:** Start in the JSON registry by repository/branch, then use the recorded commit SHA for an immutable historical snapshot. For a known Git path on a local clone with the relevant remote refs fetched, run `git show <commit>:<path>`; to find its earlier history use `git log --all -- <path>`. To find an unfamiliar file name on a specific ref, use `git ls-tree -r --name-only <ref>`. The registry enumerates *branch heads*, not every historical commit or every file. A missing indexed pointer does not mean a result never existed.

**Integrity/maintenance:** Do not merge or delete branches simply to improve navigation. Preserve old proof bytes, exact run/commit identifiers, rejected attempts and research source provenance. GitHub branch HEADs can move; treat the JSON as a dated discovery/recovery snapshot, refresh it deliberately when milestone branches change, and confirm live HEAD before any mutation. This gateway belongs on the **research branch only** until a separately approved small navigation-only integration makes it visible from a stable default-branch landing page.

## Future-session recovery: H1 and H2 accepted (2026-11-08)

The [H1 theorem/evidence registry](BFSS_H1_EVIDENCE_REGISTRY_V1.json)
is our searchable recovery layer above the dated
[99-branch cross-repo locator](BFSS_CROSS_REPO_BRANCH_LOCATOR_2026_11_08.json).
Search by theorem, carrier, source origin, failed procedure or open obligation
using [h1_evidence_registry.py](tools/h1_evidence_registry.py).
[Strict H1 run #42524474547](https://github.com/etblink/math/actions/runs/42524474547)
at `799a0d70cc0674222e13efd9b90c62a4826016af` passed:
**12 typed records, 8/8 future-session retrieval tests, 21 pinned
source files, five exact CI runs, and two retained artifact digests**.
This is a curated search pilot, not a complete archive or proof catalogue.

H2 provides two reproducible, exact-source maps:

- **[Original OP2 Fock/gauge dependency graph](BFSS_H2_OP2_PINNED_ANCESTRY_V1.json)**:
  **38** pinned modules absent on the active baseline, **38** internal edges,
  and **seven** immediate external imports. The within-namespace graph passed
  [frozen replay #42523263158](https://github.com/etblink/math/actions/runs/42523263158)
  at `35a12288c463bdd18065ba2b6cb7d215f66fdcc2`.
  [Recompute tool](tools/h2_op2_ancestry.py).
- **[Workflow source/reference index](BFSS_H2_WORKFLOW_SOURCE_INDEX_V1.json)**:
  **337** source-hashed YAML workflow files, with **561** distinct lexical
  source references; [frozen replay #42524327310](https://github.com/etblink/math/actions/runs/42524327310)
  at `8e3ef2b867f6e6913140e0295f3142b7720bde51` passed.
  [Recompute tool](tools/h2_workflow_index.py). All workflow lifecycle
  statuses remain **PRESENT_UNASSESSED**; none has been approved for retirement.

See [H2 verification, boundaries, negative knowledge and next gate](BFSS_REPOSITORY_DEPENDENCY_AND_HOUSEKEEPING_AUDIT_2026_11_08.md#h2-bounded-acceptance--op2-source-closure-and-workflow-lifecycle-evidence-2026-11-08).
**This infrastructure is for our future sessions**, not for independent human
testing. No BFSS Lean mathematical theorem is admitted by H1/H2 indexing.
Neither `etblink/math:main` nor FCP was changed.

### OP2a source-import candidate — 2026-11-08

**SOURCE IMPORT + G4-E EXACT-ALIAS GATE QUALIFIED AT PINNED COMMIT; OP2 OPERATOR BRIDGE OPEN.** At exact
commit [`c763196c06eeb793af4137a9a48158c18d06e04d`](https://github.com/etblink/math/commit/c763196c06eeb793af4137a9a48158c18d06e04d),
the research branch imported **26 bit-for-bit original** OperatorDependencies
Lean files from the pinned G4-E source closure. The source-binding adapter is
[`OP2aOriginalFockGaugeSource.lean`](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2aOriginalFockGaugeSource.lean),
with an [independent consumer](../../lean/diagnostics/BFSSOP2aOriginalFockGaugeIndependentAudit.lean)
and [strict gate #42525538193](https://github.com/etblink/math/actions/runs/42525538193).

The [strict gate #42525538193](https://github.com/etblink/math/actions/runs/42525538193)
completed **SUCCESS** (attempt 1) at the exact source commit
`c763196c06eeb793af4137a9a48158c18d06e04d`. The original 26 source
blobs and seven boundary blobs matched, pinned Lean/Mathlib compiled 9,059
jobs, and the independent consumer and displayed axioms passed.
Allowed axioms observed: `propext`, `Classical.choice`, `Quot.sound`.
Retained evidence SHA-256: `9f6c54f9fa170cf540078f0e8171d2167b0970e877973307c0708b4f6d9a4024`.
Source and consumer warnings were checked, while incidental local-change
warnings from checked-out dependencies were not treated as mathematical failures.

The result qualifies the **exact genuine source unitary representation on
the original `Fermion 2`**. OP0 `Module.End` binding, a nonzero invariant
vacuum, source Spin(9) action, central signs, the closed physical form and any
spectrum/mass-gap claim remain **OPEN**. H1 [recovery gate #42526669805](https://github.com/etblink/math/actions/runs/42526669805)
also passed: 13 records, 9/9 future-session recovery queries, 24 pinned
source files, 6 exact CI runs and 3 evidence digests. No file on
`etblink/math:main` was modified.

### OP2b — qualified original gauge-operator projection (2026-11-08)

[Source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2bOriginalGaugeProjectionBridge.lean)
and [independent consumer](../../lean/diagnostics/BFSSOP2bOriginalGaugeProjectionIndependentAudit.lean)
qualified in [strict run #42527245991](https://github.com/etblink/math/actions/runs/42527245991)
at exact tested commit `0dc811f4e4764b6846e033242fddde24e8bc92db`;
9,061 Lean build jobs, source/consumer proofs, axioms and warning checks passed.
Observed axioms: `propext`, `Classical.choice`, `Quot.sound`. Evidence
SHA-256 `6199864990aaffe9282a4727afc86338eaa7e4bce6636ff714c6e359bea8a215`
(retention ends 2026-11-22). The result binds the genuine original
`GaugeGroup 2` SU(2) action to `Module.End ℂ (Fermion 2)`, verifies its
pointwise equality to the corresponding bounded operators, and instantiates
OP0's exact original fermionic gauge-fixed orthogonal projection. It does
**not** prove nonzeroness, a source Spin(9) action, gauge/Spin commutation,
closed physical Hamiltonian or spectral gap.

### OP2c — qualified original nonzero SU(2) gauge vacuum (2026-11-08)

[Source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean)
and [independent consumer](../../lean/diagnostics/BFSSOP2cNonzeroOriginalGaugeVacuumIndependentAudit.lean)
passed [strict run #42530241914](https://github.com/etblink/math/actions/runs/42530241914)
at **exact tested commit** `f84d092b2c71099cda790ee64083b5b81eb360d9`:
**9,062** Lean build jobs, all five theorem reports, independent consumer,
source/consumer warning check and foundational-axiom audit passed.
Observed axioms: `propext`, `Classical.choice`, `Quot.sound`.
Retained evidence SHA-256:
`663e5d187b9e326fb904f47fb0054a364b00b3e7cb9f5966bac0ce753fe4daa5`
(expires 2026-11-22). Original `fockAlgebraToBFSS (1 : Space 23)`
is nonzero, SU(2)-fixed, and fixed by the exact OP2b gauge projection;
therefore `originalFermionGaugeProjection ≠ 0`.

[Original red #42528690361](https://github.com/etblink/math/actions/runs/42528690361)
was warning-gate rejection of deprecated `ContinuousLinearMap.zero_apply`,
not a failed proof. One-line `zero_apply` repair kept all mathematical
statements, original source files, imports, consumer and strict gate unchanged.

**Scientific STOP:** this is nontriviality of a finite-dimensional
fermionic fixed subspace, not nonzero full physical L², Spin(9) covariance,
Hamiltonian form-domain equality or a mass-gap claim.

### F1A original theta bivector orientation — pending qualification (2026-11-08)

[Original F1A proof candidate](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1AOriginalThetaBivectorCommutator.lean)
and [independent consumer](../../lean/diagnostics/BFSSF1AOriginalThetaBivectorIndependentAudit.lean)
were added at [commit `1cdf60a`](https://github.com/etblink/math/commit/1cdf60a387fe75b2a65f6fe152fd774ae07ad8de).
They test the literal original Source48 Majorana operators `θ_p` with
`θ_p θ_q + θ_q θ_p = δ_{pq} I` and, for `p ≠ q`, the ordered bivector
`B_{pq}=θ_p θ_q`:

- `B_{pq} θ_p - θ_p B_{pq} = -θ_q`;
- `B_{pq} θ_q - θ_q B_{pq} = +θ_p`.

These are **source-exact CAR sign tests**, not a complete Lie-bracket,
skew-adjointness, original Spin(9) Fock implementation or Hamiltonian theorem.
The first workflow [#42532325615](https://github.com/etblink/math/actions/runs/42532325615)
was cancelled for a Git-blob NUL-byte preflight correction. The next
two [#42532370775](https://github.com/etblink/math/actions/runs/42532370775)
and [#42533094586](https://github.com/etblink/math/actions/runs/42533094586)
were **RED** on new Lean source elaboration (off-diagonal `0 • 1` CAR
specialization and CLM negation/distributivity). The diagonal CAR case
was fixed by the first repair. The latest narrowly repaired source is
[commit `b5a8759`](https://github.com/etblink/math/commit/b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f),
with pending strict [run #42533991101](https://github.com/etblink/math/actions/runs/42533991101).
This retry uses exact `zero_smul` and source-pinned
`ContinuousLinearMap.comp_neg`/`neg_comp` APIs, without changing
the original CAR normalization or theorem statements.
**F1A remains UNQUALIFIED until the latest exact cold source,
independent consumer, warning, and axiom gate finishes successfully.**
The full diagnostics and rejected tactics are in the [Fock/Spin(9)
memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md).

Next after its qualification: original bivector skew-adjointness and
the third-label commuting case, followed by a properly normalized
48-label Lie-algebra implementer and only subsequently group integration.

## Start here

| Question | Starting point | What it does *not* establish |
| --- | --- | --- |
| What is the current research direction? | [Original Fock Spin(9) and closed-form integration memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md) | A global Fock action or closed-domain covariance |
| Is there a shorter operator-algebra route? | [Gauge-fixed projection feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md) | OP0 and OP1 are abstract qualified gates; OP2–OP5 and original-source binding remain open |
| Why must operator fibers use a different weight bound? | [Whole-sector oscillator exclusion](BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md) | A qualified physical spectral sector |
| Which original carriers are actually bound? | [Representation-binding audit](BFSS_SPECTRAL_SOURCE_EXACT_REPRESENTATION_BINDING_AUDIT_2026_11_07.md) | Source-exact equality for all future transports |
| What failed or succeeded procedurally? | [Procedural success/failure review](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md) | That a green gate validates later modules |
| What is the physics-facing conditional argument? | [Spectral confinement E audit](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md) and [C audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) | Mass gap or eigenvalue existence |

## Architecture and exact source entry points

All paths are relative to repository root. Do not reorganize the upstream manuscript collection or rename source files merely for visual tidiness.

### A. Original model and physical carriers

- [`Core.lean`](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean): original `Boson`, `Fermion`, `GaugeGroup`, `FullL2`, `SmoothCore`, source data and charges. **Use these types, not surrogate Fock or boson spaces.**
- [`GaugeCore.lean`](../../lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean): original gauge and physical-space interfaces.
- [`DeformedCharge.lean`](../../lean/OAI/MathematicalPhysics/BFSS/DeformedCharge.lean), [`PotentialBounds.lean`](../../lean/OAI/MathematicalPhysics/BFSS/PotentialBounds.lean): exact source candidates for fermionic growth and quadratic-form estimates.
- [`FormClosure.lean`](../../lean/OAI/MathematicalPhysics/BFSS/FormClosure.lean), [`FormCompactness.lean`](../../lean/OAI/MathematicalPhysics/BFSS/FormCompactness.lean): existing closed-form and **quadratic-moment** compactness interfaces. Do not use a quadratic-moment theorem for the proposed linear-moment tail without a new theorem.

### B. Original Spin(9) geometry and source 48 labels

- [Original source 48-label SO homomorphism](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean): source Spin(9) → original SO(48), algebraic; **not** a continuous Fock implementation.
- [Source gamma faithfulness and central sign](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaFaithfulness.lean).
- [Axis projection](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisProjection.lean), [axis covering](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCovering.lean), and [coordinate equivalence](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCoordinateEquivalence.lean): actual source stabilizer, two-sign quotient, and target H ≃ SO(8). Do not conflate source K with a newly constructed Spin(8).
- [Latest exact target coordinate gate](https://github.com/etblink/math/actions/runs/42498367504): successful at `811d7b7167f0bb4524bf5a1a5ddacd18eef4d7ec`. **Only** its exact source and consumer are qualified by this run.

### C. Fock, Clifford, and Majorana bridge (candidate reuse; inspect gate state)

- [Source 48 Fock index bridge](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockIndexBridgeProbe.lean).
- [Normalized source 48 Fock gamma](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48NormalizedFockGammaProbe.lean).
- [All-vector Clifford square](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48AllVectorFockCliffordSquareProbe.lean).
- [Fock bivector star compatibility](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockBivectorStarCompatibilityProbe.lean).
- [Clifford universal lift](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockCliffordUniversalLiftProbe.lean): **EXPLORATORY / NOT STRICT-QUALIFIED** per source header. The target Clifford map does not supply the missing global source Spin(9) lift.
- Separate pinned [OperatorDependencies snapshot](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies) contains potentially reusable original Fock, gauge and closed-charge proofs; **not all are present or qualified on this branch**.

### D. Spectral, compactness, and negative knowledge

- [Spectral roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md).
- [AB audit](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md), [C audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md), [D and lift audit](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md), [E global averaging audit](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md).
- [Whole-sector operator-column proposal](BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md): distinguishes **Fock-vector bound M=6** from **operator-fiber bound M=12**; neither bound may be applied to the wrong carrier.
- [Procedural failure/success review](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md): preserve exact failed mechanisms, no speculative fix-by-red/green cycling.

## Qualification vocabulary

| Label | Meaning |
| --- | --- |
| **QUALIFIED AT COMMIT** | Exact source theorem, independent consumer and strict gate verified at an identified commit; include workflow/run link and tested SHA |
| **CANDIDATE** | Source exists, but exact independent gate not established for this version |
| **EXPLORATORY** | Research probe, diagnostic or interface test, possibly not compiling under strict policy |
| **CONDITIONAL** | Theorem or analytic argument requires named premises not yet discharged on original source |
| **REJECTED** | Known false, wrong carrier, incorrect sign, or incompatible proof route; preserve explanation |
| **SUPERSEDED** | Historical artifact replaced by a named accepted successor; do not delete provenance by default |

Do not label a whole module `QUALIFIED` just because one theorem or its ancestor passed. A workflow passing at commit A does not qualify new bytes at B. Git history is canonical evidence; this index is navigation, not an alternative source of truth.

## Active bounded next steps

1. **OP0–OP2c strictly qualified at exact commits.** Original `Fermion 2`
   SU(2) action, operator-level orthogonal fixed projection, and its nonzero
   original fixed-vacuum witness are accepted. The abstract OP1 star-algebra
   theorem still requires **source-exact original Spin(9) automorphism**
   and **pointwise gauge-operator compatibility** to apply physically.
2. **NEXT: F1 bounded original-CAR implementation audit and micro-gate.**
   Inspect the actual original 48-label Fock gamma and bivector sources,
   verify CAR normalization/sign/ordering and declaration ancestry,
   and qualify one smallest original Lie-implementer identity with an
   independent consumer before attempting global group integration.
3. **OP3/OP4 alternative remains OPEN, not discarded.** The original
   Source48 Clifford universal-lift and bivector-star modules explicitly
   identify themselves as exploratory/unqualified; simply importing them
   does not establish a star-preserving original Spin(9) action or its
   gauge commutation. Compare the true proof surface against F1 at
   the next mathematical decision checkpoint.
4. **Physical closure afterward:** original gauge and Spin(9) compatibility,
   all sixteen original source supercharge covariances, exact closed
   physical form and Hamiltonian natural domain, then adversarial
   high-type coercivity/compactness analysis. No inferred full BFSS gap.

## Organization and garbage-collection policy

- **Inventory first; deletion last.** Do not move/rename accepted modules, historical gate manifests, strict workflows, or source PDFs as an initial cleanup.
- **Facade modules only when useful:** tiny import-only or small interface modules with explicit source dependencies, no new axioms, no global instance side effects, and independent consumer tests. Measure compile-time impact before adding an umbrella import.
- **Keep original paths stable:** manuscript/site paths and formalization catalogue are upstream contracts; old Lean import paths and manifest hashes are research contracts.
- **Workflow retirement requires an impact review:** identify last qualified run, source/consumer dependency, manifest reference, branch and downstream users. Retire only when a verified successor preserves evidence and the owner authorizes destructive cleanup.
- **No Git history rewrite, branch deletion, source deletion or CI policy weakening** as part of index work.
- New accepted gates should append to a dated qualification ledger (not automatically edit this file) with exact theorem names, source SHA, workflow, consumer, axioms, and dependencies.

## Inventory scope

At baseline, direct directory API listings showed approximately 341 Lean files under `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`, 75 direct core BFSS Lean files, 333 direct entries in `contributions/bfss-kotler/`, and 331 direct workflow files. These are **direct entries on this branch**, not a full recursive repository census or proof-status count. Filename grouping is only a discovery aid, not a semantic classification or dead-code proof.

See companion [read-only dependency/housekeeping audit](BFSS_REPOSITORY_DEPENDENCY_AND_HOUSEKEEPING_AUDIT_2026_11_08.md) for what was inspected and what remains unverified.
