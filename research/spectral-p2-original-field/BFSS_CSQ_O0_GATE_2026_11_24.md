# CSQ-O0 — original orbital square difference

November 24, 2026 Pacific. The CSQ-O0 R1 candidate awaits strict source and independent consumer verification. Its frozen ancestor is `f845f006d2933f4d490b72af8e3ff67d8beaef56`, which records [CSQ-F1 R2 qualification](BFSS_CSQ_F1_GATE_2026_11_24.md).

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
