# K1D18V10H — F7 accepted; F8 ambient Clifford-unit source generator bridge

Date: 2026-10-31 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F7 acceptance — strict exact-source evidence

- [Run #41263836500](https://github.com/etblink/math/actions/runs/41263836500), attempt 1, completed SUCCESS, job `124722377538`, exact tested SHA `343c0909f87b0d8c21c10744378d52d42d975c13`.
- Exact source `SU2BFSSPairedSpin9V10HF7TwoSignObstructionDiscriminatorProbe.lean` blob `9b9a2f85c8cbd8588c1d86fba92b4b6cffa16973` was freshly compiled with `-DwarningAsError=true` after pinned Lean `v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and verified F6 ancestors rebuilt. Five independent exact source theorem-type elaborations and axiom whitelist passed. Only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Unconditional results: the direct genuine source Spin9 character `gammaDetDirectHom` has sign +1 or -1; a negative value occurs iff the element is outside the accepted orientation subgroup; that subgroup is proper iff such a witness exists; such a witness (if supplied) refutes exact source perfectness. `source9OrientationSubgroup_eq_top_iff_all_positive` is an iff, not a proof of either side. **No negative element constructed. No global +1 theorem.**
- [Artifact #13067120513](https://github.com/etblink/math/actions/runs/41263836500/artifacts/13067120513), SHA256 `bbe223ca40e042e5089b900094c6a9d5840994079cccd9151ff0a248dfbaf7aa`, nonexpired when checked.

## Method decision — actual source generation instead of more determinant equivalences

Pinned Mathlib `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` explicitly defines `lipschitzGroup Q` as the closure in Clifford units of the unit generators whose underlying Clifford element equals `CliffordAlgebra.ι Q v` (line 62), `pinGroup Q` as the intersection of the corresponding unit image with the Clifford unitary submonoid (lines 152-155), and `spinGroup Q` as the intersection of `pinGroup Q` with the even submonoid (lines 291-294). In particular, the source Spin group elements map into the Lipschitz group of Clifford units through the actual `spinGroup.toUnits` map.

Accepted `SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean` constructed the **exact real gamma16** `source9GammaCliffordAlgHom` and proves `source9GammaCliffordAlgHom_generator v`, identifying every original Clifford generator with the actual `gammaNineRealLinear v`. Accepted V10D source `source9SpinGammaMatrixUnitsHom` uses the same `spinGroup.toUnits` and `Units.map`. Accepted F5 determinant `gammaDetDirectHom` is therefore expected to be the restriction of the ambient Clifford-unit determinant.

This suggests a new (not yet proved) direct argument: prove sign/positivity of `det(gammaNineRealLinear v)` for **invertible original Clifford vector generators**, propagate the property through the Lipschitz subgroup closure, then intersect with the unitary-even source to obtain +1 (given source orthogonality). This would avoid a source-perfectness theorem and avoid the earlier failed nested MonoidHom elaboration. **The sign or positivity generator lemma and closure induction are OPEN.** Do not claim that all source Spin9 elements are squares.

## F8 four-declaration bridge — CANDIDATE ONLY

The strict candidate `SU2BFSSPairedSpin9V10HF8CliffordUnitsGeneratorDetBridgeProbe.lean` tests:
1. `source9CliffordUnitsGammaDetHom : (CliffordAlgebra source9Quadratic)ˣ →* ℝ` constructed directly by source AlgHom and matrix determinant identities.
2. `source9CliffordUnitsGammaDetHom_apply` as the exact original source Clifford unit evaluation.
3. `source9CliffordUnitsGammaDetHom_spin_apply`, transferring through the ORIGINAL `spinGroup.toUnits` into qualified F5 `gammaDetDirectHom`.
4. `source9CliffordUnitsGammaDetHom_generator`, identifying determinant of an invertible original Clifford vector generator with the exact original gammaNineRealLinear matrix determinant; the generator is supplied explicitly, not inferred for arbitrary v.

Strict source hash, warning-as-error compilation, and four independent source types/axiom audits required. F8 is UNQUALIFIED until green. No new axioms, limit increases, changes to accepted sources, mathlib dependencies, original 48-label ordering, main or upstream. No assertion of `gammaDetDirectHom = 1` globally, SO48, Spin48 lift/cover, source topology/continuity, implemented Fock action or BFSS spectral claims.

## Negative evidence retained

- Original V10H Gate1 red #41257058496 and Gate2 red #41257744030: deeply composed determinant hom and incorrect orthogonalGroup iff projection.
- F4 Gate1 red #41260509990: omitted `Submonoid.coe_one` under underlying matrix determinant.
- F5 Gate1 red #41261931766: documentation-only negative term falsely rejected by unscoped preflight.
- F1-F7 accepted immutable source and respective hashes remain unchanged.
