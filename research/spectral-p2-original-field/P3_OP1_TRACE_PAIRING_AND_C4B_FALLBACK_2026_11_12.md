# P3-OP1 source-original trace pairing — strict-gate preparation and C4B fallback

**Date:** 2026-11-12 Pacific. **Scope:** read-only mathematical/source investigation, preserved as documentation. No new Lean claims qualified here.
**Track:** `integration/bfss-unified-research-20261108`. **P2-C4B live gate:** #43212567367 at exact tested SHA `c1546c59c9eeb04c847f1207fa38461fe6eaad8f`; conclusion is not assumed.
**Governance:** preserve source, independent consumer and CI under test. No new branch, no force push, no changes to `main` or FCP.

## P3-OP1A: the smallest exact original Spin(9) operator-isometry interface

### Qualified/available donor files inspected at the immutable current source

1. `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean`, Git blob `b50ef04695587b267ad8519074b1293f98828749`: `source9Spin_originalFockOperatorStarAlgEquiv g : (Fermion 2 →L[ℂ] Fermion 2) ≃⋆ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`, and group hom `source9Spin_originalFockOperatorStarAutomorphismHom`. This is on the LITERAL original Fock Hilbert space, not a replacement CAR module. The `star` here is the real physical Fock-operator Hilbert adjoint, from `P2bB2OriginalFockGlobalPhysicalStar.lean`, blob `4e612210d9ca04f5877a87de54bc6bf1a350e602`.
2. `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean`, blob `3be6c9a6f2898484df66690f94fdfa1877660897`: `originalFockTrace : OriginalFockOp →ₗ[ℂ] ℂ` is the EXACT `LinearMap.trace ℂ (Fermion 2)` transported via `Module.End.toContinuousLinearMap`; `source9Spin_originalFockTrace_invariant g T` proves its invariance under the same exact source star action.
3. Pinned Mathlib file `Mathlib/Analysis/InnerProductSpace/Trace.lean`, revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, blob `4af5d0e42fd3aef7aa70bfbba159240461d3c5da`. The exact lemma `LinearMap.trace_eq_sum_inner` states for a finite orthonormal basis `b`: `T.trace 𝕜 E = ∑ i, ⟪b i, T (b i)⟫_𝕜`. Import this module only when proving HS positivity/finite-column formula, not as a prerequisite for OP1A.

Define on the true Fock-operator carrier `A = Fermion 2 →L[ℂ] Fermion 2` the ordinary complex trace pairing

    B(S,T) = originalFockTrace (star S * T).

For each source `g : spinGroup source9Quadratic`, let `α_g` be precisely the existing B3 star-algebra automorphism. Then:

    B(α_g S, α_g T)
      = Tr((α_g S)^* (α_g T))
      = Tr(α_g(S* T))
      = Tr(S* T)
      = B(S,T).

This is a **formal algebraic consequence** of B3 `map_star` + `map_mul` and T1 exact trace invariance. No continuity of `g ↦ α_g` or Hilbert completion is required to prove this pairing equality. Unlike norm `‖T‖` on the continuous operator algebra, the Hilbert–Schmidt norm is `sqrt(Re(Tr(T* T)))`. **Do not confuse operator norm with HS norm.**

### Exact next source proof contract (UNCOMPILED sketch)

Import only `T1OriginalFockTraceInvariance`. A candidate first gate is:

    noncomputable def originalFockTracePairing (S T : Fermion 2 →L[ℂ] Fermion 2) : ℂ :=
      originalFockTrace (star S * T)

    theorem source9Spin_originalFockTracePairing_invariant
        (g : spinGroup source9Quadratic) (S T : Fermion 2 →L[ℂ] Fermion 2) :
        originalFockTracePairing (α_g S) (α_g T) =
          originalFockTracePairing S T := by
      let e := source9Spin_originalFockOperatorStarAlgEquiv g
      -- rewrite e(star S * T) by e.map_mul, then e.map_star
      -- conclude by source9Spin_originalFockTrace_invariant g (star S * T)

This is an **API plan** only; verify exact namespace and method names in the cold compiler. An independent consumer must exercise both general `S,T` and the diagonal `S=T` rather than checking only the trivial `T=0` case. Audit exact B3/T1/Gamma inputs, the two new declarations, consumer and allowed axioms. This should be a small stand-alone P3-OP1A gate **after** resolving P2-C4B, with no new development branch.

### Separate follow-up: P3-OP1B finite-column positivity/isometry

Only after OP1A qualifies, use `LinearMap.trace_eq_sum_inner` on an orthonormal basis of actual finite-dimensional Fock space to establish

    Tr(T* T) = Σ_j ‖T(e_j)‖² ∈ ℝ_≥0.

Then define the genuine complex Hilbert–Schmidt inner product from the trace pairing and show `α_g` is unitary/isometric in this norm. Finite dimensionality makes HS completeness routine, **but** provide Lean source theorem and consumer rather than treating it as automatic. The finite-column map and its adjoint should use the actual source basis and real closed Hamiltonian domain, not a surrogate model. No stronger topological Spin action or physical Hamiltonian reduction follows automatically.

Next gates are source `Spin(9)` action continuity, original gauge-left-output intertwining (`S1H` uniqueness with its **explicit covariance premise**, and `C48C0` source label commutation), and original form/closed graph invariance. Preserve full Spin(9) center; do not descend to SO(9) without a proved kernel theorem.

## P2-C4B fallback if run #43212567367 is also red

The running P2-C4B source on commit `c1546c59c9eeb04c847f1207fa38461fe6eaad8f` contains six original-source integrability theorems. Previous red #43207104792 had clean original potential, fermionic and radial witnesses; red #43210317663 additionally showed `originalLowerDensity_integrable` clean after its exact `funext; ring` conversion. Both reds stem from Lean's huge definitional simplification at `originalActualDensity_integrable`, NOT an observed mathematical obstruction.

Current source's attempted `originalActualDensity_integrable` uses a **single direct** `exact (originalPotentialDensity_integrable f).add (originalFermionDensity_integrable f)`, without `simpa` or `change`. This attempt is currently under strict verification. Do not change it while CI is running.

If direct `exact` also fails with recursion, stop alternating tactics and instead isolate an **explicit one-point equality** in a tiny lemma:

    originalActualDensity f x =
      M.deformedBosonicPotential 1 0 x * ‖f x‖² +
        inner ℝ (f x) (M.deformedFermionField 1 0 x (f x)).

Propose `funext` to lift it to function equality, with controlled unfolding `[originalActualDensity]` only, then transport an already-proven `Integrable.add` witness via a single rewrite or `Integrable.congr`. This also requires Lean compilation; `rfl` may itself encounter record-definitional cost, so if the microlemma still recurses, inspect the specific transparency/unification behavior instead of increasing `maxRecDepth` or re-running a broad simplifier. Another option is to move the proof into the original `AlgebraData` generic field, avoiding reduction of the massive `concreteAlgebraData` record, then specialize, but only with exact source binding.

Preserve every actual red's first causal error and test the smallest consumer separately. No new axioms, no `sorry`, no weakened integrability premises, and no promotion until all six declarations, the independent consumer and strict audit complete green.

## Scientific ceiling

OP1A would prove only a finite-dimensional operator-algebra pairing invariant under the source algebraic Spin(9) action. Even OP1B would not supply continuity, source gauge-physical reduction, genuine compact isotypic projections, whole-sector Spin(8) oscillator exclusion, original closed form/graph equality, or original positive eigenpair existence. P2-C4B, if it qualifies, is only an unconditional ORIGINAL smooth-core energy lower bound, and its scalar potential remains nonconfining along commuting valleys. Never claim a mass gap or a ToE/GUT from these gates.
