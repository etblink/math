# P3-AUX-G0A R1 — original SU(2) radial factor gauge invariance: strict GREEN

**Date:** November 13, 2026 (Pacific). **Verdict:** ACCEPTED three pointwise/AE gauge-invariance roots on the exact original bosonic carrier. No operator commutation or gauge-invariant physical Hilbert preservation theorem claimed.

## Exact immutable CI evidence

- [Strict run #43521457638](https://github.com/etblink/math/actions/runs/43521457638), attempt 1, completed success, final run updated `2026-11-13T22:54:55Z`.
- **Exact tested commit:** `8eba5b3814fa41c2943e7477aedef7760e176558`. Job `132216469504` (`original-radial-gauge-invariance`): frozen source/toolchain preflight GREEN, pinned Lean/Mathlib restoration GREEN, cold source GREEN, native independent consumer GREEN, all exact root axiom audits GREEN and evidence upload GREEN.
- **Original mathematical source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0AOriginalRadialGaugeInvariance.lean`, blob `2e89826685d77551405cb17f707ae3b47ecc80e1`.
- **Independent consumer:** `lean/diagnostics/BFSSP3AuxG0AOriginalRadialGaugeInvarianceIndependentConsumer.lean`, blob `c915142cc2033483caaad827a9bd067dc7f22973`.
- **Strict workflow:** `.github/workflows/bfss-p3-aux-g0a-original-radial-gauge-invariance-strict.yml`, blob `5f6224837bb585a3916b9ceb45c25ae76c7e1903`.
- **Frozen Core:** blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`; **accepted R0A:** blob `a67f8740586588c6d4ee9c9148574c81c14d4937`; **accepted R0B1:** blob `d1cbb8077799236e5e1b82704270bdb9ab9153b4`; **paired G4J true GaugeData assembly:** blob `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`.
- Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Exact final marker: `BFSS_P3_AUX_G0A_ORIGINAL_RADIAL_GAUGE_INVARIANCE_STRICT_GREEN`. The source and independent consumer each reported all three names below with only standard permitted axioms `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or errors.
- [Retained run artifact #14084665266](https://github.com/etblink/math/actions/runs/43521457638/artifacts/14084665266), name `bfss-aux-g0a-evidence`, 7265 bytes, digest `sha256:b9aa8bcb96ee2159ff8e55723382cd4e501f1c11428348777fede6b8e96a35e5`.

## Exact qualified theorem roots

1. `FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalRadialWeight_gauge_invariant`
2. `FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalReciprocalField_gauge_invariant`
3. `FCP.BFSSP3AuxG0AOriginalRadialGaugeInvariance.originalReciprocalLpInf_ae_gauge`

The literal `pairedGaugeData.boson` is a real-linear isometry on actual `Boson 2`, so `wε(G.boson g x)=wε(x)`; `bε(G.boson g x)=bε(x)` follows, and using the accepted true complex `L∞` representative plus measure preservation proves the same **almost everywhere** for the native representative.

**Not proved by G0A:** a commutation equation for R0B2A's `FullL2 2 →L[ℂ] FullL2 2` operator, preservation of the original gauge-invariant physical submodule, physical Haar projection commutation, any infinitesimal Gauss-generator domain theorem, a finite 16-charge `PiLp` lift, weighted charge or Hamiltonian, or spectral gap/fidelity. Those are separate and falsifiable proof gates. M5BF0 remains the latest accepted original physical operator gate.
