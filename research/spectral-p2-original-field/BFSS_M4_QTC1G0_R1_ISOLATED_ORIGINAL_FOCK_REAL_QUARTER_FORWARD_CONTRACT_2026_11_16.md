# BFSS QTC1G0 R1 — isolate verified generic original Fock real-quarter atom

Date: 2026-11-16 Pacific. **New pre-gate contract; no theorem accepted by this memorandum.** Stay on `integration/bfss-unified-research-20261108` and never write to `main`.

## Why this is a different architecture

QTC1 R1 [#44020471704](https://github.com/etblink/math/actions/runs/44020471704) and R2 [#44022359538](https://github.com/etblink/math/actions/runs/44022359538) failed at the specialized original Source48 `K(B)` to complex `Q` identification (`71:8`, then `81:6`). R2 also showed an **axiom-standard local compilation** of the purely generic scalar theorem `originalFock_real_quarter_quadratic` after fixing the `ℝ→ℂ` cast. The whole R2 workflow failed; that local result is **not** an accepted strict gate. Exact original ZIPs and full job logs are frozen with STOP `TWO_ANALOGOUS_SOURCE48_DEFINITIONAL_JOIN_RECURSION_REDS`.

We now extract *only* that successful generic atom to a standalone Lean file on the true original `Op := Fermion 2 →L[ℂ] Fermion 2`, retaining the accepted donor lemma `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`. No import or definition of the failed QTC1 source, no original-source `K(B)`/Source48-gamma specialization, no new scalar tower, and no added recursion/heartbeat limits.

The exact generic theorem, for *arbitrary finite* `ι`, *arbitrary* `w : ι→ι→Op` and unrestricted real matrix `B`, is:
```text
Σ_(p,q) (B[p,q]/4:ℝ) • w[p,q]
  = (1/4:ℂ) • Σ_(p,q) ((B[p,q]:ℝ):ℂ) • w[p,q].
```
The proof invokes the accepted real-to-complex smul bridge in each term; `push_cast; ring` handles the coefficient equality; `smul_smul` and `Finset.smul_sum` handle scalar distribution. It makes **no** statement that `w[p,q]` are commuting, and preserves original noncommutative Fock endomorphism carrier.

## Verification ceiling

Exactly **one public source theorem and one independently importing consumer theorem**, plus seven consumer controls (generic `Fin0/1/2/3`, nonskew `2×2` test, zero matrix, coefficient entry positive witness), strict Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, two standard-only `#print axioms` reports and six auditor mutants. Cold source and independent consumer compile required, both in original Fock Op. Original provider ZIP rehashed by SHA-256, archive entries and full job log preserved on GREEN **or** RED. Frozen QTC0D, QTC0C, QTC0A GREEN artifacts and QTC1 R1/R2 RED artifacts pinned as donors and negatives. No accepted file is edited or imported with altered bytes.

**If G0 GREEN**, new qualified mathematical donor is available, but QTC1 source `originalSource48BivectorK B=originalFockQuadratic sourceNormalizedGamma (B:ℂ)` remains unproved. Next candidate `QTC1G1` must use a *named, opaque source kernel / alternate typed interface*, not simply relaunch direct specialization R3. Stop on two analogous failures in any new approach. QTC2 native `[K(A),K(B)]` source proof remains prospective; original BFSS physical fidelity remains OPEN. QTC0D strict [#44018395393](https://github.com/etblink/math/actions/runs/44018395393) stays last accepted until this independent gate GREEN and original artifact accepted.
