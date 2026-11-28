# Research library

This is the entry point for the independent downstream research program. We are seeking truth, not validating a particular framework. Mathematical theorems, finite calculations, conditional arguments and empirical claims have different evidence standards.

**Current state: maintenance freeze.** Start with the [current roadmap](../BFSS_ACTIVE_ROADMAP.md) and [maintenance register](maintenance/README.md). The [truth-first charter](methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md) governs all tracks.

## Find existing knowledge before starting research

- [Consolidated scientific knowledge atlas](maintenance/knowledge-atlas/README.md): declaration lookup, source identity, scoped results, editorial prerequisite graph and direct lexical imports.

- [Machine-readable file inventory](maintenance/RESEARCH_INVENTORY_2026_11_28.json): 5,846 pre-consolidation files with exact Git blob, byte size, location and coarse kind. Not a qualification index.
- [CI run metadata and evidence index](maintenance/ci-run-index/README.md): 2,319 provider run records (success/failure/cancellation are not theorem status).
- [Normalized legacy gate index](maintenance/NORMALIZED_LEGACY_GATE_INDEX.json): 187 distinct run IDs and 224 scalar record variants extracted from the original nested registry.
- [Receipt discovery join](maintenance/RECEIPT_DISCOVERY_JOIN.json): 483 linked run IDs, 401 with known memo/receipt pointers; not an exhaustive qualification index.
- [Physical existence atlas](methodology/SCIENTIFIC_KNOWLEDGE_ATLAS_PHYSICAL_EXISTENCE_PILOT.md) and [machine-readable pilot](methodology/SCIENTIFIC_KNOWLEDGE_ATLAS_PHYSICAL_EXISTENCE_PILOT.json).
- [Historical monograph theorem atlas](../contributions/bfss-kotler/internal-monograph/THEOREM_ATLAS.json).
- [Original gate registry](../BFSS_GATE_STATE.json): preserved pending reconciliation; dated records must be read in their original scope.
- [Archived workflow provenance catalogue](../archive/ci-workflows/README.md) and [historical roadmap](https://github.com/etblink/math/blob/3f38e7d79ef7e49f5c8a5dcf37276d7b4d1e77bd/BFSS_ACTIVE_ROADMAP.md).

## Research tracks (pre-consolidation file counts)

| Track | Files | Location |
|---|---:|---|
| Computational research | 1,051 | [computational](computational/) |
| Original-field spectral research | 672 | [spectral-p2-original-field](spectral-p2-original-field/) |
| Topology and Hopf | 480 | [topology](topology/) |
| Quantum information / SCC | 247 | [quantum-information](quantum-information/) |
| Integration records | 116 | [integration](integration/) |
| Standard Model | 110 | [standard-model](standard-model/) |
| Top-down symmetry | 104 | [top-down-symmetry](top-down-symmetry/) |
| Unification | 24 | [unification](unification/) |
| Methodology | 20 | [methodology](methodology/) |
| Incidence Before Identity | 18 | [incidence-before-identity](incidence-before-identity/) |
| Theory bridges | 1 | [theory-bridges](theory-bridges/) |

Counts include evidence and code; they are not theorem counts. No research or Lean files were moved. Navigation and status indexing come first. The original [BFSS Lean source](../lean/OAI/MathematicalPhysics/BFSS/) and [contributions](../contributions/) remain at their existing paths.
