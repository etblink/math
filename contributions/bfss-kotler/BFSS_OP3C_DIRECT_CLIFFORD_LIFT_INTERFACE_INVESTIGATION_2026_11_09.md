# BFSS OP3-C — direct original Clifford universal-lift interface investigation

**Date:** 2026-11-09
**Repository:** `etblink/math`
**Research branch:** `integration/bfss-unified-research-20261108`
**Starting audited HEAD:** `1190650057d188cbee55a685f3783bdece25ea34`
**Status:** **READ-ONLY MATHEMATICAL/API INVESTIGATION; NO NEW LEAN SOURCE, PROOF GATE, OR MATHEMATICAL QUALIFICATION.**
**Compiler baseline:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
**Operating method:** [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md).

> **Project Lead decision:** The exact original quadratic-preserving linear map already supplies the universal Clifford algebra's minimum mathematical input. Do not require the optional `QuadraticForm.IsometryEquiv` package when the actual target is a generator-covariant Clifford endomorphism. Preserve the independent source, group law, and inverse obligations.

## 1. Accepted ancestry and the two-red boundary

The accepted chain is:
- **OP3-A1** [#42668302044](https://github.com/etblink/math/actions/runs/42668302044): exact original G1A label, positive `√2` original Majorana and real gamma **source-axis** compatibility.
- **OP3-A2** [#42671945161](https://github.com/etblink/math/actions/runs/42671945161): the actual `CliffordAlgebra (source48Quadratic.baseChange ℂ)` M3I equivalence evaluates real pure generators to the original donor gamma, then to active normalized Majoranas **on original source axes**.
- **OP3-B1** [#42675821883](https://github.com/etblink/math/actions/runs/42675821883): exact `source48Quadratic (R(g).mulVec v) = source48Quadratic v` for the preexisting original paired-label F10R Spin(9) → SO(48) homomorphism, all original real 48-vectors; and generic original orthogonal-matrix case.
- **OP3-B2 HOLD:** [#42678500270](https://github.com/etblink/math/actions/runs/42678500270) and [#42680558526](https://github.com/etblink/math/actions/runs/42680558526) both red. First recursed in a nested `QuadraticForm.IsometryEquiv` structure; second **did elaborate** the separate `Source48Vector ≃ₗ[ℝ] Source48Vector` with permitted-axiom report but **again recursed in `IsometryEquiv.map_app'`**. No OP3-B2 theorem is independently qualified. Stop the wrapper attempts. See [exact two-red ledger](BFSS_OP3B2_SOURCE48_ISOMETRY_PACKAGING_AND_OP3C_INTERFACE_AUDIT_2026_11_09.md).

The `source48Quadratic` carrier is **exactly** the previously qualified original `Source48Vector := (Fin 24 × Fin 2) → ℝ` with `QuadraticMap.weightedSumSquares ℝ (fun _ => 1)`, not the separate nine-vector quadratic or any surrogate.

## 2. Exact pinned Mathlib API and working donor precedent

The following source declarations were **read at the exact pinned Mathlib revision**, not inferred from current documentation:

| API / location | Exact type or action | Use |
| --- | --- | --- |
| `Mathlib/LinearAlgebra/QuadraticForm/Isometry.lean` | `QuadraticMap.Isometry Q Q` (`Q →qᵢ Q`) extends `LinearMap`, with `map_app'` and `Isometry.comp` | **Fallback:** avoids full equivalence but still requires potentially troublesome isometry-field elaboration |
| `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`, lines 120–123 | `CliffordAlgebra.ι_sq_scalar (Q) (v)`: `ι Q v * ι Q v = algebraMap R _ (Q v)` | Gives the exact Clifford square relation after source orthogonal transport |
| Same file, lines 132–170 | `CliffordAlgebra.lift Q : { f : M →ₗ[R] A // ∀ v, f v * f v = algebraMap R A (Q v) } ≃ (CliffordAlgebra Q →ₐ[R] A)`; `lift_ι_apply` | **Preferred:** direct real Clifford algebra endomorphism without building `Isometry` or `IsometryEquiv` |
| Same file, lines 173–190 | `lift_unique`, `lift_comp_ι`, `CliffordAlgebra.hom_ext` | Prove two algebra homomorphisms equal by equality of their values on original source generators |
| Same file, lines 325–352 | `CliffordAlgebra.map (Q →qᵢ Q)`, `map_apply_ι`, `map_id`, `map_comp_map` | Secondary construction, offers short group-law proofs if a minimal `Isometry` packages successfully |
| Same file, lines 359–391 | `leftInverse_map_of_leftInverse`, `equivOfIsometry` | Shows that **invertibility and group inverse may be proved separately**; the large equivalence package is a convenience rather than a mathematical prerequisite to generator transport |
| `Mathlib/LinearAlgebra/CliffordAlgebra/BaseChange.lean`, lines 48–69, 79–105 and 157–187 | `ofBaseChange`, `toBaseChange`, `equivBaseChange ℂ Q`, the `toBaseChange_ι` / `ofBaseChange_tmul_ι` pure-generator theorems | Later transport real `AlgHom`/automorphism to the **actual** complexified original Clifford algebra consumed by M3I |
| `Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean`, line 50 | `star (ι Q v) = -ι Q v` for the Mathlib real Clifford conjugation | **Warning:** this is **not** the physical Fock Hilbert adjoint; the original normalized `θ` is self-adjoint. No star-equivariance inference from the bare Clifford `AlgEquiv` |

**Source-faithful predecessor already in this repository:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52L9E5C1OriginalFockCliffordAlgebraUniversalLiftProbe.lean` at Git blob `e41b8980284ead53ec5018587bef23c3cc741b59` uses **`CliffordAlgebra.lift source48Quadratic ⟨f,hq⟩`** with `f=originalFockGammaRealLinear` and a source square theorem. Its declarations are included in the accepted M2/M3I ancestry. This makes the universal-property route a recovered project technique, not an invented alternative.

## 3. Minimum source-faithful construction (mathematics only; no compiled new code)

Let `Q := source48Quadratic`, `V := Source48Vector`, `C := CliffordAlgebra Q`. Let `R_g` be the **actual** underlying original G1A paired-label real matrix of `source9SpinOriginalPaired48OrthogonalHom g`. Define the real-linear map
`f_g : V →ₗ[ℝ] C := (CliffordAlgebra.ι Q).comp (R_g.mulVecLin)`.

The only new **square** obligation for direct `CliffordAlgebra.lift` is:

```text
∀ v : Source48Vector,
  f_g v * f_g v = algebraMap ℝ (CliffordAlgebra source48Quadratic) (source48Quadratic v)
```

By the pinned `CliffordAlgebra.ι_sq_scalar`, its left side equals `algebraMap ℝ C (Q (R_g.mulVec v))`. The equality `Q (R_g.mulVec v) = Q v` is **already accepted in OP3-B1**. No huge 48-term sum, Fock operator unfolding or `IsometryEquiv` field is required.

The proposed algebra homomorphism is the canonical universal lift `Φ_g := CliffordAlgebra.lift Q ⟨f_g, h_g⟩`. Its proposed **source generator covariance** is:
`Φ_g (CliffordAlgebra.ι Q v) = CliffordAlgebra.ι Q (R_g.mulVec v)`.
The pinned `CliffordAlgebra.lift_ι_apply` proves the universal-generator evaluation once the lift has *actually compiled*. This is **not an accepted theorem yet**.

### Needed group and inverse equations (not implied by a single lift)

For the same original group `G := spinGroup source9Quadratic`, prove separately:

- `R_1 = I` from the accepted F10R group map; conclude `Φ_1 = AlgHom.id ℝ C` by `CliffordAlgebra.hom_ext` on the source generators.
- `R_(g*h) = R_g * R_h` from F10R's exact underlying matrix group homomorphism, and `(R_g * R_h).mulVec v = R_g.mulVec (R_h.mulVec v)`; conclude `Φ_(g*h) = (Φ_g).comp (Φ_h)` with the same original generator extensionality. **Group-law orientation is mandatory**; do not invert the order for convenience.
- `Φ_(g⁻¹) ∘ Φ_g = id` and `Φ_g ∘ Φ_(g⁻¹) = id` then follow from the actual source group inverse and verified composition, and only then can `AlgEquiv.ofAlgHom` or the corresponding group-automorphism structure be packaged.

Do not replace `g` by a free orthogonal matrix at the final source-action theorem or assert that one generator-covariant endomorphism is automatically invertible.

## 4. Comparative choice of routes and a fail-closed diagnostic plan

| Route | Remaining elaboration risk | Strength | Decision |
| --- | --- | --- | --- |
| Reattempt `QuadraticForm.IsometryEquiv` | **Same `map_app'` recursion twice** | Canonical `equivOfIsometry` but optional for the actual source Clifford hom | **HOLD**; do not submit third variant |
| Minimal `QuadraticMap.Isometry` → `CliffordAlgebra.map` | Smaller wrapper, but same kind of `map_app'` definitional check could recurse | Mathlib already supplies `map_apply_ι`, `map_id`, `map_comp_map` | **Secondary fallback**, only after a tiny isolated original-source diagnostic |
| **Direct `CliffordAlgebra.lift` with named small `f_g` and square proof** | Lean must elaborate a concrete source linear composite and scalar square identity, but no quadratic-isometry structures | Reuses accepted OP3-B1 and the historical working L9E5C1 pattern; supports `hom_ext` | **Preferred next experiment** |
| One-shot complete complex Clifford + Fock operator action | Very high reduction, unverified star/topology and base-change interfaces | Premature combination of unrelated obligations | **Reject as next gate** |

**Preflight sequence (no CI yet):**

1. Recover and read the exact `L9E5C1` `CliffordAlgebra.lift` source proof, OP3-B1 preserved form, F10R `MonoidHom`, `Matrix.mulVecLin` already elaborated in the red OP3-B2 run. Pin all exact existing blobs.
2. Make **one small original-carrier source diagnostic** whose first root checks the square relation `(ι Q (R_g.mulVec v))² = algebraMap ℝ C (Q v)`. Verify exact `CliffordAlgebra.ι_sq_scalar` and OP3-B1 source theorem only, no `Isometry` structure. Prefer a minimal direct proof over kernel reducing a 48-dimensional `rfl` of a complex structure.
3. Add **one** real Clifford `AlgHom` via `lift` and **one** generator-evaluation root, ideally in a separate module with the square bridge imported, preserving one principal new obligation per strict gate.
4. Make an independent consumer check the **actual** `CliffordAlgebra source48Quadratic →ₐ[ℝ] CliffordAlgebra source48Quadratic` and source generator type, exact theorem-root/axiom checks, fixed Lean/Mathlib and frozen original sources. No complexification or Fock star in the first expensive gate.
5. If it qualifies, work out identity and composition using `CliffordAlgebra.hom_ext` and the exact F10R group-law; use the original source inverse before building an `AlgEquiv`. If the direct `lift` elaboration fails at the same `map_app'`-like cause, **stop and diagnose** before a new design; record first causal compiler error.
6. Only then transport the real source Clifford action to `CliffordAlgebra (source48Quadratic.baseChange ℂ)` using the pinned `equivBaseChange ℂ Q` and exact pure-generator base-change theorem. **After acceptance**, conjugate through the existing accepted M3I complex Fock `AlgEquiv`; independently audit physical adjoints/star, negative Spin center as fermion-parity conjugation, continuity, gauge compatibility, closed original physical Hamiltonian and sector spectrum.

**Acceptance policy unchanged:** Cold build, independent original-carrier consumer, exact source SHA pins and fixed Lean/Mathlib, exhaustive intended roots, only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, no new axioms, no source-model changes, no recursion budget escalation.

## 5. Scientific and operational boundaries

The direct real Clifford lift is a path to a **global algebraic source generator-covariant Spin(9) action**. It does not alone produce a continuous group action, Hilbert-unitary Fock lift, physical star automorphism, gauge commutation, original Hamiltonian-domain theorem, coercivity or positive point spectrum. Mathlib's real Clifford `star` sends generators to their **negative** whereas the original Fock Majoranas are self-adjoint; this must remain an explicit separate involution-compatibility question. The full-operator weight bound in parallel spectral work remains `M=12`, and all high-sector oscillator exclusion remains conditional until those representation/physical bindings are discharged.

**Immediate Project Lead disposition:** Read-only analysis established a more direct universal-property route and precise minimal experiment. Keep OP3-B2 on hold; **do not modify production Lean or launch a new strict run as part of this investigation**. Decide on one small direct-lift diagnostic only after inspecting its original-source statement and exact parent closure.
