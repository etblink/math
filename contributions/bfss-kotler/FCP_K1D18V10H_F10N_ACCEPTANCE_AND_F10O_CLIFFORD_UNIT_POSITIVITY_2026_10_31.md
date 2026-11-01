# K1D18V10H — F10N ACCEPTED; F10O Clifford-unit generator positivity candidate

Date: 2026-11-01 UTC / 2026-10-31 PDT; research branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Exact independent strict F10N acceptance
- [F10N Gate 3 #41283603623](https://github.com/etblink/math/actions/runs/41283603623) completed SUCCESS attempt 1, job 124780326081, tested SHA ae952d2efadcebfaeb8eae312b3a6e9fd228ec52; exact qualified F10N source blob 85ebcbfbe9929f249376e79ab735d4f3c2180e5b.
- Exact original gamma and F9/F10E–F10M ancestors pinned PASS, Lean v4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored PASS. Qualified F10M source rebuilt PASS. Fresh F10N warning-as-error compilation PASS. Four independently elaborated original declaration types and exact root axiom whitelists PASS; only propext, Classical.choice, Quot.sound, no sorryAx.
- [Qualified artifact #13073948274](https://github.com/etblink/math/actions/runs/41283603623/artifacts/13073948274), SHA-256 a6165a865307c544d21acae4a86c2fe4e73df32c4eff2c95cd87aa21d2f3d381.
- ACCEPTED original source declarations: gammaNineRealLinear_det_eq_source9Quadratic_pow8_of_ne, gammaNineRealLinear_det_eq_source9Quadratic_pow8, gammaNineRealLinear_det_nonneg, source9CliffordUnitsGammaDetHom_generator_positive_branch.
- Original 16-real-spinor gamma det Gamma(v) = Q(v)^8 for EVERY original nine-vector, including v=0. Genuine source Clifford unit u representing CliffordAlgebra.ι source9Quadratic v has ambient determinant character Q(v)^8. This is source exact, not global Spin9 orientation or original paired SO48/Spin48 lift.

## Negative knowledge, preserved and contrasted
- [F10N Gate1 red #41282125837](https://github.com/etblink/math/actions/runs/41282125837), source SHA 2fedac384ed94c92d8d320b3df480fba51e1303c, artifact #13074091748 sha256 6227873a4fe428353583206aad7bce2ef32f8021987a6af4cf2d9dcfd0296637. Exact zero-vector branch `simpa [hQ] using h` was rejected by linter.unnecessarySimpa, warning-as-error.
- [F10N Gate2 red #41282891158](https://github.com/etblink/math/actions/runs/41282891158), source SHA a8ee42c9b575f667fb6a6098f44be21a938bd93b, artifact #13074561398 sha256 740dc1d23923e65e26d37c51dda4959eeb8ec0a7d03acfc07321783e1e11ba00. `simp [hQ] at h ⊢ <;> exact h` caused linter.unreachableTactic; simp already solved the branch. Gate3 correct source line is only `simp [hQ] at h ⊢`.
- Both failed run artifacts are retained; neither is accepted. Lessons: simple exact proof steps, respect full linter and warningAsError, remove dead tactics rather than suppress warnings, never mistake axiom prints following a failed compiler step for qualification.
- Earlier private gamma F10 #41266215820/#41266892206/#41267510559, unsafe F10D #41268424166, initial F10E #41269330982, F10F #41270798888 and F10H #41273184444 remain preserved red. Successful F1–F9 and F10E–F10N remain qualified/frozen.

## New F10O bounded next stage — candidate ONLY
- Pinned Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean at exact committed Mathlib defines lipschitzGroup Q as `Subgroup.closure ((↑) ⁻¹' Set.range (ι Q) : Set (CliffordAlgebra Q)ˣ)` and defines spinGroup Q in its unitary-even part with `spinGroup.units_mem_lipschitzGroup`. Consequently a direct source-exact algebraic route is available to proving the original Spin9 gamma determinant is +1 without assuming group perfectness, abstract connectedness, or source Spin9 square generation.
- F10O independent candidate 1: `source9CliffordUnitsGammaDetHom_ne_zero`: the ACTUAL determinant monoid hom maps EVERY genuine Clifford algebra unit to a nonzero real value, by f(u)*f(u⁻¹)=1. No assumption that the monoid hom codomain is a group.
- F10O candidate 2: `source9CliffordUnitsGammaDetHom_pos_generator`: if the ACTUAL unit u represents original Clifford vector generator ι Q v, then f(u)>0 by accepted F10N Q(v)^8 and the unit nonzero fact.
- F10O candidate 3: `source9CliffordUnitsGammaDetHom_pos_inv_of_pos`: f(u)>0 implies f(u⁻¹)>0 from the exact monoid hom product identity; needed for genuine closure induction.
- F10O is NOT qualified until fresh pinned warning-as-error compilation and three independent exact declaration type / root axiom checks PASS.

## Next after F10O, still OPEN
- Use the exact pinned source `Subgroup.closure_induction''` with `mem`, `inv_mem`, `one`, `mul` cases to prove f(u)>0 for EVERY actual unit u in lipschitzGroup source9Quadratic. No new generators assumed. Then use `spinGroup.toUnits`, pinned `spinGroup.units_mem_lipschitzGroup`, accepted `source9CliffordUnitsGammaDetHom_spin_apply` and `gammaDetDirectHom_sq g` to establish gammaDetDirectHom g=1 on EVERY genuine source Spin9 element. Only a verified strict theorem supports `source9OrientationSubgroup = ⊤`.
- The exact source Spin9 orientation proof would NOT by itself establish the original 48-real Fock-order Spin9 representation, SO48 covariance, global Spin48 lift/cover/surjectivity or any BFSS physics.

## Strict governance
- Immutable qualified source F1–F9/F10E–F10N; no sorry/admit/native_decide, extra axioms, weakening, private source gamma substitutions, toolchain/hash changes, compiler limit hikes, Fock basis permutation changes, main push or third-party upstream publication without explicit authorization.
