# P3 forward research: source gauge projection fixed by Spin via inverse star algebra

**Date:** 2026-11-12 (Pacific). **Status:** mathematical proof strategy only; UNCOMPILED and NOT strict qualified.
**Repository:** etblink/math, integration/bfss-unified-research-20261108. **Concurrent P2-C4B:** run #43219669093, tested source d788d4d129f8b4654da81f6cbd1342f02350548e; outcome not assumed.
**Operations:** documentation only; no branch creation, Lean/consumer/workflow edits, or changes to main/FCP.

## 1. Source discovery: canonical OP0 projection is not a Haar average

The exact OP0 implementation at lean/OAI/LinearAlgebra/GaugeFixedProjectionOP0.lean (Git blob 98b2c65be8054b4587a3b7a1c258f00dffbdaeae) defines the gauge-fixed subspace as an intersection of kernels and gaugeFixedProjection as Submodule.starProjection onto that literal subspace. It is NOT defined by a Haar integral. Previous speculative use of a gauge-average formula for this source operator therefore requires correction.

The source binding OP2bOriginalGaugeProjectionBridge.lean (blob 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec) gives the exact genuine gauge unitary U_q, source P=originalFermionGaugeProjection, P*=P, P²=P, and U_q P=P on every genuine original Fermion 2 vector. OP2cNonzeroOriginalGaugeVacuum.lean (blob a16d3573b737bb4453e42b0b543d63cbbac1cd1b) proves that a nonzero original vacuum is fixed, P fixes that vacuum, and P ≠ 0.

The existing source Spin(9) star-algebra equivalence on actual Fock operators is P2bB3OriginalFockStarAutomorphismAction.lean (blob b50ef04695587b267ad8519074b1293f98828749). It respects multiplication and the physical Hilbert adjoint, but is currently an algebraic action, not an established joint-continuous Fock-vector implementer.

## 2. General theorem: the orthogonal gauge projector is fixed (conditional)

Let F be the original finite-dimensional complex Fock Hilbert space, A=End_C(F), U_q the original genuine gauge representation, W={v | every U_q v=v}, P the orthogonal projection onto W, and alpha:A≃⋆ₐ[ℂ]A a star-algebra equivalence. Assume the exact source-type compatibility premise

    for all gauge q: alpha(U_q)=U_q.

Then alpha(P)=P, without any Haar averaging, trace/rank computation, continuity in the Spin variable, or Fock-vector Spin implementation.

Source-faithful proof:
1. From U_q P=P and alpha multiplicative and fixing U_q, obtain U_q alpha(P)=alpha(U_q P)=alpha(P). Thus every output of alpha(P) belongs to W. Since P is the orthogonal projector onto W, P alpha(P)=alpha(P).
2. The inverse alpha.symm likewise fixes all U_q. Repeating step 1 for alpha.symm proves P alpha.symm(P)=alpha.symm(P). Applying alpha gives alpha(P) P=P.
3. Take the physical star of alpha(P) P=P. Because P*=P and alpha(P)*=alpha(P) by star compatibility, get P alpha(P)=P.
4. Compare step 1 with step 3: alpha(P)=P.

Everything here is **elementary algebra conditional on the explicit premise** alpha(U_q)=U_q. No source file currently proves that premise for all original q and g, so this is NOT a newly qualified Spin-invariant projection.

A generic Lean lemma must expose star-preserving equiv, pointwise U_q fixedness, U_q P=P, P*=P, and the universal absorption property: every operator T whose outputs are fixed by every U_q satisfies P T=T. The original canonical projection supplies absorption through its full fixed-space range and idempotence. It can then prove the equality via the above two-sided multiplication route. Separate consumer must exercise inverse alpha, a nonidentity automorphism and a nonzero proper canonical projection.

**Correction — November 13, 2026:** the earlier abbreviated generic-interface checklist omitted the full-range/absorption premise used implicitly in step 1. That weakened checklist is false, even with P²=P: conjugation by the coordinate swap fixes the trivial SU2 action on C² but moves diag(1,0). The conventional argument for the canonical full fixed-space projection remains valid. [Exact counterexamples, corrected contract and source audit](../top-down-symmetry/TD_C1B_FORWARD_UNITS_TRANSPORT_AND_PROJECTION_MAXIMALITY_2026_11_13.md) preserve the correction and its negative evidence. No accepted source theorem is changed.

## 3. The exact remaining source join

To prove alpha_g(U_q)=U_q, reuse:
- C48C0OriginalSpinGaugeMajoranaCommutation.lean (blob 9f9a5ce2186ded98a251efbc24c2b66f416044d5), which establishes original 48-label spin/color matrix commutation, NOT Fock-operator gauge invariance by itself.
- OP3C6COriginalFockActiveGammaCovariance.lean (blob 2d6f777568b0026737112ff8256e5ed50fc9e6e6), all-original-Majorana gamma covariance of the exact operator algebra action.
- OperatorDependencies/SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean (blob eacab43f1b9112e9e1920e656bdf1166f824a5a8), source gauge representation uniqueness only under its EXPLICIT full 48-Majorana hV covariance hypothesis.

The minimal next joining task is to show q ↦ alpha_g(U_q) is a genuine source representation satisfying precisely S1H's hV, including theta normalization, original axis labels, inverse orientations, full-vector rather than only axis covariance and group multiplication. Then use S1H, not an invented relative-character cancellation.

## 4. Implication for high-type physical operator columns

If the above join and generic projection result qualify, the already nonzero original P is simultaneously left-gauge-fixed (U_q P=P) and source Spin-fixed (alpha_g(P)=P). Thus a proposed original operator-valued high-type function can use a cutoff times the historically gauge-invariant Gram highest-weight polynomial raised to a positive integer, multiplied by P. There is no need to introduce a new Spin Haar average of a rank-one operator merely to make its operator factor invariant.

Still separate and unproved: source smooth-core cutoff and nonzero witness, actual Gram polynomial highest-weight type and powers, jointly continuous source Spin group action, exact physical closed-form/graph covariance, full isotypic low-oscillator exclusion (operator first weight bound 12), compact embedding, and positive eigenpair existence. Preserve central Spin parity and do not replace original Hamiltonian.

## 5. Parallel C4B status

The running #43219669093 tests only a parser-documentation correction in the generic AlgebraData integrability bridge. The previous red #43217402006 failed first with an unexpected adjacent doc comment; that run did NOT rigorously qualify or disprove the corrected generic bridge. Four original integrability declarations had standard-only axiom reports, but the whole C4B gate and consumer remain UNQUALIFIED. Do not edit files under test or infer a spectral result.

**Governance:** document-only research on unified integration; no new branch, no CI changes, no main/FCP modifications.