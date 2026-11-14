# Lovelock's theorem — conditional gravity-classification research for source-exact BFSS

**Date:** 2026-11-14 Pacific. **Status:** EXPLORATORY_RESEARCH_ONLY_NOT_LEAN_QUALIFIED; not a BFSS geometric theorem, spectral result or promoted candidate. **No changes** to the active C3D-C original SU(2) weighted Hilbert-domain density source, consumer, workflow, or gate. At investigation start, strict [#43579923559](https://github.com/etblink/math/actions/runs/43579923559) was `in_progress` at exact SHA `8f147e99397d5d50fbd5b375dd8ae6f12ff95ec9`. Roadmap [#43579923532](https://github.com/etblink/math/actions/runs/43579923532) was separately GREEN. These are **point-in-time statuses**; query CI for future acceptance.

## 1. Source-verified theorem, not a BFSS conclusion

The classic Lovelock (1971) result classifies natural rank-two geometric tensors built from one metric and its first two derivatives, with covariant divergence identically zero. In four spacetime dimensions the tensor is `a G_{μν} + b g_{μν}` with constant coefficients; Einstein tensor `G_{μν}=R_{μν}−(1/2)R g_{μν}`. Standard formulations also assume symmetry, although symmetry can follow from the classification. The theorem holds under **locality, metric-only dependence, natural covariance and at-most-second-order metric derivatives**. It is not a proof that physical nature must satisfy those premises.

Contracted Bianchi: `∇^μG_{μν}=0`; Levi-Civita metric compatibility `∇^μg_{μν}=0`. Illustration *not a proof of the full classification*: if `E_{μν}=aR_{μν}+bRg_{μν}+cg_{μν}`, then divergence-freedom imposes `b=−a/2`; the full Lovelock result excludes other natural rank-two 2-jet tensors without assuming this Ricci-linear ansatz.

References:
- Lovelock, *The Einstein Tensor and Its Generalizations*, J. Math. Phys. **12**, 498–501 (1971), DOI [10.1063/1.1665613](https://doi.org/10.1063/1.1665613); [OSTI record](https://www.osti.gov/biblio/4007118).
- Cambridge mathematical GR course notes, §12.1, [Lovelock theorem](https://www.damtp.cam.ac.uk/user/examples/D22Lb.pdf).
- Padmanabhan and Kothawala, *Lanczos-Lovelock models of gravity*, Phys. Rep. **531**, 115–171 (2013), [arXiv:1302.2151](https://arxiv.org/abs/1302.2151).

## 2. Higher-dimensional classification, with important topological distinction

General Lovelock action for a D-dimensional pseudo-Riemannian metric:
`S[g] = ∫_M √|g| ∑_{k=0}^{⌊D/2⌋} α_k L_k d^Dx`, where `L_k = (1/2^k) δ^{a1b1...akbk}_{c1d1...ckdk} R_{a1b1}^{c1d1} ... R_{akbk}^{ckdk}`. Special cases:
- `L_0=1` (cosmological volume term)
- `L_1=R` (Einstein–Hilbert)
- `L_2=Riemann²−4 Ricci²+R²` (Gauss–Bonnet)
- higher `L_k` are antisymmetric curvature polynomials whose bulk metric equations still have derivatives up to order two.

A term `k` yields a nontrivial *bulk metric equation* only if `D>2k`. At `D=2k` the term is an Euler-density topological invariant (closed oriented manifold/no boundary, standard constant coupling) with identically vanishing local bulk metric Euler–Lagrange variation; at `D<2k` the antisymmetrized density vanishes identically. Thus:
- D=4: largest dynamic k=1; k=2 topological.
- D=5: largest dynamic k=2.
- D=8: largest dynamic k=3; k=4 topological.
- D=9: largest dynamic k=4.
- D=11: largest dynamic k=5.

Sources: Padmanabhan–Kothawala [arXiv:1302.2151](https://arxiv.org/abs/1302.2151); Deruelle–Merino–Olea, *Chern-Weil theorem, Lovelock Lagrangians in critical dimensions, and boundary terms*, PRD **98**, 044031 (2018), [DOI](https://doi.org/10.1103/PhysRevD.98.044031); [curvature-form Lovelock formulas](https://link.springer.com/article/10.1140/epjc/s10052-016-3891-5).

## 3. Three geometries must not be conflated

**Original BFSS:** Current original Lean source `lean/OAI/MathematicalPhysics/BFSS/Core.lean` pinned blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` defines `M.charge α` on `SmoothCore N` using bosonic coordinate derivatives, gamma matrices, fermion action, structure constants, and `M.chargeVector`. It is matrix quantum mechanics with a literal SU2 gauge constraint; no spacetime metric `g_{μν}`, Levi-Civita connection, Riemann curvature, or `∇^μE_{μν}` has been derived in this source. Original core Hilbert-domain density and Hamiltonian positivity are **not** Lovelock hypotheses.

**11D BFSS/M theory:** The BFSS proposal is a large-`N` matrix quantum mechanics conjecture for 11-dimensional M theory; its nine bosonic *transverse matrix indices* are not nine spacetime dimensions, nor an intrinsic metric on 9D spacetime. Ref: Banks–Fischler–Shenker–Susskind, *M Theory As A Matrix Model: A Conjecture*, PRD **55** 5112 (1997), [arXiv:hep-th/9610043](https://arxiv.org/abs/hep-th/9610043). Eleven-dimensional supergravity higher-derivative corrections, including supersymmetric `R^4` combinations, cannot be identified as arbitrary Lovelock terms solely because a dimension admits them. Ref: Hyakutake–Ogushi, [arXiv:hep-th/0601092](https://arxiv.org/abs/hep-th/0601092); [higher derivative supergravities review](https://www.sciencedirect.com/science/article/abs/pii/S0370157324002722).

**Exploratory S8-in-R9 geometry (separate NFC/topology hypothesis):** On a closed oriented `S^8`, normalized quartic Euler curvature integrates to `χ(S^8)=2` under Gauss–Bonnet–Chern. This constrains *intrinsic eight-dimensional curvature* but does not prove `S^8` is BFSS spacetime, that ambient `R^9` carries a non-flat metric, or that any Euler integral bounds spectral energy. In 9D a quartic Lovelock density would instead be dynamically admissible if a genuine 9D metric theory were separately constructed. A bare 9D embedding alone provides neither such field equations nor identification with the original matrix physical space.

## 4. Non-obvious potential transports and their falsifiers

**A — Conditional emergent 4D gravity classification, highest strategic relevance but not immediate.** If one constructs from original gauge-invariant matrix observables a 4D Lorentzian effective metric `g`, proves local/diffeomorphism-covariant metric-only dynamics with at most second metric derivatives and identically vanishing covariant divergence, the effective geometric field tensor must lie in `span{G[g],g}`. **Falsifier/gap:** Without an actual metric carrier, covariance action, curvature/connection, local action, or divergence identity, there is no admissible application of Lovelock to BFSS. Identifying emergent 4D spacetime from N=2 alone would require substantial additional independent evidence.

**B — Formal topological filter; lower risk and sharply bounded.** In an independent pure-math exploratory module, formalize rank/antisymmetry `L_k=0` for `2k>D`, Gauss–Bonnet at critical `D=2k`, and `χ(S^8)=2` (perhaps reference/import characteristic-class library). Do not mark these as original physical BFSS theorems or assume a Hopf tower solves dynamical gravity. This is a useful falsification test for topology claims rather than new spectral evidence. A standalone Python symbolic antisymmetric-delta check could preflight indexing but cannot substitute for Gauss–Bonnet geometry.

**C — Dimensional reduction to gauge and scalar sectors, speculative comparative avenue.** Higher-D Lovelock reductions can give lower-D Einstein–Yang–Mills, scalar, and nonminimal interactions; therefore a careful action-level source and representation match could someday compare gauge geometry with matrix symmetries. **Gap:** BFSS SU2 internal gauge is not automatically Kaluza–Klein geometry; no identified compactification, effective metric, action reduction, or physical Hilbert equivalence. Ref: [Gravity actions, boundary terms and second-order field equations](https://www.sciencedirect.com/science/article/abs/pii/055032139090513D).

**D — Direct BFSS mass gap through Lovelock: NO viable direct transfer.** Lovelock classification does not yield `Sε` domain density, closed-graph cores, Hardy/coercivity estimates, (Sε†Sε) lower bounds, positive gaps or the original unregulated spectral theorem. Keep the C3D-C original source strict mathematical gate primary and do not spend CI on a Lovelock physics crosswalk yet.

## 5. Decision register

**Priority:** preserve as a source-grounded classification filter and optional pure-math characteristic-class diagnostic, not a promoted BFSS route or new core theorem. At most, revisit when the project has an explicit emergent metric observable or a legitimate dimensional-reduction transfer. **Owner of mathematical authority remains original pinned SU2 source + strict Lean proof/consumer/axiom gates.**

**Known common misreadings:** nine BFSS matrices ≠ 9D spacetime; `Spin(9)` internal/symmetry data ≠ Levi-Civita Spin(9) tangent bundle; SU2 gauge invariance ≠ gravitational diffeomorphism invariance; geometric Gauss–Bonnet ≠ Gauss law; 4D Gauss–Bonnet topological ≠ all quadratic curvature Lagrangians topological; 11D Lovelock *admissible* ≠ 11D supersymmetry *selected*; `χ(S^8)=2` ≠ a mass-gap lower bound.

**Repo mutation:** exploratory memo only. No active roadmap/checkpoint, Lean source, consumer, workflow, or `main` changes.
