# BFSS unified integration — initial source import (2026-11-08)

Integration branch: `integration/bfss-unified-research-20261108`
Base: `d3e524c0b660cec8f55f42ae1fb6019ae5afd7b7`
Source repository: `etblink/math`
Source snapshot: `contribution/bfss-lean-v040-20261105@fa00aa36e770ca516f57b41f5b02229a5033d50f`

This first, non-destructive integration adds 468 source-blob-identical Lean files missing from the active `OperatorDependencies` directory. The 30 existing files are retained unchanged, including 4 whose source bytes differ. The four differing source revisions are copied verbatim under `research-sources/math/v040-conflicts/OperatorDependencies/` so neither version is lost. No original source branch is changed.

The new working-tree modules are copied Git objects, **not newly Lean-qualified**. Historical CI qualifications stay attached to their exact original commits. This source import does not prove full-project Lean compilation, axioms, physical Fock integration, spectral confinement, or positive-energy eigenvalues. Do not rewrite evidence hashes or assume a copied module inherits a green CI status; qualify relevant consumer closure separately.

Next: verify the committed tree and perform source-pinned FCP import planning, preserving origin paths and source statuses. This document is a small navigation note, not a new governance layer.
