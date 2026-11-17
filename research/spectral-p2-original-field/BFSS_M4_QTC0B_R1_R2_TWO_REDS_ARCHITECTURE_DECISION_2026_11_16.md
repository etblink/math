# BFSS Project Lead — QTC0B two-RED architectural reassessment

**Date:** 2026-11-16 Pacific; single unified integration branch only.
**Disposition:** STOP the current source-direct proof/rewrite strategy. Preserve exact R1/R2 history and resume only through independently verified small, typed mathematical adapters.

## Evidence, no retrospective promotion

- R1 [#44012367725](https://github.com/etblink/math/actions/runs/44012367725) RED, source `ab7b1dbf31ad92000184204f14d083400d39bc00`: Lean `rw [mul_comm]` generates a non-type-correct motive against the original `Fermion 2 →L[ℂ] Fermion 2` continuous-linear-map topology; subsequent finite-sum sum-contraction holes. Original 4,963-byte provider ZIP hash `a50bc06b6f5ac03c15be16de7b943910ca55bc3a7960f40829c1049e8402c5c1` and complete job log preserved, source `sorryAx`, no consumer proof.
- R2 [#44014529416](https://github.com/etblink/math/actions/runs/44014529416) RED, source `6836880557ec917cd14c54f4f3b011f9aa840a74`: R1's commutativity motive and multiple finite-sum errors gone; two remaining mismatched source rewrites, `Matrix.transpose_apply` at 113:28 and `add_smul` at 155:34. Original 3,984-byte provider ZIP `f7fa7726865600cab92e1270b558dcc856ad0cfc28318f2bb7d95e74b7ab8dbb` and complete job log preserved, `sorryAx`, no consumer proof.
- Both runs: original QTC0A source and preflight passed; Lean and Mathlib restored; no source statement refuted. Neither source nor consumer qualifies.
- This is a **Project Lead method stop** for two related typeclass-sensitive direct rewrites, *not* the earlier CT1G0's literal two recursion failures. The independent CT1G0 stop remains in force. **No QTC0B R3 using the same native monolithic rewrite architecture.**

## Why the mathematical goal remains well founded

QTC0A proved a conditional ordered quadratic expansion on the original Fock continuous-linear carrier. For `x_i` not assumed to commute, define `w_{ij} = x_i x_j`. The desired matrix-coefficient identity is purely a finite-sum identity in any complex module `M`:

```text
Left  = ∑ i j p, (a[p,i] * b[i,j]) • w[p,j]
      = ∑ p j, (a*b)[p,j] • w[p,j]

Right = ∑ i j p, (b[i,j] * a[p,j]) • w[i,p]
      = ∑ i p, (b*a.transpose)[i,p] • w[i,p]

Left + Right
      = ∑ i j, (a*b + b*a.transpose)[i,j] • w[i,j]
```

**Do not** assume skewness until a separate corollary. Test `a = I`, `b = E₀₀`, where `ab+baᵀ=2b` but `ab-ba=0`. The scalar `1/4` and order `x_i*x_j` must remain exact, and no additional axioms may be introduced.

## New architecture choice: QTC0C abstract finite-sum coefficients first

1. **Layer 1: small, purely abstract scalar-module lemma(s)** on an arbitrary additive commutative monoid `M` with an `ℂ`-module structure. Inputs `w:ι→ι→M`, `a,b:Matrix ι ι ℂ`. Separate 3 roots: left coefficient reindex, right coefficient reindex, combined `a*b+b*a.transpose`. No `Fermion`, `ContinuousLinearMap`, topology, or original gamma operators. Type scalar coefficients explicitly and use `congrArg (fun c:ℂ => c • w p j)` to prevent a dependent Fock-carrier rewrite motive. Validate finite-index adversarial cases first in a **cheap independent mathematical consumer**, then consider native source.
2. **Layer 2: source-exact adapter**: instantiate `w i j := x i * x j` on the original `Fermion 2 →L[ℂ] Fermion 2`, apply the existing frozen QTC0A Leibniz theorem, and use only the already-proved abstract coefficient lemma. Keep this adapter thin; no three-sum shuffling within the source carrier.
3. **Layer 3: only after native QTC0B adapts and strictly qualifies**, test original real-to-complex bridge QTC1 and separate original skew K bracket QTC2. Neither may be treated as currently qualified.
4. **Scientific route discipline:** reassess payoffs against the fixed-positive-regulator Hardy/resolvent fidelity objective; the complete `so(48)` bracket must not silently become a compulsory proxy for physical progress.

## Admission and stop rules

Proposed next gate **P3-M4-QTC0C**, `PROSPECTIVE_NOT_STAGED`, with independent source/consumer. Admission requires a separate written pre-gate contract, exact new source and consumer blob pins, pinned Lean/Mathlib, no resource escalation, `#print axioms` whitelist, negative/auditor controls and original source ZIP preservation. Do not simply rename QTC0B R3 to evade a stop: require actual generic-module isolation and a mathematical proof boundary before staging. If a future adapter fails, its failure is separately evidence-classified and cannot alter the independent abstract theorem qualification. Preserve all GREEN and RED artifacts.

QTC0A strict [#44001621836](https://github.com/etblink/math/actions/runs/44001621836) remains the last accepted mathematics. No original BFSS ground-state, spectrum, unified ontology, or physical fidelity theorem is implied.
