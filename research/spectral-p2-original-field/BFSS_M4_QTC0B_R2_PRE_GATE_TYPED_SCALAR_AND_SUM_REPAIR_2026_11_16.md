# BFSS QTC0B R2 — typed coefficient and nested sum repair pre-gate

Date 2026-11-16 Pacific. Research branch `integration/bfss-unified-research-20261108` only.
**REPAIR CONTRACT / NOT YET QUALIFIED.**

R1 RED [#44012367725](https://github.com/etblink/math/actions/runs/44012367725) at `7fbb73ee8b3f46d1a1d657c18c797d26ea2cc5c0`. Original provider ZIP #14296824993 (SHA-256 `a50bc06b6f5ac03c15be16de7b943910ca55bc3a7960f40829c1049e8402c5c1`, Git blob `671be94ee31c954b8f8b276de7b8ede9359aa617`) and complete job log (`c56410ec436f5505988f6a138ae19e8afbb5d88f`) **preserved in repository** before R2 edits.

The exact first causal failure was `P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:48:14`, unrestricted `rw [mul_comm]` on the noncommutative Fock carrier; the rewrite's dependent motive involved the wrong topology instance. Later holes at 62,72,76,90,94,129 are finite-sum coefficient/term-reindex proof-engineering errors. QTC0B roots acquired `sorryAx` from open goals, and independent consumer was never compiled. R1 proves nothing.

## Frozen mathematical contract and test policy

- Main public source root remains `originalFock_quadratic_covariance_tensor`, actual `Fermion 2 →L[ℂ] Fermion 2`, arbitrary finite index, arbitrary complex `a,b : Matrix ι ι ℂ`, and explicit conditional covariance `hcov`: `[T,Q_x(b)]=Q_x(a*b+b*a.transpose)`.
- Separate skew corollary is unchanged: only `a.transpose=-a` reduces to `Q_x(a*b-b*a)`; `b` remains arbitrary.
- Original normalized `1/4`, unchanged ordering `x_i*x_j` and existing QTC0A source `b0b519e4...` must be frozen.
- R2 repair only: use `congrArg (fun c : ℂ => c • (x p*x j)) (mul_comm ...)` for **complex scalars**; move finite sums with explicit calc equalities, `Finset.sum_comm`, `Finset.sum_mul`/`Finset.mul_sum`, and `Finset.smul_sum`/`Finset.sum_smul`. Avoid unrestricted rewrites crossing instance-driven Fock operator terms.
- For each matrix multiplication goal, bring both sides to explicit `∑i coeff • (x_p*x_j)` under local `Finset.sum_congr`. For final recombination, reverse `Finset.sum_add_distrib` before applying `Matrix.add_apply` and `add_smul`.
- Consumer statements, four finite-index cases `Fin 0/1/2/3` and three adversarial (2×2) matrix controls remain byte-frozen unless a consumer-specific failure later requires a separate receipt.
- Exact source/consumer/workflow Git hashes must be repinned in the strict R2 workflow. No `sorry`, `admit`, `axiom`, `unsafe`, or resource escalation.

## Acceptance and stopping

Strict cold native source, warning-as-error source/consumer, exactly 2+2 root axiom reports with only `propext`, `Classical.choice`, `Quot.sound`, 7 independent controls, six negative auditor controls; original provider ZIP uploaded even if RED. Preserve the original R1 artifact and source/consumer hashes as historical negatives. Two *analogous recursion* failures require architecture review. This R1 was **not** recursion, so a bounded R2 is permitted.

**No generic tensor contraction is qualified until strict GREEN and evidence acceptance.** QTC1 real source bridge, QTC2 original `K` bracket and original physical fidelity certificate are separate. Never touch `main`.
