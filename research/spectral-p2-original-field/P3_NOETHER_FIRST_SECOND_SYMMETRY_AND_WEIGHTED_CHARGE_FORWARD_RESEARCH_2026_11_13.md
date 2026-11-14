# BFSS Noether I/II — symmetry constraints, conservation, and weighted supercharge forward research

**Date:** November 13, 2026 (Pacific). **Classification:** SOURCE-FAITHFUL RESEARCH ONLY; all new mathematical bridge statements UNQUALIFIED. **Project Lead:** BFSS. **Branch:** `integration/bfss-unified-research-20261108`. This memorandum does not edit Lean theorems, workflow, experiment/gate JSON, original Hamiltonian or main.

## Scientific question and falsifiable hypothesis

Can Noether's first and second theorems expose a reusable symmetry-preserving structure that shortens the auxiliary BFSS ground-state investigation without conflating gauge invariance, Spin(9) covariance, conserved supercharges, and spectral evidence?

**Hypothesis:** the original exact SU(2) Gauss constraint and the bounded radial reciprocal operator provide a source-native Ward/constraint compatibility path; on original compactly supported smooth-core vectors the *supersymmetry defect* of reciprocal multiplication is an explicitly bounded radial gradient-times-Clifford field; a separate (not yet qualified) Spin(9) charge-column covariance would make the original normalized sixteen-charge form invariant, enabling singlet-sector spectral strategies.

**Falsifiers:** mismatch with original `charge` kinetic coefficient; failure of compact-support/Leibniz derivative on source `SmoothCore`; missing source true spin representation or unitarity/strong continuity; domain failure when passing core identities to closed operators; inability to identify source and external paper's physical conventions.

## 1. Noether first theorem vs second theorem

Noether I concerns continuous **global variational** symmetries and on-shell conserved charges. Time translations correspond to energy; spatial SO(9) rotations correspond to angular generators; supersymmetry is a graded fermionic symmetry whose Noether charges are supercharges. Noether II concerns **local-in-time** gauge transformations and off-shell Noether identities/first-class constraints. In BFSS the matrix gauge potential's time-dependent SU(2) redundancy produces the Gauss constraint. After canonical quantization/source gauge formulation, physical SU(2) singlets satisfy the gauge fixed-space condition; the corresponding Gauss generator annihilates appropriate physical-core vectors. The Gauss generator is not a new independent observable charge labeling physical states.

Precise caution: the relative SU(2) BFSS model is a 0+1-dimensional supersymmetric matrix quantum mechanics with nine adjoint bosonic matrices (27 real configuration coordinates), NOT Maxwell's 3+1 divergence theory and NOT 27 space dimensions. Relative SU(2) removes free center-of-mass U(1); no standalone full-model translational momentum/Poincare generator is qualified by relative-source theorems.

Sources:
- Original BFSS model: https://arxiv.org/abs/hep-th/9610043
- Noether I/II and Hamiltonian gauge constraints: https://www.ipcms.fr/wp-content/uploads/2023/10/Noether_theorem_field.pdf
- Noether/gauge distinction: https://plato.stanford.edu/entries/gauge-theories/index.html
- Quantum Noether theorem for strongly continuous unitary symmetries, including generator domains: https://web.math.ku.dk/noter/filer/mathphys2014.pdf

## 2. Exact original source evidence; no new qualifications claimed

- `lean/OAI/MathematicalPhysics/BFSS/Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, defines `Boson N`, `Fermion N`, `FullL2 N`, `SmoothCore N`, original sixteen `M.charge α` (lines ~93–100), and nonnegative `M.coreForm=(1/16) Σα‖Qα f‖²`. The kinetic summand is **exactly** `(-Complex.I * gamma_iαβ) • (fermionAction β A ∘ coordinateDerivative i A)`; the potential summand contains position products with fermion operators and thus commutes with scalar multiplication by a bosonic field on the core.
- `lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean`, blob `e4990dadf1d8bde849e351467282ab3f14989c3b`, defines the actual source `GaugeData.bosonPullback`, `GaugeData.fiberAction` and `physicalSpace = ⨅_g ker(bosonPullback g − fiberAction g)`. This is an exact original group-invariant subspace, not by itself a self-adjoint unbounded Gauss generator.
- `OperatorDependencies/SU2BFSSPhysicalDomainL6G7TOriginalFullColorLieGaussIdentityProbe.lean`, blob `dca9ab9edb0019189e275ee025d083eed5cc3f3c`, contains `actualInvariantCore_fullColorLieGauss_zero` for all original color Lie vectors on the exact SU(2) invariant smooth core. This is an existing source declaration; independent strict qualification was NOT newly checked in this Noether review.
- `OperatorDependencies/SU2BFSSPhysicalDomainD3BFullChargeGaugePreservationProbe.lean`, blob `532648ee147e218aba4e69ae2f79dd7da63cd9a8`, contains `sourceOriginalCoreCharge_mem_invariantCore`: original charge Qα carries the actual invariant smooth core into itself; check accepted historical strict receipt separately before promoting the source root.
- `P3M5BE0OriginalNativeHamiltonianPort.lean` and `P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean` already have accepted strict results, including original physical self-adjoint `H_phys=(1/16)T†T` and a nonzero state in its natural domain. M5BF0 [strict #43498649514](https://github.com/etblink/math/actions/runs/43498649514) does NOT supply a positive gap, eigenpair, ground state, or the full graded superalgebra. The fact that self-adjoint H generates a unitary flow provides energy conservation on the appropriate H domain as standard spectral-theoretic interpretation; an explicit formal time-evolution conservation lemma has NOT been qualified.
- `lean/OAI/MathematicalPhysics/BFSS/SpinPlaneCovariance.lean`, blob `c262821f5532953048c9b2f3ecfbc04fa3b73f43`, provides source Cl(9) gamma-plane commutator identities but explicitly excludes a full strongly continuous Spin(9) Fock-vector action and invariance of the closed physical Hamiltonian.
- Existing `P3_GAUGE_PROJECTION_SPIN_FIXED_ALGEBRAIC_SHORTCUT_2026_11_12.md`: the Spin(9) star-algebra automorphism on source Fock **operators** is not equivalent to a qualified joint-continuous physical Fock-**vector** implementer. Never jump from an operator automorphism to a unitary action on all L² states.

## 3. Accepted radial/gauge crosswalk as of this memo

- R0A [strict GREEN #43510200014](https://github.com/etblink/math/actions/runs/43510200014): original weight `wε(X)=sqrt(‖X‖²+ε²)`.
- R0B1 [strict GREEN #43516234402](https://github.com/etblink/math/actions/runs/43516234402): true native complex reciprocal L∞ `bε=1/wε`.
- R0B2A [strict GREEN #43521745235](https://github.com/etblink/math/actions/runs/43521745235): genuine original `Bε : FullL2 2 →L[ℂ] FullL2 2`.
- G0A [strict GREEN #43521457638](https://github.com/etblink/math/actions/runs/43521457638): true source radial field and L∞ AE representative bosonic gauge invariance.
- G0B0 [strict GREEN #43523896876](https://github.com/etblink/math/actions/runs/43523896876): exact `Bε f = bε f` a.e. on original Fock-valued L².
- G0B1 R2 [strict GREEN #43527998761](https://github.com/etblink/math/actions/runs/43527998761): `Bε` commutes with **original bosonPullback g**. R1 red `#43526064993` remains preserved as proof-interface negative knowledge.
- G0B2 R2 [strict #43530462404](https://github.com/etblink/math/actions/runs/43530462404): **PENDING / UNQUALIFIED at last tracked checkpoint**, tests fermion `fiberAction g` commutation. R1 `#43530051259` RED was a comment-token preflight false positive; no mathematical source Lean evaluation in R1. Do not count G0B2 as accepted without exact finished verification.

## 4. The non-obvious Noether/supersymmetry defect: [Qα,Bε] is generally NONZERO

On the original smooth compactly supported core, `Core.lean` has both scalar smooth multipliers `M.smoothMultiplier` and derivative `M.coordinateDerivative`. Since bε is smooth for ε>0 and complex-scalar, all **potential** multiplication/fermion terms commute with M_bε; only kinetic derivatives contribute.

Using source `Qα = Σ_{i,A,β} [(-i γ_iαβ) θ_βA ∂_{iA}] + Vα(X)`, the formal test-function product rule gives

`[Qα,M_bε] f = -i Σ_{i,A,β} γ_iαβ θ_βA (∂_{iA} bε) f`

`= +i Σ_{i,A,β} γ_iαβ θ_βA X_iA / (‖X‖²+ε²)^(3/2) f`.

The signs and factors shown agree with the actual original kinetic coefficient (`-Complex.I`) and scalar reciprocal derivative. They are prospective until a literal source theorem is compiled. No `[Qα,Bε]=0` assertion is permitted; radial gauge invariance does **not** imply supersymmetry preservation. The expression is a finite-dimensional Clifford/Fock endomorphism-valued multiplication field.

Sharp **scalar gradient** estimate: for ε>0, `‖∇bε(X)‖ = ‖X‖/(‖X‖²+ε²)^(3/2) ≤ 2/(3√3 ε²)`. A bound for the full Fock commutator additionally requires the **source gamma and theta operator norm** constants and a properly typed transfer from `SmoothCore` to original FullL2. Do not confuse the scalar bound with a proven full operator norm constant.

**Potential payoff:** this defect is bounded for fixed ε and may supply a controlled commutator/core-domain estimate useful for moving radial weights through original supercharges, proving weighted domain invariance or identifying the correct extra terms in quadratic-form calculations. Never identify a formal `Q B` product with a closed full-L² operator before graph/domains and core approximations are established. The ε→0 regularization limit can blow up as ε^-2 and is an independent analysis problem.

## 5. Spin(9) and symmetry-covariant charge columns; correct Noether target

The 16 original supercharges transform **as a spinor column**, not sixteen independent scalar operators. A hypothetical exact source Fock-vector Spin(9) unitary `U_R` and spinor matrix `S(R)` should satisfy (with the correctly determined inverse conventions)

`U_R Qα U_R^{-1} = Σβ S(R)_{αβ} Qβ`

on a common invariant source smooth core. Then unitarity of S(R) preserves the finite sum of norms and proves rotational invariance of the **source quadratic form** `q_core(f)= (1/16) Σα‖Qα f‖²`. This strategy may avoid 16 separate false commutation targets. To lift to the normalized self-adjoint `H_phys`, require a physical gauge-compatible Fock-vector implementer, domain invariance, closability/form closure equality and eventual strong group covariance; do not infer these from gamma-plane identities or an operator star automorphism.

Spin(9) invariance of bε as a scalar follows mathematically from the norm-preserving spatial rotation on Boson2; it is NOT an accepted theorem that the entire original physical Fock+Spin9 group representation exists and preserves E. Source gauge SU(2) singlet does NOT imply Spin9 singlet.

## 6. Noether II -> Ward constraints: a later bounded-operator corollary

When G0B2 strict GREEN independently qualifies the **fiberAction** commutator, combine it with accepted G0B1 bosonPullback commutation to show Bε maps each source kernel `ker(bosonPullback(g) − fiberAction(g))` to itself, hence preserves the literal intersection `pairedGaugeData.physicalSpace`. This is the smallest exact group-level 'Ward compatibility' theorem. It is NOT yet an infinitesimal `[Gauss_a,Bε]=0` theorem: the latter requires the unbounded infinitesimal Gauss generator domain and differentiation of the correct group action.

Once physical preservation is qualified, an optional bounded self-adjoint positivity result may show E is reducing and establish commutation with the genuine physical Haar projector; alternatively prove direct commutation of a bounded Bε with Bochner averaging under strong measurability. Even then, `[H_phys,Bε]=0` does not follow and is generally not expected, because Bε does not commute with Q.

## 7. Priority ordering, falsifiable gates and stop rules

1. **Immediate (don't interrupt live CI):** finish and classify G0B2 R2; if GREEN, independently qualify G0B3 physicalSpace kernel-intersection preservation. Preserve all red receipts and physical M5BF0 unchanged.
2. **Near-term new Noether gate N0A (research design only):** source `SmoothCore` multiplier Leibniz commutator with actual M.charge, including the exact -i coefficient and potential cancellation; separately derive finite Clifford field norm estimate with a real explicit source constant, and transfer to bounded FullL2 only with a rigorous AE/core bridge.
3. **Intermediate N0B (research only):** full original SU(2) Noether II versus exact G0B3 physical fixed space: locate/qualify true Lie generator and Ward identities on the invariant core; maintain domain distinctions and do not infer constraints on general L².
4. **Intermediate/long-term N0C (research only):** Spin9 Fock-vector unitary and source 16-charge *covariance*, then invariance of physical quadratic form and its closed realization. Use older gamma-plane source and Fock star automorphism without treating either as a full implementer.
5. **Auxiliary physical goal:** combine these with source-frozen output `PiLp 2 (SpinIndex → FullL2 2)`, reciprocal injectivity and graph comap, density of weighted original invariant smooth core, source-to-paper normalization, and only then the external Spin(9) Hardy/fidelity argument.

**Noether's theorem does not supply by itself:** a BFSS ground state, positive physical mass gap, closed weighted supercharge, quantum anomaly freedom, numerical energy, spacetime symmetry enhancement, original source equivalence to external papers, or an eleven-dimensional Poincare action. All previously accepted negative knowledge remains an asset.

## 8. External auxiliary context

Michel, Scheinpflug and Yin, [99.9...% of the SU(2) BFSS ground state](https://arxiv.org/abs/2611.09837), posted November 6, 2026, exploit gauge-invariant Spin(9) singlets and an auxiliary supercharge-weighted Hamiltonian for a *sector-restricted* spectral estimate even though the original Hamiltonian has continuum to zero. Noether provides a route to check the **symmetry compatibility** of our source implementation, not their nontrivial Hardy estimate or complete state. Their exact normalized Gamma/Fock and closed domain equivalence to ours remains unproved.

Cross references: [Gauss–Maxwell research](P3_GAUSS_MAXWELL_BFSS_FORWARD_RESEARCH_2026_11_13.md), [original auxiliary contract](P3_AUXILIARY_RADIAL_CHARGE_RESEARCH_CONTRACT_2026_11_13.md), [Spin-fixed algebraic shortcut](P3_GAUGE_PROJECTION_SPIN_FIXED_ALGEBRAIC_SHORTCUT_2026_11_12.md).
