# IBI-G0C-SO3-HOM — R1 RED, Lean theorem-projection parsing

**Date:** 2026-11-15 Pacific (GitHub workflow log timestamp 2026-11-16 UTC)  
**Branch:** `research/bfss-incidence-unified-20261114`  
**Run:** [#43780891081](https://github.com/etblink/math/actions/runs/43780891081)  
**Exact tested commit:** `f5d65a1a70edf3e3d72620a096e64c79076ed0a0`  
**Job:** `133017572073` (`native-so3-hom-surjectivity-and-consumer`)  
**Artifact:** [#14187889081](https://github.com/etblink/math/actions/runs/43780891081/artifacts/14187889081), size 5812 bytes; archive SHA-256 `629ee812f0e9df71d9fe863be9e6fc48b4579762eb624e58c522a9e558a93438`.

## Observed verified result

1. Checkout passed.
2. Exact original-source and independent-consumer pin preflight passed.
3. Frozen Lean 4.34.1 and Mathlib cache restoration passed.
4. Cold native source build failed at `IBIG0CSO3Hom.lean:31:9`:
   ```text
   Unknown constant `Matrix.mem_orthogonalGroup_iff'.mpr`
   ```
5. The declaration `originalAdjointColorMatrix_mem_SO3` subsequently reported `sorryAx` from the elaboration error; the dependent typed homomorphism and surjectivity also inherited `sorryAx`. These are **NOT** qualified.
6. Independent consumer and explicit source axiom phase were not reached. The evidence artifact was uploaded successfully.

This failure is a **Lean theorem/projection elaboration error**, not a counterexample to the source SU(2) -> SO(3) map. The original determinant-one G0B1 and universal witness R2 source blobs were not modified.

## Bounded R2 repair authorization

Change ONLY the R1 failed orthogonality membership projection to:
```lean
  exact ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mpr
      (FCP.BFSSSU2GaugeG3A.adjointColorMatrix_orthogonal g),
    FCP.BFSSIBIG0B1NativeDetOne.originalAdjointColorMatrix_det_one g⟩
```
Leave all declarations, statements, consumer bytes, upstream imports, toolchain, source witnesses, and resource limits unchanged. Re-pin ONLY the modified source blob in the strict workflow. Fresh exact-pinned cold build and independently compiled consumer with standard-only axiom reports must pass before GREEN qualification. If the same first-causal elaboration boundary fails again, stop and use a smaller Lean interface diagnostic; do not blindly retry.

No main/unified integration branch changes are authorized by this R2 repair. Preserve this RED record permanently.
