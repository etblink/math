# IBI-G0C-Z-IMAGE R2 — exact native source strict GREEN qualification

**Decision date:** November 15, 2026 Pacific  
**Research branch:** `research/bfss-incidence-unified-20261114`  
**Verdict:** **GREEN_QUALIFIED** for the **exact original BFSS SU(2) Z-generator adjoint-image theorem**, with full real 3×3 matrix equality and sign/orientation controls.

## Accepted exact-run record

- [Run #43755443223](https://github.com/etblink/math/actions/runs/43755443223): `completed/success` on attempt 1, tested commit `182ca9b7d4f27e4c9f4f2d1a460a26eaaaa053fa`; job `132938417483` `completed/success`.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CZImage.lean` Git blob `e4623ef2e7ce825575a73f96e087bee17c4872ab`.
- Independent consumer: `lean/diagnostics/BFSSIBIG0CZImageIndependentConsumer.lean` Git blob `6ad67ab8d87d6f5866d410f01e94ea84d08bac3d`.
- Strict source content-pinning workflow `.github/workflows/bfss-ibi-g0c-native-z-image-strict.yml`, blob `dfbec62b70454aeb229ec856d55a41c90e9acf00`.
- Frozen accepted generator `IBIG0CNativeZGenerator.lean` blob `4aa7884124fb1cc6497aaa78f8b4e6995c158338`; accepted inverse-Pauli `IBIG0CInversePauli.lean` blob `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`; parent Pauli trace `IBIG0CPauliTrace.lean` blob `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`.
- Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; no toolchain or source dependency changes.
- Native cold build `9019/9019`, separate strict `-DautoImplicit=false -DwarningAsError=true` source and independent consumer passed.
- Preflight `BFSS_IBI_G0C_Z_IMAGE_PREFLIGHT_PASS`; final audit emitted `BFSS_IBI_G0C_NATIVE_Z_IMAGE_SOURCE_AND_CONSUMER_STRICT_GREEN` only after all evidence and permitted-axiom checks.
- `#print axioms` for both `sourceZPauli_trace_rotZ` and `originalAdjointColorMatrix_sourceZ_eq_rotZ` reported only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, `admit`, newly declared axioms or unexpected linter warnings.
- Independent consumer checks **(i)** arbitrary real angle original-source native 3x3 matrix equality, **(ii)** `(1,0)=sin θ` and **(iii)** `(0,1)=-sin θ`. This catches a transpose or wrong-angle convention.
- [Evidence artifact #14177809269](https://github.com/etblink/math/actions/runs/43755443223/artifacts/14177809269), size 5027 bytes per GitHub API. GitHub log reported zip SHA256 `48ecb3aedfefd1ef9e7dab6292bb288dbede06f1a85e8e6c90798df45eb55732`, not independently rehashed.

## Exact theorem boundary

```lean
theorem originalAdjointColorMatrix_sourceZ_eq_rotZ (θ : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (FCP.BFSSIBIG0CNativeZGenerator.sourceZGauge θ) =
    !![Real.cos θ, -Real.sin θ, 0;
       Real.sin θ, Real.cos θ, 0;
       0, 0, 1]
```

The source is the original BFSS `GaugeGroup 2`, not generic textbook SU2; rows=output B, columns=input A; the **native Z generator** is `diag(exp(-iθ/2),exp(iθ/2))`. The supporting `sourceZPauli_trace_rotZ` proves the complex 2x2 Pauli-trace identity before taking the real part. This is a source-exact positive Z rotation. No global (SO(3)) witness or double-cover kernel follows without separate proofs.

## Negative knowledge preserved

- [R1 RED #43754278394](https://github.com/etblink/math/actions/runs/43754278394), tested commit `c423e72139406a7a2aec5acad8c71e0b8df8f2a5`, failed the negative-complex-exponential auxiliary lemma at line 57 due to unnormalized `Complex.ofReal_neg`; `sorryAx` consequently appeared in unclosed proof.
- The bounded R2 change inserted `simp only [Complex.ofReal_neg]` before `ring`. The mathematical statement, original donor interfaces and independent consumer remained byte-identical.
- Permanent [R1 RED diagnosis](https://github.com/etblink/math/blob/182ca9b7d4f27e4c9f4f2d1a460a26eaaaa053fa/research/incidence-before-identity/IBI_G0C_Z_IMAGE_R1_RED_43754278394_DIAGNOSTIC_2026_11_15.md) and archived run artifact remain available.

## Project Lead next proof gate

**G0C-X-GEN0** is recommended next: construct the actual native `GaugeGroup 2` X-axis unitary

```text
X(β) = [ cos(β/2)   -i sin(β/2) ]
       [ -i sin(β/2)  cos(β/2) ]
```

with membership, identity and inverse checks, in a **new** module, workflow and separate consumer. Then **G0C-X-IMAGE** must independently prove the exact source 3x3 adjoint image, with sign controls. After that, a separate arbitrary-`SO(3)` ZXZ Euler decomposition (including gimbal-lock), followed by final native original-source witness. Public QICLean donor may inform proof tactics but remains version-mismatched and never automatically accepted.

**Governance:** Evidence-only acceptance above exact tested code commit. Freeze G0B1, Pauli trace, inverse Pauli, Z generator and Z image source blobs. Do not merge into unified integration, change `main`, or promote full G0C surjectivity.
