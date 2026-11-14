# BFSS — exact source Clifford commutator shortcut for radial weights

**Date:** 2026-11-13 (Pacific). **Project Lead classification:** RESEARCH-ONLY, source-exact mathematical derivation and prospective proof contracts; **no newly qualified Lean theorem**, no modification to source, CI, gate state, experiment registry, original Hamiltonian or main. Integration branch: `integration/bfss-unified-research-20261108`.

## Finding in one paragraph

The original source **already** proves the general Leibniz identity `M.charge_realCutoff` and the exact Clifford unit-principal-symbol identity `M.principalSymbol_unit_norm_sq`. Specializing them to the smooth real radial weight `w_ε(x)=sqrt(‖x‖²+ε²)` or its reciprocal `b_ε(x)=1/w_ε(x)` appears to give *exact* pointwise, sixteen-charge, and integrated quadratic-form commutator identities, not merely conservative triangle bounds. In particular, **[Q, w_ε] has a uniformly bounded zeroth-order extension as ε↓0 even though multiplication by w_ε is unbounded on full L²**. By contrast [Q,b_ε] admits a bound increasing like ε^-2. This sharp distinction could materially help the auxiliary weighted-charge domain route, without establishing a zero-regularization limit, Hardy inequality, spectral gap or ground state.

## 1. Pinned original-source theorem interfaces (not requalified in this note)

`lean/OAI/MathematicalPhysics/BFSS/Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`:
- `M.charge α : SmoothCore N →ₗ[ℂ] SmoothCore N`, with kinetic coefficient `(-Complex.I * M.gamma i α β)`, original Majorana `M.theta β A`, original coordinate derivative; potential term consists of scalar position multipliers and fermion operators.
- `M.smoothMultiplier g hg : SmoothCore N →ₗ[ℂ] SmoothCore N` preserves the compact smooth core.
- `M.gamma_symmetric`, `M.gamma_clifford`, `M.theta_CAR`, `M.theta_selfAdjoint` are source AlgebraData fields, not freshly assumed axioms.

`lean/OAI/MathematicalPhysics/BFSS/CliffordSymbols.lean`, blob **`cc01379653404c4ede3d551fd8d823e079543b21`**:
- Lines 17–86: `M.cliffordLinear_mixed`, `M.cliffordLinear_sq`, `M.cliffordLinear_selfAdjoint`, `M.cliffordLinear_norm_sq`. These already encode the exact 48-Majorana Clifford field norm, including the source CAR factor 1/2.
- Lines 88–184: `M.gammaLinear_mulVec_sq`, `M.principalCoefficients_sq`, `M.principalSymbol_sq`, `M.principalSymbol_norm_sq`, **`M.principalSymbol_unit_norm_sq`**. For `v : SpinIndex → ℝ` of squared norm one, `ξ : Boson N`, `z : Fermion N`:
  `‖M.principalSymbol v ξ z‖² = (1/2) * ‖ξ‖² * ‖z‖²`.
- Lines 186–236: **`M.coordinateDerivative_multiplier`** and **`M.charge_multiplier`** give literal source smooth-multiplier Leibniz identities.
- Lines 238–298: **`M.realCutoff`**, **`M.cutoffGradient`**, and **`M.charge_realCutoff`**, whose exact source statement is

  `M.charge α (realCutoff χ hχ f) x = (χ x : ℂ) • M.charge α f x + (-Complex.I) • M.principalSymbol (Pi.single α 1) (cutoffGradient χ x) (f x)`.

- Lines 322–326: **`M.basisSpinor_unit`** provides the exact unit basis spinor premise to `principalSymbol_unit_norm_sq`.

The source theorem identities are currently *present* in the integration tree. Their individual historical strict CI qualification has NOT been independently reconstructed in this research memo. Do not describe the following radial specializations as freshly Lean proven.

Current accepted radial source:
- R0A `P3AuxR0AOriginalRadialScalar.lean`, blob `a67f8740586588c6d4ee9c9148574c81c14d4937`, `originalRadialWeight` and positivity, strict GREEN #43510200014.
- R0B1 `P3AuxR0B1OriginalReciprocalLpInfinity.lean`, blob `d1cbb8077799236e5e1b82704270bdb9ab9153b4`, true `originalReciprocalField` and `L∞`, strict GREEN #43516234402.
- R0B2A native `FullL2 2` reciprocal bounded CLM, strict GREEN #43521745235.
- G0A SU(2) radial field/representative invariance, strict GREEN #43521457638.
- G0B0 genuine original `FullL2 2` bounded multiplier AE action, strict GREEN #43523896876.
- G0B1 original **bosonic** gauge pullback commutation, strict GREEN #43527998761.
- G0B2 strict R2 #43530462404 tests original **fermionic** fiberAction commutation and was pending at the beginning of this research. Do not promote it without a separately verified completed success.

## 2. Algebraic consequences from existing generic identities

For any smooth real scalar `χ : Boson 2 → ℝ`, `f : SmoothCore 2`, a fixed original `α : SpinIndex`, and `M=pairedAlgebraData`, define the pointwise **smooth-core defect**

`C_{χ,α} f(x) = Qα(χ f)(x) − χ(x) Qα f(x)`.

The exact existing `charge_realCutoff` statement immediately gives the **prospective specialization**:

`C_{χ,α} f(x) = -i M.principalSymbol (Pi.single α 1) (cutoffGradient χ x) (f x)`.

By `M.basisSpinor_unit α` plus `M.principalSymbol_unit_norm_sq`,

`‖C_{χ,α} f(x)‖² = (1/2) ‖cutoffGradient χ x‖² ‖f(x)‖²`.

This is **equality**, not just a triangle inequality, for each α. Its dimension-independent factor 1/2 follows from source gamma Clifford and theta CAR conventions, not an imported paper's normalizations.

Summing across the exact 16 spinor labels:

`Σα ‖C_{χ,α} f(x)‖² = 8 ‖∇χ(x)‖² ‖f(x)‖²`.

Multiplying by the source physical Hamiltonian core normalization **1/16**:

`(1/16) Σα ‖C_{χ,α} f(x)‖² = (1/2) ‖∇χ(x)‖² ‖f(x)‖²`.

For compactly supported `f`, finite output and suitable bounded gradient, integration over **original** `Boson 2` volume yields the same normalized formula with an integral. A strict Lean gate must prove the original `cutoffGradient` equals the usual Euclidean gradient for the radial scalar and prove exact `PiLp 2` source-output norm and `MemLp`/Fubini finite-sum steps.

## 3. Two radial fields and quantitatively different commutators

For ε>0 and `r=‖x‖`:

| χ | ∇χ(x) | ‖∇χ‖∞ | one-α commutator field norm |
| --- | --- | --- | --- |
| `wε(x)=sqrt(r²+ε²)` | `x / sqrt(r²+ε²)` | `1` (sup, not attained) | `≤1/√2` |
| `bε(x)=(r²+ε²)^(-1/2)` | `-x / (r²+ε²)^(3/2)` | `2/(3√3 ε²)` (attained at r=ε/√2) | `≤2/(3√6 ε²)` |

The ∇b formula differentiates in all **27 real bosonic configuration coordinates**, not 27 physical space dimensions.

**Weight wε:** exact pointwise source-suggested identity on `SmoothCore 2`:

`(1/16) Σα ‖[Qα,M_wε]f(x)‖² = (1/2) (r²/(r²+ε²)) ‖f(x)‖² ≤ (1/2) ‖f(x)‖²`.

Hence the full finite 16-output commutator-column `C_wε` has an **expected** `FullL2 →L[ℂ] PiLp 2` bounded extension, with operator norm ≤√8=2√2, uniformly in ε>0. Single α norm ≤1/√2. **This is especially valuable because M_wε is unbounded on the full L² space.** Boundedness of its commutator does not make M_wε itself bounded.

**Reciprocal bε:** exact normalized field formula

`(1/16) Σα ‖[Qα,M_bε]f(x)‖² = (1/2) (r²/(r²+ε²)^3) ‖f(x)‖²`.

Thus the single-α L² commutator norm is ≤`2/(3√6 ε²)`, and the full 16-charge column norm ≤`4√2/(3√3 ε²)`. The bounds diverge ε^-2 as ε↓0. The sharp scalar gradient and pointwise field norm constants are derived, not yet individually verified by a new Lean radial gate.

**Sharpness:** The source principal symbol identity is exact for every Fock vector. Each gradient reaches its supremum or approaches it in open sets of positive Lebesgue measure; local Fock-supported L² tests can approximate the essential supremum. Precise operator-norm *equality* on full L² is plausible but needs an explicit native source full-support/multiplier-norm proof. The conservative proposed **upper bounds** above are sufficient for the next gate.

## 4. A non-obvious operator-domain consequence

Source `SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean`, blob `a9f27a48852ac570aedc8e0ab88d683250e6b138`, defines the physical sixteen-charge partial operator from the **closure of the actual gauge-invariant smooth-core graph**. Accepted M5BF0 [strict #43498649514](https://github.com/etblink/math/actions/runs/43498649514) reuses this exact physical graph in native paired source. Existing D3B source `sourceOriginalCoreCharge_mem_invariantCore` proves Qα maps original gauge-invariant smooth core into itself (its individual historical CI receipt has not been reconstructed here).

Once G0B2 and G0B3 both qualify Bε gauge preservation, the following **abstract closed-graph transport plan** becomes viable:

1. Establish `Bε` preserves source physical space E, and that the smooth radial bε multiplier maps original invariant `SmoothCore 2` to itself. (The latter is stronger than group-level preservation of E; needs ε>0 smoothness plus pointwise source gauge compatibility.)
2. Define bounded coordinatewise `Bε^K` on the original output `K=PiLp 2 (SpinIndex → FullL2 2)`, and a bounded defect `Cε:E→L[ℂ]K` using the source principal symbol, with norm at most `4√2/(3√3 ε²)`.
3. On the original invariant smooth core: `T(Bε f)=Bε^K(Tf)+Cε f`.
4. Because the *definition* of the accepted original physical T graph is the closure of its invariant smooth-core graph, take a graph-convergent sequence of genuine original invariant core vectors. Boundedness of Bε, Bε^K and Cε and closedness of T should give `Bε Dom(T) ⊆ Dom(T)` with the same commutator identity on Dom(T).

The graph-transfer result is **conditional on typing the actual physical E, graph/output K, and building bounded source Cε**. Norm-density of invariant core E alone would not be sufficient; **graph-core** density is the decisive property and must be matched exactly to source AY/M5BF0. No bounded inverse, new gauge model or source Hamiltonian normalization should be introduced.

The weight-side uniform commutator suggests a complementary route to study `Wε T f = T(Wε f)−C_wε f` on compact invariant core, perhaps proving stable weighted domain estimates. **Wε is unbounded**, so DO NOT treat it as a global `E→L[ℂ]E` map or infer full-domain equivalence from the core identity. Extension to ε=0 would require weak first-order/Sobolev calculus because `w₀(x)=‖x‖` is not smooth at x=0; uniform commutator bounds alone do not provide convergence of closures or control of kernels.

## 5. Economical next formal verification plan, independently of G0B2

**N0A1 — radial smoothness/gradient only.** With fixed ε>0, prove `ContDiff ℝ ⊤` of true source `originalRadialWeight ε`, of the underlying *real* reciprocal scalar, and exact original Euclidean gradients, using `‖x‖² = inner ℝ x x`. The accepted R0A/R0B1 modules establish continuity and positivity but **not yet ContDiff/gradient formulas**. Retain the frozen original R0A/R0B1 bytes.

**N0A2 — source original core product/commutator.** Import pinned `OAI.MathematicalPhysics.BFSS.CliffordSymbols`, instantiate `M.charge_realCutoff` with `χ=wε` and `χ=bε`; prove literal original source core identity with the true pairedAlgebraData and no replacement gamma/Majorana matrices. One or two independent roots and a native consumer.

**N0A3 — exact Clifford bound.** Reuse `M.basisSpinor_unit` and `M.principalSymbol_unit_norm_sq` without duplicating gamma/Clifford algebra. Prove one-α and sixteen-charge normalized bound using literal `SpinIndex=Fin 16`, true Fock L² volume and native PiLp 2 output. First prove a pointwise equality, then a.e./L²/MemLp inequality.

**N0A4 — physical domain transfer (after G0B3).** Prove bounded defect on E→K and graph-core convergence, only then source physical `T Bε = Bε^K T+Cε` on its exact domain. Keep W-side unbounded multiplier graph questions separate and do not conflate core with maximal operator domains.

These are staged as **research contracts only**, not independent Lean-qualified claims and not changes to running G0B2 proof/CI. The immediate operating gate remains G0B2 R2 source fermionic commutation and then G0B3 physicalSpace preservation.

## 6. Falsification/negative knowledge

- **Do not claim** `[Qα,Bε]=0`: gauge-invariant bε can fail to commute with supercharges; the first-order product rule shows the nonzero defect.
- **Do not require** Bε surjective or boundedly invertible: its range is expected dense nonclosed on original full L². M_wε, inverse on the range, is unbounded.
- **Do not confuse** the scalar `‖∇χ‖∞` estimate with a proved L² operator norm before the native source Fock multiplier and norm/measure interfaces are verified.
- **Do not call** the source norm identity a Noether conservation law. It is a first-order Clifford/Leibniz commutator identity *motivated* by separating gauge symmetry from supersymmetry, not a proof of conserved `Q_\alpha`.
- **Do not infer** original auxiliary Hamiltonian, Hardy positivity, Spin9 singlet gap, zero energy eigenstate, ε=0 strong-resolvent convergence or ground-state fidelity.
- Keep the Michel–Scheinpflug–Yin November 6, 2026 external paper [arXiv:2611.09837](https://arxiv.org/abs/2611.09837) as an independently normalized external result, not an accepted original source theorem.

Related documentation: [Noether I/II forward research](P3_NOETHER_FIRST_SECOND_SYMMETRY_AND_WEIGHTED_CHARGE_FORWARD_RESEARCH_2026_11_13.md), [Gauss/Maxwell research](P3_GAUSS_MAXWELL_BFSS_FORWARD_RESEARCH_2026_11_13.md), and [original auxiliary radial charge contract](P3_AUXILIARY_RADIAL_CHARGE_RESEARCH_CONTRACT_2026_11_13.md).
