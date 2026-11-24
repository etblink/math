# CSQ-O0 — original orbital square difference

November 24, 2026 Pacific. The CSQ-O0 R1 candidate was staged for strict source and independent consumer verification. Its frozen ancestor was `f845f006d2933f4d490b72af8e3ff67d8beaef56`, which records [CSQ-F1 R2 qualification](BFSS_CSQ_F1_GATE_2026_11_24.md).

## Source contract

For real spinors with equal original `spinorSquareNorm`, subtract the scalar half-squares of the original normal-order decomposition on the same `SmoothCore 2` function. Use G5P to identify the kinetic, mixed and quartic terms. G5Q cancels the mixed commutator with normalized Pauli color and makes the ordered mixed term twice the right-ordered term. G5W fixes the factor `-Complex.I` and the original tangent. G7P's basis argument extends to an arbitrary bosonic vector by the original `coordinateDerivative_apply` and linearity of the real Fréchet derivative.

For a fixed point, the surviving orbital term is minus i times the derivative along the original `gaugeTangent` at the difference of the two `sourceSpinorWeightedColor` vectors. The derivative acts on the smooth-core function. The spinor-selected color vector is evaluated at the point.

Three native reports cover the basis derivative, the right-ordered evaluation, and the scalar half-square difference. Two standalone checks use the actual paired algebra data. The second states both halves of the original coefficient sum explicitly and discharges the color and gamma premises. The strict workflow pins both candidate blobs and the original donors, restores Lean 4.34.1 and the original Mathlib pin, and archives the native and independent logs.

Source blob `4a9492f9210a5b7fb2aceda0be13fbfca3b73faa`. Independent consumer blob `86b8a7978b135aa3f3fc1e9c298d02264c0579a6`.

## Sequenced proof obligations

| Gate | Required result |
| --- | --- |
| CSQ-O0 | Qualify the original scalar half-square difference and the actual paired directional derivative. |
| CSQ-G0 | Join the original normal-order response with the CSQ-O0 orbital and CSQ-F1 fermionic differences, keeping the factor `i` and G7T's skew-current sign. Apply G7T at the color difference for each point on the actual paired invariant smooth core. |
| CSQ-E0 | Specialize to the original basis charges. Use `charge_symmetric` and `coreToL2` to pass from equal squares to equal squared norms, then evaluate the literal sixteen-charge `coreForm` average. |

The scope of this sequence is the original smooth core. Minimal-closure domains, self-adjointness and spectral conclusions have separate proof obligations. A source or consumer failure should be diagnosed at the first causal error before changing a proof or staging a downstream gate.

## R1 failure and R2 repair

[Strict run #45423097071](https://github.com/etblink/math/actions/runs/45423097071), job `138547645553`, tested `e52d0473dc7b8ee6ed485c7aa13a3c0b9780c67a`. The frozen-source preflight and pinned Lean and Mathlib restoration passed. The native build reached CSQ-O0 at step 9,005 of 9,007. The first diagnostic was a deterministic `isDefEq` timeout at line 95, column 8, on `exact h` in `halfSquare_apply`. The source proof had distributed linear-map addition while leaving the addition of the two resulting smooth-core functions under point evaluation. Lean exhausted 200,000 heartbeats while comparing the result with the explicit pointwise sum.

The coordinate derivative and right-ordered mixed evaluation declarations reported only standard axioms. The scalar half-square difference report contained `sorryAx` after the failed proof. The standalone paired consumer was not reached.

The [original R1 ZIP](../integration/evidence/csq-o0-r1-original-red.zip) has 12,990 bytes and six CRC-checked members. Its SHA-256 `81c3feb6aab8173f27d7fbe708f3b9e5d1ed43596520072a1d9449b248658702` matches [provider artifact #14935733676](https://github.com/etblink/math/actions/runs/45423097071/artifacts/14935733676). The tested commit, source, consumer and workflow blobs, and environment hashes agree with the pinned checkout.

R2 exposes the pointwise sum of two arbitrary original source endomorphisms in a private lemma, then rewrites the G5P equality with that lemma. This isolates the evaluation before working with the concrete mixed and kinetic operators. The public theorem statements and independent consumer are identical to R1. The workflow pins the R2 source blob `7da2e9484c2d029b273114c830298c65f3233f30` and keeps the original toolchain, donor pins and proof limits. R2 awaits strict source and consumer qualification.
