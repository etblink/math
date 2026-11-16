# M4 HS1 and CS0 R1 RED — independent first-causal failures, preserved

**Date** 2026-11-15 Pacific / 2026-11-16 UTC. **Active branch** `integration/bfss-unified-research-20261108` (owner-directed single branch). Both RED, unqualified; neither source theorem or downstream consumer may be promoted from these runs.

## HS1 — qualified portion and exact failure

- [HS1 strict #43804304851](https://github.com/etblink/math/actions/runs/43804304851), `completed/failure`, tested immutable SHA `fcbb277bd37ec61b89a23d335dc16ddf67770f3f`, job `133091433667`.
- Exact-pin preflight and Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS. Cold parent source build PASS, then Lean HS1 source compilation RED **line 123, column 6**. The proof of `originalSpin9FockHSFiberUnitaryHom_fixes_operator_one` uses `rw [(originalFockOperatorToHSFiber b).symm_apply_apply]`, but its target uses `originalFockHSFiberToOperator b ((originalFockOperatorToHSFiber b) 1)`, not the exact rewrite syntactic form. First error: `Tactic rewrite failed: Did not find an occurrence of the pattern`. The other **four HS1 source declaration** `#print axioms` reports list only `propext`, `Classical.choice`, `Quot.sound`; fifth reported `sorryAx`. No independent consumer was reached.
- The pinned workflow also incorrectly named **parent HS0** as the cold `mod` and `obj`. Parent was built, then new HS1 source compiled directly via `lake env lean`; fix to cold build **HS1 source itself**, with its OWN target `.olean`, and then separately compile the independent consumer. This is a **gate correctness repair**, not a statement change.
- Preserved [red artifact #14198526035](https://github.com/etblink/math/actions/runs/43804304851/artifacts/14198526035), ZIP size 17224, GitHub-reported SHA256 `551288f47a3f4cddd73f1c1ceb613b29f5b73721df09a34211f4f5ca3975f8dd`.

**R2 repair boundary:** Keep all five HS1 theorem statements, their four already successful proof bodies, and all five independent consumer statements/bodies **byte-identical**. In the fifth proof, rewrite with the exact named M2A inverse definition `change` / `show` and `LinearEquiv.symm_apply_apply`, or a local explicit `have` that uses `(originalFockOperatorToHSFiber b).symm_apply_apply`. No new assumption and no transformation of original operator-vs-HS carriers. Update exact source hash in HS1 workflow and fix cold `mod`/`obj` to HS1; do not relax axiom or resource contract.

## CS0 — first-causal error

- [CS0 strict #43804542031](https://github.com/etblink/math/actions/runs/43804542031), `completed/failure`, exact tested SHA `a2e0037a10a10b14eeeade4de36014b90972dfe2`, job `133092165174`.
- Exact pin preflight PASS, Lean 4.34.1 / frozen Mathlib restoration PASS. First error: `P3M4CS0OriginalSpin9CentralGammaSign.lean:1:0`, **missing `SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.olean`**. CS0 source and independent consumer never elaborated, so no theorem verdict.
- Root cause: cloned workflow `mod`/`obj` still point at **HS0**, so cold build did not construct CS0's original F10U import chain before attempting to elaborate CS0 directly. Fix only the workflow to cold build **P3M4CS0OriginalSpin9CentralGammaSign** with its own source target `.olean` and audit logs; source CS0 and independent consumer should remain byte-identical.
- Preserved [red artifact #14198511339](https://github.com/etblink/math/actions/runs/43804542031/artifacts/14198511339), ZIP size 16977, GitHub-reported SHA256 `ef15d01415c0245a053b63ae1e0e5f749e15002713ce89b9cfdf752614a84e34`.

## Qualification stop rule

The new independent consumer must actually import and compile the newly built source `.olean` (not a parent or cached substitute). A full GREEN requires 5+5 HS1 and 4+3 CS0 source/consumer declarations with standard-only axioms `{propext, Classical.choice, Quot.sound}`, no `sorryAx`, exact source/donor/toolchain hash pins, and cold source build. Do not infer source HS unitary group physical Fock-vector implementation, physical BFSS supercharge-domain covariance, Hardy bound, mass gap or energy ground state from these abstract/operator-level gates. R2 runs must preserve tested SHA and first-causal red data if new errors surface. Git history is never rewritten; no side branches and no `main` edits.
