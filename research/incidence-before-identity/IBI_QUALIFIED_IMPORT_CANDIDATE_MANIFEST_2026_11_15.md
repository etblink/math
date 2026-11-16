# BFSS incidence qualified-source import — integration candidate manifest

**Date:** 2026-11-15 Pacific / 2026-11-16 UTC.  
**Candidate branch:** `integration/bfss-ibi-qualified-candidate-20261115`.  
**Exact unified parent:** `d8abb410437e0caf442dc34ff7c7d7f200dca03e`.  
**Original incidence snapshot:** `research/bfss-incidence-unified-20261114` @ `42aae017ab8135394f1f0910b71fdf8610cc29db`.  
**Import commit:** `4e52ffdd7a87de61d93cb47eb0d75cd738b5ac86`.  
**Status:** `CANDIDATE_STAGED_NOT_INTEGRATION_QUALIFIED` until new full pinned cold source/independent-consumer audit green, followed by explicit owner approval for any unified branch change.

## Atomic source-donor selection and scope

Selected **17 exact byte-identical Lean sources**, **17 exact byte-identical independent consumers**, and **16 historical GREEN acceptance receipts** as Git blobs in the new branch, based on the frozen original research tree. There were zero independently modified overlapping paths between the source branch and the unified branch at the preflight compare. No historical research commit was cherry-picked or squashed into the unified branch; its complete history remains untouched.

### Original qualified sources (immutable Git blobs)

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0AOriginalBosonGram.lean` — `382315f9e9442f8506bcbe5b42dbc2bad4e7d86d`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B0QuaternionPolynomial.lean` — `ac5cea4cab5b619abc605fc60fd4780a56f4d5e9`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1FinDet3.lean` — `c53fe995551ec85af6c66f9a5939dd421bbc9c10`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1NativeDetOne.lean` — `0b82625932304f9e03f07850cef674689475fc09`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1SourceColumnsTriple.lean` — `7022f0759fd761791132857e8c07bf8b442d9c43`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CInversePauli.lean` — `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CNativeXGenerator.lean` — `def779ebf09a2f1ac11ed1449c64b5b7d013a1ed`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CNativeZGenerator.lean` — `4aa7884124fb1cc6497aaa78f8b4e6995c158338`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CPauliTrace.lean` — `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Angle.lean` — `2bc7521a8f417ddd8e0e74370d3d014ddb200e2a`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Euler.lean` — `ffc6fb6449800a533015cdc7b648bc5d85037ac0`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSO3Hom.lean` — `e078ce60467b0d7f7fadc19065d0aadfb132dca0`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CSourceSO3Witness.lean` — `ecf86b8f8f70e5bc847716bb3f5287e460be940b`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CXImage.lean` — `999a0c66110431d1c92aaaf6ca37b21f253a9501`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CZImage.lean` — `e4623ef2e7ce825575a73f96e087bee17c4872ab`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG1AOriginalLieTriple.lean` — `0e6f3748632f96824f14b808cc2f33f2085276fb`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG1BOriginalSignedCross.lean` — `b42291fe0aa5f8b22a31bad19b9de5c775372a71`

### Independent consumers (immutable Git blobs)

- `lean/diagnostics/BFSSIBIG0AOriginalBosonGramIndependentConsumer.lean` — `ebc33b743c06816c76c539277f2594fe91e0a55e`
- `lean/diagnostics/BFSSIBIG0B0QuaternionPolynomialIndependentConsumer.lean` — `782f5bc691859a96516cc1d06c28bf2719248fe2`
- `lean/diagnostics/BFSSIBIG0B1FinDet3IndependentConsumer.lean` — `61ed8edbf37d54c115768a0df8f75a8f40e909db`
- `lean/diagnostics/BFSSIBIG0B1NativeDetOneIndependentConsumer.lean` — `241be9229b0aa9ea2047679199e068df921987ad`
- `lean/diagnostics/BFSSIBIG0B1SourceColumnsTripleIndependentConsumer.lean` — `cac4d3cf4e1ccfb469db9152c73e78590fe32a19`
- `lean/diagnostics/BFSSIBIG0CInversePauliIndependentConsumer.lean` — `65b082f066c13721746f60c95307bae5e2779ca1`
- `lean/diagnostics/BFSSIBIG0CNativeXGeneratorIndependentConsumer.lean` — `7b7f4d3f84e5764b6ec158f960823734dad89147`
- `lean/diagnostics/BFSSIBIG0CNativeZGeneratorIndependentConsumer.lean` — `b9d0a6de325264b6851cd328f4476082fd4442b4`
- `lean/diagnostics/BFSSIBIG0CPauliTraceIndependentConsumer.lean` — `e330a6bd52aba03c7e85308d6220d9a9631044fc`
- `lean/diagnostics/BFSSIBIG0CSO3AngleIndependentConsumer.lean` — `9f98826ebf5321ebac3ecc66383f37e5361d4308`
- `lean/diagnostics/BFSSIBIG0CSO3EulerIndependentConsumer.lean` — `cb8d9fc06f374cc458348267a0d5dcc656c4b02f`
- `lean/diagnostics/BFSSIBIG0CSO3HomIndependentConsumer.lean` — `2d57aa3ecc1bfef72a16617ca8d209cbb4ddf7c7`
- `lean/diagnostics/BFSSIBIG0CSourceSO3WitnessIndependentConsumer.lean` — `6a16b24ae6921494209a44123e3b13685fc02a88`
- `lean/diagnostics/BFSSIBIG0CXImageIndependentConsumer.lean` — `5b52c1c1ae18f9b9cb9eaba97f72191b6bf4b030`
- `lean/diagnostics/BFSSIBIG0CZImageIndependentConsumer.lean` — `6ad67ab8d87d6f5866d410f01e94ea84d08bac3d`
- `lean/diagnostics/BFSSIBIG1AOriginalLieTripleIndependentConsumer.lean` — `5097bc87fd35280339d38579cb426fa98a0ee589`
- `lean/diagnostics/BFSSIBIG1BOriginalSignedCrossIndependentConsumer.lean` — `253bdfc9e9250c03acce079af55109bd75c251bd`

### Historical GREEN receipts (unchanged)

- [IBI_G0A_R1_GREEN_43689689837_ACCEPTANCE_2026_11_14.md](./IBI_G0A_R1_GREEN_43689689837_ACCEPTANCE_2026_11_14.md) — `63c7f562046ecbb7df26ab534fc5a52cab56d2fd`
- [IBI_G0B0_R2_GREEN_43692012496_ACCEPTANCE_2026_11_15.md](./IBI_G0B0_R2_GREEN_43692012496_ACCEPTANCE_2026_11_15.md) — `8d116566d13b57f0e67a6ded68b328c235222f4e`
- [IBI_G0B1_COLUMNS_TRIPLE_R2_GREEN_43709229043_ACCEPTANCE_2026_11_15.md](./IBI_G0B1_COLUMNS_TRIPLE_R2_GREEN_43709229043_ACCEPTANCE_2026_11_15.md) — `e479be5063e944751099fbafe78842ab89626c2b`
- [IBI_G0B1_FINDET3_R1_GREEN_43705949773_ACCEPTANCE_2026_11_15.md](./IBI_G0B1_FINDET3_R1_GREEN_43705949773_ACCEPTANCE_2026_11_15.md) — `c58ecd3721dbaa73a9dae3c87e578c064f5b6b55`
- [IBI_G0B1_NATIVE_DET_ONE_R3_GREEN_43733883094_ACCEPTANCE_2026_11_15.md](./IBI_G0B1_NATIVE_DET_ONE_R3_GREEN_43733883094_ACCEPTANCE_2026_11_15.md) — `1d49f09411fa419a5ba1a1f93162612df2b2ad57`
- [IBI_G0C_INV_PAULI_R1_GREEN_43750250997_ACCEPTANCE_2026_11_15.md](./IBI_G0C_INV_PAULI_R1_GREEN_43750250997_ACCEPTANCE_2026_11_15.md) — `35fc2133171cf592ad0fde39f2ef30c2a5fa86e7`
- [IBI_G0C_NATIVE_X_GEN0_R1_GREEN_43757062017_ACCEPTANCE_2026_11_15.md](./IBI_G0C_NATIVE_X_GEN0_R1_GREEN_43757062017_ACCEPTANCE_2026_11_15.md) — `a188f8466ba36d9d2b37bf2465bc2e7e334c67cf`
- [IBI_G0C_NATIVE_Z_GEN0_R1_GREEN_43752271387_ACCEPTANCE_2026_11_15.md](./IBI_G0C_NATIVE_Z_GEN0_R1_GREEN_43752271387_ACCEPTANCE_2026_11_15.md) — `d4bf66efa66fdfdcb8f438e13dbbb8ee56f9054f`
- [IBI_G0C_PAULI_TRACE_R5_GREEN_43748016863_ACCEPTANCE_2026_11_15.md](./IBI_G0C_PAULI_TRACE_R5_GREEN_43748016863_ACCEPTANCE_2026_11_15.md) — `1310ffbcf78278599a4a0699f192040dc2f0610e`
- [IBI_G0C_SO3_ANGLE0_R2_GREEN_43772018429_ACCEPTANCE_2026_11_15.md](./IBI_G0C_SO3_ANGLE0_R2_GREEN_43772018429_ACCEPTANCE_2026_11_15.md) — `38e395fdbc325a684d14f2e3420cccb1e4c777fd`
- [IBI_G0C_SO3_EULER_R1_GREEN_43774271484_ACCEPTANCE_2026_11_15.md](./IBI_G0C_SO3_EULER_R1_GREEN_43774271484_ACCEPTANCE_2026_11_15.md) — `da956e1ee7475ec3f0d51e244b865cd9b3f40eac`
- [IBI_G0C_SO3_HOM_R2_GREEN_43782546758_ACCEPTANCE_2026_11_15.md](./IBI_G0C_SO3_HOM_R2_GREEN_43782546758_ACCEPTANCE_2026_11_15.md) — `aec884fed91105158d0ef63cf23779888aacb085`
- [IBI_G0C_X_IMAGE_R2_GREEN_43761025397_ACCEPTANCE_2026_11_15.md](./IBI_G0C_X_IMAGE_R2_GREEN_43761025397_ACCEPTANCE_2026_11_15.md) — `52ce199d6d5bc05bd0490ad7baa4c0bf400be04d`
- [IBI_G0C_Z_IMAGE_R2_GREEN_43755443223_ACCEPTANCE_2026_11_15.md](./IBI_G0C_Z_IMAGE_R2_GREEN_43755443223_ACCEPTANCE_2026_11_15.md) — `26b6f7041eafad0c01716140680496755c088fc4`
- [IBI_G1A_R1_GREEN_43693100174_ACCEPTANCE_2026_11_15.md](./IBI_G1A_R1_GREEN_43693100174_ACCEPTANCE_2026_11_15.md) — `ca076143948e261985987c9f1005bf63eadd5976`
- [IBI_G1B_R4_GREEN_43703395473_ACCEPTANCE_2026_11_15.md](./IBI_G1B_R4_GREEN_43703395473_ACCEPTANCE_2026_11_15.md) — `2fdb4b16368f8767dff85014d8ad7ac12d72b8f6`

The original-source SO(3) universal witness is additionally qualified by [run #43778732001](https://github.com/etblink/math/actions/runs/43778732001) (source blob `ecf86b8f8f70e5bc847716bb3f5287e460be940b`). Its diagnostic R1 red is preserved on the original branch; the source R2 green remains prerequisite to accepted `originalAdjointSO3Hom_surjective`. All historical green claims remain restricted to the originally tested source and consumer closure.

## Explicit exclusions

- **Excluded RED:** `IBIG2AOriginalBosonColorMatrixAdapter.lean`, `BFSSIBIG2AOriginalBosonColorMatrixAdapterIndependentConsumer.lean`, and their strict workflow. [Run #43785446322](https://github.com/etblink/math/actions/runs/43785446322) RED at first compiler error `IBIG2AOriginalBosonColorMatrixAdapter.lean:42:34`, where `M.colorConjugate_coefficient` expects `GaugeGroup 2`, not the raw coercion `(g : ColorMatrix 2)`; downstream `sorryAx` is elaboration fallout. This does not disqualify the earlier 17 green modules.
- **Excluded speculative research:** source-to-octonion/Fano equivalence work, open orbit-classification converse, projected G2A/G3A physical adapter, RP8 physical-sector claims, and independent speculative Lean modules.
- **Excluded:** all IBI branch-specific strict workflows, other red/experimental historical receipts and the full 101-commit incidence ancestry. Their authoritative history remains on `research/bfss-incidence-unified-20261114`.
- **Unchanged:** `integration/bfss-unified-research-20261108`, `main`, original shared G2A/G3A source dependencies, Lean toolchain and Mathlib pins, all P3 G14/G15/G16 proof files and existing evidence.

## Qualification and destination rules

The independent candidate workflow will verify fixed original immutable 34 source/consumer blobs, the 16 green receipt blobs, the frozen Lean/Mathlib pins, and no imported G2A experimental sources; force a fresh current-branch cold build of each of the 17 imported source modules, compile each of the 17 original independent consumers, audit all `#print axioms` outputs against `{propext, Classical.choice, Quot.sound}`, and preserve run artifact/logs. A historical green never substitutes for this clean current-unified-baseline result.

No claim about the full bosonic orbit quotient, original Fock gauge action, Spin(9) physical reduction, Hardy estimate, Hamiltonian domain, spectral gap, ground state, or ontology follows from this import. After candidate green and physical/mainline reuse check, present exact candidate SHA and bounded promotion plan for **explicit owner approval**. No force pushes, entire research-branch merges, or silent unified updates.

**Source-truth rule:** do not delete, rewrite or deprecate either original branch's historical negative evidence. 
