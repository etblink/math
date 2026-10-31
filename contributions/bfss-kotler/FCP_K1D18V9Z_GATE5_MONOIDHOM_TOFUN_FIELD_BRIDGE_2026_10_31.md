# K1D18V9Z — Gate 5 red: explicit MonoidHom function-field equality

Date: 2026-10-31 UTC.
Research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
Fifth gate SHA `907c651f4e2b475b53c7b9e6eb091087d35410d0`.
Original V9Z source blob `a11496033c4df3a6e3b69aa1c164504d6c85b264`.
Original V9Z workflow blob `4718f39aaa51b3ad11d513a80d24ad8b2c2419f3`.
Failed strict run [#41243461699](https://github.com/etblink/math/actions/runs/41243461699), job `124661942582`; conclusion **RED**; artifact `13058433195` digest `sha256:e0c5fa35b1a3665ccd924da22b170988c7af7c09b3a7658c80d4e75fd106b2a0`.

## Exact observed failure

Strict source and ancestry hash checks, pinned Lean `leanprover/lean4:v4.34.1` and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, and accepted V9Y ancestry compilation all passed. Fresh V9Z source compilation with `-DwarningAsError=true` failed at three identical proof points, lines 40, 63, 88. The previous `Continuous.congr` experiment successfully normalized source time-tag composition and inverse conversion to pointwise `f u`; the remaining equality is

```lean
f u = f.toFun u
```

where `f` is one of three accepted V9X `MonoidHom` values. The attempted `simp only [ofAdd_toAdd]` left this homomorphic field-coercion equality unsolved, reporting `Tactic 'assumption' failed`; all six resulting failed V9Z declarations printed `sorryAx`, and the independent audit was skipped.

Pinned Mathlib `Mathlib/Algebra/Group/Hom/Defs.lean`, around line 567, provides the exact theorem
`MonoidHom.toFun_eq_coe (f : M →* N) : f.toFun = f := rfl`, which expresses the field bridge missing from the source proof.

## Distinct V9Z negative findings (chronological)

- First RED [#41239583476](https://github.com/etblink/math/actions/runs/41239583476): `continuous_toAdd` is root-level, not `Multiplicative.continuous_toAdd`.
- Second RED [#41240548627](https://github.com/etblink/math/actions/runs/41240548627): `ofAdd_toAdd` is root-level, not `Multiplicative.ofAdd_toAdd`.
- Third RED [#41241412956](https://github.com/etblink/math/actions/runs/41241412956): `Function.comp_apply` cannot simplify an unapplied function composition directly under `Continuous`.
- Fourth RED [#41242415143](https://github.com/etblink/math/actions/runs/41242415143): exposing pointwise lambda and simplifying time-tag inverse still left `Continuous (fun u => f u)` vs `Continuous f.toFun`.
- Fifth RED [#41243461699](https://github.com/etblink/math/actions/runs/41243461699): `Continuous.congr` resolves function-shape difference but the last pointwise equality `f u = f.toFun u` requires a separate MonoidHom field bridge.

## Next bounded correction (not yet accepted)

In each of three `Continuous.congr` applications, replace
```lean
exact h.congr (fun u => by simpa only [ofAdd_toAdd])
```
with
```lean
exact h.congr (fun u => by simpa only [ofAdd_toAdd, MonoidHom.toFun_eq_coe])
```
This directly invokes the pinned source lemma at exactly the remaining equality. No theorem statements, original 48-label paired-Fock carrier, accepted V9X or V9Y source, strict dependency versions, resource limits, mathematical assumptions, six declaration axiom standards, or standalone audit checks change. Only re-pin the exact V9Z source blob in the workflow.

This is a **hypothesis**, not qualification. Only a new fresh `-DwarningAsError=true` Lean compilation and the full independent six-declaration `#print axioms` pass with allowed `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`, can qualify V9Z.

Even success yields only fixed-generator `ContinuousMonoidHom (Multiplicative ℝ) (Matrix.orthogonalGroup Source48Label ℝ)` plus source-exact matrix evaluation. No determinant-one orientation, global `Spin(9)→SO(48)`, exact `Spin(48)` lift, covering or BFSS physics proof. Preserve all negative records. Do not modify main, FCP provenance, or mathcommunity upstream.
