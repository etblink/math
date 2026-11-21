# D1E — Historical qualification recovery and rank-three Fock-band bundle veto

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Scope:** read-only source/CI audit and new ordinary homotopy/cohomology deductions; this document and the ledger are the only changed files. **No newly compiled Lean declarations, original source mutations, workflow dispatch, experimental verification, physical hopfion, 4D chirality or GUT claim.**  
**Parent:** [D1D](./D1D_SOURCE_PHYSICAL_FERMION_INTERACTION_AND_DOMAIN_BOUNDARY_2026_11_21.md).

**Key change:** D1D called G4K9D and P3M5BE0 *prospective* based on old header comments. **That status was stale.** Source pins, exact historical green CI, independent consumer and allowed-axiom evidence have now been checked. The source-level bridge and source normalized physical Hamiltonian have already qualified in their named, bounded scopes. This update **appends a correction** instead of editing away the earlier dated uncertainty.

## 1. Exact historical proof qualifications recovered, and unmodified-current-source matches

### 1.1 G4K9D + original massless smooth-core energy

- **Run:** [#42325087575](https://github.com/etblink/math/actions/runs/42325087575) **strict GREEN** on 2026-11-06 / 07 UTC; exact commit `c1f309ca6de85b6f9e6c76a38254140e333fe819`.
- **Workflow:** `.github/workflows/bfss-spectral-massless-source-strict.yml`. Job `massless-source-identity` passed snapshot/preflight, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 15 frozen originals + 4 recovered modules, source cold build, distinct `BFSSSpectralMasslessSourceIndependentAudit.lean` and allowed-axiom checks.
- The original job log explicitly prints:
  `SPECTRAL_SOURCE_RECOVERY_K9D_OK`, `SPECTRAL_MASSLESS_CORE_FORM_SOURCE_OK`, `SPECTRAL_MASSLESS_CORE_FORM_AUDIT_OK`, `SPECTRAL_MASSLESS_SOURCE_GATE_PASS`.
- The relevant tested **Git blobs match** our branch snapshot:
  - `OperatorDependencies/SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean` `cc0f4624239160dc39a7a191a519786e71df6abd`
  - `SpectralMasslessCoreFormIdentity.lean` `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`
  - `lean/diagnostics/BFSSSpectralMasslessSourceIndependentAudit.lean` `1535071bea72a8f3a2afefb660ff3a2febcc6de1`
  - `Core.lean` `9882359ced78b0a3bd7e2f057974bd0a031b3e60`
  - `DeformedCharge.lean` `c27c913c44090100f0c714e3eb34e25205f4d2d3`.
- Axioms reported for source and consumer roots: **`propext`, `Classical.choice`, `Quot.sound` only**, no `sorryAx`. The log and tested SHA are archived by the Actions run; previous archived artifact may be subject to retention policy. **No new run** was started.

**Promoted within exact scope:** `sourcePotentialMultipliers_equal`, `sourceUnconditionalCoreCharge_equal`, `sourceUnconditionalCoreForm_equal`, and `massless_coreForm_energy` are historical source-exact STRICT GREEN, not unqualified candidates. This provides the genuine original 16-charge normalized **smooth-core** energy identity for arbitrary `AlgebraData N` (including the paired SU2 specialization). It is **not** a proof that the spatial pointwise 48×48 Yukawa spectrum equals the full physical Hamiltonian spectrum.

### 1.2 P3M5BE0 — native original physical normalized Hamiltonian

- **Run:** [#43493125150](https://github.com/etblink/math/actions/runs/43493125150), **strict GREEN**, 2026-11-13 at exact commit `10a9e7e3419f8b02b5e920c60e07facf8602fb42`. Earlier [#43489563180](https://github.com/etblink/math/actions/runs/43489563180) was **RED**; preserve both, do not count the red as an independent green.
- **Workflow:** `bfss-p3-m5be0-original-native-hamiltonian-port-strict.yml`. Job `original-native-physical-H-source-and-consumer` passed original historical BE import; strict cold build, source axioms, distinct `BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer.lean`, exact allowed-axiom checks.
- Job log concludes `BFSS_P3_M5BE0_ORIGINAL_NATIVE_PHYSICAL_H_STRICT_GREEN`. No illicit axioms in checked roots.
- Exact tested = current branch blobs:
  - `P3M5BE0OriginalNativeHamiltonianPort.lean` `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1`
  - `lean/diagnostics/BFSSP3M5BE0OriginalNativeHamiltonianPortIndependentConsumer.lean` `9d20905d5509be44baf2374fc1bf0eb8820969eb`
  - `OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean` `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`.

**Promoted within exact scope:** `H=(1/16) T†T` for the literal **paired SU2 source gauge-physical Hilbert space**, on the true `Dom(T†T)`; its action, self-adjointness, closedness, dense natural domain, and precise associated weak-form characterization passed independently. Nothing says existence of a nonzero eigenstate, BFSS spectral gap or unification.

### 1.3 P3M5BF0 — original gauge graph and nonzero Hamiltonian domain

- **Run:** [#43498649514](https://github.com/etblink/math/actions/runs/43498649514), **strict GREEN**, 2026-11-13, SHA `f2499980b808b6c9ddf2c6093f5b88ebff8b825f`; job log `BFSS_P3_M5BF0_SOURCE_GRAPH_NONZERO_H_DOMAIN_STRICT_GREEN`, independent consumer.
- `P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean` tested and current blob `f954917f21669fd68befc12f48a2b092b71a9044`. Provides source graph comparison, accepted physical H matching and a **nonzero vector in the natural H domain**, not a nonzero BFSS zero-energy eigenstate.

**Boundary:** GREEN at different historically tested commits is legitimate reusable evidence for **identical pinned source bytes** and their separately checked import closures. It does not mean a new combined D1E cross-module theorem has been compiled on this research branch. Source file comments marked PROSPECTIVE are provenance of drafting time, not the current qualification state.

## 2. D1E's actual missing atom is narrower than D1D expected

The original source `FermionQuantization.fermionCoefficient X` has a **mass deformation** `F(0)=(3/2)Γ012⊗I₃`. The **massless** source coefficient on the original `FrequencyIndex 2` is
\[
F_0(X):=F(X)-F(0),\qquad
(F_0(X))_{(\alpha,b),(\beta,c)}
= \sum_{i,a} X_{ia}\,\Gamma_{i,\alpha\beta}f_{abc}.
\]
This is **D1C's** independently derived `A_f(X)` in the Pauli SU2 normalization `f_{abc}=√2\,ε_{abc}`. The actual Fock map is `M.quantizeFrequency`:
\[
Q_F(X)=\frac{i}{2}\sum_{r,s}(F_0(X))_{rs}\theta_r\theta_s
\quad\in\operatorname{End}_{\mathbb C}(\operatorname{Fermion}\,2).
\]
An exact **new** theorem should assert
\[
M.\mathrm{deformedFermionField}\;1\;0\;X
=\bigl(M.\mathrm{quantizeFrequency}(F_0(X))\bigr)
       \mathord{\mathrm{.restrictScalars}}\,\mathbb R,
\]
and should be independently consumed at the original `pairedAlgebraData`. It follows algebraically from previously imported `deformedFermionField_bracket`, `frequency_bracket_contraction`, linearity of `quantizeFrequency` and `f` antisymmetry. **This exact massless specialization has not been checked as a new Lean declaration**. The existing theorem `deformedFermionField_quantized` directly applies to `h=m=1`, so it must not be misquoted as stating the massless case verbatim.

**Source-typed Lean proof blueprint, not compiler-verified code:**

1. Import `OAI.MathematicalPhysics.BFSS.FermionQuantization` and the existing `SU2BFSSG1APairedThetaProbe`, nothing from speculative RHOPF.
2. Define the coefficient as `M.fermionCoefficient X - M.fermionCoefficient 0`, not a replacement 48×48 matrix.
3. Prove the entry expansion from `fermionCoefficient` by simplification of the mass constant and `zero_mul`, taking source index reversal `f_{s.2,r.2,a}` seriously.
4. Expand `quantizeFrequency` and use `frequency_bracket_contraction` to obtain `(-i/2)·∑ cubicFermionComponent X`; compare with `deformedFermionField_bracket`.
5. Give a distinct consumer at `M=pairedAlgebraData`, the real/complex operator coercion and `#print axioms`; pin source and consumer Git blobs, toolchain and exact CI.
6. **Stop** on an original source mismatch or a type/normalization failure. Do not insert a new mass term, assume a gap or refit the Hamiltonian.

This gate is **not automatically required** for accepted G4K9D or M5BE0, which already prove different useful statements.

## 3. NEW topological veto: the negative-energy Fock-band first Chern class is forced to vanish

This is a **further mathematical deduction**, not a new Lean-checked theorem.

The massless `48×48` real skew source-Yukawa coefficient `A_f(X)` from D1C has the exact nonzero determinant condition
\[
\det A_f(X)\neq0 \;\Longleftrightarrow\;\operatorname{rank}X=3.
\]
For rank-three `X`, `iA_f(X)` is Hermitian with **24 strictly negative and 24 strictly positive** eigenvalues. This is because a real skew matrix has paired frequencies `±iλ`, and no zero occurs. Its negative spectral projector `P_-(X)` therefore varies continuously on the open rank-three locus `C_3`.

Under the actual **proper** SU2-adjoint rotation `R(g)∈SO3`, the coefficient is covariant by the real 48-label orthogonal color representation `I₁₆⊗R(g)`. Thus the continuous family of negative eigenspaces is a gauge-equivariant rank-24 complex bundle and descends, using the effective SO3 action on rank-three configurations, to a complex vector bundle `E_-` on
\[
B=C_3/SO(3)\simeq \operatorname{Gr}_3^+(\mathbb R^9)
\]
(the based polar deformation retraction was derived in D1A). This is a **one-particle occupied-band bundle**, NOT the full 2²⁴ Fock-state bundle or a 3+1D particle Hilbert bundle.

From the Stiefel fibration `SO3→V_3(ℝ9)→B` and 5-connectivity of `V_3(ℝ9)`:
\[
\pi_1(B)=0,\qquad \pi_2(B)\simeq\mathbb Z_2,\qquad \pi_3(B)=0.
\]
By Hurewicz, `H_2(B;\mathbb Z)\cong\mathbb Z_2`, and `H_1(B;\mathbb Z)=0`. The universal coefficient theorem yields
\[
H^2(B;\mathbb Z)\cong
 \operatorname{Hom}(\mathbb Z_2,\mathbb Z)
 \oplus \operatorname{Ext}(0,\mathbb Z)
=0.
\]
Therefore every complex vector bundle over this ordinary rank-three gauge quotient has
\[
\boxed{c_1(E_-)=0.}
\]

**What this rules out:** the hope that the **natural source massless one-particle negative-band bundle**, restricted only by one-particle invertibility, produces an ordinary nonzero **integral first-Chern topological charge** on `B`. A Berry connection can still have local curvature, but its first Chern number on any closed two-cycle is zero.

**What it does NOT rule out:** possible second Chern / Pontryagin or other higher-degree classes (not computed); real/equivariant `w_2` data, nontrivial associated bundles, parameter-space Chern–Simons structures under independently justified hypotheses, physical spatial defect index, or eigenbundle topology on a **different dynamically enforced parameter locus**. Although `π_3(B)=0`, those possibilities are not silently identified with the absent three-dimensional Hopf class.

**Physical caveat:** the rank-three locus excludes the SU2 commuting flat valleys (`rank≤1`), so this is a deliberately adversarial **pointwise gapped diagnostic**, not a full physical BFSS gapped sector. A gauge-quotient characteristic class does not equal a fermion generation count.

## 4. Real closed-form bridge: green components, new join still open

Accepted on exact source pins:
- `M.coreForm f = (1/16)∑α ‖M.charge α f‖²` and the **massless smooth-core kinetic + bosonic + fermionic integral identity**.
- For original paired physical data, a well-defined, self-adjoint, densely defined `H=(1/16)T†T` with source gauge-graph and nonzero domain evidence.

**Still needs a separately qualified join:** a concrete theorem identifying the invariant smooth-core energy with the closed physical charge quadratic form and proving its extension to `Dom(T)` **in the appropriate graph/form norm**. The *sum* of kinetic, potential and fermionic pieces may converge in a closed-form limit even when individual unbounded terms fail to converge separately. No automatic operator identity `H=−(1/2)Δ+V_B+V_F` on the whole natural `Dom(H)` is claimed by this audit.

**Science ceiling:** An exact coefficient↔Fock↔form bridge does **not** establish a Hopfion, spectral protection, nonzero chiral index, emergent spatial Dirac operator, Standard Model representations, proton-decay predictions or a GUT.

## 5. Decision

1. **Reuse, don't rerun:** G4K9D + massless core and P3M5BE0 + P3M5BF0 are qualified by green immutable source/consumer receipts. Keep the historical M5BE0 red as negative proof-process evidence.
2. **D1E candidate:** only the original source `masslessFrequency → quantizeFrequency → deformedFermionField 1 0` exact-carrier microgate remains as a genuinely new small proof, plus a separate closed-form joint consumer if useful. **Do not add Lean/workflow files in this documentation-only counterfactual pass**.
3. **Topological stop rule:** first Chern of the ordinary source one-particle negative band on full-rank SU2 quotient is zero, so stop proposing it as a source of quantized 2D U(1) charge. Preserve higher-characteristic-class/equivariant routes as OPEN, not positive.
4. **No action on** original source, active RHOPF, `main`, pins or CI. This memo documents exactly which tests can be **skipped**.

**Independent source of qualification truth:** [#42325087575](https://github.com/etblink/math/actions/runs/42325087575), [#43493125150](https://github.com/etblink/math/actions/runs/43493125150), [#43498649514](https://github.com/etblink/math/actions/runs/43498649514); every accepted claim requires its own exact type/consumer ceiling. The derivation of `c_1=0` and the proposed massless-coefficient lemma are **not** included in those prior green reports.
