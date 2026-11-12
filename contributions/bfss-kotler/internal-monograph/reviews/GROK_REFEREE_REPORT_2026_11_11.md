The monograph at `etblink/math@3fdba19c17fa1470c010eb004af524b3c0a591a1` is usable as an internal research reference. It is not a spectral theorem, and it is not a unification theorem. The definitions I checked against source match. The confinement chain is conditionally viable and still open. Several numerical steps are correct but too compressed to audit from the book alone.

## Materials actually inspected

No file was attached in this session. The edition described in the request is the source tree on `docs/bfss-internal-research-monograph-20261111`, commit `3fdba19c17fa1470c010eb004af524b3c0a591a1` (11 November 2026). I inspected the TeX and companion notes directly. LaTeX is not available here, and the 88-page PDF is intentionally not in Git, so citations below are by chapter, section, and equation label rather than PDF page.

| Item | What was read |
|---|---|
| Monograph | `main.tex`, README, consistency audit, spectral-join gates, theorem-atlas index and cards through S-09, negative-knowledge appendix, Chapters 1–6 in full, 7 through the covering theorem, 10–11, 13, 15, and the load-bearing parts of 8, 9, 12, 16, and 17 |
| Lean at baseline `d4870eb1ac58` | Full `Core.lean` and `DeformedCharge.lean`; declaration block of the BE normalized-Hamiltonian probe. Not recompiled |
| Audits | `BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md` and `BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md`, mathematical sections |
| Not done | No Lean build, no replay of the cited Actions runs, no line-by-line reading of the other 35 Lean proof bodies, no reading of Chapters 8–9, 12, 14, or the historical/notation appendices in full. GitHub code search was not a reliable index of this repository |

`65f9de5f` is one commit ahead of the stated baseline `d4870eb1`. The S-07/S-08 files exist at both commits. “Not independently verified” below means the declaration was not recompiled by me.

## I. Executive assessment

The project’s mature core is a source-exact operator foundation for one fixed quantum system: relative \(N=2\) BFSS, with 9 spatial labels, 3 adjoint colors, 27 bosonic coordinates, 48 Majorana generators, and fiber \(\mathbb C^{2^{24}}\). On that carrier the book keeps the original CAR \(\{\theta,\theta\}=\delta I\), the charge formula, and
\[
H_{\mathrm{phys}}=\frac1{16}T^\dagger T
\]
on the natural domain. Those formulas match `Core.lean` and the BE probe text. The book is also unusually careful about evidence class. Historical FCP receipts are not silently promoted to the current integration tree. Operator-algebra Spin(9) results are not silently promoted to Fock-vector unitaries. Auxiliary `End` fibers are not silently promoted to `FullL2`.

The unresolved weakness that actually controls the science is the join from that operator to a high-type coercive estimate. Abstract first-moment compactness is not confinement. The illustrative margin \(14-8\sqrt3>0\) is arithmetic inside a conditional estimate, not a theorem about \(H_{\mathrm{phys}}\). Nothing in the inspected source produces a positive eigenpair, compact resolvent, or a mass gap for this Hamiltonian.

The unification chapters are in the right logical state: dimension counts and one real no-go, no Standard Model.

## II. Critical findings

### F1. Slice exclusion is not the integrated coercive form
Severity: Major. Chapter 13, “The proposed global coercivity mechanism,” display (eq:sector-coercivity-target) and the margin (eq:sector-example-margin). Also A/B audit §4, which the chapter compresses.

The chapter treats
\[
\beta T+W\ge 2\sqrt\beta\,(m+9)\,I(e_1)
\]
as available once low oscillator levels are absent on slices. That implication is not proved. Globally, for the concrete wedge potential,
\[
V(X)\ge r^2\bigl(\|z_2\|^2+\|z_3\|^2\bigr),
\]
where \(r=\|X^1\|\) and \(z_2,z_3\perp X^1\), because
\[
\|X^1\wedge X^2\|^2=r^2\|z_2\|^2
\]
and likewise for \(X^3\), while \(\|X^2\wedge X^3\|^2\ge0\). So the transverse symbol really is an oscillator. Passing from “each slice is orthogonal to levels \(0,\ldots,m\)” to a lower bound on \(\tfrac12\|\nabla\psi\|_2^2+\int V|\psi|^2\) still requires a global coordinate theorem: moving-frame derivatives, the Jacobian of \((u,t,z)\), degeneracy at \(r=0\), and control of angular derivatives of the axis. None of that is in the chapter. The audit itself introduces the inequality with “assume … so …”.

This does not make the displayed margin false. It means the margin is not yet an estimate for \(q_{\mathrm{phys}}\).

Smallest correction: split the claim into three open lemmas — global potential comparison, Fubini in the one-color frame, and graph-core transfer to \(\operatorname{Dom}(T)\) — and keep \(14-8\sqrt3\) attached only to the last conditional corollary.

### F2. The factor \(\sqrt\beta\), rather than \(2\sqrt\beta\), is correct but not derived in the book
Severity: Moderate. Same section of Chapter 13.

The oscillator \(-\beta\Delta_z+r^2\|z\|^2\) on \(\mathbb R^{16}\) has level \(n\) at \(2\sqrt\beta\,r(n+8)\). The first allowed level is \(n=m+1\), hence \(2\sqrt\beta\,r(m+9)\). The sphere average in the A/B audit gives \(I(v)\ge\tfrac12 J\), with equality on rank one. The product is
\[
2\sqrt\beta\,(m+9)\cdot\tfrac12 J=\sqrt\beta\,(m+9)\,J.
\]
The monograph states only the cancelled coefficient. A reader who restores the oscillator factor and forgets the sharp average \(\tfrac12\) will think the margin was halved by a mistake; a reader who does the reverse will double it.

I recomputed the finite-dimensional constant independently. With
\[
K_{(b\beta),(c\delta)}=\sqrt2\sum_{a,i}\varepsilon_{abc}x_i^a(\gamma_i)_{\beta\delta},
\quad
B=\frac i2\sum_{p,q}K_{pq}\theta_p\theta_q,
\]
one has \(\|K\|_{\mathrm{HS}}^2=64\|X\|^2\), so \(\sum_j a_j^2=32\|X\|^2\) in the skew normal form. Each block \(ia_j\theta'_1\theta'_2\) has norm \(a_j/2\) because \((\theta_1\theta_2)^2=-I/4\). Then
\[
\|B\|\le\tfrac12\sum_j a_j\le\tfrac12\sqrt{24\cdot32}\,\|X\|=8\sqrt3\,\|X\|.
\]
That arithmetic is right. It is an upper bound for the audit’s \(B\), not yet a Lean theorem that this \(B\) equals `deformedFermionField 1 0`. The book already says so. The diagnostic identification should stay in the hypothesis list of the proposition, not only in the formalization record.

Smallest correction: print the two-line cancellation \(2\times\tfrac12\) next to (eq:sector-example-margin).

### F3. Full-space coercivity is false for the reason the book suspects, and the escaping sequence can be written
Severity: Major as a scientific constraint; the book does not assert the false theorem. Chapter 10, valleys, and Chapter 13, “Hostile escape states.”

A classical rank-one point is not a state. The following is the state that would kill a first-moment bound on the whole physical space. Let the transverse zero-point of \(-\beta\Delta_z+r^2\|z\|^2\) cancel, or nearly cancel, the fermionic linear term, as supersymmetry requires on the valley ground band. Place a slow gauge-invariant wave packet of width \(\sqrt R\) at distance \(R\) along that band, with longitudinal momentum \(O(R^{-1})\). Then \(\|\psi_R\|_2=1\), \(q(\psi_R)\) stays bounded (in the expected channel it tends to 0), and \(M_1(\psi_R)\to\infty\). That is a Weyl sequence. It contradicts
\[
q(\psi)+b\|\psi\|^2\ge c\int\|X\|\,|\psi|^2
\]
on any reducing subspace that contains the packet, and it contradicts compact resolvent of the full \(H_{\mathrm{phys}}\).

This sequence sits in low Spin(9) types if the packet is nearly radial. It does not by itself kill a sector with \(\lambda_2\) above the exclusion threshold. It does kill any writeup that drops the sector hypothesis.

The construction is not yet a theorem inside \(\operatorname{Dom}(T)\): the valley ground bundle has not been built from the original charges in the notes I read. Recent numerical work is consistent with it. Abstracts of Bajaj–Lin, arXiv:2611.14512, and Michel–Scheinpflug–Yin, arXiv:2611.09837, report a normalizable ground state, continuum or resonances, and extra positive-energy bound states in some \(\mathrm{SO}(9)\) irreps. I have not audited those papers. They are external pressure, not Lean evidence. The monograph does not cite them.

Smallest correction: add this Weyl sequence as an explicit obstruction to unsectored coercivity, labeled “conditional on a valley channel in the original form domain,” and point to those abstracts as numerical context rather than as proofs.

### F4. The vector-fiber threshold is one Cartan bound, not a finished branching theorem
Severity: Moderate. Chapter 13, “six-versus-twelve,” and the 7 November exclusion note §2.

For the operator fiber the note does the right extra work: the generator \(-iL\) has spectrum in \([-12,12]\), and the face \((12,0,0,0)\) is shown to be a highest weight of \(B_4\). For the original Fock vector, “spectrum in \([-6,6]\)” does imply that every weight has first orthogonal coordinate at most 6, provided \(L\) is the infinitesimal generator of the same torus used in the branching rule. That implementer is exactly the missing continuous Fock-vector lift. Using \(\lambda_2>m+6\) before the lift exists would be a false theorem. The book does not claim it is proved. The sentence “the physical threshold would be \(\lambda_2>17\)” is still easy to quote without the hypothesis.

Smallest correction: state \(\nu_1\le 6\) only as “eigenvalue bound for this Cartan, if \(L\) implements the source rotation on \(\mathcal F\)”.

### F5. Dependency narratives are labeled proofs
Severity: Moderate. Chapters 3, 4, 5, 6, and 7. The environments are `theorem`/`proof`, and the proof text is often “the Lean file composes A with B.”

That is an evidence map, not a conventional proof. It is acceptable in an onboarding monograph only if the environment says so in the heading, not only in a trailing formalization record. As written, a later chapter can cite “Theorem (historically qualified)” and a reader can drop the adjective.

Smallest correction: rename these environments to “Source-account” or put the qualification in the theorem name and in the first sentence of the statement, which the better chapters already do.

### F6. Atlas scope and SHA hygiene
Severity: Minor. Theorem atlas versus Chapter 5; cards S-07 and S-08.

The Gauss-kernel characterization (`L6H5E8AA`, Actions `38994451291`) is stated as a historically qualified theorem and is not one of the 37 atlas rows. S-07 and S-08 are linked at `65f9de5f` while the book’s authority line is `d4870eb1`. The files exist at the baseline; the links should say so. I did not replay either Actions run.

No critical sign error, dimension error, or false identification of \(H_{\mathrm{phys}}\) turned up in the formulas I compared with Lean.

## III. Theorem-by-theorem qualification

Statuses are the book’s own, checked against source text where noted. “Match” means the displayed formula agrees with the file I opened. It does not mean I recompiled the proof.

| ID | Claim | Assessment |
|---|---|---|
| D-01, D-02, D-03 | Carriers, CAR, charges, \(q_0=\tfrac1{16}\sum\|Q_\alpha\|^2\) | Match `Core.lean`. `Fermion N` is `EuclideanSpace ℂ (Fin (2^(8*(N^2-1))))`. For \(N=2\), dimension \(2^{24}\). \(\theta^2=I/2\). `gammaTwo` has the factor \(1/2\). Bracket is \(-i[X,Y]\). Not a spectral theorem |
| G-01 | Physical space closed | Definition pattern matches the prose. `GaugeCore.lean` was not read line by line |
| G-02 | Nonzero physical \(L^2\) bump | Historically qualified per the atlas. Not recompiled. A nonzero value at one point is correctly not treated as an \(L^2\) proof; the chapter uses continuity and positive volume |
| G-03 | Nonzero invariant Fock vector | Integrated receipt cited. Fiber fact only. Not recompiled |
| H-01–H-03 | Dense domain, \(H=\tfrac1{16}T^\dagger T\), historical identity | BE probe text defines `originalMinimalPhysicalNormalizedHamiltonian` as `(1/16 : ℂ) • adjointSquare` on `physicalSpace`, with `IsSelfAdjoint` and weak-form iff theorems. Dependencies not recompiled. Current `let` versus historical `letI` is a real port difference. Classification `HISTORICAL_STRICT` is the correct one |
| F-01, F-02 | Clifford–Fock equivalence | Not recompiled. The conventional rank argument in Chapter 3 does not replace M3H/M3I. Algebra isomorphism is not a unitary Spin(9) action. That limitation is correctly stated |
| S-01, S-02, S-09, S-10 | Axis stabilizer: path-connected, compact, 2-sheeted cover, \(H\simeq\mathrm{SO}(8)\) | Not recompiled. The quotient argument (continuous surjection from compact \((S^7)^8\) onto a Hausdorff group is a closed quotient map) is standard and correctly applied if \(\Phi\) is continuous and onto. Covering \(K\to H\) is not an identification of representation rings with standard \(\operatorname{Spin}(8)\) |
| S-03–S-05 | Star automorphisms and trace | Not recompiled. The HS isometry in Chapter 8 is a correct corollary of a star automorphism that preserves trace. It is an action on \(\operatorname{End}\), dimension \(2^{48}\) |
| S-06–S-08 | Label commutation and one-sided gamma compatibility | Files present at the baseline. Not recompiled. Label commutation does not give commuting Fock unitaries |
| A-01 | Massless core-energy identity | `averaged_core_energy` in `DeformedCharge.lean` has kinetic coefficient \(1/2\), and `deformedFermionField` already includes the factor \(1/16\) in front of `remainderField`. The identity is generic in `AlgebraData`. It does not bind the Pauli wedge |
| A-02–A-04 | First-moment compactness | The cutoff estimate \(R\|u-\varphi u\|_2^2\le M_1(u)\) is correct. These theorems do not know what \(H_{\mathrm{phys}}\) is |
| N-01–N-04 | Normalized Gram field bounded and pointwise in \(L^2\) | Not recompiled. Correctly separated from the unnormalized linear field in the energy identity |
| N-05 | Representative transport | Correctly left `PENDING_STRICT_GATE` |
| C-01 | Oscillator exclusion on `End`-valued \(L^2\) | I read the argument. Under its hypotheses (continuous \(G\)-action on operator-valued functions, \(\nu_1\le n+12\), interlacing \(\nu_1\ge\lambda_2\)) the disjoint-type argument is valid, and the strict inequality is necessary. Hypotheses are not the original physical representation |
| C-02, O-01–O-05 | Coercivity, covariance, compact resolvent of a sector | Open, as labeled |
| Chapter 5 Gauss theorem | Kernel of the three strong generators equals the invariant subspace | Not in the 37-row atlas. Not recompiled |
| Chapter 9 closed-form transport | Core intertwiner plus graph core implies \(H\) invariance | Standard and correctly conditional. For this \(T\), “graph core” holds by construction of the minimal closure once the core identity is known |
| Chapter 15, no three rank-one color projectors | Commutant of the adjoint \(\mathrm{SU}(2)\) action on \(\mathbb R^3\) is scalars | Proof is correct. It blocks only the naive generation identification |
| Chapter 16 antipodal projector obstruction | \(P_+(-n)=P_-(n)\), and \(c\mapsto -c\) is realized by a \(\pi\)-rotation in \(\mathrm{SO}(3)\) | The square is a real obstruction to a labelled \(P_+\) on the unoriented valley. It does not obstruct an unordered pair of eigenbundles |

## IV. Unresolved dependencies

```text
Core.lean carriers, CAR, Q_α, q_0
        │
        ├─ GaugeCore physical subspace  (nonzero: historical G-02 only)
        │       │
        │       └─ minimal closed column T on H_phys
        │               └─ H = (1/16) T†T          historical H-02, H-03
        │
        ├─ massless core identity A-01 on SmoothCore
        │       └─ OPEN: B_source = audit field, ‖B‖ ≤ C‖X‖
        │
        ├─ Spin(9) on 48 labels, axis cover, End-star action
        │       └─ OPEN O-01: continuous U(g) on F = ℂ^(2^24),
        │                     gauge compatible, all 16 charges intertwine,
        │                     graph-core transport to Dom(T)
        │
        └─ abstract moment compactness A-02–A-04
                └─ needs form-domain comparison with Dom(T)

O-01 + source branching + non-empty infinite-dim sector
        └─ slice exclusion (only written for End-valued L²)
                └─ OPEN: frame/Fubini/Jacobian ⇒ sector coercivity O-04
                        └─ OPEN: coercivity ⇒ weighted-closure hypotheses
                                └─ THEN compact resolvent on that sector O-05
```

Nothing below O-01 feeds back into the existence of \(H_{\mathrm{phys}}\). The operator does not depend on the spectral program.

## V. Spectral program

Verdict: conditionally viable. Not established. Not blocked. Incorrect if the sector hypothesis or the original Hamiltonian is dropped.

The implication that is actually standard is the last one. A closed semibounded form whose unit ball is compact in the Hilbert space has compact resolvent. On an infinite-dimensional reducing subspace one then gets discrete eigenvalues of finite multiplicity tending to \(+\infty\). That does not yield a gap for the rest of \(H_{\mathrm{phys}}\).

The proposed reason the inequality might be true in a high type, and false in a low type, is the right one. On the valley the bosonic potential contributes a transverse oscillator of frequency proportional to radius. Supersymmetry is expected to cancel that linear zero-point against the fermion term on the ground band, leaving a non-confining channel. Forbidding levels \(0,\ldots,m\) leaves a surplus linear in radius. After the sharp color average, the audit’s conservative surplus is \(\sqrt\beta\,(m+9)-8\sqrt3\). At \(\beta=0.49\) and \(m=11\) this is \(14-8\sqrt3>0\) because \(196>192\). For the operator fiber that \(m\) requires \(\lambda_2>23\). For a future vector lift with first coordinate at most 6 it would require \(\lambda_2>17\). Those are different theorems.

I do not see a cheap counterexample that kills every high-type version. The escaping packet of F3 lives where the low oscillator band is allowed. The places a high-type proof can still die are concrete:

- the Fock-vector lift does not exist with the central sign required by \(R_{48}(z)=-I_{48}\);
- the physical projection of that isotype is \(\{0\}\);
- frame derivatives eat the surplus \(14-8\sqrt3\);
- the true \(\|B\|\) on the configurations the sector actually uses exceeds the oscillator credit (the constant \(8\sqrt3\) is global and conservative; the audit’s rank-one value \(8\sqrt2\) is smaller);
- the sector reduces the form but not the operator domain of \(T^\dagger T\).

Compact resolvent of the unrestricted physical Hamiltonian should be treated as false until someone proves there is no valley channel. I would not spend formalization effort on it.

## VI. Unification

| Idea | Plausibility | Source fidelity | Falsifiability | Rank |
|---|---|---|---|---|
| Three adjoint colors are three generations | None | Contradicts the source gauge action | Already false | Reject |
| Spatial Spin(9) spinor \(16_{\mathbb R}\) equals a chiral Spin(10) GUT multiplet | Low | Same dimension under \(\operatorname{Spin}(9)\subset\operatorname{Spin}(10)\), different physical action | Needs a map of carriers and a hypercharge spectrum | Do not pursue as an identification |
| Spin(8) triality as a family symmetry | Low until the stabilizer representation on the original Fock space exists | Axis cover is \(\operatorname{Spin}\to\mathrm{SO}\), not triality on \(\mathcal F\) | Branching of the actual module either matches or it does not | After O-01 only |
| Gauge-invariant Majorana bilinears | Moderate as algebra, low as phenomenology | Must be singlets of the real source \(u(g)\) and of \(H_{\mathrm{phys}}\) | Commutant calculation; prediction of a quantum number | Worth a bounded calculation |
| Hopf \(S^7\to S^{15}\to S^8\) from \(\Gamma(n)=\sum n_i\gamma_i\) | Moderate as geometry of the 16 | Source gammas give \(P_\pm(n)\) of rank 8 | Antipodal test already kills labelled \(P_+\) on \(\mathbb{RP}^8\) | Keep the no-go; do not add dynamics |
| Category-theoretic descent / emergent spacetime | Not a theory | No functor from the original operators to a 4d chiral QFT is defined | No observable | Not a research theorem |

The color no-go is the one result I would call proved at textbook level. The adjoint representation of \(\mathrm{SU}(2)\) on \(\mathbb R^3\) is irreducible, so a gauge-commuting endomorphism is scalar, and a scalar projection has rank 3 or 0. Three invariant rank-one color labels do not exist.

The Spin(10) coincidence fails for a sharper reason than “the dimensions might be accidental.” Restriction of either chiral \(\mathbf{16}\) of \(\operatorname{Spin}(10)\) to \(\operatorname{Spin}(9)\) is the same real 16. The source 16 is the index of a spatial gamma matrix in a nine-dimensional vector representation. An internal GUT multiplet would have to commute with the spacetime little group, or be built from it by an explicit dimensional reduction. No such intertwiner is defined on \(\mathscr H_{\mathrm{phys}}\). Writing \(\mathrm{Cl}(16)^{\otimes 3}\) also fails: the 48 generators are one Clifford algebra, and the cross-color bivectors are inside \(\mathfrak{so}(48)\), not a superselection rule.

A next construction, if any, has to start from singlets. Minimal requirements: an observable \(\mathcal O(X)\) on the original Fock fiber with \(\mathcal O(g\cdot X)=U(g)\mathcal O(X)U(g)^{-1}\) for the actual gauge unitary, a proof that it preserves \(\operatorname{Dom}(H_{\mathrm{phys}})\), and one quantum number that is not just a Cartan of spatial Spin(9). If that quantum number cannot be distinguished from the spatial weights already in the spectral program, the construction is not particle physics. Lean strategy: one lemma that the adjoint representation’s commutant is the scalars, on the same `GaugeData` color matrices already in source, and nothing else.

## VII. Monograph

The evidence vocabulary and the refusal to identify 27 matrix entries with 27 spacetime dimensions are the right contract for a new collaborator. Keep that.

Concrete changes:

- Put qualification in theorem titles. “Proof” should mean a proof from stated hypotheses. “Source-account” should mean a pointer to a Lean declaration.
- In Chapter 13, derive \(\sqrt\beta\,(m+9)\) from \(2\sqrt\beta\,(m+9)\) and \(I\ge J/2\) in the text, and insert the frame/Fubini lemma as an open problem rather than as a participle.
- State the full-space Weyl sequence next to the valley equation in Chapter 10, so nobody “repairs” the argument by deleting the sector.
- One normalization table already lives in the notation appendix. The charge chapter, the energy chapter, and the A/B audit should point to the same symbols for \(B\), \(K\), and the \(1/16\) inside `deformedFermionField`.
- Add the Gauss theorem to the atlas or stop calling it accepted in the same voice as H-02.
- Pin every atlas URL to `d4870eb1`, and mention descendant commits only when the statement changed.
- Cite the two November 2026 numerical abstracts as external checks, clearly not as formal input.
- Leave Chapters 15–17 in a separate part. They are already fenced; do not let a later revision move the color no-go into the spectral chain as motivation.

## VIII. Roadmap

Each item is pass/fail. None of them is a GUT task.

1. Valley lower bound, conventional. Prove \(V\ge r^2(\|z_2\|^2+\|z_3\|^2)\) for the paired Pauli data from `deformedBosonicPotential 1 0`, not only for the printed wedge. Prerequisite: A-01 and the color-normalization lemma. Fail if the source potential differs by a positive constant factor large enough to change \(m\). Value: removes an implicit identification.

2. Source-typed bound \(\|B(X)\|\le 8\sqrt3\|X\|\). Prove the audit’s \(B\) equals `deformedFermionField 1 0` as fiber operators, then the skew-normal-form estimate. Prerequisite: CAR as in `Core.lean`. Pass: a Lean inequality on the original \(\theta\). Fail: any sign or \(1/16\) mismatch. Value: turns O-02 into a finite theorem. Do not wait for the sharp constant.

3. One-color frame estimate. Prove or refute
   \[
   \tfrac12\|\nabla\psi\|_2^2+\int V|\psi|^2
   \ge \beta\|\nabla_z\psi\|_2^2+\int r^2\|z\|^2|\psi|^2
   \]
   for gauge-invariant core functions, with an explicit error supported near \(r=0\). Pass: inequality with a controlled error. Fail: a core sequence where the left side stays finite and the right side does not. Value: this is the real analytic gap.

4. Negative theorem for the unsectored form. Construct a sequence in the original invariant core with \(q\) bounded and \(M_1\to\infty\), or prove no such sequence exists. Prerequisite: a valley quasimode whose energy is \(o(R)\). Pass/fail is the existence of the sequence. Value: locks the sector hypothesis in place. Likely pass on the “sequence exists” side if the channel can be built; that would still not touch a high type.

5. Fock-vector lift, source-exact. Produce a continuous homomorphism \(G_9\to U(\mathcal F)\) implementing the original 48-label action, with \(z_9\) acting as fermion parity up to a fixed phase, or prove that no strongly continuous lift exists. Prerequisite: S-03 and the relation \(R_{48}(z_9)=-I\). Pass: the homomorphism plus the CAR identity. Fail: a cocycle obstruction. Value: without this, \(\lambda_2>m+6\) cannot be used. The `End` action is not a substitute.

6. Charge intertwiner on the invariant core. For that same \(U\), prove \(T U_g = S_g T\) on \(\mathscr D_{\mathrm{phys}}\) for all sixteen charges, then apply the Chapter 9 transport lemma. Pass: identity on generators of the core graph. Fail: one charge component that picks up a cocycle. Value: this is O-01.

7. Nonempty infinite-dimensional physical isotype. Exhibit a concrete nonzero family in \(\mathscr H_{\mathrm{phys}}\cap\mathcal H_\lambda\) for one \(\lambda\) with \(\lambda_2\) above the threshold that belongs to the same carrier as the exclusion theorem. The \((24,24,0,0)\) example in the exclusion note is on the operator fiber; it does not count. Pass: infinitely many orthogonal physical core vectors of that type. Fail: the physical projection of that type is zero. Value: otherwise compact resolvent is a theorem about the zero space.

8. Sector coercivity. Combine 2, 3, 6, and 7 to prove or refute (eq:sector-coercivity-target) on that sector’s smooth core, with constants traced to \(\beta\), \(m\), and \(C_B\). Pass: \(c>0\). Fail: a normalized sequence in the sector with \(q\) bounded and \(M_1\to\infty\). Value: this is the scientific fork.

9. Domain transfer and spectral corollary. Only after 8: identify the form domain with the weighted-closure triple used by A-04, then invoke the compact-resolvent theorem on that reducing subspace. Pass: compact resolvent of the sector operator. Explicitly do not claim a gap for \(H_{\mathrm{phys}}\). Fail: the form domain is strictly larger than the closure the compactness theorem knows about.

I would not open a Lean project on 9 before 2 and 3 are settled in ordinary mathematics. The repository already has enough qualified analysis to reuse; the missing pieces are identifications and one analytic inequality.

## IX. Recommendation

Suitable as an internal mathematical research reference with minor corrections.

The book’s contract, carrier definitions, charge normalization, and refusal to promote historical receipts, operator fibers, or exploratory numerology are sound. I checked the charge, CAR, core form, and normalized Hamiltonian declaration against source and found agreement. The spectral and unification claims that would make the manuscript unsound are already marked open or impossible.

It would require major revision only if it were offered as a self-contained proof of confinement or as evidence for a GUT. It is not. The corrections in F1, F2, and F3 should go into the next edition before anyone uses Chapter 13 as a derivation rather than as a research plan. I did not recompile Lean. A green citation in the atlas remains, for me, a citation.