# RHOPF-P9C3D2G1D45 — source Q orthonormal Euclidean representation intake

**Pacific date:** 2026-11-21. **Disposition: UNQUALIFIED** pending strict native, independent, six-file ZIP and eight axiom reports.

## Accepted evidence and reason for D45
D44 R1 [original strict run #44924031882](https://github.com/etblink/math/actions/runs/44924031882) succeeded at exact tested commit `4577f973a2242ca5992d313a47dceaa667521275`. Its original evidence artifact #14715915055 SHA-256 `f858edce5386124bd501c844d466c94877686677b3a1a715afe8104a21291ded` was independently recalculated, ZIP integrity checked and exact tested commit verified. Acceptance-only commit `5fd5ac75ad5df70bc2fffe8d4eea4acf2808ca3b`.

D41 already built the **detached, source-original Gamma9 Q-inner product**, with norm squared Q. D43 proved complex rank two; D44 proved a complex-*linear* (not isometric) equivalence and source-Circle intertwining.

The owner suggested `OrthonormalBasis.stdOrthonormalBasis` and `OrthonormalBasis.repr`. Inspection of pinned Mathlib `Mathlib.Analysis.InnerProductSpace.PiL2.lean` shows the **actual constructor name at root level** `stdOrthonormalBasis 𝕜 E`; `OrthonormalBasis.repr` is the field defining a **complex linear isometric equivalence** to `EuclideanSpace 𝕜 ι`. The codomain is the normed `EuclideanSpace ℂ (Fin 2)`, not bare unnormed `Fin 2 → ℂ`.

## Bounded gate
1. Install only **local** D38 NormedAddCommGroup, D40 NormedSpace and D41 InnerProductSpace on original isolated carrier; derive local FiniteDimensional from D43 original complex rank two.
2. Select the noncanonical standard **source-Q orthonormal basis** with pinned Mathlib `stdOrthonormalBasis ℂ RelationalSourceComplexFour`.
3. Obtain its bundled `OrthonormalBasis.repr` `RelationalSourceComplexFour ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2)`.
4. Strictly prove **squared norm of the actual isometry output equals the original Gamma9 source Q**, and source-original Gamma9 Circle action intertwines under that isometry.

Freeze exact original Gamma9 SHA pins and new D45 files and original D44 source, Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original integer fixture. Native original Lean and independent imported consumer warnings-as-errors, four native plus four independent axioms restricted to `propext`, `Classical.choice`, `Quot.sound`. Archive and verify original ZIP artifact/digest and exact tested commit before acceptance.

## Boundaries
A noncanonical source-Q isometry is a **mathematical** identification, not necessarily equal to D44's prior arbitrary algebraic coordinate choice. It would transport the original **unit-Q sphere** to the standard Euclidean unit sphere and preserve the source Circle scalar action, but D45 itself does not assert topological homeomorphism on the restricted sphere, Hopf quotient or Chern class. No original Fock/Gauss/Hamiltonian, stable hopfion, Standard Model or mass-gap conclusion. Original Gamma9 sources and `main` unchanged. Preserve RED evidence.
