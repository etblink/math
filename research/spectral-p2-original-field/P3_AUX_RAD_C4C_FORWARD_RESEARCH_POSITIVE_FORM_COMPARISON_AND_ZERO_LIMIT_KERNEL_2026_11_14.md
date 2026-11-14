# P3-AUX forward research — positive-regulator comparison and zero-limit kernel control

**Date:** 2026-11-14 UTC. **Classification:** exact source review and conventional conditional mathematical arguments; NOT NEW LEAN QUALIFICATION.
**Reviewed branch/ref:** integration/bfss-unified-research-20261108 at `63fddbbcf7de93cd1a1fba07b5616532f5fd2c0d`.
**Concurrent gate:** [C4C #43589307044](https://github.com/etblink/math/actions/runs/43589307044), exact tested `c63c8c0be281d804495e8aa6334ad4f5689c9211`. Its pending proof is not an assumption of the comparisons below.
**Operations:** documentation only; no candidate source, consumer, workflow, toolchain, proof budget or frozen import change; no competing strict run, numerical sampling or Python mathematical experiment.

## 1. Outcome and scope

The next economical positive-regulator objective is a native bounded ratio action, followed by its exact graph transport and sharp norm bounds. These suffice for positive form comparison, and conditional norm-resolvent continuity can then follow without first proving the full polarized integral identity. The latter remains useful for derivative and exact difference questions, but need not block this comparison route.

Two additional conventional results are recorded here:
- a sharper universal positive-regulator resolvent estimate than the earlier C4B forward memo;
- an exact abstract example in which all positive-regulator kernels agree, yet the closed zero-regulator limit has an additional zero mode.

The example is not BFSS. The comparison estimate is conditional on the stated native interfaces, not qualified by C4B or a future C4C green alone. These are refinements of the existing research program, not claims of new operator theory.

## 2. Exact native setting and source coverage

Retain
\[
 E=G.\mathrm{physicalSpace},\qquad
 K=\operatorname{PiLp}2(\mathrm{SpinIndex}\to\mathrm{FullL2}\,2),\qquad
 T=\text{originalMinimalPhysicalHilbertChargeColumn}\ M\ G.
\]
T is the unchanged original AY closed minimal physical charge. The actual accepted reciprocal Bε is bounded and injective on K for ε>0. C3 defines
\[
 (u,z)\in\operatorname{Graph}(S_\varepsilon)
 \iff (u,B_\varepsilon z)\in\operatorname{Graph}(T).
\]
C4B qualifies the actual normalized natural operator Hε=(1/16)Sε†Sε and its weak representation against every Sε-domain vector. It does not identify a maximal pointwise weighted domain.

| Inspected source | Exact blob / pin | Reuse or limitation |
| --- | --- | --- |
| R0A original radial scalar | a67f8740586588c6d4ee9c9148574c81c14d4937 | wε(X)=sqrt(‖X‖²+ε²), square identity, positivity and lower bound |
| R0B1 original reciprocal L∞ | d1cbb8077799236e5e1b82704270bdb9ab9153b4 | Continuous bounded field → genuine complex L∞ class → a.e. representative pattern |
| R0B2A original FullL2 action | e2a02b551486cfbc2a723f5b5ff0b282177c5e76 | Lp scalar action, additivity, complex linearity, norm bound and mkContinuous pattern |
| G0B0 actual a.e. multiplication | 670cc600fdc42a03d21de759e8b46b6cb1306874 | Lp.coeFn_lpSMul and exact source-field a.e. identity |
| C2B actual PiLp output lift | 45aa19082616ae874bf642f336d9a7c5fa1fd6f9 | Original AY equivalence, piMap, coordinate identity; no automatic isometry |
| C3 actual weighted inverse graph | 6aff6416d341738a1f55e6aaad107f4726f1e34f | Exact graph transport; no need to apply an unbounded inverse to arbitrary output |
| C3DA weighted compact-core witness | 16be28f3b526fc08759980bd1dbffba6522e2279 | Existing compact-support/a.e. cancellation method; does not prove full-domain equality |
| C4B normalized weighted operator | 0fe927b9709bd0e359aafb691aca086c6e4a5c46 | Accepted #43587088274, full-domain weak form and self-adjoint operator |
| Pinned Mathlib Holder.lean | d13f23b723b8a846827a245b89c10fc7d3f11612 | holderL lines 130–137 and coeFn_holder lines 75–78 already bundle arbitrary bounded bilinear Lp actions |
| Pinned Mathlib Operator/Mul.lean | same pin | ContinuousLinearMap.lsmul lines 187–194, opNorm_lsmul_le lines 215–217 supply complex scalar bilinear action |

Coverage is the exact current modules above, actual AY output equivalence, live roadmap/state, the November 13 regulator-domain review, and the November 14 C4B forward memo. It is not an exhaustive census of every historical branch or upstream family. No Lean/lake compilation was available locally.

**New reuse finding:** a generic FullL2 action for a ratio L∞ field may be obtained by fixing the first argument of ContinuousLinearMap.holderL for the scalar bilinear map ContinuousLinearMap.lsmul. This is an inspected existing API, not compiled candidate code. Its holder definition and the existing heterogeneous Lp scalar action are separately defined, as Holder.lean explicitly explains: prove their a.e. agreement if crossing those interfaces; do not assume definitional equality. A narrow instantiation check should decide whether this is cheaper than copying the accepted R0B2A construction. Keep accepted reciprocal bytes unchanged either way.

## 3. Positive graph transport: smallest missing native contract

For ε,δ>0 define the real-positive ratio
\[
 c_{\varepsilon\delta}(X)=w_\varepsilon(X)/w_\delta(X)
\]
and let Cεδ denote its prospective bounded coordinatewise action on actual K.

For 0<δ≤ε, the exact R0A square identity gives
\[
 w_\delta\le w_\varepsilon,\qquad
 \delta w_\varepsilon\le\varepsilon w_\delta.
\]
The second inequality follows by nonnegative squaring:
\[
 \varepsilon^2w_\delta^2-\delta^2w_\varepsilon^2
 =(\varepsilon^2-\delta^2)\|X\|^2\ge0.
\]
Consequently 1≤cεδ≤ε/δ and 0<cδε≤1. General ratios are bounded by max(1,ε/δ). Positivity removes every denominator ambiguity.

Pointwise identities, after native a.e./L²/PiLp transfer, must give
\[
 B_\varepsilon C_{\varepsilon\delta}=B_\delta,\qquad
 C_{\varepsilon\delta}C_{\delta\varepsilon}=I.
\]
The first identity has this orientation: Cεδ transports an Sδ output to an Sε output. Explicitly,
\[
 (u,z)\in\operatorname{Graph}(S_\delta)
 \Longrightarrow (u,C_{\varepsilon\delta}z)\in\operatorname{Graph}(S_\varepsilon).
\]
Transport back with reversed parameters. This yields actual partial-map domain equality
\[
 D(S_\varepsilon)=D(S_\delta)=D,\qquad
 S_\varepsilon u=C_{\varepsilon\delta}S_\delta u.
\]
The displayed action equality requires the corresponding domain witnesses. It is not an equality of unrestricted total functions or Hamiltonian domains.

**Norm obligation:** for δ≤ε prove on actual K
\[
 \|C_{\varepsilon\delta}z\|\le(\varepsilon/\delta)\|z\|,
 \qquad \|C_{\delta\varepsilon}z\|\le\|z\|.
\]
Use the scalar L∞ norm bound and finite PiLp squared-norm formula after the coordinate identities. The AY equivalence is a continuous linear equivalence to a function product, not a supplied isometry. Transporting a product operator through it proves boundedness, but blindly multiplying its operator norms loses the sharp constants needed here.

These native ratio, composition, graph/domain and norm contracts remain unproved. A maximal multiplier-domain construction and a smooth graph-core theorem are not necessary prerequisites for this positive-only route.

## 4. A weaker prerequisite is enough for a sharper conditional estimate

Define qε[u]=(1/16)‖Sεu‖² on common D. Both norm inequalities in Section 3 imply, for δ≤ε,
\[
 q_\delta[u]\le q_\varepsilon[u]\le
 kq_\delta[u],\qquad k=(\varepsilon/\delta)^2.
 \tag{F}
\]
This uses no polarized integral identity, no definition at ε=0 and no commutation of the Hamiltonians. Closed densely defined charges give closed nonnegative forms; their natural adjoint squares are the associated operators by the full-domain weak representation.

**External theorem used:** Simon, Proposition 1.1, states the equivalence of nonnegative form order and reverse order of their shifted resolvents. Apply it to the forms scaled by 1/a to allow any a>0. The underlying form-order theorem is classical; the calculation below is our conditional derivation for this research setting.

Write Rε(a)=(Hε+aI)^−1. From (F),
\[
 (kH_\delta+aI)^{-1}\le R_\varepsilon(a)\le R_\delta(a).
\]
Hence
\[
 0\le R_\delta(a)-R_\varepsilon(a)
 \le (H_\delta+aI)^{-1}-(kH_\delta+aI)^{-1}.
\]
Only the two operators on the right are functions of the same Hδ; Hε and Hδ need not commute. Spectral calculus for that single nonnegative self-adjoint Hδ and the elementary scalar maximum give
\[
 \sup_{\lambda\ge0}
 \frac{(k-1)\lambda}{(\lambda+a)(k\lambda+a)}
 =\frac{\sqrt k-1}{a(\sqrt k+1)}.
\]
For s=√k≥1, the inequality follows directly from
\[
 (\lambda+a)(s^2\lambda+a)-a(s+1)^2\lambda
 =(s\lambda-a)^2\ge0;
\]
equality occurs at λ=a/s when s>1.

Interchanging parameters proves the symmetric bound
\[
 \boxed{\;
 \|R_\varepsilon(a)-R_\delta(a)\|
 \le\frac{|\varepsilon-\delta|}{a(\varepsilon+\delta)}
 \;}.\tag{R}
\]
This improves the earlier conditional Cauchy–Schwarz bound
|ε²−δ²|/(4aεδ) by the factor (ε+δ)²/(4εδ)≥1. It agrees to first order near ε=δ and remains below 1/a for all positive parameters. In the natural multiplicative parameter it is a^−1 tanh(|log ε−log δ|/2). It gives no Cauchy control toward ε=0.

**Sharpness only in the abstract comparison class:** on one-dimensional ℂ let qR=0 and qT[u]=b|u|², b=a/(εδ). Then Hτ=τ²bI and equality holds in (R). In the normalized-charge convention choose T=4√b I. This is not a BFSS saturation example, a numerical test or a claim about a source-paper constant.

**Formalization cost:** native (F) is missing; generic form-order/resolvent and single-operator functional calculus interfaces have not been matched to source LinearPMap operators. Do not launch a resolvent proof before those obligations and a concrete consumer justify it. The gain here is a shorter dependency list for a future result.

## 5. Zero-limit negative knowledge: equal positive kernels can acquire a new limit zero mode

This exact model strengthens the earlier diagonal countercontrol, which showed failure of norm-resolvent convergence at zero. It does not model the BFSS configuration space.

Let E=K=L²(0,1), T=d/dx on H¹₀(0,1). This T is closed, densely defined and injective. Let
\[
 r(x)=x(1-x),\quad w_\varepsilon(x)=\sqrt{r(x)^2+\varepsilon^2},
 \quad S_\varepsilon=w_\varepsilon T.
\]
For each ε>0, wε and its reciprocal are bounded on (0,1), so Sε is closed on the same H¹₀ domain and ker Sε=ker T={0}. Define Hε=(1/16)Sε†Sε on its natural domain; ker Hε={0}.

At zero define S0=rT initially on H¹₀. It is closable: if u_j→0 and r u'_j→v in L², test against φ∈C∞c(0,1) and integrate by parts to obtain ⟨v,φ⟩=lim −⟨u_j,(rφ)'⟩=0. Dense tests imply v=0.

For each integer n≥2 take u_n(x)=min(1,nx,n(1−x)), which lies in H¹₀. Direct exact integration gives
\[
 \|u_n-1\|_2^2=\frac{2}{3n},\qquad
 \|r u_n'\|_2^2=
 \frac{2}{3n}-\frac1{n^2}+\frac{2}{5n^3}\longrightarrow0.
\]
Thus (1,0) belongs to the graph of the closure of S0: the zero-limit closed charge has a nonzero kernel. Conversely, testing on compact subsets where r>0 shows any vector in that kernel has distributional derivative zero, hence is constant. Its kernel is exactly span{1}.

Set H0=(1/16)(closure S0)†(closure S0). Then
\[
 \ker H_\varepsilon=\{0\}\quad(\varepsilon>0),\qquad
 \ker H_0=\operatorname{span}\{1\}.
\]
No positive-regulator statement has failed; closing the degenerate zero form has enlarged the domain and its kernel.

For completeness the same cutoff has ‖Tu_n‖²=2n, and
\[
 \|S_{1/n}u_n\|^2=
 \frac{8}{3n}-\frac1{n^2}+\frac{2}{5n^3}\to0.
\]
For fixed positive ε the term 2nε² prevents this graph-zero approximation. This makes the distinction between a fixed regulator and removing the regulator explicit. All these calculations are analytic identities, with no finite sampling.

**Application limit:** BFSS has r(X)=‖X‖ on its actual full configuration space, not this interval weight or boundary conditions. The example proves only that bounded positive reciprocals, common positive domains, exact positive kernel preservation and a closable zero charge do not by themselves imply preservation of the kernel after zero-limit closure. Any BFSS exclusion of this mechanism needs its own local/domain argument.

## 6. A precise external zero-limit route, with the limiting object kept explicit

Simon, Theorem 3.2, identifies the strong-resolvent limit of decreasing closed nonnegative forms with the closure of the regular part of their pointwise limit form. If that limit form is closable, this is its closure. This distinguishes an abstract limit operator from the original unweighted H.

Conditionally, once (F), common D and the native closed forms are established, a decreasing sequence ε_n↓0 supplies such a strong-resolvent limit. The theorem does not identify its kernel with the positive-regulator kernel. In the interval example its limit form is (1/16)‖r u'‖² on H¹₀; its closure is the form of H0 above.

Thus a future zero-regulator program has distinct obligations:
1. identify the actual pointwise limit form on the common native domain;
2. establish closability or explicitly handle its regular part;
3. identify its closed realization against the intended source operator;
4. prove a separate result excluding new kernel vectors in that realization, if needed.

These are research obligations, not the next staged gate.

## 7. Recommended bounded sequence after C4C review

| Order | Prospective source target | Independent native check / falsifier |
| --- | --- | --- |
| 1 | Ordered scalar weight and ratio bounds from R0A; continuous genuine complex L∞ ratio | Original Boson 2; origin gives ratio ε/δ, equal parameters give 1; reject ε=0 quantification |
| 2 | FullL2 ratio action and a.e. field semantics | Compare holderL versus accepted R0B2A pattern narrowly; verify reciprocal composition on actual original FullL2, not a scalar surrogate |
| 3 | Original K lift, inverse/composition identities, sharp norm controls | Actual sixteen-output PiLp, both parameter orders; reject any isometry assumption on the product equivalence |
| 4 | Actual inverse-graph transport, common charge domains and diagonal form comparison | Original physical input, original AY T, exact domain witnesses; no D(Hε)=D(Hδ) promotion |
| 5 | Optional generic resolvent comparison with an actual source consumer | (R) requires native form/operator matching; retain exact 1/16 and all positive shifts |
| Separate | Polarized form differences, maximal weighted domain, graph core, zero limit and physical singlet Hardy transfer | Each retains its own missing interfaces and falsifiers |

This is prospective design only. Do not stage another Lean gate before C4C's exact source/consumer verdict is reviewed and checkpointed. Preserve earlier compiler reds as engineering evidence; they do not falsify conventional arguments. No zero-state existence, gap, nonzero original kernel, original-H replacement or paper-source equivalence is asserted.

## 8. Verified external references and provenance

- Barry Simon, *A canonical decomposition for quadratic forms with applications to monotone convergence theorems*, Journal of Functional Analysis 28 (1978), 377–385, DOI [10.1016/0022-1236(78)90094-0](https://doi.org/10.1016/0022-1236(78)90094-0). [Author bibliography, item 81](https://math.caltech.edu/simon/biblio.html); [paper hosted at TU Chemnitz](https://www.tu-chemnitz.de/mathematik/analysis/kalmes/DAAD_Tunesien_2014_Simon.pdf). Inspected Proposition 1.1, printed p.378, and Theorem 3.2, printed pp.382–383, including rendered PDF pages. OCR misreads the starting page in the running header; the paper's first printed page, author bibliography and DOI record agree on 377.
- [Pinned Mathlib Holder.lean](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/MeasureTheory/Function/Holder.lean), and [Operator/Mul.lean](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Analysis/Normed/Operator/Mul.lean), exact signatures inspected.
- Earlier [positive-regulator domain source review](P3_AUX_RADIAL_REGULATOR_DOMAIN_STABILITY_SOURCE_REVIEW_2026_11_13.md) and [C4B normalization/kernel/stability memo](P3_AUX_RAD_C4B_FORWARD_RESEARCH_NORMALIZATION_KERNEL_AND_POSITIVE_REGULATOR_STABILITY_2026_11_14.md) are retained. This note refines their prospective proof dependencies and estimates without rewriting their historical record.
