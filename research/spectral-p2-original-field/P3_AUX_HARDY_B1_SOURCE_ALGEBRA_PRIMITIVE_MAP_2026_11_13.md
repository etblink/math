# P3-AUX Hardy B.1 — independent source algebra primitives and symmetry stop line

**Date:** November 13, 2026 Pacific. **Classification:** SOURCE REVIEW / FALSIFIABLE FORWARD DESIGN ONLY. **Concurrent D2R2:** [#43562804737](https://github.com/etblink/math/actions/runs/43562804737), exact tested `8de590a9eb5fa7d7d244a68017f3d98b388e1e20`, remains a separate frozen diagnostic; this note does not test or qualify it.

## Question

Can the 2026 Michel–Scheinpflug–Yin SU(2) BFSS auxiliary Hardy argument be divided into **original-carrier algebraic lemmas that do not depend on an already built Fock-vector Spin(9) group representation**, and later **physical spinor-sector assertions that do**? This matters because TD-C1A native full 48-Majorana gauge covariance is currently RED, and repeatedly attempting the whole spinor Hardy proof without independently proving its prerequisites would recreate that failure mode.

**Primary paper:** Michel, Scheinpflug and Yin, *99.9...% of the SU(2) BFSS ground state*, arXiv:2611.09837v1, Appendix B (B.1)–(B.11), PDF https://borowiecki.dev/pdf/2611.09837, particularly pages 12–13. Mathematical content is external analytical evidence, NOT accepted Lean verification.

## 1. What the paper actually assumes and proves

On the gauge-physical Hilbert space, paper supercharges `Qα` are a `Spin(9)` spinor and the original `H` commutes with rotation and satisfies `Qα²=H`. The spinor-isotypic sector `HS` is a sum of copies of the 16-dimensional irreducible spinor representation. The Hardy premise and conclusion are

```text
⟨η,Hη⟩ ≥ κ⁻¹ ‖R⁻¹η‖² on HS, 
κ = (36+8√14)/25.
```

The paper's fidelity theorem assumes a normalized *physical Spin(9) singlet* ψ, uses that `Qα ψ` lies in HS, and obtains

```text
F = ‖P_ker(H) ψ‖² ≥ max(0,1−κ q_aux(ψ)),
q_aux = (1/16) ∑α ‖R Qα ψ‖².
```

The **continuum of H may reach zero**; the gap `κ⁻¹=(9−2√14)/4` is only the auxiliary form in the singlet sector, not a global BFSS mass gap.

**Two independent epsilon parameters:** the paper uses `(H+t)⁻¹` with `t>0` in the spectral-theorem argument. Earlier source radial `w_ε=sqrt(R²+ε²)` is a different regularizer. Do not conflate them or use the paper's resolvent argument to identify the closure of `R Q`.

## 2. Promising group-independent original-source algebra

Appendix B defines, for each original spatial plane `i<j`, coefficients

```text
Y_{a}^{ij} = (X_{ai} Γ_j−X_{aj}Γ_i)/16
             +(1/56)∑_{k≠i,j} X_{ak}Γ_k Γ_i Γ_j,
τ_α^{ij}=∑_{a,β} (Y_a^{ij})_{αβ} θ^a_β,
```

and proves the **on-core operator identity** `∑α {Qα, τ_α^{ij}}=J_ij` (B.6). This is a candidate for source-exact formalization using the ACTUAL `Core.charge` and original 48 Majoranas on `SmoothCore 2`, and the explicit combined infinitesimal rotation generator (bosonic angular derivative plus fermion bilinear). The identity can be investigated on a source smooth core before any global group implementation, without claiming self-adjoint generator closures or `Spin(9)` covariance.

The proof splits naturally into:
- **B.7 derivative/gamma contraction:** `tr(Γ_k Y_a^{ij})=X_ai δ_jk−X_aj δ_ik` and `∑_k Γ_k (∂_k Y_a^{ij})=(2/16+7/56)Γ_iΓ_j=(1/4)Γ_iΓ_j`. Finite `Fin 9` and `Fin 16` identities, source `coordinateDerivative`, `position` and `gamma_clifford`; no physical sector required. First preflight donor should be a generic finite gamma algebra, not full Fock operator.
- **Trace cancellations:** the fermionic-potential contribution uses traces of 3 or 5 distinct original gamma factors after reducing repeated pairs. For odd words of length 3 or 5, choose an unused one of the nine gamma indices; conjugating the word by that gamma reverses sign, so cyclic trace vanishes. Avoid private signed-permutation tables.
- **CAR compression:** use exact source `theta_CAR`, not an invented `{θ,θ}=2δ`; the paper and source both use `{θ,θ}=δ`. Prove the derivative-fermion and potential-fermion pieces separately on exact `SmoothCore 2`.
- **Nonnegative coefficient identities B.8:** the paper obtains `∑τ_α²=(61R²−45∑_a X_a9²)/1568` and `∑Ξ_α²=8R²`, with `Ξ_α=∑_{a,k}X_ak (∑β Γ_k αβ θ_β^a)`. First prove these at each original Boson 2 coordinate as finite Fock operator identities; do not integrate until the pointwise source roots qualify.

## 3. Reuse that already exists in exact source, without inventing another Clifford library

1. `lean/OAI/MathematicalPhysics/BFSS/GammaIdentity.lean`, source blob `45e58da900a7691b88e5760a483b8adff1c7f015`, contains **generic** `OAI.BFSSGamma.trace_word` at finite Clifford-word cardinality ≤4 and the generic `trace_word_gamma`; `GammaIdentity.lean` also has `spinIdentity` based on trace words. These may supply B.7 1-, 2-, 3-gamma trace reductions; verify their exact hypotheses and root provenance before importing. They are not direct B.6 or B.8 theorems.
2. `SU2BFSSPairedSpin9V10HF10EPublicGammaTraceZeroProbe.lean`, source blob `3922916e49fc961efa99a72d706ca83ca704e3d6`, defines public source-nine-gamma square, anticommutator and trace-zero proofs without private tables. They are candidate donor *interfaces* for odd-word trace cancellation.
3. `SU2BFSSPairedSpin9V10HF10AEOriginalGammaFourWordTraceZeroProbe.lean`, source blob `0c38739f0ddf712f53bfa34ef692bbf58728a75a`, provides a four-word trace-zero pattern using cyclicity and three anticommutations. The **argument pattern**, not its same-length statement, suggests a five-word trace extension with an unused index.
4. `SU2BFSSPairedSpin9V10HF10ABOriginalGammaPairTraceOrthogonalityProbe.lean`, source blob `f30d1130636a6001be7e143357e90c9e8c552248`, has gamma pair self-square and shared-index cross-trace results.
5. Actual `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` already provides `AlgebraData.theta_CAR`, `coordinateDerivative`, `fermionAction`, `position`, `charge`, `fermionAction_derivative_commute`, `position_commute`, and kinetic/potential core symmetry. These are the REAL original-carrier semantic anchors.

Some of these donor files contain historical prospective comments. **Presence in source does not establish their standalone historical/current strict acceptance**. Gate-level source/consumer pin auditing is mandatory before reuse.

## 4. The exact stop line: where full physical Spin9 is required

From B.6–B.8, the paper chooses a **highest-weight spinor** with four planar rotations `J12+J34+J56+J78` eigenvalue 2. It then uses

```text
16 ⊗ 16 = 1 ⊕ 9 ⊕ 36 ⊕ 84 ⊕ 126
```

and the absence of the 44-dimensional symmetric-traceless representation to replace an anisotropic `X_a9²/R⁴` expectation by `(1/9)‖R⁻¹η‖²`. This step is **representation-theoretic and sector-specific**; it is not an unrestricted operator identity and cannot be deduced from the scalar radial source or `GammaIdentity` alone. It needs a genuine source physical `Spin(9)` action on vector wavefunctions, covariance of `Q`, sector decomposition, and radial-resolvent domain controls. The original TD-C1B and source S1H remain potentially relevant.

The final paper inequality uses Cauchy–Schwarz and the exact numerical constant. A generic nonnegative-real inequality can be preproved independently once the coefficients are correctly sourced, but this alone is not the physical Hardy lemma.

## 5. Proposed **small** scientific-method gates (not staged)

**B1-A — finite source gamma contraction.** Preregister `Fin 9` by `Fin 16` coefficient identities B.7 with negative control on swapped i,j sign and positive control on a basis coordinate. No `SmoothCore` or Fock import initially. Require named root and independent consumer.

**B1-B — odd-word gamma trace.** Use public source gamma and only Clifford relations to establish trace vanishing for original words of 3 or 5 **distinct** indices; handle repeated indices by explicit gamma-square reduction, and test an omitted ninth source index. No gamma table copying and no claim of all Clifford representation isomorphisms.

**B1-C — source 48-Majorana CAR compression.** Separately establish tau/Ξ coefficient norms (paper B.8) on the exact original Fock carrier `Fermion 2`, with source gamma and theta CAR. Require a typed finite-index sum and an independent consumer; avoid full huge expression unfolding.

**B1-D — original smooth-core plane rotation anticommutator.** Combine B1-A/B/C with source `charge` to prove `∑α {Qα,τ_α^{ij}}=J_ij` on actual `SmoothCore 2`, with separate derivative/potential witnesses and an exact two-sided source basis consumer. This is not a statement about unbounded self-adjoint generators.

**B1-E — physical Spin9/Hardy sector (held).** Only after genuine physical Spin9 representation and same-domain charge/singlet framework qualify, prove the 44-absence expectation, Hardy `‖R⁻¹η‖²` estimate, and the auxiliary fidelity/gap theorem with resolvent/spectral calculus. Do not treat B1-A–D as proving B1-E.

## 6. Methodological lessons

- There is now a second top-down **algebra-before-sector** path that can progress alongside TD-C1A without depending on its repeated native `exact` failure.
- The output is not a substitute BFSS model. All `Boson 2`, `Fermion 2`, `FullL2 2`, `SmoothCore 2` source types and 16 native charges remain literal.
- Confirm accepted donors by exact source blob and independent strict roots before implementation. Do not interpret the paper's rigorous analytical proof as completed Lean verification.
- Preserve the dimension limit of the original BFSS model's **nine spatial labels**, not an invented higher-dimensional spin theory.
- Keep domain/core statements, representation statements, form closeness and actual spectral claims in separate gate stages.
- No source/consumer/workflow change or CI trial made here; TD-C1A stays `RED_UNQUALIFIED` and M5BF0/G0B2 retain accepted status.

## References

- Michel–Scheinpflug–Yin, [arXiv:2611.09837v1](https://arxiv.org/abs/2611.09837), §II, Appendix B equations B.5–B.11.
- Source prior weighted form crosswalk [P3_AUX_R2_WEIGHTED_SUPERCHARGE_2026_PAPER_CROSSWALK_2026_11_13.md](P3_AUX_R2_WEIGHTED_SUPERCHARGE_2026_PAPER_CROSSWALK_2026_11_13.md).
- Pinned source files listed above in `etblink/math` integrated history.
