# Project Lead — V9Q Gate 2 accepted; V9R genuine LieHom candidate isolated

Date: 2026-10-31 UTC
Repository: etblink/math
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`

## V9Q strict qualification

- Green run: https://github.com/etblink/math/actions/runs/41220681395
- Exact tested commit: `457d7ddb1977f661db10b666d5dbb8d653fe8c59`
- V9Q source blob: `ed6d4722aaedd7e5442e62ceb4a47bd5504ba0d5`
- Job `124594392230`, attempt 1; completed success 2026-10-31T16:50:32Z.
- All 8,992 ancestor build jobs completed; fresh V9Q warning-as-error source compilation and independent theorem specialization succeeded.
- Both `coordinateToPairedSkewCarrier_add` and `coordinateToPairedSkewCarrier_smul` have declaration-level axioms exactly `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Immutable compiler and independent audit artifact: `13050446192` (zip SHA-256 `27dc74740033e58d0f72713e9429471ee407e5eeac4e8fe044a23ca97e6d51ea`).

### Preserved red evidence

- Red V9Q Gate 1 run `41218959241`, tested `f808248056fa4bc52d904053612dcb4ffb75a9f5`.
- The first failure was missing the linear-map argument in `map_smul c A.val`, producing an unresolved `FunLike ℝ ...` instance and `sorryAx` for the scalar theorem.
- Corrected `map_smul coordinateToPairedLinearMap c A.val` without modifying the theorem statement, source label order, Mathlib pin, inherited ancestry, or proof resource limits.
- A green CI run alone is not a proof; qualification relies on exact compiler and independent declaration-axiom evidence.

## Next experiment: V9R

New, unqualified source-exact candidate:
`SU2BFSSPairedSpin9LieHomProbe.lean`.

Proposed exact obligation: construct two real Lie subalgebras of the *actual* full real matrix associative algebras, consisting respectively of native skew 9×9 and original paired-Fock skew 48×48 matrices. Prove that the accepted coefficient `LinearMap` defines a genuine `LieHom` for the actual associative commutator bracket.

Reuse: V9C source-exact skew-image proof, V9N skew commutator equality, V9O closure, V9P typed-carrier theorem, V9Q add/smul laws, pinned Mathlib `LieSubalgebra` and `LieHom` structures. Any new failure must be classified from the first compiler diagnostic; do not replace the source bracket with a convenient surrogate.

V9R remains OPEN until a fresh strict gate passes. No original continuous Spin(9) group hom, covering/topology, Fock operator implementation, gauge covariance, spectral or empirical BFSS claims follow automatically.
