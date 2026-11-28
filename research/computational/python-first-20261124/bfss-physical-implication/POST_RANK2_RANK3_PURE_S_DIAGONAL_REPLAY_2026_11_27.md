# Rank-three pure-S diagonal derivative replay

2026-11-27 Pacific. Direct exact local isolated JS; no new Lean/CI. Prior rank-two completion and CSQ-F2 R1 strict qualification remain unchanged.

## Executed evidence

Frozen seed bfss-seed-transport/source_seed_integer.npz blob 91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0: 19,136 support, norm2 8072064. Rank-three direct H3 anchor bfss-h3-tensor/rank3_vector.npz blob 54fcedb9dadb9ea5d5c76bb3d10615943c877955: 89,088 support, norm2 149960954782679040, denominator 55; historical direct/cyclic byte equality. Original engine b988dee1779f779bd0a5016ffd03c3f0b0211eaa unchanged. ZIP member CRC and uncompressed length checked, integer NPY decoding; binary retrieval by explicit base64 file path succeeds whereas UTF-8 blob retrieval fails. Decoder preserved as [local_npz_exact_decoder_2026_11_27.mjs](local_npz_exact_decoder_2026_11_27.mjs). Pure-S vectors do not depend on H3.

All three diagonal coordinates directly evaluated on six pure-S cores [1,2,3,4,5,6], 36 ordered pairs each: [00](local52_rank3_deriv00_S_square_2026_11_27.json), [11](local52_rank3_deriv11_S_square_2026_11_27.json), [22](local52_rank3_deriv22_S_square_2026_11_27.json). 324 unique representative raw slots (tau,beta,nu at each coordinate), 75 actions, 9 literal/compiled controls, zero wide actions or combines; max narrow bound 755367505920. All raw imaginary components zero, 108 tau Hermitian controls pass. Batch attempt for 11/22 timed out after 11 was preserved; 22 completed in separate single-coordinate call. No inference of mathematical failure from timeout.

## Historical comparisons and negative control

[Exact diagonal comparison](local52_rank3_derivative_S_diagonal_comparison_2026_11_27.json) compares all 108 weighted nu entries with historical bfss-full-jets/jet_123_p8.json blob 852fcd83dcf388877ef0821c6350a892dd6eaced, reading bracket-balanced integer arrays as exact strings. Multiply direct raw nu by d_a, historical nu_raw by 330^2. 108/108 exact matches, 54 nonzero. Initial inherited rank-two cyclic axis convention gives 54 mismatches; preserve this negative control. Independent inspection of bfss-full-jets/scaled_jets.py blob 07e1c419ab8ca1429c45998ac7085b332d6d4c96 confirms diagonal append order is direct row order for this rank-three fixture. All six wrong individual axis pairings produce 18 mismatches each. No source arithmetic was modified to fit. This is a comparison-interface correction, not a falsification of rank-three contractions.

## Remaining work

324/3888 planned rank-three representative raw slots evaluated; 108/720 aggregate entries compared (nu only, six-core square). No complete rank-three ordered pair yet: tau/beta aggregates need off-diagonal coordinates and multiplicity six. Next direct E01 and a null-column representative against separately executed tangent engine, verify actual signs, division and a second null column. Preserve coordinate receipts before batch continuation. Compare contracted Euler against independently archived rank-three mass, then mixed and high-degree blocks. No generic polynomial or literal weighted-form promotion; all global Spin(9)/trial/Hardy obligations retained.

Classification: SURVIVED_FINITE_TESTS (diagonal sub-block only).
