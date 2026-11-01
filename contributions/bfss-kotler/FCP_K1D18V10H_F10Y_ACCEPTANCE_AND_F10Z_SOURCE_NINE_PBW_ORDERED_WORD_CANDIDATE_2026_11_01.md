# F10Y accepted; F10Z source-nine PBW ordered word qualification

Date: 2026-11-01. Research branch: research/fcp-k1d17-ancestor-cache-pilot-20261028. Parent: 65e6f25cd0f8711aac6e7bcfeb75f9ebca3d8cfe.

## F10Y accepted
[Run #41332774858](https://github.com/etblink/math/actions/runs/41332774858) completed success at parent commit (attempt 1), pinned Lean v4.34.1, Mathlib revision d13f23b723b8a846827a245b89c10fc7d3f11612, exact original source Cl9 and F20B method, warnings-as-errors fresh Lean compilation, and two exact independently elaborated declaration/axiom audits. Audit marker: V10H_F10Y_TWO_SOURCE_NINE_PBW_TYPES_AXIOMS_PASS; permitted root axioms propext, Classical.choice, Quot.sound; no sorryAx.

[Acceptance artifact #13093879985](https://github.com/etblink/math/actions/runs/41332774858/artifacts/13093879985), zip SHA256 93a9bc14e6a995202567f31f09a17d76b61296623083b0ad9e5a7b76c855dc32.

Accepted source nine-dimensional Clifford PBW real basis `source9CliffordPBWBasis` and `source9Clifford_finiteDimensional`. **This does not establish even gamma injectivity**. Avoid an erroneous conclusion from finite dimensionality or from an exterior equivalence that is real-linear, NOT multiplicative.

## F10Z candidate — source nine exterior PBW ordered words

Use the SOUND proof pattern of imported original FCP K1D2C `SU2BFSSPhysicalDomainS1V52K1D2COriginalExteriorPBWBasisOrderedWordProbe.lean` (the original 48-source branch has a different carrier and may contain elevated limits; do not import or claim its qualification). Adapt only the method to the actual 9-dimensional Spin9 source.

Candidate declarations:
- `source9ExteriorPBWBasis`: nine-coordinate source exterior basis.
- `source9ExteriorCoordinateWord`: genuine ordered source exterior word.
- `source9ExteriorPBWOrderedLabels`: source nine-dimensional finite-set order.
- `source9ExteriorPBWBasis_eq_coordinateWord`: source exterior PBW monomials equal ordered coordinate exterior products.
- `source9ExteriorPBWOrderedLabels_nodup`: each PBW label word has distinct coordinates.
- `source9CliffordPBWBasis_eq_exteriorWord`: F10Y's actual source Clifford PBW basis monomials map back through REAL-LINEAR `CliffordAlgebra.equivExterior` to the exact source nine-coordinate exterior word.

This stage supplies an exact ordered word interface, not the unknown product identity on the Clifford side. Later proof must show even Clifford gamma matrix word independence (up to 256 real basis elements), not infer it by dimension alone.

Enforce source blob pins, Lean/Mathlib freeze, source F10Y ancestry rebuild, warning-as-errors compiler, independent exact declaration-type and root-axiom audit for all six declarations. No `sorry`, unproved axioms, `maxHeartbeats` or `maxRecDepth` increases; no main/upstream merge, topological Spin48 lift, Fock implementer, BFSS physical claims.
