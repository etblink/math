# BFSS research frontier — adversarial decision memorandum

**Decision: CONDITIONAL.** The operator-column architecture is potentially viable. No structural obstruction or valid same-sector escaping sequence was identified. The decisive unproved inference is oscillator exclusion on the entire source-defined isotypic core, followed by covariance and exact closure/domain binding. Positive eigenvalue existence is not established.

**Review:** 7 November 2026. Fixed HEAD: 5fbe86b73784efa429d01c5b338990540896b1de. Accepted C0-A baseline: run #42397460623 at a78c80da46bc8167df4753017b37cf1323008ac1. This is an independent reasoning audit, not independent human peer review or repeat CI qualification. No repository, PR or CI changes were made.

## 1. Evidence boundary

| Category | Scope |
| --- | --- |
| Previously qualified | Source Spin(9) compactness in the named PBW topology; recorded algebraic gamma covariance; generic massless core-form identity; compactness-analysis lemmas under their stated bounds. |
| Inspected donor constructions | Complex Clifford/Fock M2–M3D/H/I, gauge uniqueness S1H, physical core/graph and normalized Hamiltonian interfaces at fa00aa36e770ca516f57b41f5b02229a5033d50f. Their historical qualifications were not independently established here. |
| Conditional analytical arguments | Weights, branching/slicing, scalar averaging, nonempty high types, column/form correspondence and escape diagnostics. |
| Not established | Source-exact operator action with all covariances; full-sector coercivity on the physical domain; compact resolvent or positive eigenvalues of that Hamiltonian. |

The [roadmap][roadmap] and [memorandum, especially V][memo] preserve these distinctions. C0 compactness does not itself identify the source stabilizer/highest-weight labels with the B4/D4 theory needed below.

## 2. Structural viability and negative center

Let \(F\) be the original Fock space, \(d=2^{24}\), \(A=\operatorname{End}_{\mathbb C}F\), and \(\Gamma_p=\sqrt2\,\theta_p\) in the original paired ordering. A source-exact complex Clifford equivalence \(\rho:\mathrm{Cl}_{48,\mathbb C}\simeq A\) would define
\[
\alpha_s=\rho\,\mathrm{Cl}(R_{48}(s))\,\rho^{-1}.
\]
The group law needs no choice of Fock-vector phases. Actual label continuity and finite-dimensional generator expressions give continuity. Hilbert-adjoint preservation must follow from the self-adjoint Majorana generators; Mathlib's Clifford star cannot replace it. Trace preservation then gives Hilbert–Schmidt unitarity.

The accepted central declaration has \(R_{48}(-1)=-I\), whereas the nine-vector action is identity. Necessarily
\[
\alpha_{-1}(\Gamma_p)=-\Gamma_p,\qquad
\alpha_{-1}(T)=P T P^{-1},\quad P=(-1)^N.
\]
This is nontrivial on odd operators and trivial on even operators. The even Hamiltonian is compatible with it; individual supercharges change sign while their norm-squared form is preserved. A scalar action on \(A\), or SO(9) descent of the full action, fails this test. An operator action is not a Fock-vector lift.

Gauge compatibility has a viable argument: commuting spatial/color label actions and complete complex generation imply
\(\alpha_s(U_g)U_g^{-1}=\chi_s(g)I\).
Multiplicativity and literal SU(2) character triviality give \(\alpha_s(U_g)=U_g\). S1H requires explicitly covariant honest gauge implementers; it does not construct the spatial action.

Hamiltonian covariance still needs the original coefficient and derivative transport: prove the sixteen-charge column's covariance, with orthogonal spinor-index mixing, or the exact polarized core-form invariance. In compatible spatial conventions the multiplier identity must be \(\alpha_s(B(R_s^{-1}X))=B(X)\). The original fermion field is typed as a real-linear operator; its identification with this complex-linear multiplier must also be explicit. A label homomorphism alone is insufficient.

Two shortcuts are rigorously invalid. A unital source \(\mathrm{Cl}_9\) map sends \(-1\) to a scalar and cannot implement Majorana negation. A real \(\mathrm{Cl}_{48}\) map cannot cover all complex Fock operators as a real vector space: dimensions are \(2^{48}\) and \(2^{49}\). These obstruct shortcuts, not the complex automorphism architecture. [D audit][da]; [memorandum I/V][memo].

## 3. Physical correspondence and domains

Use the full operator carrier with left-output gauge action
\[
(G_gT)(X)=U_gT(g^{-1}X).
\]
For a fixed orthonormal input basis, \(C(T)=(Te_j)_{j=1}^{d}\) is unitary for the unnormalized Hilbert–Schmidt norm. Gauge invariants identify with \(d\) original physical Hilbert spaces; smooth compact support and gauge covariance correspond column by column. Gauge conjugation on both indices would produce a different physical space.

With output-only charges, the required equalities are
\[
C D(\widetilde q)=D(q_{\rm phys})^{\oplus d},\qquad
\widetilde q(T)=\sum_jq_{\rm phys}(Te_j),
\]
\[
C D(\widetilde H)=D(H_{\rm phys})^{\oplus d},\qquad
C\widetilde H C^{-1}=H_{\rm phys}^{\oplus d}.
\]
Finite sums commute with graph closure. Thus identify the exact invariant cores and charge graphs, close them, then use the associated-form characterization of \(H=(1/16)Q^\dagger Q\). Donor D2B13 concerns the minimal closed charge column; it does not identify every maximal differential realization.

Missing bindings include the original graph, the \(\ell^2\) charge-output norm, normalization, and Hamiltonian domain. L2-density alone is insufficient. Source form covariance must extend to the closure, and the isotypic projection must preserve its domain and projected core to establish reduction.

No circularity is necessary: column correspondence uses finite sums/cores; covariance gives form-domain projections; coercivity is proved on that core and then extended. Assuming projected-core density or weighted-domain inclusion because confinement is expected would be circular. An eigenvector's individual columns need not share its Spin type, but a nonzero column would retain its eigenvalue once the domain equalities are proved. [Source-premise audit][p].

## 4. Spectral falsification and corrected thresholds

The [E argument][e] is credible conditionally: bosonic color pullbacks preserve \(\beta T+W\) and commute with the spatial/operator action. They need not preserve physicality if the one-color inequality holds on the full-space isotypic core. The full Hamiltonian form is not invariant under those auxiliary pullbacks.

The decisive implication is B4-to-D4 restriction \(\nu_1\ge\lambda_2\), combined with the level-\(n\) fiber bound \(\nu_1\le n+M\). Slice evaluation must use smooth representatives in a finite-dimensional cyclic orbit span, not arbitrary L2 point evaluation, and cover every vector of the selected type.

| Carrier | Fiber cutoff \(M\) | Condition excluding levels 0–11 |
| --- | --- | --- |
| Canonical Fock vectors | 6 | \(\lambda_2>17\) |
| Full Fock operators | 12 | \(\lambda_2>23\) |

The second bound includes the contragredient input index. Thus the old vector-sector example \((24,18,0,0)\) does not justify the same exclusion for operator columns. This is a failed transferred inference, not a counterexample to confinement there. With the proposed invariant \(T_0\), \(P^{12}T_0\) instead has candidate type \((24,24,0,0)\).

Nonemptiness has a conditional construction: start with a genuine normalized source gauge-singlet \(w\), and average \(|w\rangle\langle w|\) under \(\alpha\). Adjoint/trace preservation makes the average positive with trace one; gauge compatibility makes it left-gauge fixed. Radial cutoffs of \(P^kT_0\) then give independent vectors. The source singlet, polynomial highest type and smooth-core binding must all be discharged; a nonzero operator alone does not prove a physical high type.

If exclusion and source energy binding hold, averaging gives
\[
\widetilde q\ge(1/2-\beta)T+
 [\sqrt\beta(m+9)-C_M]J,\qquad
J=\int\|X\|\,\|T(X)\|_{\rm HS}^{2}.
\]
Left multiplication has the same operator norm on Hilbert–Schmidt operators as on \(F\); no factor \(d\) enters \(C_M\). Qualitatively take \(\beta=1/4\), \((m+9)/2>C_M\), and \(2k>m+12\). The inherited finite growth bound suffices; the sharp \(8\sqrt3\) constant remains a separate analytical/source-binding obligation.

**Escape search:** the serious candidate is the rank-one valley packet of transverse width \(r^{-1/2}\) with its configuration-dependent filled fermion ground state. Bosonic \(+8\sqrt2\,r\) and fermionic \(-8\sqrt2\,r\) energies cancel. Fixed-fermion polynomial trials do not test this cancellation.

The [D audit][da]'s ground-channel cutoff 2 concerns Fock vectors. Operator columns tensor that output ground fiber with the full dual input space. Under the same canonical stabilizer model, its first-coordinate cutoff is at most \(2+6=8\). The old cutoff 2 cannot be reused; the cancelling ground channel still misses \(\lambda_2>8\). This is a frozen-channel analytical check, not full escape exclusion or a new threshold theorem.

No normalized bounded-energy escaping sequence in the eligible high operator type and source domain was found. Projecting an ordinary valley packet and renormalizing requires a lower bound on projected norm and control of its form energy. Large first angular momentum is insufficient: one-row types \((\ell,0,0,0)\) can have it. A continuous spectral set does not by itself preclude embedded point eigenvalues.

## 5. Alternative routes

| Route | Avoids | Still requires |
| --- | --- | --- |
| Full operator columns | Global Fock-vector phase/lift choices | Adjoint/gauge/form covariance; \(M=12\); branching, domains, coercivity |
| Direct Fock-vector lift | Enlarged fiber and right-index weights; gives \(M=6\) | Source lift/integration, parity sign, covariance, domains, exclusion |
| Parity-even operators/SO(9) | Nontrivial central action on the chosen carrier | Exact descent/stabilizer binding; only a reducing part of full amplification |
| Direct source core-form analysis | Independent manuscript-model comparison | Honest global symmetry and full-sector exclusion |
| Near-valley localization | May improve the threshold | Gauge frames, Berry/IMS terms and uniform errors; unnecessary for conservative E |

The operator route genuinely avoids a vector-lift construction. It does not avoid the hard representation/domain work, and finite amplification does not manufacture eigenpairs.

## 6. Minimum next uncertainty-reducing theorem

**Select whole-sector slice exclusion as an analytical decision gate before further implementation volume.**

Hypotheses: literal source spatial action; the continuous, adjoint-preserving Majorana-induced action on \(A\); an identified source Spin(8) stabilizer; correctly normalized fiber bound \(M=12\); source-applicable B4/D4 branching. Let \(f\in C_c^\infty(\mathbb R^{27},A)\) have fixed type \(\lambda_2>m+12\).

Conclusion, for almost every nonzero \(u=x^1\) and longitudinal parameters:
\[
(\Pi_{\le m}^{\,u,\beta}\otimes I_A)f_{\rm slice}=0,
\]
where \(\Pi_{\le m}^{\,u,\beta}\) is the low-level projector of the literal sixteen-coordinate oscillator
\(-\beta\Delta_z+\|u\|^2\|z\|^2\). Gauge invariance is not a hypothesis.

The expected consumer is the one-color scalar estimate, followed by E averaging and the original massless core-form/growth interfaces. No coercivity, compactness or eigenpair premise is assumed. The action/branching hypotheses remain unresolved dependencies; C0 does not discharge them.

Failure means a nonzero low-level projection in an actual eligible type, source stabilizer/normalization mismatch, invalid slice equivariance, or a proof applying only to \(P^kT_0\). A same-sector source-form sequence with bounded energy and mass escaping to infinity would decisively refute the resulting coercivity.

M3I recovery may be a necessary formal prerequisite. Another algebra-packaging green alone would not resolve this spectral uncertainty. Retain CONDITIONAL until the action, exclusion, nonempty physical type, and exact closed-source correspondence are established. No spectral existence is asserted.

## Pinned sources

All active links refer to the reviewed HEAD.

- [Roadmap][roadmap]; [operator-column memorandum, including V][memo].
- [A/B normalization][ab]; [C weights/branching][c]; [D lift/valley][da]; [E averaging][e]; [physical source premises][p].
- Original Core.lean, GaugeCore.lean, PotentialBounds.lean, FormClosure.lean; SpectralMasslessCoreFormIdentity.lean; SpectralSourceNineCompactness.lean; F10R and F10U declarations were inspected.
- Separate donor snapshot: M2/M3D/H/I, S1H, D2B10C/13/16/17/18/25/26/27/28 were inspected. Their source bodies do not constitute fresh historical CI qualification.

[roadmap]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md
[memo]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md
[ab]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md
[c]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md
[da]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md
[e]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md
[p]: https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_SOURCE_PREMISES_AUDIT_2026_11_06.md
