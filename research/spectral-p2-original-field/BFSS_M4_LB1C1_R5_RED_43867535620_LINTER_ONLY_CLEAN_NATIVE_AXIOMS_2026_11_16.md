# BFSS M4-LB1C1 R5 RED — complete cold original source, clean axiom reports; strict warning-as-error

**Date:** 2026-11-16 Pacific. **Canonical repository/branch:** `etblink/math` at `integration/bfss-unified-research-20261108`. **Status:** R5 STRICT RED (warning-as-error), **all three original-source declarations compiled with only standard allowed axioms**, independent consumer not reached. Not an accepted final six-report gate.

## Immutable R5 evidence

- [Strict LB1C1 R5 run #43867535620](https://github.com/etblink/math/actions/runs/43867535620), status `completed/failure`, attempt 1, job `133299850098`; tested source/workflow SHA **`f2ea8c2001256be38864c479601113e2c89bd0e1`**; exact source blob **`099d9bc4d9556c188cd1e57ef36ad5b7c73cece6`**.
- [Original logs artifact #14226802574](https://github.com/etblink/math/actions/runs/43867535620/artifacts/14226802574), size 3306 bytes, GitHub-reported ZIP digest `sha256:63307bcdf09461a8b09eb8e3d908f2e0d3c4bb00f35494ffe0ce729e91b9e02b` (provider-reported, not independently rehashed).
- Exact new-source/qualified-donor/independent-consumer/toolchain preflight PASS. Frozen Lean 4.34.1/Mathlib cache PASS. **Cold native source build completed successfully, 8,961 jobs**, producing a new LB1C1 `.olean`. All THREE original source `#print axioms` declarations reported precisely `[propext, Classical.choice, Quot.sound]`; **no `sorryAx`**.
- Source emitted one strict-disallowed linter warning: `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean:68:8: Used tac1 <;> tac2 where (tac1; tac2) would suffice`. The source proof line was `ext v <;> simp`.
- The subsequent `lake env lean -DautoImplicit=false -DwarningAsError=true ...` promoted this warning to an **error** at source line 68, before independent original Fock consumer compilation and its three axiom reports. This is the first failing acceptance condition; no source theorem was refuted by that failure.
- [R5 roadmap consistency run #43867535681](https://github.com/etblink/math/actions/runs/43867535681) GREEN on the tested proof commit, but this does **not** certify the strict LB1C1 acceptance.

## R6 bounded fix and stopping rule

- Replace only `ext v <;> simp` with `ext v; simp`, the exact linter-preferred tactic sequence in private `originalFock_real_smul_zero`. **Do not disable the linter**, weaken warning-as-error, increase resources, or alter statements. Keep the original `K(A)=1/4∑A[p,q]Γ_pΓ_q`, `Fermion 2` carrier, actual `Source48Label`, accepted LB0/LB1S/LB1C0 donors, and three independent consumer bodies untouched.
- Change LB1C1 workflow's new source blob pin, leaving original donor, consumer, Lean/mathlib hashes and strict six restricted axiom report requirements unchanged.
- **Acceptance requires** successful cold new original source, 3 source + 3 independent consumer axioms all within `{propext, Classical.choice, Quot.sound}`, no `sorryAx` or source warnings, then artifact digest and explicit acceptance record. A mathematical source proof compiling under non-strict flags is progress, not final gate qualification.
- If R6 unexpectedly RED, preserve tested SHA and first-causal diagnostics again before any further repair. Do not restart the earlier polymorphic smul experiments, now superseded by the successful extensional proof.

Original so(48) Lie bracket `[K(A),K(B)]=K([A,B])`, global Spin9 Fock-vector lift, gauge/charge-domain covariance and spectral claims remain OPEN. Incidence-first normalizer experiments are separate finite computation research, not full BFSS Hamiltonian theorems. `main` unchanged.
