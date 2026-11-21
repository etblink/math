# D1F R3 — strict RED, exact causal diagnostics, and staged recovery decision

**Date:** 2026-11-21. **Research branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Tested source SHA:** `6d2a9978005cac7f5cddf0bc5c5ed1fb9619a37c`.  
**Run:** [#44937500313](https://github.com/etblink/math/actions/runs/44937500313), **completed FAILURE** (one native source RED, consumer not reached).  
**Archived artifact:** [#14720865473](https://github.com/etblink/math/actions/runs/44937500313/artifacts/14720865473), GitHub Actions SHA-256 `b7501b9f9cc2d7c77be4cbb7f6b0c2ddd9662acb9c1dbc09c585ea90f8924815`.  
**Status:** `STOP — NO R4 LAUNCHED`. The donor-based mathematical architecture is not refuted, but its Lean implementation is **not qualified**. Do not merge or import the failed proof module into accepted original source.

## Strict qualification matrix

| Check | Result |
| --- | --- |
| Exact original source pins / preflight | PASS |
| Lean 4.34.1 / pinned Mathlib restoration | PASS |
| 8,951 original dependencies including upstream `FermionQuantization` | PASS |
| New R3 `D1FOriginalMasslessYukawaFockQuantization` native source | **RED** |
| Independent paired SU(2) original Fock consumer | NOT REACHED |
| New D1F axiom-safe public theorems | **NOT QUALIFIED** |
| R3 red logs/artifacts | PRESERVED |

The source theorem `masslessFrequency_eq_source_difference` still prints only standard allowed axioms `[propext, Classical.choice, Quot.sound]`. Both public Fock conclusions `quantize_masslessFrequency` and `deformedFermionField_massless_quantized` print `sorryAx` due to incomplete elaboration. An in-source `#print axioms` line mentioning `sorryAx` is not a successful proof.

## First causal compiler error: helper quantizeFrequency_sub

The earliest failure occurs at source **line 38:2** in the private helper `quantizeFrequency_sub`:
`ring failed, ring expressions not equal; ⊢ Complex.I * (1 / 2) = 0`.

Lean also flags three unused simplification arguments `sub_smul`, `Finset.sum_sub_distrib` and `smul_sub` at source line 37. The final `module` tactic does **not** discharge the missing distribution/normalization; this is the same algebraic proof-process failure signature seen in R1, despite using the massive-quantized donor for the physics. A complex scalar factor `i/2` is being stranded in the normalized goal, **not** shown to vanish in mathematics.

**Interpretation:** the subtraction identity is algebraically valid as the original `quantizeFrequency` is linear in its real frequency-matrix argument, but the attempted Lean proof is invalid. The earlier source donor `deformedFermionField_quantized` remains compiled and unchanged. Do not call this a physical zero-mode or supersymmetry obstruction.

## Independent second failure: masslessField_zero

Source **line 42:52** leaves a nontrivial syntactic zero-normalization goal of the form:
\[
(-i/2)\cdot \operatorname{restrictScalars}
 \left(\sum\cdots ((\operatorname{colorDim}N)\cdot 0)\cdot\text{CAR operators}\right)=0.
\]
The submitted `simp [AlgebraData.cubicFermionComponent]` did not normalize all finite sums, complex casts and real-scalar restriction. This needs a **separate minimal proof**. The identity is structurally plausible because the source fermion bracket term is linear in `X`, but it has **not** been Lean-qualified.

## Namespace error: cascading false field projections

The remaining reported errors at lines **62, 79, 86, 89, and 97** include:
- `Invalid field M.masslessField_zero`
- `Invalid field M.masslessField_as_difference`
- `Invalid field M.quantizeFrequency_sub`
- `Invalid field M.masslessFrequency_eq_source_difference`
- `Invalid field M.deformedFermionField_massless_quantized`.

Root cause: the new theorems are declared in namespace `FCP.BFSSHopfD1F` with `(M : AlgebraData N)` as an **explicit argument**, *not* in `OAI.BFSSQuantum.AlgebraData` as receiver methods. Lean's field-notation lookup on `M` thus searches the wrong namespace. Refer to these as `masslessField_zero M`, `masslessField_as_difference M x`, `quantizeFrequency_sub M K L`, `masslessFrequency_eq_source_difference M x`, and `deformedFermionField_massless_quantized M x` instead, or explicitly qualify with `FCP.BFSSHopfD1F`. Keep genuine upstream `M.deformedFermionField_*` method notation unchanged. These errors are **code interface mistakes**, not separate mathematical failures; downstream unsolved goals may disappear once the earlier lemmas compile.

## New staged stop/recovery architecture — no immediate R4

R1 and R2 failed using direct Majorana-sum normalization. R3 attempted a substantively different proof via accepted upstream massive-plus-interaction quantization evaluated at `X` and `0`, but submitted **four new helper lemmas and two dependent theorems in one native source**, so an early error obscured later proof fidelity.

**Do not launch another integrated full cold build as a speculative one-line repair.** The next justified development should consist of isolated, source-exact microtests, in this order:

1. **Namespace/typing first:** change only local new-helper invocations to ordinary namespace-qualified applications; this is mechanical and does not require changing original source, physics or theorem statements.
2. **Quantization linearity:** prove `quantizeFrequency(K−L)=quantizeFrequency K−quantizeFrequency L` as a separate lemma using the original `FrequencyMatrix N`, the actual `ContinuousLinearMap` target, and typed linear operations. Avoid `module` until sums and outer `(i/2)•` have been explicitly normalized. A recommended mathematical route is to prove additivity `quantizeFrequency(K+L)=...` using `Finset.sum_add_distrib` and `Complex.ofReal_add`, then deduce subtraction by additivity and additive inverses, or establish direct `sum_sub_distrib` and `smul_sub` at each finite-sum level.
3. **Zero at origin:** isolate `cubicFermionComponent 0 A j = 0` via coefficient `x(j,C)=0` before applying `deformedFermionField_bracket 0`. Treat real/complex casts separately and explicitly use finite-sum `sum_zero`; do not assume a single broad `simp` proves the whole operator.
4. **Mass constancy:** reuse the source `deformedFermionField_mass X` and `deformedFermionField_mass 0`. This helper is an immediate equality rewrite, but still requires a native test.
5. **Actual donor join:** only after helpers 1–4 are each elaborated, combine `M.deformedFermionField_quantized X` and `M.deformedFermionField_quantized 0` and discharge scalar restriction additivity. Independent consumer must specialize to literal `pairedAlgebraData : AlgebraData 2` and print the full permitted axioms for all three public results.

CI retains the exact source pins and must **fail closed** for any source error, unresolved goals, `sorryAx`, failed independent consumer, or nonstandard axioms. If cost reduction is sought, split gates into small source/consumer builds rather than rerunning the massive all-in-one sequence after a guess.

## Scientific status

- **Unchanged accepted results:** the original massless smooth-core energy identity and source-normalized physical Hamiltonian `H=(1/16)T†T` remain separately qualified at their historical immutable receipts.
- **New D1F bridge:** **UNQUALIFIED** after R1, R2, R3. Failure is Lean proof engineering; neither a proof nor a disproof of new physical Hopf sectors.
- **No manufactured physics:** no claim for Hopf soliton, mass gap, topological charge, 4D chirality or GUT; Hobart–Derrick is a separate conditional stability test for any future derived spatial field.
- **Governance:** D1F attempted source left as historical RED; no original BFSS/accepted Lean module, live RHOPF branch, `main`, or source pin changed. Research evidence appended, never overwritten.
