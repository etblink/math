# G16 D1B0 R1 — historical strict GREEN recovered and independently qualified

2026-11-28 Pacific review of November 15 run [43773462950](https://github.com/etblink/math/actions/runs/43773462950), job 132994313094, exact tested SHA 1c9f2681f95b76a0c4049f9b143d1b790fe9976d. Original run finished success; no rerun performed. The original launch receipt was pending and no later acceptance was found in this archive. The preregistered scope is finite combinatorial only.

## Independent evidence review

- [Original artifact 14185099175](https://github.com/etblink/math/actions/runs/43773462950/artifacts/14185099175), downloaded directly, 6819 bytes, local SHA256 9bf3e1d40d7e9f738de85a5db966781c3be4e57c665fbf7db88bbf4305acaa46 agrees with provider digest and job log. All eight ZIP member CRCs pass. Original artifact would expire 2026-11-29; exact bytes now preserved in [evidence ZIP](diagnostics/P3_AUX_HARDY_G16_D1B0_R1_43773462950_evidence.zip), Git blob 6efa2025d424f3093ef696b9142a6e6fe33b59da independently calculated locally and checked against stored blob and size. Complete retrieved original job log [archived](diagnostics/P3_AUX_HARDY_G16_D1B0_R1_43773462950_complete_job.log) Git blob 9669c4ed6291c4ed966358dc44486d5c977e0c67. Archive commit 13cb64d105ad7fed1bb617a302c0fd56c7e75079.
- Frozen preflight PASS (manifest SHA256 5508e61b36c4854b53b2fe5256beea19d41236131ec81136d39185cd55fc73b5), exact tested SHA, Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, cold build 8925 jobs, strict source and independent consumer warnings-as-errors, four source and four consumer roots with exactly propext, Classical.choice, Quot.sound. GREEN sentinel BFSS_G16_D1B0_TRIPLE_SUPPORT_DIAGNOSTIC_GREEN. All job steps successful. Auxiliary local-change and runner deprecation warnings preserved; no new proof errors.
- Eleven current branch source/consumer/accepted-donor pins checked against original manifest and all match. Source c5d12678d7916db42c8c8e009118c57e609002d5, independent consumer bf70d826790e9ab5e32786e5cb4c9d0ed87943d7, workflow 5ee8a355bc6a61d1145b743510d894828c8cd925. The manifest counts 8 examples, while source contains 7 actual top-level examples and scope receipt/job step explicitly says 7. This bookkeeping mismatch is retained; preregistration demanded at least 7, and all seven compiled including negative distinct-support control. No scope inflation.
- Member SHA256: build.log ccea7c4e204cf665dbfb28f2db691635cbc51ea56d409dff991ffb6b5e6b6c1c; cache.log 4312c323429d1e37f1d260ac1540d7b12368037d5a98ba0fbf0bd300e1271a2e; source.log and consumer.log 3e29281ea860025306d984730f99a888290bb0090799bcf6cb0995b5778f88d5; pin-manifest.json 5508e61b36c4854b53b2fe5256beea19d41236131ec81136d39185cd55fc73b5; preflight.log 59a9dacd6d7ff62c303ad713211140dc89e7dca5f40581e5f0320ed32507e42f; scope-receipt.json 4fcb8fcbbb80bd8a3e38adc4f009d048606b5c9cc5f53e5826bfe0b5b702ce6b; tested-sha.txt 2e6a6a4974b4444cb867822ac8d0ab4f9d1c641f6a4d12fc54b3add3f9005dd9.

## Qualified declarations

Namespace FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic:
- tripleLabel_card: Fintype.card TripleLabel = 28
- tripleSupport_card: each support has exactly 3 elements
- tripleSupport_injective: distinct admissible labels have distinct supports
- thirdAxis_outside: k < planeLeft t or planeRight t < k.

Classification GREEN_DIAGNOSTIC_QUALIFIED. Existing G16 D0 and D1A unchanged, G15 still last qualified full gate. No original gamma-product sign, full coefficient norm, physical Hardy, Spin9 vector, domain or existence promotion. Reuse this gate without recomputation. Historical preregistration and pending launch receipt remain immutable.
