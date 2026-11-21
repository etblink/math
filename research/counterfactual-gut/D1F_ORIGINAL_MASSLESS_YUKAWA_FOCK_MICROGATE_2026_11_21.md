# D1F — Original massless-frequency/Fock source microgate

**Date:** 2026-11-21. **Research branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Strict original-source run:** [#44934836209](https://github.com/etblink/math/actions/runs/44934836209) at **tested commit `deff085b1c26b606f81501a68eba50d81c56aedb`**.  
**Initial status:** **PROPOSED — CI still in progress at this writing**; do not infer GREEN from a pushed proof candidate or a prior unrelated gate. The documentation commit following the candidate does NOT change the test's source SHA.

## Purpose

The previous D1E audit recovered historical strict GREEN evidence for original massless smooth-core equality ([#42325087575](https://github.com/etblink/math/actions/runs/42325087575)), closed normalized physical Hamiltonian on `Dom(T†T)` ([#43493125150](https://github.com/etblink/math/actions/runs/43493125150)), and nonzero H-domain graph ([#43498649514](https://github.com/etblink/math/actions/runs/43498649514)). These proof modules do not need to be recreated. D1F tests **one new source-typed identity** and its exact paired SU2 specialization.

## Proof targets

- [D1F native Lean file](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1FOriginalMasslessYukawaFockQuantization.lean). Imports only `OAI.MathematicalPhysics.BFSS.FermionQuantization` and uses the genuine source `AlgebraData N`, `FrequencyMatrix N`, source `Fermion N` and original CAR field.
- [D1F independent consumer](../../lean/diagnostics/BFSSD1FOriginalMasslessYukawaFockIndependentConsumer.lean). Specializes to existing `FCP.BFSSSU2GaugeG1A.pairedAlgebraData : AlgebraData 2`; no fake Fock carrier or gamma substitution.
- [D1F isolated strict gate](../../.github/workflows/bfss-d1f-original-massless-yukawa-fock-strict.yml). It triggers ONLY on this counterfactual branch and D1F proof/consumer/workflow paths; validates original blob pins, Lean `4.34.1`, Mathlib `d13f23b7...`, original source build, independent consumer, and allowed axiom reports. Always retains red/green logs and exact tested SHA.

Define on the **original** 48-index source types for any `M : AlgebraData N`:
\[
F_0(X)= F(X)-F(0),\quad
[F_0(X)]_{r,s}=-\sum_{j,C} f_{s.2,r.2,C}\,X_{j,C}\,\Gamma_{j,r.1,s.1}.
\]
The exact source indices and sign are important; the proposed proof uses `FermionQuantization.frequency_bracket_contraction` rather than redoing Fock CAR with a surrogate.

**D1F-A:** `masslessFrequency M X = M.fermionCoefficient X - M.fermionCoefficient 0`.

**D1F-B:** `M.quantizeFrequency (masslessFrequency M X) = (-i/2) • ∑_(j,A) M.cubicFermionComponent X A j`.

**D1F-C:** `M.deformedFermionField 1 0 X = (M.quantizeFrequency (masslessFrequency M X)).restrictScalars ℝ`.

This final equality binds the **actual massless original fermionic interaction** on the genuine source Fock space with the right real-linear operator carrier, not a modification of the Hamiltonian. Its truth is conditional on exact **Lean compilation and independent consumer**; a failed proof script does not negate the identity until the mathematical counterexample is established.

## Scientific ceiling and control conditions

No source-derived physical Hopf sector, no topological protection, no BFSS spectral gap, no 3D spatial Dirac operator, no 4D Weyl chirality, no GUT gauge-group derivation and no empirical discovery follow from this source identity.

**Bounded procedure after a RED:** inspect only first-causal compiler diagnostic, distinguish parser/import/elaboration vs invalid mathematical statement, compare source lemmas and real/complex coercions, update the minimal source/consumer at a NEW exact SHA, and preserve original failed gate with artifacts. Do not silently loosen checks, alter original Gamma9/Pauli source, rewrite accepted gates, change pins or move to unified RHOPF.

**Next scientific discriminator after a real strict GREEN:** the original source core-form integrand is a quadratic form on `SmoothCore N`; a separately closed graph/form-domain characterization, spectral-family theorem, or effective-spatial operator is required to reason about physical protected chirality. Do not identify finite coefficient-matrix eigenmodes with physical normalizable states.
