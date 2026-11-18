# SM0 forward research: exact reuse inventory — Mathlib, BFSS Fock/Clifford, Spin(10) chiral representation

**2026-11-18. Independent truth-first research, read-only audit of existing source.** This is a comparative research result, **not a new theorem or claim that BFSS is correct**. Standard Model physics and its experimental constraints are core objectives now, independently of whether BFSS W0C2B2 E2 R2 succeeds. The governing [truth-first charter](../methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md) and [SM0 empirical requirements atlas](SM0_TRUTH_FIRST_EMPIRICAL_REQUIREMENTS_ATLAS_2026_11_18.md) control interpretation.

## Audited source versions and evidence standard

**Repository:** [`etblink/math`, `integration/bfss-unified-research-20261108`](https://github.com/etblink/math/tree/integration/bfss-unified-research-20261108), inspected at `55366aba0cdb21f5e1034c3002c775eb4c4eb686`. **Pinned Mathlib:** `leanprover-community/mathlib4` `d13f23b723b8a846827a245b89c10fc7d3f11612` (not unpinned current online docs). Lean 4.34.1. Original BFSS 27 accepted canonical anchors; E0/E1 are **separately qualified diagnostics**, E2 R1 original source compiled but independent consumer RED; E2 R2 repeated the 9,241-job source build but independent consumer failed **at Lean declaration syntax** (not a second analogous recursion). Both E2 attempts are **unqualified**. Original E2 R2 ZIP/log independently preserved at [#44386986165](https://github.com/etblink/math/actions/runs/44386986165) GREEN, archive SHA256 `2269072bb67c4e263c54afb8418d5c1c935c04ddf0d4a9e05620a7970dbfd39c`. No source or consumer changes during this audit.

Public physics benchmarks: [PDG Review of Particle Physics 2026](https://pdg.lbl.gov/2026/reviews/standard_model_and_related.html), [PDG 2026 programmatic data](https://pdg.lbl.gov/2026/api/index.html), [CERN Standard Model review](https://home.cern/science/physics/standard-model/). These remain the source of observational benchmarks; none of our Lean results are an observation. Spin(10) chiral 16 is standard representation-theoretic unification *possibility*, not experimentally established GUT physics: [PTEP 2024, CPT, Majorana Fermions, and Particle Physics Beyond the Standard Model](https://academic.oup.com/ptep/article/2024/8/08C101/7687822); [Geometry of Spin(10) symmetry breaking (2024)](https://doi.org/10.1063/5.0210073).

## Exact pinned Mathlib inventory: REUSE NOW without BFSS

| Source file at Mathlib `d13f23b7` | Verified existing declarations | Specific legitimate reuse | Open adapter / limitation |
|---|---|---|---|
| [`Mathlib/Algebra/Lie/Classical.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Lie/Classical.lean), blob `b5398a77` | `LieAlgebra.Orthogonal.so`, `mem_so`, `LieAlgebra.SpecialLinear.sl`, `sl_bracket`, `matrix_trace_commutator_zero` | Model source-compatible skew matrices and trace-zero matrices as **genuine Lie subalgebras**, not ad hoc `Aᵀ=-A` side conditions | `so(n)` is not (\mathfrak{su}(3)_C\oplus\mathfrak{su}(2)_L\oplus\mathfrak u(1)_Y); exact embeddings and reality forms need separate proofs |
| [`Mathlib/Algebra/Lie/SkewAdjoint.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Lie/SkewAdjoint.lean), blob `f59c7b1b` | `Matrix.lie_transpose`, `Matrix.isSkewAdjoint_bracket`, `skewAdjointMatricesLieSubalgebra`, equivalences | **Highest immediate BFSS E2/E3 reuse potential**: prove closure of skew matrices by already checked structure; enables small typed Lie interfaces without unfolding (K(A)) | Requires typed conversion from original `Source48Label` skew matrix. Does not itself prove BFSS Fock Lie action |
| [`Mathlib/Algebra/Lie/Matrix.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Lie/Matrix.lean), blob `600cc77f` | `lieEquivMatrix'`, `lieConj`, `reindexLieEquiv`, matrix Lie module/faithfulness | Matrix/endormorphism commutators; source-to-target representation maps, basis changes | A matrix Lie equivalence is **not** a physical identification across models |
| [`Mathlib/LinearAlgebra/Matrix/Trace.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/Matrix/Trace.lean), blob `a56896c8` | `Matrix.trace_mul_comm`, `trace_mul_cycle`, `traceLinearMap` | Separate scalar ambiguities, prove trace-invariance, make conventional Lie-algebra and representation checks | Not a replacement for original source-specific Fock `originalFockTrace` unless a typed trace compatibility is proved |
| [`Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean), blob `fbcf3620` | `CliffordAlgebra.ι`, `lift`, `hom_ext`, `adjoin_range_ι` | Reconstruct candidate fermionic representations from a **separately specified quadratic form**; test generator relations and universal lift | No automatically correct SM fermion multiplets, chirality or gauge couplings |
| [`Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean), blob `eb3939dd` | `CliffordAlgebra.even`, `even.lift` | Control even Clifford products / spin-related algebra as a reusable abstraction | Even Clifford algebra and positive-chirality spinor **are not identical objects**; require representation construction |
| [`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean), blob `f06d1130` | `pinGroup`, `lipschitzGroup`, spin group machinery and conjugation on Clifford generators | Test group-action versus Lie-algebra and central-sign subtleties on exact source | Does not automatically construct global Spin(10) chiral representations, let alone SM interactions |
| [`Mathlib/LinearAlgebra/ExteriorAlgebra/Basis.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/ExteriorAlgebra/Basis.lean), blob `dd57600e` | `Module.Basis.ExteriorAlgebra` indexed by `Finset` | **Promising independent SM math target:** exterior basis on `Fin 5`, parity split and exact 16-dimensional even/odd parts | Dimension theorem for chirality and Spin(10) action not already asserted by this audit |
| [`Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean), blob `28eb28e5` | `gradedAlgebra`, wedge grading by degree | Construct an explicit even/odd exterior parity decomposition rather than naming it | Passing a dimension count is insufficient for SM gauge branching or observed 4D chirality |
| [`Mathlib/Algebra/Lie/Character.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Lie/Character.lean), blob `230e525f` | `LieCharacter`, `lieCharacter_apply_lie` | Abstract one-dimensional charge characters and commutator-trivial maps | Hypercharge assignments/correct rational normalization require an explicit SM field ledger |

**Note:** Mathlib declarations were inspected at their actual pinned Git blobs, not merely inferred from documentation titles. The table identifies reuse **interfaces**, not completed applications.

## Existing exact BFSS results useful as *mathematical examples* (no unearned physical transport)

| Qualified original BFSS source (exact blob) | Reusable theorem / method | Honest boundary |
|---|---|---|
| `P3M4W0H1BOriginalAdjoinFullCliffordCommutantR2.lean` (`9139fba7`) | `originalSourceCentralizerPullback_eq_top`, `originalComplexEquiv_fullClifford_commutes`; use original `CliffordAlgebra.adjoin_range_ι` instead of expensive generator-by-generator induction | Source-specific 48-Majorana Clifford–Fock equivalence only; generalization requires a separate module and hypotheses |
| `P3M4W0B2BOriginalSchurScalarCommutant.lean` (`6d5fbe98`) | `originalFockClifford_scalar_operator_unique`; commutant of all 48 original gammas is exactly complex scalar operators | This relies on a source-specific simple module and its scalar endomorphism theorem; no inference of SM color or chirality |
| `P3M4W0C0OriginalFockScalarTraceSeparationR2.lean` (`96d3b63d`) | `originalFockTrace_scalar_one_eq_zero_iff`; trace annihilates a residual scalar ambiguity | Exact original complex Fock trace, not the four-dimensional quantum-field-theory trace or a gauge anomaly calculation |
| `P3M4W0C1OriginalCommutatorTraceWitnessR2.lean` (`5fafaa3d`) | `originalFockWitness_kernel_zero`; gamma commutation + zero Fock trace ⇒ zero operator | **Potential E3 high-leverage** route, but the actual Lie-defect commutation premise remains unproved |
| `P3M4W0C2B1OriginalFockJacobiCovarianceActionR2.lean` (`861628fe`) | `originalFock_commutator_jacobi`, `originalFock_commutator_covariance_bracket`; abstract action propagation without gamma expansion | Qualified on actual original Fock, yet not an SM gauge representation |
| `P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter.lean` (`c5841055`) | `originalSource48_complexify_commutator`, exact real/complex columns | Same source label; do not treat complexification as a replacement for 4D chirality |
| `ProbeW0C2B2E0OpaqueFockEqualActions.lean` (`46051f29`) | Conditional equal-commutator-actions => operator difference commutes | E0 qualified within bounded conditional scope |
| `ProbeW0C2B2E1OriginalSkewBracketGammaAction.lean` (`5663ee2d`) | Original skew-(K) bracket gamma action `originalSource48K_skew_bracket_complex_gamma_covariance` | E1 source+consumer independent strict GREEN; **not** original bracket identity |
| `ProbeW0C2B2E2OriginalTargetGammaAction.lean` (`7d372392`) | Original (K(AB-BA)) target gamma action source theorem **cold-compiled** | E2 R1 original consumer line 34 recursion with sorryAx; E2 R2 original consumer declaration syntax RED at lines 36/44: **do not call E2 qualified**; neither is a physical counterexample |

**Reuse route inside BFSS:** qualify separately the source action and target action, apply an **opaque typed equality-of-actions bridge**, then use all-gamma commutant and original trace to eliminate the scalar. This is a small theorem-interface architecture; the hard source-exact elaboration bridge is still open. A Mathlib `so`/skew-adjoint LieSubalgebra adapter may help name the source Lie object, but asserting that it bypasses the failed kernel comparison would be premature.

## Most promising independent Standard Model mathematical route

### SM-S0: five-mode exterior/CAR spinor test (research only)

A complex Fock/exterior model with five independent creation modes has vector space `ExteriorAlgebra ℂ (Fin 5 → ℂ)`. Its homogeneous parity sectors have familiar **combinatorial** dimensions:

[
\dim \Lambda^{\mathrm{even}} \mathbb C^5
=\binom50+\binom52+\binom54=1+10+5=16,
\quad
\dim \Lambda^{\mathrm{odd}} \mathbb C^5
=\binom51+\binom53+\binom55=5+10+1=16.
]

A standard Spin(10) construction represents the two chiral complex 16-dimensional spinors on these parity sectors. Mathlib's exterior basis/grading, Clifford even algebra and group machinery are concrete starting points for **proving the mathematical construction from first principles**. The five-mode choice arises from Spin(10) algebra, NOT from treating BFSS's 24 Dirac modes, 48 Majoranas, 3 adjoint SU(2) components, or 16-real-dimensional Spin(9) spinor as Standard Model matter.

**Stage gates**: (S0) prove exterior parity basis cardinalities = 16 in a new non-BFSS namespace; (S1) define creation/annihilation Clifford action and prove relations on the 32-dimensional full exterior space; (S2) prove even Clifford action preserves parity and define spinor reps; (S3) only then investigate the correct `SU(3)×SU(2)×U(1)` branching and left-handed field content/hypercharges; (S4) independently test anomalies and what an effective four-dimensional local QFT would require. These are **research choices** and no source has been staged or qualified.

This route is more probative than matching 16 or 48 numerically. Even matching the one-generation Spin(10) multiplet does not explain **three** generations, neutrino mass, Higgs/Yukawa mechanism, gauge symmetry breaking, 4D locality, CP violation or observed quantitative spectra. Spin(10) models are hypotheses, not a unique conclusion.

### SM-Y0: fully independent, small rational-anomaly certificate

Prioritize a separate Standard Model one-family hypercharge ledger in **left-handed Weyl conventions** and formalize the familiar `SU(3)^2U(1)`, `SU(2)^2U(1)`, `U(1)^3`, mixed gravitational-U(1) weighted sums as `\mathbb Q` rational identities using `norm_num`/`ring`. Include four weak doublets and the SU(2) global-anomaly parity *as a separate explicit condition*, not a corollary of rational polynomial cancellation. This is an excellent **infrastructure benchmark** for representation ledgers and checks CI source/consumer discipline independently of BFSS. It would be a re-verification of known facts, **not a new prediction**.

### SM-D0: experimental data baseline

Use 2026 PDG versioned APIs or tables and record definition, uncertainty, experimental status and date for every quantity tested. Start with gauge charges/couplings, Higgs/electroweak constraints, CKM, neutrino masses/mixings, and QCD phenomenology. Reserve claimed explanatory power for models with an actual mapping and quantitative predictions. The PDG API is a reusable **evidence/provenance tool** rather than a mathematical theorem.

## Priority decision / stop conditions

| Priority | Next reuse activity | Transfer type | Success criterion | Stop/redirection |
|---|---|---|---|---|
| 1 | SM-Y0 chiral ledger with 2026 PDG-source provenance | Direct Mathlib arithmetic and independent observed SM content | Exact typed representations and separately verified anomaly sums | If only tautological arithmetic, report it as test infrastructure, not scientific progress |
| 2 | SM-S0 exterior `Fin 5` basis/parity `16+16` and CAR relation research | **Adapter** from pinned Mathlib Exterior/Clifford | Small proof obligations and no conflation of BFSS and Spin(10) | No leap from 16-dimensional count to SM physical interpretation |
| 3 | BFSS E2/E3: typed LieSubalgebra/commutant interfaces | Reuse qualified BFSS and pinned Mathlib `so`/trace machinery | Original source/consumer precise type, allowed axioms, independent native archive | Stop after two analogous source/consumer native recursion REDs; no limit increases |
| 4 | Gauge representation and anomaly calculation beyond arithmetic | Research-only until explicit SM field map exists | Chiral representations with correct gauge charges, local field-theory meaning and anomaly consistency | No identification of BFSS SU(2) with weak SU(2), no 48↔three-generation numerology |

**Governance:** This file is a read-only audit with stable source references; do not promote SM0, SM-Y0 or SM-S0 into BFSS canonical gate state. The program remains **truth-first and experimentally answerable**, with other frameworks free to outperform or invalidate a BFSS-motivated hypothesis.
