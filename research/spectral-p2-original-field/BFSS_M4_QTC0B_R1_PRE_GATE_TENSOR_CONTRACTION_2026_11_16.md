# BFSS M4 QTC0B R1 — prospective generic tensor coefficient contraction

Date: 2026-11-16 Pacific. Active branch only `integration/bfss-unified-research-20261108`. **PRE-GATE CONTRACT; NO QTC0B LEAN QUALIFICATION.**

## Exact qualified predecessor and negative evidence

QTC0A R1 strict [#44001621836](https://github.com/etblink/math/actions/runs/44001621836) **GREEN / accepted** at source-tested `c2697826a7ebd258f604e60def408a84f52a61b9`: two original-Fock source axioms, two independent consumer axioms, 4 controls, cold 8963; provider original artifact #14292159303 SHA-256 `bf8d93fe00846c9ea26815d32ee331424d9510d1816b66cd98c90ef82baf724c`. Exact 3785-byte original ZIP is archived as Git blob `7cebb61b36ba22283cbd27a8d5f91b301b7303e2` with full original job log, five-entry manifest, and strict acceptance. Repository validator [#44011750144](https://github.com/etblink/math/actions/runs/44011750144) GREEN after an isolated regex-escaping repair; this governance run is not a new theorem. Qualified donors and QTC0A source/consumer/workflow frozen.

Preserve P1 R2 [#43998813826](https://github.com/etblink/math/actions/runs/43998813826) and the historical CT1G0 R1/R2 two analogous native recursion REDs and their independently preserved ZIPs; **NO CT1G0 R3**.

## QTC0B mathematical contract

On the actual original complex Fock carrier `Op := Fermion 2 →L[ℂ] Fermion 2`, generic finite `ι`, arbitrary `x : ι→Op`, `a b : Matrix ι ι ℂ`, assume the explicit hcov:
`∀ k, T*x k-x k*T = ∑ p, a p k • x p`.

Reuse accepted `originalFockQuadratic x b` with its exact complex 1/4 and `originalFock_quadratic_covariance_expanded` from QTC0A. Main theorem:
`[T,Q_x(b)] = Q_x(a*b + b*a.transpose)`.
Sublemmas: central complex scalar transport on each ordered noncommutative product, left triple sum reindex `(a*b)[p,j]`, right triple sum reindex `(b*a.transpose)[i,p]`, finite sum/add recombination. **Do not swap** `x_i*x_j`. `b*a.transpose` is essential even when `a` is non-skew.

Separate corollary only under `a.transpose=-a`:
`[T,Q_x(b)] = Q_x(a*b-b*a)`, with NO skew requirement on `b`.

Adversarial consumer cases: `Fin 0`, `Fin 1`, arbitrary `Fin 2` and `Fin 3`; explicit 2×2 non-skew `a=I`, `b=E₀₀` gives `a*b+b*a.transpose=2*b`, but `a*b-b*a=0`. A separate asymmetric coefficient case should prevent transpose/order confusion. Record two source roots and two independent consumer reports where possible, plus concrete identity controls.

## Method and hard stop rules

Implement new source and separate importing consumer without changing any accepted donors; pin all exact blobs in one new strict workflow. Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 2 source + 2 consumer standard-only `#print axioms`, cold native build, `-DwarningAsError=true`, strict positive/negative auditor controls, and original uploaded artifact on success/failure. Preflight must rehash QTC0A's committed original ZIP and enforce preserved CT1 stop. No `sorry`, `admit`, `axiom`, `unsafe`, altered resource bounds, or monolithic source48 expansion.

First RED: preserve exact first causal error, tested SHA and full original ZIP/log before repair. Two analogous finite-index recursion failures: STOP / architecture review, no resource increase. Green only after complete strict source+consumer and evidence inspection; preflight alone never qualifies.

**Ceiling:** QTC0B proves generic ordered tensor covariance under assumed hcov only. QTC1 real-source `K(B)` binding and QTC2 original `[K(A),K(B)]=K(AB-BA)` remain separate. The physical-Hamiltonian symmetry, Spin(9) global action, Hardy/resolvent, and original BFSS positive-regulator ground-state fidelity certificate remain unproved. `main` untouched.

See [QTC0B coefficient proof design](BFSS_M4_QTC0B_COEFFICIENT_REINDEX_PROOF_DESIGN_2026_11_16.md), [QTC0A acceptance](BFSS_M4_QTC0A_R1_GREEN_44001621836_WEIGHTED_QUADRATIC_ACCEPTANCE_2026_11_16.md), [evergreen ledger](../../contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md).
