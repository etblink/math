# Project Lead — V8F Gate 1 accepted: exact original paired 48-label shared-left bracket

**Research local date:** 2026-10-30 (UTC strict run completed 2026-10-31T00:01:16Z). **Disposition:** `ACCEPTED_1_ORIGINAL_SOURCE_LEAN_ROOT__NO_GLOBAL_SPIN9_LIFT`.

## Immutable strict acceptance

- [GitHub Actions V8F Gate 1 #41147101382](https://github.com/etblink/math/actions/runs/41147101382), **completed/success**, attempt 1, tested commit **`c612d65b20636d2cbbeca798d3e46a86607b546b`**, job **124374641866**, **completed/success**.
- Exactly qualified candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SharedLeftBracketProbe.lean`, Git blob **`ce5cdc1d8073262b867fc705e0adc4f0ac5e743e`**.
- Exact source gamma, original paired labels, V8A/V8B/V8D theorem pins **PASS**; pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` **PASS**. Pinned dependency restore and both original V8B/V8D ancestor compilation **PASS**. Log reports `Build completed successfully (8953 jobs)`, which means **dependency build jobs**, not newly qualified declarations.
- Fresh V8F candidate `lake env lean -DwarningAsError=true` compile **PASS**, with new `.olean`; exactly one source theorem-axiom report.
- Independent separately compiled Lean `example` restating the full source-original 48-label theorem type, along with `#check` and `#print axioms`, **PASS**. Terminal marker `K1D18V8F_EXACT_ONE_ORIGINAL_SOURCE_SHARED_LEFT_ROOT_AXIOMS_PASS`.
- Exact declaration `FCP.BFSSPairedSpin9Plane.originalPairedPlane_shared_left_bracket` reports only `propext`, `Classical.choice`, `Quot.sound`; **no sorryAx**, no higher resource limits.
- [Immutable artifact #13021633080](https://github.com/etblink/math/actions/runs/41147101382/artifacts/13021633080), name `bfss-v8f-original-paired-shared-left-c612d65b20636d2cbbeca798d3e46a86607b546b-1`, zip SHA256 **`4c698d5be33bd651ca38765ff69097a6c023f86072d4235beaca0dcc5c809940`**, 975 bytes; contains compiler and separate axiom-audit logs.

## Qualified theorem, mathematical notation and boundary

```lean
FCP.BFSSPairedSpin9Plane.originalPairedPlane_shared_left_bracket
  (r s t : SpaceIndex) (hrs : r ≠ s) (hrt : r ≠ t) (hst : s ≠ t) :
  originalPairedPlane r s * originalPairedPlane r t -
    originalPairedPlane r t * originalPairedPlane r s =
    originalPairedPlane s t + originalPairedPlane s t
```

Hence `[K_rs, K_rt] = +2 K_st` for pairwise distinct spatial labels, on the **actual original** `Source48Label` (not a color-major substitute). The proof reuses the accepted adjacent-plane V8B and orientation V8D results; this is the doubled-generator normalization. Independent complete Lie algebra identity, original B-tensor covariance, a continuous Lie-group hom, Spin(9) global Fock lift and BFSS spectra remain unproved.

## Accepted program and next interface

- V8A [#41141833097](https://github.com/etblink/math/actions/runs/41141833097): two generator roots (skewness and negative square).
- V8B [#41143495333](https://github.com/etblink/math/actions/runs/41143495333): adjacent bracket (one).
- V8C [#41144471425](https://github.com/etblink/math/actions/runs/41144471425): four-distinct disjoint bracket (one).
- V8D [#41145356613](https://github.com/etblink/math/actions/runs/41145356613): order reversal (one).
- V8E [#41146209816](https://github.com/etblink/math/actions/runs/41146209816): shared right bracket (one).
- V8F [#41147101382](https://github.com/etblink/math/actions/runs/41147101382): shared left bracket (one).

**Seven source-exact new algebraic roots are accepted.** These establish three shared-index orientations and a disjoint case. Remaining fourth shared-index orientation `[K_rs, K_tr]=-2 K_st` should be proved by V8F + V8D as a small bounded next root.

**Critical representation-domain boundary:** the raw V8A function `originalPairedPlane r r = -I` on diagonal input, not zero. Therefore **do not write a blanket so(9) bracket law on the raw `K_{rs}` for arbitrary index coincidences**. First develop a distinct-index/zero-diagonal `L_{rs}` interface with exactly the source 48-label matrix, then derive any complete relation under a correct normalized basis; preserve the Fock pairing. Negative knowledge is useful: off-diagonal Lie brackets cannot be extended unguardedly to the raw diagonal `K`.

No edits to original qualified proofs, `main`, frozen FCP or upstream. This is a documentary record after the qualified tested commit, not itself strict proof acceptance.
