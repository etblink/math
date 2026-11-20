# RHOPF-P9C3D2G1D15 R1 — original Gamma9 Circle Q-unit group laws strict GREEN

**Pacific date:** 2026-11-20. **Disposition:** ACCEPTED_STRICT_GREEN.  
**Canonical branch:** `integration/bfss-unified-research-20261108`, original Gamma9 and `main` unchanged.  
**Original strict workflow:** [#44807530854](https://github.com/etblink/math/actions/runs/44807530854), attempt 1 SUCCESS, completed 2026-11-20T20:17:23Z.  
**Exact tested commit:** `caca10d05767c1edb029c878b2acc4a47d755b5b`; job `136535331546`.  
**Original artifact:** [#14664409352](https://github.com/etblink/math/actions/runs/44807530854/artifacts/14664409352).  
**Independently recomputed ZIP SHA-256:** `6370574c08972a47ef7c1cba284a8f2eee7962ee47714b44a3781aaa327ca7d8`, identical to original CI upload and GitHub digest. Embedded `exact-tested-commit.txt` matches `caca10d05767c1edb029c878b2acc4a47d755b5b`.

## Strict qualification

- Original Gamma9/P/J/Circle and accepted D2A/D14/G1C0/D13 source hash preflight: PASS; original source-independent signed-permutation integer fixture: PASS.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original dependency build: **9,062 jobs**, PASS.
- Native Lean source compilation and independently imported consumer (warnings-as-errors): PASS.
- Twelve `#print axioms` reports: six native and six independent; exactly `[propext, Classical.choice, Quot.sound]` and no `sorryAx` or Lean errors.
- Original archive independently downloaded, checksum verified, and all six entries inspected: `exact-tested-commit.txt`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `native-circle-q-unit-group-laws-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified mathematics

On the original projector range, on the transported `Fin 4 → ℝ` model, and on the `Q(x)=1` carrier, the **actual** original source Gamma9 Circle action satisfies identity and composition:
```lean
relationalCircleRangeAction_one
relationalCircleRangeAction_mul
relationalCircleFourAction_one
relationalCircleFourAction_mul
relationalCircleQUnitAction_one
relationalCircleQUnitAction_mul
```
The Q-unit theorem statements are
```lean
theorem relationalCircleQUnitAction_one (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction 1 v = v

theorem relationalCircleQUnitAction_mul
    (z w : Circle) (v : RelationalQUnitCoordinates) :
    relationalCircleQUnitAction (z * w) v =
      relationalCircleQUnitAction z (relationalCircleQUnitAction w v)
```
These follow by subtype extensionality, exact real-four conjugation through accepted `E`, and original source `relationalCircleVector_one/mul`. The action is *not* defined by an assumed classical complex phase.

## Continuing research boundaries

The D14 action preserves the transported original positive definite quadratic form `Q`, and D15 provides its group laws. **Joint continuity** of the Q-unit action, source equivariance with the existing normalized standard (S³) model, construction of a compatible Q-orthonormal complex basis and classical scalar `ℂ²` action remain separate targets. Neither a quotient `S³/S¹ ≅ S²`, a Chern number nor a physical BFSS original Fock/gauge/Hamiltonian implementation or stable hopfion has been established.

Next bounded target: use accepted source continuity and the exact E conjugation, or the qualified D13 phase identity and finite-dimensional linear map continuity, to prove joint continuity on Q-unit. Preserve independent Lean consumer and frozen source/evidence discipline.
