# P3 forward research — original BFSS spectral route via physical operator columns

**Date:** 2026-11-12 Pacific. **Status:** READ-ONLY MATHEMATICAL/SOURCE AUDIT, NO NEW LEAN QUALIFICATION.  
**Repository:** etblink/math; unified integration/bfss-unified-research-20261108.  
**Concurrent gate:** P2-C4B #43207104792, testing source SHA 557bc77149419ad6be33656f1c164b2197878f0f. **NO RESULT IS ASSUMED.**
**Project Lead constraint:** original undeformed relative SU(2) BFSS operator and domain; positive point spectrum is a possible eventual objective, not an accepted theorem; no new branch.

## 1. Recovered historical strategy, not a newly invented theory

The November 6 memorandum contributions/bfss-kotler/BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md, Git blob 946678699eb0028b139ef1f1e3f5e62f23677e33, already describes (Sections D, I.3–I.6, V) a **finite-column amplification of the original physical Hamiltonian** and conditional eigenpair transfer from a reducing high-Spin(9) operator-valued sector. The November 7 whole-sector memo BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md, blob 8354f9fa03ae434a46367c1694af4a86ee9fb233, supplies a conditional operator-Cartan threshold and high-type witness.

This is renewed prioritization in light of subsequent original-source qualifications, NOT a discovery invented this turn. Historically held claims must remain held until their exact source/consumer Lean gates pass.

Key conclusion: the missing global original Fock-VECTOR Spin(9) implementing unitary is **not logically mandatory** for positive eigenpair existence if the operator-column bridge below can instead be source-verified. It remains useful for stronger native symmetry statements.

## 2. Exact finite-column transfer lemma (mathematical, unformalized in current source)

Let F = original Fermion 2 complex Hilbert space, d = dim_C F = 2^24, and A = End_C(F) with the Hilbert–Schmidt norm Tr(T* T)^(1/2). Use the FULL A carrier, not a new Fock module, and form

    K = L²(Boson 2, A),     K_phys = {T : G_h T = T for all h in SU(2)},
    (G_h T)(X) = U_h T(h^(-1) · X),

where U_h is the genuine original SU(2) Fock-vector unitary acting by LEFT multiplication on the operator output. The operator input index is inert under gauge. This is NOT adjoint/conjugation gauge invariance of T.

Fix any constant orthonormal input basis e_1,...,e_d of the original F. Columnization

    Col(T) = (T e_1,...,T e_d)

is a unitary identification of K_phys with H_phys^(direct-sum d), the d copies of the actual original gauge-physical FullL2 space, with Hilbert–Schmidt norm identity

    ||T||_HS² = sum_j ||T e_j||_F².

If H_phys is the historical original self-adjoint normalized (1/16)T_charge* T_charge on its EXACT NATURAL DOMAIN, define on that direct sum

    D(H_tilde) = direct-sum_j D(H_phys),
    H_tilde(T) = Col^(-1)((H_phys (T e_j))_j).

This is finite amplification, **not a replacement Hamiltonian**. Its form is precisely the sum of original closed forms on its exact direct-sum form domain; the original core identities are columnwise.

Elementary eigenpair transfer, conditional on the exact domain identification:

    H_tilde Ψ = E Ψ, Ψ ≠ 0
    => for all j, ψ_j in D(H_phys) and H_phys ψ_j = E ψ_j;
       for some j, ψ_j ≠ 0.

Hence a nonzero amplified physical eigenvector yields an eigenvector of the actual original H_phys. This implication is a trivial finite direct-sum theorem, not an eigenpair-existence proof. A finite-dimensional amplification may have an operator-valued Spin(9) symmetry not explicitly realized on individual Fock vectors; columnization need not intertwine that symmetry to transfer an eigenpair.

The **graph equality and form-core equality** are separate required source Lean gates; equality merely on formal expressions or smooth functions is insufficient.

## 3. Exact recovered current-source infrastructure

- P2-C0 accepted original Pauli bosonic potential and C2 accepted literal original finite fermion growth with explicit coefficient C0. P2-C3 accepted normalized original massless core energy and pointwise density. P2-C4A accepted integral form inequality WITH TWO EXPLICIT INTEGRABILITY PREMISES, strict run #43204455519 on b704d126b4bbacd23fee6176f6b7717200ebc266. P2-C4B attempts to discharge exactly these premises on original SmoothCore 2 and is currently pending.
- FCP historical BA/BE/BF/BG/BH original physical Hamiltonian self-adjoint/source-domain chain accepted at historically pinned commits, including BH run #39096180117; the edited/import-rewritten current-tree BH port is not automatically requalified.
- OP3C6COriginalFockActiveGammaCovariance.lean, blob 2d6f777568b0026737112ff8256e5ed50fc9e6e6, gives algebraic Spin(9) covariance on ALL original 48 Majorana real labels, on genuine Fermion 2 bounded operators.
- P2bB3OriginalFockStarAutomorphismAction.lean, blob b50ef04695587b267ad8519074b1293f98828749, upgrades that group homomorphism to the physical-Hilbert-adjoint-preserving star algebra action on A. This is **algebraic**, not yet a proved continuous unitary representation of the source compact topological Spin(9) on A.
- T1OriginalFockTraceInvariance.lean, blob 3be6c9a6f2898484df66690f94fdfa1877660897, proves invariance of the ordinary original Fock trace on A under that exact star action.
- The original source Spin(9) is compact in its inherited PBW topology under the historically qualified compactness gate #42397460623 (eight original compactness roots, per November 6 Section V). Do not substitute an independently selected compact Spin(9) without the explicit source topology action bridge.
- C48C0OriginalSpinGaugeMajoranaCommutation.lean, blob 9f9a5ce2186ded98a251efbc24c2b66f416044d5, proves the source-original 48 paired-label spatial Spin(9) and SU(2) color matrices commute.
- The genuine original Fock gauge unitary, fixed-subspace orthogonal projection and nonzero gauge-fixed vacuum are already represented by OP2aOriginalFockGaugeSource.lean, OP2bOriginalGaugeProjectionBridge.lean (blob 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec), and OP2cNonzeroOriginalGaugeVacuum.lean (blob a16d3573b737bb4453e42b0b543d63cbbac1cd1b).
- S1HSourceGaugeCovariantImplementerUniquenessProbe.lean, blob eacab43f1b9112e9e1920e656bdf1166f824a5a8, already states exact SU(2) SOURCE REPRESENTATION UNIQUENESS when an arbitrary gauge-group multiplicative linear equivalence V has the literal pairedTheta color covariance. Its premise is explicit and MUST be proved for any candidate V. S1G's gauge relative-character-triviality proof is behind it and need not be re-created if this exact imported interface qualifies.
- Existing original G4HExactThetaCovarianceProbe.lean, blob 7f4a93221c8f1168b274155f482e2f5c61f72786, is the genuine paired-theta gauge covariance donor; C48C1A0, C48C1A1d0 are narrow source Spin/gauge axis compatibility bridges.

**Status discipline:** source file presence, historical green statements and analytic lemmas have different evidence. For each proposed new theorem, verify source closure at the exact tested SHA and a separate importable consumer; do not claim every S1H/C48 source bridge has been requalified in a newly created target without checking its own provenance.

## 4. Smaller first proof gates via already accepted source algebra, no Fock-vector lift

### P3-OP1: ordinary original Fock trace polarization and HS isometry

For source Spin group g and original bounded operators T,S, write alpha_g for the existing star automorphism. Algebra homomorphism, physical star compatibility, and original trace invariance imply

    Tr((alpha_g T)* (alpha_g S))
      = Tr(alpha_g(T* S))
      = Tr(T* S).

Thus alpha_g preserves the actual finite-dimensional Hilbert–Schmidt inner product; in particular ||alpha_g T||_HS = ||T||_HS. Proof should import only B3/T1 existing modules and trace/adjoint identifications; do not enumerate 2^48 Clifford words or claim a Fock-vector unitary. An independent consumer should test T=S and polarization on a separate T,S pair. This is an attractive SMALL source-exact next gate after P2-C4B acceptance.

### P3-OP2: continuity and genuine source compact-group action

B3 constructs an algebraic group/monoid action. To use Haar averages, isotypic projections and whole-sector oscillator exclusion, prove the MAP (g,T) -> alpha_g(T) is continuous in the original PBW Spin(9) topology. A plausible route is: source 48-label matrix action continuous on all gamma generators; those generate the original full finite-dimensional A via the existing Clifford/Fock algebra equivalence; pointwise continuity on a spanning finite family yields all-operator continuity because finite-dimensional linear maps are continuous. This is a proposed proof sketch, not an inherited certified continuity theorem. Source compactness alone does not imply continuity of an arbitrarily defined algebraic action.

**Center control:** negative source Spin(9) central element acts on original Majorana labels as -I_48, hence alpha_{-1} is conjugation by Fock parity, not scalar -1 on A. Retain full Spin(9), not an unjustified SO(9) descent.

### P3-OP3: exact SU(2) left-output compatibility using S1H reuse

Genuine gauge representation U_h acts on F. The source alpha_g acts on A. To preserve the original left-output gauge action, we need

    alpha_g(U_h) = U_h       for every g in source Spin(9), h in original SU(2).

The accepted/source-listed identities for original gamma covariance and commutation of R_spin48 with R_color48 show alpha_g(U_h) conjugates all original Majoranas by the SAME color matrix as U_h. One may package h -> alpha_g(U_h) as an original-Fock complex-linear-equivalence MonoidHom (group law inherited from star algebra hom), then apply the EXISTING S1H original_source_gauge_representation_unique theorem, once its explicit hV source pairedTheta covariance is connected. This avoids redoing SU(2) character-triviality from scratch.

The remaining nontrivial atomic joins are exactly the active/donor theta normalization, the source 48-label order, and the inverse action orientation. An axis-only identity does not automatically yield all-vector covariance; use a separate finite-basis linearity consumer. If the target S1H import closure is too costly, preserve a narrower direct-character alternative. Do not define the missing scalar phase to be one.

With alpha_g(U_h)=U_h, the spatial+operator pullback commutes with the genuine left-output gauge action and hence preserves K_phys.

### P3-OP4: original core/form covariance and reduction

Prove the actual source bosonic SO(9) potential and fermionic B_original(X) transform under the source alpha_g, with the correct source spinor charge mixing and sign orientation; then prove source smooth-core invariance and the original closed physical (1/16) T_charge* T_charge graph/form covariance under the combined A-valued spatial action. This has NOT followed from P2-C4A/B or Majorana covariance alone.

At this stage construct the genuine compact-group Hilbert-space action on K_phys, bounded form-norm type projections, and exact same-sector form core. Do not assume the operator-valued isotypic subspace automatically reduces the closed Hamiltonian.

## 5. Conditional qualitative coercivity, no sharp constant dependency

The historical B4 -> D4 whole-sector oscillator theorem is still an ANALYTICAL CONDITIONAL proof on the operator carrier, with source Spin(8) representation identification and stabilizer branching unqualified. Its full End(F) first-Cartan threshold is **M=12** (because of the dual input), NOT the Fock-vector M=6. Retain the strict condition

    lambda_2 > m+12

for exclusion of oscillator levels 0,...,m on the ENTIRE source-identified operator-valued isotypic smooth core. Vanishing only for one polynomial test function does NOT substitute for full isotypic exclusion.

The November 6 scalar color-rotation averaging proof is applicable to the full Spin isotypic smooth core without requiring that the BOSON-ONLY color rotations preserve the gauge-fixed subspace; it rotates only the bosonic kinetic+quartic scalar form, **not the fermionic energy density**. The final inequality on a gauge-physical Spin type is obtained by restricting an estimate proved on the larger full isotypic space. Avoid false gauge invariance of the rotated state.

Let C0 be the exact nonnegative, finite SOURCE growth constant now P2-C2 green. Take beta=1/4; choose integer m with (m+9)/2 > C0, and integer k with 2k>m+12. Since C0 is finite, these numerical choices are possible without ever proving C0<=96 or the sharp bound 8sqrt(3). Under the remaining source spectral/action/exclusion hypotheses, the potential FIRST MOMENT comparison would be

    q_tilde(T) >= (1/4) ||grad T||²
             + ((m+9)/2 - C0) ∫ ||X|| ||T(X)||_HS² .

This is STILL CONDITIONAL on original physical core/form identification and the full-type oscillator exclusion. It is not a new Lean theorem.

For sector nonemptiness, the source gauge-invariant complex-bilinear Gram highest polynomial P(X) of type (2,2,0,0), and its powers P(X)^k, were constructed ANALYTICALLY in the November 7 memo. A nonzero SU(2)-fixed original Fock vacuum exists. With continuous alpha and exact gauge compatibility, the Spin Haar average of its rank-one projector T0 is nonzero, positive and trace-one, Spin fixed and LEFT-gauge fixed; then cutoff(r) P(X)^k T0 is a proposed original source physical high-type core witness. A possible alternative reuses OP2b's nonzero gauge-fixed projection if one proves it alpha-invariant; neither shortcut is automatic.

If exact closed-form coercivity and compact embedding are eventually proven on a nonempty reducing operator-column Spin sector, compact resolvent and a positive sector eigenpair could follow. Finite column transfer then gives a genuine original H_phys positive eigenpair. NO such existence result has been established now.

## 6. Decision and next evidence gates

**Primary recommended sequence after the P2-C4B strict run qualifies:**

1. P3-OP1: source-star + source-trace -> exact Hilbert–Schmidt inner product isometry, distinct consumer and pinned axiom audit (small, direct source reuse).
2. P3-OP2: source Spin(9) **continuous** Hilbert–Schmidt action; reuse qualified PBW source compactness, not an unqualified abstract compact group.
3. P3-OP3: original SU(2) covariance using C48-0/G4H/S1H; prove alpha(U_h)=U_h and correct left-output gauge-physical action.
4. P3-OP4: exact source original massless field/core/charge covariance and same-domain closed physical amplified Hamiltonian equality; preserve BH historical source and port-qualification boundary.
5. P3-OP5: source Spin(8) stabilizer branching and first-weight bound 12, whole-sector low oscillator exclusion and nonempty high-type original operator core.
6. P3-OP6: uniform linear first-moment coercivity, original source closed form-core transfer, compact sector resolvent; only THEN potential positive eigenpair and finite-column extraction.

**Parallel possible bounded gate:** a generic finite-direct-sum closed-operator eigenvector transfer theorem, ideally with source-shaped domain and a distinct consumer. This is elementary but cannot replace OP4's original closed-graph identification.

**Hard stops:** no spectrum or mass-gap claim; no swap of the original 1/16-normalized Hamiltonian for a model; no confusion of adjoint gauge with left gauge; no mathematical use of gamma CAR before verifying delta-one vs sqrt(2) normalization; no automatic direct-sum/domain equivalence from smooth-core equality; no SO(9) quotient/parity truncation; no sharp-bound dependency; no new research branch.

**Operations:** This memorandum is documentation only, committed separately from P2-C4B's exact tested Lean/consumer/workflow files. The existing historical P2 and independent incidence branches remain intact; future routine proof work continues directly on unified integration.
