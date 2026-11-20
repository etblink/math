# RHOPF-P9C3D2G1C9 — standard real-four Euclidean normalization algebra intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native original and independently imported consumer strict GREEN.

## Starting point

G1C8 [#44704789806](https://github.com/etblink/math/actions/runs/44704789806), exact tested `18a1228f85e75966786949c431ff5260c0b95a9d`, accepted at `31594c18db9e36d545de67372ae4a93a0c0a4be9`, establishes the standard Euclidean real-four radius `s(x)=sqrt(x ⬝ᵥ x)` is continuous and positive away from zero. G1C7 certifies continuous retraction from the nonzero real-four coordinate subtype onto the actual Gamma9-derived `Q=1` level set, not a homeomorphism of the punctured space.

## Exact bounded proof contract

1. `standardCoordinateDotSelf_smul`: `(t • x) ⬝ᵥ (t • x) = t * (t * (x ⬝ᵥ x))` by pinned `smul_dotProduct` and `dotProduct_smul` applied to standard dot-self on `Fin 4 → ℝ`.
2. `standardCoordinateRadius_mul_self`: for `x≠0`, `s(x)*s(x) = x ⬝ᵥ x`, using G1C8 positivity and `Real.mul_self_sqrt`.
3. `standardCoordinateDotSelf_inv_radius_smul`: for `x≠0`, `(s(x)⁻¹ • x) ⬝ᵥ (s(x)⁻¹ • x) = 1`, using standard homogeneity, the radius-square identity, and cancellation guarded by the proven `s(x) ≠ 0`.

This produces the standard Euclidean counterpart of the accepted source-original Gamma9 normalization law. The subsequent gates must build typed continuous maps between the source Q-unit sphere and the standard dot-one sphere and certify two-sided inverse equations; the present gate alone is NOT an `S³` homeomorphism. No standard Hopf S¹ action intertwining, quotient classification, Fock implementer, Hamiltonian/gauge covariance or stable hopfion is claimed.

## Strict controls

Exact original BFSS/Gamma9/projector/Circle and G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8 source pins, source-independent original Gamma9 integer fixture, exact new native and imported consumer SHA pins; pinned Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no proof-budget changes; native and independently imported consumer warnings-as-errors, all native and consumer axiom reports only `propext`, `Classical.choice`, `Quot.sound` with no `sorryAx`; independently verified original artifact ZIP and embedded SHA. Preserve REDs and never write to `main`.
