# Project Lead — K1D18V8C Gate 1 accepted: disjoint Spin(9) planes on original paired labels

**UTC date:** 2026-10-30. **Final disposition:** `ACCEPTED_1_SOURCE_EXACT_LEAN_ROOT__NOT_FULL_LIE_REPRESENTATION`.

## Immutable strict verification

- [GitHub Actions strict Gate 1 run #41144471425](https://github.com/etblink/math/actions/runs/41144471425) **completed/success**, attempt 1, updated 2026-10-30T23:33:33Z; job **124366201487** completed/success.
- Exact tested commit on `research/fcp-k1d17-ancestor-cache-pilot-20261028`: **`06e5b4045a552b46e2d32616a563adf5dbee1931`**.
- Exactly qualified Lean candidate: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9DisjointLieBracketProbe.lean`, immutable Git blob **`fd66cbfb575b9e511769d3ceeab73556e77bc409`**.
- Exact preflight pinned original paired labels, source gamma file, accepted V8A and V8B original-source modules; pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. All original pinned checks **PASS**.
- Dependency restore **PASS**; imported original V8A ancestor `lake build` **PASS**, with `Build completed successfully (8951 jobs)`. This is a dependency build job count, **not** 8951 new theorem roots.
- Fresh V8C module `lake env lean -DwarningAsError=true` **PASS**, new `.olean` produced. Exactly one source root axiom report.
- Independent `lake env lean -DwarningAsError=true` **PASS**, with a freshly written Lean `example` checking the exact source-original theorem proposition, `#check` and `#print axioms`.
- Terminal validator marker: `K1D18V8C_EXACT_ONE_ORIGINAL_SOURCE_DISJOINT_ROOT_AXIOMS_PASS`. The root depends only on `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`, warnings-as-errors passed; no proof-limit raising.
- Preserved [compiler and audit artifact #13020795214](https://github.com/etblink/math/actions/runs/41144471425/artifacts/13020795214) named `bfss-v8c-original-paired-disjoint-06e5b4045a552b46e2d32616a563adf5dbee1931-1`; zip SHA256 **`3999c6d4b6c7afd74e5065ec95e9ce9bd8ba6ffabbc925385aa502ddf441f63c`**, 990 bytes.

## Exactly qualified mathematical statement

`FCP.BFSSPairedSpin9Plane.originalPairedPlane_disjoint_bracket`:

```lean
(r s t u : SpaceIndex)
(_hrs : r ≠ s) (_htu : t ≠ u)
(hrt : r ≠ t) (hru : r ≠ u) (hst : s ≠ t) (hsu : s ≠ u) :
originalPairedPlane r s * originalPairedPlane t u -
  originalPairedPlane t u * originalPairedPlane r s = 0
```

This is `[K(r,s),K(t,u)] = 0` for four pairwise distinct spatial indices, with **the actual original paired-Fock `Source48Label = Fin24 × Fin2`**, actual source gamma and exact accepted V8A `pairedColorSpinEquiv`. No fake color-major identification or tensor-field surrogate.

The independently executed exact-integer source gamma computation checked **3024** ordered four-distinct-index combinations, with **zero mismatches**. It is a finite corroboration, not a Lean replacement.

## Accepted cumulative scope and remaining frontier

- V8A: `originalPairedPlane_transpose` and `originalPairedPlane_sq` strictly qualified, two roots, [#41141833097](https://github.com/etblink/math/actions/runs/41141833097).
- V8B: `originalPairedPlane_adjacent_bracket` for pairwise distinct `r,s,t`, one root, [#41143495333](https://github.com/etblink/math/actions/runs/41143495333).
- V8C: `originalPairedPlane_disjoint_bracket` for pairwise distinct `r,s,t,u`, one root, [#41144471425](https://github.com/etblink/math/actions/runs/41144471425).

**Total new accepted V8A/V8B/V8C roots = 4**, counted separately from existing imported mathematical/physics roots. V8C settles **only the disjoint-plane case**, and V8B settles one orientation of a shared-index bracket. Antisymmetry under index swap, all shared-index orientation cases, the full source-exact `so(9)` commutator and exact source B-tensor intertwining remain separate.

Do not promote these to a continuous group homomorphism / full Spin(9)→Spin(48) lift, topological covering, global Fock implementation or BFSS physical spectral result. All remain unproved.

## Next isolated proof architecture

The next minimally necessary algebraic bridge is `originalPairedPlane s r = -(originalPairedPlane r s)` for distinct indices, deduced from exact `gamma_clifford` and carried through `1 ⊗ₖ` and the **same** `Matrix.reindexRingEquiv`. Use this to reduce other adjacent orientations to the accepted V8B result. Do not change accepted roots and do not launch larger `so(9)` or B-tensor tests until these bridges are independently qualified. Exact finite gamma tests can validate signs but must never replace fresh Lean proof/type/axiom gates.

**Research-control policy:** original accepted sources, FCP, `main`, and upstream are not modified. This record is documentary and its SHA must not be confused with the exact tested commit.
