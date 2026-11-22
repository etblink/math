# D1S2 — original 48-Majorana quantizer kernel, self-adjointness and SU(2) observability

**Research date:** 2026-11-21 (America/Los_Angeles). **Disposition:** **ANALYTIC CAR CONSEQUENCE + PYTHON PRESCREEN PASS; NOT A NEW LEAN GATE; NO PHYSICAL BFSS CLAIM.** A distinct forward-research step after D1S1, D1T0 and D1T1 independent-consumer stop decisions. No CI was launched.

## 1. Frozen literal source contract

The following source blobs were independently read on the isolated branch `research/bfss-hopfion-gut-counterfactuals-20261121`:

- Original `lean/OAI/MathematicalPhysics/BFSS/Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, source `AlgebraData.theta_CAR` and `theta_selfAdjoint`.
- Original `lean/OAI/MathematicalPhysics/BFSS/FermionFrequency.lean` blob `cbb82a42f42b3b3d3695081247bd14d0496abc7d`: `FrequencyIndex N := SpinIndex × ColorIndex N`, `FrequencyMatrix N` is real.
- Original `lean/OAI/MathematicalPhysics/BFSS/FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, original `quantizeFrequency` (line 241), `fermionCoefficient` (line 236).
- Original source `FrequencyContraction.lean` blob `425edf6d7d0f9d15ce5f8bc92e8788ef60068618`, `structureConstant_swap` and gamma mass-matrix transpose machinery.
- Paired original `SU2BFSSG1APairedThetaProbe.lean` blob `152204ef15a6569534e0503824a697cb9ae8e4ce`, `pairedTheta_selfAdjoint`, `pairedTheta_CAR`.
- Color action `SU2BFSSG3AAdjointColorRepresentationProbe.lean` blob `553869f1287c64893398c3b79c04fe010023bd08`, `adjointColorMatrix_orthogonal`: real 3×3 output-row/input-column convention.
- Source D1S1 covariance theorem blob `c2946bab3f82bf1ba57574a6a9d18258c185ef99`: `originalQuantizeFrequency_gauge` strict *source* compiled under permitted axioms in [R2 #44965032924](https://github.com/etblink/math/actions/runs/44965032924). Its explicit public-name independent consumer is **still RED**; D1T0 and D1T1 consumers also RED/FROZEN.

Let `n=48`, `p=(spin,color)`, with real `K∈M_n(ℝ)` and original Hermitian Majorana operators satisfying

```text
θ_p† = θ_p
θ_p θ_q + θ_q θ_p = δ_{pq} I
Q(K) = (i/2) Σ_(p,q) K[p,q] θ_p θ_q.
```

There is **no** conversion to a new 48-mode Fock representation or custom quadratic in these definitions.

## 2. Exact analytic CAR argument — independent of numerical tests

Let `A=(K−Kᵀ)/2` (antisymmetric) and `S=(K+Kᵀ)/2` (symmetric). Relabeling the finite sum and using the CAR:

```text
Σ_(p,q) S[p,q] θ_p θ_q
  = 1/2 Σ_(p,q) S[p,q] (θ_p θ_q + θ_q θ_p)
  = 1/2 Σ_p S[p,p] I
  = 1/2 Tr(K) I.
```

Therefore, **exactly for the original source definition**:

```text
Q(K) = Q(A) + (i/4) Tr(K) I.                       (★)
Q(K + S0) = Q(K)       for S0ᵀ=S0, Tr(S0)=0.      (†)
Q(K)† − Q(K) = -(i/2) Tr(K) I.                    (‡)
```

The skew component `Q(A)` is self-adjoint because the reverse ordering `θ_q θ_p` occurs with coefficient `A[q,p]=−A[p,q]`, and the factor `i` compensates for the reversal. For a nonzero original Fock carrier, `Q(K)` is therefore self-adjoint **if and only if** `Tr(K)=0`, even if `K` is not skew. Stronger claims such as `K` itself being forced skew by operator self-adjointness are **false**.

Real dimension count: `dim M_48(ℝ)=2304`, `dim skew=48·47/2=1128`, `dim symmetric=48·49/2=1176`, `dim symmetric-traceless=1175`. Hence the linear coefficient-to-operator map has a **provable kernel containing a 1175-dimensional space**. **Do not claim its kernel has exactly that dimension** without an independent source-faithfulness/injectivity proof of the skew coefficient representation.

The observable parameter quotient has dimension **at most** `2304−1175=1129` before additional physical constraints. For self-adjoint outputs, the skew part supplies **at most 1128 real coefficients**; source-Lie and physical BFSS constraints may reduce this further. This is a structural identifiability statement, not a count of physical particles or independent measurements.

## 3. What SU(2) does and does not establish

The original color matrix `R_g[B,A] := M.adjointCoefficient g A B` is orthogonal by source G3A. The real 48-label tensor action is `T_g=I_16⊗R_g` and the source coefficient transport is `K↦T_g K T_gᵀ` (D1S1's literal source normalization). Thus

```text
A(T_g K T_gᵀ) = T_g A(K) T_gᵀ
Tr(T_g K T_gᵀ) = Tr(K).
```

In particular, a trace-induced **imaginary scalar is gauge invariant**. Gauge covariance cannot certify self-adjointness or physical relevance. Symmetric traceless coefficient changes remain invisible to the quadratic Fock operator *before and after* this gauge transformation.

This is exactly the type of counterfactual distinction SCC should enforce: change the coefficient model along a mathematically null direction and check that predictions built **solely from this quantized operator** do not change. It does **not** imply two full BFSS theories with different bosonic or gauge couplings are observationally equivalent.

## 4. Numerical prescreen with genuine negative controls

An independent deterministic local Python prescreen passed **40 real 48×48 coefficient tests** and **nine reduced 3-/6-mode Jordan–Wigner Fock tests** (matrices of size 8 and 64). Local detailed prescreen SHA-256 `ea3b7ea9109132c26f5cff84543105fd059b8e2b3cf7a8d6cf3cf46159e781e7`, JSON SHA-256 `342a7615deb832047bcc60a450f2ac38047b526db0f4c2949eee9a6c30f30fd4`. Seed `20261123`. The archived compact [result JSON](./D1S2_CAR_NULLSPACE_PRESCREEN_RESULTS_2026_11_21.json) records the observed values; a [separate compact executable replicator](./d1s2_car_projection_prescreen.py) is provided for an additional reproducibility check.

| Test | Maximum numerical residual |
| --- | ---: |
| Full 48: skew and tensor-color transport | `5.45×10⁻¹⁵` |
| Full 48: preservation of eigenvalues of `iA` | `4.83×10⁻¹⁴` |
| Full 48: trace preservation | `1.42×10⁻¹⁴` |
| Reduced CAR identity | `1.78×10⁻¹⁵` |
| Reduced Fock: scalar decomposition (★) | `6.26×10⁻¹⁵` |
| Reduced Fock: `Q(A+S0)=Q(A)` (†) | `3.13×10⁻¹⁵` |
| Reduced Fock: non-Hermiticity magnitude (‡) | `2.13×10⁻¹⁴` |

**Falsifier:** replacing the correct coefficient `iTr(K)/4` with the incorrect `iTr(K)/2` gives a **minimum Frobenius residual of 3.394** across reduced cases. The nontrivial ignored symmetric traceless perturbations had minimum coefficient Frobenius norm **3.743** in the reduced tests and **33.12** in full 48×48 tests. Thus the zero effect cannot be blamed on tiny input perturbations.

All full 48-label tests apply *real SO(3)* output-input color rotations; only the reduced Fock tests construct explicit matrices. This **does not** simulate the original `2²⁴`-dimensional source Fock carrier or constitute a compiled Lean theorem. The analytic CAR derivation does not depend on those numerical approximations.

## 5. New high-value original-source question, not a CI launch

The original `M.fermionCoefficient x` is not an arbitrary 48×48 matrix. Its definition is a sum of (a) the `massT` spin term, with an antisymmetric gamma mass matrix, and (b) a source structure-constant term with antisymmetric color coefficient and **symmetric** `M.gamma j`. Index exchange suggests the whole original physical coefficient is skew:

```lean
-- DESIGN, not compiled Lean.
(M.fermionCoefficient x).transpose = -(M.fermionCoefficient x)
```

This would make trace zero **structural for original physical inputs**, not merely assumed. The proposed small source-level proof should reuse `BFSSGamma.massT_transpose`, `M.gamma_symmetric`, `M.structureConstant_swap` (and/or cyclicity), then connect to the CAR scalar-kernel lemma. Do not stage a new 9,000-job consumer CI until the exact theorem statement and source lemmas have passed isolated local Lean elaboration and a narrow static review.

**Priority:** (1) formalize the skewness of the **actual** `fermionCoefficient x`, (2) prove source `quantizeFrequency` annihilates symmetric traceless inputs, (3) only then consider a source-level Hermiticity and coefficient-identifiability interface. The result is useful for rigorous physical-operator work and SCC regardless of any Hopfion hypothesis.

## 6. Boundary and governance

D1S0 strict GREEN remains accepted. D1S1 original source theorem compiled strictly, but its full independent gate remains RED; D1T0 and D1T1 consumers RED/FROZEN. D1R0 remains RED/FROZEN. **No new Lean files, CI workflows or runs**, no edits to main/unified integration/RHOPF/original source. No original `SmoothCore` witness, projector rank, spectral gap, physical Hopfion, Standard Model, or GUT theorem has been established.
