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

## R2 strict result and proof redesign

[Strict run #45425611617](https://github.com/etblink/math/actions/runs/45425611617), job `138556652838`, tested `a5fc6ca3a43ccbcb09397a00dded35442ca5b691`. The frozen-source preflight and pinned Lean and Mathlib restoration passed. Lean reached the CSQ-O0 module at step 9,003 of 9,007 and timed out at `whnf` after 200,000 heartbeats on line 99, column 8. This was the final `exact h` in `halfSquare_apply`, the same proof boundary as R1. R2 had already rewritten the G5P hypothesis with the explicit pointwise evaluation lemma. The transcript identifies the comparison that timed out. The exact elaborated difference between hypothesis and goal remains to be diagnosed.

The coordinate derivative and right-ordered evaluation again reported only `propext`, `Classical.choice` and `Quot.sound`. The scalar half-square difference report contains `sorryAx`. The standalone paired consumer did not run.

The [original R2 ZIP](../integration/evidence/csq-o0-r2-original-red.zip) has 13,247 bytes. Its SHA-256 `e070376dbc71270133874e3e01ecda8c3394e2630428fc38aeff5b3b6d4ffb3c` matches [provider artifact #14936941515](https://github.com/etblink/math/actions/runs/45425611617/artifacts/14936941515). All six members passed CRC verification. The tested SHA, native source, independent consumer and workflow blobs, and the environment hashes match the repository at the tested commit.

**Disposition.** Hold the concrete `halfSquare_apply` approach after two failures at the final comparison. The next candidate should take the two G5P decompositions in their original equation shape. An abstract complex-linear evaluation map can then distribute addition and scalar multiplication, absorb the one-half times two normalization from G5Q, and cancel the common kinetic and quartic terms using the equal-norm hypothesis. Bind the original endomorphism, test function and point only after checking the abstract identity. The resulting right-ordered difference can use the two derivative lemmas that passed their axiom audits. The first verification boundary is the abstract cancellation and one exact source instantiation. CSQ-G0 and CSQ-E0 depend on the strict original-source qualification of CSQ-O0.

## R3 abstract cancellation candidate

The proof now feeds both exact G5P equations directly into a lemma over arbitrary complex modules and a linear evaluation map. The lemma substitutes the common spinor norm in the kinetic and quartic terms, uses G5Q to replace each ordered mixed term by twice the right-ordered term, and cancels the common terms after distributing evaluation. It returns the difference of the two right-ordered evaluations. The original binding is the linear map that applies a source endomorphism to the test function and evaluates at the chosen point. The final directional-derivative step consumes this difference using the existing G5W proof.

An exact Python prescreen used the scalar model `E(a) = slope * a` and exhaustively varied `slope, kinetic, quartic, w, z` over `{-2,-1,0,1,2}`. For all 3,125 cases, subtracting `E(kinetic + (1/2)*(2*right)) + quartic` at `right = w,z` returned `E(w) - E(z)`, and the imaginary orbital coefficient was `-E(w-z)`. Omitting the half, keeping an extra half, reversing the sign, and adding the directions each disagreed with the intended result in 2,000 cases. This prescreen checks the arithmetic and sign only. Strict Lean CI checks the original-source binding and the paired consumer.

R3 source blob `3a3179bc04e494e244fd35b3f2ac5284802c6d27`. The three public statement texts, both derivative proofs and the paired consumer blob `86b8a7978b135aa3f3fc1e9c298d02264c0579a6` match R2. The strict workflow uses the original toolchain, donor pins and proof limits. Qualification awaits the native and independent Lean results. R1 and R2 retain their original archives and verdicts.
