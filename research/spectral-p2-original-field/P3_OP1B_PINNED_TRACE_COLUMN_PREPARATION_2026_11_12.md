# P3-OP1B source-exact Hilbert--Schmidt column preparation

**Date:** 2026-11-12 Pacific. **Status:** READ-ONLY mathematical/API research, not a new Lean qualification.  
**Branch:** `integration/bfss-unified-research-20261108`.  
**Concurrent OP1A source-export strict run:** [#43263788066](https://github.com/etblink/math/actions/runs/43263788066) on exact `3e9a3e952f1c08253d2a1362ebef10c4d0fd26e4`; no result assumed by this document.

## New retrieval correction before designing OP1B

The complete P3-OP1A pairing identity was historically **already strict-green inside T1's independent diagnostic**, not just conventionally proved in internal-monograph Chapter 8. Original qualified file `lean/diagnostics/BFSST1OriginalFockTraceIndependentAudit.lean`, blob `e3ce4de9987a07a7405c29ece850b9b203eeade7`; theorem `FCP.BFSST1OriginalFockTraceIndependentAudit.originalFock_trace_pairing_invariant`; strict run [#42769361446](https://github.com/etblink/math/actions/runs/42769361446). A newly staged source-export module only packages that exact proven argument as an importable `OAI` declaration. It must **not** be promoted until new consumer/strict run green, and historical original T1 qualified status remains independent.

## Original-carrier mathematical contract for OP1B

Let `F := Fermion 2` be the genuine complex Hilbert space of the original 48 Majoranas, `A := F →L[ℂ] F`, and `Tr_F := BFSST1OriginalFockTraceInvariance.originalFockTrace`. Fix **any** `b : OrthonormalBasis ι ℂ F` with `[Fintype ι]`, avoiding explicit enumeration of `2^24` basis vectors.

Target the exact complex identity
```
Tr_F (star T * T) = ∑ i : ι, ⟪T (b i), T (b i)⟫_ℂ.
```
Equivalently, with explicit real coercions, `Tr_F (star T * T) = (∑ i, ‖T (b i)‖² : ℝ)` coerced to `ℂ`.

Conclude `0 ≤ (Tr_F (star T * T)).re`, and `Tr_F (star T * T) = 0 ↔ T = 0`. Establish the finite-dimensional Hilbert--Schmidt pairing
`B(S,T) = Tr_F(star S*T)`, positivity and `‖T‖_HS² = ∑ i ‖T(b i)‖²` without confusing it with the existing continuous-operator norm `‖T‖`. Combine with accepted OP1A trace-pairing invariance (or exact T1 donor if OP1A export fails) to show HS isometry of the source **algebraic** Spin9 action. No source `g` continuity follows yet.

The finite `End(F)` columnizer `Col_b(T)=(T(b i))_i` is a natural **subsequent** gate; the gauge-physical `L²` direct-sum identification and closed Hamiltonian graph/form-domain equality are further and distinct obligations. The input Fock index must remain inert under original SU2 gauge; the output index transforms by left multiplication, not conjugation.

## Exact pinned Mathlib source APIs inspected

- `Mathlib/Analysis/InnerProductSpace/Trace.lean` at the pinned Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, lines **27–34**:
  `LinearMap.trace_eq_sum_inner (T : E →ₗ[𝕜] E) (b : OrthonormalBasis ι 𝕜 E)`
  gives `T.trace 𝕜 E = ∑ i, ⟪b i,T(b i)⟫_𝕜`.
- `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`, lines **314–320**: `Module.End.toContinuousLinearMap (Fermion 2)` already is the exact finite-dimensional algebra equivalence used by accepted T1; it is not a matrix surrogate.
- `Mathlib/Analysis/InnerProductSpace/Adjoint.lean`, lines **123–128**, `ContinuousLinearMap.adjoint_inner_left/right`, and lines **143–159**, `ContinuousLinearMap.apply_norm_sq_eq_inner_adjoint_left/right`, give the typed quadratic adjoint-to-norm bridge. Use the correct complex inner-product orientation.
- `Mathlib/Analysis/InnerProductSpace/Basic.lean`, lines **202–213**, `inner_self_nonneg`, `inner_self_ofReal_re`, `inner_self_eq_norm_sq_to_K`, prove positivity/realness of each diagonal term.

These are API source inspections, not proof compilation. Confirm the actual original star-to-adjoint reduction at source type `Fermion 2 →L[ℂ] Fermion 2`, explicit transported `Module.End` multiplication, and the basis `Fintype` inference in a tiny diagnostic before writing a broad theorem. Do not assume an operator-norm identity.

## Source-reuse and negative-evidence decisions

**DIRECT REUSE:** accepted T1 `originalFockTrace` and `originalFockEndAlgEquiv`; imported B3 physical-star automorphism; old T1 strict pairing consumer; pinned four Mathlib families above.

**ADAPTER NEEDED:** a single original-source transparency conversion `originalFockEndAlgEquiv.symm (star T*T)` to the continuous composition `T† ∘L T` viewed as a linear endomorphism. This interface has not been independently tested in Lean. Keep explicit types; do not unfold original huge CAR/Fock operators.

**NOT APPLICABLE:** original `MassiveMoments` integrability, P2-C4B massive-record normalization workaround, normalized Gram/Fock auxiliary NORM, any Fock-vector implementing Spin unitary or gauge projection. None is needed for this finite-dimensional identity.

**NEGATIVE PRECEDENT:** B3 [#42762309173](https://github.com/etblink/math/actions/runs/42762309173) generic star-class synthesis timeout; re-use the original typed B2 adjoint lemma rather than relying on broad class inference. T1 [#42767247872](https://github.com/etblink/math/actions/runs/42767247872) extra tactics after a solved goal; do not append redundant proof steps.

## Bounded next gate contract and HOLD

The first substantial OP1B gate should establish only the **trace-to-orthonormal-columns identity** on the literal original carrier, with a distinct consumer and a strict cold pinned source/consumer/axiom workflow, no `sorry`, `unsafe`, new axioms, recursion-budget changes, or historical rewrites.

**Project Lead: HOLD new OP1B Lean source while OP1A importable source-export verification is in progress.** After the exact OP1A run is green, compare accepted source files, verify proof API shape with a smaller diagnostic if necessary, and only then stage a source/consumer microgate. If OP1A is red, inspect its first causal failure and repair the export only; do not conflagrate the original T1 qualification with the new source status.

**Scientific ceiling:** no `Spin(9)` continuity in `g`, SU2 left-gauge fixedness, physical high type, reducing sector, original Hamiltonian operator graph, closed form coercivity, positive eigenpair or mass gap is obtained from this note.
