# P3-AUX R2 — weighted source charge versus Michel–Scheinpflug–Yin auxiliary Hamiltonian

**Date:** 2026-11-13 Pacific. **Classification:** source-bound forward mathematical research with external literature comparison; **NOT NEW LEAN PROOF QUALIFICATION**. **Repository:** `etblink/math`, unified `integration/bfss-unified-research-20261108`. **Concurrent diagnostic:** D2R2 [#43562804737](https://github.com/etblink/math/actions/runs/43562804737) tests exact `8de590a9eb5fa7d7d244a68017f3d98b388e1e20`; no tested source/workflow/manifest alteration or additional strict run arises from this memo.

## 1. Significant source-matched observation

The November 6, 2026 paper **Alexander Michel, Jaroslav Scheinpflug, Xi Yin**, *99.9...% of the SU(2) BFSS ground state*, [arXiv:2611.09837v1](https://arxiv.org/abs/2611.09837) §III.B (20) and Appendix B defines the auxiliary quadratic expression

```text
H_aux = (1/16) ∑_{α=1}^{16} Q_α R² Q_α,
⟨ψ,H_aux ψ⟩ = (1/16) ∑_α ‖R Q_α ψ‖²  (normalized ψ),
R² = tr(XXᵀ) = ∑_{a=1}^3∑_{i=1}^9 X_ai².
```

Our previously source-reviewed exact original **physical** sixteen-column charge and proposed radial multiplier give the **same mathematical weighted-output pattern**, independent of the stalled TD-C1A gamma covariance. The source source-graph formulation is

```text
E = pairedGaugeData.physicalSpace ⊂ FullL2 2,
K = PiLp 2 (fun _ : SpinIndex => FullL2 2),
T = originalMinimalPhysicalHilbertChargeColumn
      pairedAlgebraData pairedGaugeData : E →ₗ.[ℂ] K,
q_H(u) = (1/16) ‖T u‖²  on D(T),
r(X) = ‖X‖_{Boson 2},
w_ε(X) = sqrt(r(X)²+ε²),
S_ε u = w_ε · (T u), if the actual weighted output lies in K,
q_ε(u) = (1/16) ‖S_ε u‖².
```

The first three items exist as original source declarations with previously accepted exact historical/current chains; `S_ε` and `q_ε` are prospective source-identification targets. Original AY `originalMinimalHilbertOutputEquiv` preserves the exact K carrier; it does not substitute Fock-vector model or sixteen physical Hilbert input copies.

## 2. The radial normalization is especially promising

- **External paper §II** uses `X_i=∑_a X_ai T_a` with `T_a=σ_a/√2` and `tr(T_a T_b)=δ_ab`; its `R²=∑ X_ai²`.
- **Pinned source Core** `lean/OAI/MathematicalPhysics/BFSS/Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, defines literal `Boson 2=EuclideanSpace ℝ (SpaceIndex×ColorIndex 2)` with 9×3 real coefficient entries. Its `AlgebraData.color_orthonormal` specifies `Matrix.trace(color A * color B)=δ_AB`.
- **Pinned concrete source** `SU2BFSSFullAlgebraDataProbe.lean`, blob `de8242615e4b2959e2dfa57cf0c6fdf43896acb7`, explicitly binds `color` to `FCP.BFSSSU2.normalizedPauli`.
- Thus `tr(∑ X_ai color_a · ∑ X_bi color_b)=∑_a X_ai²` as an exact finite algebraic calculation; summing i identifies the paper's *radial scalar* `R²` with `r²` **assuming** the paper and source coordinates are identified by their normalized Pauli coefficient labels. The source itself currently has no strict cross-publication identification theorem. Do not conflate the paper's valley singular value `r=x_1` in later sections with its *global radial* `R²=∑ X_ai²`.

This removes an apparent numerical prefactor risk from the **radial weight only**. It does NOT by itself establish the paper's `Q_α` equals the source `M.charge α` as closed operators: gamma matrices may be represented in different bases and the original 48-Majorana/Fock and physical gauge actions require exact unitary/conjugation identification, natural domains, and closures. Nonetheless paper §II (5) and Core (93–101) have the same displayed kinetic-plus-bilinear structure, both sixteen supercharges, `{θ,θ}=δ`, and a `1/16` charge sum. These are strong **testable** matches, not a qualification of operator equality.

## 3. An exact algebraic regulator identity on the common weighted-charge domain

The original R0A scalar source `originalRadialWeight_sq` (blob `a67f8740586588c6d4ee9c9148574c81c14d4937`) proves

```text
w_ε(X)² = r(X)² + ε².
```

For any genuine `u∈D(T)` with `r·Tu∈K`, using actual a.e. L² representatives and the **pinned** `PiLp.norm_sq_eq_of_L2` from Mathlib `d13f23b7`, the original sixteen-output Hilbert norm gives

```text
(1) D(q_ε) = D(q_0) = {u∈D(T) : r·Tu∈K},       ε≥0,
(2) q_ε(u) = q_0(u) + ε² q_H(u),                ε≥0,
(3) q_ε(u)-q_δ(u) = (ε²-δ²) q_H(u).
```

For sesquilinear cross terms, polarization yields the corresponding **Hermitian form** equality on the common domain; this is a form relation, not `H_ε=H_aux+ε²H` as an equality on self-adjoint *operator domains*. The common domain must be proved source-exact (or stated conditionally) before invoking the identity on the original BFSS `T`.

Since `q_H≥0`, `q_ε` is monotone **in ε²**. For ε>0, `q_ε(u)≥ε² q_H(u)`. For ε,δ>0:

```text
min(1, ε²/δ²) q_δ(u) ≤ q_ε(u) ≤ max(1, ε²/δ²) q_δ(u).
```

Thus if the positive-δ source weighted form is closed on the common domain, then every positive-ε weighted form is closed on that domain (equivalent graph/form norms). This is a shorter *conditional* route than rebuilding closedness at every ε, and it exposes the singular ε→0 limit. The same ratio also gives bounded invertible output multiplication `S_ε=M_{w_ε/w_δ}S_δ` once actual weighted source operators and a.e. semantics are available.

## 4. Kernel preservation needs no spectral gap

For ε>0, the pointwise weight `w_ε(X)≥ε` implies, directly on the common domain,

```text
ker(S_ε)=ker(T).
```

Indeed `S_ε u=0` implies `0=‖S_εu‖≥ε‖Tu‖`; conversely `Tu=0` implies `u∈D(S_ε)` and `S_εu=0`. For the **maximal unclosed zero-weight domain** `S_0=M_r T`, `r(X)>0` off the single configuration `X=0` (a measure-zero subset of `Boson 2≃ℝ²⁷`), so the same formal `ker(S_0)=ker(T)` follows at the original a.e. level.

If a positive-ε weighted operator is proven *closed and densely defined* on the original physical input E, then its nonnegative self-adjoint `H_ε=(1/16)S_ε†S_ε` has the same kernel as `H_phys=(1/16)T†T`, under the accepted original self-adjoint/graph input premises. **This equality is a mathematically important target, not a new compiled assertion.** For a separately constructed closure of `S_0`, one must re-prove its precise domain and kernel; equality on a pre-closure domain alone does not automatically determine the closure kernel.

This is a zero-mode preservation theorem, NOT evidence of a strictly positive spectral gap of `H_phys` or `H_ε`.

## 5. Literature connection: a singlet-sector gap for the auxiliary form is separate

The paper's Appendix B, Lemma B.1 and Theorem B.2, proves (in its own source conventions and claimed domain hypotheses) an inverse-radius Hardy-type estimate in the **Spin(9) spinor sector** and consequently a gap for `H_aux` **on the gauge-physical Spin(9)-singlet sector**, with

```text
κ = (36+8√14)/25,
κ⁻¹ = (9-2√14)/4,
F ≥ max(0, 1 − κ ⟨H_aux⟩_ψ)
```

for normalized singlet `ψ`. This is NOT a global positive gap of the original SU(2) BFSS Hamiltonian; its continuum reaches zero. It neither establishes ground-state uniqueness from a new Lean proof nor identifies the original charge's Hardy domain.

**Conditional transfer:** If paper/source unitary equivalence, exact weighted form identification, source Spin(9)-singlet subspace, and Hardy bound are independently proved, then `q_ε≥q_0` immediately extends the same lower bound on the orthogonal complement of the zero-mode space to all positive ε. The fidelity bound with `q_ε` in place of `q_0` would be valid but strictly weaker: `q_ε` is larger. The paper's kinematic gap is **not** supplied by the radial identity; it depends on the Spin9 spinor Hardy/Casimir argument and symmetry action.

Note: paper Appendix B regularizes the resolvent `(H+ε)⁻¹` when proving fidelity. That ε is NOT the radial weight regulator `w_ε` here. Keep these two independent regularizations explicitly disambiguated.

## 6. Kato monotone-form caution at ε↓0

The family of *closed* positive forms `q_ε` (if independently constructed) decreases when ε↓0, with common algebraic-domain limit `q_0`. A decreasing sequence of positive closed forms does **not generally** imply that `q_0` itself is closed. The appropriate monotone convergence theorem uses the **regular/relaxed part** of the limiting form and obtains strong-resolvent convergence to that associated operator, not automatically to the naive algebraic `(1/16)S_0†S_0`. Source: historical exposition of Kato monotone convergence (Theorem 10.13), Barry Simon, *Tosio Kato's work on non-relativistic quantum mechanics: part 1*, Bulletin of Mathematical Sciences 8 (2018), https://doi.org/10.1007/s13373-018-0118-0.

**Separate necessary tests**: closability of `rT` on a candidate dense physical core; closure/domain identification at ε=0; preserving the kernel of the limit; whether all positive-`ε` forms actually have the stated physical singlet reducing sector. No eigenvalue/resolvent convergence or new ground state claim follows from positive-ε form algebra.

## 7. Source-exact microgate roadmap, independent of TD-C1A

1. **RAD-C0 finite identity:** On true `Boson 2`, prove `R²=∑_{i,A}(coordinate i A X)²=‖X‖²` and the normalized-color trace identity using existing `color_orthonormal`. Source-bound, with explicit X=0 and one-coordinate nonzero controls. This is also the first falsifiable paper/source dictionary check.
2. **RAD-C1 output weight:** Construct the genuine coordinatewise `PiLp 2` positive-weight multiplication **as a partially defined unbounded multiplication map** `K→ₗ.[ℂ]K`, or via a closed graph. Use `PiLp.norm_sq_eq_of_L2` and a.e. semantics; do not call unbounded `w_ε` a continuous linear map. Keep the previously accepted bounded **reciprocal** `B_ε` separate.
3. **RAD-C2 reciprocal output lift:** Use source AY `originalMinimalHilbertOutputEquiv` and `ContinuousLinearMap.piMap` with exact coordinate equation; prove injectivity of `B16_ε` via original G0B0 a.e. nonzero multiplier. This supports the inverse-image graph of original `T`.
4. **RAD-C3 original physical graph:** Transport the original AY closed charge graph via injective bounded `B16_ε`; identify its inverse-image graph with the **maximal natural domain** of `S_ε`. Its physical *input* is E; its sixteen-*output* is ambient K.
5. **RAD-C4 parameter identity:** Prove form equations (1)–(3), conditional common kernel and positive-parameter closedness equivalence on the exact source graph, with original source/consumer and axiom audit.
6. **RAD-C5 external Hardy bridge:** After genuine original Spin(9) singlet and spinor action plus paper/source normalization and domains qualify, formalize the inverse-radius Hardy inequality and auxiliary-gap/fidelity theorem. TD-C1A/D2R2 and TD-C1B outcomes are relevant here but not prerequisites for RAD-C0–C4.
7. **RAD-C6 zero regulator:** Treat decreasing-form closure/regularization and possible `S_0` closability independently, without invoking a false generic theorem that the decreasing limit is automatically closed.

**Evidence/governance:** This memorandum adds no new Lean source declarations and does not claim that the Nov 6 paper's analytic statements have been verified in our original source. Strict formal qualification requires exact pinned source imports, separate source-shaped consumer and independent axioms/CI. Do not alter main or the concurrent D2R2 checked files. Preserve accepted M5BF0/G0B2 and existing TD-C1A RED_UNQUALIFIED exactly.

## Sources checked

- Michel–Scheinpflug–Yin (2026), arXiv:2611.09837v1, §II (1),(5), §III.B (20)–(22), Appendix B Lemma B.1/Theorem B.2; PDF cross-checked at https://borowiecki.dev/pdf/2611.09837.
- Original source Core/GaugeCore/AY/R0A/R0B1/R0B2A/G0B0/G0B1/G0B2 and strict acceptance receipts under `research/spectral-p2-original-field/`.
- Related earlier [radial-domain stability memo](P3_AUX_RADIAL_REGULATOR_DOMAIN_STABILITY_SOURCE_REVIEW_2026_11_13.md), including pinned `PiLp.norm_sq_eq_of_L2` and `ContinuousLinearMap.piMap` references.
- Barry Simon (2018), exposition of Kato positive quadratic-form monotone convergence, https://doi.org/10.1007/s13373-018-0118-0.
