# The Relative SU(2) BFSS Quantum System

## Edition 0.10.0 rewrite prospectus and opening draft

**Working subtitle** *Closed Supercharges and the Zero-Energy Existence Problem*  
**Internal draft, November 27, 2026 Pacific**  
**Evidence snapshot** [Unified integration at d705080099be](https://github.com/etblink/math/commit/d705080099bebf0fb5feecd7a49d177d51a08889)

The rewrite starts from the 20-chapter Edition 0.9.1 and the November 22 editorial plan. The new organizing question is whether the original relative $\mathrm{SU}(2)$ Hamiltonian has a normalizable zero-energy state, and which conclusions follow from the evidence already in hand. The audience remains internal research leads and collaborators with graduate linear algebra and basic Hilbert space theory. The manuscript should give an operator theorist a continuous proof to read and give an incoming lead a way to trace each premise to its source. [Edition 0.9.1 master](main.tex) · [Edition 0.9.1 build record](BUILD_VALIDATION_0_9_1_2026_11_23.md) · [November 22 editorial plan](https://chatgpt.com/library?file_id=libfile_04a986de62ac8191871cc94c4013e69e&account_id=personal)

## Proposed contents and migration

The new sequence opens with the existence statement, constructs the objects it concerns, and follows the analysis and the computation until they meet in a single implication. The physical Hilbert space and normalization are defined before the first proof. Results on topology and empirical adequacy have their own questions and appear after the finite-model argument.

| Part | Proposed chapters | Material to carry forward |
| --- | --- | --- |
| I. The existence problem | 1. A zero-energy state in the relative model · 2. The original carriers, gauge action, and sixteen charges | Scope, carriers, Clifford realization, charges, gauge space. State the physical fixed-space definition and identify the paired source data and the 16-component Hilbert sum. |
| II. From the core to the Hamiltonian | 3. The native Hamiltonian and the massless interaction · 4. Individual charge closures on the invariant core · 5. The common square | Native Hamiltonian, source-domain comparisons and the massless multiplier. Introduce graph closure and Haar projection before the common-domain and weak-form proofs. Retain the maximal multiplier result with its exact domain. |
| III. From a trial state to an existence certificate | 6. Spin(9) on physical states · 7. Weighted charges, Hardy estimate, and fidelity · 8. Constructing and checking an exact witness · 9. Assembling the conditional existence argument | Spin and gauge covariance, weighted fidelity, source energy. Separate the Fock-vector action from the Fock-operator action. Add the packed seed, covariant polynomial reconstruction, exact Gaussian integration and the raw contraction replay obligation. |
| IV. Independent routes and physical comparisons | 10. Localization, escape, and the spectral questions · 11. Relational topology and particle structure · 12. Standard Model benchmarks and tests of emergence | Energy geometry, compactness, conditional zero-mode criteria, positive point spectrum, Hopf and representation results, SCC and empirical comparisons. Place the normalized Gram/Fock field with its exact auxiliary hypotheses. |
| Appendices | A. Notation and normalization · B. Theorem atlas and source receipts · C. Historical lineage and limits of earlier arguments · D. Reproduction and edition crosswalk | The existing four appendices, proof practice, and time-sensitive parts of the frontier chapter. Record a crosswalk for each old chapter and each cited theorem before the edition is assembled. |

The charter governs the treatment of physical interpretation. Chapter 12 can be read independently as a benchmark for any proposed correspondence. It should display the observables, the typed map a candidate would have to supply, and the tests capable of discriminating among candidates. Earlier counterexamples and scope limits belong next to the inference they constrain. [Truth-First Foundational Research Charter](../../../research/methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md) · [Standard Model and SCC chapter](chapters/standard_model_scc.tex) · [Edition 0.9.1 negative knowledge appendix](appendices/negative_knowledge.tex)

## What the central chapters can claim at this snapshot

| Result or argument | Evidence available for the draft |
| --- | --- |
| Physical joint graph, common domain, and literal individual core closure | UGC4 identifies the restricted joint graph with the physical-input slice of the full graph. ICD-C0 identifies the paired individual and joint input domains. NAG2 supplies individual self-adjointness, NAG3 identifies the closure of the literal invariant-core operator, and NAG4 R2 explicitly qualifies its essential self-adjointness. Record the exact receipts for each statement. |
| $\overline Q_\alpha^2=H$ as a natural operator equality | Analytical route with source formalization pending. Establish the complex core pairing, extend it in both arguments across the joint graph closure, identify the normalized Hilbert-sum pairing on the common domain, then compare the weak-representative graphs. The weak-form step gives both domain equality and equality of outputs. |
| CSQ-F0 R2 | Run [#46080283383](https://github.com/etblink/math/actions/runs/46080283383) was in progress at the snapshot. Exact candidate is [ec95064573a2](https://github.com/etblink/math/commit/ec95064573a2455c3cccaae76d4640f90d9721a2). Its scope is the core complex pairing and double closure transport. The later normalized-form and weak-graph steps have separate obligations. |
| Spinor covariance, trial admissibility, and the Hardy estimate | Analytical arguments at this cutoff. Display where the genuine Spin(9) action on Fock vectors, the physical graph domain, and the weighted singlet trial enter. Keep the Hardy coefficient and compressed isotropy calculation visible. |
| Weighted energy of the polynomial-Gaussian trial | The 104-function construction is the full worked example. The archive reports 58,458 exact comparisons of archived contraction values and 79 full-rank designs. An independent Gaussian-moment assembly reproduced 16,380 matrix entries using the contraction polynomials. These establish coefficient lineage and integral assembly within the audited scope. Independent source-exact raw contraction replay remains open. |
| Reduced witness and physical consequence | The 52-row, 12-core witness is the first reduced replay target. The 56-row witness is the fallback. Favor missing rank-two rectangular derivative blocks and then rank-three coverage. Existence follows conditionally from verified source premises and a positive fidelity lower bound. Existence, uniqueness, a mass gap, and empirical adequacy carry distinct claims. |

Use the historical theorem atlas and the physical existence atlas pilot to index the chapter claims. The pilot identifies logical prerequisites such as the common domain and pairing. It records NAG3 and NAG4 as qualification milestones. The direct square argument can obtain its graph approximation through the individual/joint graph adapters, so neither milestone should be inserted as a prerequisite by chronology alone. [Historical theorem atlas](THEOREM_ATLAS.json) · [Physical existence atlas pilot](../../../research/methodology/SCIENTIFIC_KNOWLEDGE_ATLAS_PHYSICAL_EXISTENCE_PILOT.json) · [NAG4 R2 qualification](../../../research/computational/python-first-20261124/bfss-physical-implication/NAG4_R2_GREEN_QUALIFIED_2026_11_27.md) · [Direct pairing and witness coverage audit](../../../research/computational/python-first-20261124/bfss-physical-implication/NAG4_INTERVAL_DIRECT_CLOSED_PAIRING_AND_WITNESS_COVERAGE_2026_11_27.md)

## Opening draft

### A zero-energy state in the relative model

Does the original relative $\mathrm{SU}(2)$ BFSS Hamiltonian admit a normalizable state of energy zero? The question concerns an operator on a specific Hilbert space. A configuration is a real $3\times9$ matrix $X$. The fermionic carrier is the complex $2^{24}$-dimensional Fock space of the original forty-eight Majorana operators. The physical Hilbert space $E$ is the fixed space of the diagonal gauge action on square-integrable Fock-valued wavefunctions. The Hamiltonian $H$ is the nonnegative self-adjoint operator defined by the original closed charge column $T$ with its Hilbert-sum norm. In these conventions,

$$
H=\tfrac1{16}T^\ast T,\qquad
h[u]=\tfrac1{16}\|Tu\|^2,\qquad D(h)=D(T).
$$

We seek a unit vector in $\ker H$. A unit trial vector $\psi$ can establish existence through the squared norm of its projection onto that kernel. If

$$
F(\psi)=\|P_{\ker H}\psi\|^2>0,
$$

then the projected vector, divided by its norm, is a normalizable zero-energy state. The problem is to bound this projection using quantities that can be evaluated on an explicit trial vector. The charge energy of the trial alone would require additional spectral information to give such a bound. The route developed here uses spatial symmetry and a weighted estimate for the spinor-valued charge outputs. [Native Hamiltonian exposition](chapters/ch06_hamiltonian.tex) · [Weighted charge exposition](chapters/weighted_fidelity.tex)

The first task is to identify the closed individual charges. On the invariant smooth core, source symmetry and the equality of the formal squares give the equality of the complex pairings $\langle Q_\alpha f,Q_\alpha g\rangle$ for all spin labels $\alpha$. With one graph point held fixed, the equality persists under closure in the other graph variable by continuity. Repeating this for the first variable yields the pairing identity on the closed column graph. The exact domain and graph-component identifications then relate the form $\langle \overline Q_\alpha u,\overline Q_\alpha v\rangle$ to $h(u,v)$. A weak representative of either form on their common domain satisfies the same testing identity. Thus, once the source interfaces are instantiated, the weak form identifies both the natural square domain and the action of every $\overline Q_\alpha^2$ with those of $H$. Essential self-adjointness of the literal invariant-core charges is qualified. This common-square identification is an analytical argument at the present cutoff. [November 26 analytical audit](../../../research/computational/python-first-20261124/bfss-physical-implication/POST_ICD_ESA_MAXIMAL_GRAPH_MOLLIFIER_AND_SQUARE_AUDIT_2026_11_26.md) · [Direct pairing audit](../../../research/computational/python-first-20261124/bfss-physical-implication/NAG4_INTERVAL_DIRECT_CLOSED_PAIRING_AND_WITNESS_COVERAGE_2026_11_27.md)

The second task is to make the weighted estimate and the trial calculation meet on the same source operator. Let $r=\|X\|$, let $\delta>0$ be a radial regulator, and put

$$
q_\delta[\psi]=\tfrac1{16}\sum_{\alpha=1}^{16}
   \big\|\sqrt{r^2+\delta^2}\,\overline Q_\alpha\psi\big\|^2 .
$$

For a unit physical Spin(9) singlet with weighted charge outputs, the common-square identity, Spin(9) covariance on the physical graph domain, and the spinor Hardy estimate give the conditional bound

$$
F(\psi)\ \ge\ 1-\kappa q_\delta[\psi],\qquad
\kappa=\tfrac{36+8\sqrt{14}}{25}.
$$

In this argument the spectral resolvent shift goes to zero with $\delta$ fixed. For every positive $\delta$ the projection is onto the same unweighted kernel. The polynomial-Gaussian trial has a conservative conditional bound $q_1[\psi]<3/8$. Together with $\kappa<66/25$, that endpoint already gives $F(\psi)>1/100$ under the stated premises. The trial chapter shows how finite source contractions, global polynomial identities, and Gaussian integration produce the energy bound, and identifies which finite values still require independent source replay. [End-to-end source implication](../../../research/computational/python-first-20261124/bfss-physical-implication/README.md) · [Positive-regulator analysis](../../../research/computational/python-first-20261124/bfss-physical-implication/FORWARD_ANALYTICAL_RESEARCH_2026_11_25.md) · [Independent integral audit](../../../research/computational/python-first-20261124/bfss-independent-integrals/README.md)

The existence argument will therefore be stated with the exact premises used in the operator and witness chapters. A proof of existence would answer a spectral question for this finite model. Claims about particle content or observed physics require an additional correspondence and comparisons with experiment. Those requirements hold independently of how the spectral question is resolved. [Truth-First Foundational Research Charter](../../../research/methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md)

## Drafting sequence and edition checks

1. Write the carrier and closed-operator chapters from the original definitions through the qualified literal-core closure. Define square-domain equality once. Use the joint graph, common domain, normalized pairing and Hamiltonian weak form as the outline of the common-square chapter. Update its evidence note only when the corresponding exact receipt is available.
2. Draft the full positive-regulator implication from source covariance through Hardy and the resolvent to the kernel. Walk the 104-function witness through seed, contractions, reconstruction, integration and the rational endpoint. State the reduced replay objective alongside the recorded coverage. Give independent localization and escape routes their own hypotheses and endpoints.
3. Rebuild the topology, particle structure, and empirical chapters around the questions their results can answer. Use the existing comparison with Michel, Scheinpflug, and Yin and the historical source accounts. Record the specific convention mapping for each result the rewrite uses.
4. At assembly, choose a pinned edition cutoff, resolve the old chapter and theorem references, and link each load-bearing claim to its declaration or derivation and evidence. Check the notation for the 16-component normalization, regulator versus resolvent shift, and spinor versus Fock-operator actions. Run the adapted manuscript and citation audits, compile the TeX locally, and inspect the resulting PDF and links before a numbered release.
