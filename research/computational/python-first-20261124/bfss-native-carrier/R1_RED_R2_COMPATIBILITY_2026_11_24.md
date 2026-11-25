# MSY native occupation transition — R1 RED / R2 bounded repair

Date: 2026-11-24 Pacific. Branch: `integration/bfss-unified-research-20261108`.

## R1 — RED_UNQUALIFIED

- Tested commit: `1cf50d67a516c0162256aa7211fa75c5864d47ce`.
- Run: https://github.com/etblink/math/actions/runs/45545067025 ; native job 138972587852.
- Exact checkout, frozen-source preflight, pinned Lean/Mathlib restoration: PASS.
- Native build: FAIL. Lines 105, 107, 127, 129 report deprecated `if_pos` / `if_neg` under strict warnings-as-errors. No other native candidate error was reported. Independent consumer not reached.
- Original artifact: https://github.com/etblink/math/actions/runs/45545067025/artifacts/14991493225 ; 8351 bytes. Downloaded and independently SHA-256 checked: `0a0fabc7f9be6b853670f22e65e4519288fe33f06e840094145117f568586b90`. Six archive members: cache.log, environment-sha256.txt, native-source.log, preflight.log, tested-blobs.txt, tested-sha.txt. Original ZIP remains on GitHub Actions (expires 2026-12-25 UTC); full decoded original job log is preserved alongside this memo.
- The finite parity audit and 104-row witness are unchanged. Native axiom printouts from a failing build do not qualify the declarations.

## R2 — REGISTERED_NOT_EXECUTED at staging

Replace only `if_pos` with `ite_eq_left` and `if_neg` with `ite_eq_right` in the native candidate (four occurrences) and the independent consumer (six occurrences), following the pinned compiler's replacement diagnostics. Reversing these substitutions recovers the exact prior file contents. No theorem statement, import, definition, frozen dependency, proof root, workflow, warning policy, or success sentinel changed. The independent consumer remains a literal original pairedAlgebraData.theta control. No local Lean installation available; run the unchanged strict workflow and audit original receipt before qualification. A push triggers the workflow.

## Boundary

If qualified, next prove the general singleton sorting parity identity, then use the existing F1 occupation-space isometry to extend the native transitions by linearity to arbitrary finite coefficients. Bind the actual numerical bit indexing, normalization and dilation; avoid assuming Fintype.equivFin is bit order. Neither R1 nor staging R2 establishes a physical ground state. The general carrier, global gauge/Spin(9) invariance, charge correspondence, weighted graph, and Hardy/fidelity interfaces remain separate. Preserve all subsequent RED evidence.
