# GM5E — weighted original-source core energy and conditional compactness forward research

**Date:** 2026-11-22 Pacific. **Classification:** exploratory mathematical memorandum, not a Lean-qualified proof gate. **Repository:** unified integration only. Source status at drafting: GM5A R2, GM5B R1, and GM5C R1 qualified; GM5D R1 native RED, bounded GM5D R2 submitted at commit `2a4425ec1505cc59708cd70b671cdb4e7d748579` to strict [run #45104975857](https://github.com/etblink/math/actions/runs/45104975857). Do not promote GM5D or GM5E from this memo.

## 1. Exact source-derived inequality

Let `M : AlgebraData 2`, `G : M.GaugeData`, `f : G.invariantCore`; `u_f := coreToL2 f.val`, and `T := originalMinimalPhysicalHilbertChargeColumn M G`. Use qualified GM5B `physicalMasslessClosedChargeCoreEnergy` and GM5C `nativeCoreEnergy_difference_le`:

- `E(f) = (1/16) * ‖T (closedChargeCoreInput M G f)‖²`.
- `K(f) + P(f) = kineticPotentialCoreEnergy M f.val`, with `K(f) = (1/2)*‖sourceCoreGradient f.val‖²` by the SOURCE identity already compiled as GM5D's `sourceCoreGradient_norm_sq`; for a self-contained next gate, alternatively use the original coordinate-derivative sum directly and avoid an unqualified GM5D import.
- `|E(f) - (K(f)+P(f))| ≤ C_M * coreRadialMoment f.val`, where `C_M = M.fermionGrowthConstant ≥ 0` and `coreRadialMoment f.val = ∫ x, ‖x‖ * ‖f.val x‖²`.
- `P(f) ≥ 0` from original `M.deformedBosonicPotential_nonneg 1 0 x`.

Therefore the strictly scoped candidate estimate is

```text
kineticPotentialCoreEnergy M f.val ≤
  (1/16 : ℝ) * ‖originalMinimalPhysicalHilbertChargeColumn M G
    (closedChargeCoreInput M G f)‖ ^ 2 +
  M.fermionGrowthConstant * coreRadialMoment f.val
```

Proof idea: the *lower* half of `abs_le.mp (nativeCoreEnergy_difference_le M G f)` and `linarith`. No global coercivity or original-Hamiltonian spectral premise is used. This gate may be source-qualified independently of GM5D if it imports only GM5C and retains the original paired consumer.

## 2. Stronger conditional weighted-graph convergence

Define radial weight `w(x) := sqrt ‖x‖` and consider **only the joint graph closure of original gauge-invariant smooth-core data** in

```text
physical L² ⊕ original native charge output L² ⊕ weighted radial L².
```

For invariant core differences `d=f_n-f_m`, the preceding bound gives

```text
(1/2)*‖∇d‖² + ‖sqrt(V_B) d‖²
  ≤ (1/16)*‖T u_d‖² + C_M*‖sqrt(r) u_d‖².
```

Here `V_B(x) = M.deformedBosonicPotential 1 0 x ≥0` and `r(x)=‖x‖`. Nonnegative potential energy makes the gradient and potential-multiplier sequences Cauchy whenever the native charge and weighted radial outputs are Cauchy. Their limits lie in the appropriate closed Sobolev and nonnegative multiplication graphs, once the *exact original-source closed multiplication operator interface* is located or established. The fermionic pairing also converges via the pointwise field bound and weighted Cauchy-Schwarz:

```text
|⟨f, M_F g⟩| ≤ C_M ‖sqrt(r)f‖ ‖sqrt(r)g‖.
```

**Important:** this is *quadratic-form convergence*. It does NOT imply `M_F f ∈ L²` or `f ∈ Dom(M_F)`, nor does it prove the smooth invariant core is dense in the entire intersection `Dom(T) ∩ Dom(M_sqrt(r))`. Start with its **defined joint graph closure** rather than assuming core density.

## 3. Conditional physical compactness reuse

The existing original Lean source

- `OAI.BFSSSliceSobolev.core_linear_moment_totallyBounded` in `SpectralCoreLinearMomentCompactness.lean`
- `OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded` in `SpectralWeightedClosureCompactness.lean`

provides compactness for families that have bounded gradients, L² norms, and first radial moment, under its explicitly stated finite-dimensional and Sobolev hypotheses. The new inequality supplies the gradient bound from uniform native charge plus radial moment bounds. An exact adapter must reconcile the source real-linear `BFSSSliceSobolev.toL2`, complex-linear `coreToL2`, coordinate-direction basis, and literal paired SU(2) finite Fock carrier. Audit the source/consumer **qualification** of the older compactness declarations; source existence alone does not inherit recent strict qualification.

Conclusion would be relative compactness of a *conditionally weighted bounded family*, not compact resolvent of the unweighted physical Hamiltonian.

## 4. Cutoff bridge and original gauge invariance

Source reuse candidates: `BFSSSliceSobolev.scaledCutoff_support` and `scaledCutoff_fderiv` in `SobolevGraphs.lean`, `AlgebraData.charge_ims` and `coreForm_ims` in `Cutoffs.lean`, `GaugeData.invariantCore_equivariant` in `GaugeCore.lean`, and the actual isometric source `G.boson`.

Before any global domain claim, establish a radial cutoff preserving the *original* invariant smooth core; then a source-exact first-order charge-commutator estimate

```text
‖T(χ_R u_f) - χ_R (T u_f)‖ ≤ (C_χ/R) ‖u_f‖
```

on the original core. The output cutoff acts coordinatewise on the sixteen original charges. This must account explicitly for compact support, radial gauge invariance, scalar action on the original Fock fiber, normalization, and the physical subspace. An IMS energy partition is not by itself the desired single-cutoff operator estimate.

Only after proving core cutoffs and closure extension should one attempt density in an intersection weighted graph domain. A two-stage cutoff-and-smoothing argument may be necessary.

## 5. Negative-control stop rule: global moment coercivity

Do NOT assume

```text
∫ ‖x‖ ‖u(x)‖² ≤ C(‖u‖² + ‖Tu‖²)
```

for every physical `u∈Dom(T)`. Combined with the preceding gradient inequality and existing Rellich machinery, a uniform first-moment bound on the entire charge graph unit ball would imply compact form embedding and, **if** the physical closed charge form is densely defined and identifies `H=T†T/16`, compact resolvent. This must be checked against the continuous spectrum down to zero for classical supersymmetric matrix models. See de Wit, Lüscher and Nicolai, *The supermembrane is unstable*, Nucl. Phys. B320 (1989), 135–159, https://doi.org/10.1016/0550-3213(89)90214-9 . This literature comparison is not itself a theorem about the exact currently formalized source operator.

A Weyl-sequence or escaping-valley construction using the original paired SU(2) Fock carrier is an adversarial *research task*, not yet demonstrated by the current formal proof corpus. Do not infer nonexistence of a normalizable threshold ground state from essential spectrum alone.

## 6. Recommended bounded sequencing and stop conditions

1. Qualify GM5D R2 or preserve its new exact RED; do not widen its theorem or resource budget reactively.
2. Draft **GM5E0** as the inequality `K+P ≤ E+C_M moment` using qualified GM5C alone, with original paired strict consumer. Promote only after exact source CI and artifact evidence.
3. Draft **GM5E1** as a conditional gradient/potential Cauchy theorem in the *joint weighted graph closure*; separately handle the multiplication-graph and fermionic quadratic-form interfaces.
4. Draft **GM5E2** as a compactness adapter to the original source `core_linear_moment_totallyBounded`, after auditing its old qualification, without assuming a global moment bound.
5. Parallel negative path: test escaping-valley energy and weighted-moment growth in a physical, gauge-invariant source candidate; preserve any failure.

No change to the separate historical M4 gate register, no physical mass gap, no Hopfion or GUT claims, and no use of `sorry`/`admit`/new axioms.
