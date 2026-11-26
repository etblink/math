# Reduced witness rectangular higher-rank verification

2026-11-25 Pacific. Baseline 4cd159f29e36c8c3c3cb1e1642590c772215abe0. Local isolated JS only; no CI workflow or Lean change. No historical qualifications or physical existence promotions. Frozen rank-two and rank-three H3 coefficient equality established previously.

## Exact content factoring

New algorithm replay52_rectangular_local.mjs (commit 3db8ef3ab2d21f874423d6e07bd6df291aa35a4a). Each integer occupation vector is represented as a primitive vector times its exact positive integer content. Divide components by their BigInt gcd, propagate the extracted factors through linear Krylov actions, restore both factors in each complex inner product. No numerical rescaling or loss of information. Operator action still uses checked narrow bounds or arbitrary precision fallback; dot product either BigInt throughout or integer chunks with conservative bound 2*maxA*maxB*chunk_size < 2^51, exact BigInt accumulation between chunks. Rectangular left/right core sets avoid applying B2/CV to all left vectors. Prior high rank-two block reproduced all 48 exact complex raw contractions, independent of this content extraction and chunked accumulation. In new rank-two high block maximum narrow conservative bound 607421693952, 19 content reductions, no wide actions (previous unnormalized high block required 5), 85 chunked and 155 BigInt dots. This is a bound/operation improvement, not a measured runtime benchmark. No extra exactness assumption beyond the previously checked integer operators and exact content identities.

## Rank two complete mass/Y/t/v coverage

Direct at diag(1,2,0), cyclic proper color/spatial permutation to canonical 012. Three preserved raw rectangular blocks:
- all 12 left x 4 high right: 966825dbca06fcf52a4435b21c8e9c320a53849e, prior 48 matches.
- 8 left x 2 mid right: af920b49d1c16adfed5be5dddd691e315a4360b2.
- 6 S x 6 S: a7da966d1f09a03780448c314c40df869da86282.

Exact comparison e3b0364e67921613ad6ff6da8fccfb762dfa12d2; comparator f07f21c2fc13b9073a8459434fc6d46b7bcaabba. All 864 historical entries match (mass 144/Y 144/v 144/t 432); 338 nonzero. 500 directly computed, 220 reconstructed by established real Hermitian symmetry or t antisymmetry, 144 zero-axis t entries structurally zero. All 144 trace-cancellation checks and every overlapping transpose check pass. Zero imaginary residuals. Mass/Y reference cross polynomials evaluated at fixture; t/v reference original raw full_jets/mixed96/mixed104 strata, no placeholders. No generic tau/beta/nu comparison yet.

## Rank three pure-S complete coverage

Larger 8-left x2-mid-right block timed out without output; no mathematical RED. Split pure-S block by axes. Direct raw files: high S axis 0 plus mass/Y/v (9997deedc6c0b246b740507b312af0363878c0b9), high S axes 1,2 (ee4c28670a9eb6ef2afe12d52b1bee1b249dcfda), low S all (b542a07fe425dec669a1038a15cb691045426659). 216 exact comparisons, 90 nonzero, 162 direct and 54 transpose; 36 trace checks, all pass. Zero imaginary residuals. Comparison 76b25e1df63922a3484566953025d214aac8ab47; split-axis comparator d444b10162705769a3cd9c26795b0adbec914fb0. Scope six active S cores only; rank-three mixed and high cross-family coverage still incomplete; earlier mixed low 100-entry test remains valid.

## Next bounded decision

1080 fixture-entry comparisons covered in the current rectangular reports, 428 nonzero, 180 trace checks, zero discrepancy. These counts include overlap with prior finite tests, not 1080 wholly new independent values. Complete rank-three mixed and high blocks using smaller right sets and separated axes, then target derivative families tau/beta/nu at rank two and three (the larger physical obligation). Avoid optimizing the row count further. No fresh integration, full polynomial identification, or physical existence assertion. All algorithm functions and original JSON results committed; no standalone Node wrapper was separately run. Preserve the time limit and prior arithmetic failures; do not invoke CI for Python/JS.
