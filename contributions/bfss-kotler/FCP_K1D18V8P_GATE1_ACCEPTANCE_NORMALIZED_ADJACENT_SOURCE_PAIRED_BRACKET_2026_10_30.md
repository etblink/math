# Project Lead — V8P Gate 1 ACCEPTED: normalized adjacent original-paired Spin(9) bracket

**Research-local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T04:23:59Z. **Disposition:** `ACCEPTED_ONE_SOURCE_EXACT_NORMALIZED_ADJACENT_ROOT__FULL_LIE_MAP_OPEN`.

## Immutable strict verification

- [V8P Gate 1 #41167800682](https://github.com/etblink/math/actions/runs/41167800682), attempt 1 **completed/success** on exact tested SHA **`03a15f92e30ac7fc6c67be1307cac835920cd80d`**, job **`124439042169` completed/success**.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedAdjacentBracketProbe.lean`, exact Git blob **`8ffeb7c8a369f356837c47b2e514175f24c897f4`**.
- Pinned original Fock-paired Source48Label, source gamma, accepted V8I/V8N/V8O ancestors, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` verified.
- Dependencies restored and accepted originals compiled, log `Build completed successfully (8965 jobs)`. This is dependency work count, **not** theorem-root count.
- Fresh source `lake env lean -DwarningAsError=true` compiled **PASS** with original source `.olean`.
- Independent imported Lean audit checked one exact theorem `example`, `#check`, and `#print axioms` **PASS**. Terminal marker `K1D18V8P_SOURCE_EXACT_NORMALIZED_ADJACENT_BRACKET_TYPE_AXIOMS_PASS`.
- Accepted declaration depends only on **`[propext, Classical.choice, Quot.sound]`**. No `sorryAx`, new axioms, increased proof limits or disabled linters.
- Preserved artifact [#13030545470](https://github.com/etblink/math/actions/runs/41167800682/artifacts/13030545470), name `bfss-v8p-original-paired-normalized-adjacent-bracket-03a15f92e30ac7fc6c67be1307cac835920cd80d-1`, SHA256 **`9338628cdac7211b65aef470ace179197929c206714c5306b88da142b6753fc3`**, size 977 bytes.

## Precisely qualified theorem

In `FCP.BFSSPairedSpin9Plane`, `normalizedPairedPlane_adjacent_bracket`:
```lean
(r s t : SpaceIndex) (hrs : r ≠ s) (hst : s ≠ t) (hrt : r ≠ t) :
    normalizedPairedPlane r s * normalizedPairedPlane s t -
      normalizedPairedPlane s t * normalizedPairedPlane r s =
    normalizedPairedPlane r t
```

The original-label `H_rs = normalizedPairedPlane r s := -(1/2 : ℝ) • L_rs`, with `L=zeroDiagonalPairedPlane`. From accepted V8I `[L_rs,L_st]=-2 L_rt`, scalar bilinearity gives `[H_rs,H_st]=(-1/2)^2(-2L_rt)=-(1/2)L_rt=H_rt`. The proof uses typed `Matrix.smul_mul`, `Matrix.mul_smul`, `smul_smul`, `smul_sub` and entrywise ring normalization in Lean, not unproved source label reindexing.

This is an **adjacent-only** bracket for three pairwise-distinct indices. It is not a universal normalized commutator theorem and does not construct a linear map `so(9)→so(48)`, prove bracket preservation for arbitrary skew matrices, give a global Spin(9) group action or BFSS spectrum.

## Strict ledger and next bounded research

V8A–V8O = **35 accepted roots**, V8P adds **1**, cumulative **36 accepted source-exact algebraic roots**.

**V8Q next:** use the accepted V8M all-indices `[L_rs,L_tu]=zeroDiagonalFourIndexRHS r s t u` and V8P's typed matrix scalar technique to prove the universal normalized scalar-bridge identity
```text
[H_rs,H_tu] = (1/4 : ℝ) • zeroDiagonalFourIndexRHS r s t u
```
for all four spatial indices. A separately stated standard four-delta expression in H, with correct sign reversal from the original L bracket, should be qualified in another narrow step if necessary. The correct standard form is
```text
[H_rs,H_tu] = -δ_su H_rt + δ_st H_ru - δ_rt H_su + δ_ru H_st.
```
Do not treat these equivalent analytic expressions as already Lean-certified until named source-exact theorems and independent audits pass. Next, construct an actual typed Lie algebra homomorphism, rather than claiming one from generator relations alone.

Preserve V8J, V8L, V8O red-run negative knowledge and exact-source evidence. No changes to accepted source blobs, frozen FCP, `main` or mathcommunity upstream. This record is documentary, not an added theorem.
