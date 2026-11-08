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

1. **OP0–OP1, operator-projection feasibility:** abstract Mathlib-only orthogonal projection lemma under a genuine complex star-algebra automorphism fixing the gauge unitaries. The [feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md) gives hypotheses, failure tests and exact pinned Mathlib APIs. No full BFSS imports initially.
2. **F1, original 48-Majorana CAR Lie implementer:** exact skewness, commutator action, Lie bracket and normalization on original carriers. See [original Fock memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md). This is the main Fock route, not replaced by OP0.
3. **Source and gate census before imports:** inspect the smallest qualified ancestor chain; choose independent consumers and exact pin inventories before adding expensive operator modules.
4. **Physical closure later:** original SU(2) gauge compatibility, all sixteen original supercharge covariances, closed form and natural Hamiltonian domain. No spectrum assertion before these obligations.

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
