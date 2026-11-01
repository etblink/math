# Accepted F10AC and F10AD source gamma fixed-left coefficient extraction candidate

Date 2026-11-01; branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`; parent `10ed1cb5b386afdf09c451489a08746fae0c8ce2`.

## Strict F10AC Gate 2 accepted
[Run #41339379898](https://github.com/etblink/math/actions/runs/41339379898) succeeded on the exact parent SHA, attempt 1. Source pins, frozen Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, full accepted F10AB build, fresh warning-as-error compiler, independently elaborated exact three declaration types and whitelisted root axioms passed, marker `V10H_F10AC_THREE_FIXED_LEFT_PAIR_TYPES_AXIOMS_PASS`; no sorryAx. [Artifact #13097007723](https://github.com/etblink/math/actions/runs/41339379898/artifacts/13097007723), ZIP SHA256 `5971f6f2424c4ef7e237503230ae407b26880e33cdf44ec96c4b66d65167c550`.

**Preserve negative knowledge:** F10AC Gate 1 [run #41338265065](https://github.com/etblink/math/actions/runs/41338265065) RED, deprecated `if_pos`/`if_neg` under warnings-as-errors, not an invalid theorem; repaired source branch by normal `simpa`, no statement change. [Artifact #13096756449](https://github.com/etblink/math/actions/runs/41338265065/artifacts/13096756449).

Qualified F10AC: `trace((γaγb)(γaγc)) = if b=c then -16 else 0` for `a ≠ b`; distinct right-index words are unequal and nonproportional over ℝ.

## F10AD CANDIDATE — simultaneous fixed-left finite separation
For any f : SpaceIndex → ℝ and fixed a,b with a≠b, compute the exact coefficient extractor on the REAL ORIGINAL nine gamma matrices:
`trace((γaγb) * ∑c f(c) • (γaγc)) = -16*f(b)`.
If the finite matrix sum vanishes, then all f(b) with b≠a vanish. If additionally f(a)=0, then f is the zero function. This is simultaneous independence for eight nontrivial fixed-left gamma-pair images, not pairwise-only nonproportionality.

The scalar index `c=a` gives `γaγa=I16`. The -16 trace pairing does not separate this scalar coefficient, so the source-normalization hypothesis f(a)=0 is explicit. Avoid falsely claiming all nine images independent from only nontrivial pair trace tests.

Remaining OPEN: full 36-pair Gamma orthogonality and independence, 256 even Clifford gamma-image independence/injectivity, source Spin9→paired SO48 faithfulness, global Spin48 lift, Fock implementation and BFSS physical/spectral theorem.

Reproducibility: pin original F10AC, F10AB, F10E and gamma source blobs and candidate blob; Lean 4.34.1/Mathlib frozen; rebuild ancestry, fresh strict warnings-as-errors compiler, independently elaborate exact three theorem types and axiom allowlist; preserve tested SHA and artifact. No new axioms, admits, private gamma tables, surrogate matrices or resource-limit changes. Owner research branch only, no main merge/upstream PR.
