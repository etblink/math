# BFSS spectral confinement — adversarial research roadmap (proposal, 2026-11-06)

**Status:** PROPOSAL ONLY. This document records a bounded, falsification-first research direction; it does **not** qualify a new Lean theorem, alter a manuscript conclusion, certify an independent peer review, or authorize publication/upstream submission.

**2026-11-06 A/B mini-audit:** [source normalization and gauge averaging](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md) now have explicit analytical derivations and source-pinned independent diagnostics. This is zero new Lean acceptance. The full source confinement bound, representation/sector obligations and closed-domain bridge remain open. The audit also corrects the cross-branch source locators below.

**2026-11-06 C analytical audit:** [weight six, explicit sectors and the source-lift hold](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) supports `M=6` in the canonical continuous-lift model and the explicit candidate `mu=(6,0,0,0)`, `k=9`, `lambda=(24,18,0,0)`. Exact gamma/projector, character, branching and polynomial diagnostics pass. The actual source global lift/action binding and original core/closed-form obligations remain open; this is not Gate C formal acceptance.

**2026-11-06 D/source-lift audit:** [frozen valley and central sign](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md) rejects the unital `Cl_9 -> Cl_48`/Fock shortcut for the desired lift. The ordinary cancelling fast ground channel has stabilizer first weights at most two and misses `lambda=(24,18,0,0)` in the canonical model. This is not a global escape exclusion or a new `lambda_2>2` confinement theorem. The actual covering/simply-connected source premises and uniform annular moving-frame errors remain open.

**2026-11-06 E analytical route:** [global full-space averaging and conditional closure](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md) derives conservative H1 by rotating the scalar one-color inequality on the full-space Spin(9) type. State gauge invariance and moving frames are unnecessary for this proof. The linear moment gives a conditional closed-form/compactness bridge; the existing quadratic-moment compactness signature cannot be instantiated with it unchanged. Actual source action, core identity and closed physical interpretation remain explicit unqualified premises P1–P3; no spectral or Lean acceptance is added.

**Branch:** `research/bfss-spectral-confinement-roadmap-20261106`  
**Exact ancestry:** `research/fcp-k1d17-ancestor-cache-pilot-20261028@4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`  
**Latest parent mathematical qualification:** [F10DW strict run #42287468238](https://github.com/etblink/math/actions/runs/42287468238), tested source commit `54748cb062b54d970d5f448ae4fca9bd84bcfcd4`, green; parent branch HEAD is the subsequent documentation-only acceptance commit.  
**Environment on inherited gates:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.  
**Evidence authority:** existing Git history, exact Lean declarations, source/axiom audits, and linked runs—not this roadmap. Keep the [current-state handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md) as the qualification ledger.

## 1. Scientific question and nonclaims

The target is the **positive point spectrum** of the *relative* undeformed SU(2) BFSS Hamiltonian: whether there are nonzero, normalizable, domain-qualified eigenstates at positive energies. Do **not** frame this as a positive gap in the full spectrum: the classical continuous-spectrum analysis beginning at zero makes that a different and generally incompatible target. An embedded point eigenvalue may coexist with a continuous spectral set. Distinguish the manuscript's independently specified Hamiltonian from the repository's original-source concrete physical Hamiltonian until the exact intertwiner, closed forms, and domains are proved to match.

Primary manuscript: [October 5 BFSS preprint (TeX)](https://github.com/mathcommunity/oai-math-revised/blob/main/preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026/build/positive-eigenvalues-relative-su2-bfss.tex): particularly its form/rotations lemma, Spin(9)→Spin(8) restriction lemma, transverse oscillator bound, confinement proposition, physical-sector construction, and final spectral argument. This manuscript **claims** infinitely many positive-energy eigenstates; our independent Lean work has **not** proved that claim.

Relevant source entry points: [Core.lean](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean), [F10DW source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DWNativeRepresentationDifferentiability.lean), and the earlier [geometry plan](FCP_K1D18_SOURCE_SPIN9_CHART_TANGENT_WORK_PLAN_2026_11_02.md) are in this exploratory tree. The [contribution claims and locators](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/CLAIMS.md) and [OperatorDependencies package](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies) are in the separate PR #77 head snapshot `fa00aa36e770ca516f57b41f5b02229a5033d50f`; they are **absent here**, and the F10DW workflow does not restore them. Any use requires a separately scoped, source-pinned integration and qualification; no import or merge is performed by this audit. The published v0.4.0 record is [Zenodo DOI 10.5281/zenodo.23969575](https://doi.org/10.5281/zenodo.23969575). Upstream [PR #77](https://github.com/mathcommunity/oai-math-revised/pull/77) contains the contribution snapshot; it is **not** evidence that later F10DW or the proposed spectral statements were reviewed upstream.

## 2. Research hypotheses from the 2026-11-06 discussion

Every statement below is a **target for independent mathematical scrutiny**, not a newly accepted fact. Record a counterexample or a failed hypothesis instead of repairing the statement by silently restricting the model.

### H1 — global gauge-direction averaging; lower-risk candidate

For a physical state `Ψ` with pointwise SU(2) gauge covariance, its probability density is invariant under the color SO(3) action. For any unit color direction `v ∈ S²`, the quantity

`I(v) = ∫ |vᵀ X| ‖Ψ(X)‖² dX`

is therefore independent of `v`. Spherical averaging and the proposed sharp geometric inequality

`∫_{S²} |vᵀ X| dv ≥ (1/2) ‖X‖_F`

(with normalized sphere measure) would replace the manuscript's three-color factor `1/3` by `1/2`. **Audit** measurability, almost-everywhere covariance, state-density invariance, sphere normalization, and the geometric inequality for *all* real 3×9 configurations—not just rank-one examples.

Allocate `0 < β < 1/2` of kinetic energy to the one-color transverse oscillator. Assuming the original full-space Spin(9) action and the exact one-color exclusion, the expected bound is

`q(Ψ) ≥ (1/2−β) ‖∇Ψ‖² + [√β (m+9)−C] ∫ ‖X‖_F ‖Ψ(X)‖² dX`

when all oscillator levels `n ≤ m` are absent. The conservative proposed fermionic coefficient is `C = 8√3`; prove it from the **source normalization** `{θ,θ}=δ`, `f_{abc}=√2 ε_{abc}`, and the true 48-Majorana quadratic form. Avoid confusing `θ` with normalized Clifford generators `√2 θ`.

**Explicit test configuration:** `β=49/100`, `m=11`, tentative `M=6`, and `λ₂>m+M=17`. These give the *candidate* inequality

`q(Ψ) ≥ (1/100) ‖∇Ψ‖² + (14−8√3) ∫ ‖X‖_F ‖Ψ(X)‖² dX,`

where `14−8√3 > 0`. If the fermionic weight bound `M=6` and the nonempty-sector proof survive, the manuscript polynomial family with `k=9` and `λ₂=18+μ₂` is an explicit test candidate.

### H2 — fermionic spectral reduction; optional optimization, not a prerequisite

For the manuscript's fermionic multiplication operator `B(X)`, let `s₁,s₂,s₃` be the singular values of the bosonic 3×9 matrix `X`. A candidate finite-dimensional reduction gives

`‖B(X)‖ = 8√2 λ_max(S)`,  
`S = [[0,s₃,s₂],[s₃,0,s₁],[s₂,s₁,0]]`.

This suggests the sharper global estimate `C = 16√(2/3)` and the rank-one identity `‖B(X_rank1)‖ = 8√2 ‖X_rank1‖`. In the 48×48 one-particle skew matrix calculation, be exact about multiplicities: if its positive skew-block frequencies are `a_j ≥ 0`, the Fock operator norm is `(1/2)∑_{j=1}^{24} a_j`, equivalently `(1/4)` of the sum of all 48 singular values. Never replace that with half the sum of the 24 largest singular values. Verify the claimed reduction by an exact algebraic argument and independent finite matrix diagnostics before promoting it. The **H1 argument must not depend on H2**.

### H3 — fermion first-coordinate weight bound

The real 16-component Spin(9) gamma action has generator `(1/2)γ¹γ²` in a fixed spatial plane, squaring to `−I/4`. Its three color copies contribute 24 real rotation planes to the 48-label Majorana module. The *proposed* spin-lift first-coordinate fermionic-weight bound is `M≤6` (24 contributions each of absolute weight `1/4`). This is to be proved for the **actual** original Fock action and correct Spin(8) stabilizer, including covering/phase and normalization; a weight count is not itself the construction of a global physical Spin(9) lift.

With the classical orthogonal interlacing `ν₁ ≥ λ₂` for Spin(9)→Spin(8) restriction, any transverse oscillator level `n` tensored with the fermions has `ν₁ ≤ n+M`. The conflict excludes `n≤m` if `λ₂>m+M`. Check integral and half-integral highest weights and the **actual target sector**, not a substitute representation.

### H4 — localized near-valley enhancement; higher-risk candidate

Let `r=‖X‖_F` and `δ(X)` denote distance from the matrices of rank ≤1. In singular values,

`δ²=s₂²+s₃²`; `V(X)=s₁²s₂²+s₁²s₃²+s₂²s₃²`,

suggesting `V(X) ≥ (1/3)r²δ²`. Away from `δ≪r`, the quartic potential dominates the linear fermionic term. Near a valley, try the exact rank-one `8√2 r` fermionic constant together with a *first-excited* oscillator estimate. A working illustration used `β=0.49`, relative rank-one error `0.01`, and a color-direction patch with `|vᵀX|≥0.94r`; then the candidate energy margin is

`2√β(1+8)·0.94 − [8√2 + 0.01·8√3] > 0`.

The candidate conclusion is a compact-resolvent estimate potentially at `λ₂>6` and a polynomial family `k=4`. This is **not** a proof. A partition of unity from smooth, degree-zero, **spatial Spin(9)-invariant** functions may yield IMS errors `O(r⁻²)`, but fixed color-direction cutoffs are **not gauge invariant**. The missing theorem is a full-space Spin(9)-isotypic one-color oscillator bound applicable to the localized, no-longer-gauge-invariant vectors; also prove the cutoffs, patch covering, IMS identity and domains. If any of these fail, keep H4 as rejected/conditional and prefer H1.

## 3. Falsification and proof gates (execute sequentially; no automatic theorem promotion)

| Gate | Task and pass condition | Kill / hold condition |
|---|---|---|
| **A. Exact-source algebra** | Fix original source/TeX pins; prove or refute the `B(X)` normalization and `C=8√3`; check gamma/CAR/structure-constant conventions. Independently derive finite-matrix checks from the explicit 16×16 gamma family. | A different coefficient or model makes every numerical threshold provisional. |
| **B. Gauge-average lemma** | Prove SO(3) invariance of the physical density and the sharp sphere-average inequality, with exact norms and Fubini/Tonelli. Prove the whole `β,m` inequality **on the smooth physical core**. | Any failure of invariance, measure, or the direction averaging stops H1. |
| **C. Representation and source sector** | Verify full physical Spin(9) action, Spin(8) stabilizer restriction, `M≤6`, oscillator-level exclusion and nonzero gauge-invariant high-weight `P^k v` states with infinitely many radial cutoffs. | A projective/covering mismatch or empty isotypic sector invalidates the chosen threshold. |
| **D. Hostile escape test** | Seek fixed-`λ`, normalized core states moving to `r→∞` with bounded form energy; track gauge invariance, Spin(9) type, spinor weights, and longitudinal/transverse scales. A putative Weyl sequence must inhabit the same closed physical sector and operator. | Any valid bounded-energy escaping family refutes claimed compactness; preserve it without scope-shifting. |
| **E. Closed-form and spectral bridge** | Extend the smooth-core estimate to the actual closed quadratic-form domain; show compact embedding using gradient control and weighted tails; verify isotypic reduction and an infinite-dimensional sector; invoke compact-resolvent spectral theorem. **No separate trivial-kernel proof is needed** for infinitely many positive eigenvalues, provided the operator is nonnegative, self-adjoint and the chosen sector is infinite dimensional. | Form/domain mismatch or nonreducing sector blocks the spectral claim. |
| **F. Exact source-model identity** | Relate the manuscript's abstract fermions, gauge/spin actions, supercharges, smooth core, closed column and `(1/16)T†T` Hamiltonian to the actual `pairedAlgebraData`/`pairedGaugeData` construction. Prove explicit unitary and *domain-accurate* graph equivalence or avoid the second model by proving E directly on the original source model. | Conditional unitary, source-normalization mismatch, or wrong domain forbids interpreting an abstract eigenpair as a source BFSS eigenpair. |
| **G. Optional localized upgrade** | Only after B/C/E survive, test H4 with finite-direction Spin(9)-invariant IMS cutoffs and full-space oscillator exclusion. Confirm the numerical margin survives cutoff losses uniformly at large radius. | If localization breaks representation type or insufficiently controls errors, do not claim `λ₂>6`; retain proven global bound. |
| **H. Formal admission/publication** | Dedicated independent Lean source+consumer audit, full axiom checks, exact cold/warm provenance, manuscript/source crosswalk, and independent human review before a revised scientific claim. | A green cache restore, an unreviewed TeX assertion or numerical evidence alone is never admission. |

**Ordering:** Gates A–D are the falsification-first analytical work. E/F may be re-ordered depending on whether direct original-source formalization is simpler than a second-module equivalence; both must hold before making a statement about the original physical Hamiltonian. H4/G is an optional improvement, not a dependency of H1. Do not force the larger geometry branch to finish before a smaller valid spectral proof; equally, do not assume F10DW alone constructs the requisite global unitary representation.

## 4. Source reuse and dependency minimization

Do a qualified-theorem inventory before adding any Lean source:

The `OperatorDependencies/` locators in the next four bullets refer to the **separate pinned package linked above**, not to files inherited by this exploratory branch. Source presence, historical qualification and applicability to a new gate must each be checked.

- `OperatorDependencies/FCPM3LUnitaryCliffordModuleExistence.lean` constructs a unitary generator-preserving Clifford intertwiner **under explicit algebra-equivalence/commutant/irreducibility premises**. Determine which premises can be instantiated with original Fock data.
- `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean` supplies the original Clifford-to-Fock algebra equivalence; do not confuse this with an independent paper module identification.
- `OperatorDependencies/SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe.lean` identifies the actual original-source normalized physical self-adjoint Hamiltonian and its weak-form characterization; it does **not** supply spectral existence.
- `OperatorDependencies/FCPM4F9H4E3D4C4ActualIndependentHistoricalUnitaryGraphImageEquality.lean` packages graph equivalence **under explicit matching hypotheses**; `OperatorDependencies/FCPM4F9H4G1BActualIndependentHistoricalNormalizableEigenpairTransfer.lean` transfers **existing** eigenpairs and does not produce any.
- F10BB provides the native `so(9) → so(16)` Lie homomorphism, F10BC the original algebraic Spin(9)→SO(16) group map, and accepted F10DW identity differentiability. Actual group-action agreement, global smoothness and derivative identification remain separate unless a qualified theorem says otherwise.

Use Schur's lemma/uniqueness of implementers as a **candidate shortcut**: after an exact generator-preserving unitary, two continuous SU(2) (respectively Spin(9)) implementers of the same Clifford action differ by a scalar character. Prove triviality of the character, required continuity/connectedness, and the underlying group lifts before claiming agreement. Then prove equality of every original smooth charge and both closed graphs; do not infer closed operators from equality only on a non-core dense subset.

## 5. Operational safety and negative knowledge

- This roadmap is the sole **new** document on the experimental branch. All preexisting sources, tests, workflows, accepted gate records, and the parent research branch must remain unchanged by this documentation-only action. Do not open or update upstream PRs without a separate explicit owner decision.
- The branch inherits all tracked cache manifests, validators and workflow source from its exact parent commit, **not** necessarily usable branch-scoped GitHub cache objects. Refer to [accepted DD/AI cache pilot](FCP_DD_AI_CACHE_PILOT_2026_11_06.md): 175 cached ancestors, 666 re-audited roots, exact environment/source keys, warm import audit, fresh new source/parents, manual cold path, and failure-closed corruption policy. A sibling branch may cold-build; never imply automatic cross-branch cache access.
- Keep the frozen original 2026-11-06 research discussion separate from certified declarations. Numerical matrix experiments are diagnostics; proof sketches are not Lean evidence; an existing imported file with a prospective header may be compilation-qualified in the **combined package** without each historical standalone gate being accepted.
- If a false inequality, gauge/action mismatch, invalid cutoff, bad bounded-energy escape, or failed model comparison appears, record its exact hypotheses and counterexample. Do not rewrite it into a misleading green result.
- Review every new lemma's model, quantifiers, domains, source names, constants, permitted axioms and scope before generating CI. Prefer small independent symbolic fixtures to long speculative red/green cycles. Preserve original failed attempts and causal diagnoses.
- No source rewrites, CI trigger, data download, new publication, main/upstream changes or new scientific acceptance are part of this **roadmap-only** commit.

## 6. Proposed first bounded experiment after roadmap review

Choose **Gate A plus the sharp sphere-average inequality** as the first analytical mini-audit. Build one independent, source-pinned derivation with a fully explicit theorem statement, coefficient table and adversarial examples. Ask: can a normalized, source-defined physical state in a fixed high-`λ₂` sector make the candidate H1 coercive bound false?

Only after that audit succeeds should a new Lean theorem gate be chartered. A successful theorem gate must state precisely whether it proves (i) finite-dimensional Clifford/weight algebra, (ii) a smooth-core form estimate, (iii) a closed-source-operator estimate, or (iv) actual positive spectral existence. Those are distinct milestones.

The [completed bounded A/B audit](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md) supports designing independent finite-CAR and sphere-average formalizations. It derives the conditional H1 coefficients, including the oscillator factor `2 sqrt(beta)`, but does not qualify the full source form estimate. Gauge invariance makes the one fixed-direction density moment equal to its sphere average, so a separate rotated oscillator family is unnecessary for this averaging step. Gate C and the source-form/domain obligations remain decisive holds.

The [C audit](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) narrows that hold: finite normalization and an explicit nonempty-sector route survive analytically, while the literal source Spin(9)-domain continuous Fock lift and its gauge/core agreement still need construction. A gauge-domain sixteen-block Fock homomorphism in the separate operator package must not be mistaken for that Spin(9) map. Prioritize this exact binding and an adversarial Gate D test in the named candidate sector over another count of rotation planes. No spectral theorem or full source confinement estimate has been admitted.

The [D/source-lift audit](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md) supplies the first cancellation-preserving channel test and an exact rejected shortcut. Pinned Mathlib already has general covering-map lifting; the missing inputs are the actual source covering and source-domain lifting criterion, not a generic wrapper. The next spectral discriminator is a uniform near-valley annular comparison or a genuine same-sector escaping family. The frozen-channel gap cannot replace the full operator or its domains. H1 and the optional-H4 gate ordering remain unchanged.

The [E route](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md) supersedes that moving-frame task as a prerequisite for **conservative H1**. The scalar form `beta T+W` is invariant under bosonic-only color pullbacks, which preserve the full-space Spin(9) type; averaging the rotated estimates gives the same sharp sphere factor without invariant density. The full q is not asserted invariant under those auxiliary pullbacks. The next bounded formal analysis targets are linear-moment bump/tightness lemmas, while the decisive source obligations remain the actual action, source core-form identity and physical closed-domain/reduction binding. Sharper frozen/H4 thresholds remain optional and unadmitted.

**Decision principle:** seek a decisive truth test, including a counterexample, not merely the next compilable lemma. Preserve accepted F10DW geometry while exploring the shorter spectral route.
