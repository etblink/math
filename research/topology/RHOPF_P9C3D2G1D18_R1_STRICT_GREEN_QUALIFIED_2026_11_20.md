# RHOPF-P9C3D2G1D18 R1 — original Gamma9 range / Q-unit Circle equivariance strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, `main` and original Gamma9 definitions unchanged.  
**Original strict run:** [#44819128759](https://github.com/etblink/math/actions/runs/44819128759), attempt 1 SUCCESS, completed 2026-11-20T21:33:29Z.  
**Exact tested SHA:** `0ef355db5e39c25d5d126d8740af954d11cc4942`, job `136575127392`.  
**Original artifact:** [#14672177122](https://github.com/etblink/math/actions/runs/44819128759/artifacts/14672177122).  
**Independently recalculated original ZIP SHA-256:** `4719cd2b9065e4c88763648de135ab50c6e0abc2d93e5e4a6f70fa33a2143d91`, identical to GitHub Actions upload SHA and artifact digest. Embedded `exact-tested-commit.txt` matches original tested SHA.

## Strict evidence and accepted mathematical scope

- Exact frozen original Gamma9, projector, original Circle, accepted D17/G1D3/D2F0 and original signed-permutation fixture preflight: PASS.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Dependency build: **9,065 jobs** PASS.
- Native source warning-as-error compilation and separately imported independent consumer: PASS.
- Four `#print axioms` reports, two each native/independent, exactly `[propext, Classical.choice, Quot.sound]`, with no `sorryAx` or Lean errors.
- All six original CI ZIP members independently inspected: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-range-q-unit-equivariance-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified theorem

```lean
noncomputable def relationalRangeUnitCircleAction
    (z : Circle) (v : RelationalRangeUnitSphere) :
    RelationalRangeUnitSphere

theorem relationalRangeUnitHomeomorphQUnit_circle_equivariant
    (z : Circle) (v : RelationalRangeUnitSphere) :
    relationalRangeUnitHomeomorphQUnit
      (relationalRangeUnitCircleAction z v) =
      relationalCircleQUnitAction z
        (relationalRangeUnitHomeomorphQUnit v)
```

Both actions are sourced from the **actual original Gamma9 Circle representation**. The previously accepted G1D3 homeomorphism is exactly the restriction of original noncanonical continuous real-linear `E`. D18 establishes that this **previously constructed** homeomorphism intertwines the actions on their norm-one carriers, rather than choosing a new map to make equivariance tautological. The theorem is qualified from the original native and independently imported evidence.

## Boundary / controlled next route

D14–D18 establish a continuous, free, Q-unit norm-preserving original source Circle action and its equivariance between exact original relational unit-range and Q-unit models. D9–D13 separately verify that the original phase `J₄` squares to `-I`, preserves original `Q`, and its real-four Circle action is `Re(z) x + Im(z) J₄ x`.

The next **major** unproved identification is a Q-compatible **complex two-dimensional** basis giving a real-linear isometric isomorphism `T : (ℝ⁴,Q) ≃ (ℂ², canonical norm)` with `T(J₄ x)=i T(x)`. Only then prove genuine equivariance `T(ρ₄(z)x)=z T(x)` and the restriction to ordinary Euclidean (S³), before a classical Hopf quotient, Chern class or charge assertion. Do not treat source-original Q as ordinary Euclidean norm prior to this construction. Source Fock/Gauss/Hamiltonian implementation and physical stable hopfion remain OPEN.

R1 required no repair and did not edit the original Gamma9 matrix, Mathlib pins or `main`.
