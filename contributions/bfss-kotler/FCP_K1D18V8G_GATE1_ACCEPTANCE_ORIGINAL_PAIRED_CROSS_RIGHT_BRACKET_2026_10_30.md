# Project Lead — V8G Gate 1 ACCEPTED: fourth original paired 48-label shared-index bracket

**Research local date:** 2026-10-30 PDT; completed strict GitHub run 2026-10-31T00:16:03Z. **Disposition:** `ACCEPTED_1_SOURCE_EXACT_LEAN_ROOT__NOT_COMPLETE_SO9_REPRESENTATION`.

## Exact strict success certificate

- [V8G strict Gate 1 run #41148429505](https://github.com/etblink/math/actions/runs/41148429505), attempt **1**, completed/**success**. Job `124378914013` completed/**success**.
- Exact workflow-tested SHA **`9f1050e75006da45720e52450d2602e1f9f5b2e5`** on research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Exact qualified Lean file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CrossRightBracketProbe.lean`, **Git blob `05e4d93ad64aeb5b2ccd42999f7d225e108eb433`**.
- Exact source and toolchain preflight **PASS**: original paired-label Fock source, literal source gamma, accepted V8A, V8D and V8F ancestors; Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Pinned dependencies restore and accepted V8F/V8D import ancestor `lake build` **PASS**; log `Build completed successfully (8954 jobs)` is an *ancestor/dependency build job count, not the number of newly qualified theorem roots*.
- Fresh exact V8G source `lake env lean -DwarningAsError=true` **PASS**, produced `.olean`. The one theorem emitted an allowed axiom report; no `sorryAx`, no proof/resource-limit change.
- Fresh independent Lean `example` re-stating the exact original paired 48-label theorem proposition, `#check`, `#print axioms` **PASS**. Exact terminal marker `K1D18V8G_EXACT_ONE_ORIGINAL_SOURCE_CROSS_RIGHT_ROOT_AXIOMS_PASS`.
- Both source and independent outputs report only `[propext, Classical.choice, Quot.sound]`.
- [Preserved CI compiler/axiom artifact #13022655190](https://github.com/etblink/math/actions/runs/41148429505/artifacts/13022655190), `bfss-v8g-original-paired-cross-right-9f1050e75006da45720e52450d2602e1f9f5b2e5-1`, digest **`sha256:63c963b0b95c20cb3090c5d0e851005989447c5a6910822a4b56e152efca687c`**, 982 bytes.

## Accepted theorem and qualified scope

```lean
FCP.BFSSPairedSpin9Plane.originalPairedPlane_cross_right_bracket
  (r s t : SpaceIndex) (hrs : r ≠ s)
  (hrt : r ≠ t) (hst : s ≠ t) :
    originalPairedPlane r s * originalPairedPlane t r -
      originalPairedPlane t r * originalPairedPlane r s =
    -(originalPairedPlane s t + originalPairedPlane s t)
```

Equivalently `[K_rs, K_tr] = -2 K_st`, for three pairwise distinct labels. This is an algebraic derivation from the accepted exact V8F shared-left commutator and V8D orientation reversal, on the **actual Fock-paired original Source48Label**, not an untransported color-major basis.

## Qualification ledger

- V8A: 2 roots, `Kᵀ=-K`, `K²=-I` for distinct indices, [#41141833097](https://github.com/etblink/math/actions/runs/41141833097).
- V8B: 1 root, `[K_rs,K_st]=-2K_rt`, [#41143495333](https://github.com/etblink/math/actions/runs/41143495333).
- V8C: 1 root, four-distinct `[K_rs,K_tu]=0`, [#41144471425](https://github.com/etblink/math/actions/runs/41144471425).
- V8D: 1 root, orientation `K_sr=-K_rs`, [#41145356613](https://github.com/etblink/math/actions/runs/41145356613).
- V8E: 1 root, `[K_rs,K_ts]=+2K_rt`, [#41146209816](https://github.com/etblink/math/actions/runs/41146209816).
- V8F: 1 root, `[K_rs,K_rt]=+2K_st`, [#41147101382](https://github.com/etblink/math/actions/runs/41147101382).
- V8G: **1 new root**, `[K_rs,K_tr]=-2K_st`, [#41148429505](https://github.com/etblink/math/actions/runs/41148429505).

**Total V8A–G: eight strict-qualified new algebraic roots.** The disjoint and all four shared-index orientations are proved under explicit distinctness assumptions. This does NOT yet give a universal four-index `so(9)` bracket statement, an actual Lie algebra homomorphism respecting zero-diagonal conventions, any continuous Spin(9)→Spin(48) integration, an original Fock group action, SU(2) gauge commutation or BFSS physical spectrum.

## Next theorem and negative-control boundary

The raw V8A doubled generator `K_rr` is built from `-gamma_r gamma_r`, so is **`-I`**, not zero. Therefore a naive unrestricted `so(9)` bracket formula on the raw `K(r,s)` has an invalid diagonal convention. Define a **source-native zero-diagonal interface** `L(r,s) := if r=s then 0 else K(r,s)`, preserving the *same* actual 48-label matrices off diagonal. First prove `L(r,r)=0`, `L(r,s)=K(r,s)` for `r≠s`, and `L(s,r)=-L(r,s)` with a source-pinned strict Lean gate. Do not silently redefine raw `K`, replace source labels, or assert a group representation. Then derive the four-index commutator formula carefully, including index coincidences, as a separate bounded obligation.

Preserve the red V8A gate evidence, frozen FCP provenance, accepted theorem blobs, and absence of upstream PR. This acceptance record is documentary and must never be confused with the tested proof SHA.
