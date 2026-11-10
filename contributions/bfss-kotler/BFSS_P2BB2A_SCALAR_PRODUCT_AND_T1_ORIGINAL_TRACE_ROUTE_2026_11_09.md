# BFSS — P2b-B2a original physical-star scalar/product microgate and T1 original trace route

**Date:** 2026-11-09 (America/Los_Angeles)  
**Branch:** `integration/bfss-unified-research-20261108`  
**Disposition:** B2a **candidate in strict CI**; T1 **read-only original-source API discovery**, not a qualified Lean theorem  
**Accepted parent:** P2b-B1 strict [green #42754462733](https://github.com/etblink/math/actions/runs/42754462733), exact tested commit `cd38c01c3f007f269c05ca95e17df4100ccab548` (47/47 source pins, independent consumer, only `propext`, `Classical.choice`, `Quot.sound`).  
**Other accepted parent:** B0 strict [green #42752159572](https://github.com/etblink/math/actions/runs/42752159572), exact tested commit `505f1adbeae12ededdd8b0d7bf30535a4e9fb76b`.  
**Toolchain:** Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## I. Candidate P2b-B2a: scalar and reversed-product physical star

**Bounded target:** strictly qualify only two missing *constructor cases* of the later complete original Clifford induction, not a global star theorem.

On the **literal** `OriginalFockOp := Fermion 2 →L[ℂ] Fermion 2` with physical Hilbert `star`, original C6A `α_g`, and complex `algebraMap`, the three candidate roots are:

1. `originalFock_physicalStar_mul (S T)`: `star (S*T) = star T * star S`, using the exact original `ContinuousLinearMap.adjoint_comp` as a typed composition, not `star_mul _ _` with unbound synthetic types.
2. `source9Spin_originalFockOperator_algebraMap_map_star (g,z)`: `α_g (star (algebraMap ℂ A z)) = star (α_g (algebraMap ℂ A z))`. The accepted original `AlgEquiv.commutes` fixes scalar maps; pinned `algebraMap_star_comm` preserves **complex conjugation**, not `z=z†`.
3. `source9Spin_originalFockOperator_mul_map_star (g,S,T,hS,hT)`: conditional compatibility of the product using physical adjoint order reversal, exact `α_g.map_mul` and the two independent input compatibility hypotheses. It does not assert `hS` or `hT` for arbitrary operators.

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB2aOriginalFockScalarProductPhysicalStar.lean`  
**Independent consumer:** `lean/diagnostics/BFSSP2bB2aOriginalFockScalarProductIndependentAudit.lean`  
**Strict workflow:** `.github/workflows/bfss-p2bb2a-original-fock-scalar-product-physical-star-strict.yml`  
**Exact tested candidate commit:** `de7e1a268cc875a715ad07c5c3157273934ff49f`  
**Run:** [#42757429782](https://github.com/etblink/math/actions/runs/42757429782), reported in progress with checkout and exact 47-pin preflight successful at the last read. **No qualified B2a claim until final cold source, independent consumer, warning and axiom checks pass.**

Source test closure is **47 Git blob pins**: 43 original qualified P2b-A ancestor/source/consumer files + original accepted B0 source/consumer + the two new B2a source/consumer files. The B2a gate deliberately **does not import B1**, so it can test independent scalar/product source laws, while full B2 will combine the independent B1 and B2a contracts.

**Relevant pinned Mathlib proofs, not copied or guessed:**

| File at Mathlib `d13f23b7…` | Git blob | Exact API |
| --- | --- | --- |
| `Mathlib/Analysis/InnerProductSpace/Adjoint.lean` | `2a6292b78ff0806a603bc86f966096dd67cf2dc6` | `ContinuousLinearMap.adjoint_comp` at line 138; actual continuous operator multiplication adjoint reverses order |
| `Mathlib/Algebra/Star/Module.lean` | `928ae94243f3fa75f63d60aee51c59204bfacbac` | `algebraMap_star_comm` at line 238 |
| `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` | `fbcf362039a1c89e3e3344372fc6f723435d003e` | `CliffordAlgebra.induction`, lines 199–201, exact `algebraMap`, `ι`, `mul`, `add` cases |

## II. Full P2b-B2 — integration plan AFTER B2a acceptance

Let `Cl = CliffordAlgebra (source48Quadratic.baseChange ℂ)`, `M : Cl ≃ₐ[ℂ] A` be strictly accepted M3I, and `α_g : A ≃ₐ[ℂ] A` be strictly accepted C6A.

Define `C x := α_g (star (M x)) = star (α_g (M x))`. The pinned `CliffordAlgebra.induction` requires, **in order**:

- **`algebraMap z`** — `M.commutes z` gives `M (algebraMap ℂ Cl z) = algebraMap ℂ A z`; use B2a scalar root.
- **`ι w`** — use accepted B1 `source9Spin_originalFockOperator_complexifiedGamma_map_star g w` exactly (all genuine complexified source vectors).
- **`mul x y hx hy`** — `M.map_mul` (explicit exact `AlgEquiv`) then B2a conditional product closure on `M x, M y`.
- **`add x y hx hy`** — `M.toLinearEquiv.map_add` then qualified B0 `originalFock_spinStarCompat_add`.

Conclude `∀ x : Cl, C x`, then by `M.surjective` conclude `∀ T : A, α_g (star T) = star (α_g T)` with **no** default Clifford odd-generator involution, physical model substitution, or local resource-limit inflation.

**Gate contract:** new B2 module, independent consumer, exact P2b-B1 and B2a source+consumer ancestry, original pinned source closure, strict cold compilation and allowed-axiom reports. Full B2 is **NOT QUALIFIED** merely because B2a might pass.

## III. Parallel T1: new pinned Mathlib shortcut for actual original matrix trace

This is an **API discovery, not a Lean proof**. It supersedes the earlier tentative recommendation to build either 2²⁴-index matrix units or a left-regular trace identity, *provided the exact original carrier transport elaborates*.

### Exact upstream APIs independently located in pinned Mathlib

1. **The original Fock continuous/linear algebra equivalence already exists.** In `Mathlib/Topology/Algebra/Module/FiniteDimension.lean` lines **314–320**, pinned Git blob `b145c6f6f798571ca4680cf424fa53796437524e`:
   `Module.End.toContinuousLinearMap (E : Type*) : (E →ₗ[𝕜] E) ≃ₐ[𝕜] (E →L[𝕜] E)` for finite-dimensional normed `E`.
   Apply it to **actual** `E := Fermion 2`; parent M3G independently identifies exact `LinearMap.toContinuousLinearMap` over that carrier, although its older source header does not itself certify current strict qualification. No arbitrary replacement matrix module is used.

2. **Trace invariance under ANY endomorphism algebra equivalence is already a theorem.** In `Mathlib/LinearAlgebra/Trace.lean` lines **307–311**, pinned Git blob `aead033d4d6f66f283cd51f072c24a2f5b16a97e`, the theorem
   `LinearMap.trace_map (f : (Module.End K V) ≃ₐ[K] (Module.End K W)) (x : Module.End K V)`
   proves `(f x).trace K W = x.trace K V`. It uses exact algebra-equivalence/conjugation internals; no scalar dimension multiplier or new operator-algebra Skolem–Noether proof needs to be supplied by this BFSS project.

### Candidate source-faithful construction

Let `F := Fermion 2`, `A := F →L[ℂ] F`,
`e : (F →ₗ[ℂ] F) ≃ₐ[ℂ] A := Module.End.toContinuousLinearMap F`, and
`α_g : A ≃ₐ[ℂ] A := source9Spin_originalFockOperatorAutomorphismHom g`.

Transport back to the exact original **linear** endomorphism carrier:

```lean
let β : (F →ₗ[ℂ] F) ≃ₐ[ℂ] (F →ₗ[ℂ] F) :=
  (e.trans α_g).trans e.symm
```

Define the exact original trace on **bounded** Fock operators as
`Tr_F(T) := (LinearMap.trace ℂ F) (e.symm T)`.
Then `LinearMap.trace_map β (e.symm T)` plus `e.apply_symm_apply` and `e.symm_apply_apply` should prove
`Tr_F(α_g T) = Tr_F T`.

The equivalence `e` is exact and original-Fock-carrier preserving. No need to manually enumerate `2^24` Fock basis vectors, prove left-regular `L_T` trace formula, or reverse-engineer a surrogate matrix model. **The typed `e.trans` order, the trace API on the actual `Module.End ℂ F`, and exact accepted source action must still pass a new independent strict Lean consumer.**

### Consequence and scientific boundary

If B2 and T1 later qualify, then
`Tr_F((α_g S)† (α_g T)) = Tr_F(S† T)`
follows formally, supporting a source-exact Hilbert–Schmidt isometric representation on the original operator fiber. This does **not** by itself imply continuity in `g`, genuine Fock-vector unitary implementers, source SU(2) gauge commutation, original physical Hilbert-space core invariance, closure equality, confinement, compactness, positive-energy eigenstates or a BFSS mass gap.

## IV. Method and disposition

- Keep R (representation), T1 (trace), A (adversarial spectral) and P (original operator-form/domain) distinct. No premature R→P inference.
- Preserve the hard-earned B1 lesson: a repeated large-term `star_add` failure was solved by qualified original-carrier B0 helper. B2a uses typed scalar/product operations from the beginning.
- B2a strict gate runs independently; T1 was **read-only investigation and source API verification** in this research interval. Advance full B2 or create a T1 formalization only as a separately bounded, pinned, independent-consumer gate.
