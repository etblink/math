# P3-D3 accepted and P3-D4 cross-pairing pre-gate receipt — 2026-11-12

**Branch:** `integration/bfss-unified-research-20261108`. **Scope:** one isolated D4 source-exact original-Fock cross-pairing candidate, independent consumer and workflow. Original upstream/FCP and main untouched.

## D3 strict evidence

- [GREEN #43294672405](https://github.com/etblink/math/actions/runs/43294672405), job `131449679530`; exact tested commit `349dc8cad66f0d6ae7a663b5b937d43d6ba17443`, cold source+consumer and all 63 SHA pins PASS.
- Lean `4.34.1` / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Both source and consumer printed only `propext`, `Classical.choice`, `Quot.sound`.
- Source blob `09796e2294faa0ca83012162d633e6943d317e30`; consumer `9ae7cd523645102bc9d951127928b4a3074fb583`; artifact ID `13979223821`, SHA-256 `f9dbe1b664715c72be38a5e719b7ce391764f81afc1747291023e600a3db4161`. Marker `BFSS_P3_D3_ORIGINAL_FOCK_COLUMNS_STRICT_GREEN`.
- Prior RED #43289857042 was consumer-only deprecated `ContinuousLinearMap.zero_apply`; preservation memorandum already committed. No D3 theorem revision or assumption change.

## Historical theorem reuse and D4 evidence contract

- Reuse OP1A `originalFockTracePairing` source blob `b79f4230dc03670f4b3fffc425a0cc283688a7c6` (green #43263788066).
- Reuse OP1B `originalFockTrace_eq_sum_inner` source blob `768e6557415816beefe1d0bf5ddae468d3a82452` (green #43271525095). Its pinned exact adjoint proof uses `ContinuousLinearMap.star_eq_adjoint` and `ContinuousLinearMap.adjoint_inner_right`.
- Reuse D3 `originalFockColumns_apply` (green above).
- D4 source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D4OriginalFockCrossPairingColumns.lean`, two candidate declarations (cross-operator trace inner-columns and pairing as actual D3 columns). Consumer: `lean/diagnostics/BFSSP3D4OriginalFockCrossPairingColumnsIndependentConsumer.lean`, two independent evaluations (original operator cross pairing, equality on equal columns). Both source carrier types are actual `Fermion 2`.
- Workflow: `.github/workflows/bfss-p3-d4-original-fock-cross-columns-strict.yml`; copies all 63 D3 accepted Git blob pins without mutation and adds exactly two D4 blobs, **65** total. Warning-as-error cold build, standalone source/consumer, explicit allowed axioms, archived receipt. No recursion, maxHeartbeats, new model, gauge/spectral/Hamiltonian claims.
- The D4 mathematical statement is deliberately bounded. It does **not** establish a Hilbert–Schmidt norm instance, operator-valued physical `L²`, source Spin continuity, gauge compatibility, closed Hamiltonian domain or physical eigenpair.

**Status:** D4 pending its OWN full strict-green conclusion. Follow first causal error on red, do not rewrite qualified OP1B/D3.
