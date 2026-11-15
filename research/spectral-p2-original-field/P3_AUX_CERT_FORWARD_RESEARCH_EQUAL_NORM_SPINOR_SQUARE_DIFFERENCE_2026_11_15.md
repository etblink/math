# Forward research: compare equal-norm spinor squares before identifying a differential Hamiltonian

2026-11-15 Pacific. Audited snapshot: f432548d366518c5d8c04d9f6f8b2138decba577, integration/bfss-unified-research-20261108.

**Status:** source-backed research deduction and prospective theorem contracts. No new Lean declaration, adapter or physical theorem is qualified here. G13 R2 [43746155492](https://github.com/etblink/math/actions/runs/43746155492) is left unchanged; no parallel CI is launched.

## Decision

For the individual-charge energy prerequisite, first compare two original supercharge squares on the same physical smooth-core vector. The inspected source formulas suggest that equal-norm real spinors have identical kinetic, quartic and spinor-norm-proportional fermion contributions. Subtracting their squares cancels those common terms. The remaining orbital and fermionic terms have the signs of the exact source Gauss equation.

If this source assembly qualifies, basis spinors give equality of all sixteen charge squares on the actual invariant core. The existing source charge_symmetric theorem then gives equal charge norms. Since coreForm is defined as their normalized average, the required per-charge norm identity follows without independently identifying a new differential Hamiltonian.

This is a more focused energy-algebra contract. Physical Spin(9) covariance remains a separate highest-priority forward obligation. Self-adjointness and spectral-domain identities remain separate even after the proposed core norm result.

## 1. Literal objects and source hypotheses

For explanatory notation only, let

\[
Q(w)=\sum_{\alpha=1}^{16}w_\alpha Q_\alpha,\qquad
n(w)=\sum_\alpha w_\alpha^2,\qquad
W_w(x)=\sum_{k=1}^{9}(w^\mathsf T\Gamma_k w)\,\mathrm{spatialColor}(x,k).
\]

These are sourceAllSpinorCharge, spinorSquareNorm and sourceSpinorWeightedColor, respectively. The exact original gamma orientation, CAR normalization, theta order and -i kinetic factor must be retained. The quartic and Fierz adapters expose normalized-Pauli color matching; the kinetic/Fierz adapters expose M.gamma = originalGamma. They are not generic consequences of an arbitrary AlgebraData structure. The inspected [FullAlgebraData source](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSFullAlgebraDataProbe.lean) defines concreteAlgebraData.color as normalizedPauli and gamma as FCP.BFSSGamma9.gamma. The inspected [G1A source](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean) defines pairedAlgebraData with exactly those concrete color/gamma fields. L6G1 abbreviates originalGamma by this same gamma family. These matching premises therefore have direct source-definition bindings in the actual paired realization; their native adapters still need strict consumption.

Let C_c be sourceFiberFermionColorCurrent, with literal factor -i/2 multiplying the ordered theta-pair sum. L6G6K defines the skew generator

\[
J_c=iC_c.
\]

For a fixed color vector u at a point x, write the exact G7T Gauss expression as

\[
\mathcal G_u f(x)=
-Df_x(\mathrm{gaugeTangent}(x,u))
-\sum_c u_c\,J_c f(x).
\]

G7T proves this equals zero for every color vector u, every actual pairedGaugeData.invariantCore vector f, and every x. This is the source-defined gauge-physical core; it is not a Spin(9)-singlet condition.

## 2. Source decomposition and the signs

G4B's sourceAllSpinorCharge_normalOrder_response expresses Q(w)^2 as a scalar coefficient half-square plus its ordered fermionic response.

The scalar half-square is already separated by G5P into:

- a second-derivative term with coefficient -n(w)/2;
- one half of sourceSpinorOrderedMixedTerm;
- the original quartic potential multiplied by n(w).

G5Q proves the ordered mixed term equals twice the genuinely right-ordered mixed operator. Thus the CAR factor one half cancels this two exactly. G5W evaluates that right-ordered term as -i times the orbital directional derivative. Converting the coordinate derivative sum to the actual fderiv still requires an explicit source adapter; the inspected G7P/Q coordinate and tangent-sign results give supporting interfaces. No derivative may be moved onto W_w.

The G6H Fierz channel is literally a norm-proportional gamma/theta channel minus a spin-diagonal channel weighted by w^T gamma_k w. Its response carries i/2. Consequently the second channel has coefficient -i/2, exactly the factor defining C_c. G6I supplies the spin-diagonal color-current projection and G6K supplies its actual fiber evaluation.

For equal-norm w,z, subtracting G6H's response therefore suggests the precise finite contraction

\[
F(w)f(x)-F(z)f(x)
=\sum_c\bigl(W_w(x)-W_z(x)\bigr)_c\,C_c f(x).
\tag{F}
\]

The common norm-proportional fermion channel cancels; there is no need to assign it a new Hamiltonian name. Formula (F), including finite reindexing and real/complex scalar transport, is a new source assembly obligation. Neither the G6H nor G6I header alone proves it.

For u=W_w(x)-W_z(x), the remaining orbital plus fermionic difference is then

\[
-i\,Df_x(\mathrm{gaugeTangent}(x,u))
+\sum_c u_c C_c f(x)
=i\,\mathcal G_u f(x).
\tag{S}
\]

The sign uses C_c=-iJ_c. Replacing the source skew generator J_c by the Hermitian current C_c inside G7T would give the wrong equation.

An exact symbolic scalar sanity check confirmed the one-half/two cancellation and -iD+C=i(-D-J) after J=iC. This checks bookkeeping only. It is neither a noncommutative source assembly proof nor Lean qualification. No theta order was exchanged in deriving these proposed contracts.

## 3. The smaller square-difference contract

The proposed full-source target, for n(w)=n(z), is

\[
\bigl(Q(w)^2f-Q(z)^2f\bigr)(x)
=i\,\mathcal G_{W_w(x)-W_z(x)}f(x).
\tag{D}
\]

First prove it on the original SmoothCore with all source matching hypotheses visible. Then specialize the actual paired data and invariant core to use G7T:

\[
Q(w)^2f=Q(z)^2f.
\tag{P}
\]

Pointwise substitution into G7T is legitimate: for each fixed x, use the single color vector u=W_w(x)-W_z(x). G7T quantifies over all u. No derivative of this x-dependent choice is taken. An expression with derivatives acting on W would require additional terms and would not be discharged by this reasoning.

For real coordinate spinors e_alpha, a separate finite basis adapter must establish Q(e_alpha)=M.charge alpha and n(e_alpha)=1. Formula (P) then yields

\[
Q_\alpha(Q_\alpha f)=Q_\beta(Q_\beta f)
\]

on the actual invariant smooth core, for every alpha,beta. These are original smooth-core compositions, not assertions about maximal unbounded domains.

This approach avoids an unnecessary prerequisite: identifying each term with a separately defined differential Hamiltonian before comparing individual charges. The accepted Hamiltonian is already fixed by the normalized original charge-column form.

## 4. From square equality to the needed core energy identity

Core.lean defines CoreSymmetric(A) by

\[
\langle Af,g\rangle_{L^2}=\langle f,Ag\rangle_{L^2},
\]

with explicit coreToL2 embeddings, and proves M.charge_symmetric for each original charge.

Use g=Q_alpha f. Then

\[
\|Q_\alpha f\|_{L^2}^{2}
=\langle f,Q_\alpha^2 f\rangle_{L^2}.
\]

If the proposed square equality qualifies, all sixteen norms are equal. The literal source definition

\[
M.\mathrm{coreForm}(f)=\frac1{16}\sum_\beta
\|\mathrm{coreToL2}(Q_\beta f)\|^2
\]

then immediately gives the desired contract

\[
\boxed{\|\mathrm{coreToL2}(Q_\alpha f)\|^2=M.\mathrm{coreForm}(f)}.
\tag{E}
\]

The finite cardinality is sixteen; no paper normalization is imported. Formal symmetry supplies the integration-by-parts step already present in the source, so a new standalone integration calculation is not needed for this implication.

The square comparison and its norm consequence are not presently accepted results. They need literal source adapters, a native paired invariant-core consumer and strict axiom qualification.

## 5. Domain consequences and their limit

If (E) is proved on the common source core, it yields the strong graph-norm relation

\[
\|Tf\|^2=16\|Q_\alpha f\|^2.
\]

Here T is the accepted original closed joint-charge column, with its graph defined by closure of that common core. Applied to differences of core vectors, this relation makes a single-charge graph-Cauchy sequence simultaneously Cauchy in all sixteen outputs. Completeness and the defining joint graph closure then give equality of each individual minimal-closure domain with D(T). Conversely, joint graph approximation already gives inclusion into each coordinate closure.

This is a mathematical deduction conditional on (E) and the exact core/closure identifications. Its Lean graph adapters remain to be supplied. It can first be formulated with ambient FullL2 outputs. The prior [D3B/D2A/BF audit](P3_AUX_CERT_FORWARD_RESEARCH_RECOVERED_PHYSICAL_CHARGE_OUTPUT_CLOSURE_2026_11_15.md) supplies a source route to restricting those outputs to the actual physical space without changing the domain.

After that restriction, each individual closed physical charge has the same norm form as H=T†T/16. Associated-operator uniqueness would identify its adjoint-square Q_alpha† Q_alpha with H. This is still not Q_alpha^2=H unless the individual charge is self-adjoint on the required domain. No claim of essential self-adjointness, resolvent intertwining, Spin(9) reduction or spectral negative-power domains follows just from these norm equalities.

The original [averaged-resolvent contract](P3_AUX_CERT_FORWARD_RESEARCH_AVERAGED_RESOLVENT_AND_CHARGE_CLOSURE_2026_11_14.md) therefore retains its remaining spectral assumptions.

## 6. Bounded sequence for a future proof lane

| Step | Source-shaped exit condition |
| --- | --- |
| Fermionic difference | Prove (F) using G6H/I/K, with equal-norm hypothesis and exact ordered theta products |
| Scalar difference | Combine G5P/Q/W and a literal coordinate-sum/fderiv adapter; retain the -i sign |
| Gauss assembly | Join the differences into (D), then consume actual paired G7T on invariantCore |
| Basis and energy | Qualify basis-spinor specialization, core square equality and (E) via charge_symmetric/coreForm |
| Closure bridge | Prove common minimal domains and normalized forms using the existing original graph/core definitions |
| Spectral step | Separately establish the individual self-adjointness/domain or direct averaged-resolvent theorem needed by the certificate |

Begin with the fermionic difference contract, rather than a large full-superalgebra or closed-operator identity in one gate. A small abstract finite-sum helper may support that contraction; the consumer must still name the literal original source response and current.

Keep G13, the bounded full rotation/tau-norm algebra and the highest physical symmetry/energy-domain research allocation. This note adds a smaller energy proof target; it does not launch it while G13 is running.

## 7. Source pins and qualification boundary

The following source interfaces were inspected at the pinned snapshot. Full hashes, claims and the bookkeeping-only check are also preserved in the [source audit JSON](diagnostics/P3_AUX_CERT_EQUAL_NORM_SQUARE_DIFFERENCE_SOURCE_AUDIT_2026_11_15.json).

| Original source file | Current Git blob |
| --- | --- |
| [SU2BFSSPhysicalDomainL6G3OriginalChargeNormalOrderProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G3OriginalChargeNormalOrderProbe.lean) | 93b5f1eb20b4ff6f23f7f8334ad1c382d5ecd632 |
| [SU2BFSSPhysicalDomainL6G4BOriginalCoefficientCommutatorProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G4BOriginalCoefficientCommutatorProbe.lean) | c043464e7e605d4a3f456060da9e66d3beecb549 |
| [SU2BFSSPhysicalDomainL6G5POriginalScalarMixedRemainderProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G5POriginalScalarMixedRemainderProbe.lean) | 980ddf4dd5593c2464476513b75b8e064eff2af2 |
| [SU2BFSSPhysicalDomainL6G5QOriginalDiagonalMixedCommutatorProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G5QOriginalDiagonalMixedCommutatorProbe.lean) | 42d758cc80ecb9bea781f636e53877d285a17cf6 |
| [SU2BFSSPhysicalDomainL6G5WOriginalOrbitalGaugeTangentProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G5WOriginalOrbitalGaugeTangentProbe.lean) | 7fccbe6d246eb12e238c1041e730926807512b98 |
| [SU2BFSSPhysicalDomainL6G6HOriginalOrderedMajoranaFierzAssemblyProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G6HOriginalOrderedMajoranaFierzAssemblyProbe.lean) | fa4c225a10c9d78b8dd35c42a8d5dc1e6d2d311d |
| [SU2BFSSPhysicalDomainL6G6IOriginalFermionColorCurrentProjectionProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G6IOriginalFermionColorCurrentProjectionProbe.lean) | 0be30a74442f65545b1c4fccf57de350a5b2b914 |
| [SU2BFSSPhysicalDomainL6G6KOriginalBoundedFermionColorCurrentProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G6KOriginalBoundedFermionColorCurrentProbe.lean) | b71adefca6898253e8c7b6c9ad72b70296f2e958 |
| [SU2BFSSPhysicalDomainL6G7TOriginalFullColorLieGaussIdentityProbe.lean](https://github.com/etblink/math/blob/f432548d366518c5d8c04d9f6f8b2138decba577/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G7TOriginalFullColorLieGaussIdentityProbe.lean) | dca9ab9edb0019189e275ee025d083eed5cc3f3c |

Core.lean supplies the literal coreForm and charge_symmetric definitions/theorem. The earlier recovery separately checked historical full-contribution qualification; this note performs no fresh Lean build, no new historical artifact audit and no current-closure requalification. Existence of the pieces does not qualify their proposed assembly.

The active G13 proof, workflow and gate checkpoint are unchanged by this research. No mass-gap, zero-mode existence, physical Hardy or fidelity bound is claimed.
