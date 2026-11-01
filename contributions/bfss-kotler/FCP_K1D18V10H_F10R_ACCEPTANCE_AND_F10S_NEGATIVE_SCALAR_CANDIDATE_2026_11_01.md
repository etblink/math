# K1D18V10H–F10R acceptance and F10S negative Clifford scalar action

**Date:** 2026-11-01. **Owner research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
**F10S parent:** `4e79469dae20001d8fcab770b5baae62d50afa22`.

## F10R — ACCEPTED with exact original paired-label scope

[Strict run #41287580971](https://github.com/etblink/math/actions/runs/41287580971) completed **success**, exact tested SHA `4e79469dae20001d8fcab770b5baae62d50afa22`, exact source blobs and pinned Lean v4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Fresh `-DwarningAsError=true` compiler and three independent declaration type/axiom audits passed; token `V10H_F10R_THREE_SO48_EXACT_TYPES_AXIOMS_PASS`. All three roots allow only `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx`.

Accepted `FCP.BFSSPairedSpin9Clifford`:
- `source9SpinOriginalPaired48_mem_specialOrthogonal`;
- `source9SpinOriginalPaired48SpecialOrthogonalHom`;
- `source9SpinOriginalPaired48SpecialOrthogonalHom_apply`.

Evidence: [artifact #13076326213](https://github.com/etblink/math/actions/runs/41287580971/artifacts/13076326213), SHA-256 `321225aa5deb383ab4fee7d11b2f4e3f26024f8763efe74fdbc104dc3c5e9a91`.

## F10S — CANDIDATE, not accepted before its own strict run

The next important obstruction is what the source Spin9 central negative Clifford scalar does on the original 48-dimensional representation. Follow the proven original Spin48 K1D9 membership pattern, but **DO NOT** smuggle negative-one membership into this gate: source dimensions and source Q are distinct.

Bounded first stage (four independently audited declarations):
1. `source9GammaCliffordAlgHom_neg_one`: original Clifford scalar -1 maps to negative identity in original 16 real gammas, using `map_neg` and `map_one`.
2. `gamma16ToOriginalPaired48_neg`: exact original paired-label Kronecker transport preserves negation, using an entrywise typed lemma and the accepted `Matrix.reindexRingEquiv`.
3. `source9OriginalPaired48_neg_scalar_matrix`: compose (1) and (2) with V10F's accepted `gamma16ToOriginalPaired48_one`.
4. `source9SpinOriginalPaired48SOHom_neg_scalar_of_mem`: the exact original SO48 image of an arbitrary *actual* source Spin9 element **if** its underlying Clifford element is -1, not an invented such element.

On red: inspect first compiler/audit diagnostic and repair precisely; preserve evidence. No warning suppression, increase of limits, new axioms, private gamma table, wrong paired-label permutation, guessed API or source reinterpretation.

Still open: actual source Spin9 `-1` membership proof and explicit construction; this could use the successful K1D9 two-opposite-unit-vector approach after verifying source9 unit-coordinate witnesses. Global Spin48 lift/cover, continuity, Fock implementer, gauge invariance and BFSS spectral claims remain distinct. FCP scientific state remains independent. No merge/main/upstream publication.
