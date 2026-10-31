# Project Lead — V8U Gate 1 RED: two unnecessary-simpa strict-linter failures

**Research-local date:** 2026-10-30 PDT; GitHub workflow completed 2026-10-31T05:44:20Z. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`.

## Exact immutable red verification

- [V8U strict Gate 1 #41173279895](https://github.com/etblink/math/actions/runs/41173279895), attempt 1, **completed/failure**, exact tested SHA **`e4f452173e918571326f7e3c1af902b9bf4c3bec`**, job **`124455533665`**.
- Original V8U source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinateMatrixUnitProductProbe.lean`, Git blob **`2a82ec57adf73916a4f4a94ec2a3b533098ef167`**.
- Exact gamma/original 48-real Fock-paired source and native input SpaceIndex pins, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, pinned dependency restore, and accepted V8R/V8S/V8T ancestor compilation **PASS**.
- First failed step: `Fresh compile exact V8U source with warnings as errors`. Independent theorem-type/axiom audit **SKIPPED**.
- Two exact source diagnostics in `SU2BFSSPairedSpin9CoordinateMatrixUnitProductProbe.lean`: line **30:4** and line **36:4** `error: try 'simp' instead of 'simpa'`. The pinned strict linter detects redundant `simpa`, which is fatal under `-DwarningAsError=true`. Disabling `linter.unnecessarySimpa` or lowering strictness is prohibited.
- Unlike unresolved V8R and V8S proofs, the red compiler's **`#print axioms coordinateMatrixUnit9_mul` showed only `[propext, Classical.choice, Quot.sound]`** with **no `sorryAx`**. This is proof-style lint failure, not evidence of unproved theorem or false matrix-unit identity. Nevertheless the strict Gate 1 was red and the V8U root is **not accepted**.
- [Preserved exact red artifact #13032536321](https://github.com/etblink/math/actions/runs/41173279895/artifacts/13032536321), `bfss-v8u-original-paired-coordinate-matrix-unit-product-e4f452173e918571326f7e3c1af902b9bf4c3bec-1`, SHA256 **`437eb32e5f9e4559c39760bdb67cf8367a6e441d22d4d1c3059b7f94be2d2d2b`**, size 580 bytes.

## Minimal source-exact repair, strictly unqualified pending Gate 2

The V8U statement is *unchanged*:
```lean
coordinateMatrixUnit9_mul (r s t u : SpaceIndex) :
    (Matrix.single r s (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ) *
      Matrix.single t u (1 : ℝ) =
    if s = t then (Matrix.single r u (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ) else 0
```

- Equal inner-index branch: replace redundant `simpa using Matrix.single_mul_single_same ...` with `simp`, letting the pinned Mathlib `@[simp]` multiplication rule and reflexive conditional reduction fire directly.
- Distinct inner-index branch: keep the **explicit typed certificate** `hzero` from `Matrix.single_mul_single_of_ne`; replace redundant `simpa [hst] using hzero` with `simp only [hst, ite_false]` and `exact hzero`. This splits conditional simplification from applying the exact typed source equality, avoiding unnecessary-simpa lint.
- No new axioms, explicit `sorry`, `admit`, increased recursion/heartbeat limits, changed statement, source basis reindexing, suppressed lint or accepted ancestor edits.
- Atomic two-file fast-forward commit **`4e591e61ece4ad99ef7855aa57d0add83613e326`**, source blob **`a84879ae64bf8341b403fccb61f33cbd5628cac8`**, workflow source-hash-only blob **`5a01fb01ec4b34c14d2a7e7cef4095b6901f5c7c`**. Exact parent Git tree used and full parent-to-child diff checked: only V8U proof and its workflow hash changed.
- [Gate 2 #41173866620](https://github.com/etblink/math/actions/runs/41173866620) triggered on this exact SHA. **PENDING**: qualifying requires completed success, correct source blob, fresh warnings-as-errors `.olean` compilation, independent type example, source and independent axiom whitelists with no `sorryAx`, and preserved artifact/digest.

## Operational lessons and open questions

Strict quality requirements have caught distinct defects: V8J unreachable tactic, V8L unused simp arguments, V8O looping symmetric simplifier, V8R unproved conditional scalar algebra then deprecated/mismatched conditional rewriting, V8S dependent motive from rewriting under `ite`, and V8U redundant `simpa` despite theorem axioms already being valid. Preserve each root cause and its exact tested SHA rather than treating all red runs alike.

V8A–V8T **43 accepted roots**, V8U **0 accepted pending Gate 2**. The input matrix-unit product, full input `so(9)` bracket, arbitrary-skew 9-to-48 linear Lie algebra homomorphism, global Spin(9) lift and BFSS physical consequences are still unqualified. Preserve original source-label boundary, accepted source Git blobs, frozen FCP, `main` and mathcommunity upstream. No external upstream PR without explicit authorization.

This is a RED failure-and-recovery record, not an acceptance certificate.
