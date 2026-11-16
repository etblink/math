# BFSS Spin(9) top-down structural outline — one bounded abstract theorem with exact source obligations

**Date:** 2026-11-15 Pacific.  
**Repository / branch:** `etblink/math`, `research/bfss-spin9-structural-outline-20261115`, originally based on unified integration head `d8abb410437e0caf442dc34ff7c7d7f200dca03e`.  
**Scope:** a small Lean structural theorem and independent consumer; NO modification of unified integration, the qualified IBI PR #2, or `main`.  
**Evidence status:** P1 staged; **NOT GREEN** until cold pinned Lean, independent consumer and axiom report qualify.

## Drawing the outline before details

The goal is a **conditional** mathematical Spin(9)-singlet charge-norm identity, typed on the original `FullL2 2` in the independent consumer and on generic complex Hilbert modules in the reusable mathematical layer:

\[
\bigl(\forall g, U_g\psi=\psi\bigr)
\ \land\ 
Q(\rho_g v) U_g\eta=U_gQ(v)\eta
\ \land\ 
\rho(G)\text{ transitive on the real sixteen-spinor unit sphere}
\Longrightarrow\
\|Q(e_\alpha)\psi\|^2={1\over16}\sum_{\beta=1}^{16}\|Q(e_\beta)\psi\|^2.
\]

Here the fully quantified common invariant **domain** `D : Set H` is mandatory; no physical unbounded charge is invented as a globally bounded operator. The actual theorem uses a group homomorphism into real linear-isometry-equivalences on the spinor carrier, a group homomorphism into complex linear-isometry-equivalences on the Hilbert carrier, `hD` preserving the common domain, and `hCov` on that domain. A fixed-domain vector `ψ : D` and `hSinglet` are separate. The source-free theorem first derives norm invariance along spinor orbits, then equality on the sixteen chosen basis vectors, then the exact factor `1/16`. The separate theorem on spin/gauge fixedness assumes genuine Hilbert-unitary commutation, not 48-label matrix commutation.

### Proof architecture (three layers)

- **Layer 1, pure mathematics:** `BFSSSpin9AbstractPhysicalOutline.lean`, no original BFSS source import. Six axiom-audited results: norm on group orbit, equal basis norms, finite 16-square sum, exact 16-average, sphere transitivity specialization, and gauge-fixed-space preservation.
- **Layer 2, original carrier adapter:** independent `BFSSSpin9AbstractPhysicalOutlineIndependentConsumer.lean` imports original `Core.lean` and the abstract source. Uses actual `OAI.BFSSQuantum.FullL2 2` (not an invented Fock state space). Still keeps unproved group action, invariant domain, supercharge mapping and covariance as explicit parameters. Three independent source-typed consumers and three axiom reports.
- **Layer 3, physical discharge:** prove or source-qualify each named premise below against the **actual** original boson/Fock gauge and source Spin(9) representation, on a legitimate common operator domain. Only after all prerequisites are met could the abstract norm theorem be instantiated as a **physical** result. Do not conflate abstract lemma acceptance with this stage.

### Obligation map — supported algebra versus unproved physical interfaces

| Premise/step | Current evidence in frozen unified tree | Status at top-down outline |
| --- | --- | --- |
| Spin(9) algebraic source group, Clifford representation and orthogonal real 16 action | `SU2BFSSPairedSpin9SourceSpinGammaOrthogonalProbe.lean`; `OP3C4OriginalRealCliffordSpinAction.lean` | Source declarations present; exact-gate qualification/typed pure-to-native adapter must be checked; **no physical unitary follows** |
| Original 48-real-label Spin(9) transformation | `SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean` | Algebraic color-index transport exists |
| Original 48-label SU2/Spin(9) commutation | `C48C0OriginalSpinGaugeMajoranaCommutation.lean` | Matrix source identity only, not fixed-space unitary commutation |
| Actual original Fock **operator algebra** automorphism and active normalized gamma covariance | `OP3C6AOriginalFockOperatorSpinAction.lean`, `OP3C6COriginalFockActiveGammaCovariance.lean` | Source-algebraic; no proof that the automorphism is star-preserving and implemented by a strong-continuous original Fock-vector unitary |
| Genuine original SU2 Fock unitary action on all real 48 Majorana vectors | `TDC1AOriginalGaugeUnitaryFull48GammaCovariance.lean` | Existing source theorem; its previous qualification must be matched to exact bytes. SU2 action does **not** manufacture a Spin(9) action |
| Global original `U : Spin(9) →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2)` | Not established by OP3C6A or C48C0 | **OPEN**; top-down `U` is an explicit premise |
| Genuine spinor sphere transitivity, on actual gamma 16-real carrier | Classical Spin(9)/Spin(7) action on the unit sphere; not presently source-bound at this exact interface | **OPEN Lean bridge**. A physical covariance theorem may use only basis transitivity, which is weaker and sufficient |
| Original common dense invariant domain and its Spin9 invariance | Source original smooth core and AY joint charge graph/physical fixed-space chain; G14/G15 accepted scope | **OPEN** as a domain-preserving Spin9 action. Abstract `D` is an explicit set, not an accidental bounded-domain assumption |
| Original sixteen-supercharge Spin9 covariance | Original gamma, theta, G14/G15 finite algebraic identities | **OPEN** on original physical domain; exact coefficients/signs of `Q\) fixed by source, no invented normalization |
| Nonzero gauge-fixed Spin(9)-singlet within charge domain | Gauge invariance alone does not imply Spin9 singlet | **OPEN** with nontriviality obligation; even proof of conditional norm theorem alone does not exhibit such state |
| True unitary commutation of Spin9 and SU2 on `FullL2 2` | C48C0 source 48-label commutation; TD-C1A SU2 gamma intertwiner | **OPEN** at true physical action level; second abstract theorem isolates it |
| Native source individual-charge norm vs regulated core form | G15 accepted tau contraction; individual-charge square-difference proposal in `P3_AUX_CERT_FORWARD_RESEARCH_EQUAL_NORM_SPINOR_SQUARE_DIFFERENCE_2026_11_15.md` | **OPEN**. Even equal charge norms are not a Hamiltonian/Hardy/spectral certificate without form-domain alignment |

### Octonionic incidence: one optional reconstruction leg

The original nine gamma matrices supply a concrete signed-permutation block pattern with the seven source Fano triples and source-derived candidate octonionic multiplication. An independently defined positive three-form / signed incidence algebra could recover the source gamma action **if** an explicit real-linear and norm-preserving equivalence to the original gamma matrix representation passes native Lean. This is a separate falsifiable comparison, not a prerequisite to proving the **abstract** equal-charge theorem. A source-independent sign-flip control and an explicit nonassociativity witness remain useful later. Do not treat \(\mathbb O\), its \(G_2\) automorphisms, \(Spin(9)\) transverse rotations and \(SU(2)\) color gauge as interchangeable groups.

## Stop rules and promotion boundary

1. **P0:** freeze this structural outline and list every hypothesis before additional fine-scale modules.
2. **P1:** stage exactly one pure generic theorem module, one genuinely independent consumer on `FullL2 2`, and one cold strict workflow.
3. **P2:** qualify every declared theorem, source/consumer, and the standard-only axioms `propext`, `Classical.choice`, `Quot.sound`; preserve first-causal red and exact tested SHA.
4. **P3:** target **one** promising unproved bridge: original native spinor 16 action and common invariant-domain/singlet covariance contract. No speculative octonionic expansion or further module proliferation unless that bridge yields a direct original-physical consumer or an unusually economical alternative.
5. **Hard stop:** never claim a new BFSS invariant singlet, physical unitary Spin9 implementation, an individual-charge norm theorem in the actual theory, Hardy/fidelity inequality, mass gap, a grand unification of observed forces or incidence-first ontology from an abstract implication.

**Promotion:** the original physical unified branch remains unmodified. If the stand-alone outline qualifies, place its exact signed statement and evidence before any source integration; a separate owner-authorized promotion follows source checks, not branch popularity or number of green gates.

## Comparison with previous top-down work

TD-C1A demonstrated that a mathematical layer can be tiny and sound while native joins fail at Lean recursion/type normalization boundaries. Retain abstract operator-intertwiner helpers, but do not infer a physical implementer. In this outline, the proof complexity is concentrated in source adapters, not in the 16-average algebraic consequence. Scientific prioritization changes only when some named physical source premise is discharged.
