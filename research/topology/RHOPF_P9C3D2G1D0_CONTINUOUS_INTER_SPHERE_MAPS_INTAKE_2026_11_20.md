# RHOPF-P9C3D2G1D0 — source-exact continuous inter-sphere maps intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending strict native original and separately imported source-typed consumer GREEN.

## Accepted starting point

G1C9 original [#44707213250](https://github.com/etblink/math/actions/runs/44707213250), tested SHA `0b0aba7369ff16c28593e50f15ea11e08515604f`, original artifact SHA-256 independently verified, accepted at `3c5f262f75397f04abbd35b37b6df5ee4b909a63`. G1C7 independently qualifies original Gamma9 `Q=1` continuous retraction; G1C8 proves standard radius `s(x) = sqrt(x ⬝ᵥ x)` continuous and strictly positive away from zero; G1C9 verifies `(s(x)⁻¹ • x) ⬝ᵥ (s(x)⁻¹ • x)=1`.

## Bounded G1D0 obligations

Build `StandardUnitCoordinates := {x : Fin 4 → ℝ // x ⬝ᵥ x = 1}` using the explicit **standard Euclidean dot-self**, never the Pi sup norm. Prove any standard Euclidean dot-one point is nonzero by `zero_dotProduct`, then define two maps:
1. `relationalQUnitToStandardUnit : RelationalQUnitCoordinates → StandardUnitCoordinates`, sending x to `s(x)⁻¹ • x`, with source G1C6 nonzero proof and accepted G1C9 dot-one normalization.
2. `standardUnitToRelationalQUnit : StandardUnitCoordinates → RelationalQUnitCoordinates`, sending y to `r(y)⁻¹ • y`, with standard-unit nonzero proof and accepted G1C5 original Q-unit normalization.
3. Certify continuity of **both** typed maps separately from accepted `Continuous s`, `Continuous r`, radius positivity, pinned `Continuous.inv₀`, `Continuous.smul`, and `Continuous.subtype_mk`.

**Stop line:** This gate constructs continuous maps in both directions, not their inverse identities. Radial normalizations on punctured R4 remain noninjective. A later G1D1 must prove the maps mutually inverse, and only then can a `Homeomorph` be qualified. The original real-16-spinor projector-image identity, circle-action intertwining, Hopf quotient and physical Fock-space implementation are not implied.

Strict controls: accepted original BFSS/Gamma9/projector/Circle/G0A/B/C/G1A/B/C0/C1/C2/C3/C4/C5/C6/C7/C8/C9 exact source pins; original integer fixture; new source and independent consumer exact blobs; Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no new axioms, `sorryAx`, proof-budget changes, alternate matrices or `main` edits; warnings-as-errors original native+independent and archived exact CI artifact ZIP hash/commit.
