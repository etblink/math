# BFSS GM0A R1 — strict RED: independent consumer namespace, 2026-11-22

**Disposition:** exact-original-source native GREEN / imported independent consumer RED. Preserve as negative integration knowledge; R1 is not qualified.

- Original [run #45060181041](https://github.com/etblink/math/actions/runs/45060181041), event push, attempt 1, tested commit `5c0d65db518f84cac19aca25bae22b6f853347b7`.
- Original artifact [#14769655865](https://github.com/etblink/math/actions/runs/45060181041/artifacts/14769655865), 6 files, ZIP 8,085 bytes, independently downloaded and checked ZIP SHA-256 `6e3c813386ec6e4b0331854923d7049eb06277e7c05f756670f6961a3e9db2dd`; CRC PASS; `tested-sha.txt` matches.
- Frozen source/hash/ancestry and isolated independent consumer preflight PASS. Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 PASS.
- Native original source `FCP.BFSSGM0A.originalColorLieTriple_gauge_invariant` and `pairedOriginalSpatialColorLieTriple_gauge_invariant` built successfully **8,992 jobs**; `#print axioms` reports only `[propext, Classical.choice, Quot.sound]`.
- Native source is NOT the RED root. The strict independent consumer `lean/diagnostics/BFSSGM0AOriginalColorLieTripleIndependentAudit.lean` failed at lines 17, 18, 19, 22 and 23 with six `lean.unknownIdentifier` errors: `spatialColor`. The generated `sorryAx` in its axiom report is a direct consequence of unresolved identifiers and therefore a strict FAIL, not permissible evidence.
- **First cause:** consumer opened `OAI.BFSSQuantum` but not `OAI.BFSSQuantum.AlgebraData`, where the original `spatialColor` interface is in scope. The source module already opened both. This is a namespace-resolution/consumer-import-context mistake; no mathematical counterexample is established.
- **Bounded R2 repair:** add exactly `open OAI.BFSSQuantum.AlgebraData` after the existing `open OAI.BFSSQuantum` in the independent audit, preserving the original theorem verbatim, existing strict workflow, frozen donor pins and provenance. Treat R2 as only a candidate until strict source/native and independent consumer + original artifact verification are fully GREEN.

**No physical inference:** The GM0A source is a real color-Lie triple scalar invariant, **not** full 48-Majorana massless Fock covariance, gauge-domain preservation, Hamiltonian or Hopfion.
