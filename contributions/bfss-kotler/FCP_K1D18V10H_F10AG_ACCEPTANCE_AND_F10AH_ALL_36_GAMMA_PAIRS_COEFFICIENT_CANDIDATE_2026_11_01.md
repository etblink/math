# Accepted F10AG and F10AH original 36 gamma-pair simultaneous coefficient extraction candidate

Research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`, 2026-11-01, accepted parent `a7bfcf56ef235420b7fd0f35f17e6dc703fef260`.

## F10AG accepted: source-exact all-ordered-pair trace Gram formula
[Strict run #41346486602](https://github.com/etblink/math/actions/runs/41346486602) succeeded attempt 1 at the exact parent SHA. All original gamma source hash pins, frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, F10AF ancestry, fresh warnings-as-errors Lean compilation, both exact independent declaration-type and axiom audits passed; marker `V10H_F10AG_TWO_ORDERED_PAIR_GRAM_TYPES_AXIOMS_PASS`. Allowed only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. [Artifact #13099269739](https://github.com/etblink/math/actions/runs/41346486602/artifacts/13099269739), ZIP sha256 `10ea465027595d760caa8068e939bc0b69673fe6a68dbbf7592c74c348a9944e`.

Original source theorem scope: for a<b and c<d on actual `SpaceIndex=Fin 9`, the trace of the product of original gamma pair matrices is -16 for the same ordered pair, zero for distinct ordered pairs. This is the full 36×36 signed source Gram delta, not merely fixed-left orthogonality. It DOES NOT alone yet establish the formally checked all-pair coefficient-injectivity theorem.

## F10AH CANDIDATE — simultaneous all-36 original pair coefficient separation
Define the actual subtype `Source9OrderedGammaPairIndex = {p:SpaceIndex×SpaceIndex // p.1 < p.2}`, and its original gamma image `source9OrderedGammaPairMatrix p = gamma p.val.1 * gamma p.val.2`. The finite canonical pair subtype has 36 members; no private index arrays, surrogate gamma tables or guessed word indexing.

Prove three exact source declarations:

1. `source9OriginalGamma_ordered_pair_subtype_trace_gram`: for p,q of the subtype, trace(word(p)*word(q)) is -16 if p=q, else zero, directly from ACCEPTED F10AG source.
2. `source9OriginalGamma_all_ordered_pairs_trace_extract`: for ANY f on the full subtype and any p, trace(word(p)*∑q f(q)•word(q)) = -16*f(p). Uses pinned `Matrix.mul_sum`, `Matrix.trace_sum` and the exact source Gram delta, mirroring qualified F10AD coefficient extraction but now across all 36 pairs.
3. `source9OriginalGamma_all_ordered_pairs_coeff_function_zero`: if the full finite original gamma matrix combination is zero, then f=0, simultaneously for ALL 36 canonical words.

The third is a stronger truth claim than pairwise inequality or an 8-word subfamily; it explicitly proves coefficient uniqueness for the full 36-element source family. It does not by itself use Mathlib's `LinearIndependent` predicate (separate next source-exact bridge), and DOES NOT establish all 256 even Clifford gamma basis independence, original even Clifford gamma AlgHom injectivity, source Spin9 faithfulness, global Spin48 lift, Fock action or BFSS spectral existence.

Strict gate: exact source pins F10E/F10AG and F10AH, frozen Lean and Mathlib, full qualified F10AG rebuild, fresh warning-as-error compiler, independent three source-exact declaration types and root axiom checks, immutable tested SHA/artifact. Preserve `sorryAx` failures as negative knowledge. No upstream PR, main merge, private gamma matrices, weakened statements, new axioms or raised limits.
