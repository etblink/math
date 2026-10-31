# Project Lead — V8O Gate 1 RED: simp rewrite cycle, recursion failure and sorryAx

**Research-local date:** 2026-10-30 PDT (run completed 2026-10-31T04:03:41Z). **Disposition:** `GATE1_RED_PRESERVED__GATE2_UNQUALIFIED`.

## Exact immutable red gate

- [GitHub Actions V8O Gate 1 #41166433825](https://github.com/etblink/math/actions/runs/41166433825) attempt 1, `completed/failure`, exact tested SHA **`4aaf7881f28b085ced42f15ec57c7afbe061bd6e`**, job **`124434901405`**.
- Candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedPlaneInterfaceProbe.lean` exact source blob **`2ea8b927ee3df2c81d3e5d3cf34eeabb916edcdb`**.
- Exact source-pin preflight, pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore, and accepted original source V8N ancestor compilation **PASSED**.
- First failing step: `Fresh compile exact V8O source with warnings as errors`. Independent theorem-type and axiom verification **SKIPPED**.
- At line 37 in `normalizedPairedPlane_swap`, `simp only [normalizedPairedPlane, zeroDiagonalPairedPlane_swap, smul_neg]` entered a rewrite cycle. Exact messages: `Possibly looping simp theorem: normalizedPairedPlane.eq_1`, `Possibly looping simp theorem: zeroDiagonalPairedPlane_swap`, and `Tactic simp failed with a nested error: maximum recursion depth has been reached`.
- This is a real **unproved theorem declaration**, not just a lint finding: the red source's `#print axioms normalizedPairedPlane_swap` included **`sorryAx`** alongside `propext`, `Classical.choice`, `Quot.sound`. The other two printed theorem axioms were standard. **Reject the three-root gate as a whole** until a fresh strict run passes and independent audit confirms exact names and no `sorryAx`.
- Retained [red compiler artifact #13029830045](https://github.com/etblink/math/actions/runs/41166433825/artifacts/13029830045), ZIP SHA256 **`28b5138a0b4c0c1072d3e9860a4735d27e566b139504d40a831961eb4669d63b`**, size **768 bytes**.

## Bounded source-exact correction — no limit increases

Original lemma's **statement unchanged**:
```lean
theorem normalizedPairedPlane_swap (r s : SpaceIndex) :
    normalizedPairedPlane s r = -(normalizedPairedPlane r s)
```

The unsound/looping tactic attempt was replaced with the explicitly typed directed bridge:
```lean
  change (-(1 / 2 : ℝ)) • zeroDiagonalPairedPlane s r =
    -((-(1 / 2 : ℝ)) • zeroDiagonalPairedPlane r s)
  rw [zeroDiagonalPairedPlane_swap r s, smul_neg]
```

This uses **exactly one** directed original-label V8H swap, then the scalar-negation rewrite. It does not add `simp` rules, suppress any linter, raise recursion limits, change original gamma data or rewrite the accepted V8N theorem. All three proposed V8O statements, including the `H_rs = -(1/2) • L_rs` definition, remain unchanged.

- Corrected source Git blob: **`a217471af24ba8c086746d8ade85d1337a1b66d6`**.
- Companion workflow Git blob: **`5bfe856867b8be252aab5eeae8e71923d1cd235d`**; only the new candidate source hash was substituted. No ancestor pins or checker steps changed.
- Atomic two-file fast-forward correction from the **immediate parent SHA and its own tree**: commit **`a7806398f0b151aeb6b79b238dd7da45a048dec0`**. Full `compare_commits` against the red SHA shows **only V8O source and its strict workflow changed**, with no deleted acceptance notes or edits to accepted roots.
- [V8O Gate 2 #41167033127](https://github.com/etblink/math/actions/runs/41167033127) triggered on this exact SHA. **No acceptance until** terminal successful strict compilation, source/type audit of all three exact propositions, three allowed-axiom declarations without `sorryAx`, and preserved artifact digest.

## Research integrity and procedural lessons

1. **Never use `simp` with an orientation-swap theorem that rewrites both directions.** A symmetric rewrite is a poor simplification rule and can lead to loops. Prefer `change` to establish precise source-native types followed by one explicitly oriented `rw [lemma r s]`.
2. A declaration appearing in the `#print axioms` output does **not** mean it was proved; `sorryAx` on a red compiler run is direct evidence it was not. Treat the run's exit status and the independent audit as essential qualification gates.
3. This obstruction differs from V8J's unreachable `abel` lint and V8L's redundant `simp` arguments; preserve these distinct failure classes in the negative knowledge corpus.
4. Maintain exact original Fock-paired `Source48Label`, no color-major basis assumptions, and no new axioms, `sorry`, `admit`, `maxRecDepth` or heartbeat overrides.
5. Accepted V8A–V8N: **32 strictly qualified roots**. V8O's three candidate roots are **UNQUALIFIED** pending the corrected gate.
6. A normalized generator family, even if accepted, does not yet constitute a genuine typed `so(9) → so(48)` Lie algebra homomorphism, global Spin(9) lift, source Majorana Fock action, or BFSS physical theorem.

This is an immutable failure-and-recovery record, not an acceptance certificate.
