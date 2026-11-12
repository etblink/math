# Internal monograph — revised 17-chapter architecture, edition 0.5

## Edition 0.5 milestone: 11 November 2026

Chapters 12--14 now contain substantive mathematics and research synthesis. Chapters 15--17 are intentionally **prospective, falsifiable research chapters**, not announcements of a GUT or ToE. The original physical model and exact Lean evidence remain unchanged. The review process uses locally compiled LaTeX, source-path verification and independently cross-checked historical notes, not GitHub Actions.

**Mathematical sequence:** (1) exact source carrier and charges, (2) native physical Hamiltonian, (3) source Spin(9), original Fock and gauge actions, (4) original energy and abstract compactness, (5) normalized auxiliary Gram field, (6) conditional high-spin oscillator confinement and open form-domain join, (7) truth-first unification prospects.

**Prospective part:** Ch.15 representation/particle-family tests; Ch.16 Hopf/projective topology and gauge descent; Ch.17 physical emergence, GUT/ToE criteria and observational falsifiability. These chapters must never be read as source-physical or empirically qualified results.

# Internal monograph — verified chapter architecture v0.1

## v0.4 original energy and first-moment compactness milestone — 11 November 2026

- **Substantive Chapters 10–11 added.** Chapter 10 gives the original `q_core=1/16 sum ||Qα||²` and the *qualified* source-generic massless energy identity; explains the Pauli wedge rank-one flat valleys, original unnormalized linear fermionic field, conditional `8 sqrt(3)` finite-CAR bound, and why the source physical coercivity gap survives the energy identity. Chapter 11 proves the cutoff first-moment estimate, local Rellich mechanism, global core tightness and the accepted weighted Sobolev triple-closure implication. It states only a *conditional* physical-sector compact-resolvent consequence.
- **Chronology preserved:** October FCP G4–K9D #38011995220 and D2B23–25 original physical closed-form machinery precede the November source energy/compactness strict qualifications #42315568670, #42318037096, #42320696105, #42325087575. Earlier documents whose status said `pending` are read as dated snapshots.
- **Crucial non-equivalence:** historical `Dom(T)` form-graph completeness is not definitionally the `weightedClosure` of triples `(u,gradient u,w·u)`. A physical-sector source-typed gradient/moment inequality and genuine domain map are necessary before composing them.
- **No false promotion:** the analytical finite coefficient estimate `||B(X)|| ≤ 8√3||X||` is not a current Lean source theorem; the auxiliary normalized Gram multiplier is not the original unbounded linear fermionic term; no Spin9 reducing sector, eigenvalue or full mass-gap theorem is asserted.
- **Documentation provenance:** mathematical base `etblink/math@d4870eb1ac58`; editorial parent `c348da90a3db`; same 37 atlas records, refined evidence commentary, no Lean source, consumer, manifests or Actions modifications.

## v0.3 source-symmetry narrative milestone — 11 November 2026

- **Substantive Chapters 7–9 added:** source (9) spatial action and original ninth-axis stabilizer, its connected compact 8-word quotient, two-sheeted covering and concrete target `SO(8)` equivalence; original active 48-Majorana covariance, full Fock-operator `StarAlgEquiv` action, actual trace invariance and the algebraic Hilbert–Schmidt consequence; actual C48-0/C48-0B source `SU(2)` label commutation and C48-1A0 active-gamma compatibility.
- **Recovered accepted evidence that supersedes older statuses:** source axis covering strict #42452043377; `H≃SO(8)` coordinate equivalence strict #42498367504; C48-0 strict #42779878513; C48-0B strict #42787913738; C48-1A0 strict #42798054277. All tested exact source/consumer gates at historical integration commits; no new Lean proofs generated for this manuscript.
- **Preserved remaining critical boundaries:** no unqualified identification of source `K` with a vector-compatible standard Spin(8) covering/branching theorem; no automatic physical Fock-vector implementer from operator automorphisms; no deduction from 48-label commutation to true gauge Fock-unitary fixedness; no original physical sixteen-charge source closed-form covariance; no new eigenpair or mass gap.
- **Chronological research appendix strengthened:** October FCP S3L source covariance and rejected monolithic assembly precede the November original 48-label, stabilizer, full operator-star/trace developments. Early handoff `pending` statuses are corrected only when exact subsequent qualification is verified.
- **Source baseline:** original `etblink/math@d4870eb1ac58`; monograph branch evidence and current manuscript build are independent of Actions/Pages/webhooks. The theorem atlas now has **37 records**, up from 33.

## v0.2 draft progress — 11 November 2026

- **Substantive narrative drafted:** Chapter 2 original carriers and $L^2$; Chapter 3 gamma/48-Majorana/24-mode Clifford--Fock representation; Chapter 4 literal source sixteen charges and core form; Chapter 5 gauge actions, physical Hilbert space, nonzero physical states and maximal Gauss kernel; Chapter 6 native closed physical charge, BA--BH historical source Hamiltonian, its adjoint square, natural domain and weak form.
- **Historical chronology added:** `appendices/historical_lineage.tex` and full source/run crosswalk `HISTORICAL_LINEAGE.md`, read in dated FCP → unified integration sequence. Older handoff statuses are labelled as historical; new accepted results supersede them only for their exact source typed obligations.
- **Status discipline:** The first five drafted chapters contain conventional proof explanations and exact formalization references but do not purport to reproduce entire original Lean proofs in prose. Later chapters remain outlines. The actual original physical sector Spin(9) covariance and spectral coercivity remain open.
- **Build:** Local `latexmk` / `pdflatex`, no network/Actions/Pages/webhooks. 43-page v0.2 review edition, zero warnings and zero overfull lines at final source snapshot.


**Working title:** *The Relative SU(2) BFSS Quantum System: Mathematical Construction, Formal Verification, and the Spectral Research Frontier*

**Audience:** An independent mathematician or mathematical physicist joining the project. **Not** an external-paper draft, proof of a mass gap, or an assertion of M-theory equivalence.

**Working source snapshot:** `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`. Mathematical bibliography and historical provenance are to be checked individually before prose is accepted. **Each cited result below is keyed to `THEOREM_ATLAS.json`; the numbering is editorial, not the Lean import DAG.**

## Editorial contract

The manuscript should read as a rigorous mathematical story, not as a chronology of CI runs. Each chapter should explain (i) the obstacle motivating the construction, (ii) the exact definitions and hypotheses, (iii) a conventional mathematical proof or explicit reason why it is still open, (iv) how the result enables the next chapter, and (v) an unobtrusive but exact *Formalization Record* linking to source, declaration, tested commit, and allowed axioms. Do not use a green workflow as a substitute for a proof in the text.

Evidence labels are fixed: **source definition**, **historical strict qualification**, **integrated strict qualification**, **source present / receipt not yet checked**, **candidate pending strict gate**, **conditional mathematical argument**, and **open proof obligation**. Historical green does not imply an edited imported module is qualified on this branch. Errors in the current book must be corrected; negative knowledge and chronology remain immutable in Git and the existing ledgers.

The mathematical model is the relative `N=2` supersymmetric matrix quantum mechanics with **nine spatial indices**, **three adjoint color indices**, **16 real spinor indices**, and **48 real Majorana labels**. The 27 real bosonic coefficients are configuration coordinates, not physical spacetime dimensions. The eleven-dimensional M-theory interpretation is not assumed. Future models with genuinely different dynamics require separate definitions and names.

## Part I — Defining the original quantum system

### Chapter 1. Scope, physical context, and the research problem
**Central question:** What exactly is being investigated, and what would constitute a valid spectral result?

1. Explain the difference between the mathematical BFSS matrix Hamiltonian and the proposed eleven-dimensional M-theory interpretation. State that this program studies the source-exact relative SU(2) quantum system without requiring a physical equivalence to M-theory.
2. Separate a positive-energy eigenvalue in a fixed reducing sector from a global mass gap or ground-state existence.
3. Introduce the three proof chains and where they must meet: native physical Hamiltonian; Spin(9)/gauge representation; unnormalized energy and compactness.
4. Place the source-truth and claim-status policies before mathematical statements.

**Evidence:** atlas D-01, D-03, H-02, O-05; source recap and conditional frontier notes. **Open:** interpretation and ultimate theorem should emerge from proofs.

### Chapter 2. Carriers, indices, function spaces, and notation
**Central question:** What are the actual degrees of freedom, and on which Hilbert spaces do our theorems live?

1. Define `SpaceIndex = Fin 9`, `ColorIndex 2 = Fin 3`, `SpinIndex = Fin 16`, `Boson 2`, `Fermion 2`, `FullL2 2`, and `SmoothCore 2`.
2. Explain the 27 real bosonic coefficients, 48 Majorana labels, 24 complex Fock modes, and fermionic dimension `2^24`, carefully separating spatial, color, and Fock dimensions.
3. Establish notation for vector-valued wavefunctions, operator-valued fibers, almost-everywhere equivalence, and compact smooth cores.
4. Clarify real versus complex scalar structures and inner-product conventions as they occur in Lean.

**Evidence:** D-01; `Core.lean`. **Critical boundary:** pointwise field boundedness is not an `L²` statement on an infinite-volume space.

### Chapter 3. Clifford algebra, Majoranas, and the original Fock realization
**Central question:** Why is the fermionic algebra represented on this exact Fock carrier?

1. Explain source `AlgebraData`, gamma anticommutation relations, original 48-real theta CAR and normalizations (`theta` vs normalized gamma).
2. Tell the proof story of original Clifford action faithfulness and algebra equivalence M3H/M3I, including the unchanged 2^24 Fock carrier.
3. Explain the distinction between an algebra automorphism, a Fock-vector unitary implementer, and central signs in a Spin lift.
4. Record the `letI` style-linter case only as a concise technical note, not a scientific doubt about an already accepted algebra-equivalence theorem.

**Evidence:** D-02, F-01, F-02. **Open:** independent manuscript Clifford module intertwiner if needed.

### Chapter 4. Sixteen supercharges and the normalized smooth-core form
**Central question:** How does the formal source algebra generate the original dynamics?

1. Introduce the exact original source charge formula rather than an approximate or modified Hamiltonian.
2. Define `chargeVector`, its 16 output components, and `coreForm = (1/16) sum ||Q_alpha f||²`.
3. Explain source core symmetry and why operator domains matter immediately when attempting closure.
4. Preview the source massless energy identity without claiming it is already a high-sector coercivity estimate.

**Evidence:** D-03, A-01. **Open:** full physical Spin covariance of all 16 charges.

## Part II — The physical SU(2) Hilbert space and its Hamiltonian

### Chapter 5. Color gauge symmetry, physical states, and nontriviality
**Central question:** Why is the gauge-invariant physical sector mathematically genuine rather than a formal kernel?

1. Define original SU(2) bosonic pullback and fermionic fiber action on the actual `FullL2 2` carrier.
2. Give the closed gauge-invariant `physicalSpace` definition.
3. Explain the historical source-verified nonzero normalizable radial physical state, and separately the integrated exact SU2-invariant Fock vacuum/projection.
4. Contrast fiber invariance, bosonic wavefunction invariance, Gauss constraints, and the not-yet-proved spatial symmetry of the physical Hamiltonian.

**Evidence:** G-01, G-02, G-03. **Open:** all required Spin9-to-gauge physical projection commutation.

### Chapter 6. The native physical closed charge and self-adjoint Hamiltonian
**Central question:** How do we pass from a symmetric core expression to an actual natural-domain operator?

1. Reconstruct BA original physical charge domain density, using exactly the true source `G.physicalSpace` carrier.
2. Explain the dense closed charge `T`, adjoint `T†`, natural domain of `T†T`, nonnegative form, self-adjointness and factor `1/16`.
3. Tell the BH theorem story: equality of the native and historical paired normalized Hamiltonians including *their full domains*, not just agreement on test functions.
4. Document historical strict-green vs current imported-port qualification, and the local `let`/`letI` linter caution without reopening proven mathematics.

**Evidence:** H-01, H-02, H-03. **Open:** source Spin9 reducing-sector and coercivity for this identical closed operator; not its basic construction.

## Part III — Spatial symmetry and the representation bridge

### Chapter 7. Source Spin(9), the ninth-axis stabilizer, and topology
**Central question:** Which group actually acts, what is fixed, and which spin signs are retained?

1. Present the actual nine-dimensional source quadratic and Spin(9) group, rather than a convenience replacement group.
2. Explain original word parametrization, PBW topology, path-connectedness and compactness of the genuine axis stabilizer.
3. Distinguish a continuous compact group/stabilizer from a fully source-bound Spin8 representation-theoretic branching classification.
4. Clarify how an auxiliary topological project (such as a Hopf tower) would need explicit mathematical binding to enter this theorem chain.

**Evidence:** S-01, S-02. **Open:** exact stabilizer representation/branching with the required center and normalization.

### Chapter 8. The original Fock-operator action, star structure, and trace
**Central question:** What does our Spin(9) action demonstrably preserve?

1. Narrate the original all-48-vector gamma crosswalk and operator algebra covariance.
2. Establish the difference between algebraic action, star-preserving action, finite-dimensional trace invariance, and continuity.
3. Explain why trace preservation suggests a Hilbert–Schmidt route, yet does not identify that operator fiber with the physical Fock-vector Hilbert space.
4. Show how preserving the central sign is necessary for any later vector implementation or stabilizer analysis.

**Evidence:** S-03, S-04, S-05. **Open:** continuous source-gauge-compatible action on the correct physical carrier.

### Chapter 9. Gauge compatibility, full supercharge covariance, and reducing sectors
**Central question:** Which symmetry relations are still required to act on the *closed physical Hamiltonian*?

1. Reuse original source Spin9/adjoint-color 48-label commutation precisely; do not infer Fock-unitary commutation from matrix commutation alone.
2. Describe original G4E unitary and physical gauge projection interfaces as applicable.
3. State exact full sixteen-charge covariance and closed-domain form invariance as *open* source obligations, without inserting them as hidden assumptions.
4. Explain what it takes to define bounded isotypic character projectors on the physical Hilbert space and show resolvent commutation.

**Evidence:** S-06, O-01, H-02. **Open:** P1 and reducing-sector portion of P3; no false group-lift claim.

## Part IV — Analysis and the prospective spectral mechanism

### Chapter 10. The unnormalized original energy and the fermionic growth problem
**Central question:** How can the actual massless source core form control spatial escape?

1. Present the strict-qualified massless charge/core-energy identity and keep the original gamma/Pauli/color conventions explicit.
2. Recover and distinguish scalar bosonic quartic confinement from the linearly growing original fermionic term.
3. Describe the conditional finite-matrix norm estimate `||B(X)|| <= 8 sqrt(3) ||X||`, including why finite diagnostics are not a general Lean norm proof.
4. Explain why a verified finite constant `C` may suffice for qualitative confinement in sufficiently high sectors, instead of pursuing sharp constants first.

**Evidence:** A-01, O-02; A/B audits. **Open:** source-typed original unnormalized linear-growth bound and exact physical field binding.

### Chapter 11. From first radial moment to compactness
**Central question:** Which part of the compactness route is already a theorem, and what hypotheses does it require?

1. Explain local Rellich compactness with original gradient control.
2. Explain global tightness from `int ||X|| ||f(X)||²` and the cutoff error.
3. Explain the weighted closure theorem and how it converts uniform weighted graph bounds to total boundedness.
4. Mark that the *actual physical form* must still supply the bounds and membership hypotheses.

**Evidence:** A-02, A-03, A-04. **Open:** coercive energy-to-moment transfer.

### Chapter 12. The normalized auxiliary Fock-field program
**Central question:** What is the normalized observable useful for, and what does it not prove?

1. Show the difference between quadratic Gram numerator divided by `1 + trace` and the original unnormalized *linear* fermionic field.
2. Explain NORM0C uniform field bound, actual original `FullL2` pointwise image, and a.e.-representative-safe carrier bridge.
3. Explain the pending representative-class transport strict gate without guessing its outcome and present D2 continuous complex-linear `L²` multiplier as a future bounded step.
4. State why this auxiliary program must not be silently promoted to a confinement estimate or claimed spectral critical path.

**Evidence:** N-01 to N-05. **Open:** D2 and the precise physical relation of the normalized auxiliary field.

### Chapter 13. Oscillator exclusion, high Spin type, radial coercivity, and potential eigenpairs
**Central question:** Can the nonzero original physical high-weight sectors rule out escape to infinity?

1. Present the conditional original whole-isotypic oscillator exclusion proof, finite cyclic orbit method, and correct transverse eigenlevels.
2. Keep the **Fock-vector first-weight bound 6** separate from the **operator-valued first-weight bound 12**, including why `lambda_2 > m + 12` is needed for the latter.
3. Present conditional global averaging and a conservative first-moment estimate only with its exact P1/P2/P3 premises.
4. Join the open source exact symmetry, field-bound and physical form-domain gates to the already proven compactness theorem; state the precise meaning of positive point spectrum in a reducing sector.
5. Document adversarial rank-one valley/escaping-state tests and preservation of negative knowledge.

**Evidence:** C-01, C-02, O-03, O-04, O-05; H-03 and A-04. **Open:** definitive source physical-sector estimate and eigenpairs.

## Part V — Research synthesis (Chapter 14)

### Chapter 14. The theorem frontier, alternate routes, and publication boundary
**Central question:** What should a future expert prove or falsify next, with minimum duplicated work?

1. Revisit the three proof chains and rank unresolved joins by scientific importance, not by CI throughput.
2. Give proof DAG nodes, exact Lean source locations, historical accepted green and meaningful negative failures.
3. Explain alternative operator-valued Hilbert–Schmidt and original Fock-vector routes and what bridge would permit their interchange.
4. Separate exploratory topology/three-generation ideas from the current source-exact Hamiltonian; admit them only with precise definitions and theorems.
5. Define the completion standard of an internal edition (accurate snapshot) vs a finished research theorem; outline later external monograph extraction and independent peer scrutiny.

**Evidence:** O-01 to O-05, the qualified physical source chain, and existing research memoranda. **Open:** no whole-system mass-gap claim.

## Appendices: source fidelity without breaking the narrative

- **A. Formalization atlas:** full typed original declaration and source-blob map; generated from the `THEOREM_ATLAS.json` records, with explicit historical/current statuses.
- **B. Mathematical notation and normalization:** sign conventions, theta/gamma square factors, spin action, SU2 color, sixteen-charge `1/16` normalization, and real/complex inner-product conventions.
- **C. Proof and dependency diagrams:** distinguish the logical proof DAG from the Lean import DAG and from the editorial chapter sequence.
- **D. Negative knowledge and adversarial fixtures:** false invariance/closure shortcuts, overstrong branching claims, sharpness counterexamples, failed source-preserving tactics, and mathematical vs lint/CI failures.
- **E. Reproducibility:** original exact sources and acceptance receipts, no external services required for the book build, independent consumer rules and how to reproduce local LaTeX.
- **F. Bibliography:** independently verified foundational BFSS, representation-theory, and functional-analysis references, not automatically imported from other manuscripts.

## Drafting order (different from reading order)

1. Approve the notation, exact model identity and evidence statuses (this blueprint + atlas).
2. Write Chapters 2–6 in full, with independent checked source mathematical statements before explanatory storytelling.
3. Write Chapters 7–9, requiring explicit vector/operator carrier separation.
4. Write Chapters 10–13 with conditional statements fenced from strict-verified facts.
5. Write Chapter 1, Chapter 14 and appendices last to avoid imposing an outcome on the mathematics.
6. Repeat local LaTeX compilation and narrative/theorem audits; do not rely on Actions, Pages, webhooks or any continuous GitHub service for document validity.


## Part VI — prospective unification research

### Chapter 15. Spin and particles
Original 3x16 label factorization and SU(2) adjoint mixing; real Spin(9) versus complex chiral Spin(10) restrictions; commutant obstruction; source-typed counterexamples before family counting. **Not a three-generation model.**

### Chapter 16. Hopf and projective gauge descent
Actual gamma(n) eigenspaces, antipodal exchange, Hopf-type clutching, gauge-natural projector obstruction, conditional bundle-characteristic-class no-descent; distinct quadratic-bilinear decompositions; no chiral index or spectral inference without a physical operator.

### Chapter 17. Physical emergence and theory selection
Separate the model mathematical system, a possible emergent 3+1-dimensional field theory, a predictive GUT, and a ToE including gravity. Rank the necessary representation, gauge, topology, closed-domain, and empirical gates and keep rejected candidates in the negative-knowledge record.
