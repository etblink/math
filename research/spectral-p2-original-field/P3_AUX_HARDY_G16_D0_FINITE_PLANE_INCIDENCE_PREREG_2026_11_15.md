# G16 D0 — preregister finite four-plane incidence and normalization diagnostic

**2026-11-15 · REGISTERED_NOT_EXECUTED · PROSPECTIVE.** Based on the accepted [G15 R4 strict #43763173942](https://github.com/etblink/math/actions/runs/43763173942), whose independent 19-entry artifact audit and G15 checkpoint were accepted by roadmap [#43766043356](https://github.com/etblink/math/actions/runs/43766043356). G15 last qualified; G16 remains `RESEARCH_DESIGN_NOT_STAGED`.

## Observation / question / hypothesis

The original source `originalHardyY` uses four ordered planes (zero-based `(0,1),(2,3),(4,5),(6,7)`), single-gamma coefficient `1/16`, and triple-gamma coefficient `1/56`. The accepted `OAI.BFSSGamma.trace_reverseWord_word` (blob `d12051e70de679f5458dbd456667a32c7b407ce4`) supplies orthogonality of singleton and triple *distinct word labels*; the literal ordered-to-word adapter has not yet been proved.

Hypothesis D0 (Mathlib-only, `Fin 4` and `Fin 9`): four pairs are disjoint, leaving axis 8 unpaired; for each axis, number of pairs containing it is 1 (axes 0..7) or 0 (axis8); number of eligible triple-gamma pairs is 3 (axes0..7) or 4 (axis8). The eight single-word supports and 28 triple-word supports are respectively distinct and disjoint by word cardinality. With Frobenius squared norm 16, the **derived coefficient weights** are `61/784` for axes0..7 and `16/784` for axis8, and after CAR half-factor `61/1568` and `16/1568`. The abstract formula does not assert actual gamma orthogonality or original `Y` without a later source bridge.

## D0 contract and falsifiers

Create new isolated `import Mathlib` only source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG16FourPlaneIncidenceDiagnostic.lean` with named roots for (a) the two exact per-axis finite counts and (b) the exact rational Frobenius/CAR weights. New independent `lean/diagnostics/BFSSP3AuxHardyG16FourPlaneIncidenceIndependentConsumer.lean` must consume those roots at all axes and check literal index 0 and index 8, with nontrivial negative controls on plane omission and swapped normalizations. Source and consumer should each emit explicit axiom reports.

No alternate gamma representation, axioms, sorry/admit/unsafe, warning suppression, shifted `Fin 9` dimension, `maxHeartbeats` or `maxRecDepth` changes. Prove counts by kernel-checked finite computation (`decide`), rational identities by `norm_num`. Do not hide a changed hypothesis in the proof signature.

Workflow: lightweight *diagnostic* strict Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold mathlib-only source build and independent consumer, `-DautoImplicit=false -DwarningAsError=true`, full expected axiom reports (allowed only propext/Classical.choice/Quot.sound), artifact on failure and success, exact source/consumer pins, explicit fresh run and manifest, original G15 source/consumer/workflow and gamma donor hashes frozen; preserve a red receipt on failure. The source must not import any OAI original carrier. The diagnostic is **NOT the main G16 source gate**.

## Reproducible independent arithmetic controls

An independent Python enumeration of all 4 planes × 9 axis labels yielded 8 singleton terms and 28 eligible triple terms, 28 distinct unordered triple supports, per-axis singleton multiplicities `[1,1,1,1,1,1,1,1,0]` and triple multiplicities `[3,3,3,3,3,3,3,3,4]`. Exact Fraction coefficients:
```
axes 0..7: 16/16² + 3·16/56² = 61/784
axis 8:                     4·16/56² = 16/784
CAR half-factor: 61/1568 or 16/1568
```
Independent JSON control `G16_exact_finite_controls.json`, exact SHA256 `16a946b4995db1b6344b0b888faeb096a5a371b3cb67a87a2e0d312e9d18d64f` (working-container original; source or shared archive will be needed for durable copy). Falsifiers: axis8 has 3 instead of 4 terms on omitted plane; change 1/56 to 1/55 yields axis0 weight `3793/48400` ≠ `61/784`; omit an axis0 plane and it loses its singleton.

## Stop line and integration

After D0 qualifies, preregister **D1 source exact ordered gamma-word adapter**, using `GammaWords.lean` trace orthogonality, sign of `Gamma_k Gamma_i Gamma_j`, and original `AlgebraData 2` types; then independent paired original `originalHardyY` consumer. The numerical four-plane norm formula and physical Spin(9) average cannot be called Lean-qualified from D0 alone. On two analogous Lean reds stop for a proof architecture review. No G15 accepted proof, D0 qualified donor, physical model, or HF regulator modified.
