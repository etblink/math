# IBI-G0B1 native determinant one R2 — preregister finite sum/order and typed-index repair

Date 2026-11-15 Pacific.
Status: PROSPECTIVE / UNQUALIFIED pending a new strict CI run.
Baseline R1 [#43730126071](https://github.com/etblink/math/actions/runs/43730126071)
was RED at source, with exact failures documented in the paired R1 receipt.

## Exactly scoped repair to the existing original-source theorem module

The original `originalColumnTriple_eq_sourceInner` statement is
unchanged. Its `simp [originalColumnTriple, sourceCross, matrixColorColumn,
PiLp.inner_apply, RCLike.inner_apply]` leaves two finite sums with
their scalar factors reversed. Follow this exact reduction with
`apply Finset.sum_congr rfl; intro A _; ring`,
so the remaining proof is explicit commutative-ring arithmetic per
color index. No new axiom, theorem premise or source model is introduced.

At the *six* untyped uses of
`FCP.BFSSSU2GaugeG3A.colorUnit 0/1/2` in the final theorem's
intermediate right-hand sides and final `rw` arguments, use
`colorUnit (0 : Fin 3)` / `(1 : Fin 3)` / `(2 : Fin 3)`.
`ColorIndex 2` is definitionally `Fin (2^2-1)=Fin 3`.
This is the same canonical bridge that qualified G1B R4; it is
NOT a rewritten signed basis, surrogate SO(3), or assumption of det+1.

Exact target source declarations, `#print axioms` roots, formal
conclusion `(G3A.adjointColorMatrix g).det=1`, G1B/FIN-DET3/source-columns
donor bytes and **all three independent consumer examples are otherwise
identical** to R1.
Original tested source blob `ce78c70b1e70375c87aa3474187f41edf7cafbd9`,
independent consumer blob `6e08594769f078946f2793c8df7e55322abc881d`
is preserved. Workflow update changes **only the exact source blob
preflight pin** atomically with this preregistration and R1 RED receipt.

## Qualification and falsifiers

R2 requires successful exact-source pins, pinned Lean 4.34.1/Mathlib,
fresh cold native source, warning-as-error original source and
independently compiled original SU2 consumer, all seven named source
`#print axioms` reports standard-only
(`propext`, `Classical.choice`, `Quot.sound`),
zero `sorryAx`, final strict-green marker, preserved full logs and artifact.
Do not infer success without run evidence. If a sign problem appears,
record it; do not hide it with absolute determinant.
Stop after two analogous first-causal REDs to inspect architecture
rather than endless tactic changes.

Even exact native det+1 does not prove the source adjoint image is all
SO(3): G0C surjectivity and G2 orbit reconstruction remain independent.
No original BFSS source, unified integration, main, FCP or pilot changes.
