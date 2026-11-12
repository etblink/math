# BFSS forward research — abstract-first specialization and original-Fock column geometry

**Date:** 2026-11-12 Pacific. **Status:** READ-ONLY SOURCE/API RESEARCH; no new Lean source, consumer, or strict theorem qualification in this memorandum.  
**Branch:** `integration/bfss-unified-research-20261108`. **Concurrent OP1C0 candidate gate:** [#43282964940](https://github.com/etblink/math/actions/runs/43282964940) on candidate `199f9f252dc2ae577d32e6de46b2daab44205c1c`. The run's eventual result is not assumed here.  
**Scope:** original `Fermion 2` 48-Majorana Hilbert carrier; no change to original gauge, fermions, energy, source group, closed operator, or approved sources. Historical FCP conclusions unaffected.

## Executive finding

The current OP1C0 repair isolates a finite self-inner-product positivity fact in an abstract complex inner-product space, then instantiates only its statement to the source-original `Fermion 2`. This is the same **mathematical separation of concerns** already required by the 2026-11-09 [Interface-First Proof Protocol](../../contributions/bfss-kotler/BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md) and the 2026-11-10 [Proof-DAG-First Protocol](../../contributions/bfss-kotler/BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md), but now exercised at the **elaborator/instance boundary** on the real 24-complex-mode Fock carrier. It is not an entirely new policy and does not justify another registry, subsystem or workflow.

Three distinct high-value precedents prove the practical point:
- Historical F1F red [#42645848109](https://github.com/etblink/math/actions/runs/42645848109) encountered source-sized definition-reduction recursion; later accepted symbolic-transport/source-exact bridge [#42651438879](https://github.com/etblink/math/actions/runs/42651438879) succeeded, while deliberately *not* claiming the entire missing concrete map equality.
- NORM0B's nine-red methodological review `BFSS_NORM0B_NINTH_RED_METHOD_AUDIT_AND_TYPED_SCALAR_INTERFACE_2026_11_10.md` diagnosed a reduction/implicit-transparency problem from combining source Matrix coefficient and Fock CLM scalar-zero rewriting. It recommends a coefficient-independent, explicitly typed scalar-zero statement before injecting the actual Gram matrix entry. Do not assume this historically proposed repair itself qualified.
- P2-C4B recovered *already public* `MassiveMoments.lean` `bosonic_core_integrable` and `fermion_core_integrable` after several reds; OP1A recovered an *already green but non-importable* theorem from T1's independent consumer; the root problem there was **retrieval/interface export**, not expensive elaboration. We must distinguish retrieval failure from model-sized elaboration failure and from genuine mathematical gaps.

## 1. Exact OP1C0 diagnosis and controlled experiment

At [#43275220286](https://github.com/etblink/math/actions/runs/43275220286) the first fault was incorrectly applying `inner_self_nonneg` to a positional argument even though `x` is implicit. At [#43278998368](https://github.com/etblink/math/actions/runs/43278998368), corrected named `(x := T (b i))` exposed `maximum recursion depth has been reached` at the same source proof line; **61/61 source pins and historical compilation were green, only OP1C0 source elaboration failed**, and `sorryAx` followed error recovery. The exact internal elaborator mechanism—instance synthesis versus reduction/unification depth—was **not isolated** from the log; do not pretend it was definitively diagnosed beyond recursion.

Current *uncompiled-until-green* remedy uses
```lean
private theorem finite_inner_self_re_nonneg
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (v : ι → E) :
    0 ≤ (∑ i : ι, ⟪v i, v i⟫_ℂ).re := by
  rw [Complex.re_sum]
  exact Finset.sum_nonneg (fun i _ =>
    inner_self_nonneg (𝕜 := ℂ) (x := v i))
```
and applies it after qualified OP1B `originalFockTrace_star_mul_eq_sum_inner b T` with `fun i : ι => T (b i)`. This is a tiny generic lemma **inside the OP1C0 source**, not a newly commissioned general-purpose library. It may still fail at source specialization; the current CI result must decide.

If red again, inspect first causal line and isolate **helper elaboration versus actual Fock instantiation**. Try explicit typed intermediate `v : ι → Fermion 2` / typed instance boundary or a focused `#check @inner_self_nonneg` diagnostic on the small interface, not another stack of `simp` or resource-budget changes. Never raise `maxRecDepth`, heartbeats, relax axioms, or swap Fock carriers. If the abstract helper itself is red, hold on the abstract declaration first rather than debugging the original concrete one.

## 2. Pinned Mathlib reveals a better complete route to finite-column Hilbert geometry

Pinned toolchain: Lean **4.34.1**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**. Files below were inspected on this exact pinned revision, not inferred from contemporary default-branch search.

**Already strictly accepted source interfaces:**
- OP1A original pairing `originalFockTracePairing S T := originalFockTrace (star S * T)` and `source9Spin_originalFockTracePairing_invariant`, green [#43263788066](https://github.com/etblink/math/actions/runs/43263788066).
- OP1B `originalFockTrace_eq_sum_inner` and `originalFockTrace_star_mul_eq_sum_inner` on genuine source `Fermion 2`, green [#43271525095](https://github.com/etblink/math/actions/runs/43271525095).
- T1 `originalFockEndAlgEquiv : Module.End ℂ (Fermion 2) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)` and `originalFockTrace`. Importing these is exact, not a matrix surrogate.

**Exact pinned API candidates (verified as source declarations, NOT yet compiled in our proposed composition):**

| Pinned Mathlib file | Exact interface | Meaning for our next gates |
| --- | --- | --- |
| `Analysis/InnerProductSpace/PiL2.lean`, lines 480–499 | `OrthonormalBasis.toBasis`, `coe_toBasis`, `sum_repr` | A finite source-Fock orthonormal basis is already an algebraic basis; no explicit enumeration of `2^24` columns |
| `LinearAlgebra/Basis/Defs.lean`, lines 508–545 | `Basis.constr : (ι → M') ≃ₗ[S] (M →ₗ[R] M')`; `constr_symm_apply`, `constr_self` | **Canonical linear equivalence** between an endomorphism and its vector of values on a basis |
| `Topology/Algebra/Module/FiniteDimension.lean`, lines 302–320 | `LinearMap.toContinuousLinearMap` and `Module.End.toContinuousLinearMap` | Exact bridge from algebraic endomorphisms to actual bounded Fock operators; source T1 already uses it |
| `Analysis/InnerProductSpace/PiL2.lean`, lines 104–106 | `PiLp.inner_apply` | Inner product on finite `PiLp 2` columns is the sum of component inner products |
| `Analysis/Normed/Lp/PiLp.lean`, lines 780–784 | `PiLp.norm_eq_of_L2` | Column norm is sqrt of finite sum of squared genuine vector norms |
| `Analysis/InnerProductSpace/Basic.lean`, lines 202, 208–213, 316–317 | `inner_self_nonneg`, `inner_self_eq_norm_sq_to_K`, `inner_self_eq_zero` | Positivity and nondegeneracy may be proved **generically** before Fock specialization |
| `Basic/Complex/BigOperators.lean`, lines 27–30, 43–45 | `Complex.ofReal_sum`, `Complex.re_sum` | Explicit real/complex finite-sum conversion without unfolding original CLM |
| `Algebra/Order/BigOperators/Ring/Finset.lean` | `Finset.sum_eq_zero_iff_of_nonneg` | Generic finite-sum zero criterion under nonnegative summands |

**New concrete implementation opportunity.** For an arbitrary finite `b : OrthonormalBasis ι ℂ (Fermion 2)`, the desired linear equivalence is **mathematically canonical**:
```text
OriginalFockEndomorphisms  --(T1 originalFockEndAlgEquiv.symm)-->
Module.End ℂ (Fermion 2) --((b.toBasis.constr ℂ).symm)-->
(ι → Fermion 2).
```
The *correct orientation* is continuous operator `T` to the function `i ↦ T (b i)`; the inverse uses `Basis.constr`. This is an exact re-expression of the SAME original Fock operators, not a new representation or original Hamiltonian substitute. The two `≃ₗ` interface conversions from an `≃ₐ` may need explicit `.toLinearEquiv` fields; verify that in the tiny typed proof rather than assuming Lean's coercions.

For Hilbert–Schmidt geometry, compose the resulting finite column family with `PiLp 2` over `ι`; `PiLp.inner_apply` and `PiLp.norm_eq_of_L2` supply standard Hilbert geometry. Defining a **transported** HS structure on the actual endomorphism carrier is preferable to pretending its currently installed **operator norm** is already HS. No theorem in OP1A/B states that operator norm and HS norm coincide.

## 3. Minimal next qualified proof DAG (after OP1C0 resolves)

**D0 — Generic nonnegative sum:** active OP1C0 only, `0 ≤ Re Tr_F(T†T)`. Status CANDIDATE until independent cold-green. Keep the helper private unless a second real source user needs its export.

**D1 — Generic definite finite family:** on abstract complex inner-product `E`, `(∑ i, ‖v i‖²)=0 ↔ ∀ i, v i=0`, using `Finset.sum_eq_zero_iff_of_nonneg`, `sq_nonneg`, and `norm_eq_zero`. Distinct proof, not silently bundled into D0. A related complex-inner variant can use `inner_self_eq_norm_sq_to_K` before this real sum.

**D2 — Original source definite trace:** use accepted OP1B, D1, `b.toBasis` and `Basis.constr_self` / basis-extensionality to show `Tr_F(T†T)=0 ↔ T=0`. Here `Tr_F(T†T)` is already real-valued as a complex sum of norm squares; prove the real/imaginary identification explicitly if the theorem states complex equality. Test original operator `T` and nontrivial arbitrary `b` in a distinct consumer. Neither D1 nor D2 needs enumerating the Fock basis.

**D3 — Column linear equivalence:** independently establish the above `A ≃ₗ[ℂ] (ι → Fermion 2)` by T1 + `Basis.constr`; consumer checks both `T ↦ T (b i)` and inverse evaluation. This may be easier *before* D2 if an exact injectivity interface is needed. No new matrix algebra.

**D4 — Full off-diagonal HS pairing:** using OP1A, OP1B's ordinary trace-to-basis identity, and `ContinuousLinearMap.adjoint_inner_right`, prove
```text
originalFockTracePairing S T = ∑ i, ⟪S (b i), T (b i)⟫_ℂ.
```
This is distinct from already green diagonal OP1B. Then `PiLp.inner_apply` makes original operator columns a genuinely inner-product-preserving linear equivalence. Use a separate cold source/consumer gate. The Spin(9) *algebraic* star action is then a candidate unitary/isometry on the transported HS space through qualified OP1A, **without** constructing a source Spin Fock-vector implementer. Continuity in the source group variable is an additional obligation.

**D5 — Original physical `L²` and domains:** lift finite columns pointwise under the genuine original SU2 **left-output** action (input column label inert), prove measurability/integral norms, gauge-fixed subspace identification, and only then prove original closed quadratic-form and operator graph matches the finite direct-sum Hamiltonian. These are **new physical source obligations** and cannot be inferred from D0–D4. No positive spectrum conclusion.

**Further high-value reuse:** the 2026-11-12 gauge projector memo `P3_GAUGE_PROJECTION_SPIN_FIXED_ALGEBRAIC_SHORTCUT_2026_11_12.md` already proposes a **generic star-algebra projector fixedness** lemma conditional on `α(U_h)=U_h`, using `α.symm` rather than a Haar average. This has the SAME abstract proof / exact source interface pattern and is a plausible second consumer warranting promotion of a small reusable generic helper when its real bridge is ready. The source spin-gauge compatibility `α_g(U_h)=U_h` remains unproved.

## 4. Operational refinement — not a competing policy

The 11/08 playbook says “extract a general lemma only after a real second consumer needs it” and “no new registries”; the 11/09 IFPP and 11/10 Proof-DAG-First already mandate typed microgates. Extend their practical execution with an **elaboration boundary rule**:

1. **Retrieve before proof:** accepted theorem, named declaration, independent consumer, strict SHA, source blob, source index order; do not mistake default-branch code-search misses for absence. Classify DIRECT REUSE / EXACT ADAPTER / METHOD ONLY / NEGATIVE.
2. **Identify the first expensive type boundary:** symbolic/scalar, abstract module/Hilbert, algebraic endomorphism, original Fermion CLM, gauge physical full L², closed graph. Write a named **typed, low-carrier** lemma on the left side of the boundary.
3. **Expose just one source join:** use existing accepted theorem or a `toBasis`/`constr`/`toContinuousLinearMap` equivalence, not `change` or global simplification unfolding all 48 Majoranas. Keep actual source semantics observable in the statement and consumer.
4. **Diagnose failed compilation by phase:** notation; namespace/API/implicit arg; typeclass/reduction/recursion; consumer linter; environment/pin; or genuinely unproved math. The observed `maximum recursion depth` alone does **not** determine the precise internal failure phase. After two similar reds, change proof structure or stop; never increase recursion/heartbeat limits simply to pass.
5. **Separate proof statuses:** generic fact COMPILABLE does not qualify the original BFSS source application; source COMPILABLE does not qualify the independent consumer; CI GREEN only validates the named theorem at its exact tested SHA and axiom contract.
6. **Measure useful progress by removed edges:** newly importable source interfaces, fewer unproved source bridges, earlier first-cause identification, and fewer repeated historical errors — not by run counts, code size or an invented physical theorem.

No documentation or future source suggestion here authorizes modifying a running workflow. Only an explicit subsequent bounded gate should change new Lean/consumer/workflow files, after the currently running OP1C0 result and first causal evidence are known.

## 5. Provenance and limitations

Inspected in this research interval: pinned Mathlib paths above; original OP1C0 candidate and OP1B green ledger; OP1A / P3 original spectral and gauge-projection memos; `BFSS_LEAN_PROOF_REUSE_AND_FAILURE_PLAYBOOK_2026_11_08.md`; `BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md`; `BFSS_NORM0B_NINTH_RED_METHOD_AUDIT_AND_TYPED_SCALAR_INTERFACE_2026_11_10.md`; `BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md`; `BFSS_PRE_GATE_EVIDENCE_RECEIPT_PROTOCOL_2026_11_12.md`; `BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md`; selected P2-C4B red/source reuse notes.

This was **not** a full scan of all branches in etblink/math, all FCP historical references, or the entire openai/math inventory, and no local Lean experiment or novel source cold compilation was performed. All new linear-equivalence and HS-geometry compositions are **pinned-API-backed plans**, not established Lean declarations. Preserve original `Fermion 2`, `Spin(9)` central sign, source SU2 left-output gauge law, massless Hamiltonian normalization, and closed-domain exactness in subsequent proof contracts.
