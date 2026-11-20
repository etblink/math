# RHOPF-P9C3D2G1C5 R1 — original Gamma9 Q-unit radial normalization strict GREEN

**Pacific date:** 2026-11-20 (CI completed UTC 2026-11-20T08:09:18Z).  
**Canonical branch:** `integration/bfss-unified-research-20261108`; no `main` edits.  
**Original strict run:** [#44698572921](https://github.com/etblink/math/actions/runs/44698572921), attempt 1 SUCCESS.  
**Exact tested commit:** `14ab7c82d3fa6892346ac3808caa7bafc23fe868`.  
**Original job:** `136161148427`.  
**Original archive:** [#14612059036](https://github.com/etblink/math/actions/runs/44698572921/artifacts/14612059036).  
**Independently downloaded ZIP SHA256:** `5892ed03847254bff1d8cf429098e3a90677828a7365b2b92857f7984220090f` (matched original CI-upload SHA256).  
**Embedded `exact-tested-commit.txt`:** `14ab7c82d3fa6892346ac3808caa7bafc23fe868`, independently inspected.  
**Disposition: ACCEPT** both source-original native and independently imported G1C5 declarations as strict GREEN.

## Strict controls

- Original BFSS Core, original Gamma9 projector, exact circle/rank and accepted G0A/B/C, G1A/B/C0/C1/C2/C3/C4 exact frozen SHA pins: PASS.
- Exact G1C5 original and separately imported consumer source pin and structural preflight: PASS.
- Source-independent original signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Dependency build 9041 jobs: PASS.
- Source-native G1C5 warnings-as-errors compilation: PASS.
- Independently imported source-typed G1C5 consumer warnings-as-errors compilation: PASS.
- Four original native/consumer `#print axioms` reports (two declarations each) exactly `[propext, Classical.choice, Quot.sound]` with no `sorryAx`: PASS.
- Original ZIP independently downloaded, SHA256 verified against CI upload, six-file manifest independently listed, embedded exact tested SHA verified, both logs inspected: PASS.
- Original six files: `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `independent-lean-types-and-axioms.log`, `native-coordinate-quadratic-normalization-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.
- No physical Fock-source rewrite, alternate original gamma matrices or preferred coordinate plane, added axiom, proof-budget expansion or write to main.

## Accepted mathematical statements

```lean
theorem relationalRangeCoordinateRadius_mul_self
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateRadius x *
      relationalRangeCoordinateRadius x =
        relationalRangeCoordinateDotSelf x

theorem relationalRangeCoordinateDotSelf_inv_radius_smul
    (x : Fin 4 → ℝ) (hx : x ≠ 0) :
    relationalRangeCoordinateDotSelf
      ((relationalRangeCoordinateRadius x)⁻¹ • x) = 1
```

The accepted source-exact original Gamma9 quadratic `Q(x)` pulls back the original real-spinor Euclidean dot-self through the accepted G1C0 `E.symm` from actual original projector image to `Fin 4 → ℝ`. G1C1–C3 prove `Q>0` outside zero, `Q` continuous, `r=sqrt Q` continuous and positive away from zero. G1C4 proves exact quadratic homogeneity. G1C5 confirms `r(x)^2=Q(x)` and `Q(r(x)⁻¹ • x)=1` for each nonzero x.

## Next proof boundary

The next source-exact small gate should certify `Q(0)=0`, `Q(x)=1 → x≠0`, `Q(x)=1 → r(x)=1`, and eventually `N(x)=x` on the `Q=1` level set. These establish the inverse conditions for a radial normalization from nonzero coordinates to the Q-unit level set. Then formalize its continuity using the positive denominator and a separate full homeomorphism to the **standard real-four Euclidean dot-one sphere**, not merely a product/sup norm sphere.

**Open:** standard `S³` homeomorphism, Circle-equivariant Hopf action/quotient, original-operator/Fock implementation, physical topological defect or stable vortex.
