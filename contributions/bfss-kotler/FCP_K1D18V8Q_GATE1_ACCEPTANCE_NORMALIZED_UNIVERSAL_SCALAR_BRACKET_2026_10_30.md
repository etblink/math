# Project Lead — V8Q Gate 1 ACCEPTED: all-indices normalized scalar bracket

**Research local date:** 2026-10-30 PDT; strict GitHub Actions completed 2026-10-31T04:33:56Z. **Disposition:** `ACCEPTED_ONE_SOURCE_EXACT_UNIVERSAL_NORMALIZED_SCALAR_ROOT__TYPED_LIE_MAP_OPEN`.

## Immutable qualification

- [V8Q strict Gate 1 run #41168504460](https://github.com/etblink/math/actions/runs/41168504460), attempt 1, **completed/success** at exact tested commit **`d4775599cef07ce3dcc620e6e0606e0779d67ae8`**; job **`124441161206`** completed/success.
- Exact Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedUniversalScalarBracketProbe.lean`, Git blob **`bf441cca38636920498b6283ca178aa82aa0b2a3`**.
- Source-original paired-Fock `Source48Label`, real gamma, previously accepted V8M/V8O/V8P ancestors, Lean `leanprover/lean4:v4.34.1` and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` preflight **PASS**.
- Dependency restore and accepted ancestors compiled **PASS**, build logged `Build completed successfully (8966 jobs)` (build jobs, **not** newly qualified roots).
- Fresh warnings-as-errors exact source compilation emitted an `.olean`, **PASS**; one exact `#print axioms` declaration-level report.
- Separate fresh warnings-as-errors Lean import audit instantiated one independent, exact theorem-type `example`, one `#check`, and one `#print axioms` **PASS**; terminal marker **`K1D18V8Q_SOURCE_EXACT_NORMALIZED_UNIVERSAL_SCALAR_BRACKET_AXIOMS_PASS`**.
- Axiom whitelist **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, `sorry`, new axioms or raised proof limits.
- [Preserved compiler/audit artifact #13030526434](https://github.com/etblink/math/actions/runs/41168504460/artifacts/13030526434): `bfss-v8q-original-paired-normalized-universal-scalar-bracket-d4775599cef07ce3dcc620e6e0606e0779d67ae8-1`, ZIP SHA256 **`874a2c3f6f094af6858d7c02b83436a10e88ec6ea40048b0072dff0843e67764`**, size **991 bytes**.

## Exact accepted theorem

`FCP.BFSSPairedSpin9Plane.normalizedPairedPlane_universal_scalar_bracket`:
```lean
(r s t u : SpaceIndex) :
    normalizedPairedPlane r s * normalizedPairedPlane t u -
      normalizedPairedPlane t u * normalizedPairedPlane r s =
    (1 / 4 : ℝ) • zeroDiagonalFourIndexRHS r s t u
```

On **the actual original Fock-paired 48-real labels**, `H_rs=normalizedPairedPlane r s:=-(1/2:ℝ)•L_rs`, and `L_rs=zeroDiagonalPairedPlane r s`. The scalar identity `[H_rs,H_tu]=(1/4)•R_L(r,s,t,u)` holds **for all four spatial indices without pairwise distinctness**. It is a matrix-algebra result, not a Lie homomorphism or group-level claim.

## Next exact bounded research obligation

**V8R:** introduce the explicit normalized-index RHS
```text
-(if s=u then H_rt+H_rt else 0)
+ (if s=t then H_ru+H_ru else 0)
- (if r=t then H_su+H_su else 0)
+ (if r=u then H_st+H_st else 0).
```
The signs follow from `(1/4)*(2L)=+(1/2)L=-H` for each positively signed L term, and the opposite for negatively signed L terms. Prove one (or split into two) source-exact **typed scalar transport** identity from `(1/4)•zeroDiagonalFourIndexRHS` to this normalized RHS; then establish `[H_rs,H_tu]=R_H` using accepted V8Q. **Do not claim** a typed `so(9)→so(48)` Lie homomorphism solely from this generator bracket; build its linear extension and check arbitrary bracket preservation separately. Explicitly scrutinize the conventional `F_{rs}=E_{rs}-E_{sr}` basis and sign convention before claiming any compatibility.

Preserve prior red diagnostics: V8J unreachable `abel`, V8L unused simp arguments, V8O recursively looping orientation rewrite and red `sorryAx` (all corrected under independent strict gates). Do not edit frozen accepted source blobs, FCP, `main` or mathcommunity upstream. This acceptance note is documentary, not another mathematical proof.
