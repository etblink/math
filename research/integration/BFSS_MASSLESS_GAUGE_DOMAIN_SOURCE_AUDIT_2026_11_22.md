# BFSS massless source-exact SU(2) gauge-domain forward research — 2026-11-22

**Disposition: SOURCE AUDIT / FORWARD RESEARCH ONLY. No new Lean theorem qualified. No new physical claim.**

## Frozen operational context

- Research branch `research/bfss-massless-gauge-domain-boundary-20261122`, created from exact unified HEAD `df9bc7ec663565de94020ebd7b38b35c70eae36c`.
- Integration PR #4 promoted 14 original-source massless modules and the independent D69 consumer: original [R3 strict run #45056662238](https://github.com/etblink/math/actions/runs/45056662238) passed on `33cc739c97b03a6b67de965ededd72bc0ddd2923`; candidate and PR #4 merge trees byte-identical.
- One-line target workflow guard promoted by PR #5 to unified HEAD `df9bc7ec663565de94020ebd7b38b35c70eae36c`. [Exact target push run #45059474635](https://github.com/etblink/math/actions/runs/45059474635) had **started** when this note was drafted. **Do not call it GREEN until the new run and original artifact are independently verified.**
- No changes to `main`, imported donor Lean files, R1/R2 REDs, D69, accepted manifest, or pre-existing CI gates in this research branch.

## Source-exact facts inspected at unified SHA

1. `BFSSMasslessM1aOriginalComplexQuantizerNormalization.lean`:
   `masslessSourceFrequency M x = -(sourceBracketCoefficient M x)` and
   `originalMasslessQuantizer_eq_cubic`; exact massless `h=1,m=0` coefficient, no massive substitution.
2. `BFSSMasslessD0b0OriginalMaximalDomainSubmodule.lean`:
   `originalMasslessAction M ψ x = M.quantizeFrequency (masslessSourceFrequency M x) (ψ x)`;
   `originalMasslessDomain M = {ψ : FullL2 N | MemLp (originalMasslessAction M ψ) 2 volume}`.
   The action is a.e.-congruent and complex-linear; the maximal natural domain is an actual complex submodule.
3. `BFSSMasslessD0c0OriginalGenericPartialMultiplierGraph.lean`: the literal `originalMasslessMultiplier : originalMasslessDomain M →ₗ[ℂ] FullL2 N`, its a.e. action, and its algebraic graph.
4. `BFSSMasslessD0e1dPairedOriginalClosedDenseGraphConsumer.lean`: actual paired 48-Majorana `AlgebraData 2` specialization: source domain dense and original graph closed. **No** gauge invariance or operator self-adjointness.
5. `OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean`:
   exact original `pairedGaugeData : pairedAlgebraData.GaugeData`, with source boson action `B_g` and fermion isometry `F_g`.
6. `OperatorDependencies/SU2BFSSPhysicalDomainL6G7UActualSourceFullL2GaugeContractionProbe.lean` defines the original convention
   `U_g ψ = fiberAction g (bosonPullback g⁻¹ ψ)`, a source-exact linear FullL2 map.
   `...L6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe.lean` packages this as `actualOriginalFullL2GaugeUnitaryHom g : FullL2 2 ≃ₗᵢ[ℂ] FullL2 2`, with group law and inverse.
7. `OperatorDependencies/SU2BFSSG4HExactThetaCovarianceProbe.lean` has exact theta/color covariance;
   `BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean` and `BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean` concern a specific **bounded** Fock Gram observable, not the massless interaction coefficient.
8. `P3AuxG0B1OriginalReciprocalBosonGaugeCommutation.lean` and `...G0B2OriginalReciprocalFermionGaugeCommutation.lean` show an instructive `Lp.ext` / a.e. / measure-preserving pullback proof *pattern* for a **bounded scalar** reciprocal multiplier. File comments themselves mark these gates prospective; **do not silently upgrade their qualification status**. Their scalar-commutation argument cannot be reused as if the non-scalar massless Fock coefficient were gauge-invariant pointwise.
9. `OperatorDependencies/SU2BFSSPhysicalDomainL6H4COriginalFullL2GaugeStrongContinuityProbe.lean` contains a dense-core to full-L2 strong continuity proof architecture. Whether this particular source is currently strict-qualified is a separate provenance question; it is not needed for finite-gauge domain invariance.

## Exact mathematical target

Let `M = pairedAlgebraData`, `B_g = pairedGaugeData.boson g`, `F_g = pairedGaugeData.fermion g`, `U_g = actualOriginalFullL2GaugeUnitaryHom g`, and `Q(x) = M.quantizeFrequency (masslessSourceFrequency M x)`. The required source identity is, for every genuine `g : GaugeGroup 2`, `x : Boson 2`, and `v : Fermion 2`,

```
Q (B_g x) (F_g v) = F_g (Q x v).
```

Equivalently, `Q x ∘ F_g = F_g ∘ Q (B_{g⁻¹} x)`. This exact conjugation identity is **not** established by the existing D0e1d closed-graph proof or by D69 topology. Its proof requires matching the transformed bosonic cubic coefficient, three-color structure constants, gamma contraction and original fermionic theta/color transformation (especially color-index order and signs). Mere orthogonality of a color matrix, or the previous bounded Gram-observable covariance, does not automatically supply the needed trilinear/alternating-tensor identity.

When the pointwise identity is proved, the original `U_g` and measure-preserving `B_{g⁻¹}` should yield

```
originalMasslessAction M (U_g ψ) =ᵐ[volume]
  (fun x => F_g (originalMasslessAction M ψ (B_{g⁻¹} x))).
```

Then the RHS is `MemLp 2` iff the original action is: the Fock fiber map is an isometry and `B_{g⁻¹}` preserves volume. This yields `U_g (Dom Q) = Dom Q` using the inverse group element and, as a distinct last gate, `Q (U_g ψ) = U_g (Q ψ)` on the natural domain. It would imply graph equivariance, **not** self-adjointness, a Gauss generator, a Hamiltonian or a Hopfion.

## Proposed bounded gates / stop rules

| Gate | Precise target | Pass condition | Blocker/stop |
| --- | --- | --- | --- |
| GM0 | Source-exact pointwise massless Fock coefficient covariance, genuine `B_g/F_g` | Native source + independent consumer + only allowed Lean axioms | First check full SU2 adjoint/structure-constant tensor identity; no surrogate `SO(3)` action substituted |
| GM1 | Source Lp a.e. transport identity, named original quantizer | `Lp` representative and measure-preserving transformations, no new MemLp assumptions | Avoid explicit unfolding the full paired 48-Majorana `quantizeFrequency` goal |
| GM2 | Natural-domain forward/backward invariance `U_g (Dom Q) = Dom Q` | Exact original domain and original `L6G7Z` unitary, zero new assumptions | Do not infer domain invariance from closedness alone |
| GM3 | Restriction of U to domain and exact multiplier intertwining / graph preservation | Strict independent consumer on the real `FullL2 2` carrier | No fake bounded extension or self-adjointness |
| GM4 | Optional source `physicalSpace`/Gauss-fixed restriction | Separate genuine fixed-space and graph-domain proof | Do not equate invariant domain with gauge-fixed physical state |
| GT | Gamma9 D69 topological compatibility | Separate explicitly typed map between physical source and Gamma9 quotient | **No bridge or Hopfion inferred from merely importing both** |

**Execution:** prove GM0 first in an isolated original-source module; preflight source object identities and required tensor identity before writing the full proof; keep abstract algebra from expensive original paired elaboration; attach exact source SHA / native log / independent consumer / axiom reports / artifact checksum at each gate. At most two consecutive same-root native REDs before stopping for a proof-architecture change. Failed attempts and first-causal logs become permanent negative knowledge, not deletion targets.

**Known negative corpus:** D0b1 two recursion REDs (#44999415076, #45017316087), plus unqualified D1F and D1S4 source attempts. Do not import them or re-expand their large paired source quantizer in an isolated consumer. Retain R1 shallow-checkout and R2 `Homeomorph` Type/Prop RED integration records.

## Scientific boundaries

No proof here of physical gauge-domain invariance, quantizer covariance, self-adjointness, a source-typed Fock trial state, physical Spin(9) Hopf number, Hamiltonian gap, mass gap, Standard Model identification, GUT, or ToE. This memo is a falsifiable plan with checked source interfaces, **not a claimed physics result**.
