# BFSS × QIT × Structural Counterfactual Capacity (SCC): observable-relative counterfactual test
Date: 2026-11-16 Pacific. **Forward research only / NO new Lean qualification**.
Project Lead; branch `integration/bfss-unified-research-20261108`; audited starting point `9051879253a569e4cfea190e47df65d8805ebccb`.

## Source and status discipline
SCC is a **previously developed conditional structural framework**, reconstructed here from earlier FCP/NFC project discussions. The original complete SCC monograph/source snapshot was not retrieved in this pass. Historical object:
`X=(A_X,W_X,T_X,D_X)` = support skeleton, admissible witness family, transported invariant, defect/interface ledger.
Historical obligations included **MCS** (Minimal Structural Carrier Selection), WeakGlue, **UC**, **TSI**. Historical closure labels (e.g. `CERT-PROJ`, conditional certificate) are NOT native Lean claims. Do not infer phenomenology, consciousness, independent ontology, or BFSS physical realization from SCC.

**Core question:** Does the SCC requirement that lawful counterfactual alternatives remain *witness-distinguishable under admissible transport* identify a better mathematical problem than operator equality on a chosen representation?

## Proposed crosswalk (candidate, NOT a proved SCC functor)
| SCC data | QIT instantiation | BFSS source-specific burden |
|---|---|---|
| `A_X` support | physical-sector Hilbert space and observable subalgebra `M` | establish genuine original gauge representation, invariant sector and bounded observable carrier |
| `W_X` witnesses | admissible state preparations, observables/POVMs, lawful conditional continuations | restrict to actually physical states and testable source operators |
| `T_X` transport | quantum channels or unitary Heisenberg actions preserving specified witness algebra | original Hamiltonian time evolution, gauge action, domain compatibility |
| `D_X` defect | lost distinguishability, failure of Heisenberg closure, nonuniqueness of minimal witnesses, missing source joins | preserve explicit failures and source/consumer evidence |

For finite-dimensional density operators `rho,sigma` and a unital *-subalgebra `M` of bounded observables, define an **observable-relative distance**
```
d_M(rho,sigma) = (1/2) sup { |Tr((rho-sigma) O)| :
                    O = O† in M, ||O|| <= 1 }.
```
This is a pseudometric on the full state space and a metric on the quotient by `rho ~_M sigma iff d_M=0`. If `M=B(H)`, it equals ordinary quantum trace distance. If `M_1 ⊆ M_2`, then `d_{M_1} ≤ d_{M_2}`: availability of additional witnesses cannot reduce distinguishing ability.

For a CPTP channel `Phi`, if the Heisenberg dual satisfies `Phi*(M_out) ⊆ M_in`, then
`d_{M_out}(Phi(rho),Phi(sigma)) ≤ d_{M_in}(rho,sigma)`.
Reason: `Phi*` is unital positive and norm-contractive on self-adjoint effects, so every admissible output witness pulls back to an admissible input witness. This is a concrete **transport admissibility condition**, not merely an analogy to SCC. If `Phi*` fails to preserve the chosen observable family, the monotonicity comparison need not hold.

## Worked adversarial counterexample: distinguishability is NOT automatically transport-stable
Let `H=C²`; `M_Z=span{I,Z}` be the diagonal observables, and let `rho_+=|+><+|`, `rho_-=|-><-|`, where `|±>=(|0>±|1>)/sqrt(2)`.
At time zero, both states give diagonal probabilities `(1/2,1/2)`. Therefore `d_{M_Z}(rho_+,rho_-)=0`, while `d_{B(H)}(rho_+,rho_-)=1`.

Now choose lawful unitary dynamics `U=exp(-i π Y/4)=(I-iY)/sqrt(2)`. Explicit matrix multiplication yields `U|+>=|1>`, `U|->=|0>`; hence
```
d_MZ(U rho_+ U†, U rho_- U†) = 1.
U† Z U = -X, not an element of M_Z.
```
There is **no contradiction with data processing**: the requisite Heisenberg-closure hypothesis failed. A counterfactual distinction initially invisible to a restricted witness family can become observable under allowed evolution. SCC's transported-invariant / weak-gluing burden is therefore substantial, not automatic.

This is a **restricted-measurement toy**, not an SU(2) gauge-quotient example. On the *full physical* operator algebra `B(H_phys)`, distinct density matrices on `H_phys` are distinguished. No false gauge equivalence or novel ontology follows from restricting to `M_Z`.

## A second counterexample: naive minimal-carrier selection is not unique
For the two branch states `rho_±`, both unital *-algebras `M_X=span{I,X}` and `M_V=span{I,V}` with `V=(X+Z)/sqrt(2)` separate the pair. Each is inclusion-minimal among unital *-subalgebras separating the pair (its only smaller unital subalgebra is the scalars), yet they are distinct and incomparable by inclusion.

Therefore the condition *"smallest witness algebra separating the displayed alternatives"* does **not** uniquely determine a canonical SCC carrier. One needs additional structure: admissible morphisms, physical selection criteria, transport closure, cost, or a specified equivalence notion. This is an explicit warning about the historical MCS obligation.

## Candidate branch capacity, rather than a single number
For a specified finite set of *admissible* counterfactual branches `B={rho_i}`, define
```
Sep_M(B) = {(i,j): i≠j and d_M(rho_i,rho_j)>0}.
```
A retained distinction under evolution is one whose output pair remains separated by the **transported and physically available** output witness family. One may also ask for quantitative epsilon-separated pairs. A claim about *persistence selection* would require an independently justified dynamical selection law; merely labeling stable pairs does not provide that law.

Quantum sufficiency / recoverability offers a stronger comparison: is a proposed compressed observable representation sufficient for the chosen **family** of branches (i.e. preserves all relevant decision tasks, or admits recovery on that family), rather than identical to the whole underlying Hilbert-space description? See Buscemi 2012 and Jenčová 2024 below.

## Application to our exact BFSS frontier
Current strict gate: **QTC1G0 R1 GREEN**, run #44024718712 with source/consumer evidence and original provider ZIP preserved at commit #9051879. This is generic original Fock real/complex quarter normalization only. QTC1 R1/R2 source `K(B)`/complex `Q_gamma(B)` direct joins are stopped REDs; QTC1G1 remains prospective, QTC2 blocked.

**Route A: existing typed Source48 join.** Prove literal original-source `K(B)=Q_gamma(B)` on true `Fermion 2` operator carrier. This is strongest, most reusable exact identity, and may still be cheapest.

**Route B: SCC/QIT observational action.** Instead of immediately proving operator identity, compare the two generators' commutator actions on a source-exact generating family `Gamma_p`. If the representation is irreducible and the generated algebra is the full `End_C(Fermion 2)`, then `[K(B)-Q_gamma(B),Gamma_p]=0` for all `p` implies `K(B)-Q_gamma(B)=lambda I`. If an independent trace/normalization argument shows `lambda=0`, obtain the exact identity. This explicitly isolates **observable transport**, **central ambiguity**, and **normalization defect**.

This route is only a **candidate**, not established by QTC1G0 or the prior Fock-operator automorphism gate. The source coefficient matrices and the Clifford gamma indices must match **exactly**; arbitrary non-skew `B` has scalar diagonal terms. We must audit which source-exact Clifford-to-`End` isomorphism and trace lemmas are actually present and qualified. If commutant and trace imports introduce more burdens than direct source join, record negative result and return to Route A.

**Route C: gauge-preserving counterfactuals.** On a genuine invariant physical sector `P H`, distinguish the gauge-invariant extended algebra, the compressed physical algebra `P B(H)^G P`, and an operationally restricted witness algebra `M`. Twirling an operator `E(A)=∫U_g A U_g†dg` is not the same map as physical vector projection `P=∫U_g dg`; no physical state exists merely because an operator was twirled. Actual BFSS full L² analytic and domain issues remain separate.

**Route D: ground-state fidelity.** A certified physical overlap `p` gives bounded-observable error `2||O||sqrt(1-p)` relative to normalized ground projection. This is a valuable informational witness theorem, but cannot create a physical eigenstate or prove the Hardy-type premise.

## Research decision and stopping conditions
**First microtask after this memo:** audit source-exact gamma matrix generation + Clifford-End isomorphism + tracial identities, then write a two-column cost comparison of Route A vs B. **No Lean implementation** until the comparison has independently checked source types and a distinct-consumer target. In parallel, preserve the diagonal-qubit counterexample as a countermodel for transporting observational equivalence without a witness-closure hypothesis.

A positive conceptual result is **not** a proof that SCC is realized by BFSS, that quantum information is a fundamental ontology, that emergent geometry exists, or that phenomenology follows. In particular, the SCC transport conditions and unique MCS problem remain independently open.

## Grounded literature
- van Neerven & Waaijer, *Indiscernibility of quantum states*, J. Math. Phys. 67, 052102 (2026), DOI https://doi.org/10.1063/5.0302377 : accessible-observable equivalence classes; observer-relative quotient, not a universal ontology.
- Buscemi, *Comparison of Quantum Statistical Models: Equivalent Conditions for Sufficiency*, Commun. Math. Phys. 310, 625–647 (2012), https://doi.org/10.1007/s00220-012-1421-3 : operational comparison of statistical experiments under quantum channels.
- Jenčová, *Recoverability of quantum channels via hypothesis testing*, Lett. Math. Phys. 114 (2024), https://doi.org/10.1007/s11005-024-01775-2 : sufficiency and information preservation for specified state families.
- Relative subsystems and quantum reference frame transformations, Commun. Phys. (2025), https://www.nature.com/articles/s42005-025-02036-x : invariant algebras, group twirling, and subsystem relativity.

## Source-exact witness-completeness audit (same day)
The follow-on [witness completeness / direct K-bracket source audit](BFSS_QIT_SCC_SOURCE_EXACT_WITNESS_COMPLETENESS_AUDIT_2026_11_16.md) identifies a mathematically precise injective witness signature (Majorana commutator actions + trace), potential direct bracket proof using qualified LB1C1 and CT0, and the **stopped** CT1G0 native Jacobi failures. The general theorem is not yet a native source qualification; source import and elaboration costs must be compared before changing the QTC roadmap.
