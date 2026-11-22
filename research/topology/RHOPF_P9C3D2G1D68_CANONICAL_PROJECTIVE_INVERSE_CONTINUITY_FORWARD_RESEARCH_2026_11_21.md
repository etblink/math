# RHOPF D68 — independently canonical complex projective inverse continuity: forward research

**2026-11-21 Pacific / 2026-11-22 UTC.** **Status: RESEARCH ONLY, NOT A PROVED GATE.** D66 R3 has been independently qualified; D67 R1 strict CI [#44995451125](https://github.com/etblink/math/actions/runs/44995451125) was still in progress when this note was prepared. Do NOT assert inverse continuity or launch D68 native tests before D67 is qualified. No modifications to accepted D45–D66 proof bytes or `main`.

## Exact types and the non-circular goal

Let `V := EuclideanSpace ℂ (Fin 2)`, `N := {v : V // v ≠ 0}`, `U := {y : V // ‖y‖ = 1}`, `Q := Quotient relationalEuclideanUnitCircleOrbitSetoid`, and `P := Projectivization ℂ V`. The accepted D65 actual algebraic `Equiv E : Q ≃ P` is built from D63's exact orbit-class map and D64's surjectivity. D66 independently defines `T : TopologicalSpace P` as the quotient topology of `N` by `projectivizationSetoid`, and proves `Topology.IsQuotientMap (Projectivization.mk' ℂ : N → P)`. The proposed D67 tests `Continuous E` for **this exact T**.

The next nontrivial obligation is `Continuous E.symm` under the **same independently defined T**, not continuity for a topology transported along `E`. Then—and only then—combine the two directions with the D65 underlying `Equiv` to package `Q ≃ₜ P`, with exactly the accepted D57/D61/D65 maps. The quotient-topology identification is non-circular because `T` was defined and qualified independently in D66.

## Source-checked mathematical route (recommended)

**Step A — norm-one normalization of nonzero complex vectors.** Define, on `N`,
`ν(v) := ⟨(((‖v.1‖⁻¹ : ℝ) : ℂ) • v.1), proof that ‖…‖ = 1⟩ : U`.
The norm-one proof already exists *within* D64's strict GREEN proof of projective surjectivity. Extract only the necessary formula without changing D64. Prove continuity of `ν : N → U` in an isolated new theorem; its scalar factor is continuous away from zero and real/complex scalar multiplication is continuous.

**Step B — exact representative identification.** Prove
`E (relationalEuclideanUnitCircleOrbitClass (ν v)) = Projectivization.mk' ℂ v`
for *every* `v : N`. Use accepted D65 `E_class`, D61's `relationalStandardUnitSphereProjectivePoint`, and pinned `Projectivization.mk'_eq_mk` plus `Projectivization.mk_eq_mk_iff' ℂ` with nonzero scalar `(‖v‖⁻¹ : ℝ)`. D64's proof already uses the same algebraic witness. Do **not** identify quotient maps by a pointwise unproved definitional equality.

**Step C — descend inverse continuity along the ACTUAL D66 quotient.** From Step B and the accepted E bijection derive pointwise
`E.symm (Projectivization.mk' ℂ v) = relationalEuclideanUnitCircleOrbitClass (ν v)`.
The right-hand map is continuous because D59 proves `IsQuotientMap orbitClass` (hence `Continuous orbitClass`) and Step A proves `Continuous ν`. Then D66's actual `relationalCanonicalProjectivizationMk_isQuotientMap.continuous_iff` gives `Continuous E.symm`. This is the correct topology direction and requires neither arbitrary topology transport nor an unverified Hausdorffness shortcut.

**Step D — strict isolated qualification.** Add one small source theorem/microgate at a time if elaboration needs splitting: (1) normalizer with continuity, (2) exact class equality, (3) inverse continuity, (4) final Homeomorph in a separate gate. Each gate must use byte-frozen predecessors, a single source file, separately compiled independent consumer, exact expected axiom lists (subset of `propext, Classical.choice, Quot.sound`), no `sorryAx`, warning-as-error, source Git blob hash guards, same Gamma9 source and integer fixture, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Preserve original REDs as diagnostic assets and stop after bounded same-mechanism failures.

## Pinned Mathlib reuse investigated

At exactly `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Mathlib/Analysis/Normed/Module/Ball/RadialEquiv.lean` defines:

```lean
noncomputable def homeomorphUnitSphereProd
    (E : Type*) [NormedAddCommGroup E] [NormedSpace ℝ E] :
    ({0}ᶜ : Set E) ≃ₜ (Metric.sphere (0 : E) 1 × Set.Ioi (0 : ℝ))
```

Its first projection is the normalized unit vector; a direct extraction may eliminate hand-rolled continuity proofs. **Caveat:** its codomain uses `Metric.sphere (0 : E) 1`, while the exact D57 standard unit sphere is `{y : E // ‖y‖ = 1}`. A proof of the coercion/subtype equivalence is required (possibly via pinned `Metric.mem_sphere_zero_iff_norm`). Do **not** assume these subtype presentations are definitionally identical or replace D57's exact type.

Pinned `Mathlib/Topology/Maps/Basic.lean` defines `Topology.IsQuotientMap.continuous_iff` and `Topology.IsQuotientMap.continuous`; D66 directly verifies `Projectivization.mk'` is quotient for T. D59 directly verifies the D57 Circle-orbit class map is quotient for the original quotient topology.

## Disallowed shortcuts and honest significance

Do **not** define the target topology by pulling back via D65, add a global `TopologicalSpace P` instance, upgrade Mathlib, use `sorry`, suppress proof style linters, change previously accepted theorems, or infer Hausdorffness/compactness of projectivization merely from the algebraic Equiv. This is topological infrastructure for one relational complex-two-dimensional circle sector; it does not yet prove `CP¹ ≃ₜ S²`, any Hopf or Chern invariant, a BFSS physical Fock/Gauss/Hamiltonian state, a stable hopfion, or a GUT/ToE. The scientific obligation to tie any mathematical Hopf topology to actual physical admissibility and distinguishable predictions remains separate.

## Next operator decision

1. Wait for the original **D67 R1** native and independent reports. On RED, diagnose and preserve; on GREEN, independently verify ZIP CRC/hash/commit/axiom lists then qualify by a separate evidence-only commit.
2. Once D67 qualifies, open bounded **D68-A** normalization continuity. Prefer source-exact radial homeomorphism reuse only if its `Metric.sphere`/D57 `‖y‖=1` type bridge is small and explicit; otherwise direct normalization formula from D64.
3. Do not conflate a mathematical homeomorphism with a physical BFSS hopfion or claim source-to-operator binding has been completed.
