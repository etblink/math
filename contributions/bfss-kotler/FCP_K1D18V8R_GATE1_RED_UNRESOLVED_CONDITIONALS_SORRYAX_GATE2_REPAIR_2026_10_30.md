# Project Lead — V8R Gate 1 RED: unresolved conditional matrix scalar transport and sorryAx

**Research-local date:** 2026-10-30 PDT; strict Gate 1 completed 2026-10-31T04:44:45Z. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`.

## Immutable failed qualification

- [V8R Gate 1 #41169217908](https://github.com/etblink/math/actions/runs/41169217908): **completed/failure** at tested SHA **`862afdf19712495da7f85e26812a75719d731c68`**, attempt 1, job **`124443325846`**.
- Candidate original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedFourIndexStructureProbe.lean`, exact source Git blob **`b26cd3eb1378d8533934255a08c487364f927447`**.
- Original Fock-paired source gamma, V8M/V8O/V8Q ancestors, Lean 4.34.1, pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 and dependency restoration all **passed**.
- First failed step: **fresh exact V8R warnings-as-errors compilation**. Independent theorem-type and axiom gate **skipped**.
- Actual Lean failure `SU2BFSSPairedSpin9NormalizedFourIndexStructureProbe.lean:37:40: error: unsolved goals`. The initial proof split on `s=u`, `s=t`, `r=t`, `r=u` (16 branches), then expanded the indexed matrices using `simp`, followed by `ring`. Lean retained conditional matrix expressions of the reverse orientation, e.g. `if u=t then ...`, and explicit `zeroDiagonalPairedPlane t t` matrix entries. `ring` cannot eliminate these residual conditional terms.
- The red source reported **`sorryAx`** for both proposed roots due to unfinished proof obligations: `normalizedFourIndexRHS_scalar_bridge` and the downstream `normalizedPairedPlane_universal_four_index_bracket`. Neither is accepted.
- Red compiler/axiom evidence preserved as [artifact #13031125112](https://github.com/etblink/math/actions/runs/41169217908/artifacts/13031125112): `bfss-v8r-original-paired-normalized-four-index-structure-862afdf19712495da7f85e26812a75719d731c68-1`, SHA256 **`c46819e6bf6367eec7f28b7e86c5a99fc0a61896424c664454bbb482588e3c89`**, size 1171 bytes.

## Bounded repair method: typed conditional scalar bridge

The mathematical target is unchanged. Define source-original `L_rs=zeroDiagonalPairedPlane r s`, `H_rs=normalizedPairedPlane r s=-(1/2) • L_rs`. Each of the four RHS terms has exactly one `H`, not a doubled `H+H`:

```text
normalizedFourIndexRHS(r,s,t,u) =
  -(if s=u then H_rt else 0)
  + (if s=t then H_ru else 0)
  - (if r=t then H_su else 0)
  + (if r=u then H_st else 0).
```

Replace the 16-case uncontrolled simplification by a *local, proposition-parametric, source-typed* helper:
```lean
have hterm (p : Prop) (a b : SpaceIndex) :
    (1 / 4 : ℝ) • (if p then L_ab + L_ab else 0) =
      -(if p then H_ab else 0) := by
  by_cases hp : p
  · simp only [if_pos hp]
    change (1/4 : ℝ) • (L_ab + L_ab) = -((-(1/2:ℝ)) • L_ab)
    ext i j
    simp only [Matrix.smul_apply, Matrix.add_apply, Matrix.neg_apply, smul_eq_mul]
    ring
  · simp [hp]
```
Here source uses the literal fully typed `zeroDiagonalPairedPlane` and `normalizedPairedPlane`. The four-index proof unfolds only the original RHS definitions, distributes `smul` over matrix addition/subtraction, rewrites four individual conditional terms with this exact helper, and finishes by **abelian-group arithmetic** `abel` rather than uncontrolled `simp` case splits. This isolates conditional logic from scalar arithmetic and avoids guessing alternate equality orientations.

- Atomic two-file source/workflow correction commit **`8838e6acd4f2ebd497b22e8e274aacc99e78fb2f`** based on the exact current parent SHA/tree, source Git blob **`42c7a72271e3fdd67c976bfadf9626f4e5cb7f4f`**, workflow blob **`00dd6df1d9e59f8d590ab93c7212158a61fc63e9`**. Complete Git diff compared against previous documentary HEAD showed only **V8R source proof and one workflow source-pin line**; no accepted ancestor edits, file deletions or upstream changes.
- [V8R Gate 2 #41169903407](https://github.com/etblink/math/actions/runs/41169903407) triggered at this exact correction SHA. It is **PENDING**; do not count either new root until the full strict gate passes: terminal success, exact tested SHA and source blob, independent imported theorem-type `example`s, `#print axioms` whitelist no `sorryAx`, evidence digest.

## Negative knowledge preserved and boundaries

V8J Gate 1 red: unreachable `abel`; V8L Gate 1 red: unused `simp` facts under warning-as-error; V8O Gate 1 red: symmetric orientation rewriting entered a `simp` loop, causing recursion error and `sorryAx`; V8R Gate 1 red: over-expanded conditionals left goals that `ring` cannot close, causing `sorryAx`. Separate these failure classes and prefer small typed intermediate lemmas, explicit `change`/`rw`, and exact source boundaries to higher recursion or heartbeat limits.

V8A–V8Q have **37 source-exact accepted algebraic roots**. A successful V8R would add exactly **two**, but it would **not** establish an arbitrary-matrix Lie algebra homomorphism or continuous global Spin(9) lift. The original Fock operator implementation, gauge covariance and BFSS spectra remain unproved. No modifications to frozen FCP, accepted ancestors, `main`, or mathcommunity upstream; no upstream PR without owner authorization.

This is the red causal report and corrective plan, not an acceptance certificate.
