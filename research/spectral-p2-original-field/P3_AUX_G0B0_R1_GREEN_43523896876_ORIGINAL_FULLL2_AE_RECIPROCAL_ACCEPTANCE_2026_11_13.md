# P3-AUX-G0B0 R1 — strict GREEN: original FullL2 2 reciprocal multiplication AE identity

**Date:** 2026-11-13 Pacific. **Status:** ACCEPTED exact source AE action only; NOT a Gauss commutation theorem, physical-subspace preservation theorem or spectral claim.

## Immutable strict evidence

- [Strict run #43523896876](https://github.com/etblink/math/actions/runs/43523896876), attempt 1, **completed success** (2026-11-13T23:14:18Z).
- **Exact tested commit:** `235adaaf1151f1711df989968ff8c006b6a8f3e1`; job `132224745129` (`original-full-l2-ae-multiplication`). All essential steps green: frozen-source/toolchain preflight, pinned dependency restore, cold Lean source compile, independent original Fock consumer, exact root axiom audit, artifact upload.
- **Exact source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxG0B0OriginalReciprocalFullL2AEMultiplication.lean`, blob `670cc600fdc42a03d21de759e8b46b6cb1306874`.
- **Independent native consumer:** `lean/diagnostics/BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplicationIndependentConsumer.lean`, blob `50da6b24b4daf19bffb59fa90e4c6863140e8fcd`.
- **Strict workflow:** `.github/workflows/bfss-p3-aux-g0b0-original-full-l2-ae-multiplication-strict.yml`, blob `001b148ebbfbc5c5f36804109a4e1458ca635282`.
- **Frozen sources:** original Core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`; R0A `a67f8740586588c6d4ee9c9148574c81c14d4937`; R0B1 `d1cbb8077799236e5e1b82704270bdb9ab9153b4`; R0B2A `e2a02b551486cfbc2a723f5b5ff0b282177c5e76`; G0A `2e89826685d77551405cb17f707ae3b47ecc80e1`; true paired G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Marker `BFSS_P3_AUX_G0B0_ORIGINAL_FULLL2_AE_MULTIPLICATION_STRICT_GREEN` appears in completed job. The two exact root declarations were printed from both source and independent consumer; permitted axioms only `[propext, Classical.choice, Quot.sound]`; no new axioms/sorryAx or source/consumer compilation errors.
- [Artifact #14084139076](https://github.com/etblink/math/actions/runs/43523896876/artifacts/14084139076), name `bfss-aux-g0b0-evidence`, 7417 bytes, SHA256 `04bb838bdcfac3be1b454e974557c22176a55dab3806e807f8c0d80e1ff63827`.

## Exactly qualified roots

1. `FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication.originalReciprocalFullL2CLM_ae_factor` — true bounded original `FullL2 2 →L[ℂ] FullL2 2` action agrees a.e. with the true R0B1 complex L∞ multiplier applied to the original `Fermion 2`-valued L² representative.
2. `FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication.originalReciprocalFullL2CLM_ae_originalField` — same actual bounded operator agrees a.e. with the *literal* original `originalReciprocalField ε` scalar times the original Fock-valued input, using only R0B1's accepted representative AE bridge.

**No replacement physical space or Boson/Fermion carrier.** The independent consumer checks actual `FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2))` and the original sixteen-component charge *type*, but it does not claim a finite PiLp operator.

## Next exact proof contracts; not yet qualified

Primary: use G0A pointwise gauge invariance and this G0B0 AE equation to prove the original `G.bosonPullback g` commutes with `Bε`, at the exact `pairedGaugeData` and original FullL2 types. Separately prove that `G.fiberAction g` commutes with `Bε`, then that `Bε` preserves `G.physicalSpace` from its intersection-of-kernels definition. Only afterward consider actual original Haar projection commutation or finite sixteen-charge PiLp lift.

Separate analytical work: prove Bε injective (but NOT boundedly invertible), dense nonclosed range, and the correct domain of inverse multiplication. Full physical weighted-charge graph, Hamiltonian normalization, auxiliary Hardy singlet bound and any ground-state/fidelity result all remain open. The latest accepted *original physical Hamiltonian/operator* gate is M5BF0; no BFSS gap is claimed.

Prior R0B2A R1/R2 consumer failures remain as immutable first-causal red experiments, as do earlier R0B1 R1/R2 failures. They are not overwritten by this acceptance.
