# D1D — Exact original BFSS fermion-frequency source connection and the closed-Hamiltonian boundary

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Parent audit:** [D1C](./D1C_SOURCE_YUKAWA_DETERMINANT_AND_ORIENTATION_OBSTRUCTION_2026_11_21.md).  
**Classification:** SOURCE-TYPED ALGEBRAIC IDENTITY / CONDITIONAL CORE-FORM JOIN / NARROW NEGATIVE SPECTRAL KNOWLEDGE.  
**NOT:** newly compiled Lean code, native/consumer green gate, independent acceptance of historical prospective files, new BFSS ground state, positive 4D chiral index, physical Hopf soliton, or GUT.

**Executive verdict:** The D1C 48×48 skew source-Gamma9 Yukawa coefficient is *not an invented model*: it equals the **massless part** of an existing original `FermionQuantization.fermionCoefficient`. Its source CAR quantization is exactly the undeformed fermionic field appearing in the **original-core** supercharge-energy identity, after the original real/complex restriction. Yet the precise equality of the *source original core charge* with the `h=1,m=0` deformed-core implementation still goes through the **prospective G4-K9D** declaration at this branch pin. The closed, gauge-physical `H=(1/16)T†T` port is **also prospective** here. Therefore neither the matrix determinant nor the core-form formula is, by itself, a statement about the complete interacting Hamiltonian spectrum or physical hopfion/chirality.

## 1. Exact inspected source and version pins

| Source file (root `lean/OAI/MathematicalPhysics/BFSS/`) | Git blob SHA | Scope |
| --- | --- | --- |
| `Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | Original `Boson 2 = ℝ²⁷`, `Fermion 2 = ℂ^(2^24)`, 16 `charge` operators and `coreForm = (1/16)∑‖Qα f‖²` |
| `FermionQuantization.lean` | `c6b72d030225c707ef54f5285a18a7a8175ee280` | `fermionCoefficient`, `quantizeFrequency`, `frequency_bracket_contraction`, `deformedFermionField_bracket`, `deformedFermionField_quantized` |
| `FrequencyOperators.lean` | `8d18da2d1c8de554e6ad3da01cd5f930d8695681` | Source `quantizeFrequency_selfAdjoint` / fermionic CAR commutator on Fock |
| `DeformedCharge.lean` | `c27c913c44090100f0c714e3eb34e25205f4d2d3` | `deformedCoreCharge_apply`, `averaged_core_energy` |
| `FermionFrequency.lean` | `cbb82a42f42b3b3d3695081247bd14d0496abc7d` | **Mass-deformed** normal fermion frequency invertibility conditional on `deformedBosonicPotential 1 1 q = 0` |
| `MassIdentity.lean` | `331351401561e09a661068e83eb34cb6d8a96138` | Source Γ012 spin mass term, square and skew sign |
| `GaugeCore.lean` | `e4990dadf1d8bde849e351467282ab3f14989c3b` | Gauge-fixed `physicalSpace` and `invariantCore` on original `FullL2` |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSFullAlgebraDataProbe.lean` | `de8242615e4b2959e2dfa57cf0c6fdf43896acb7` | Original `concreteAlgebraData.color=normalizedPauli`, `gamma=BFSSGamma9.gamma` |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | Literal `pairedAlgebraData` uses those very original color/gamma matrices and 48 paired Majoranas |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean` | `cc0f4624239160dc39a7a191a519786e71df6abd` | **PROSPECTIVE / UNCOMPILED by its file comment**; contains proposed `sourcePotentialMultipliers_equal`, `sourceUnconditionalCoreCharge_equal` and `sourceUnconditionalCoreForm_equal` |
| `Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean` | `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1` | **PROSPECTIVE / UNQUALIFIED by its file comment**; original paired normalized `H=(1/16)T†T` on natural gauge-physical domain |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean` | `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5` | Upstream proposed source Hamiltonian normal-form, closedness and weak-form statements; **PROSPECTIVE** at the file's scope |
| `Contrib/Kotler/SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | Signed-permutation original 16×16 real Gamma9 witness |

The D1D mathematical calculations use the exact **N=2, 16×3** indices and the source normalizations. There is no surrogate Dirac operator, replacement Fock carrier or model imported from Physlib.

## 2. Source-exact identification of the D1C Yukawa coefficient

Write `r=(α,b)` and `s=(β,c)` for source `FrequencyIndex 2 = SpinIndex × ColorIndex 2`. Original `FermionQuantization.fermionCoefficient` is literally
\[
F(X)_{rs}
=\mathbf 1_{b=c}\,\tfrac32(\Gamma_{012})_{\alpha\beta}
-\sum_{i=1}^{9}\sum_{a=1}^{3}
 f_{cba}\,X_{ia}\,(\Gamma_i)_{\alpha\beta}.
\]
Here `Γ012=Γ0Γ1Γ2` is the fixed **mass-deformation spinor matrix**, not a term added by D1C. The exact paired SU(2) source uses `f_{abc}=\sqrt 2\,\varepsilon_{abc}` (the color normalization is definitional in `SU2BFSSFullAlgebraDataProbe` and `SU2BFSSG1APairedThetaProbe`; see the L6G5L Pauli coefficient source).

Set the **original massless coefficient**
\[
F_0(X):=F(X)-F(0).
\]
Because `f_{cba}=-f_{abc}`, index-by-index
\[
\boxed{
F_0(X)_{(\alpha,b),(\beta,c)}
=\sum_{i,a}X_{ia}(\Gamma_i)_{\alpha\beta}\,
 f_{abc}
=A_f(X)_{(\alpha,b),(\beta,c)}.
}
\]
**This corrects the source-joining status left OPEN in D1C:** it is an exact source-defined coefficient identification by expansion, not just a numerically suggestive analogy. A dedicated Lean theorem on exact source carriers has **not** been newly compiled here; this audit proves the equality algebraically using source definitions and antisymmetry.

The full `F(X)` is the coefficient of the **mass-deformed** `h=m=1` fermionic field. `F_0(X)` is the BFSS **massless** `h=1,m=0` piece. Do **not** transfer a theorem about `F(X)` or `normalFermionFrequency` directly to `F_0(X)`.

## 3. Native Fock quantization of exactly this massless matrix

Upstream `FermionQuantization.quantizeFrequency` uses the literal source 48 Majoranas with CAR normalization `{θ_r,θ_s}=δ_rs I`:
\[
\operatorname{Quantize}(K)
=\frac{i}{2}\sum_{r,s}K_{rs}\,\theta_r\theta_s
\quad\in\operatorname{End}_{\mathbb C}(\operatorname{Fermion}\ 2).
\]
For skew `K` this is self-adjoint by the existing `FrequencyOperators.quantizeFrequency_selfAdjoint` theorem. The source lemma `frequency_bracket_contraction` says that the original `f_{s.2,r.2,a}X_{ia}Γ_i` contraction of thetas equals the source `cubicFermionComponent` sum. The source `deformedFermionField_bracket` identifies the **massless** field as `(-i/2)` times that sum. Consequently, with `M=pairedAlgebraData`:
\[
\boxed{
M.\operatorname{deformedFermionField}(1,0,X)
=\bigl[M.\operatorname{quantizeFrequency}(F_0(X))\bigr]
  \big|_{\mathbb R}.
}
\]
The `|_ℝ` means `ContinuousLinearMap.restrictScalars ℝ` in the exact source—the left side is an **ℝ-linear** operator on the literal original complex Fock Hilbert space, while `quantizeFrequency` is **ℂ-linear**. This is essential for type-correct reuse.

This follows by source finite-sum algebra; **the existing direct source theorem** `deformedFermionField_quantized` is stated at `h=m=1` for `F(X)`, not at `m=0`. The displayed massless equation is a new **derived proof target** for a small exact pin/consumer gate if the owner later wants one. It is not certified by claiming that an upstream theorem already states it verbatim.

## 4. The smooth-core original energy already contains the right physical interaction

`DeformedCharge.averaged_core_energy` states for any `AlgebraData N` and smooth-core test wavefunction `ψ`:
\[
\frac1{16}\sum_\alpha\|Q^{h,m}_\alpha\psi\|^2
=\frac12\sum_{i,a}\|\partial_{ia}\psi\|^2
+\int_{\mathbb R^{27}}\!\left[
 V^{h,m}_B(X)\|\psi(X)\|^2+
 \operatorname{Re}\langle\psi(X),V^{h,m}_F(X)\psi(X)\rangle
\right]\,dX,
\]
in the original normalized source conventions (the complex Fock inner product appears as a real inner product in the Lean statement). Specializing `h=1,m=0` gives the massless right-hand fermion term `Quantize(A_f(X))`.

For identification with the **original literal `AlgebraData.charge`** and `Core.coreForm`, the repo contains `SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean`, whose exact declarations assert
\[
\operatorname{deformedPotentialMultiplier}(1,0,X,\alpha)
=\operatorname{bracketMultiplier}(\alpha,X),
\]
\[
\operatorname{deformedCoreCharge}(1,0,\alpha,\psi)
=\operatorname{charge}(\alpha,\psi),
\quad
\operatorname{deformedCoreEnergy}(1,0,\psi)
=\operatorname{coreForm}(\psi).
\]
**Qualification boundary:** G4K9D explicitly labels itself **PROSPECTIVE / UNCOMPILED** in this pinned source. The statements and proof text exist; no new exact commit native+independent green check was made. Thus this research memo treats the *fully joined original-core energy equation* as an exact **conditional proof plan pending strict requalification**. It must not be promoted as an already accepted root just by reading its file.

Furthermore the source physical Hilbert space is
\[
\mathcal H_{\rm phys}
=\{\,\psi\in L^2(\mathbb R^{27};\mathcal F):
     \operatorname{bosonPullback}(g)\psi
    =\operatorname{fiberAction}(g)\psi \;\forall g\in SU(2)\,\}.
\]
The closed physical source Hamiltonian port `P3M5BE0` identifies `H=(1/16)T^\dagger T` on `Dom(T†T)` with self-adjointness, but is separately **PROSPECTIVE / UNQUALIFIED**. Even if an exact smooth-core identity passes, transporting a pointwise determinant/eigenbundle result into the spectral theory of this **unbounded differential operator** requires a new genuine domain-sensitive proof.

**Do not claim:** the spectral gap of `A_f(X)` equals the BFSS Hamiltonian mass gap, that the finite Fock eigenmode is a ground-state wavefunction, or that its kernel is a four-dimensional Weyl chiral index.

## 5. New rank-stratified massless one-particle kernel theorem (algebraic, not native Lean)

D1C already established
\[
\det A_f(X)=2^{40}\bigl(\det X^\mathsf TX\bigr)^8.
\]
We can sharpen the zero-mode claim exactly. Singular-value reduction via `SO(9)` left rotations and `SO(3)` adjoint right rotations, plus harmless sign choices in the canonical frame, reduces the matrix to three source-Gamma blocks. With `f=√2 ε` let `A_\epsilon=A_f/\sqrt2` and consider
\[
A_\epsilon(\sigma)=
\begin{pmatrix}
0&\sigma_3\Gamma_3&-\sigma_2\Gamma_2\\
-\sigma_3\Gamma_3&0&\sigma_1\Gamma_1\\
\sigma_2\Gamma_2&-\sigma_1\Gamma_1&0
\end{pmatrix}.
\]
If `σ₃=0` and at least one of `σ₁,σ₂` is nonzero, this skew operator couples a 32-dimensional upper block to a 16-dimensional lower block by a **surjective** real linear map (one invertible gamma suffices). Therefore its rank is **32**. If all `σ` vanish it is zero. If all are nonzero it has full rank 48 by the determinant identity. Hence
\[
\boxed{
\dim_{\mathbb R}\ker A_f(X)=
\begin{cases}
48,& \operatorname{rank}X=0,\\
16,& \operatorname{rank}X=1\text{ or }2,\\
0,& \operatorname{rank}X=3.
\end{cases}
}
\]
**Independent check:** Exact signed-permutation original Γ-word/epsilon 48×48 matrices (SymPy rational/integer arithmetic) returned real ranks `0,32,32,48` at canonical rank `0,1,2,3` configurations; prior D1C exact determinant tests included generic full-rank integer data. This is mathematical corroboration, not a Lean consumer.

The classical **commuting BFSS valleys** have bosonic color rank `≤1`, so their nonzero points carry **16 zero one-particle Majorana directions** in this massless Yukawa coefficient. **No Fock ground-state degeneracy, physical Gauss-fixed degeneracy, normalizable BFSS zero mode, superselection sector, protected Hopf defect or 4D chirality follows automatically.** Kinetic, normal-oscillator, gauge and interacting effects remain.

## 6. Strong mass-deformation negative control at the origin

At `X=0`,
\[
F_0(0)=0,\qquad
F(0)=\tfrac32\,\Gamma_{012}\otimes I_3.
\]
The original source gamma product obeys `Γ012²=−I16` and `Γ012ᵀ=−Γ012`. Thus **the deformed** `F(0)` is invertible with singular values `3/2`, whereas the **massless** `F_0(0)` is zero. This is not a subtle perturbation: the model's pointwise one-particle gap at the origin changes from zero to nonzero by adding the deformation.

The source `FermionFrequency.normalFermionFrequency_trivial_kernel` assumes a zero of **`deformedBosonicPotential 1 1`**; it is NOT an invertibility theorem for the original `h=1,m=0` SU(2) BFSS Yukawa coefficient. The mass deformation can be an instructive *control* but must never be substituted as a premise for undeformed BFSS gap, chiral family count, or particle spectrum.

External physics corroboration of the model distinction: https://pmc.ncbi.nlm.nih.gov/articles/PMC12840427/ (BFSS matrix quantum mechanics review) and https://journals.aps.org/prd/pdf/10.1103/PhysRevD.111.086004 (plane-wave/BMN mass-deformation discussion). External literature is context, not new formal-source evidence.

## 7. Bounded next proof and physics agenda (D1E)

**Small proof targets only if separately authorized for a future Lean gate:**

1. `D1E-A` *coefficients:* on literal `pairedAlgebraData`, define `masslessFrequency X = fermionCoefficient X − fermionCoefficient 0` and establish entrywise equality with the previously specified 48×48 `A_f(X)`, preserving color-index order and exact `√2` normalization.
2. `D1E-B` *quantization:* prove the single original-carrier identity `deformedFermionField 1 0 X = (quantizeFrequency (masslessFrequency X)).restrictScalars ℝ` using existing `frequency_bracket_contraction` and `deformedFermionField_bracket`; independently check physical-star/axiom report.
3. `D1E-C` *core:* requalify the **existing** prospective `G4K9D` exact original core-charge/form bridge under pinned toolchain and source-specific independent consumer *before* stating equality with `Core.coreForm` as accepted.
4. `D1E-D` *physical domain:* separately qualify/review `P3M5BE0` and historical BE natural `Dom(T†T)`, check original invariant-core closability/density and actual preserved domains. Do not import an artificial Hilbert model.
5. `D1E-E` *physical diagnostics:* only after the above may the determinant/kernel be interpreted as a pointwise coefficient in the accepted physical energy form. Separately test whether a **source-preserved** spatial-effective operator/family index exists. Existing massless rank≤2 zeros, P1–P4 escapes and absent 3D Dirac operator remain adversarial controls.

**Stop rules:** If an asserted physical gap depends on the `Γ012` deformation, reject it for massless BFSS. If a 3D index is just a 48×48 finite-matrix kernel count, reject its identification with Standard Model chiral generations. If full-H domain/covariance does not qualify, preserve the original-core result but do not advance physical claims.

**Decision:** D1D supplies a new exact source *connection* and useful kernel refinement, while identifying G4K9D and M5BE0 as explicit verification boundaries. **No branch source change, Lean compilation, CI workflow or physical/GUT conclusion.** Preserve accepted and negative RHOPF evidence on the unified branch unchanged.
