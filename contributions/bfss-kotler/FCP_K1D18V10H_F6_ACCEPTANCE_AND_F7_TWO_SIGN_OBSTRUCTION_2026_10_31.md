# K1D18V10H F6 qualification — F7 two-sign source orientation discriminator

Date October 31, 2026 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F6 accepted with exact strict evidence

- [Run #41263039600](https://github.com/etblink/math/actions/runs/41263039600) completed SUCCESS attempt 1, job `124720026156`, exact tested SHA `0e66495c570b02c51599909f51e68bea18181312`.
- Exact F6 source `SU2BFSSPairedSpin9V10HF6SourceCommutatorObstructionProbe.lean`, blob `1b4edd14c457dea12481c1b5417ccf969290ddbd`. Exact F5 predecessor recompiled; Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, fresh strict warning-as-error compiler and **five independent exact theorem-type/axiom audits** passed. Only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Accepted unconditional declarations: `gammaDetDirectHom_inv_mul`, `gammaDetDirectHom_commutator`, `source9_commutator_le_orientation`. Thus **the commutator subgroup of the genuine Mathlib `spinGroup source9Quadratic` lies in the previously qualified original orientation normal subgroup H**.
- Accepted **CONDITIONAL** declarations: `source9_orientation_eq_top_of_isPerfect` and `originalPaired48_mem_SO_of_isPerfect`, each requires an *explicitly supplied* `Group.IsPerfect (spinGroup source9Quadratic)` proof. No such source-specific perfectness has been established. CI verifies the conditional theorem types, NOT existence of their hypotheses.
- [Artifact #13066101441](https://github.com/etblink/math/actions/runs/41263039600/artifacts/13066101441) SHA-256 `5d806a467ad2906c16ff3f2504beda96970b0a331a1fbff67d17f29dfecf0843`, nonexpired at verification.
- Historical red evidence preserved: original V10H Gate1 #41257058496 and Gate2 #41257744030 (recursive composed determinant proof), F4 Gate1 #41260509990 (untransported subtype identity), F5 Gate1 #41261931766 (comment-sensitive preflight guard false positive). F1-F6 already qualified sources never modified.

## F7 — UNQUALIFIED two-sign falsifiability gate

The F7 typed experiment uses the accepted F5 `gammaDetDirectHom_sq` together with pinned Mathlib `sq_eq_one_iff` from `Mathlib/Algebra/Ring/Commute.lean` to show that **only the two real signs +1 and -1 are possible**. Five exact declarations:

1. `gammaDetDirectHom_eq_one_or_neg_one` — real sign dichotomy for every actual source Spin9 element.
2. `gammaDetDirectHom_eq_neg_one_iff_not_mem` — negative sign iff element lies outside accepted orientation subgroup H.
3. `source9OrientationSubgroup_ne_top_iff_exists_negative` — H is proper iff a negative-sign witness exists.
4. `not_source9_isPerfect_of_negative` — if such a witness is **provided**, source Spin9 cannot be perfect, consistent with accepted F6 conditional result.
5. `source9OrientationSubgroup_eq_top_iff_all_positive` — an exact iff reducing global SO48 orientation to a source-defined determinant-one statement.

These results do **not** construct a negative determinant witness, assert that one exists, or show that all source elements have sign +1. They sharpen a falsifiable research distinction without changing the mathematical problem. The pinned source `spinGroup Q` is a particular group built as the intersection of `pinGroup Q` and the Clifford-even submonoid; its perfectness must be proved for that exact structure, not inferred from generic Lie group folklore.

F7 must pass exact file hashes, strict fresh compiler, five independent type elaborations and all axiom whitelists; until then status = **CANDIDATE**. No compiler limits, new axioms, assumptions, accepted ancestor modifications, main/upstream changes, or change to original G1A paired-Fock labels. Continuity, Spin48 lift/cover, Fock implementation and BFSS physical predictions remain OPEN.
