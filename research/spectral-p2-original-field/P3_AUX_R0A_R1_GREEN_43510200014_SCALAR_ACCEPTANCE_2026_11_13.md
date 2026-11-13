# P3-AUX-R0A R1 — original SU2 radial scalar, strict GREEN

**Date:** 2026-11-13 Pacific. **Verdict:** ACCEPTED / SOURCE-EXACT STRICT GREEN.
**Scope:** Five pointwise scalar facts for the native original `Boson 2` regularized radial weight and the exact 16-output type anchor. This is NOT full auxiliary R0 / NOT an L² multiplication operator / NOT an auxiliary Hamiltonian.
**Reference:** [prospective experiment](P3_AUX_R0A_PROSPECTIVE_ORIGINAL_RADIAL_SCALAR_2026_11_13.md); [full source-exact auxiliary contract](P3_AUXILIARY_RADIAL_CHARGE_RESEARCH_CONTRACT_2026_11_13.md).

## Verified exact qualification

- [GitHub Actions strict #43510200014](https://github.com/etblink/math/actions/runs/43510200014), attempt 1: **SUCCESS**, completed 2026-11-13T21:29:24Z.
- **Tested SHA:** `481c6e9cbacebac1eaec0c8c625c8618589fef98`. **Job:** `132178140869` (`original-source-radial-scalar`), all essential steps GREEN: checkout; frozen source/toolchain/root preflight; pinned Lean/Mathlib cache; cold build; source axiom output; independent consumer; receipt checker; artifact upload.
- **Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxR0AOriginalRadialScalar.lean`, immutable blob `a67f8740586588c6d4ee9c9148574c81c14d4937`.
- **Independent consumer:** `lean/diagnostics/BFSSP3AuxR0AOriginalRadialScalarIndependentConsumer.lean`, immutable blob `aecf44061b26ccf6214d51826a1541d5ced87e48`.
- **Strict workflow:** `.github/workflows/bfss-p3-aux-r0a-original-radial-scalar-strict.yml`, immutable blob `1acd94e04f91ede31641a2646ace5705ddc843fa`.
- **Immutable original source pin:** `lean/OAI/MathematicalPhysics/BFSS/Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- **Toolchain:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Exact original source preflight marker `BFSS_P3_AUX_R0A_PREFLIGHT_PASS 481c6e9cbacebac1eaec0c8c625c8618589fef98`.
- **Final audit marker:** `BFSS_P3_AUX_R0A_ORIGINAL_RADIAL_SCALAR_STRICT_GREEN` present after source and independent consumer checks.
- **Artifact:** `14079185350`, `bfss-p3-aux-r0a-481c6e9cbacebac1eaec0c8c625c8618589fef98-1`, 5910 bytes, `sha256:4280aa89836410fad4583f078b5d345f323ef12287421a32135336e405862c9e`.
- **Axiom audit:** all five source/consumer declarations reported only `[propext, Classical.choice, Quot.sound]` (the standard allowed proof axioms), with no `sorryAx`, `admit`, or additional listed axioms. Third-party Lake repository-local-changes warnings were present but specifically recognized by strict checker as nonfatal; compiled source/consumer warnings and errors did not block GREEN.

## Precisely qualified new declarations

Namespace `FCP.BFSSP3AuxR0AOriginalRadialScalar`:

1. `originalRadialWeight_sq`: `w_epsilon(x)^2=||x||^2+epsilon^2`.
2. `originalRadialWeight_pos`: `epsilon>0 -> 0<w_epsilon(x)`.
3. `originalRadialWeight_ge`: `epsilon>0 -> epsilon<=w_epsilon(x)`.
4. `originalRadialWeight_inv_le`: `epsilon>0 -> (w_epsilon(x))^-1<=epsilon^-1`.
5. `originalRadialWeight_complex_mul_inv`: complex scalar weight multiplied by its inverse equals `1`.

Native original output type `OriginalChargeOutput := PiLp 2 (fun _ : SpinIndex => FullL2 2)` is an **abbreviation**, not a certified bounded multiplier.

## Scientific and methodological exclusions

This receipt **does not** assert: construction/boundedness/injectivity of coordinatewise reciprocal `B_epsilon:K ->L[C] K`; `W_epsilon` or its maximal domain; a weighted charge `S_epsilon`; closedness/density/kernel of a weighted charge; equality with the external Michel–Scheinpflug–Yin auxiliary operator; a Singlet Hardy estimate, ground-state existence, fidelity estimate, auxiliary spectral gap, or an original BFSS mass gap.

**Separate historical source status:** M5BF0 remains the latest **accepted original physical operator gate**, strict #43498649514. This scalar microgate is the latest accepted **parallel auxiliary prerequisite**, not a replacement for M5BF0 in the canonical original-operator gate chain. BG remains unstaged.

## Next bounded decision

Investigate and stage R0B only after defining the genuine `FullL2 2` coordinatewise reciprocal multiplier using exact pinned Mathlib Lp APIs, obtaining a continuous `K ->L[C] K` and proving injectivity. Prefer the inverse-graph comap reuse route documented in the full contract. Do not construct a convenient substitute carrier or postulate unverified `L²` AE identities.
