# IBI G0B1 native determinant-one R2 — RED_UNQUALIFIED, consumer Matrix notation scope

**Date:** 2026-11-15 Pacific.
**Run:** [#43731870423](https://github.com/etblink/math/actions/runs/43731870423), attempt 1,
tested exact commit `1cce6ad9975c1322ebf3b79ec72cab23b05f92dd`,
job `132865886521`, conclusion **completed/failure**.

## Source pass (not full strict GREEN)

The source/toolchain-pin and exact theorem-contract preflight passed.
Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored.
The source cold build passed **9,022 jobs**; the fresh source compiled under
warning-as-error; all seven named `#print axioms` roots printed only
`propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.
In particular `originalAdjointColorMatrix_det_one` compiled at the
original exact source blob `0b82625932304f9e03f07850cef674689475fc09`.
This establishes a **source-qualified proof compilation**, not the
full independent-consumer qualification.

## First causal RED

`diagnostics/BFSSIBIG0B1NativeDetOneIndependentConsumer.lean:28:48`:
`unexpected token 'ᵀ'; expected ':=', 'where' or '|'`.
Also at line 28:6 Lean reported an application type mismatch: the
source adjoint matrix has type `Matrix (ColorIndex 2) (ColorIndex 2) ℝ`
but was expected to be `Prop`. Both arise in the same combined
det=+1 and orthogonality test, before the consumer could pass.

The source G3A declaration file opens `Matrix`, allowing postfix
matrix transpose `ᵀ`, while the consumer currently opens only
the BFSS and IBI namespaces. This is a strong parser-scope
diagnosis, **not yet an independently compiled repair**.
No source determinant, scalar-triple sign, orthogonality or
improper-reflection counterexample was observed.

## Exact immutable evidence

- Source blob `0b82625932304f9e03f07850cef674689475fc09`.
- Failed consumer blob `6e08594769f078946f2793c8df7e55322abc881d`.
- Workflow blob `a3ef2bf3b068139964e657e849021f2bed637354`.
- [Artifact #14168894395](https://github.com/etblink/math/actions/runs/43731870423/artifacts/14168894395), 5,669 bytes, expires 2026-11-29 UTC. The GitHub upload action reports ZIP SHA256 `e77a7f3bcc3398ef6a105649506c6a9e79db94807234e68c326bf34e8e209285`, **not independently downloaded/rehashed**.

## Process and scientific disposition

R1 [#43730126071](https://github.com/etblink/math/actions/runs/43730126071)
failed at source finite-sum/ColorIndex elaboration;
R2 source build and axiom audit passed, then failed at consumer
transpose-notation scope. These are **different causal boundaries**,
not two analogous source failures. The overall R2 gate is
**RED_UNQUALIFIED**; independent consumer did not pass.
Preserve all R1/R2 negative evidence. One narrowly preregistered
consumer-only scope repair is justified.
No axiom, source theorem, independent example, strict setting,
original integration, main, FCP or pilot modification is authorized
by this receipt.

Even full future native det+1 qualification would imply only
`Im(R_BFSS) ⊆ SO(3)`, not G0C source surjectivity, G2 orbit
classification, physical BFSS results or incidence ontology.
