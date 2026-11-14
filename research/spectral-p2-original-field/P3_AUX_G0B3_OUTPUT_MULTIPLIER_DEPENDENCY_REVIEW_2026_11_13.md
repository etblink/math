# P3 auxiliary forward investigation — physical preservation versus the output multiplier graph

**Date:** November 13, 2026 Pacific. **Status:** SOURCE-BOUND RESEARCH DESIGN; NO NEW LEAN GATE QUALIFIED OR STAGED. **Inspected integration snapshot:** a63d3cb985f335bb30f07710b5448f842cf1fc3e. Concurrent focused R4 #43549082375 is not polled or presumed by this investigation.

## 1. Project Lead finding

G0B3 original physicalSpace preservation is an economical algebraic join of the accepted G0B1 and G0B2 commutators. It needs no new almost-everywhere proof, combined gauge representation, Haar integral, Spin9 action or differentiable Gauss generator.

However, the original weighted-charge graph uses a physical **input** and ambient sixteen-component **output**. Preservation of the input physical subspace by an output multiplier is not a prerequisite for its closed inverse-image graph. Keep this useful physical compatibility result separate from the actual requirements: injectivity of the reciprocal on original FullL2, a genuine finite PiLp output lift, and the inverse-image graph construction.

This refines dependency planning; it does not change the accepted operator, source carrier, theorem checkpoint or concurrent R4 candidate.

## 2. Source authority and exact equalizer

Original GaugeCore.lean blob e4990dadf1d8bde849e351467282ab3f14989c3b defines, literally,

E=pairedGaugeData.physicalSpace
 = intersection_g ker(P_g-F_g),

where P_g=pairedGaugeData.bosonPullback g and F_g=pairedGaugeData.fiberAction g on original FullL2 2. The source bosonPullback g composes with boson g. Its membership equation uses the **same g** on both sides; no inverse is inserted.

For the separately packaged combined actual gauge action, L6G7V source blob cd7f1dd791daa930f5fa5a0016c607abc40903cd identifies E with the fixed space of F_g composed with P_(g^-1). That source is useful context but is not needed for G0B3.

Accepted exact inputs:
- G0B1 #43527998761, tested 233efc9273dfa17a3553445a14ccee51210930ce, source blob 28d0ed07d97008b4075b849b7dafd2d837a01423: B P_g f=P_g B f.
- G0B2 #43532571952, tested aca860c385a1f746210e83cceec81c3e0e215f08, source blob 0df4f07a9e27521081800a1d8cb451fb2d416e31: B F_g f=F_g B f.
- Original B=originalReciprocalFullL2CLM h_epsilon, source blob e2a02b551486cfbc2a723f5b5ff0b282177c5e76, acts on genuine FullL2 2, not an operator-valued replacement fiber.

Historical source comments may still say prospective. Qualification here comes from exact accepted receipts/current checkpoint, not those comments alone.

## 3. Minimal G0B3 proof design

Target: for every epsilon>0 and f in literal E, B_epsilon f belongs to E.

For each original g, extract P_g f=F_g f from kernel membership. Then

P_g(Bf)=B(P_g f)=B(F_g f)=F_g(Bf).

The first equality is G0B1 reversed; the middle equality is congrArg B of the physical-space equation; the last is G0B2. Reassemble membership in the original intersection of kernels.

**Uncompiled native proof skeleton:** unfold/change only GaugeCore.physicalSpace membership, use Submodule.mem_iInf, LinearMap.mem_ker, LinearMap.sub_apply and sub_eq_zero. Copy the already working physical-membership pattern from GaugeCore.invariantCore_equivariant or L6G7V. Invoke the exact accepted commutator namespaces explicitly.

There is no need to expand Lp representatives, the original finite Fock construction, or the definition of B. The eventual strict gate can use one preservation root and a literal physical-space independent consumer. A bounded restriction E→L[ℂ]E is optional subsequent packaging, not part of the initial minimal root.

**Quantifier safeguard:** the commutators are equalities of Lp elements for each g. The new proof never requires one pointwise full-measure set valid simultaneously for every element of the uncountable gauge group.

**Preservation is not automatically reduction:** for a general bounded operator, E-invariance alone does not establish commutation with the orthogonal projection. A later reduction proof must use an additional adjoint-invariance argument, self-adjointness of the real multiplier, or the full unitary gauge-commutant structure. Do not silently add that conclusion to G0B3.

## 4. The output carrier is already source-exact

AY source blob a9f27a48852ac570aedc8e0ab88d683250e6b138 defines

T=originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData
 : E -> partial-linear K,
K=PiLp 2 (fun _ : SpinIndex => FullL2 2).

It also defines originalMinimalHilbertOutputEquiv:K≃L[ℂ](SpinIndex→FullL2 2) using PiLp.continuousLinearEquiv. This is the precise continuous equivalence already used to construct the original physical Hilbert charge graph.

Thus the radial multiplier in the inverse-image graph acts on **K**, whereas physicalSpace constrains **E**. Neither B:E→E nor a Spin9 gauge-fixed projection is required simply to form

G_epsilon={(u,z) in E×K : (u,B16_epsilon z) belongs to graph(T)}.

Do not strengthen K to sixteen physical subspaces without a separate source/operator identification. Nor may the temporary product-coordinate construction replace the final Hilbert PiLp carrier.

## 5. Concrete output-lift reuse from pinned Mathlib

At Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612:

- Topology/Algebra/Module/ContinuousLinearMap/PiProd.lean supplies **ContinuousLinearMap.piMap** and coe_piMap'. The map is coordinatewise application of a family of continuous linear operators.
- Analysis/Normed/Lp/PiLp.lean supplies **PiLp.continuousLinearEquiv**, coe_continuousLinearEquiv and coe_symm_continuousLinearEquiv.
- AY uses that same PiLp equivalence in originalMinimalHilbertOutputEquiv.

Let J=originalMinimalHilbertOutputEquiv and Bpi=ContinuousLinearMap.piMap (fun _ : SpinIndex => B). Define the proposed operator

B16=J^-1 composed with Bpi composed with J.

This is a genuine bounded complex-linear map K→K by composition of the existing bundled continuous maps. The decisive source consumer should verify its coordinate equation (B16 y)_alpha=B(y_alpha). If B is injective, coordinatewise injectivity followed by J's injectivity proves B16 injective.

**Economy:** continuity/injectivity suffice for the closed graph construction. A sharp bound ||B16||<=1/epsilon is not needed at that stage. Generic composition bounds suffice. A continuous equivalence between PiLp2 and a finite product is not automatically isometric, so do not transfer sharp norm bounds through J by assertion. Prove an exact Hilbert-sum bound separately only when a later estimate needs it.

## 6. Next truly missing prerequisite: native reciprocal injectivity

Original R0B1 blob d1cbb8077799236e5e1b82704270bdb9ab9153b4 defines b_epsilon(x)=(originalRadialWeight epsilon x : C)^-1. Accepted R0A strict positivity, source blob a67f8740586588c6d4ee9c9148574c81c14d4937, implies this scalar is nonzero at every original configuration for epsilon>0.

Accepted G0B0 source blob 670cc600fdc42a03d21de759e8b46b6cb1306874 identifies Bf almost everywhere with b_epsilon(x) times f(x). Therefore Bf=Bh gives b_epsilon f=b_epsilon h almost everywhere, and pointwise nonzero-scalar cancellation gives f=h in original Lp.

This is a complete conventional argument but is not a new Lean result. A future source gate must prove the original scalar nonvanishing and use the actual AE representative equations plus Lp extensionality. Merely citing the pointwise weight lower bound does not qualify operator injectivity.

A direct native kernel/cancellation proof avoids any assumption that B has an everywhere-defined bounded inverse. Its range is generally proper.

## 7. Reuse the accepted graph machinery

Given a closed original T and bounded injective B16, the map (u,z)↦(u,B16 z) is continuous and linear. Its inverse image of graph(T) is a closed submodule.

A vertical element (0,z) in that inverse image gives (0,B16 z) in graph(T). Single-valuedness of T gives B16 z=0; injectivity gives z=0. The source Submodule.toLinearPMap and toLinearPMap_graph_eq pattern already used by AY then packages the graph as a genuine closed partial linear operator S.

Kernel preservation follows from (u,0) in graph(S) iff (u,B16 0)=(u,0) in graph(T). It does not require a physical-space preservation theorem about B.

The actual source proof should first establish this small generic graph lemma, then specialize to original T/B16. This applies the useful generic-first lesson from R4 without reusing any unqualified R4 native theorem.

## 8. Density and exact physical identification stay separate

Closedness does not imply dense domain. The proposed domain is {u in D(T): T u in range(B16)}; dense range(B16), even if proved, does not by itself establish density of this preimage.

For density, retain the original invariant SmoothCore route from D2B10C→AZ→BA:
- native charge of a source compactly supported smooth core vector is again compactly supported;
- multiplying each charge by the locally bounded regularized radial weight gives a genuine L2 output y;
- pointwise reciprocal cancellation yields B16 y=T f, so that original core vector lies in D(S);
- use the already established density of the original invariant core in E.

A global characterization of range(B16) as the maximal weighted-L2 domain is a separate identification theorem. It need not precede this explicit core-range witness, but it is needed before identifying the complete new graph with the desired maximal radial operator. Positive-epsilon domain stability, zero-regularization closability, Hardy inequality, physical Spin9 singlet structure and any auxiliary gap remain further obligations.

## 9. Revised bounded planning recommendation

| Item | Role | Current result |
| --- | --- | --- |
| G0B3 original physicalSpace preservation | Small physical-compatibility join of G0B1/G0B2 | Source-reviewed proof design; unqualified |
| Native B injectivity | Essential single-valuedness prerequisite | Source-reviewed AE cancellation design; unqualified |
| Native sixteen-output B16 | Essential bounded output action | Pinned piMap/J construction identified; unqualified |
| Generic inverse-image graph | Closedness and kernel control | AY pattern reusable; unqualified |
| Native core range witness | Physical-domain density | Existing core-density donors identified; weighted witness unqualified |
| Full weighted-domain identification | Exact maximal radial operator | Separate source obligation |
| Spin9/Hardy/paper equivalence | Spectral interpretation | Remains separate |

Keep G0B3 as a bounded compatibility join without treating it as a necessary blocker for the ambient-output graph route. After the concurrent R4 receipt is adjudicated, choose the next precise auxiliary obligation from this source-exact dependency list, rather than adding a second expensive CI experiment during this research.

No accepted theorem, original Hamiltonian, main/FCP branch, running candidate or Lean workflow is modified by this investigation. No new operator or spectral result is qualified.
