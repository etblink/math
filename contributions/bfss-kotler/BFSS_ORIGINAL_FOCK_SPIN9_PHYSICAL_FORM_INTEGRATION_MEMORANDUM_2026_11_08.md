# BFSS research memorandum — source-faithful Spin(9) Fock action, weight six, and the closed physical form

**Recorded:** 2026-11-08 (America/Los_Angeles)  
**Repository:** etblink/math  
**Research branch:** research/bfss-original-gamma-faithfulness-20261107  
**Branch HEAD reviewed:** 811d7b7167f0bb4524bf5a1a5ddacd18eef4d7ec  
**Scope:** Research synthesis and bounded next-gate design; documentation only.  
**Status:** PROPOSAL / READ-ONLY SOURCE REVIEW. This memorandum adds no Lean theorem, does not accept an unqualified source module, does not alter a workflow, and does not establish spectral confinement, point-spectrum existence, or a mass gap. No independent human review is claimed.

## 1. Decision and exact scientific question

**Decision:** Pursue a genuine original-source Spin(9) unitary Fock action, beginning with a small, exact CAR Lie-implementer/Cartan-normalization gate. The goal is an honest bridge from the already constructed source 48-label action to the original physical Hamiltonian's closed form and domains, not an abstract replacement model.

The mathematical target is a continuous unitary group action

\[
U_F:\operatorname{Spin}(9)_{\mathrm{source}}\longrightarrow U(\mathcal F_{\mathrm{original}})
\]

on the literal original complex Fock space (dimension \(2^{24}\)), satisfying for **every** original 48-real-label vector \(w\) and source group element \(g\)

\[
U_F(g)\,\theta(w)\,U_F(g)^{-1}
=\theta(R_{48}(g)w),
\]

where \(R_{48}\) is precisely the source original-paired-label Spin(9) to SO(48) homomorphism, not an equivalent-but-unbound representation. Subsequently construct the full bosonic-plus-fiber action \(\mathcal U(g)\), prove physical gauge compatibility and all sixteen smooth-charge covariances, and derive the covariance of the **same closed physical form and its associated Hamiltonian**.

**Not claimed:** Existence of this action in Lean, identification of the current stage's group lift with the original physical Fock operators, admissibility of the original high-weight sector, a coercivity theorem on the original smooth core, a closed-domain covariance theorem, or new positive eigenvalues. The research below separates classical feasibility from source-exact formal qualification.

## 2. Qualification ledger and separation of carriers

- Source gamma/paired-48 algebraic interfaces: the original F10BC Spin(9) to SO(16) homomorphism and F10R Spin(9) to the **original paired SO(48)** are present in the active branch. F10R's module explicitly states it is algebraic only; neither it nor identity differentiability constructs a global Spin(9) Fock representation.
- The source-negative-central 48-label image is \(R_{48}(z_9)=-I_{48}\), with \(z_9=-1\) in the original source Spin(9). The November 6 D/source-lift audit pins the specific F10U declaration and historical acceptance.
- The original ninth-axis source stabilizer \(K\) maps via its literal projection \(p\) to the original SO(9) fixed-axis stabilizer \(H\). The exact two-sign kernel/fibers and subsequent covering have qualified source/consumer gates, notably [covering run 42452043377](https://github.com/etblink/math/actions/runs/42452043377).
- Coordinate restriction and extension of the actual \(H\) have passed [42491448288](https://github.com/etblink/math/actions/runs/42491448288) and [42494594055](https://github.com/etblink/math/actions/runs/42494594055). The composed **ContinuousMulEquiv from H to SO(8)** passed [42498367504](https://github.com/etblink/math/actions/runs/42498367504), exact tested commit 811d7b7167f0bb4524bf5a1a5ddacd18eef4d7ec. GitHub reports successful exact-source preflight, pinned dependency restore, cold ancestors/source/independent consumer, and evidence-retention steps. This is a CI qualification fact, not an independent rehash of the archived binary receipts.
- Important carrier boundary: \(K\) is the original **Spin(9) stabilizer**, \(H\) the original target point stabilizer, and \(H\simeq_{\mathrm{top.grp}} SO(8)\). This does **not** by itself identify \(K\) with a separately built Spin(8), realize the Spin(48) lift, produce representation-theoretic branching on the original Fock module, or prove spectral assertions.

Useful source files:

- [F10R original-paired SO(48) action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean).
- [Source gamma faithfulness and central sign](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaFaithfulness.lean).
- [Original axis projection and two-sign fibers](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisProjection.lean).
- [Original axis covering](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCovering.lean).
- [Exact target coordinate equivalence](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCoordinateEquivalence.lean).

## 3. Central sign: a decisive construction filter

The original source central element \(z_9=-1\) satisfies \(R_{48}(z_9)=-I_{48}\). Consequently any implementing action on the **full** CAR/Fock module must satisfy

\[
U_F(z_9)\theta(w)U_F(z_9)^{-1}=-\theta(w).
\]

Since fermion parity has this conjugation action, a legitimate implementation sends \(z_9\) to fermion parity **up to a scalar fixed by the actual continuous lift and source conventions**. Do not guess the global phase or confuse its conjugation law with an equality to a preselected parity operator before proving uniqueness and normalization.

**Rejected shortcut (retain as negative knowledge):** A unital real algebra map from the *source* \(\mathrm{Cl}_9\) to \(\mathrm{Cl}_{48}\) or \(\operatorname{End}(\mathcal F)\) sends scalar \(-1\) to scalar \(-1\). Its conjugation is trivial on the 48 target generators, contrary to the required \(-I_{48}\). This rejects that specific route; it does not obstruct a genuine group lift. The target universal Clifford representation \(\mathrm{Cl}_{48}\rightarrow \operatorname{End}(\mathcal F)\) remains valid **after** a suitable group lift.

A related categorical/non-descent observation from the existing source gamma facts is that an original gamma representation distinguishing \(1\) and \(z_9\) cannot factor through the two-sign quotient and its SO(8) coordinate identification. This is a candidate *integration theorem* for a separate bounded gate, not a replacement for the Fock lift. A general representation descends through a quotient by the central two-sign kernel only when that kernel acts trivially.

## 4. Exact CAR Lie implementer and the weight-six calculation

The original Majorana normalization is

\[
\{\theta_p,\theta_q\}=\delta_{pq} I,
\qquad
\dim_{\mathbb C}\mathcal F=2^{24}.
\]

For the original paired-label real skew generator \(A\in\mathfrak{so}(48)\), the proposed anti-Hermitian CAR implementer is

\[
L(A)=\frac12\sum_{p,q}A_{pq}\theta_p\theta_q
\quad\text{with}\quad
[L(A),\theta(w)]=\theta(Aw).
\]

A bounded first formal gate must prove the **literal** source operator identity, skew-adjointness, the Lie-bracket identity with exact convention, and the correct normalization/ordering over all 48 source labels. It must not silently substitute normalized Clifford generators \(\sqrt2\,\theta\) for \(\theta\), change an orientation, or use a different Fock module.

For a spatial Cartan plane, the original 16-real gamma generator is

\[
A_j=\tfrac12\gamma_{2j-1}\gamma_{2j},\qquad A_j^2=-I/4.
\]

Each of three color copies contributes eight real rotation planes across the 16-real spinor carrier: 24 planes total, each with frequency \(1/2\). Under the standard CAR implementer, each plane contributes Hermitian weight \(\pm 1/4\). The full Fock Cartan spectrum therefore obeys the proposed bound

\[
-6\le m_{\rm fermion}\le 6,
\qquad 24\cdot\tfrac14=6.
\]

**Evidence status:** The [Gate C analytical audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) derives these constants and reports exact integer gamma-projector, character and source-normalization diagnostics. It does *not* prove that the infinitesimal CAR action is the derivative of a globally constructed, physically bound original-source group action. That identification is still a gate.

Candidate highest-weight vector: use the original CAR module and a Cartan-adapted polarization, not a replacement module or an unverified identification with the old paired vacuum. The analytical maximal fermionic weight is \(\mu=(6,0,0,0)\). The unique highest-weight line should be gauge invariant once the original continuous gauge action preserves the common annihilator line and its SU(2) character is proved trivial. The candidate full-space physical sector is \(\lambda=(24,18,0,0)\), using the gauge-invariant polynomial \(P(X)^9\) times a compact radial bump; nonzero states with disjoint radial supports would give infinite dimensionality. These are source-binding targets, not accepted original-action sector theorems.

## 5. Global Fock implementation: primary route and alternate route

**Preferred lift:** Equip the literal source Spin(9) with the previously qualified named topology. Prove continuity of the original F10R map \(R_{48}:\mathrm{Spin}(9)\to SO(48)\) by its exact Kronecker/reindex entries in the continuous gamma action. Supply a topological covering \(\pi_{48}:\mathrm{Spin}(48)_{\rm source}\to SO(48)_{\rm native}\) on the correct carriers/topologies and source Spin(9) simply-connectedness and local path-connectedness, **or** an applicable fundamental-group lifting criterion. Use Mathlib's genuine covering-lift theorem to construct a based continuous lift \(\widetilde R_{48}\) with \(\pi_{48}\circ\widetilde R_{48}=R_{48}\). Prove multiplicativity via uniqueness of based lifts, not by assuming it of an arbitrary continuous choice. Compose the **target** Clifford/Spin(48) action with the original Fock operator representation; prove its exact covariance on every original \(\theta(w)\), unitarity, continuity, and central sign.

The pinned [D/source-lift audit](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md) shows that F10BE supplies source gamma continuity, F10R the algebraic original 48-label action, and V7Z an **algebraic** quotient comparison. Those sources do not themselves discharge the target covering or source simply-connectedness. The local [source-48 Clifford universal lift probe](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockCliffordUniversalLiftProbe.lean) explicitly labels itself exploratory/unqualified.

**Alternative if covering endpoints dominate:** Integrate the literal CAR Lie algebra implementer through an accepted simply connected source Spin(9) Lie-group theorem, proving the same exact group action and 48-label covariance. This substitutes an equally exact integrability/source-identification obligation, not a free shortcut. Choose by actual pinned interface availability and proof surface, not by preference for abstraction.

**Rejected premises:** an abstract group homomorphism with a missing continuity premise; a scalar-valued central image; a gauge-domain SU(2) Spin(48)/Fock homomorphism presented as though its domain were Spin(9); and a formal Lie differential assumed equal to the source group derivative without proof.

## 6. Compatibility with actual gauge action and the 16 original charges

Let \(\mathcal U(g)\) be the combined bosonic coordinate action and the exact source Fock action on original full \(L^2\). Prove its strong continuity and unitarity. Prove that it commutes with the original paired SU(2) gauge implementation so that it restricts to the same original physical Hilbert space, and preserves the original smooth physical core.

At the label level the spatial Spin and color SO(3) actions commute. On Fock space the implementers of commuting CAR automorphisms may differ by a scalar; prove the scalar character is continuous and trivial on the original SU(2) group. Do not declare the implementers commute on the basis of label matrices alone.

For all sixteen original smooth supercharges, prove a source-exact covariance, schematically

\[
T\,\mathcal U(g)=\mathcal S(g)\,T
\]

on the **original** smooth physical core, with \(\mathcal S(g)\) the correct unitary charge-output action and \(T\) the original sixteen-charge column. Check the gamma, color structure constants, original theta order, derivatives, exact gauge invariance, and source Pauli conventions. Equality of a few Lie generators or of matrix entries on unrelated finite modules is not sufficient.

## 7. Closed quadratic form and natural Hamiltonian domain

The original source smooth-core form is

\[
q_0(\psi)=\frac1{16}\sum_{\alpha=1}^{16}\|Q_\alpha\psi\|^2.
\]

If \(T\) denotes the closed physical charge column, its normalized associated Hamiltonian is intended to be \(H_{\rm phys}=\frac1{16}T^*T\) on its actual natural domain. The separate pinned **OperatorDependencies** package contains substantial closed-charge, weighted-form-domain, associated-operator and concrete paired-SU2 specialization modules (D2B25, D2B26, D2B27, D2B28) at [the pinned PR #77 snapshot](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies). Source presence and prospective file headers are **not** fresh strict qualification, nor are these modules already imported into the current research branch.

The target closure argument is: exact smooth-core covariance implies the closed charge graph is invariant under the product of the unitary physical and output actions; the original form is invariant on its **actual complete form domain**; the sector projection reduces that same form; consequently the associated self-adjoint operator has exact domain invariance

\[
\mathcal U(g)\operatorname{Dom}(H_{\rm phys})
=\operatorname{Dom}(H_{\rm phys})
\]

and

\[
H_{\rm phys}\mathcal U(g)\psi
=\mathcal U(g)H_{\rm phys}\psi
\qquad (\psi\in\operatorname{Dom}(H_{\rm phys})).
\]

**Proof obligation:** Prove the applicable closed-operator/form identification at original pinned declarations and exact domains. A dense-core algebraic identity **alone** does not establish equality of closed operators or preservation of the natural domain. If using the manuscript's separate Clifford module, independently discharge its full unitary/domain matching assumptions; preferably work directly on the original source model.

## 8. Physics-facing consequence remains conditional

The [conservative full-space spectral route](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md) proposes, for an actual high Spin(9) type with \(\lambda_2>m+6\) and \(0<\beta<1/2\),

\[
q(\psi)\ge(\tfrac12-\beta)\|\nabla\psi\|^2
+\bigl[\sqrt{\beta}(m+9)-8\sqrt3\bigr]
\int \|X\|_F\|\psi(X)\|^2\,dX.
\]

For \(\beta=49/100\), \(m=11\), \(\lambda_2>17\), the proposed source-bound consequence is

\[
q(\psi)\ge \frac1{100}\|\nabla\psi\|^2
+(14-8\sqrt3)\int\|X\|_F\|\psi(X)\|^2\,dX
\ge\frac1{100}\|\nabla\psi\|^2
+\frac17\int\|X\|_F\|\psi(X)\|^2\,dX.
\]

The necessary original-source premises remain explicitly unqualified: P1, full physical Spin/Fock action and correct branching/weights; P2, exact original smooth-core form identity and fermionic bound; P3, closed physical-form, domain, and reducing-sector interpretation. The [C audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) gives a candidate nonzero infinitely generated type; the [D audit](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md) rejects the ordinary cancelling frozen fast-ground escape channel for that type, but does not exclude every full moving-frame escape state.

Under P1–P3, linear radial-moment control plus gradient control suggests compact form-domain embedding by local Rellich and tail tightness. Preserve the documented **linear-vs-quadratic moment signature mismatch**: the existing quadratic-moment compactness interface cannot be applied unchanged to a linear weight. A fresh linear-tail compactness theorem and source-exact closed-form identification are needed. Even then, do **not** infer a positive gap in the **full** BFSS spectrum; the sought result concerns the positive point spectrum in particular reducing high-weight sectors.

## 9. Bounded gate schedule and admission criteria

| Gate | Single source-exact deliverable | Admission status |
| --- | --- | --- |
| **F1** | On original paired 48 labels and Fock operators, prove CAR quadratic implementer: skew-adjointness, commutator action, exact Lie bracket, normalization and order, with adversarial consumer | **NEXT RECOMMENDED; NOT YET PROVED** |
| **F2** | Four commuting Cartan planes; 24 half-frequency real planes; exact Fock spectral interval [-6,6]; gauge-adapted highest-weight normalization if justified | Analytical finite diagnostics only; fresh Lean source + consumer needed |
| **F3** | Genuine continuous original-source Spin(9) Fock action with full 48-theta covariance, covering/integration, and central sign | OPEN, major topological/source-lift gate |
| **F4** | Original gauge commutation, original physical smooth-core invariance and all sixteen source supercharge covariance identities | OPEN |
| **F5** | Same complete original closed form, unitary form-domain invariance, original Hamiltonian natural-domain preservation and exact commutation | OPEN; operator imports/pins must be qualified |
| **F6** | Actual source high-type coercivity, explicit nonzero sector, linear-moment compactness, reducing-sector compact resolvent, physically meaningful positive point spectrum | OPEN; requires independent hostile escape review |

For each gate: inspect the exact pinned declaration signatures and ancestry; do the smallest hypothesis-complete Mathlib/API diagnostic when needed; preserve existing accepted source/control bytes; do not conceal assumptions in helper instances; use original types and independent examples including signs, zero, identities, gauge actions, and adverse configurations. Require cold exact source and independent consumer compilation, warnings-as-errors, exact root/axiom inventories, retained input hashes/logs, and same-commit qualification. The allowed foundational axioms in historical strict gates are propext, Classical.choice, and Quot.sound; no sorryAx, new axioms, unknown cached artifacts, linter relaxation, or unapproved proof budget changes.

**Next bounded step:** Design F1 declarations and its independent consumer against the original source 48-label and Fock APIs, with no repo mutation until a separately authorized implementation. First run a source/API census: determine whether the finite-dimensional Fock CAR quadratic implementer already exists in the pinned separate package and can be qualified without moving unrelated operator modules. Prove the hard normalization/sign identities before attempting F3. Stop if the actual original operator interface or CAR convention differs; preserve the discrepancy as negative knowledge.

## 10. Primary evidence and preservation policy

- [Original spectral confinement roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md)
- [A/B algebra and gauge-average audit](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md)
- [C highest-weight and original-source lift audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md)
- [D central-sign, frozen-valley and lifting obstruction audit](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md)
- [E global full-space averaging and form-domain audit](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md)
- [Exact covering gate record](BFSS_SPECTRAL_SOURCE_NINE_AXIS_COVERING_GATE_2026_11_07.md)
- [Coordinate equivalence source and candidate gate record](BFSS_SPECTRAL_SOURCE_NINE_AXIS_COORDINATE_EQUIVALENCE_GATE_2026_11_08.md)
- [Original core/charge/form declarations](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean)
- [Original gauge data and physical core](../../lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean)
- [Published working-paper version 0.4.0](https://doi.org/10.5281/zenodo.23969575) (not peer-reviewed and no mass-gap claim)

**Provenance rule:** A linked successful CI run qualifies only what its exact tested commit, workflow, complete root inventory, and independent consumer actually checked. This document does not advance the qualified theorem count. Research can be wrong; if F1 fails under the original source conventions, retain that negative result instead of rewriting the model to make a theorem compile.

**No changes in this memorandum action** to any existing Lean source, manifest, Python validator, workflow, dependency pin, research ledger, upstream PR, published paper, or branch other than adding this standalone document.


---

## 11. Post-OP2c decision checkpoint — original F1 first (2026-11-08)

**Acceptance baseline.** The operator-projection track now has:
`OP0` (abstract finite-dimensional gauge fixed projection) and `OP1`
(abstract star-automorphism projection invariance), plus original BFSS
source binding `OP2a` [#42525538193](https://github.com/etblink/math/actions/runs/42525538193),
original-gauge `Module.End` and orthogonal projection `OP2b`
[#42527245991](https://github.com/etblink/math/actions/runs/42527245991),
and nonzero literal original Fock vacuum/fixed projection `OP2c`
[#42530241914](https://github.com/etblink/math/actions/runs/42530241914).
**OP2c is qualified only at exact repaired commit**
`f84d092b2c71099cda790ee64083b5b81eb360d9`, 9,062 jobs,
independent consumer, source warning check, no forbidden axioms,
retained artifact digest `sha256:663e5d187b9e326fb904f47fb0054a364b00b3e7cb9f5966bac0ce753fe4daa5`.
The first #42528690361 red was a deprecated `ContinuousLinearMap.zero_apply`
name and was repaired in one line without statement changes.

**Source/API comparison: F1 versus OP3 (read-only evidence):**
- F1 has original-index source entry points:
  `SU2BFSSSource48FockIndexBridgeProbe.lean`,
  `SU2BFSSSource48NormalizedFockGammaProbe.lean` (original
  normalized generator square and pairwise CAR), and
  `SU2BFSSSource48AllVectorFockCliffordSquareProbe.lean`
  (all-real-vector quadratic square). Their Git blob presence and source
  declarations were inspected, but this comparison did **not** freshly
  establish each module's independent strict theorem qualification.
- The normalization is a non-negotiable interface:
  original Majorana `θ` has delta-one CAR, whereas Source48 normalized
  Clifford generators use `√2 θ`. A correct first bivector/CAR
  implementer must reconcile that factor and ordering in its *literal
  source operator* commutator; no silent replacement of the physical
  `θ` operators.
- OP3 currently requires an exact real Source48 Clifford algebra map
  to original continuous complex-linear Fock operators and a compatible
  **star-preserving** automorphism for the actual Spin(9) action.
  `SU2BFSSSource48FockCliffordUniversalLiftProbe.lean` explicitly
  states **EXPLORATORY PORT — NOT STRICT-QUALIFIED**. Likewise
  `SU2BFSSSource48FockBivectorStarCompatibilityProbe.lean`
  is an unqualified staged candidate. The Clifford odd-generator
  star sign differs from the self-adjoint original gamma image, so an
  algebra homomorphism cannot simply be assumed globally star-preserving.
  Neither source proves a Spin(48) lift, continuous Spin(9) action or
  gauge commutation.
- The genuine algebraic source Spin(9) to original paired SO(48)
  `F10R` carrier is a useful qualified ancestry candidate, but it is
  *not* a topological/Fock action by itself. Verify exact historical
  qualification when consumed.

**Decision — prioritize one F1 micro-gate next** rather than spending
more gates on OP-only abstractions. First inspect pinned original
Source48 gamma/CAR and bivector declaration signatures and the smallest
available source ancestry. Then prove and independently consume one
exact-sign, exact-`θ`-normalization skew-adjoint/commutator identity
for a source-labeled CAR bivector, before claiming any full Lie bracket.
Require the ordinary cold build, exact-commit, warnings, axiom and
original-source controls. The subsequent F1 gate addresses the full
48-label Lie implementer and bracket, and only then F2/F3 weight
and original continuous Spin(9) lift.

**Alternatives and fail-closed checks:** If the source CAR bivector
identities or exact Fock reindexing are absent/unqualified, qualify the
smallest predecessor instead of broad-importing or weakening the theorem.
If OP3's actual source interfaces become clearly cheaper after a measured
source-level comparison, reconsider it without pretending that a
Clifford universal property supplies the absent group lift, gauge
commutation or star structure. Never infer a physical L² state or
closed Hamiltonian/spectral consequence from OP2c nonzeroness.

**Scope of this checkpoint:** navigation/memo only; no new Lean
declaration, workflow, source import, original Fock representation,
theorem qualification or change to `etblink/math:main`.


---

## 12. F1A exact-CAR micro-gate and upstream theta binding boundary (2026-11-08)

**Current F1A gate:** [strict run #42532370775](https://github.com/etblink/math/actions/runs/42532370775) on candidate commit
`e0561b323c8c5792f00242d4e341f32fd9b81888`,
source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1AOriginalThetaBivectorCommutator.lean`,
separate independent consumer
`lean/diagnostics/BFSSF1AOriginalThetaBivectorIndependentAudit.lean`.
**PENDING** at this recording; do not treat the two commutator statements
as qualified before its pinned source/consumer/axiom/warning run is green.
A prior workflow run #42532325615 was cancelled by the source-preserving
Git-blob NUL-byte preflight correction.

**Exact local lemma:** For distinct original pair-indices `p ≠ q` in
`Source48Label`, the concrete Fock operators `θ_p = majoranaCandidate p`
on the literal `OAI.BFSSQuantum.Fermion 2` obey
`θ_p θ_q + θ_q θ_p = 0`, `2 θ_p² = I`,
and the candidate signed commutators
`[θ_p θ_q, θ_p] = -θ_q`, `[θ_p θ_q, θ_q] = +θ_p`.
No `√2` is inserted into these physical delta-one CAR operators.
The normalized positive Clifford unit axes `√2 θ_p` are a separate
`Source48NormalizedFockGammaProbe` interface.

**Critical remaining source/model boundary:** The pinned
`SU2FermionF2B2IndexedProbe.lean` assembles the
`majoranaCandidate_car` theorem over exactly `Fin 24 × Fin 2`,
but explicitly says transport via `thetaLabelEquiv` into the upstream
`AlgebraData.theta_CAR` and **theta irreducibility** remain distinct
unproved steps. The original `BFSS/Core.lean` defines `AlgebraData N`
as a structure whose `theta`, `theta_selfAdjoint`, `theta_CAR`, and
`theta_irreducible` are fields. F1A is an exact operator result **on the
original Hilbert carrier** and the concrete Fock Majorana candidate; it
is **not** a proof that a particular original physical `AlgebraData 2`
instance uses the candidate operators, nor a completed physical
Hamiltonian-source identity. Keep that obligation visible in F4/F5.

**Next if F1A qualifies:** Prove explicit
`star (θ_p θ_q) = -(θ_p θ_q)` for `p ≠ q`
using the already present candidate self-adjointness theorem
`FCP.BFSSFermionF2.majoranaCandidate_selfAdjoint` and the actual
offdiagonal CAR. Mathlib's general `IsSelfAdjoint` handles
self-adjointness; do not assume a similarly named universal
`IsSkewAdjoint` predicate on the star algebra, because the current
Mathlib API defines different skew-adjoint notions in bilinear-form
contexts. After skewness and all third-label commutators qualify,
assemble exact 48-label skew matrices and normalization before the
Lie-bracket/integration work. An F1A red must be classified at the first
causal error rather than hidden by proof-budget or source-convention changes.

**Provenance and scope:** The H1/OP2a–OP2c accepted results are unchanged.
This paragraph records only source facts, a bounded candidate,
and a missing physical-model identification; it does not add or
independently qualify any Lean theorem.


---

## 13. F1A first strict red — type/simplification diagnosis and bounded repair (2026-11-08)

**Observed first strict outcome:** [#42532370775](https://github.com/etblink/math/actions/runs/42532370775) — **FAIL**, attempt 1, at exact tested `e0561b323c8c5792f00242d4e341f32fd9b81888`. Initial source/predecessor Git blob, exact Lean 4.34.1/Mathlib dependency and environment gates passed. Cold ancestry compiled through `SU2BFSSSource48NormalizedFockGammaProbe`. The new F1A source did **not** compile, so the apparent `#print axioms` output included `sorryAx` from incomplete elaboration and does *not* constitute proof admission. The independent consumer was not built.

**Four precise errors, all in the new F1A module:**
- Line 38, off-diagonal CAR: `simpa only [if_neg hpq, zero_smul]` left `(0 : ℂ) • 1` unreduced. The `if_neg` spelling was also deprecated. Source CAR remained valid; the conversion tactic was too narrow.
- Line 53, diagonal CAR: `simpa only [if_pos rfl, one_smul]` left `if True then 1 else 0` unreduced; the `if_pos` spelling was deprecated. Again an exact simplification/API failure, not a counterexample to CAR.
- Lines 71 and 90, two ordered-bivector commutators: `noncomm_ring` stopped with goals containing `-1 •` and `2 •` on the continuous-linear-operator additive module, despite the mathematically elementary distributive identities. A generic noncommutative ring tactic did not bridge that scalar-action elaboration form.
- Fail-closed implication: do not use the missing proof's `sorryAx` reports to claim that either candidate commutator was proved. Source-normalization `θ_p θ_q+θ_q θ_p=δ_{pq} I` is unchanged and the ordered-bivector sign target remains a candidate until a fresh independent green run.

**Targeted repair:** [commit `ab0e1e997ed8862d975522c294a8326a86f13853`](https://github.com/etblink/math/commit/ab0e1e997ed8862d975522c294a8326a86f13853) changes only the new F1A proof source: uses `simpa [hpq]` and `simpa` for CAR specializations, and explicit `simp only` expansion of `mul_neg`, `neg_mul`, distributivity, associativity, and subtraction instead of `noncomm_ring`. No theorem statements, original CAR definitions, imports, independent consumer, workflow, upstream `main`, or mathlib/toolchain pins were changed.

**Replay:** [run #42533094586](https://github.com/etblink/math/actions/runs/42533094586) started at the repair commit; **NOT YET QUALIFIED** at this recording. Require full original source/consumer compilation, warning-free exact source and consumer, and no `sorryAx`/forbidden axioms.

**Procedural lesson:** for continuous-linear-map identities on the actual Fock operator algebra, specialize the existing source CAR exactly, then normalize scalar/negative module expressions with explicit ring/module rewrites rather than assuming `noncomm_ring` resolves module coercions. Preserve failed diagnostics as negative *procedural* knowledge; do not alter physical signs, normalizations or carriers to force a green gate.


---

## 14. F1A second strict red — exact continuous-linear-map API repair (2026-11-08)

**Read-only diagnosis before repair:** [F1A strict run #42533094586](https://github.com/etblink/math/actions/runs/42533094586) completed **RED** at tested source commit `ab0e1e997ed8862d975522c294a8326a86f13853` (attempt 1). Original predecessor Git blobs, source boundaries, Lean 4.34.1/Mathlib pins, and dependency restoration passed. The *new* F1A source failed to compile; its independent consumer did not run. Source `#print axioms` still contained `sorryAx` from incomplete theorems. No theorem was admitted.

**Compared to the first red #42532370775:**
- The diagonal `theta_diagonal` proof now elaborates. This is a genuine diagnostic improvement, **not a newly accepted independent theorem**.
- Off-diagonal CAR `theta_anticommute` still fails: the original CAR equality specializes to `(0 : ℂ) • (1 : FockOp)`, and `simpa [hpq]` did not discharge that explicit scalar action.
- Both ordered-bivector commutator subgoals still fail because the new `simp only` tactic does not transport negation through the **continuous-linear-map composition** (the actual operator multiplication). Unused simp-argument warnings also appear, so the strict gate would reject them even if the proof finished.
- Diagnostic failures are in proof elaboration, **not** a source-Majorana CAR counterexample or evidence that the physical commutator signs need changing.

**Pinned-API re-evaluation:** Inspected `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` at exact Mathlib commit
`d13f23b723b8a846827a245b89c10fc7d3f11612`.
It provides `ContinuousLinearMap.mul_def` (operator multiplication is composition), `ContinuousLinearMap.comp_neg`, and `ContinuousLinearMap.neg_comp` for the required continuous-linear-map negation identities. Therefore no generic noncommutative-ring normalization tactic is needed.

**Third bounded candidate:** [commit `b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f`](https://github.com/etblink/math/commit/b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f)
changes **only** the existing new F1A source file (no theorem statement changes):
1. Explicitly specialize original off-diagonal CAR to `0 • 1` using `ite_eq_right hpq`, then use `zero_smul ℂ` to prove operator zero.
2. Use the pinned `ContinuousLinearMap.comp_neg` lemma for `a * (-(a*b))`, a small `mul_assoc` calculation, and an additive identity.
3. Use pinned `ContinuousLinearMap.neg_comp` for `(-(a*b))*b`, followed by `mul_add` and `mul_assoc` for the second commutator.
4. Removed the unused broad `simp only` argument lists; retained exact independent consumer, original theta carrier, delta-one CAR normalization, source imports, strict CI, and toolchain pins.

**Strict third replay:** [run #42533991101](https://github.com/etblink/math/actions/runs/42533991101), exact tested `b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f`, was **IN PROGRESS at this checkpoint**. The F1A theorems remain **CANDIDATE / UNQUALIFIED** until the cold source, independent consumer, warning and allowed-axiom gates finish green.

**Operational rule:** repeated red proof goals require examining their *actual operator API* rather than successive changes to generic tactics; CI green is the scientific acceptance boundary. Preserve both failure logs and any qualification evidence, without silent model renormalization, source-carrier substitution, linter relaxation, or changes to `etblink/math:main`.
