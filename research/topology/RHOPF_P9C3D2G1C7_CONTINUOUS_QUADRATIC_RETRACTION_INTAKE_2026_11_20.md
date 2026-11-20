# RHOPF-P9C3D2G1C7 — source-exact continuous radial Q-unit retraction intake

**Pacific date:** 2026-11-20.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending strict native original and independently imported source consumer GREEN.

## Source-exact accepted starting point

G1C6 [#44700737846](https://github.com/etblink/math/actions/runs/44700737846) strictly GREEN at exact tested SHA `95553b6df1a3a49ec37b3dae73689c8c60b41fd7`, accepted at `2ab0f1eb7e4f154507a57b7fd0e138c2236162dc`. Original G1C1/C2/C3 give continuous positive-definite quadratic Q and positive continuous r=sqrt Q outside zero. G1C4 homogeneity and G1C5 normalization produce `Q(r(x)⁻¹ • x) = 1` for nonzero x. G1C6 proves every Q-unit x is nonzero, has radius one, and is fixed by normalization.

## Bounded proof contract

1. `RelationalNonzeroCoordinates := {x : Fin 4 → ℝ // x ≠ 0}`, `RelationalQUnitCoordinates := {x : Fin 4 → ℝ // Q(x) = 1}` inheriting actual coordinate topology.
2. Define `relationalRadialNormalize` from nonzero to Q-unit by `r(x)⁻¹ • x`, with target membership using accepted G1C5. Define `relationalQUnitIntoNonzero` by the source-native inclusion using accepted G1C6.
3. Prove `Continuous relationalRadialNormalize` using `r` continuity, strict nonzero radius, pinned Mathlib `Continuous.inv₀`, `Continuous.smul` and subtype inheritance.
4. Prove `Continuous relationalQUnitIntoNonzero` by `continuous_subtype_val`.
5. Prove `relationalRadialNormalize (relationalQUnitIntoNonzero v) = v` using G1C6's exact fixedness theorem.

**Key negative guard:** the radial normalization map is **noninjective on all nonzero coordinates**, since positive scalar multiples have the same normalized result. It is a retraction, NOT a homeomorphism from punctured R⁴ to the Q-sphere. An actual standard `S³` homeomorphism requires a separate normalization between **the Q-unit sphere and the standard real-four Euclidean dot-one sphere**, with a proven continuous inverse; a Pi-sup-norm sphere or arbitrary unscaled continuous linear equivalence is not sufficient.

Original source stays frozen. No proof budget expansion, alternate matrices or preferred source coordinates; circle-equivariant quotient, physical 48-Majorana Fock lift, Gauss/Hamiltonian covariance, and stable hopfion remain OPEN.

## Qualification

Exact frozen original Gamma9/BFSS, relational projector, Circle, G0A/B/C, G1A/B/C0/C1/C2/C3/C4/C5/C6 SHA pins, original signed-permutation integer fixture, new exact native+independent consumer file pins, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, both `-DwarningAsError=true`, native and independent `#print axioms` limited to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, ZIP checksum matched original CI upload and embedded tested SHA checked. Stop and record RED before repair; never edit `main`.
