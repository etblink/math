# Parallel read-only source audit — BFSS light-front mass, source units, and 2026 SU(2) spectrum

**Date:** 2026-11-13 Pacific. **Classification:** RESEARCH ONLY / CANDIDATE-NEUTRAL. **Active strict mathematical gate:** P3-M5BF0 [#43498649514](https://github.com/etblink/math/actions/runs/43498649514) tested `f2499980b808b6c9ddf2c6093f5b88ebff8b825f`, remained unqualified during this work. **Latest accepted:** P3-M5BE0 [#43493125150](https://github.com/etblink/math/actions/runs/43493125150). No Lean definitions, source imports, workflows, theorem roots, or mathematical gate status are modified by this note.

## 1. Two different assertions, not one equation

The exact current original relative `SU(2)` source defines `OAI.BFSSQuantum.AlgebraData.charge`, the 16 charge column and nonnegative smooth-core form
```
q_core(f) = (1/16) Σ_{α=0}^{15} ||coreToL2 (M.charge α f)||².
```
See `lean/OAI/MathematicalPhysics/BFSS/Core.lean` Git blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` (lines 12–18, 27–38, 93–111). The source has 9 spatial matrix labels and `colorDim(2)=3`: the real bosonic coefficient configuration is `R^27`, and the complex fermionic Hilbert fiber is `2^24` dimensional. The native **relative** physical Hilbert space removes the decoupled trace/center-of-mass degrees of freedom; 27 coefficients are NOT 27 spacetime directions. Frozen monograph Chapter 1 `contributions/bfss-kotler/internal-monograph/chapters/ch01_scope.tex` blob `bc9a99858621a665982e81097c31f4773227473a` explicitly warns against reinterpreting source matrix labels as spacetime and against treating the BFSS conjecture as part of the mathematical definition.

M5BE0 strictly accepts the exact native **relative** physical Hamiltonian `H_phys=(1/16)T†T` on `Dom(T†T)`, self-adjoint, closed, densely defined with full native weak-form equivalence. Source `P3M5BE0OriginalNativeHamiltonianPort.lean` blob `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1`, original imported BE blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`. This is **not** a numerical rest mass, a dimensionful dispersion relation, an eigenvalue, or an eleven-dimensional Poincaré representation. The factor `1/16` is the charge normalization, **not** `c²`.

The `m=0` in `M.deformedCoreCharge 1 0` and original “massless core energy” refers to the absence of an artificial deformation mass term; it does NOT assert the invariant mass of a quantum state is zero. Source `MassIdentity.lean` blob `331351401561e09a661068e83eb34cb6d8a96138` is weighted gamma/spin algebra, not Einstein's mass-energy identity. Do not promote it as a physical-mass bridge.

## 2. Exact external light-front kinematics; optional BFSS interpretation

Use the convention `x^±=(x⁰±x¹⁰)/sqrt(2)`, `p⁺=(p⁰+p¹⁰)/sqrt(2)`, `p⁻=(p⁰-p¹⁰)/sqrt(2)`, `c=ℏ=1`. Eleven-dimensional relativistic kinematics states

```
M² = 2 p⁺ p⁻ - |p_transverse|².
```

The standard *BFSS/DLCQ conjectural physical dictionary* identifies `p⁺=N/R_-` and full light-front energy `p⁻=H_BFSS`. This is explicit in Tropper–Wang, “Lorentz symmetry and IR structure of the BFSS matrix model,” JHEP07(2023)150 §2, https://doi.org/10.1007/JHEP07(2023)150; and Washington Taylor, “M(atrix) theory: matrix quantum mechanics as a fundamental theory,” Rev. Mod. Phys. 73, 419 (2001), https://doi.org/10.1103/RevModPhys.73.419. Conventions without sqrt(2) redefine what “R” or “p±” means and can shift factors of 2; never combine across conventions without translation.

For a genuinely separated full U(2) center-of-mass plus relative system, suppose (unproved in current Lean source):
```
p⁻_full = |p_transverse|²/(2p⁺) + U (κ H_phys) U⁻¹
```
where `U` is the exact Fock/coordinate/gauge-domain-preserving unitary identifying our source with the physical convention and `κ>0` has energy units. Only under this **explicit and independently checked** hypothesis does the center-of-mass kinetic term cancel, giving
```
M² = 2(N/R_-) κ U H_phys U⁻¹
N=2:  M² = (4κ/R_-) U H_phys U⁻¹.
```
The kinematic equation is exact within the stated convention, but the **operator/source-identification equation is missing**. Do not assert an unconditional theorem `M² = 4 H_phys/R_-`, or that `E=mc²` identifies the numerical source Hamiltonian with ordinary rest energy. In SI, restore `E²=c²|p|²+M²c⁴`, so `E_rest=Mc²` only for a state of invariant mass `M`, in its rest frame, within an applicable Lorentz-covariant completion.

## 3. New explicit physical unit conversion (November 10 paper)

Kabir Bajaj and Henry W. Lin, **“Solving the SU(2) BFSS model”**, arXiv:2611.14512v1, **submitted 2026-11-10** (https://arxiv.org/abs/2611.14512), is *new external research*, not an integrated Lean acceptance. Its Appendix C, equations (C.1)–(C.2), converts its own dimensionless relative Hamiltonian `H_BL` to the physical-position/light-front-time Hamiltonian of Herderschee–Maldacena:
```
L = (2π)^(1/3) ℓ_p,
X_HM = L X_BL,    P_HM = P_BL/L,
H_HM = (R_- / L²) H_BL.
```
In the same sqrt(2)-normalized DLCQ convention and absent transverse center-of-mass motion, this yields for the **paper's** normalization:
```
M² = (2N/L²) H_BL;     N=2: M² = 4 H_BL/L².
```
The paper independently writes `s=4E` for SU(2) center-of-mass scattering in its dimensionless variables (section 3.2). **This is a source for the dimensional conversion that was missing from our roadmap.** It does NOT prove `H_BL=H_phys`. To use it in our source, derive a source-faithful unitary, or exact quadratic form and associated-operator identification, tracking normalized color bases, gamma matrices, CAR, fermion signs, gauge lift, bosonic measure, coordinates, and closed natural domain. Without that, the physically correct `κ` for our Lean model is not established. In the same convention `κ=R_-/L²` is a *candidate* conditional on `U H_phys U⁻¹=H_BL`.

## 4. Source-normalization crosswalk: concrete matches and genuine gaps

There is unusually strong **displayed algebraic** agreement between three distinct sources, but not yet a checked operator equivalence:
- Current `Core.lean`: `Tr(color A * color B)=δAB`; `{theta(α,a),theta(β,b)}=δαβδab`; real symmetric Spin(9) gamma satisfying `γ_i γ_j + γ_j γ_i=2δij`; `γ_ij=(γ_iγ_j−γ_jγ_i)/2`; original 16 first-order charges `Qα=-iγθ∂+(1/2)f x x γ_ij θ`; core form `1/16 Σ||Qα f||²`.
- OpenAI **“Positive eigenvalues of the relative SU(2) BFSS Hamiltonian,”** dated October 5, 2026, `openai/math` manuscript Git blob `12c5fffb5f90b48856f60fb0e93c18e2490c5f1b`, source `preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026/build/positive-eigenvalues-relative-su2-bfss.tex`, lines 68–133: `T_a=σ_a/√2`, `f_abc=√2 ε_abc`, same displayed 48-label CAR / Spin(9) gamma, 16 charges, inverse bosonic gauge pullback `V_h Ψ(O_h^{-1}x)`, and same `1/16` form. This is an **external manuscript claim, not an original-source equivalence theorem**. The original source's `pairedAlgebraData` concrete color and `pairedGaugeData` exact representation action must be bound.
- Bajaj–Lin November 10 paper §2.1 also uses `Q_α=Tr(P_I γ^I ψ) -(i/2)Tr([X^I,X^J]γ^{IJ}ψ)` with `{Qα,Qβ}=2δαβH+gauge`; its quartic potential is `Σ_{a<b}s_a²s_b²`. Frozen monograph Chapter 10, `ch10_energy.tex` blob `2fa9d0a89a7e6eb47afbe41fe13d977b86761cb8`, source-normalized Pauli `V_wedge=Σ||X^a ∧X^b||²`, and source exact core kinetic `(1/2)Σ||∂f||²` are compatible in form, but the Pauli potential-binding and fermion-field orientation cannot be inferred from appearances.

A falsifiable source dictionary test must compare the **same three independent coefficients** (kinetic, quartic, fermionic) and actual color/gamma normalization. A match in the kinetic coefficient alone, or `M5BE0` self-adjointness, is NOT a physical source-unit identification. The mass-squared map can be defined conditionally after this crosswalk; defining a scalar multiple without proving the physical dictionary would be merely a re-labeling.

## 5. Directly relevant new spectral route — protected types, not global gap

OpenAI October 5, 2026 positive-eigenvalue **preprint** asserts existence of infinitely many positive normalizable eigenstates in the **relative SU(2)** model by constructing source-gauge-invariant high-Spin(9) sectors with compact resolvent. Its gauge-invariant polynomial witness (lines ~739–802) is built from complexified pairs `w1=e1+i e2, w2=e3+i e4`, minors `ζ_aη_b−ζ_bη_a` and `P(x)=Σ_{a<b}(ζ_aη_b−ζ_bη_a)²`; powers raise the second Spin(9) weight. The proof requires the genuine compatible closed physical Spin(9) action, sector reducing property, fermionic linear-growth bound, and transverse oscillator exclusion. The 2026 catalogue lists **no released Lean formalization or expert review** for these manuscripts: https://ameskandari.github.io/ai4math/family/270/. Treat them as research blueprints, not previous formal acceptance.

Bajaj–Lin November 10 §4 identifies a **second potentially economical route** for SU(2): positive-energy total SO(9) singlets in SUSY supermultiplets `44⊕84⊕128` with superspin label `R=84` or `R=128` are excluded from the asymptotic two-D0 scattering channel, whereas `R=44` can occur. Their example candidate `Tr(X^I X^J X^K ψ_α ψ_β) γ^{IJK}_{αβ} |Ω⟩` relies on the genuine normalizable zero-energy state `|Ω⟩` and its `r^{-9}` tail to show a finite norm (`∫r^8 r^6 r^{-18}dr<∞`). They report numerical positive states, e.g. lowest SO(9)-singlet positive bound level `E≈6.533789` in **their** dimensionless source normalization, with finite-grid/systematic uncertainty. This is *not* an accepted energy in our Lean source, and a numerical finite-box state is not an exact Hilbert eigenstate. The analytical sector exclusion and nonzero-witness construction are new avenues to investigate *after* exact source gauge/Spin9 and zero-state prerequisites are established.

Critically, these preprints do not imply a positive **global** spectral gap. The foundational de Wit–Lüscher–Nicolai continuous-spectrum theorem (1989) and later analysis treat the supersymmetric matrix spectrum extending from zero. Continuous spectrum and **embedded, symmetry-protected positive point spectrum** can coexist. Claiming any `[0,∞)` result for our *exact* imported normalized closed operator still requires the corresponding source-equivalence theorem or an independent source-specific proof.

## 6. Registered research questions, controls and stop conditions

**LF-DICT-0 (read-only source audit, next):** Recover `pairedAlgebraData` trace/commutator `√2 ε` and `pairedGaugeData` original complete inverse-pullback/fermionic lift as source declarations. Check against openai/math manuscript and Bajaj–Lin §2.1, not merely formula typography. *Falsifier:* any irreconcilable gamma, CAR, color, or gauge sign/factor/normalization mismatch.

**LF-DICT-1 (conditional source operator crosswalk):** Compare the exact source supercharge and `H_phys` to the paper's `H_BL` under an explicitly typed, physical-subspace-preserving unitary; require true natural-domain and form/operator equality. *Falsifier:* mismatched kinetic/quartic/fermionic coefficients or nonmatching closure/domain. Preserve any mismatch instead of adjusting `1/16` by convention.

**LF-DICT-2 (physical kinematics, separate):** Reintroduce the omitted free center-of-mass factor only as an explicitly specified larger model, its transverse momentum generator, `p^+=N/R_-`, `H_HM=(R_-/L²)H_BL`, and derive the conditional mass-squared relation. *Falsifier:* failure of coordinate normalization or p− as an operator generator; avoid Lorentz/11D “proved” language from a finite-N relative source alone.

**SPECTRAL-ALT-2026:** Contrast the existing high-second-weight Spin(9) reducing-sector route with the new `R=84/128` no-scattering route. The latter needs a true zero-energy physical normalizable state with enough decay to apply an unbounded polynomial and then establish sector/point-spectrum mechanisms. OpenAI math and Bajaj–Lin are **EXTERNAL** until independently transferred, source-matched and qualified. No upstream code/source import or gate promotion is authorized by this note.

**Stop rules:** Keep active BF0 strict #43498649514 untouched; do not change the Hamiltonian, ancestor proofs, checkers or workflow to pursue interpretation. No physical source-scale theorem, invariant mass value, normalizable zero-energy state, positive eigenstate or mass gap has been added to the accepted theorem corpus. Next operational source chain remains BF0→BG→BH unless a separate explicit research-priority decision changes it.

## References (source provenance)
- Pinned original source: [Core.lean](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/lean/OAI/MathematicalPhysics/BFSS/Core.lean) and [accepted BE0 source](https://github.com/etblink/math/blob/integration/bfss-unified-research-20261108/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean).
- Frozen monograph: Chapter 1 `bc9a99858621a665982e81097c31f4773227473a`, Chapter 6 `554a74dcd3b397efd569cdad5a506d44364e15ed`, Chapter 10 `2fa9d0a89a7e6eb47afbe41fe13d977b86761cb8` at monograph pin `b603f4c1715e15f5f92c69d7fb071992dbaa9f40`.
- [Tropper–Wang, JHEP 07 (2023) 150](https://doi.org/10.1007/JHEP07(2023)150), §2.1.
- [Taylor, Rev. Mod. Phys. 73, 419 (2001)](https://doi.org/10.1103/RevModPhys.73.419), §§III.B–D.
- [Bajaj–Lin, arXiv:2611.14512v1, November 10, 2026](https://arxiv.org/abs/2611.14512), §2.1, §3.2, §4, Appendix C.
- [OpenAI positive-eigenvalue manuscript, October 5, 2026](https://github.com/openai/math/tree/main/preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026).
- [de Wit–Lüscher–Nicolai 1989](https://doi.org/10.1016/0550-3213(89)90214-9), continuous-spectrum source theorem.
