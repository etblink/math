# RHOPF-P9C3D2G1D50 — original Gamma9 Circle-orbit reachability correspondence strict intake

**Date (Pacific):** 2026-11-21. **Disposition: UNQUALIFIED** pending full original strict CI and independent ZIP verification.

## Accepted original evidence
D49 R2 [strict GREEN run #44940760360](https://github.com/etblink/math/actions/runs/44940760360), tested exact commit `9beb2767515b9d8de0ce9dc072090d84d374d1e7`, original artifact #14721918817 ZIP SHA-256 `4aaa3dcfd56c76d8bd9289932949757fc84fa87d024c9547a2455c45225bdc6f`; independently downloaded, SHA digest match and ZIP integrity verified; six members and exact embedded tested commit match. Original Gamma9 preflight and independent integer fixture PASS. Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 9,096 dependency jobs PASS. Three source-native and three independent `#print axioms` reports clean with only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`; corrected Python strict checker PASS. D49 accepted evidence-only commit `2b604fd7481f696459ce3d8f1891800c556e8bb9`. Original D49 R1 RED #44938565865 retained in research history, not rewritten or promoted.

## Mathematical boundary
The source exact D49 declarations restrict the **actual source Gamma9 Circle matrix action** to the original-Q unit sphere and the usual scalar action to the standard norm-one subset of `EuclideanSpace ℂ (Fin 2)`. D48's source-Q topology homeomorphism `H` intertwines them pointwise, `H(g·x) = g·H(x)`.

D50 defines only TWO EXPLICIT reachability predicates:
- `relationalSourceQUnitCircleRelated x y := ∃ z : Circle, sourceOriginalQUnitAction z x = y`;
- `relationalEuclideanUnitCircleRelated u v := ∃ z : Circle, standardCircleAction z u = v`.
It proves the precise transport statement `sourceRelated x y ↔ standardRelated (H x) (H y)` using D49's accepted conjugacy and H injectivity. The two-point relations are not yet packaged as Setoid/orbitRel quotients, and no new group action instance or global metric/topology is installed. No contact with original Gamma9 source implementation or BFSS Fock sector.

## Next gates and stop rule
After D50 independently strict GREEN, prove source/standard Circle unit-sphere identity and multiplication laws as separately checked group actions, then the topological continuity and quotient construction; only then compare with `MulAction.orbitRel` and standard Hopf quotient `S³/U(1)≅CP¹≅S²`. Characteristic classes/Chern and physically stable BFSS hopfions require additional independent chains. Note pinned Mathlib `Mathlib/GroupTheory/GroupAction/Defs.lean` contains `MulAction.orbitRel` and quotients, but none is currently declared on these isolated source unit-sphere types.

## Strict source pin contract
Freeze all accepted source SHA pins through D49 and D50 native source and imported independent consumer, original Gamma9 source fixture, Lean 4.34.1 and exact pinned Mathlib; warnings-as-errors native and independent consumers must each yield three exact axiom reports, allowed only `propext`, `Classical.choice`, `Quot.sound`. Verify original archived ZIP SHA/integrity/embedded tested commit before promoting. Preserve any RED. `main` and accepted math remain untouched.
