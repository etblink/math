# RHOPF-P9C3D2G1D68A — original normalization and projective-class exact microgate

**Pacific date:** 2026-11-21. **Disposition: UNQUALIFIED; awaiting original strict native and independently imported consumer CI.**

## Exact accepted boundary

D67 R2 accepted by independently verified original [run #44997000727](https://github.com/etblink/math/actions/runs/44997000727), exact tested SHA `5ad0cf2da6b541ccd0cb5afd8d48b0f00cee6490`. Original [artifact #14744517758](https://github.com/etblink/math/actions/runs/44997000727/artifacts/14744517758): ZIP integrity pass, six members, embedded commit match, SHA-256 `44fbb38e2a4c2bcd9f08b3b4ce957c64100d6d0a405adbb5f2c761b2c5df80c5` equal to GitHub original digest, original Gamma9 integer fixture pass, two native and two independent axiom reports each `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or native errors, 9,114 dependency jobs PASS. [Qualification record](RHOPF_P9C3D2G1D67_R2_STRICT_GREEN_QUALIFIED_2026_11_21.md) and [JSON evidence](RHOPF_P9C3D2G1D67_R2_STRICT_GREEN_EVIDENCE_2026_11_21.json). Accepted source D45–D67 and `main` remain unchanged.

## Three tightly bounded declarations

The proposed source defines, for the **actual** nonzero `EuclideanSpace ℂ (Fin 2)` vector subtype, the standard norm-one representative
`N(v) = ((‖v‖⁻¹ : ℝ) : ℂ) • v`.
Its norm-one proof repeats D64's already accepted norm calculation instead of importing novel analytic machinery. The proposed first theorem proves D61's actual unit-sphere projective point of `N(v)` equals `Projectivization.mk' ℂ v` by D64's original pinned `Projectivization.mk_eq_mk_iff'` scalar-witness method. The second theorem transports this equality to the SAME D65 orbit-class `Equiv` via accepted `relationalStandardCircleOrbitQuotientProjectivizationEquiv_class`.

This gate **does not** attempt continuity of `N`, inverse continuity of D65, or a homeomorphism. Those remain future D68B and subsequent gates. Scientific/physical claims also remain excluded.

## Reproducible strict acceptance

Proposed source is `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/RHOPFP9C3D2G1D68ANonzeroUnitNormalization.lean`, independent imported consumer `lean/diagnostics/RHOPFP9C3D2G1D68ANonzeroUnitNormalizationIndependentAudit.lean`, strict workflow `.github/workflows/rhopf-p9c3d2g1d68a-nonzero-unit-normalization-strict.yml`. Exact original-SHA/Git-blob guards of D45–D68A, original Gamma9 source and signed-permutation numerical fixture, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, warning-as-error native and independent imported consumer compilation, three native and three imported `#print axioms` with allowed original axioms only and no `sorryAx`, archived original ZIP and SHA/CRC/embedded-commit check are required.

**STOP rule:** A native or independent RED is negative knowledge and not proof of mathematical impossibility. Preserve original logs and exact commit before any single-mechanism repair; no old source modifications, no linter weakening, `sorry`, arbitrary topology transport, original Gamma9 Q topology changes, global projective topology instance, or `main` changes.
