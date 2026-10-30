# V7J qualification; V7K ordered native reflection determinant product candidate

Project Lead, 2026-10-30 UTC. Preserve negative evidence and exact source governance.

## V7J accepted
- Run https://github.com/etblink/math/actions/runs/41070569760: exact source commit 6211a29a3e7908f677a468ecd52de1b5dda3db04, job 124113232909, completed success 2026-10-30T14:30:46Z.
- Accepted source blob 5705f732166cce1bb37ed0fedbdf9a2eeb0f4a8d. Evidence artifact 12984274726, sha256:a6ca3d0024f2e0ed684e8905d379af980803fdfb4d7e88c7eaccf1f34e6b2062.
- 39 fresh warning-as-error source modules PASS, 137 independent exact types and axioms PASS, 81 sealed ancestry PASS. All three new roots had only propext, Classical.choice, Quot.sound; no sorryAx.
- Accepted native source-48-label result: for a Euclidean unit vector, the ACTUAL Mathlib hyperplane reflection has real determinant -1, via explicit double-orthogonal finrank.

## Preserved negative knowledge
- V7J Gate 1 red https://github.com/etblink/math/actions/runs/41040596922: failed restricted simplification of double-orthogonal complement dimension.
- V7J Gate 2 red https://github.com/etblink/math/actions/runs/41056042081: omitted the explicit submodule argument to Submodule.orthogonal_orthogonal.
- Gate 3 repaired the type bridge, without changed theorem statements, accepted sources, altered proof limits or linter suppression.

## New V7K candidate (NOT accepted)
- Source lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7KNativeCartanUnitFactorDeterminantProductProbe.lean; blob 5f95b179116e2f2e088713f2b1ce6ad9e5141dff. Two roots: euclideanIsometry_mul_det and euclideanUnitReflectionList_det.
- The first proves determinant multiplicativity for the *actual* native Euclidean isometry product and corresponding LinearMap, with a typed composition bridge and pinned LinearMap.det_comp.
- The second inducts over the exact ordered List.prod of true unit-normal Mathlib hyperplane reflections to derive det = (-1)^list.length, using accepted V7J for each factor.
- Workflow .github/workflows/bfss-kotler-k1d18v7k-native-cartan-determinant-product-strict.yml enforces 40 fresh warning-as-error modules, 139 independent source-exact ordered declaration types and axioms, 81 sealed ancestor roots, exact SHA pins, Lean 4.34.1 and pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, allowed axioms exactly propext/Classical.choice/Quot.sound, no sorryAx, no raised limits.
- Initial static workflow build caught a mismatched success-marker during preflight and did not publish; the corrected workflow now matches all 139 ordered roots and success markers.
- Qualify V7K ONLY after a completed strict green and independent log review; if red preserve SHA, artifact and first causal error.

## Still open
Evenness from transported original sourceSO determinant +1, source Q-unit pullback and pairing, original sourceSO generation, unconditional Spin48 image surjectivity, topological covering, global Spin9 and BFSS spectral claims are unproved.

No changes to main, accepted modules, canonical FCP or upstream community.