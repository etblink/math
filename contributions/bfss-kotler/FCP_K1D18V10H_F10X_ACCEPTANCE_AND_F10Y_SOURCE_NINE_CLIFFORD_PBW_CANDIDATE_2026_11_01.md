# F10X accepted; F10Y source-nine Clifford PBW qualification experiment

Date: 2026-11-01. Branch: research/fcp-k1d17-ancestor-cache-pilot-20261028. Accepted parent `1d00491c14bb7a56102072d4063443f2ee226e95`.

## Accepted F10X (strict Gate 2)
[Run #41330552125](https://github.com/etblink/math/actions/runs/41330552125) completed success on parent SHA, attempt 1. Exact source pins, frozen Lean v4.34.1 and Mathlib revision d13f23b723b8a846827a245b89c10fc7d3f11612, full accepted F10W ancestry, warning-as-error fresh Lean, four independent exact theorem-type audits and allowed root axioms passed. Audit marker: `V10H_F10X_FOUR_CLIFFORD_GAMMA_KERNEL_TYPES_AXIOMS_PASS`. Allowed `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
[Accepted Gate 2 artifact #13093935552](https://github.com/etblink/math/actions/runs/41330552125/artifacts/13093935552), zip SHA256 `81e63c4ecc2daa980c8153603d6074049c1af443c65cf714cfb45a6b5c481fe2`.

Retain [Gate 1 RED #41322416019](https://github.com/etblink/math/actions/runs/41322416019), source SHA `d2e97e6842c41594a18c204631bbe803ff7469e0`, [artifact #13090251696](https://github.com/etblink/math/actions/runs/41322416019/artifacts/13090251696), due to missing source gamma identity type bridge. Repair was proof-only and did not change theorem statements.

Accepted F10X: original paired SO48 image equality iff source Clifford gamma AlgHom equality; exact SO48 kernel membership iff source Clifford gamma matrix is identity; source Spin9 faithfulness follows **conditionally** from EVEN Clifford gamma AlgHom injectivity. The injectivity premise remains unproved. Do not claim full Spin9 faithfulness or Spin48 lift.

## F10Y candidate, not qualified

The imported F20B source `SU2BFSSPhysicalDomainS1V52L9E5F20BOriginalSource48CliffordPBWBasisFiniteDimensionalProbe.lean` provides an established REAL-linear PBW basis construction for a DIFFERENT original 48-real Clifford carrier. Adopt only its sound mathematical method for `CliffordAlgebra source9Quadratic` over `SpaceIndex = Fin 9`:

1. `source9CliffordPBWBasis`: exact `Module.Basis (Finset SpaceIndex) ℝ (CliffordAlgebra source9Quadratic)`, using the source nine-dimensional exterior basis and Mathlib's real-linear `CliffordAlgebra.equivExterior`.
2. `source9Clifford_finiteDimensional`: derive finite dimensionality from that exact finite indexed PBW basis.

The exterior equivalence is not multiplicative. This does not yet prove gamma representation even-Clifford injectivity, linear independence of even gamma matrix words, dimension equality of the even subalgebra with M16(ℝ), full source Spin9 faithfulness, original Spin48 lift, Fock unitary action, or physical BFSS claim.

Strict gate: pin actual original source Cl9 gamma + accepted F10X + F20B method blobs, frozen Lean & Mathlib, ancestry rebuild, fresh warning-as-error F10Y compilation, two independent source-exact declaration type/axiom checks, immutable SHA & artifact preservation. No maxHeartbeats/maxRecDepth raise, no sorry or new axioms. Next substantive candidate after F10Y is an EVEN PBW word-to-original-gamma matrix coefficient-separation theorem, not an unproved dimension-count declaration. Research branch only; no main merge or upstream PR.
