# BFSS repository dependency and housekeeping audit — Phase B baseline

**Date:** 2026-11-08  
**Branch:** `research/bfss-original-gamma-faithfulness-20261107`  
**Inspected baseline:** `22767adb51188d0e1f0ef6ff2be708225f5257b9`  
**Method:** GitHub read-only directory inventories and selected exact source-file reads; this audit file is documentation only.  
**Scope limit:** This is a **sampled import census**, not a complete transitive import graph, compile-time profile, dead-code proof, or repository-wide garbage collection authorization.

## Executive finding

The repository has enough BFSS research artifacts that a navigation catalogue and explicit status vocabulary are immediately worthwhile. **Do not initiate bulk renames, source moves, workflow deletions, or a single large umbrella module.** First map exact dependencies and qualification. Preserve original upstream manuscript and site contracts.

### Direct directory inventories (one branch, not recursive)

| Directory | Files/direct entries | Interpretation |
| --- | ---: | --- |
| `lean/OAI/MathematicalPhysics/BFSS/` | 75 direct Lean files; one `Contrib` subdirectory | Original BFSS core |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/` | 341 direct Lean files | Active and historical source/candidate proofs; not 341 qualified theorems |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/` | 4 direct Lean files | Only these four files on **this branch**; a separate pinned snapshot contains many more |
| `contributions/bfss-kotler/` | 333 direct entries before new navigation files | Research memoranda, gate records, manifests and historical provenance |
| `.github/workflows/` | 331 direct workflow files | Broad history of independent and strict BFSS gates; **not** proof of 331 active required workflows |

**Classification caution:** A coarse filename grouping suggested roughly 207 Spin9/geometry-named, 38 Fock/CAR-named, 80 physical/gauge-named and 16 other files under Kotler; categories overlap semantically and are not authoritative. Do not use them as proof of duplication.

## Sampled exact import edges

These were inspected from source content, not inferred from filenames.

| Source file | Direct import(s) seen | Interpretation |
| --- | --- | --- |
| `BFSS/Core.lean` | `Mathlib` | Foundational original source carriers and smooth-charge model; broad Mathlib import is pre-existing |
| `BFSS/FormCompactness.lean` | `Mathlib`; `BFSS.FormClosure` | Existing **quadratic** moment theorem; not a drop-in linear-moment proof |
| `Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean` | `...F10QSourceSpinOrientationDetOneProbe` | Source 48-label SO homomorphism, **algebraic only** |
| `Kotler/SpectralSourceNineAxisCoordinateEquivalence.lean` | `...SpectralSourceNineAxisCoordinateExtension`; `Mathlib.Topology.Algebra.ContinuousMonoidHom` | Candidate interface for original target H ≃ SO(8); [qualified gate](https://github.com/etblink/math/actions/runs/42498367504) at exact earlier source SHA |
| `Kotler/SU2BFSSSource48FockCliffordUniversalLiftProbe.lean` | `...SU2BFSSSource48AllVectorFockCliffordSquareProbe`; `Mathlib.LinearAlgebra.CliffordAlgebra.Basic` | Explicitly exploratory and **not strict-qualified**; source square is a parent |
| Separate `OperatorDependencies/SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean` | `...SU2BFSSG4K1PhysicalSpaceCoreProbe` | Source at pinned **different commit**, not present as such in active branch; pointwise nonzero radial profile does not prove nonzero L² class |

The immediate bottleneck is **status and source-carrier binding**, not simply directory size. A facade importing a candidate cannot make it qualified.

## Proposed module contracts (no modules created in this audit)

### Contract G — source geometry

Inputs: exact source Spin(9), gamma and original 48-label representations.  
Exports: named source SO(48) homomorphism; central-sign theorem; axis stabilizer projection and H ≃ SO(8) coordinate interface.  
Explicit exclusions: global Fock-vector unitary lift; Spin(8) classification not yet source-bound; spectral assertions.

### Contract F — original Fock and CAR

Inputs: exact `Fermion 2`, original 48 labels and Majorana normalization.  
Exports, **only after qualification**: CAR square, adjointness, quadratic Lie implementer, Cartan bounds and Clifford star-algebra bridge.  
Explicit exclusions: source Spin(9) lift until independently proved; no surrogate Fock type or changed Clifford normalization.

### Contract P — physical operators

Inputs: original `Core`, `GaugeCore`, sixteen charges, closed physical charge/form operators.  
Exports, **only after qualification**: original gauge-physical Hilbert space and charge-output covariance; exact closed form, natural domain and self-adjoint Hamiltonian.  
Explicit exclusions: abstract unitary equivalence without original-domain identification.

### Contract S — spectral research

Inputs: qualified G/F/P interfaces, original smooth-core form, finite growth bound, representation-sector nonvanishing and compactness.  
Exports: conditional inequalities first; only then source-exact reducing-sector coercivity and compact resolvent.  
Explicit exclusions: claiming full BFSS mass gap or transferring Fock-vector `M=6` to operator-fiber `M=12`.

**Interface implementation rule:** Add a facade only after a consumer proves the imported exact declarations and its transitive ancestry is manageable. An import-only facade may improve discoverability, but cannot reduce Lean's transitive compilation cost by itself. Do not introduce `import Mathlib` in a new facade unless measured and necessary.

## Garbage collection: candidates, not deletion targets

1. **Old strict workflows:** candidate for *inventory and grouping*, not immediate removal. Before retiring a workflow, record its last exact green run, source SHA, consumer root, manifest and any evidence-retention obligations. Historical failure/qualification records must remain findable.
2. **Superseded diagnostic probes:** annotate with successor theorem and explicit failure mechanism. Move only if import paths, manifests, tests and archived source hashes can be updated without breaking reproducibility; prefer leaving historical paths intact.
3. **Duplicated research memoranda:** add a canonical index entry and mark older reports historical; don't discard distinct negative results.
4. **Unqualified source ports:** retain as exploratory with exact dependency and blocked theorem; don't expose them via a stable qualified facade.
5. **Generated build artifacts:** inspect tracking and ignore rules before proposing removal; never delete unexamined files from the repo or rewrite Git history.

**Decision:** No destructive GC is justified by the current evidence. Repository size alone is not proof of redundancy.

## Phase B continuation: executable future audit checklist

The next read-only or locally scripted audit should produce a machine-readable inventory from a **full Git tree at an exact commit** (the GitHub directory API was sufficient only for this sampled census):

- `path, blob_sha, size, import_edges, namespace, public_declarations, #print_axioms inventory`.
- `gate_workflow, run_id, tested_sha, source_root, consumer_root, manifest, dependency_pin, qualification_status`.
- `downstream_importers`, including tests and workflows that reference a path by literal filename.
- `status`: QUALIFIED_AT_COMMIT / CANDIDATE / EXPLORATORY / CONDITIONAL / REJECTED / SUPERSEDED / UNKNOWN.
- `candidate_action`: retain / index / extract facade / repair / retire-after-owner-review.
- Exact runtime benchmarks before and after any facade/ancestor change; never assume an import wrapper is faster.

Graph checks: cycles (should be impossible in successful Lean imports), duplicate theorem *statements* versus different source carriers, high in-degree ancestors, isolated unreferenced modules, strict-workflow references, and stale source hash pins. Treat an unreferenced module as **candidate for investigation**, not automatic garbage.

### Bounded follow-up experiment

The first candidate is **OP0–OP1** (generic gauge-fixed projection invariance) from [the feasibility memorandum](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md). Its diagnostic should import only pinned Mathlib projection/star-algebra APIs, then be independently consumed. Do not begin with a full BFSS source graph or a physical spectrum claim.

The parallel main-line candidate remains **F1** (source-exact 48-Majorana Lie implementer), using [the original Fock memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md). The choice between OP3–OP4 and F3 must be based on measured source-qualification and import costs.

## Upstream and provenance boundaries

The repository's root `AGENTS.md` says not to rename or move `preprints/<paper>/` directories; links, citations and `lean/formalization.yaml` depend on their names. `CONTENTS.md` and the site generator are upstream contracts. Keep BFSS changes scoped to contribution docs and later authorized source modules.

Preserve original strict source/consumer/axiom checks and cold builds. No `sorryAx`, untracked assumptions, new axioms, hidden cache shortcuts, workflow relaxations or acceptance inferred from a green ancestor. The Git repository history and exact qualified workflow are canonical evidence; these new indices are navigation aids.

## Phase decision

- **Phase A navigation:** implemented in [BFSS Project Map](BFSS_PROJECT_MAP_2026_11_08.md).
- **Phase B sampled read-only audit:** this file; **complete transitive graph remains outstanding**.
- **Phase C facade extraction:** deferred pending full import graph and bounded independent consumer.
- **Phase D garbage collection:** deferred pending evidence and explicit review.

**Change scope:** This audit adds only documentation. No Lean module, workflow, manifest, dependency pin, manuscript, or source file is moved, modified or deleted.
