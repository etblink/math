# P3-AUX forward research — C4B normalization, exact kernels and positive-regulator stability

**Date:** 2026-11-14 Pacific. **Classification:** SOURCE REVIEW + CONVENTIONAL MATHEMATICAL ARGUMENTS; NOT NEW LEAN QUALIFICATION.
**Reviewed branch:** integration/bfss-unified-research-20261108 at `71e1492056763380b327f856edbd43199e2e0c22`.
**Concurrent strict run:** [C4A #43583785009](https://github.com/etblink/math/actions/runs/43583785009), exact tested `f7e6db3f05569403c47774655a17aabfaa4c656c`. At research inspection, source/toolchain preflight and restoration passed; cold source/consumer step remained in progress. No final verdict is assumed.
**Operations:** documentation only. No change to C4A source, consumer, workflow or frozen imports; no competing proof CI, Python experiment, numerical sampling, new branch or original-Hamiltonian change.

## 1. Observation, exact setting and research question

Accepted RAD-C3 #43570463487 supplies closedness and accepted C3DC #43579923559 supplies density of the original weighted physical sixteen-charge operator for every ε>0.
For literal `M : AlgebraData 2`, `G : M.GaugeData`, set
\[
E=G.\mathrm{physicalSpace},\qquad
K=\operatorname{PiLp}2(\mathrm{SpinIndex}\to\mathrm{FullL2}\,2),\qquad
T:E\rightharpoonup K.
\]
Here T is the unchanged original AY physical Hilbert charge column. Its original normalized Hamiltonian H=(1/16)T†T, on its true natural domain, is accepted through M5BE0/BF0.

Let Bε be the accepted native bounded injective reciprocal multiplier on K and
\[
\operatorname{Graph}(S_\varepsilon)
 =\{(u,z):(u,B_\varepsilon z)\in\operatorname{Graph}(T)\}.
\]
C4A is testing the natural Aε=Sε†Sε. It has not qualified merely because the generic theorem is available.

**Question:** What is the smallest source-faithful normalization/weak-form successor, and which useful kernel or regulator conclusions can be proved without first establishing a maximal pointwise domain, a smooth graph core or a Hardy inequality?

**Coverage:** exact current BB/BC/BD/BE sources, C3 graph source, C3DC density and C4A candidate, M5BE0 source/independent consumer/receipt, original reciprocal/PiLp lift, earlier regulator-domain and Hardy source reviews, actual OperatorDependencies inventory; additional D2B23–27 and H4E3B1/B2 donors. Also inspected pinned Mathlib's complete `Mathlib/Analysis/InnerProductSpace/LinearPMap.lean` at d13f23b723b8a846827a245b89c10fc7d3f11612. This is not an exhaustive search of every FCP or upstream branch. No Lean compilation of the arguments below occurred.

## 2. C4B: direct existing generic normalization, with a useful dependency split

The exact preferred donor is
`FCP.BFSSSU2PhysicalDomainL6H5E8BE.normalizedWeakRepresentative_iff_naturalAdjointSquare`,
in source blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`. Its full generic contract is:

```lean
theorem normalizedWeakRepresentative_iff_naturalAdjointSquare
    (T : E →ₗ.[ℂ] F) (hd : Dense (T.domain : Set E))
    (u : T.domain) (w : E) :
    (∀ v : T.domain,
      inner ℂ w (v : E) =
        (1 / 16 : ℂ) * inner ℂ (T u) (T v)) ↔
      ∃ h : (u : E) ∈ (naturalComp T.adjoint T).domain,
        w = (1 / 16 : ℂ) • (naturalComp T.adjoint T ⟨u, h⟩)
```

The same BE source has `selfAdjoint_smul_real` for c≠0 with conjugate c=c, plus `one_sixteenth_inner_smul` for the complex inner product's conjugate-linear first argument. These BE generic roots were explicitly audited by M5BE0 strict #43493125150; their source-specific unweighted H theorem is not a theorem about Sε.

**Candidate definition:** `originalWeightedPhysicalNormalizedAdjointSquare M G hε := (1/16 : ℂ) • originalWeightedPhysicalAdjointSquare M G hε`.

| Proposed C4B root | Actual prerequisite / method |
| --- | --- |
| Definition/equality to (1/16)Aε | Scalar partial-map definition; no source replacement |
| Exact natural domain | `LinearPMap.smul_domain` / original BE definitional pattern |
| Exact normalized action | Original BE scalar action pattern |
| Genuine self-adjointness | C4A self-adjointness, BE `selfAdjoint_smul_real`, c=1/16≠0 and real |
| Closedness and dense operator domain | The resulting self-adjointness; same actual E |
| Full normalized weak-representative iff | BE generic theorem with T:=Sε and accepted C3DC density; quantify over **every** v∈D(Sε) |

**Dependency insight:** the full-domain weak-representative iff uses density of Sε, not self-adjointness of Aε or maximal pointwise-domain identification. C4A self-adjointness is needed for the separate normalized self-adjointness conclusion. Keep those dependencies explicit rather than rebuilding the Riesz/adjoint argument.

**Retrieved but not selected:** D2B26 blob `7dd3f89f125bfe1268934d6098db2c289276d83e` contains an older generic normalization proof. H4E3B1 blob `1a622779283ee6e63fbd65bc2c54df49a78d8187` and H4E3B2 blob `a1a44eb090f805b2608eeac79fb8d53cea4f3ba3` show successful abstract-before-concrete proof shapes; their source-specific historical Hamiltonian conclusions carry additional representation-matching data. They are not needed to prove the generic Sε normalization and must not introduce unproved theta/J hypotheses or an historical operator alias.

**Prospective proof engineering:** open the existing BB completeness namespace explicitly, preserve the local `originalPhysicalHilbertComplete M G` instance, use the existing BC `naturalComp` rather than assuming D(Sε) is invariant, and instantiate the BE theorem on abstract M,G before the literal paired consumer. No new heartbeat settings, axioms or normalization lemmas are justified.
**Next decision:** prepare and independently qualify C4B only after C4A's exact strict result has been reviewed and checkpointed. This note stages no Lean source or workflow.

## 3. Kernel preservation can be expressed on the exact graph before any maximal-domain construction

This sharpens the earlier inverse-graph contract's kernel proposal; it is not a new claim of discovering kernel preservation.

Since Bε is linear, Bε0=0. Therefore, for every u∈E,
\[
(u,0)\in\operatorname{Graph}(S_\varepsilon)
\iff (u,B_\varepsilon0)\in\operatorname{Graph}(T)
\iff (u,0)\in\operatorname{Graph}(T).                 \tag{K1}
\]
This is a statement about actual partial-operator graphs, including domain membership. No multiplication of an arbitrary Tu by an unbounded inverse is assumed. Injectivity was needed for Sε's single-valued construction, but the zero-pair equivalence itself only uses linearity.

**Candidate source-level proof shape, NOT COMPILED:**
```lean
-- In the actual C3/AY namespaces; K is the literal native PiLp output.
theorem originalWeightedChargeGraph_zero_iff
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) (u : G.physicalSpace) :
    (u, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalWeightedPhysicalChargeColumn M G hε).graph ↔
      (u, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalMinimalPhysicalHilbertChargeColumn M G).graph := by
  rw [originalWeightedPhysicalChargeColumn_graph_eq M G hε,
    originalWeightedPhysicalChargeGraph_mem_iff M G hε]
  simp only [map_zero]
```

Actual elaboration, warnings and independent native consumer remain future obligations.

For any genuinely densely defined S with its true Hilbert adjoint, the natural product satisfies
\[
\ker(S^\dagger S)=\ker S.                            \tag{K2}
\]
Forward: if u is in the natural product domain and S†Su=0, the exact adjoint pairing gives ‖Su‖²=0. Reverse: if u∈D(S) and Su=0, zero lies in D(S†), so u belongs to the **full natural product domain** and S†Su=0. BC's energy identity and BD's `mem_graph_naturalComp` supply source-shaped interfaces for this argument.

Nonzero scalar normalization does not change graph-zero pairs. Applying (K1)/(K2) to the actual source T and proposed normalized weighted operator gives the prospective bridge
\[
\ker H_\varepsilon=\ker S_\varepsilon=\ker T=\ker H. \tag{K3}
\]
Thus any original H zero mode would automatically belong to each positive-regulator weighted natural Hamiltonian domain, even without a separate pointwise weighted-domain theorem. **This is a conventional argument and future source-qualification target.** It establishes no zero-mode existence, dimension, uniqueness, positive gap or paper identification. Equality of the corresponding orthogonal kernel projectors is a further packaging step.

**Recommended small successor after C4B:** exact graph-zero equality, then the generic natural-product zero-pair lemma with actual T/Sε consumers. This has fewer unqualified ingredients than a full Hardy-sector proof.

## 4. Common positive-regulator charge domains without first defining a maximal multiplier

Write wε(X)=sqrt(r(X)²+ε²). For ε,δ>0,
\[
\min(1,\varepsilon/\delta)\le w_\varepsilon/w_\delta
 \le\max(1,\varepsilon/\delta).
\]
If the actual bounded coordinatewise K multiplier Cεδ=M_(wε/wδ) and its inverse Cδε have been constructed and their AE identities certified, then
\[
B_\varepsilon C_{\varepsilon\delta}=B_\delta.
\]
Applying the literal inverse-graph definition in both directions gives
\[
D(S_\varepsilon)=D(S_\delta)=:D,\qquad
S_\varepsilon u=C_{\varepsilon\delta}S_\delta u.      \tag{P1}
\]
This develops the earlier positive-ratio source-review route. It does not require an operator at ε=0 or an identified maximal pointwise domain.

**Concrete construction donors:** native R0B2A already builds a bounded complex-linear FullL2 action from a genuine L∞ field via `Lp.norm_smul_le`, `Lp.add_smul`, `Lp.smul_comm` and `LinearMap.mkContinuous`. Its source blob is `e2a02b551486cfbc2a723f5b5ff0b282177c5e76`. C2B blob `45aa19082616ae874bf642f336d9a7c5fa1fd6f9` lifts the action using the exact AY output equivalence and `ContinuousLinearMap.piMap`. A ratio L∞ field, inverse identities and its native consumer are **missing new interfaces**, not results already proved for arbitrary factors.

For u,v∈D, let qT(u,v)=(1/16)⟨Tu,Tv⟩ and qε(u,v)=(1/16)⟨Sεu,Sεv⟩.
After the exact AE/finite-PiLp integral identities are certified, the proposed **positive-parameter-only** identities are
\[
q_\varepsilon(u,v)-q_\delta(u,v)
 =(\varepsilon^2-\delta^2)q_T(u,v),\qquad
q_\varepsilon(u,u)\ge\varepsilon^2q_T(u,u).          \tag{P2}
\]
A sign-free diagonal version is
\[
q_\varepsilon(u,u)+\delta^2q_T(u,u)
 =q_\delta(u,u)+\varepsilon^2q_T(u,u).
\]
This avoids defining qR or an ε=0 closed operator just to compare positive regulators.
Use the pinned `PiLp.norm_sq_eq_of_L2` and genuine L² representatives; never assume AY's product-norm continuous equivalence is an isometry.

**Important distinction:** (P1) is equality of charge/form domains D(Sε). It does not establish equality of D(Hε), nor an operator identity Hε=Hδ+(ε²−δ²)H on full operator domains. The full-domain weak-form identity is the appropriate bridge.

## 5. Conditional quantitative consequence: positive-regulator norm-resolvent continuity

**Assumptions, not current source qualifications:** (P1)/(P2) on a common D, plus nonnegative self-adjoint Hε representing qε against every test vector in D. These are more than pointwise-on-domain convergence of Sε. No Hardy gap, compactness or ground state is assumed.

For a>0 write Rε=(Hε+aI)^−1. These resolvents exist for nonnegative self-adjoint operators.
For f∈E and u=Rεf, the weak energy equation gives
\[
q_\varepsilon(u,u)+a\|u\|^2
 =\operatorname{Re}\langle f,u\rangle
 \le\|f\|\|u\|.
\]
Completing the scalar square yields
\[
q_\varepsilon(R_\varepsilon f,R_\varepsilon f)
 \le \frac{\|f\|^2}{4a},\qquad
q_T(R_\varepsilon f,R_\varepsilon f)
 \le \frac{\|f\|^2}{4a\varepsilon^2}.                \tag{R1}
\]
No spectral gap enters this estimate.

The two full-domain weak equations and self-adjointness give
\[
\langle f,(R_\delta-R_\varepsilon)g\rangle
 =(q_\varepsilon-q_\delta)(R_\varepsilon f,R_\delta g)
 =(\varepsilon^2-\delta^2)q_T(R_\varepsilon f,R_\delta g).
\]
Cauchy–Schwarz for qT and (R1) therefore prove
\[
\boxed{\ \|R_\varepsilon-R_\delta\|
 \le \frac{|\varepsilon^2-\delta^2|}{4a\varepsilon\delta}\ }. \tag{R2}
\]
In particular, for ε,δ≥η>0,
\[
\|R_\varepsilon-R_\delta\|\le
 \frac{|\varepsilon-\delta|}{2a\eta}.                \tag{R3}
\]

**Status:** conventional conditional proof, not a new original-source Lean theorem. Generic formal resolvent existence and the variational identity still need exact donor/API retrieval before formalization. The earlier source review correctly withheld resolvent convergence from strong on-domain convergence alone; (R2) uses the additional common-domain full-form identities.

## 6. Exact analytic countercontrol: the positive estimate does not settle ε=0

This is an abstract ℓ² example, **not a BFSS configuration or counterexample**. No Python samples were used.

Let E=K=ℓ²({1,2,...}), T=diag(n) on
D(T)={u:Σ n²|u_n|²<∞}. Let the injective multiplier R0=diag(n^−2), and
\[
W_\varepsilon=\operatorname{diag}\sqrt{n^{-4}+\varepsilon^2},
\quad
S_\varepsilon=W_\varepsilon T
 =\operatorname{diag}\sqrt{n^{-2}+\varepsilon^2n^2}
\]
on D(T).
For every ε>0, Sε is closed and densely defined on D(T); its reciprocal Wε^−1 is bounded by 1/ε, and all positive-regulator charge domains agree. The exact form identity (P2) holds.

At ε=0, S0=diag(1/n) **restricted to D(T)** is not closed:
take u_n=1/n, which is in ℓ² but outside D(T), and its finite truncations u^(N).
Then u^(N)→u and S0u^(N)→(1/n²), yet the limiting input is outside D(T).
S0 is closable; its closure is the bounded everywhere-defined diag(1/n).

Set c=1/16 and Hε=c diag(n^−2+ε²n²) on its natural maximal diagonal domain
D(Hε)={u:Σ (n^−2+ε²n²)²|u_n|²<∞}. Let H0=c diag(n^−2), on all E,
be the normalized adjoint square of the zero-regulator closure.
For every ε>0 and a>0,
\[
\|(H_\varepsilon+aI)^{-1}-(H_0+aI)^{-1}\|=1/a.
\]
Indeed the diagonal resolvent difference tends to 1/a as n→∞, while its absolute value is at most 1/a. Thus **norm-resolvent convergence at zero fails**, despite injectivity of R0, closed positive-regulator operators, common positive form domains, exact form identities, and even a natural closed zero-regulator completion.

This refutes only the generic inference from those ingredients to zero-parameter norm-resolvent convergence. It does not decide the actual BFSS zero-regulator problem, and it is not a counterexample to (R2)/(R3), whose constants deteriorate near zero.

## 7. Recovered full-form Hilbert model: method reuse, not an automatic radial theorem

Additional donors:
- D2B23 `4ca6fcd6fab1617a141038016d4d0362390df090`: graph completeness and normalized form/graph norm comparisons.
- D2B24 `5641732c37175c2372f035f3c2fc90345e40479f`: closed complete WithLp graph using output scaling 1/4, exact norm square ‖u‖²+(1/16)‖Tu‖².
- D2B25 `b174ce8b0772cec804aa777359ebba3ac8c1072b`: graph exhaustion, injectivity/surjectivity, exact form norm.

These are **source-specific to their own T**, and their standalone current qualification was not audited in this research. Their word “weighted” means constant output scaling for the form norm, not the new radial wε. Disposition: METHOD ONLY for replacing T by the actual accepted Sε, with a fresh native source/consumer audit.

The explicit complete graph
\[
\{(u,\tfrac14S_\varepsilon u):u\in D(S_\varepsilon)\}
 \subset\operatorname{WithLp}2(E\times K)
\]
would give a source-faithful Hilbert model of the full normalized form domain. Its closedness follows from accepted Sε closedness and the inverse constant output scaling; no C4A self-adjointness or smooth graph-core assumption is required. This may support later native variational/resolvent arguments if the source's existing weak-form interfaces alone are insufficient.

## 8. Decisions and prospective falsifiers

1. Finish and review C4A; no result inferred while it runs.
2. If accepted, C4B should reuse BE normalization and full-domain weak representation, with a literal paired SU2 consumer. No new Riesz proof, historical representation-matching campaign or competing strict gate.
3. Then favor the short exact kernel bridge before a Hardy gap: it directly relates the new operator to the original H without new symmetry assumptions.
4. Develop native positive ratio multipliers/domain equivalence and exact polarized form identities as separate bounded source obligations; only then consider the generic norm-resolvent estimate.
5. Recover the full-form Hilbert graph pattern only when a concrete next consumer needs it.
6. Keep graph-core density, maximal multiplication-domain identification, ε=0 analysis and the genuine Spin(9)-singlet Hardy transfer independent.

**Falsifiers/stop rules:** wrong scalar conjugation or 1/16 coefficient; a test quantifier restricted to smooth vectors; replacing E/K or actual AY T; silently applying an historical source theorem to Sε; assuming adjoint domains invariant; deriving D(Hε) equality from D(Sε) equality; using a reciprocal inverse on all outputs without a range condition; or promoting (R2) to a zero-regulator result.
Any future Lean experiment requires its own prospective root contract, pins, independent consumer and strict audit. A compiler red is RED_UNQUALIFIED, not a counterexample to these conventional statements.

**Preservation:** This memo records future source work and exact analytic arguments only. It does not change the accepted original H, M5 baseline, C3/C3DC qualifications, C4A experiment, TD-C1A red, monograph or route-selection allocation.

## Subsequent run observation — before this research commit

C4A #43583785009 completed RED at its original tested SHA. The source/domain, self-adjointness, closedness and density declarations printed standard axioms, but the energy rewrite at 94:14 failed with an implicit-transparency domain-proof diagnostic; six proof-instance style warnings also remain. Independent consumer was not reached, energy/nonnegativity carried consequential sorryAx, and no new root is qualified. [Exact preserved R1 receipt](P3_AUX_RAD_C4A_R1_RED_43583785009_ENERGY_REWRITE_AND_INSTANCE_STYLE_2026_11_14.md). This operational result does not falsify the conditional conventional arguments above; C4B remains held pending actual C4A strict acceptance.
