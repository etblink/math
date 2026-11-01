# K1D18V10H — F5 ACCEPTED; F6 commutator obstruction candidate (2026-10-31 PDT)

## Strict F5 qualification

- [GitHub Actions strict run #41262335156](https://github.com/etblink/math/actions/runs/41262335156), attempt 1, completed SUCCESS, job `124717963961`, exact tested SHA `edcc562a6dcc841cd26a304b5d53ad87d1b16941`.
- Exact F5 original source `SU2BFSSPairedSpin9V10HF5TypedDirectDeterminantCharacterProbe.lean` blob `47e13c108393146c2ebb699237edb1414564d34d` (unchanged by F5 Gate2 CI preflight repair). Pinned Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; accepted original source F4 rebuild; strict warning-as-error compiler; five independently elaborated source exact types and five axiom whitelists all PASS. All exactly `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`.
- Accepted declarations: `gammaDetDirectHom`, `gammaDetDirectHom_apply`, `gammaDetDirectHom_sq`, `mem_source9OrientationSubgroup_iff_gammaDetDirectHom_one`, `gammaDetDirectHom_eq_originalPaired48_det`.
- Source exact genuine `spinGroup source9Quadratic →* ℝ` determinant map constructed directly by accepted identity/multiplication lemmas. Its values square to 1 and agree with the genuine original G1A paired-Fock 48 representation determinant. Its kernel-like one-fiber is precisely the previously qualified source orientation normal subgroup. **No triviality of the character or global SO48 claimed.**
- [Artifact #13066140284](https://github.com/etblink/math/actions/runs/41262335156/artifacts/13066140284), SHA256 `3b9f0d5b4bae9fecc4f7bb7c23667cf13838b6c14157ed448f605672183be8c2`, nonexpired when inspected.
- F5 Gate1 red [#41261931766](https://github.com/etblink/math/actions/runs/41261931766) at SHA `2106c86fea8b5f4662940238b404827e25d55067`: CI preflight false positive caused by scanning `Matrix.detMonoidHom` mentioned only in historical source comments. Its actual Lean compiler never ran. Retained artifact [#13064923957](https://github.com/etblink/math/actions/runs/41261931766/artifacts/13064923957), SHA256 `1eb91ac09f7409d147456659f001929ca8240cdec96d282c3dfe803975585cbc`. Gate2 fixed only workflow guards to scan executable code. Original nested-source V10H Gate1/Gate2 red diagnostics, F4 Gate1 identity coercion red, and successful F1-F4 records remain immutable and explicitly retained.

## F6 exact commutator obstruction — candidate

The next decisive step is to prove the genuine source Spin9 determinant character annihilates **every commutator**. The pinned Mathlib `Mathlib/GroupTheory/Commutator/Basic.lean` provides `commutatorElement_def`, `Subgroup.commutator_le`, and `commutator_def`. The pinned `Mathlib/GroupTheory/IsPerfect.lean` defines `Group.IsPerfect` with `commutator_eq_top`.

F6 tests exactly five source-typed declarations:
1. `gammaDetDirectHom_inv_mul`: direct source determinant at `g` times determinant at `g⁻¹` equals 1 (without treating ℝ itself as a group).
2. `gammaDetDirectHom_commutator`: the determinant of **each true source group commutator** equals 1 by explicit multiplication and real commutativity.
3. `source9_commutator_le_orientation`: the derived subgroup of the **actual Mathlib source `spinGroup source9Quadratic`** lies in the accepted original normal orientation subgroup.
4. `source9_orientation_eq_top_of_isPerfect`: if the **caller explicitly supplies** `Group.IsPerfect (spinGroup source9Quadratic)`, then orientation subgroup = top.
5. `originalPaired48_mem_SO_of_isPerfect`: with the **same explicitly supplied perfectness proof**, the genuine original G1A paired48 source action lies in SO48.

The mathematical important distinction is between the unconditional declarations (1–3) and strictly **conditional** consequences (4–5). Do NOT manufacture `Group.IsPerfect` as an instance: no verified source exact perfectness theorem exists in the selected pinned corpus. Do NOT mistake the standard Lie group property of Spin(9) for a Lean proof that this precise algebraic `spinGroup Q` implementation satisfies it.

F6 is **UNQUALIFIED pending strict CI**. It imports F5 and pinned Mathlib commutator/perfectness APIs; no accepted source modified, no recursion/heartbeat increase, no new axioms/sorries, no main branch or external upstream publication. Global orientation triviality, source topology/continuity, Spin48 lift/cover and BFSS original Fock/physical statements remain OPEN.
