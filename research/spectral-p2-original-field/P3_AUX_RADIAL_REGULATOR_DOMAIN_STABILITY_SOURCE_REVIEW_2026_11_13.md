# P3 auxiliary radial-parameter stability — original weighted charge graph

**Date:** 2026-11-13 Pacific. **Status:** SOURCE-REVIEWED MATHEMATICAL PROPOSITION, NOT LEAN QUALIFIED. **Operations:** parallel research while TD-C1A D2R2 differential diagnostic #43562804737 tests exact SHA `8de590a9eb5fa7d7d244a68017f3d98b388e1e20`; no edit of its sources/workflow/manifest and no CI run started by this memo.

## 1. Source-specific setting (do not replace either Hilbert carrier)

- Original `Boson 2`: real SU(2) 9-by-3 bosonic configuration space. Literal `r(X)=‖X‖`.
- **Strict accepted scalar source** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxR0AOriginalRadialScalar.lean`, blob `a67f8740586588c6d4ee9c9148574c81c14d4937`, defines `originalRadialWeight ε X=Real.sqrt (‖X‖^2+ε^2)`, and proves `originalRadialWeight_sq` plus positivity for ε>0.
- **Strict accepted original reciprocal field** `P3AuxR0B1OriginalReciprocalLpInfinity.lean`, blob `d1cbb8077799236e5e1b82704270bdb9ab9153b4`, defines `originalReciprocalField ε X=(originalRadialWeight ε X:ℂ)⁻¹` and its genuine L∞ class.
- **Strict accepted bounded multiplier and AE source action** `P3AuxR0B2AOriginalReciprocalFullL2BoundedAction.lean`, blob `e2a02b551486cfbc2a723f5b5ff0b282177c5e76`, and `P3AuxG0B0OriginalReciprocalFullL2AEMultiplication.lean`, blob `670cc600fdc42a03d21de759e8b46b6cb1306874`, bind the literal `B_ε` to its a.e. multiplier (1/w_ε).
- **Original physical input** `E=pairedGaugeData.physicalSpace ⊆ FullL2 2` (exact `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`).
- **Original sixteen Hilbert outputs** `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`, with actual closed partial linear charge `T=originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData:E→ₗ.[ℂ] K`. Historical AY source blob `a9f27a48852ac570aedc8e0ab88d683250e6b138` provides its exact closed graph and source output `PiLp.continuousLinearEquiv`; this memorandum does not requalify source imports.

Unlike the finite-dimensional fermionic projection `OP2b.originalFermionGaugeProjection`, the physical input `E` lies in **full** L². No OP2b projection is substituted for an L² physical-space projector.

## 2. Formal mathematical identity, independent of BFSS gamma covariance

For ε≥0 and boson X let
`w_ε(X) = sqrt(r(X)^2 + ε^2)`.
For any y∈K, write `w_ε y` for coordinatewise measurable multiplication (possibly outside K), and use **extended nonnegative** squared norm integrals until integrability is established.

Pointwise the already sourced identity says `w_ε(X)^2 = r(X)^2 + ε^2`. For each original SpinIndex component, multiplying by `‖y_α(X)‖²` and integrating gives (extended integral sense)

```text
∫ w_ε(X)^2 · ‖y_α(X)‖² dX
  = ∫ r(X)^2 · ‖y_α(X)‖² dX
    + ε² ∫ ‖y_α(X)‖² dX.
```

Summing over the **finite actual sixteen** outputs yields, whenever finite,

```text
‖w_ε y‖_K² = ‖r y‖_K² + ε² ‖y‖_K².       (1)
```

The second term is already finite since y∈K. Hence

```text
y ∈ D(M_{w_ε})  iff  y ∈ D(M_r)       for every ε≥0.  (2)
```

This is an ordinary (L²)-multiplier conclusion *conditioned on establishing the exact measure-theoretic/finite-PiLp semantics*. Do not instantiate `‖w_ε y‖_K` before showing the resulting a.e. representative is in K.

## 3. Conditional but useful original physical graph consequence

Define, as a **prospective exact identification** of the weighted charge, on its maximal natural domain,

```text
S_ε u = M_{w_ε}(T u),
D(S_ε) = {u∈D(T) : T u∈D(M_{w_ε})}.
```

From (2) the domain is independent of ε≥0:

```text
D(S_ε) = {u∈D(T): r · (T u) ∈ K}.     (3)
```

For ε,δ>0, the pointwise ratio also obeys

```text
min(1, ε/δ) ≤ w_ε(X)/w_δ(X) ≤ max(1, ε/δ).
```

Thus on the common domain the weighted-output norms are equivalent, and `S_ε` and `S_δ` have equivalent graph norms. In particular, if **one** positive-ε inverse-image graph construction is proved closed and correctly identified, the positive-parameter relatives have the same domain and comparable graph topology; their native closedness still requires a valid source derivation (e.g. closed-operator graph equivalence).

Because `w_ε(X)≥ε` for ε>0, `‖S_εu‖_K≥ε‖Tu‖_K`, a control **lost as ε→0**. Consequently common domain does NOT alone establish that the zero-weight operator `S_0=M_r T` is closed, densely defined, self-adjoint, or has any gap. No claim about zero-gap spectral behavior is made.

## 4. Strong parameter estimate on the common domain

The elementary reverse-triangle inequality on `(r(X),ε)∈ℝ²` gives

```text
|w_ε(X)-w_δ(X)| ≤ |ε-δ|      (ε,δ≥0).
```

For y∈K with weighted integrability:

```text
‖(w_ε-w_δ)y‖_K ≤ |ε-δ|‖y‖_K.
```

Therefore for u in the common weighted-charge domain,

```text
‖S_εu-S_δu‖_K ≤ |ε-δ|‖Tu‖_K.       (4)
```

This is **strong pointwise-on-domain** Lipschitz continuity in the regulator, controlled by the norm of the actual unweighted charge T, not a uniform bounded-operator estimate on input E. In particular `S_εu→S_0u` for each common-domain u as ε↓0; no closed-graph convergence, norm resolvent convergence, or eigenvalue convergence is licensed.

## 5. An inverse-image-graph reformulation for ε,δ>0

The accepted source reciprocal `B_ε` multiplies by `w_ε⁻¹` a.e. For ε,δ>0, the ratio `m_{εδ}=w_δ/w_ε` is both bounded and bounded away from zero. Let `M_m` denote the bounded, invertible original FullL2 multiplier by that *radial gauge-invariant* ratio.

Pointwise `B_ε = B_δ M_m`; since `M_m` is surjective, `range(B_ε)=range(B_δ)`. By coordinatewise extension (once the **actual** `PiLp` output lift is constructed) the same holds for `B16_ε` on K.

Consequently for any source-closed partial linear charge T, the inverse-image graph domains

```text
{u∈D(T): Tu∈range(B16_ε)}
```

are the same for every ε>0, **provided** the native B16 lifts are shown to act a.e. by the literal coordinatewise reciprocal and to be bounded/injective. These source obligations are not solved by this note. This route may establish positive-regulator stability *before* a complete maximal-domain characterization of the graph, although the identification with `S_ε=M_{w_ε}T` still requires explicit a.e. cancellation and domain proof.

The full auxiliary output space K is ambient sixteen-component L², not sixteen physical input copies. G0B3 original physical-space preservation is a separate economical compatibility join, but **not a prerequisite** for defining B16 on K or inverse-image graph(T).

## 6. Concrete Lean microgate sequence, NOT YET STAGED

1. **Scalar R0C proposal:** prove `originalRadialWeight_ratio_le` and `originalRadialWeight_param_lipschitz` from the frozen `originalRadialWeight_sq` and positivity, with source exact tests at X=0 and nonzero r. Do not add a norm/form theorem in this first gate.
2. **G0B3 separate compatibility proposal:** combine accepted G0B1/G0B2 directly in `GaugeCore.physicalSpace` via `Submodule.mem_iInf`, using the source `P_g f=F_g f` and exact existing source namespaces. Do not confuse FullL2 physical space with OP2b Fock fixed projection. This is not needed as a blocker for the output graph route.
3. **Native output proposal:** use source AY `originalMinimalHilbertOutputEquiv` and pinned Mathlib `ContinuousLinearMap.piMap` to construct B16 on K; independently prove coordinatewise a.e. semantics and injectivity using the R0A nonvanishing identity and original G0B0 AE action. Keep physical-space input E separate from output K.
4. **Generic closed-graph lemma:** inverse image of the already closed AY charge graph under `id×B16` is closed. Injective B16 is necessary for single-valuedness; compactness or spectral data do not follow.
5. **Maximal-domain and regulator-stability gate:** prove exact graph membership equivalence with `S_ε`, a finite-component squared-norm identity (1), (3) and (4), with an independent consumer on the original physical input and true K.
6. **Zero-regulator analysis:** separately test closability, domain cores, limiting forms/resolvents; do not claim these from (1)–(4) alone.

**Stop rule:** no new strict CI on this parallel memo, no change to TD-C1A/D2R2, original H, accepted M5BF0/G0B2 or FCP/main; no false "graph domain stability proves gap" promotion. Any proposed source proof needs its own preregistration, source pins, actual-carrier consumer and independent strict audit.

## Pinned Mathlib interface addendum — the finite PiLp square norm is already proved

The exact required finite-output norm identity is *not* an interface to invent. At pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, file `Mathlib/Analysis/Normed/Lp/PiLp.lean` lines 792–796 contains:

```lean
theorem PiLp.norm_sq_eq_of_L2 (β : ι → Type*)
    [∀ i, SeminormedAddCommGroup (β i)] (x : PiLp 2 β) :
    ‖x‖ ^ 2 = ∑ i : ι, ‖x i‖ ^ 2
```

The exact source AY `originalMinimalHilbertOutputEquiv` uses `PiLp.continuousLinearEquiv 2 ℂ` to identify the sixteen-component PiLp target with the genuine source function-output carrier. Thus the proof of (1) should use **the pinned PiLp.norm_sq_eq_of_L2** after constructing actual L² outputs, rather than hand-building a sixteen-dimensional Euclidean norm.

The pinned `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/PiProd.lean` supplies `ContinuousLinearMap.piMap` (line 268) with application lemma `coe_piMap'` (line 277), but **its domain is a function product**, not the PiLp wrapper. The source AY equivalence `J` is required to transport a componentwise multiplier from the product carrier to the actual Hilbert output. The resulting composition formula and isometry/norm claims must each be independently elaborated; the equivalence is bounded but not automatically an isometry.

`Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` provides `Lp.norm_def`, `Lp.memLp`, and `MemLp.coeFn_toLp` for the underlying genuine L² representatives. The future exact integrability lemma should work with `MemLp`/a.e. equality and **only after** proving membership apply the PiLp squared norm equation. The Mathlib source pin has been inspected; no Lean-specific theorem invocation or compilation of this proposal has yet occurred.

## 7. What is genuinely new here

Earlier [G0B3 output-multiplier dependency review](P3_AUX_G0B3_OUTPUT_MULTIPLIER_DEPENDENCY_REVIEW_2026_11_13.md) identified source B16 construction, inverse-image graph, and marked positive-ε domain stability as an **open further obligation**. This memorandum isolates an exact `w_ε²=r²+ε²` identity already present in the literal source, derives the regulator-independent maximal weighted domain and simple parameter Lipschitz control, and clarifies that **zero-ε domain equality does not imply zero-ε closedness**. It is conventional operator theory with source-exact input, *not* a new qualified BFSS theorem.
