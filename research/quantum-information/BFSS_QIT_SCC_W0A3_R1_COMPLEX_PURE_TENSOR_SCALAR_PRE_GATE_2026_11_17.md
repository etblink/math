# BFSS × QIT × SCC W0A3 R1 — complex pure-tensor scalar generator transport

Date: 2026-11-17 Pacific. **Pre-gate contract only; W0A3 unqualified.** Unified branch `integration/bfss-unified-research-20261108`; no `main` edits. This contract precedes proof and strict-gate implementation.

## Exact first mathematical atom

For each complex scalar `z : ℂ` and original real source vector `v : Source48Vector`, prove on the actual original 24-mode `Fermion 2` Fock carrier:

```lean
theorem originalComplexEquiv_pureTensorGenerator_eq_activeGamma
    (z : ℂ) (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (z ⊗ₜ[ℝ] v)) =
      z • FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear v
```

Exact bounded proof: `z ⊗ₜ v = z • (1 ⊗ₜ v)` via pinned `TensorProduct.smul_tmul'`, linearity of `CliffordAlgebra.ι` and `AlgEquiv` (both complex-linear), and **qualified** W0A2 `originalComplexEquiv_realGenerator_eq_activeGamma v`. Use an explicit local pure-tensor scalar identity if needed, no universe-wide extensionality or index expansion. Keep the public source to **one theorem**; one separate independent importing consumer theorem plus two controls (general complex scalar and `z=1`) on actual original Fock operators.

## Pinned accepted donors and negative knowledge

- W0A2 [strict #44048184200](https://github.com/etblink/math/actions/runs/44048184200) GREEN at tested `58219d2de55b7bba212effe50deec3d27eb361ac`. Original source Git blob `d444e0c08b4a3ae63653c9807c39c140940a67be`, original independent consumer Git blob `b9d9dee2bb6f72d959f9602a8b09154fb439879e`, original strict provider ZIP Git blob `57e4229d1e9ba35f919fcbcae9e78bf47ac25ba1`.
- W0A1 [strict #44043503665](https://github.com/etblink/math/actions/runs/44043503665) original real-linear donor/active equality, ZIP blob `ee39bccb7f61c497926bdb7eac9527cc53384d74`.
- W0A0 [strict #44039594189](https://github.com/etblink/math/actions/runs/44039594189) original 48-label axis crosswalk, GREEN ZIP `3ddc359754cab20045315a4167a9e5d15e316f80`, source elaboration RED ZIP `f356fec7fbb63bd660712f043503bc70b1eae673`.
- Original `M3I` Clifford/Fock equivalence and pinned Mathlib 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact tensor lemma and Clifford linearity.

## Qualification and stop rule

Freeze source/consumer and all qualified donors with Git blob pins. Cold original Lean build, independent consumer, one `#print axioms` report per theorem, approved `propext`, `Classical.choice`, `Quot.sound` only, six negative auditor mutations, exact provider-original ZIP and full log preservation before qualification. No increase in elaborator heartbeat/recursion budget; two analogous source REDs require architecture stop.

## What this gate does NOT establish

Only *pure complex tensors* `z ⊗ₜ v` receive the gamma equality here. Arbitrary sums and the full complexified source vector space require later W0A4 tensor induction. Clifford-algebra generation by 48 generators, M3C Schur commutant type adapter, trace scalar elimination and full W0 signature injectivity each remain distinct open gates. Original `K(A)` Lie homomorphism, physical Spin(9)/SU(2), BFSS Hamiltonian gap/ground-state and SCC ontology remain unproved. CT1/QTC1 two-red stop records remain frozen.
