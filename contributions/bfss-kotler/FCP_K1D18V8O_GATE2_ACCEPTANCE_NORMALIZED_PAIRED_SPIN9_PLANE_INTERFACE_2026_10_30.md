# Project Lead — V8O Gate 2 ACCEPTED: exact normalized paired Spin(9) interface

**Research-local date:** 2026-10-30 PDT. **Completed terminal GitHub Actions:** 2026-10-31T04:13:26Z. **Disposition:** `ACCEPTED_3_EXACT_LEAN_NORMALIZED_MATRIX_ROOTS__LIE_MAP_OPEN`.

## Immutable strict verification certificate

- [V8O Gate 2 #41167033127](https://github.com/etblink/math/actions/runs/41167033127), attempt **1**, **completed/success**, strict job `124436706984` **completed/success**.
- Exact tested Git SHA **`a7806398f0b151aeb6b79b238dd7da45a048dec0`** on branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedPlaneInterfaceProbe.lean`, exact Git blob **`a217471af24ba8c086746d8ade85d1337a1b66d6`**.
- Exact source original gamma, original `Source48Label` paired crosswalk, V8A/V8H/V8M/V8N ancestors and Lean `leanprover/lean4:v4.34.1` / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pins **PASS**.
- Pinned dependencies restored and accepted V8N ancestor compiled **PASS**; `Build completed successfully (8964 jobs)` counts build jobs, not accepted roots.
- Fresh candidate `lake env lean -DwarningAsError=true` **PASS**, actual source `.olean` and three `#print axioms` records.
- Independent source-imported Lean audit **PASS**, independently stated **3** exact theorem-type `example`s, `#check`s and `#print axioms`. Marker **`K1D18V8O_THREE_SOURCE_EXACT_NORMALIZED_PLANE_ROOTS_PASS`**.
- All 3 declarations use **only `[propext, Classical.choice, Quot.sound]`**. No `sorryAx`, `sorry`, `admit`, increased limits or disabled linters.
- [Evidence artifact #13029636748](https://github.com/etblink/math/actions/runs/41167033127/artifacts/13029636748), name `bfss-v8o-original-paired-normalized-plane-interface-a7806398f0b151aeb6b79b238dd7da45a048dec0-1`, ZIP SHA256 **`5425d2265e2b3c6f9175c4fdb17d566cb7552df1feaceefeaa89636fdd7c7b20`**, 963 bytes.

## Exact accepted scope

`H_rs := normalizedPairedPlane r s = -(1/2 : ℝ) • zeroDiagonalPairedPlane r s : Matrix Source48Label Source48Label ℝ`. Native Fock-paired real 48 labels, not a convenient color-major surrogate.

1. `normalizedPairedPlane_self r`: `H_rr=0`.
2. `normalizedPairedPlane_swap r s`: `H_sr = -H_rs` for all indices.
3. `normalizedPairedPlane_transpose r s`: `(H_rs).transpose = -H_rs` for all indices.

These guarantee the correctly signed, normalized skew-symmetric generator **family** only. No normalized bracket, linear extension, Lie homomorphism, continuous group integration, source Fock implementation, gauge-covariance result, global Spin(9) lift or BFSS spectral theorem has been qualified.

The normalization is mathematically motivated by the V8M exact original-label bracket `[L_rs,L_st]=-2L_rt` (for distinct r,s,t); for standard `F_rs=E_rs-E_sr` the adjacent bracket is `[F_rs,F_st]=F_rt`, so `F_rs ↦ -(1/2)L_rs` has the correct sign and scale *if* the relevant scalar/bilinear algebra is explicitly proved in Lean.

## Retained failure and success contrast

Earlier [V8O Gate 1 RED #41166433825](https://github.com/etblink/math/actions/runs/41166433825) on SHA `4aaf7881f28b085ced42f15ec57c7afbe061bd6e` failed `normalizedPairedPlane_swap` due to a looping symmetric simp theorem, maximum recursion depth, and a **`sorryAx`** report. The rejected first candidate was `2ea8b927ee3df2c81d3e5d3cf34eeabb916edcdb` with red artifact `13029830045`, digest `sha256:28b5138a0b4c0c1072d3e9860a4735d27e566b139504d40a831961eb4669d63b`. The successful source replaces only this proof with `change` and directed `rw [zeroDiagonalPairedPlane_swap r s, smul_neg]`, with no signature/limit changes. Full negative-knowledge incident: `FCP_K1D18V8O_GATE1_RED_SIMP_LOOP_SORRYAX_AND_GATE2_REPAIR_2026_10_30.md`.

Other red lessons: V8J unreachable trailing `abel`, V8L unused explicit `simp` hypotheses, V8O looping symmetric simp, plus a V8J Git tree base mismatch that was repaired and whose precedent requires exact parent/tree matching and mandatory whole-diff review.

## Ledger and next exact bounded obligation

V8A–V8N **32** accepted source-exact algebra roots plus V8O **3** = **35 new source-exact roots**.

**Next V8P:** one source-original, pairwise-distinct **adjacent-plane normalized commutator** `[H_rs,H_st]=H_rt`. Reuse the accepted V8I adjacent L bracket and a precise typed matrix scalar bridge; check sign and factor `(-1/2)^2(-2)=-1/2`. Keep the statement independent from any unfinished standard `so(9)` to `so(48)` linear map, use a separate independent type and axiom gate, and explicitly preserve red failures.

**Governance:** no edits to accepted V8A–V8O source blobs, original FCP, `main`, or external mathcommunity; no upstream PR without explicit owner permission. This acceptance note is documentary.
