# Grok independent referee report — Edition 0.7 (received 11 November 2026 Pacific)

**Provenance:** User-supplied independent AI referee text; preserved verbatim below the header. Not a verified Lean source inspection or human peer review.

---

The Edition 0.7 monograph is safe as an internal mathematical record after minor corrections. It is not a proof of a positive eigenvalue, a compact resolvent, or a mass gap.

## Limitations

I checked the printed conventional arguments in Chapters 6–17 and Appendices A, C, and D, and recomputed the coefficients that are fully visible there. I did not inspect `etblink/math`, any Lean declaration, blob, or CI log, so every “strict-qualified” label is the manuscript’s classification, not an independently compiled proof. Chapters 2–5 were read as definitions and contracts. The G4–K9 finite-sum expansion behind Theorem 10.1 and the BA–BH graph closures were not re-derived. Bajaj–Lin (arXiv:2611.14512) and Michel–Scheinpflug–Yin (arXiv:2611.09837) were compared with §14.4 only, not fully audited. Cited research notes that are not in the PDF were not opened.

No checked printed theorem is false. The spectral conclusion is unproved because the joins the manuscript itself marks open are still open.

## 1. Executive verdict

**Accept after minor corrections**, as an internal mathematical research record only.

The evidence ladder is real: source definitions, historical FCP results, integration-level analysis, pending gate N-05, conditional analysis, and open obligations are not collapsed into one “proved” spectral theorem. Equation (1.5) correctly places the open arrow before any eigenvalue. Chapters 15–17 do not establish a GUT, a ToE, or three families.

It is not safe to describe this edition as a spectral theorem, a current-tree requalification of the historical Hamiltonian, or an external monograph.

## 2. Findings

### Correct as checked

**F-C1. Color-sphere constant \(1/2\).**
Severity: Minor, as a positive verification. Location: Proposition 13.2, (13.9), manuscript pp. 61–62.
Claim: for probability measure \(d\sigma\) on \(S^2\) and any real \(3\times 9\) matrix \(X\), \(\int_{S^2}\|v^\top X\|\,d\sigma(v)\ge\tfrac12\|X\|_{\mathrm{HS}}\), sharp for rank one.
Analysis: diagonalize \(XX^\top\), with eigenvalues \(s_j\ge 0\), \(S=\sum s_j\), \(p_j=s_j/S\). Concavity of the square root gives \(\sqrt{\sum p_j v_j^2}\ge\sum p_j|v_j|\). In spherical coordinates, \(\int_{S^2}|v_1|\,d\sigma=\tfrac12\int_0^\pi|\cos\theta|\sin\theta\,d\theta=\tfrac12\). Hence the integral is at least \(\tfrac12\sqrt S\). Rank one saturates it.
Classification: Correct.
Correction: none. Do not relax \(1/2\) on the flat valley; that is where equality holds.
Effect: the factor in (13.13) is not an arbitrary loss. It is also why the later numerical margin cannot be improved by a better sphere inequality on the configurations that matter.

**F-C2. Transverse oscillator and the halved radial coefficient.**
Severity: Minor. Location: (13.2)–(13.3), (13.5)–(13.6), (13.12)–(13.13), pp. 59–63.
Claim: on 16 transverse reals, \(h_{\beta,r}=-\beta\Delta_z+r^2\|z\|^2\) has energy \(2\sqrt\beta\, r(n+8)\); excluding levels \(0,\ldots,m\) leaves at least \(2\sqrt\beta\, r(m+9)\); the sphere average then produces \(\sqrt\beta\,(m+9)\).
Analysis: one coordinate \(-\beta\partial^2+r^2 x^2\) has frequency \(2\sqrt\beta\, r\), so level \(n_j\) costs \(\sqrt\beta\, r(2n_j+1)\). Sixteen modes sum to \(\sqrt\beta\, r(2n+16)=2\sqrt\beta\, r(n+8)\). The next level after \(m\) is \(n=m+1\), hence \(m+9\). With the first color row of length \(r\), \(\|X^1\wedge X^2\|^2=r^2\|z_2\|^2\) and likewise for \(X^3\), so \(V\ge r^2(\|z_2\|^2+\|z_3\|^2)\). Spending \(\beta<1/2\) of the kinetic coefficient \(1/2\) is the right direction. Gauge averaging then uses F-C1 exactly once: \(2\sqrt\beta\,(m+9)\cdot I_f(v)\ge\sqrt\beta\,(m+9)\,J_f\).
Classification: Correct as conventional comparison. The transfer to a physical isotype is not included in this finding.
Effect: the bookkeeping from oscillator to sphere is not the broken step.

**F-C3. The \(8\sqrt3\) arithmetic, given its premises.**
Severity: Minor. Location: Proposition 10.3, (10.8)–(10.9), p. 46.
Claim: 24 skew blocks of sizes \(a_j\), each contributing operator norm \(a_j/2\), and \(\sum a_j^2=32\|X\|^2\), imply \(\|B\|_{\mathrm{op}}\le 8\sqrt3\,\|X\|\).
Analysis: \(\sum a_j\le\sqrt{24}(\sum a_j^2)^{1/2}\), so \(\tfrac12\sqrt{24\cdot 32}=\tfrac12\sqrt{768}=\tfrac12\cdot 16\sqrt3=8\sqrt3\). Under (10.5) and \(\theta_p^2=I/2\), a block \(K_{12}=a\) produces \(ia\,\theta_1\theta_2\), and \((ia\theta_1\theta_2)^2=(a^2/4)I\), so the block norm is \(a/2\). That local CAR step is right. The identity \(\sum a_j^2=32\|X\|^2\), and the equality of this \(B\) with `deformedFermionField 1 0`, are not proved in the monograph.
Classification: Arithmetic correct; identification Unproved.
Effect: the constant may be quoted only inside Proposition 10.3’s hypotheses.

**F-C4. Moment on the wrong side of the smooth-core bound.**
Severity: Minor. Location: Proposition 10.4, (10.10)–(10.12), pp. 47–48.
Claim: a linear bound \(\operatorname{Re}\langle f,Bf\rangle\ge -C\|X\|\|f\|^2\) yields \(q+CM_1\ge\tfrac12\|\nabla f\|^2+\int V\|f\|^2\), and does not bound \(M_1\) by the energy.
Classification: Correct. This is the right obstruction to reading Theorem 10.1 as confinement.

**F-C5. Six versus twelve.**
Severity: Minor. Location: §13.5, Proposition 13.1, (13.8), pp. 61 and 63; also Appendix C.6.
Claim: one Cartan generator of \(\operatorname{Spin}(9)\) rotates 8 planes in the 16-spinor and therefore 24 planes in \(16\times 3\) Majorana labels, at half-angle, hence \(\pm 1/4\) per plane and \(|\mathrm{weight}|\le 6\) on Fock vectors; conjugation on \(\operatorname{End}(F)\cong F\otimes F^*\) reaches 12. Thresholds \(\lambda_2>m+6\) and \(\lambda_2>m+12\) are different.
Analysis: \(24\cdot\tfrac14=6\), and differences of weights give 12. For \(m=11\) the two cutoffs are \(\lambda_2>17\) and \(\lambda_2>23\), as printed. The \(B_4\downarrow D_4\) rule \(\lambda_1\ge\nu_1\ge\lambda_2\ge\cdots\) does imply \(\nu_1\ge\lambda_2\). Both groups have rank 4; fixing an axis removes short roots, not a circle. The triality warning in §7.5 is the right warning.
Classification: Correct as a weight estimate under the stated implementer. It is not yet a source representation theorem. Open Problem 7.6 is the correct status.

**F-C6. Branching exclusion has the right inequality direction, on a smooth isotype.**
Severity: Minor. Location: Proposition 13.1, p. 61.
Analysis: excitation \(n\) in two copies of the \(\operatorname{Spin}(8)\) vector has first weight at most \(n\). Tensoring with a fiber of first weight at most 12 forces \(\nu_1\le n+12\). Interlacing requires \(\nu_1\ge\lambda_2\). Thus \(\lambda_2>m+12\) cannot meet \(n\le m\). Replacing 12 by 6 is the same argument on the vector fiber. The manuscript correctly refuses to apply this to an arbitrary \(L^2\) class.
Classification: Conditionally valid. The missing piece is global isotype to slicewise stabilizer content, not the inequality.

**F-C7. Conditional compactness chain.**
Severity: Minor. Location: (11.2)–(11.3), Theorems 11.1–11.3, Propositions 11.4, 11.5, and 13.5, pp. 49–53 and 64.
Analysis: \(\|x\|\ge R\) gives tail mass \(\le M_1/R\). For a cutoff equal to 1 on the inner ball and at most 1 elsewhere, \(R\|u-\varphi u\|_2^2\le M_1\). If \(w^2\ge c\|x\|\), a bound on \(\|wu\|_2\) bounds \(M_1\). Compact form-domain embedding implies compact resolvent for a closed semibounded form; an infinite-dimensional reducing sector then has eigenvalues of finite multiplicity tending to \(+\infty\). None of this is a gap for the unrestricted operator. The manuscript says so.
Classification: Correct, conditional on the unconstructed bounded map \(J\) from the physical form domain into the weighted closure.

**F-C8. \(\mathrm{SU}(2)\) phase cancellation.**
Severity: Minor. Location: Proposition 9.3, p. 40.
Analysis: \(\operatorname{Ad}_{\alpha(U_q)}=\operatorname{Ad}_{U_q}\) and the center of \(\operatorname{End}(F)\) give \(\alpha(U_q)=c(q)U_q\). Multiplicativity makes \(c\) a character. For \(a=\operatorname{diag}(e^{it/2},e^{-it/2})\) and \(j=\begin{pmatrix}0&1\\-1&0\end{pmatrix}\), \(aja^{-1}j^{-1}=a^2\). Every torus element is a commutator, every element is conjugate to one, and a \(U(1)\)-character is trivial.
Classification: Correct, and correctly conditional on the unproved intertwining (9.4).

**F-C9. Label commutator, commutant, and the 120-dimensional space.**
Severity: Minor. Location: Theorem 9.1, p. 38; Propositions 15.1 and 15.2, pp. 71–72.
Analysis: \((I_3\otimes D)(R_3\otimes I_{16})=R_3\otimes D\). The commutant of the adjoint \(\mathrm{SU}(2)\) action on \(\mathbb{R}^3\) is the scalars, so three distinct invariant rank-one projections do not exist. The identity \(\Lambda^2(C\otimes S)\cong(\Lambda^2 C\otimes\operatorname{Sym}^2 S)\oplus(\operatorname{Sym}^2 C\otimes\Lambda^2 S)\), \(\Lambda^2\mathbb{R}^3\cong\mathbb{R}^3\), and a one-dimensional space of invariant metrics give invariants isomorphic to \(\Lambda^2 S\), of dimension \(\binom{16}{2}=120\).
Classification: Correct. These are theorems about labels, not about three families or 120 conserved observables.

**F-C10. Twisted gamma and the mod-2 descent obstruction.**
Severity: Minor. Location: Propositions 16.1–16.3, pp. 75–76.
Analysis: \(\Gamma(-n)=-\Gamma(n)\), so \(\Gamma(n)\otimes n\) is constant on antipodes and squares to \(I\) after contracting the tautological line. Individually labelled \(P_+(n)\) is sent to \(P_-(n)\) by \(n\mapsto -n\). On \(S^8\), \(w(E)=1+w_8\), so \(w(E)^3=1+3w_8=1+w_8\) in mod-2 cohomology because \(w_8^2=0\) on an 8-manifold and \(3\equiv 1\pmod 2\). Thus \(w_8(E^{\oplus 3})=w_8(E)\). A degree-2 cover induces zero on top mod-2 cohomology, so a bundle with \(w_8\neq 0\) is not an ordinary pullback from \(\mathbb{RP}^8\). Also \(H^8(\mathbb{RP}^8;\mathbb{Z})\cong\mathbb{Z}/2\), so its image in \(H^8(S^8;\mathbb{Z})\cong\mathbb{Z}\) is zero; that integral formulation needs orientation data, which the text flags. The mod-2 argument is the clean one.
Classification: Correct under the stated clutching hypothesis. Not a chiral index and not a no-go against every twisted or stacky object.

**F-C11. Separation of the normalized field from the Yukawa.**
Severity: Minor. Location: Chapter 12, especially §12.6 and (C.7)–(C.8).
Analysis: \(\widetilde A_B=iA_B/(1+\tau)\) is quadratic over \(1+\|X\|^2\), with \(\|\widetilde A_B\|\le C_B\). The energy-identity field is linear in \(X\). A bound on the former does not prove (10.6). N-05 is printed as pending. Proposition 12.4 is an ordinary multiplier consequence of a uniform essential bound, not a Lean certificate and not a spectral input.
Classification: Correct.

**F-C12. Literature distinction, in outline.**
Severity: Minor. Location: §14.4, pp. 67–68.
Analysis: Bajaj–Lin work with the positive-energy multiplet \(44\oplus 84\oplus 128\), not with a splitting of \(F\cong\mathbb{C}^{2^{24}}\). Their Appendix F states an existence argument for infinitely many \(\mathrm{SO}(9)\)-singlet bound states in the 84 and says the 128 modification is left as an exercise. Michel–Scheinpflug–Yin use \(H_{\mathrm{aux}}=\tfrac1{16}\sum_\alpha Q_\alpha(\sum_i\operatorname{tr} X_i^2)Q_\alpha\), prove a gap for this auxiliary operator in the gauge-invariant \(\operatorname{Spin}(9)\) singlet, and explicitly say that \(\mathrm{SU}(N)\) BFSS has no gap. The printed monograph does not adopt either result and does not confuse an auxiliary gap with a gap of \(H_{\mathrm{phys}}\).
Classification: Correct in substance. One wording adjustment is F-m3 below.

### Critical

None.

### Major

**F-M1. The coercivity join is open, and the printed window is not evidence that it can close.**
Severity: Major. Location: Open Problems 10.5, 11.6, and 13.4; (13.11)–(13.14), p. 63; atlas O-01 through O-05.
Claim examined: there exist \(a,c>0\) such that, on a genuine infinite-dimensional physical high-type sector, \(q(u)+b\|u\|^2\ge a\|\nabla u\|^2+c\int\|X\|\|u\|^2\), and therefore the restricted operator has positive eigenvalues.
Analysis: the implication from that estimate plus the missing domain map to discrete positive spectrum is F-C7. The estimate itself is a stack of unproved identifications: Pauli realization of \(V\), signed identification of \(B\), some finite \(C\), a continuous Fock-vector \(\operatorname{Spin}(9)\) lift, sixteen-charge covariance through the closed graph, nonempty infinite-dimensional physical isotypes, and slicewise absence of oscillator levels \(0,\ldots,m\). The illustrative point \(\beta=0.49\), \(m=11\), \(C=8\sqrt3\) gives
\[
\sqrt{0.49}\,(11+9)-8\sqrt3=14-8\sqrt3,
\]
and \(14^2=196>192=(8\sqrt3)^2\). The margin is about \(0.144\), roughly one percent of \(14\), while the unused kinetic coefficient is only \(a=1/2-\beta=0.01\). Because F-C1 is sharp for rank one, the valley that must be controlled saturates the factor \(1/2\). If the true \(C\), the oscillator prefactor, or the sphere factor is off by a few percent in the adverse direction, (13.14) becomes negative. In particular the manuscript’s own caveat that each block contributes \(a_j/2\) is load-bearing: dropping that \(1/2\) doubles \(C\) and destroys the inequality.
Classification: Unproved. The displayed arithmetic is not incorrect.
Correction: keep (13.14) in a clearly marked numerical illustration and add the sharpness and one-percent statements above. The verifying theorem is a source-typed operator-norm bound for the actual field, evaluated on a rank-one line, together with one nonempty physical sector in which the oscillator exclusion is proved. A sharp constant is more informative here than another loose majorization.
Effect: this blocks every positive-spectrum sentence. It does not damage Theorem 10.1, the abstract compactness theorems, or the conditional Propositions 11.5 and 13.5.

**F-M2. Historical self-adjointness has not been requalified, and two summary sentences drop that distinction.**
Severity: Major as a provenance finding, not as a discovered false proof. Location: Source accounts 6.1, 6.2, and 6.4, §6.7, pp. 24–26; the unqualified summaries in §10.1, p. 44, and §14.1, p. 66; atlas H-01–H-03.
Claim examined: the original system “has a native nonnegative self-adjoint Hamiltonian” \(H_{\mathrm{phys}}=\tfrac1{16}T^\dagger T\).
Analysis: the printed argument is the standard one: graph closure of the invariant-core charge column, density, and self-adjointness of \(T^\dagger T\) for a densely defined closed operator between Hilbert spaces, scaled by \(1/16\). I did not recompile BA–BH. Section 6.7 states the actual limitation: the historical proof used `letI`, the imported copy uses `let` and rewritten imports, and current-tree acceptance is not claimed. Sections 10.1 and 14.1 nevertheless say that Chapter 6 established, or that the system has, this self-adjoint Hamiltonian, without the historical qualifier.
Classification: Historically claimed, current-tree status Unproved. The abstract adjoint-square theorem is Correct.
Correction: in §§10.1, 14.1, and any front-matter summary, write “historically strict-qualified; not requalified on the current import.” Do not promote H-01–H-03 to integrated strict without a new consumer at a named commit.
Effect: no spectral theorem depends on relabeling these rows. A reader who cites only §14.1 will overstate what the current tree contains.

### Moderate

**F-m1. Global isotype does not yet exclude low transverse modes.**
Severity: Moderate. Location: §§13.1 and 13.3, Proposition 13.1, Open Problem 13.4.
Claim: \(\lambda_2>m+12\), or \(m+6\) on the vector fiber, excludes oscillator levels \(0,\ldots,m\) on each smooth slice of a physical isotype.
Analysis: F-C6 is the representation half. The analytic half needs a measurable family of stabilizers, a disintegration in which the low-mode projection is an intertwiner, and absence of low modes on almost every slice, then passage from the smooth core to the closed form. The text says that a pointwise restriction of a general \(L^2\) class is meaningless and that the frame derivatives are not needed for the fixed-row identity (13.6). That is right for one fixed row. It is not the averaged, isotypic, closed-domain theorem.
Classification: Unproved. No counterexample to the conditional statement was found.
Correction: leave Proposition 13.1 conditional and do not let §13.7 refer to “levels genuinely absent” except as a hypothesis.
Effect: even a proved bound \(\|B\|\le C\|X\|\) would not yield (13.11).

**F-m2. The physical form domain is not the weighted closure.**
Severity: Moderate. Location: §11.5, Proposition 11.4, Open Problem 11.6, Appendix C.4.
Claim: a high-type form bound on \(M_1\) and \(\nabla\) imports Theorem 11.3.
Analysis: Theorem 11.3 controls triples \((u,\nabla u,wu)\) in a specified closure. The physical form controls \(\|T\psi\|\). Proposition 11.4 correctly isolates the missing bounded map \(J\) whose first component is the same \(L^2\) class. No such \(J\) is constructed. Similarity of two complete graph norms is not an equality of domains.
Classification: Conditionally valid, and the text already says this.
Correction: none beyond keeping O-04 and O-05 in the open column wherever compact resolvent is mentioned.
Effect: A-02–A-04 can stand while O-05 remains open.

### Minor

**F-n1. Atlas cardinality disagrees with itself.**
Location: Appendix A, p. 82, “38 source-linked” records; Appendix C.7, p. 101, “37-record `THEOREM_ATLAS.json`.”
Analysis: the printed index has D-01–03, G-01–04, H-01–03, F-01–02, S-01–10, A-01–04, N-01–05, O-01–05, and C-01–02, which is 38 rows. I could not open the JSON.
Classification: Editorial.
Correction: make the integer agree with the printed index, or say which row is absent from the frozen file.
Effect: none on the mathematics. A later citation of “the atlas” is ambiguous until this is fixed.

**F-n2. Summary sentences outrun §6.7.**
Location: §§10.1 and 14.1, as in F-M2.
Classification: Editorial once F-M2’s sentence-level correction is made. Listed separately so the mathematical gap and the wording fix are not confused.

**F-n3. Bajaj–Lin is described one degree too softly.**
Location: §14.4, pp. 67–68.
Claim: they “propose an existence argument.”
Analysis: the abstract and §4 report numerical positive-energy states in \(\mathrm{SO}(9)\) irreps. Appendix F claims a mathematical existence argument for infinitely many singlet bound states in the 84, by a trial-state construction, and leaves the 128 modification “as an exercise to the readers and/or their agents.” The monograph is right about the 128 exercise, right that \(84\) and \(128\) are supermultiplet labels, and right not to adopt the argument. “Propose” is weaker than the preprint’s own wording.
Classification: Not incorrect; incomplete attribution.
Correction: say that Appendix F claims an existence proof for the 84 and that this monograph has not checked it. Keep Open Problem 14.1.
Effect: none, provided the external claim is not promoted into O-05.

**F-n4. Integral Euler class on \(\mathbb{RP}^8\) needs the orientation hedge that is already present.**
Location: §16.4, p. 76.
Analysis: \(\mathbb{RP}^8\) is non-orientable, so an integral Euler class is a less stable formulation than \(w_8\). The mod-2 proof is the one that survives. No correction beyond leaving the orientation clause in place.
Classification: Correct with the printed hedge.

## 3. What survives independent scrutiny

The following do not depend on an unverified Lean run:

- The carrier distinctions \(X\cong\mathbb{R}^{27}\), \(F\cong\mathbb{C}^{2^{24}}\), \(\operatorname{End}(F)\) of complex dimension \(2^{48}\), and \(L^2(X;F)\neq L^2(X;\operatorname{End}(F))\).
- \(\theta^2=I/2\) from the delta-one CAR, and the separation of that normalization from \(\{\gamma_i,\gamma_j\}=2\delta_{ij}\).
- Nonnegativity of the core form (4.5), and the fact that symmetry on \(C_c^\infty\) is not self-adjointness.
- The standard construction \(H=\tfrac1{16}T^\dagger T\) once a densely defined closed physical charge column is granted. Only the historical source claim, not this abstract step, depends on BA–BH.
- Flat rank-one valleys of \(V_\wedge\), and the logical direction of Proposition 10.4.
- Propositions 13.2, 15.1, 15.2, and 16.2 unconditionally, at the printed level of generality.
- Propositions 7.5, 8.5, 8.6, 9.3, 9.5, 11.4, 11.5, 12.4, 13.1, 13.3, 13.5, 16.1, and 16.3 as conditional theorems. Their hypotheses are not discharged.
- The refusal to infer a mass gap from a sector eigenpair, to replace weight 12 by weight 6, or to substitute \(\widetilde A_B\) for the linear field.
- The external-paper boundary: Michel’s auxiliary singlet gap is not a gap of \(H\); Bajaj–Lin’s 84 and 128 are not a decomposition of the original Fock fiber.

What does not survive as a theorem of this edition: a source-typed bound on the physical Yukawa, a continuous physical \(\operatorname{Spin}(9)\) action, covariance of all sixteen charges, a nonempty high-type reducing sector, first-moment coercivity, identification of the form domain with the weighted closure, compact resolvent, and any positive eigenvalue. The same is true of three families, a chiral index, a GUT, and a ToE.

## 4. Research-direction assessment

**1. Strongest accomplishments actually supported here.** The sharp color-sphere inequality; the explicit separation of vector weight 6 from operator weight 12; the energy-form observation that the dangerous moment enters with the wrong sign; the abstract first-moment compactness chain; the small representation and topology theorems in F-C8 through F-C10; and an evidence atlas that, apart from the 37-versus-38 slip, does not launder open joins into theorems. The historical Hamiltonian and the integrated Lean rows may be real, but this review did not verify them.

**2. The single most consequential unproved interface.** A continuous, gauge-compatible \(\operatorname{Spin}(9)\) action on the original physical space that intertwines the closed sixteen-charge column, followed by one infinite-dimensional reducing sector on which the closed form controls \(M_1\). That is the open arrow in (1.5). Compact resolvent is then ordinary.

**3. Weakest link in the spectral proposal.** The numerical mechanism (13.12)–(13.14). It depends on an unidentified constant \(C\), an unproved slicewise exclusion, and a margin of about one percent on the same rank-one valley where the sphere inequality is already sharp.

**4. Counterexamples or known results.** Rank-one valleys kill any claim of global bosonic confinement. Michel’s result that the continuum reaches zero is compatible with this manuscript and kills only a mass-gap reading, which the manuscript does not adopt. It does not kill protected positive eigenvalues in sectors with no scattering channel. I found no counterexample to Proposition 13.2, the oscillator arithmetic, the weight distinction, or the conditional form-to-resolvent implication.

**5. Should the strategy change?** No fundamental restructuring. The high-isotype route is a legitimate path to compact resolvent in a sector, which is stronger than mere existence. It is not the shortest path to some positive eigenvalue if Appendix F of Bajaj–Lin survives a domain audit. Keep both. Do not treat either as already source-typed.

**6. Techniques worth using.** A finite operator-norm calculation of the concrete \(N=2\) field on a rank-one line, before more abstract majorization. A direct weight computation in the finite Fock representation, which would turn the \(6\) and \(12\) bounds into theorems without a general branching machine. Michel’s supercharge sandwich with \(\sum\operatorname{tr} X_i^2\) is a different radial weight from hand-splitting the kinetic term; it deserves a precise comparison, not an identification with \(H_{\mathrm{phys}}\). The Bajaj–Lin channel argument should be rewritten on the original domain or rejected there. IMS localization remains available as an adversarial test, with the cutoff errors the manuscript already notes.

**7. Unification.** Preserve Propositions 15.1, 15.2, and 16.2, and the conditional descent obstruction 16.3, as small mathematics with the printed kill criteria. Preserve the 120-dimensional invariant space and the line-twisted gamma field as objects to be promoted only by an operator on the original carrier. Abandon, as conclusions, three color axes as three families, a torsion class as an integer family index, spatial \(\operatorname{Spin}(9)\) as an internal GUT symmetry, and any ToE claim. The monograph already does this. No reformulation of those conclusions is needed because they are not claimed.

**8. Next obligations, by scientific value.**
1. A source-typed bound for the actual unnormalized field on the rank-one valley, sharp enough to decide whether any \(\sqrt\beta\,(m+9)-C\) is positive.
2. One nonzero physical reducing sector: either the Fock-vector \(\operatorname{Spin}(9)\) lift with sixteen-charge covariance, or a domain-correct audit of the Bajaj–Lin 84 construction. These answer different questions; the first is the one this monograph’s compactness machine can use.
3. The map \(J\) in Proposition 11.4, identifying the physical form domain with the weighted triple on that same sector.

## 5. Final recommendation

**Accept after minor corrections.**

This concerns accuracy as an internal research record. It is not acceptance of a positive-spectrum theorem.

Priority of revision:

1. In §§10.1 and 14.1, restore the historical-only status of \(H_{\mathrm{phys}}\).
2. Beside (13.14), state that the margin is about \(0.144\), that rank one saturates the factor \(1/2\), and that the inequality fails if \(C\) or the oscillator prefactor moves adversely by a few percent.
3. Reconcile “38” in Appendix A with “37-record” in Appendix C.7.
4. In §14.4, attribute to Bajaj–Lin’s Appendix F a claimed 84 existence argument, not merely a proposal, and keep it unaudited.

No mathematical restructuring is required. No spectral sentence should be strengthened.