# BFSS QTC1G0 R1 — STRICT GREEN qualified; original evidence accepted

Date: 2026-11-16 Pacific. Branch: `integration/bfss-unified-research-20261108`. **This is a source-independent generic donor only, not the original Source48 K/Q equality.**

- Strict run: https://github.com/etblink/math/actions/runs/44024718712 (conclusion success).
- Exact tested commit: `2de9d213c3aa238ef68b3f71e8ad4e0534ce7f82`; job `133842188437`.
- Original provider artifact: https://github.com/etblink/math/actions/runs/44024718712/artifacts/14302906791; original 3,718-byte ZIP independently downloaded and SHA-256 `1422a97396d306c6ec130eb4940d61425fe8004474cc2d25ef54d0996ecbd031` verified against reported GitHub digest.
- **Exact provider ZIP is now stored in Git unchanged** at [`research/spectral-p2-original-field/diagnostics/BFSS_M4_QTC1G0_R1_44024718712_evidence.zip`](diagnostics/BFSS_M4_QTC1G0_R1_44024718712_evidence.zip): Git blob `ade0727552de6bcdaf1ed2863479a99911c8e3cb`, independently matched to the local original ZIP Git-blob calculation.
- All six original member hashes were checked independently and recorded in [manifest](diagnostics/BFSS_M4_QTC1G0_R1_44024718712_evidence_manifest.json), Git blob `fcb8284e936cb37bd54fe6d023c17158d7d4e3ab`.
- [Complete original job log](diagnostics/BFSS_M4_QTC1G0_R1_44024718712_complete_job.log) preserved, Git blob `875572513382ae1474809f551563b69734f33c6c`.
- Cold original Fock source: **8,960 jobs**, source root 1, separately importing consumer root 1, seven finite/nonskew controls, six negative auditor mutants.
- Both audited declarations depend only on `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` in the independently checked roots.
- Strict marker `BFSS_M4_QTC1G0_ORIGINAL_FOCK_1_SOURCE_1_CONSUMER_7_CONTROLS_STRICT_GREEN`.

## Mathematical scope
For arbitrary finite index `ι`, real matrix `B`, and arbitrary ordered original-Fock operator words `w`, the source proves:
```
Σ_(p,q) (B[p,q]/4:ℝ) • w[p,q] =
  (1/4:ℂ) • Σ_(p,q) ((B[p,q]:ℂ)) • w[p,q].
```
This preserves `Op := Fermion 2 →L[ℂ] Fermion 2`. It neither mentions `Source48Label` nor identifies the source `originalSource48BivectorK` with `originalFockQuadratic`. No source K Lie bracket, group-level physical spin representation, closed Hamiltonian symmetry, ground-state existence or fidelity result is accepted.

## Negative knowledge and pause decision
Original QTC1 R1 [#44020471704](https://github.com/etblink/math/actions/runs/44020471704) and R2 [#44022359538](https://github.com/etblink/math/actions/runs/44022359538) are two related Source48 definitional-join REDs with immutable original artifacts and logs. Direct R3 remains STOPPED. QTC1G1 is prospective, QTC2 blocked. The [QIT pivot memo](../quantum-information/BFSS_QIT_CONCEPTUAL_REFRAMING_PIVOT_2026_11_16.md) provides a **research-only** opportunity to test an observable-algebra / commutant-trace reformulation before implementing more native joins. No Lean source/workflow changes in this acceptance commit.

**STRICT GREEN acceptance:** evidence archive, original hashes, manifest, full job log, source and independent consumer audits satisfy the bounded contract; promote QTC1G0 as last qualified mathematical gate.
