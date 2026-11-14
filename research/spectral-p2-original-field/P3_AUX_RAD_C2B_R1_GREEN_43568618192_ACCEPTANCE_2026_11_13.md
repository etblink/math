# P3-AUX-RAD-C2B R1 — exact native original sixteen-output lift ACCEPTED STRICT GREEN

**Date:** 2026-11-13 Pacific. Workflow finished 2026-11-14T07:12:14Z. **Classification:** LEAN_QUALIFIED EXACT ORIGINAL AY OUTPUT ONLY.

## Provenance and reproducibility

[Workflow run #43568618192](https://github.com/etblink/math/actions/runs/43568618192), attempt 1, exact tested commit `fd745c3598bb237088f7a964ac810c82a2f91a35`, completed **success**, job `132367864977`.

- Original native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC2BOriginalReciprocalHilbertOutputLift.lean`, blob `45aa19082616ae874bf642f336d9a7c5fa1fd6f9`.
- Independent original AY `PiLp` consumer `lean/diagnostics/BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLiftIndependentConsumer.lean`, blob `d77d1fc938550bf61bfbdbbc90416e039583ce23`.
- Strict workflow `.github/workflows/bfss-p3-aux-rad-c2b-original-reciprocal-hilbert-output-lift-strict.yml`, blob `6934ab062753502a0f9be16491ef62df6546c119`.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact original-source preflight PASS, cold source compile PASS, independent consumer PASS, three-root source-and-consumer axiom audit PASS.
- Three accepted declarations: `FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM`, `FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM_coordinate`, `FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift.originalReciprocalHilbertOutputCLM_injective`.
- Allowed axioms only `[propext, Classical.choice, Quot.sound]`; no compiler errors or `sorryAx`.
- Strict marker `BFSS_P3_AUX_RAD_C2B_ORIGINAL_SIXTEEN_OUTPUT_LIFT_STRICT_GREEN` present.
- [Evidence artifact #14103862228](https://github.com/etblink/math/actions/runs/43568618192/artifacts/14103862228) is 9,727 bytes, published digest `sha256:820e76bd29de19a9694c0eb67a557dbf86f04f8355484b405089baaac17b8fb0`. Artifact metadata/job logs were independently examined; binary archive not separately downloaded/rehashed.
- [Roadmap consistency #43568618072](https://github.com/etblink/math/actions/runs/43568618072) completed SUCCESS at the same tested head.

## Exact qualified mathematical result

Let `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)` be the output of AY's genuine original physical-input sixteen-charge `T`. The accepted original AY canonical linear homeomorphism `J=originalMinimalHilbertOutputEquiv` identifies `K≃L[ℂ](SpinIndex→FullL2 2)`. Let `Bε` be qualified RAD-C2A original bounded reciprocal `FullL2 2→L[ℂ]FullL2 2`.

The three audited roots construct the continuous operator `B16ε=J.symm ∘L (ContinuousLinearMap.piMap (fun _ => Bε)) ∘L J`, prove `(J(B16ε y))α=Bε((J y)α)` for all source `α`, and prove `Function.Injective B16ε` by accepted RAD-C2A injectivity. The construction uses the actual AY Hilbert `PiLp` carrier, not a substitute model or changed physical input.

## Stop boundaries

**Not proved:** a globally bounded inverse, sharp operator norm, original physical weighted charge domain, closed inverse-image `T` graph, maximal weighted-L2 identity, core density in that weighted graph, positive epsilon form equality/closedness, physical Spin(9) Hardy singlet inequality, epsilon-zero closability, or BFSS gap.

**Next:** RAD-C3, on original AY physical input `E=pairedGaugeData.physicalSpace`, define `Gε=(id_E×B16ε)⁻¹(graph(T))` in `E×K`. Need exact source closedness and injectivity to show `Gε` is a closed single-valued linear graph; package via `Submodule.toLinearPMap`. Domain-density and actual weighted field multiplication must be separate later gates. Keep physical original Hamiltonian M5BF0 accepted and TD-C1A RED_UNQUALIFIED unchanged.
