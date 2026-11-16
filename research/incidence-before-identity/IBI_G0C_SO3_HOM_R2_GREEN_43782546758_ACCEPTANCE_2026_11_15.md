# IBI-G0C original BFSS SU(2) → SO(3) hom — R2 GREEN acceptance

Date: 2026-11-15 Pacific (CI completed 2026-11-16 UTC).  
Branch: `research/bfss-incidence-unified-20261114`.  
Status: **GREEN_QUALIFIED** in the precisely stated original-source, typed homomorphism and surjectivity scope. No bosonic orbit-classification, Pauli-kernel, Fock, or physical-domain conclusion follows.

## Frozen accepted evidence

- [Strict run #43782546758](https://github.com/etblink/math/actions/runs/43782546758), workflow name `BFSS IBI-G0C original BFSS SO3 hom and surjectivity strict`; completed SUCCESS, push event, attempt 1.
- GitHub Actions job `133022804588`, `native-so3-hom-surjectivity-and-consumer`, completed SUCCESS. All steps succeeded: checkout, exact source/consumer pins, frozen Lean/Mathlib restoration, cold source and independent consumer axiom audit, and evidence upload.
- Tested immutable commit: `b3fce75382db8a50148b30d02585c0dd37ec1a20`.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Hom.lean` blob `e078ce60467b0d7f7fadc19065d0aadfb132dca0`.
- Independent consumer: `lean/diagnostics/BFSSIBIG0CSO3HomIndependentConsumer.lean` blob `2d57aa3ecc1bfef72a16617ca8d209cbb4ddf7c7`; FIVE source-specific consumer examples.
- Strict workflow: `.github/workflows/bfss-ibi-g0c-so3-hom-strict.yml` blob `f9fc8ba215306a9a85ce163317e4afaa003876f8`.
- Pinned prerequisite original universal witness `IBIG0CSourceSO3Witness.lean`: `ecf86b8f8f70e5bc847716bb3f5287e460be940b`, accepted source R2 #43778732001.
- Pinned prerequisite native det-one `IBIG0B1NativeDetOne.lean`: `0b82625932304f9e03f07850cef674689475fc09`, accepted R3 #43733883094.
- Pinned original G3A coefficient representation: `553869f1287c64893398c3b79c04fe010023bd08`.
- Lean: 4.34.1, Mathlib manifest pinned `67d01d2717d0aaff59fb8814bb53581b961f42b4` with Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold build: `Build completed successfully (9032 jobs).`
- Exact logged guard `BFSS_IBI_G0C_SO3_HOM_SURJECTIVE_SOURCE_AND_CONSUMER_STRICT_GREEN`.
- All five printed axioms reports: subsets of `{propext, Classical.choice, Quot.sound}`, without `sorryAx`. The workflow explicitly verifies no source, independent-consumer, or build errors/warnings beyond recognized package-local-change warnings.
- Evidence [artifact #14189491606](https://github.com/etblink/math/actions/runs/43782546758/artifacts/14189491606), zip 5980 bytes, SHA-256 `2faa2525450ba59f83f384a3e8fcdc6e50e33287ab9be21a78b14525bdc5f580`.

## Accepted mathematical contract

1. `originalAdjointColorMatrix_mem_SO3 (g : GaugeGroup 2)`: the actual original G3A matrix belongs to `Matrix.specialOrthogonalGroup (Fin 3) ℝ`.
2. `originalAdjointSO3Hom : GaugeGroup 2 →* Matrix.specialOrthogonalGroup (Fin 3) ℝ` packages the original source identity/multiplication theorems.
3. `originalAdjointSO3Hom_coe` fixes the exact rows=output / columns=input G3A matrix convention.
4. `originalAdjointSO3Hom_surjective : Function.Surjective originalAdjointSO3Hom` consumes accepted R2 universal original-source ZXZ witness.

No new SU(2) model or assumption is introduced. In particular, the kernel `{±1}`, the original G2A boson-action matrix intertwiner, Gram+signed-triple converse orbit classification, Fock central sign, physical Gauss/domain, and any spectral claim remain open.

## Preserved RED / repair boundary

R1 [#43780891081](https://github.com/etblink/math/actions/runs/43780891081), exact `f5d65a1a70edf3e3d72620a096e64c79076ed0a0`, failed at first causal `IBIG0CSO3Hom.lean:31:9` because `Matrix.mem_orthogonalGroup_iff'.mpr` parsed as an unknown constant. The source R2 change was solely `(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).mpr`. The independent consumer is byte-identical; workflow changed only this source SHA pin. RED receipt preserved in `IBI_G0C_SO3_HOM_R1_RED_43780891081_LEAN_THEOREM_PROJECTION_2026_11_15.md`.

## Promotion and next decision

This is a **qualified mathematical source bundle**, not authorization to merge entire incidence branch into `integration/bfss-unified-research-20261108`. Proceed to separately qualified literal G2A↔G3A boson-coordinate action adapter; then prove full-rank / low-rank Gram-plus-signed-triple SO3 orbit classification and a nontrivial downstream consumer. Kernel ±1 is independent and not a prerequisite for coarse bosonic orbit completeness. Preserve original accepted blobs and all rejected controls. Any selective integration requires clean source/consumer closure requalification against current unified HEAD, actual proof consumer, and explicit owner approval per existing promotion policy.
