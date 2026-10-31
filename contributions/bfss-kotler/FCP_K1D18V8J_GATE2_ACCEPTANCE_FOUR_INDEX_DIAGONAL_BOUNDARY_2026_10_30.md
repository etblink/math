# Project Lead — V8J Gate 2 STRICT ACCEPTANCE: four original paired Spin(9) diagonal-boundary roots

**Research local date:** 2026-10-30 PDT. **Strict run completed:** 2026-10-31T03:07:40Z. **Disposition:** `ACCEPTED_4_SOURCE_EXACT_ROOTS__GENERAL_FOUR_INDEX_BRACKET_OPEN`.

## Verified immutable success

- [V8J Gate 2 run #41162392473](https://github.com/etblink/math/actions/runs/41162392473), attempt 1, **completed/success** on exact SHA **`66695a35fbebba270b37a063f077f158937725d7`**; job **`124422588201`** completed/success.
- Accepted source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FourIndexDiagonalBoundaryProbe.lean`; exact Git blob **`d0fba846741de21848820f46a179d7cc0251c113`**.
- Exact source gamma, Fock paired indexing, accepted V8A and V8H ancestor SHA pins and Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` preflight **PASS**. Dependencies restored; V8H ancestor built successfully (`Build completed successfully (8953 jobs)` means dependency jobs, not accepted roots).
- Fresh `lake env lean -DwarningAsError=true` exact V8J compile **PASS**, wrote source `.olean`, four exact `#print axioms` reports.
- Independently compiled separate Lean audit has four **exact theorem-type `example`s**, four `#check`s and four `#print axioms` reports, all **PASS**; terminal marker `K1D18V8J_FOUR_SOURCE_PAIRED_DIAGONAL_BOUNDARIES_TYPES_AXIOMS_PASS`.
- Each root uses only `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, no resource limits increased.
- Compiler and separate audit artifact [#13027548700](https://github.com/etblink/math/actions/runs/41162392473/artifacts/13027548700), name `bfss-v8j-original-paired-zero-diagonal-66695a35fbebba270b37a063f077f158937725d7-1`, ZIP SHA256 **`50bef8796b8004a90fda013236b2bac8396e70213c25f96e407dcbafa26cc067`**, size 1061 bytes.

## Exact four accepted declarations

Namespace `FCP.BFSSPairedSpin9Plane`. `L(r,s) := zeroDiagonalPairedPlane r s : Matrix Source48Label Source48Label ℝ`. The source defines `zeroDiagonalFourIndexRHS r s t u` as the explicit sum of four doubled generator terms, conditioned on `s=u`, `s=t`, `r=t`, `r=u` with signs `+,-,+,-`.

1. `zeroDiagonalFourIndexRHS_left_self (r t u : SpaceIndex)`: `zeroDiagonalFourIndexRHS r r t u = 0`.
2. `zeroDiagonalFourIndexRHS_right_self (r s t : SpaceIndex)`: `zeroDiagonalFourIndexRHS r s t t = 0`.
3. `zeroDiagonalFourIndex_left_self_bracket (r t u : SpaceIndex)`: `[L_rr,L_tu] = zeroDiagonalFourIndexRHS r r t u`.
4. `zeroDiagonalFourIndex_right_self_bracket (r s t : SpaceIndex)`: `[L_rs,L_tt] = zeroDiagonalFourIndexRHS r s t t`.

These prove both diagonal-plane cases only. **No global four-index formula is accepted yet**; all non-diagonal pair coincidences and four-distinct cases must be assembled into a kernel-checked universal theorem.

## Negative knowledge and correct recovery

The earlier [V8J Gate 1 RED #41161824014](https://github.com/etblink/math/actions/runs/41161824014), tested SHA `e8f2c088861eda2ff550c75a2c773dc8cbc8b860`, failed on two strict Lean unreachable tactic errors at lines 39 and 45. Lean's `simp` had already closed the goals; trailing `<;> abel` was unreachable. Red artifact `13028175367`, SHA256 `d6acf3f12bdf404b2fcc20af057d9d307787cc6be5dfd38ca04f37b370661e2a`. Removing **only these two tactics** produced Gate 2's accepted source. Full diagnostic and a separate Git tree accidentally dropping/restoring one V8I handoff document are recorded in `FCP_K1D18V8J_GATE1_RED_CAUSAL_REVIEW_AND_GATE2_RECOVERY_2026_10_30.md`. Always build new Git trees from the **same head commit's tree**, check complete diffs after any write, preserve negative evidence. Do not disable the linter or raise proof limits.

## Current formalization frontier

V8A–V8I = 16 previously accepted roots, plus V8J = **4 new roots**, yielding **20 qualified V8A–V8J algebraic roots**. The literal original Fock paired labels and unchanged original gamma source remain authoritative. `K_rr = -I` while `L_rr = 0`; never conflate raw K with L.

**Recommended next bounded root:** source-exact same-oriented `(r,s)=(t,u)` and reversed `(r,s)=(u,t)` four-index cases, assuming `r ≠ s`. Prove explicitly `zeroDiagonalFourIndexRHS r s r s = 0` and `zeroDiagonalFourIndexRHS r s s r = 0`, then matrix commutator equals RHS in both cases. Reuse V8H `zeroDiagonalPairedPlane_self` and `zeroDiagonalPairedPlane_swap`; preserve exact types with independent Lean examples. Finally combine those, diagonal V8J, five V8I cases, and four distinct indices into a separate universal four-index theorem, including an exact axiom audit.

The complete `so(9)` Lie algebra homomorphism, global Spin(9)→Spin(48) integration, source Fock action, gauge covariance, topology and spectral BFSS existence remain unproved.

No modifications authorized to frozen FCP, `main`, or upstream mathcommunity. This acceptance record is documentary; the qualifying proof SHA stays immutable.
