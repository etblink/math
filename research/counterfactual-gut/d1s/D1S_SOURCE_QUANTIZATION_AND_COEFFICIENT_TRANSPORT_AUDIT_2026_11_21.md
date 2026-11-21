# D1S — source-original real FrequencyMatrix quantization and gauge-transport pilot

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Scope:** source-definition audit, new isolated Lean source/independent consumer, one strict CI trigger, and independent Python prescreen for the next finite-coefficient theorem.
**Qualification:** **D1S0 not yet native-qualified at documentation time**; D1R0 remains RED/FROZEN after two native REDs. Numerical and ordinary finite-dimensional algebraic checks are not original-source Lean proofs. No physical Gauss-invariant test function, Hamiltonian spectral, hopfion or GUT claim.

## 1. Exact original source interface

Original `FermionFrequency.lean`, Git blob `cbb82a42f42b3b3d3695081247bd14d0496abc7d`, provides:

```lean
abbrev FrequencyIndex (N : ℕ) := SpinIndex × ColorIndex N
abbrev FrequencyMatrix (N : ℕ) := Matrix (FrequencyIndex N) (FrequencyIndex N) ℝ
```

Original `FermionQuantization.lean`, Git blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, provides:

```lean
def quantizeFrequency (K : FrequencyMatrix N) : Fermion N →L[ℂ] Fermion N :=
  (Complex.I/2) • ∑ r : FrequencyIndex N, ∑ s : FrequencyIndex N,
    (K r s : ℂ) • (M.theta r.1 r.2 * M.theta s.1 s.2)
```

Using the exact original Majorana normalization `γ=√2 θ` and real skew 48×48 covariance `C`, the flattened source-carrier operator from D1O–D1Q obeys **algebraically**

`H_C=-(i/4)∑_{a,b}C_abγ_aγ_b=-(i/2)∑ C_abθ_aθ_b=pairedAlgebraData.quantizeFrequency(-C)`.

Thus there is no need for the redundant bespoke complex-coefficient `originalCARQuadratic` that caused D1R0 RED. This is also a type improvement: source `FrequencyMatrix 2` uses **real** coefficients, rather than arbitrary complex 48×48 coefficients.

## 2. New source-exact bounded D1S0 gate

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S0OriginalQuantizedCARGaugeBridge.lean`, Git blob `9fd3a61f9dac8a370a68920303a39f3c8b81b6bd`.
- Independent consumer: `lean/diagnostics/BFSSD1S0OriginalQuantizedCARIndependentConsumer.lean`, blob `c8d02f00021e43cacf818b28197253613faaa965`.
- Workflow: `.github/workflows/bfss-d1s0-original-quantized-car-strict.yml`, blob `36208976de7a3d706bbf71adee06a97fb08b71b9`.
- Atomic initial source+consumer+workflow commit: `9ad30d3720166f7046c7e26f709dea589a0f40d4`.
- Native gate: [run #44961701135](https://github.com/etblink/math/actions/runs/44961701135). Initially observed checkout and frozen-source preflight PASS, Lean/Mathlib restoration in progress; **no native acceptance asserted**.

D1S0 does **not import the failed D1R0 module**. It reuses two already-source-compiling results: literal `pairedTheta_CAR` and exact G4J gauge transport of ordered theta pairs, unchanged from D1R0's two native source compilations. The third new result is a definitional equality on source types: `originalSourceFlattened C = pairedAlgebraData.quantizeFrequency (-C)` for `C : FrequencyMatrix 2`. Independent consumer explicitly instantiates literal `pairedAlgebraData`, `pairedGaugeData`, `Fermion 2` and `FrequencyMatrix 2`. Pinned strict workflow runs source cold build, warning-as-error `#print axioms`, independent consumer, artifact archive, and source SHA preflight. This does not yet prove nontrivial gauge covariance of `quantizeFrequency`.

## 3. D1S1 mathematical target: push original real coefficients, not operators by hand

The original G3A source declares the real 3×3 adjoint matrix `R_g[output B,input A] = M.adjointCoefficient g A B`, and proves its source group law and orthogonality. Define on the **actual** original `FrequencyIndex 2 = SpinIndex×ColorIndex 2`:

`T_g[(α,B),(β,A)] = δ_{αβ} R_g[B,A]`.

For any original real frequency coefficient matrix `K` define

`(g ⋅ K)[(α,B),(β,D)] = Σ_{A,E} R_g[B,A] R_g[D,E] K[(α,A),(β,E)]`.

Equivalently `g⋅K = T_g K T_gᵀ`. This preserves realness, skewness and (when present) the pure covariance constraint `K²=-I`. By source G4J's exact `fermion_adjoint` law and ordered two-theta covariance, ordinary finite-sum rearrangement yields the prospective source theorem

`pairedGaugeData.fermion g (pairedAlgebraData.quantizeFrequency K v) = pairedAlgebraData.quantizeFrequency (g⋅K) (pairedGaugeData.fermion g v)`.

**Key proof design**: work pointwise at `v : Fermion 2` with source continuous-linear maps, then fold the two color finite sums into the transported real coefficients. Prove a separate **abstract finite-sum interchange** and separately identify `G3A` color-index orientation. Avoid source `D1R0.originalCARQuadratic`, deep Clifford modules, giant 2^24 matrices, or any global Gaussian Kato/SVD machinery in this microgate. No D1S1 Lean theorem is presently qualified.

## 4. Independent D1S1 numerical falsifier

Runnable `d1s1_original_quantization_covariance_prescreen.py` (Python/NumPy) and archived JSON result test **40** random 48×48 real antisymmetric coefficient matrices under source-oriented SO(3) color transformations and **nine** independent reduced three-/six-orbital exterior-Fock cases (dimensions 8 and 64). It checks `g⋅K=TKTᵀ`, source output-input group composition, genuine exterior-Fock conjugation of the source-normalized quadratic, CAR generator transformation, Hermiticity, and the minus sign in `H_C=quantizeFrequency(-C)`.

| Check | Max residual |
|---|---:|
| Exact full 48-index coefficient pushforward (`einsum` vs `T K Tᵀ`) | 0 |
| Real 48-index color composition | 1.45826e-14 |
| Reduced exterior-Fock source quantization covariance | 1.20759e-14 |
| Self-adjointness for real skew coefficients | 2.22045e-16 |
| Original theta generator covariance | 1.97008e-15 |
| Flattened Gaussian sign and normalization | 9.33850e-15 |
| **Incorrect transposed-color negative control (minimum)** | **16.58998 (fails)** |

These are numerical falsifiers, not 24-mode original-carrier compilation. They use arbitrary proper SO3 matrices as the **image** of original adjoint color action rather than directly numerically parameterizing SU2; in this compact group all such rotations are in the image.

## 5. Governance and decision

- D1R0 source R2 and R3 native REDs remain preserved; no D1R0 R4 or changes to its source/workflow.
- D1S0 is a distinct architecture with no redundant zero-coefficient theorem; **source/consumer all-or-nothing qualification required**, and strict RED must be preserved with first-causal logs.
- If D1S0 is GREEN, the next bounded theorem is finite coefficient transport and source `quantizeFrequency` intertwining; if RED, inspect exact first-causal type failure and adhere to stop rules.
- This supports source algebra research but does not yet supply the literal source-typed global Kato vector, original gauge-invariant `SmoothCore 2` or the normalized BFSS Hamiltonian form bound. The earlier `22.305853.../R²` remains conditional; the Gaussian Berry line cannot itself carry a nonzero first Chern Hopfion charge.
- No original BFSS source, pinned toolchain, main, unified integration, or RHOPF branch modified.
