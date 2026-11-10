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


## V. Exact P2b-B2a GREEN qualification and first global B2 strict candidate (2026-11-09 PT)

### Accepted P2b-B2a result

- Strict [run #42757429782](https://github.com/etblink/math/actions/runs/42757429782), job `129634944486`, completed **SUCCESS** on exact tested commit `de7e1a268cc875a715ad07c5c3157273934ff49f` (attempt 1). GitHub retained [artifact #13736084539](https://github.com/etblink/math/actions/runs/42757429782/artifacts/13736084539), reported SHA-256 `31c5eeb67d7d456b87bcf6cb18f00d4c1df736041158806d4aa772d4782270b2`.
- The preflight **47/47 source Git blob pins**, exact Lean 4.34.1 / pinned Mathlib, cold source build, typed independent consumer and all three separate `#print axioms` checks passed. Both source and independent consumer found **only `propext`, `Classical.choice`, `Quot.sound`**. Final strict acceptance text: `P2BB2A_ORIGINAL_FOCK_SCALAR_PRODUCT_INDEPENDENT_STRICT_PASS`.
- Qualified **only** the exact original `Fermion 2 →L[ℂ] Fermion 2` B2a theorem roots `originalFock_physicalStar_mul`, `source9Spin_originalFockOperator_algebraMap_map_star`, and `source9Spin_originalFockOperator_mul_map_star`. They encode reversed Hilbert-adjoint multiplication, scalar star compatibility, and *conditional* multiplicative transport, respectively. This **supersedes the earlier B2a PENDING status** while preserving its exact provenance.
- The strictly qualified B0 addition gate [#42752159572](https://github.com/etblink/math/actions/runs/42752159572), B1 generator gate [#42754462733](https://github.com/etblink/math/actions/runs/42754462733), and B2a scalar/product gate now cover every constructor required by pinned `CliffordAlgebra.induction`. The final global theorem nevertheless requires its **own cold verification**; never promote it from independent parent successes.

### Full global original Fock-star B2 candidate

- [Source commit `3abfed9d`](https://github.com/etblink/math/commit/3abfed9d50c2db373d2d5182e32ccb962c227d77): `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB2OriginalFockGlobalPhysicalStar.lean`, source blob `4e612210d9ca04f5877a87de54bc6bf1a350e602`.
- [Independent consumer `f9cc90ed`](https://github.com/etblink/math/commit/f9cc90edd095601b1674f40a82839fb0a7d6005f): `lean/diagnostics/BFSSP2bB2OriginalFockGlobalPhysicalStarIndependentAudit.lean`, blob `84a9fe1213105893043d378de43759898bb97e93`; the consumer includes an additional source-faithful consequence that the original Spin(9) action carries physically self-adjoint original Fock operators to physically self-adjoint ones.
- [Strict workflow commit `89aea96a`](https://github.com/etblink/math/commit/89aea96a47e29757a530386c500f2c88735e3aab): `.github/workflows/bfss-p2bb2-original-fock-global-physical-star-strict.yml`. It freezes **51 exact original source/consumer Git blobs** (49 union of accepted B1 and B2a parent closures, plus B2 source+independent consumer), pinned Lean/Mathlib, explicit parent root-name checks, original four-case Clifford induction, and a separate source/consumer no-`sorryAx` and allowed-axiom audit. All accepted old blobs remain unchanged.
- **New run:** [#42759235198](https://github.com/etblink/math/actions/runs/42759235198) at exact candidate commit `89aea96a47e29757a530386c500f2c88735e3aab` was **IN PROGRESS** when triggered. No global physical-star theorem is currently accepted.
- **The two B2 candidate roots:** `source9Spin_originalFockOperator_clifford_map_star` for every exact original complex Clifford element, and `source9Spin_originalFockOperator_global_map_star` for every actual original continuous Fock operator by M3I surjectivity. The second statement is the complete algebraic physical-adjoint intertwining `α_g(T†)=(α_g T)†`, but must **not** be called a unitary original Fock-vector implementation, continuous Spin(9) action, gauge-invariant column action, original closed Hamiltonian covariance, or spectral result.
- **First-red protocol:** inspect only the first causal failure from the new strict B2 run. For a localized elaboration failure, prefer a small qualified typed helper to speculative heartbeats/recursion changes; record exact source hashes, forbidden axioms, diagnostics and failed variants. Do not alter accepted B0/B1/B2a source or their pins.

### Parallel T1 status

The source API discovery in section III remains valid and **read-only**: `Module.End.toContinuousLinearMap` and `LinearMap.trace_map` are both verified at the exact pinned Mathlib commit; a specialization to the actual original `Fermion 2` and source `α_g` is a separate future strict theorem. No trace qualification or Hilbert–Schmidt-unitary theorem is being asserted.


### P2b-B2 first strict RED — consumer preflight name, not Lean (2026-11-09 PT)

- [Run #42759235198](https://github.com/etblink/math/actions/runs/42759235198), exact tested commit `89aea96a47e29757a530386c500f2c88735e3aab`, job `129640755973`, completed **FAILURE in the source/consumer manifest preflight**, before Lean/Mathlib restore, cold compilation, or axiom checks. Retained [artifact #13736443953](https://github.com/etblink/math/actions/runs/42759235198/artifacts/13736443953), ZIP SHA-256 reported `39e72724455e576b82720106f674e704160fba520c056fdbad0c92464f01b64e`.
- **First causal error:** `AssertionError` at line 19 of the embedded Python preflight. Git checkout, Lean/Mathlib **version declarations**, all **51 frozen Git blob hash** checks, and the B2 source import/root-name check had already succeeded. The manifest incorrectly expected the third consumer `#print axioms` *source token* to be its full namespace-qualified declaration, but the actual independent audit intentionally used `#print axioms originalFock_selfAdjoint_preserved` within its own namespace. The runtime Lean `#print axioms` output still uses the **fully-qualified resolved** theorem name, so that separate audit expectation was already correct.
- **Bounded manifest-only correction:** [commit `f21db5d7`](https://github.com/etblink/math/commit/f21db5d7fdf36b8ee07c230787af8691859956a9) updates **only** the preflight expected third `#print axioms` source token to its actual short spelling; it does **not** change source, independent consumer, any of the 51 exact pins, toolchain, allowed axiom set, or strict auditor's fully qualified declaration-name expectations.
- **Retry:** [run #42759465245](https://github.com/etblink/math/actions/runs/42759465245) is triggered on exact tested commit `f21db5d7fdf36b8ee07c230787af8691859956a9`; initially observed **IN PROGRESS**. This candidate is **NOT mathematically qualified** before a successful cold build, independent consumer and strict axiom audit.
- **Negative-knowledge lesson:** keep *source-text declaration token matching* distinct from *Lean's resolved fully-qualified `#print axioms` report matching*. Preflight should detect source drift without rejecting a valid local-name reference that Lean itself can resolve. A manifest-only failure supplies no evidence for or against the mathematical proof.
