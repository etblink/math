# K1D18V10H — F10O accepted; F10P pinned Lipschitz-subgroup positivity candidate

Date 2026-11-01 UTC/PDT. Authorized branch research/fcp-k1d17-ancestor-cache-pilot-20261028.

## Exact verified F10O acceptance
- [Strict gate #41284622755](https://github.com/etblink/math/actions/runs/41284622755) completed SUCCESS attempt 1, job 124783300884, tested SHA 90bca6a2ed57edcc138612468106a722cc6233d3. Accepted original F10O source blob 759ca747a5dcfb165c2cd6b70e1df59dae21ece5.
- Public original real Clifford gamma and F9/F10E–F10N exact ancestor hashes preflight PASS. Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored PASS; F10N accepted ancestry rebuilt PASS; fresh -DwarningAsError=true compiled PASS; three independent exact declaration types and root axiom whitelists PASS.
- Accepted theorems: source9CliffordUnitsGammaDetHom_ne_zero; source9CliffordUnitsGammaDetHom_pos_generator; source9CliffordUnitsGammaDetHom_pos_inv_of_pos. Nonzero real determinant character on every actual Clifford unit, strict positivity on actual source invertible Clifford-vector generators, preserved strict positivity under inversion. Only propext, Classical.choice, Quot.sound, no sorryAx.
- [Immutable F10O artifact #13075295619](https://github.com/etblink/math/actions/runs/41284622755/artifacts/13075295619), SHA-256 80a1d1a72efccf002865cd036604eabc2c366dcff8f6cf4698ca4c0936a257f9.

## Next F10P exact source-only candidate
- At pinned Mathlib commit, Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean defines lipschitzGroup Q by Subgroup.closure ((↑) ⁻¹' Set.range (ι Q)) on genuine Clifford units and supports Subgroup.closure_induction'' on source generators, their inverses, identity and products. Mathlib also has spinGroup.toUnits and spinGroup.units_mem_lipschitzGroup for real source Spin9 elements.
- Candidate source9CliffordUnitsGammaDetHom_pos_of_mem_lipschitzGroup: every ACTUAL original source Clifford unit u in its actual Lipschitz group has positive real determinant, using accepted F10O generator positivity, inverse positivity, f(1)=1 and monoid-hom map_mul plus mul_pos. No assumption of group perfectness, topology, or continuity.
- Candidate gammaDetDirectHom_pos_of_source_spinGroup: every genuine original spinGroup source9Quadratic element has strictly positive exact F5 determinant character, by pinned toUnits membership, F10P Lipschitz theorem and accepted F8 source9CliffordUnitsGammaDetHom_spin_apply.
- The actual spinGroup determinant value = +1 and source9OrientationSubgroup = ⊤ are NOT claimed in F10P. If F10P qualifies, next gate can combine strict positive sign with F1 gammaDetDirectHom_sq and F7 exact iff for source orientation subgroup, without new group-perfectness assumptions.
- F10P is UNQUALIFIED until fresh strict pinned warning-as-error compile and independent exact two-type/axiom whitelist checks pass. The workflow pins F9 and F10E–F10O ancestors and every F10P byte.

## Negative knowledge, formal/physical scope
- F10N Gate1 #41282125837 RED linter.unnecessarySimpa, Gate2 #41282891158 RED linter.unreachableTactic, Gate3 #41283603623 GREEN. Both red source artifacts retained, warning-as-error remained mandatory. Earlier failed F10 private signed-permutation #41266215820/#41266892206/#41267510559 and F10D #41268424166, F10E first #41269330982, F10F first #41270798888, F10H first #41273184444 remain unqualified RED.
- F1–F9 and F10E–F10O qualified and frozen. A Spin9 determinant character result is strictly narrower than original paired SO(48) action, Spin(48) global lift, original paired Fock basis permutation, spectral existence or claims about physical BFSS.
- No sorry/admit/native_decide, extra axioms, altered theorem statements, private gamma tables, dependency/toolchain changes, artificial resource increases, `main` publishing, external upstream PR or unauthorized source changes.
