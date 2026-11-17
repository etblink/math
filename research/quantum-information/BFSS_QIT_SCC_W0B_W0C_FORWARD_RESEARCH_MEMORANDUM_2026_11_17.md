# BFSS × QIT × SCC — W0B/W0C forward-research memorandum

Date: 2026-11-17 Pacific. **FORWARD RESEARCH ONLY — NOT A QUALIFIED THEOREM OR ACTIVE GATE.**

This is an evidence-preserving study while W0A4 R1 strict [#44055363556](https://github.com/etblink/math/actions/runs/44055363556) is executing at tested commit `14b96aca0d455098fcd54486840f3b905eda2dd7`. At the research checkpoint, exact preflight and pinned toolchain restoration passed; cold original source/consumer still in progress. The most recent *accepted* gate is W0A3 R1 [#44051746176](https://github.com/etblink/math/actions/runs/44051746176). **Do not elevate W0A4 or any statement below without its own strict proof and archived provider-original evidence.** This memo changes no W0A4 source or workflow and never touches `main`.

## 1. Original carrier, accepted donors, and the exact mathematical question

Use only the original source `Source48Label = Fin 24 × Fin 2`, `Source48Vector = Source48Label → ℝ`, actual complex Fock carrier `V = Fermion 2`, operator algebra `Op = V →L[ℂ] V`, and original complex Clifford algebra `A = CliffordAlgebra (source48Quadratic.baseChange ℂ)`. Denote the 48 normalized source gamma operators by `Γ p = sourceNormalizedGamma p`. A complete *algebraic structural signature* would be

```text
W(T) := (originalFockTrace T,
         fun p : Source48Label => T * sourceNormalizedGamma p
                    - sourceNormalizedGamma p * T)
```

and we seek `Function.Injective W` on **all actual original Fock operators**. This is *not* operational QIT state tomography without additional measurement-accessibility, gauge, and parity checks.

Accepted original donors and trace infrastructure:
- W0A0 R2: all literal source-axis complex Clifford/Fock equivalence images equal the exact normalized Majoranas, green [#44039594189](https://github.com/etblink/math/actions/runs/44039594189). Its R1 dependent `Pi.single` RED [#44033364617](https://github.com/etblink/math/actions/runs/44033364617) remains a necessary recorded negative control.
- W0A1 R1: donor and active source gamma real-linear maps on **every** original `Source48Vector` agree, green [#44043503665](https://github.com/etblink/math/actions/runs/44043503665).
- W0A2 R1: original Clifford equivalence maps `ι(1 ⊗ₜ[ℝ] v)` to active real `sourceGammaRealLinear v`, green [#44048184200](https://github.com/etblink/math/actions/runs/44048184200).
- W0A3 R1: pure complex tensors `Φ(ι(z ⊗ₜ[ℝ] v)) = z • sourceGammaRealLinear v`, green [#44051746176](https://github.com/etblink/math/actions/runs/44051746176).
- M3I original algebra equivalence `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv : A ≃ₐ[ℂ] Op`; source Git blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`.
- M3B actual original Clifford module `FCP.BFSSS1V52M3B.originalComplexCliffordFockModule`, scalar tower and simple-module bridge; blob `e7de3612d83889d8e08318307b37b15ac6567202`.
- M3C actual Schur theorem `originalComplexCliffordFock_scalarCommutant : Function.Bijective (algebraMap ℂ (Module.End A V))`, source Git blob `6fefd9ae344df0b7247feb34c9bec5ea0a27aea0`.
- T1 original trace `originalFockTrace : Op →ₗ[ℂ] ℂ` via the genuine `Module.End ℂ V ≃ₐ[ℂ] Op`; blob `3be6c9a6f2898484df66690f94fdfa1877660897`.
- The original Majorana normalization module has `sourceNormalizedGamma_sq_one` and `sourceNormalizedGamma_pairwise_CAR`, blob `7abc03723b3111e4a03389b722054e50d6a9bf30`; self-adjointness is present in `SU2BFSSSource48FockGammaSelfAdjointProbe.lean`, blob `98889cb8607ccc64091165fbca585acb898b9ddc`. Before invoking this self-adjoint theorem in a strict QIT gate, audit its own qualified provenance.

## 2. W0B0 — linear centralizer transport, smallest candidate

**Input, not a new hypothesis:** `h : ∀ p : Source48Label, Commute T (Γ p)` for `T : Op`.

First prove on every original REAL vector `v`:

```text
Commute T (sourceGammaRealLinear v)
```

The actual `sourceGammaRealLinear v` is a *finite sum* `∑ p, (v p) • Γ p`. Pinned Mathlib has exactly:
- `Commute.smul_right` in `Mathlib/Algebra/Group/Action/Defs.lean`,
- `Commute.sum_right` in `Mathlib/Algebra/BigOperators/Ring/Finset.lean`.

Their signatures were confirmed against pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` (Lean 4.34.1). Proposed proof is `Commute.sum_right` over `Finset.univ`, each term obtained using `(h p).smul_right (v p)`. Check the scalar tower inferred on the actual continuous-linear Fock operator algebra before specialization; if typeclass inference fails, isolate a generic `ℂ`-algebra lemma.

**Only after W0A4 qualifies:** extend to `Commute T (activeGammaComplexLinear w)` for any `w : ℂ ⊗[ℝ] Source48Vector` by `TensorProduct.inductionOn`. Pure tensor case uses W0A4's `activeGammaComplexLinear_tmul` + `Commute.smul_right` for `z : ℂ`; addition case follows `Commute.add_right`. Use W0A4 `originalComplexEquiv_allComplexGenerators_eq_activeGamma` to identify the commutation target with `Φ(ι w)`.

**Strict scope**: at most two source roots (real finite-sum, arbitrary complex tensor), one separately importing consumer, no `K(A)` and no Fock basis expansion. Do not stage until W0A4 original source/consumer, approved-axiom reports, provider ZIP and canonical acceptance are qualified.

## 3. W0B1 — from generators to full original Clifford algebra

The pinned Mathlib `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` supplies:

```lean
CliffordAlgebra.induction
  (algebraMap : ∀ r, C (algebraMap ℂ A r))
  (ι : ∀ w, C (CliffordAlgebra.ι Q w))
  (mul : ∀ a b, C a → C b → C (a * b))
  (add : ∀ a b, C a → C b → C (a + b))
  (a : A) : C a
```

and `CliffordAlgebra.adjoin_range_ι` saying the full Clifford algebra is algebra-generated by its `ι` images.

Instantiate `C a := Commute T (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a)`.

Base scalar case: `T` commutes with `z • 1` by complex linearity; `ι w` case is qualified W0B0; closure under sums/products by `AlgEquiv.map_add`, `AlgEquiv.map_mul`, and `Commute`'s corresponding algebra lemmas. **Do not** enumerate Clifford words. The conclusion is `∀ a : A, Commute T (Φ a)`, hence by M3I surjectivity, `T` commutes with all continuous-linear original Fock operators.

There is an alternate abstract subalgebra closure route through `CliffordAlgebra.adjoin_range_ι`, but `CliffordAlgebra.induction` is the smaller and more explicit first attempt.

## 4. W0B2 — source-exact A-linear adapter, then existing Schur theorem

This is the **highest type-level risk**. M3C concerns `Module.End A V`, whereas the witness operator `T : V →L[ℂ] V` is only supplied as a complex continuous-linear operator.

Given W0B1's proof `∀ a, Commute T (Φ a)`, define an **actual original Clifford-module endomorphism** whose underlying function is `T`. Under the exact M3B local instances

```text
Module A V := originalComplexCliffordFockModule
IsScalarTower ℂ A V := originalComplexCliffordFockModule_scalarTower
IsSimpleModule A V := originalComplexCliffordFockModule_simple
```

the A-linearity goal is

```text
T (a • v) = a • T v.
```

M3B `originalComplexCliffordFockModule_smul` identifies `a • v` definitionally with `originalComplexCliffordFockAlgHom a v`, while M3I `originalComplexCliffordFockAlgEquiv_apply` identifies that operator with `Φ a`. Evaluate the W0B1 commuting-operator equality at `v` and supply the result to a `Module.End A V` constructor.

Then apply the **already existing** M3C `originalComplexCliffordFock_scalarCommutant` bijection to obtain a unique `z : ℂ` with `T = z • 1` as an operator on original `V`. The second bridge is equality of underlying `A`-linear and continuous `ℂ`-linear maps; prove it explicitly by extensionality, not by type-casting or an undocumented coercion.

**Architecture rule:** first qualify a generic, small module-end linearity lemma separately; only then specialize to original `Fermion 2`. No new Schur axioms, no surrogate representation and no elaboration-budget increases. If the first two source-specific attempts fail analogously, preserve both RED artifacts and redesign.

## 5. W0C — eliminate the central scalar by original trace

Define the algebraic witness signature on the actual `Op` using `originalFockTrace` and the 48 commutators. If two operators have identical signatures, their difference `D` has zero trace and commutes with every `Γ p`. Qualified W0B2 should yield `D = z • 1`.

The original T1 trace is already complex-linear, and pinned Mathlib `LinearMap.trace_one` yields

```text
originalFockTrace 1 = (finrank ℂ (Fermion 2) : ℂ).
```

We only need `finrank ℂ (Fermion 2) ≠ 0`, **not** an explicit `2^24` expansion. A genuine original Fock vacuum nonzero proof exists in `OP2cNonzeroOriginalGaugeVacuum.lean` (blob `a16d3573b737bb4453e42b0b543d63cbbac1cd1b`); qualification and import-weight should be checked before source-exact use. Its proof uses `fockAlgebraToBFSS` injectivity and `1 ≠ 0`, so a lightweight nonzero Fock witness may be preferable.

From `0 = originalFockTrace D = z • originalFockTrace 1` and characteristic zero, conclude `z = 0`; hence `D = 0` and the witness signature is injective. This is algebraic *operator* distinguishability. It does not automatically give physical observability on the SU(2)-invariant, parity-superselected sector.

## 6. Separate QIT/SCC research — conditional expectation and quantitative stability

For each **self-adjoint involutive** original normalized `Γ p`, consider the linear channel

```text
Ad_p(T) := Γ p * T * Γ p
P_p(T) := (T + Ad_p(T)) / 2
```

Each `P_p` is an idempotent Hilbert–Schmidt orthogonal projection onto the commutant of `Γ p`. By original CAR, conjugations `Ad_p` and `Ad_q` commute even when `Γ p` and `Γ q` anticommute (the central minus sign cancels). Hence all `P_p` commute and their product projects onto the *common* gamma commutant. **Conditionally on W0B2**, that common commutant is scalar, so trace preservation gives

```text
(∏ p, P_p)(T) = (originalFockTrace T / originalFockTrace 1) • 1.
```

This yields a candidate **ordinary-commutator** Poincaré inequality on original Fock Hilbert–Schmidt space:

```text
||T - (Tr(T)/Tr(1)) * 1||²_HS
    ≤ (1/4) * ∑ p, ||T Γ p - Γ p T||²_HS
```

Proof idea: `||[Γ p,T]||²_HS = 4 ||(I-P_p) T||²_HS`; commuting orthogonal projections imply `I-∏ P_p ≤ ∑ (I-P_p)`. The factor `1/4` is sharp for an even set of 48 Majoranas. This is an **operator-space** gap, not a BFSS Hamiltonian spectral gap; the standard graded Clifford–Mehler/fermionic number-operator form is a different operator and must not be substituted silently.

**Adversarial 47-witness control.** Remove any chosen label `q`. The ordered product `U_q` of the remaining 47 Majoranas is invertible and commutes with each retained generator, because it crosses 46 others. It anticommutes with the omitted `Γ q`, hence `Tr(U_q) = Tr(Γ q U_q Γ q) = -Tr(U_q)` and the characteristic-zero trace is zero. Thus the other 47 ordinary commutators plus trace miss a nonzero operator. This is **minimality only within the original subset-of-48 commutator witness family**, not among arbitrary tomography protocols or physically accessible observables. Prove as an abstract finite Clifford control before specializing the original indexed family.

External mathematical context (not imported as results):
- Noncommutative quantum functional inequalities and conditional expectations: https://pmc.ncbi.nlm.nih.gov/articles/PMC7672011/
- Clifford–Mehler semigroup with a *graded* Clifford derivation (different from ordinary gamma commutators): https://www.kurims.kyoto-u.ac.jp/EMIS/journals/DMJDMV/vol-13/16.pdf
- Majorana fermion stabilizer/Clifford group and parity restrictions: https://www.osti.gov/servlets/purl/3000345

## 7. Decisions, exact stop conditions, and evidence policy

1. **Do not alter or branch from active W0A4 while its tested strict gate is in progress.** Only this read-only mathematical investigation and documentation are permitted in the meantime. After W0A4 R1 becomes qualified with original provider bytes, plan W0B0 as the sole active next source gate.
2. W0B0 first: original real finite-sum commute + complex tensor commute, no Schur yet. W0B1 next: `CliffordAlgebra.induction`, no huge Clifford basis. W0B2 then: exact M3B/M3C A-linear adapter, highest risk. W0C last: trace/finrank scalar elimination.
3. Every gate: precommitted exact theorem contract; a cold original source proof; independently importing frozen consumer; pinned Lean 4.34.1/Mathlib; original source, donor and workflow Git blobs; exact source/consumer `#print axioms` with approved `propext`, `Classical.choice`, `Quot.sound` only; six negative auditor mutations; provider-original ZIP integrity and SHA-256; full job-log and GREEN/RED receipts committed into Git. Never infer qualification from a generic lemma compiling or a workflow's partial progress.
4. Stop after two analogous REDs and preserve their complete original traces. Do not bypass difficult native joins by admitting axioms, surrogate modules, faster heartbeat settings or unfounded physical assumptions.
5. **Operational caveat:** original Majorana generators are not automatically parity-preserving or SU(2)-gauge-invariant observables; algebraic witness completeness on `Op` is not sufficient for an operational QIT measurement scheme, a gauge-singlet reconstruction theorem, structural counterfactual capacity quantification, or physical BFSS ground-state existence.

## Outcome

The best first implementation after qualified W0A4 is a **small, source-exact W0B0 commutant linearity bridge**, with a generic lemma isolated first if needed. No novel Clifford generation theorem is required: pinned Mathlib already supplies `CliffordAlgebra.induction` and `adjoin_range_ι`. M3C supplies the strong Schur result; W0B2's adapter is the real unresolved type-level obstruction. Preserve the QIT twirl and adversarial 47-witness argument as independently testable later hypotheses.
