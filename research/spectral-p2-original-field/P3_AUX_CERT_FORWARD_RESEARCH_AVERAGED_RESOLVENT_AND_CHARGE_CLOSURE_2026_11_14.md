# Certificate forward research: averaged resolvents and individual charge closure

Date: November 14, 2026 Pacific / November 15 UTC. Source snapshot: `c82f81665b6d2362238e0da798276569857a7c67`, downstream branch `integration/bfss-unified-research-20261108`.

**Classification: conditional mathematical analysis and source inventory, not Lean qualification.** Prepared while G9 R3 strict [#43679125806](https://github.com/etblink/math/actions/runs/43679125806) tests `b8bbae75b03a3eff9df7a6f15915b161a8d998b5`. This memo changes no source, consumer, workflow, qualification or running-gate contract. G8 remains the latest accepted algebra gate; the original normalized Hamiltonian retains its separate M5BF0 receipt.

## Decision

Keep G9 and the bounded charge/tau algebra moving. Refine the highest forward energy/domain audit around three exact targets: physical output preservation, a single-charge norm identity on the actual invariant core, and an averaged bounded-resolvent identity. The last is sufficient for the certificate; a complete closed-operator superalgebra is a possible sufficient route, rather than the minimal first contract.

Retain the adjoint-square partner operator as an alternative with a different Hardy obligation. Do not treat its abstract spectral identity as a shortcut to the paper's physical-sector estimate.

## 1. Carriers and normalization

Use the original physical Hilbert space E, the ambient original `FullL2 2` space F, and K = `PiLp 2` of sixteen copies of F. Let T: D(T) subset E -> K be the actual closed, densely defined original charge column. Its coordinate is chi_alpha = (T psi)_alpha, initially an ambient F vector. The accepted normalization is

\[
 H=\frac1{16}T^\dagger T,
 \qquad h[\psi]=\frac1{16}\|T\psi\|_K^2,
 \qquad D(h)=D(T).
\]

Let S_epsilon be the original positive-radial-regulator weighted charge graph, z = S_epsilon psi, and B_epsilon its bounded positive reciprocal multiplier on F. Write B_16,epsilon for its diagonal lift to K. The source reciprocal identity is T psi = B_16,epsilon z, with its actual graph/domain hypotheses. Set q_epsilon[psi] = ||z||_K^2 / 16. Do not silently replace these objects by independently defined supercharges.

The spectral shift t > 0 below is independent of the fixed radial regulator epsilon > 0. Taking t down to zero does not take epsilon down to zero.

## 2. A smaller sufficient certificate contract

For normalized physical singlets psi in the weighted graph domain, seek the identity

\[
 \boxed{\quad
 \frac1{16}\sum_\alpha
 \langle\chi_\alpha,(H+t)^{-1}\chi_\alpha\rangle_E
 =\langle\psi,H(H+t)^{-1}\psi\rangle_E,
 \quad t>0.\quad}
\tag{R}
\]

This expression first requires each chi_alpha to belong to E. The source type of T alone does not supply that fact. In addition, require a genuine closed physical spinor sector E_S, each chi_alpha in E_S for singlet psi, and reduction of H by that sector. Then eta_alpha = (H+t)^(-1) chi_alpha belongs to D(H) intersect E_S.

Assume the source-matched Hardy inequality

\[
 \|B_\varepsilon\eta\|_F^2\le\kappa h[\eta]
 \quad(\eta\in D(h)\cap E_S),
\tag{H}
\]

with the physical inclusion understood isometrically. No numerical value of kappa is imported here. For a_alpha = <chi_alpha, eta_alpha>, positivity and the resolvent equation give

\[
 a_\alpha=h[\eta_\alpha]+t\|\eta_\alpha\|^2\ge0.
\]

Reciprocal pairing and Cauchy--Schwarz give

\[
 a_\alpha
 =\langle z_\alpha,B_\varepsilon\eta_\alpha\rangle_F
 \le\sqrt\kappa\|z_\alpha\|_F\sqrt{a_\alpha},
 \qquad a_\alpha\le\kappa\|z_\alpha\|_F^2.
\]

The intermediate inequality uses the absolute value if needed; a_alpha is real and nonnegative. Average, apply (R), and use spectral functional calculus:

\[
 \|(I-P_{\ker H})\psi\|^2
 =\lim_{t\downarrow0}\langle\psi,H(H+t)^{-1}\psi\rangle
 \le\kappa q_\varepsilon[\psi].
\]

The result is the desired conditional fidelity certificate. This derivation uses bounded shifted resolvents and a bounded spectral multiplier; it need not first construct H^(-1) chi or prove an original-H spectral gap. Extending to larger trial-state domains, if desired, requires a separate approximation argument.

Michel--Scheinpflug--Yin, [Appendix B](https://arxiv.org/html/2611.09837v1#A2), uses a shifted-resolvent proof and the individual physical identity Q_alpha^2 = H. Our refinement is that its averaged scalar consequence (R) already suffices with the actual normalized charge column. This is a proposed source contract, not a claim that the repository has proved (R), (H), or the physical sector assumptions.

### A sufficient column-level bridge

After physical-output preservation, codomain-restrict the same T to a closed operator hat T: D(T) -> E^16, without changing graph or values. A sufficient theorem is

\[
 \widehat T(H+t)^{-1}\psi
 =((H+t)^{-1})^{(16)}\widehat T\psi,
 \qquad \psi\in D(T).
\tag{I}
\]

The left side is defined because the resolvent maps E into D(H), hence into D(T). With the accepted weak form, (I) implies

\[
 \frac1{16}\langle\widehat T\psi,
 ((H+t)^{-1})^{(16)}\widehat T\psi\rangle
 =h(\psi,(H+t)^{-1}\psi)
 =\langle\psi,H(H+t)^{-1}\psi\rangle.
\]

Thus (I) is one concrete sufficient audit target. It is not automatic from H = T-dagger T / 16. Individual self-adjoint physical charges with square H would also imply it; a source proof of (R) by another route would suffice.

## 3. A core identity with an immediate domain payoff

The promising source-core target, for every original spinor index alpha, is

\[
 \|\operatorname{coreToL2}(M.\operatorname{charge}\alpha\,f)\|_F^2
 =M.\operatorname{coreForm}(f)
 =\frac1{16}\sum_\beta
 \|\operatorname{coreToL2}(M.\operatorname{charge}\beta\,f)\|_F^2
\tag{C}
\]

for every f in the actual invariant smooth core. The notation specifies the intended source binding; (C) is not an existing qualified declaration identified by this audit.

If (C) holds on the actual graph-dense core defining T, pass to graph approximants to obtain

\[
 \|(T\psi)_\alpha\|_F^2=\frac1{16}\|T\psi\|_K^2,
 \qquad\psi\in D(T).
\tag{C'}
\]

This proves more than equality of energies. Define C_alpha = coordinate_alpha composed with T, with domain D(T). If psi_n converges in E and C_alpha psi_n converges in F, apply (C') to differences to see that T psi_n is Cauchy. Closedness of T gives psi in D(T) and convergence to T psi. Hence **each C_alpha is closed**. A coordinate of a general closed column need not be closed; the norm identity is the missing reason here. The graph norms are equivalent because ||T psi|| = 4 ||C_alpha psi||. The original core is consequently a graph core for every C_alpha, identifying the minimal individual closures with these operators.

There is also a small physical-output extension. If every original core charge has values in the actual closed physical subspace E of F, graph approximation and continuity of each coordinate imply C_alpha(D(T)) subset E. This is the source adapter to prove; physical inputs in the type of T do not establish physical outputs.

After that codomain restriction, equality of closed quadratic forms yields C_alpha-dagger C_alpha = H. This conclusion does not require symmetry. Source formal symmetry can additionally extend through the graph core. **A closed symmetric C_alpha still need not be self-adjoint.** Neither (C') nor C_alpha-dagger C_alpha = H by itself proves C_alpha^2 = H or resolvent intertwining. A distinct maximal-domain, essential-self-adjointness, or direct-resolvent argument remains necessary.

## 4. Source inventory and precise reuse boundaries

All source names below are in `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/` at the pinned snapshot. Presence was inspected; current strict receipt-to-byte matching must precede promotion or reuse in a new gate.

| Source stem | Useful existing content | Boundary |
| --- | --- | --- |
| `SU2BFSSPhysicalDomainL6G3OriginalChargeNormalOrderProbe` | `sourceCharge_normalOrder`, `sourceAllSpinorCharge_normalOrder` for actual source charges | Ordered coefficient terms still need assembly |
| `SU2BFSSPhysicalDomainL6G4BOriginalCoefficientCommutatorProbe` | Coefficient commutators and `sourceAllSpinorCharge_normalOrder_response` | No individual closed-operator square theorem |
| `SU2BFSSPhysicalDomainL6G5COriginalKineticDifferentialSquareProbe`; `L6G5OOriginalComplexQuarticOperatorProbe`; `L6G5WOriginalOrbitalGaugeTangentProbe` (same prefix) | Kinetic square, quartic potential, right-ordered orbital Gauss contribution | Source constants, signs, hypotheses and ordering must match |
| `SU2BFSSPhysicalDomainL6G6GOriginalFermionFullFierzCoefficientProbe`; G6H ordered-Majorana assembly; G6I color-current projection; G6K bounded color current | Fierz channels and actual fermionic color-current components | Ingredients for the remaining source square calculation, not its completion |
| `SU2BFSSPhysicalDomainL6G7SActualInvariantSmoothCoreInfinitesimalGaussProbe`; `SU2BFSSPhysicalDomainL6G7TOriginalFullColorLieGaussIdentityProbe` | Actual invariant-core infinitesimal/full-color Gauss identities | Core statements, not unbounded generator-domain theorems |
| `SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe` | Original closed physical-input charge graph and graph-core construction | Codomain is ambient sixteen-output space |
| `SU2BFSSPhysicalDomainL6H5E8BCOriginalPhysicalChargeNaturalAdjointSquareProbe`; `SU2BFSSPhysicalDomainL6H5E8BDOriginalPhysicalChargeAdjointSquareSelfAdjointProbe` | Generic natural composition, graph, weak-form and shifted-surjectivity machinery | Possible analytical donors, not a qualified partner-Hardy transfer |

G7T supplies `actualInvariantCore_fullColorLieGauss_zero` for every fixed color vector w, core f and point x. At each point it can be instantiated with w depending on that point, provided the residual is right-ordered so no derivative acts on w. Moving w through a derivative would introduce a new term and invalidate this inference. This is a concrete route to removing the Gauss residual in (C), after the complete square calculation and source signs are checked.

Outside that directory, `SpectralMasslessCoreFormIdentity.lean` identifies the averaged core form with gradient/potential/Y terms; it does not supply (C). `BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean` concerns bounded Gram-observable covariance, not charge-domain covariance. `FCPIndependentSmoothSuperchargeFermion.lean` supplies a fermion multiplier/intertwiner, not the full independent differential supercharge. The accepted `P3AuxCertP0OriginalReciprocalHilbertPairing.lean` is the relevant native reciprocal-pairing interface for section 2.

## 5. Partner operator: valid identity, different Hardy problem

Set A = T/4: E -> K, so H = A-dagger A. For the densely defined closed A, L = A A-dagger is a nonnegative self-adjoint operator on K. Polar decomposition gives

\[
 \langle A\psi,(L+t)^{-1}A\psi\rangle_K
 =\langle\psi,H(H+t)^{-1}\psi\rangle_E,
 \qquad\psi\in D(A).
\tag{P}
\]

The standard adjoint-square partner relation and resolvent formulas are recorded in [Teschl, Mathematical Methods in Quantum Mechanics, second edition, Theorem 8.6](https://www.mat.univie.ac.at/~gerald/ftp/book-schroe/schroe2.pdf), printed pages 214--215. Formula (P) is the present application of that operator analysis to the normalized original column. It requires no assertion that each individual charge is self-adjoint or commutes with H.

To turn (P) into the desired bound, however, one needs an output-space estimate of the form

\[
 \|B_{16,\varepsilon}\xi\|_K^2
 \le\kappa\|A^\dagger\xi\|_E^2
\tag{PH}
\]

on a suitable sector, at least for the resolvent vectors xi = (L+t)^(-1) A psi. A natural candidate domain is D(A-dagger) intersect closure Ran(A), further restricted by the correct singlet-induced output symmetry; the resolvent and that restriction must be compatible. Pairing has the factor <A psi,xi> = <z,B_16,epsilon xi>/4, so (PH) would give the same kappa q_epsilon bound.

The componentwise physical-H Hardy estimate does not imply (PH): A-dagger mixes the components, permitting cancellations. An unrestricted (PH) is impossible if ker(A-dagger) contains a nonzero vector, since B_16,epsilon is injective. Restricting to closure Ran(A) removes that immediate obstruction but proves no coercivity by itself. A proposed proof of (PH) must also be checked for circularity with the desired weighted spectral bound. **Disposition: preserve as a conditional alternative, with no priority promotion.**

## 6. Next review and stop lines

The next forward review should decide whether the inventory can assemble (C) on the actual invariant core and establish physical output preservation with exact source hypotheses. If successful, it produces closed individual charge domains, a material analytical advance beyond another finite identity. Then compare the feasibility of direct (R)/(I) with essential self-adjointness of the actual physical charges.

Chernoff's primary research provides a concrete applicability-audit candidate ([1973 publisher record](https://doi.org/10.1016/0022-1236(73)90003-7); [1977 paper, section 2, Theorem 2.1](https://msp.org/pjm/1977/72-2/pjm-v72-n2-p08-s.pdf)). It combines controlled propagation with a local criterion for essential self-adjointness. Our proposed application is conditional: exhibit each ambient original charge on compactly supported smooth fields as a symmetric constant-principal-coefficient first-order operator plus a smooth Hermitian matrix potential. The principal symbol would give a uniform propagation bound; locally cut off the potential to obtain a bounded symmetric perturbation, then use the local theorem. This could avoid needing a small global potential bound.

The physical restriction still needs source-exact gauge covariance, a reducing fixed space, and a proof that gauge-averaged test fields form a graph core there. Identify that closure with the repository's actual invariant-core closure. The coefficient, symmetry, regularity and core bindings are unproved audit targets; this memo establishes no application to BFSS.

In parallel, physical Spin(9), singlet-to-spinor covariance, reduction by H, and the Hardy form-domain extension remain decisive obligations. Do not promote the current finite algebra, the generic partner identity, a dimensional representation match, or a merely symmetric charge to those conclusions. No new Python experiment, Lean proof, strict run, fidelity theorem, zero-mode existence theorem, or mass-gap claim results from this research.
