# RHOPF-P9C3B1 R3 — source-original algebraic circle-phase multiplication strict GREEN

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44603537606](https://github.com/etblink/math/actions/runs/44603537606), attempt 1, SUCCESS.
**Exact tested SHA:** `42d6835eab024a57aa5a65f3adb13bfb8765de7e`.
**Qualification decision:** ACCEPT one original source theorem, after independent consumer and artifact verification.

## Frozen-source, original and independent qualification

- Original-source hash/contract preflight: PASS.
- Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted source-original Gamma9/projector/phase dependencies: PASS.
- Native original source warning-as-error compilation: PASS.
- Independently imported source-typed consumer warning-as-error compilation: PASS.
- Both native and imported `#print axioms` contain only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` and no Lean compile `error:`.
- Independently downloaded [artifact #14569712175](https://github.com/etblink/math/actions/runs/44603537606/artifacts/14569712175); ZIP SHA-256 `92146d7c21a2bd8a5a58a7f13571e143d59af9ba41c36a32d16017057d553727` matches GitHub original digest. ZIP's `exact-tested-commit.txt` equals exact tested SHA, and archived original proof/consumer logs, fixture, toolchain hashes and dependency-build transcript were inspected.

## Accepted original-source mathematics

`FCP.RHOPFP9C3B1.relationalCirclePhase_mul`:
[
R(a,b)R(c,d)=R(ac-bd,ad+bc), quad a,b,c,d\in\mathbb R,
]
where `R(a,b)=Q+a•P+b•J`, `Q=I-P`, and P/J/Q are the exact previously accepted Gamma9 matrices.

This identity is algebraic for *all real* parameters. The unit-circle group property follows mathematically once the parameter domain is restricted to `a²+b²=1`; explicit source-native orthogonality, continuity and circle action are NOT claimed by this specific gate.

## Preserve original negative knowledge

- R1 [#44597813788](https://github.com/etblink/math/actions/runs/44597813788) RED: unsolved nested real scalar actions at hand-expanded nine-term `noncomm_ring` calc, original proof `sorryAx`.
- R2 [#44600630683](https://github.com/etblink/math/actions/runs/44600630683) RED: new distributive simplification and `module` discharged all proof obligations, but unused explicit `smul_smul` argument triggered strict warnings-as-errors, without `sorryAx`.
- R3 repaired **only** the unused simp-argument error, keeping the exact theorem, module/frozen source and resource strictness unchanged.
- Original direct gamma selected coordinate R1 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and R2 [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) remain STOPPED RED. Never rewrite their negative evidence or promote an unproved selected original basis.

## Next precise gate

Use the now accepted multiplication law plus accepted transpose relation `R(a,b)ᵀ=R(a,-b)` to prove
[
R(a,b)ᵀR(a,b)=R(a^2+b^2,0),
]
and hence `R(a,b)ᵀR(a,b)=I` whenever `a²+b²=1`. Keep proof and independent consumer bounded to these two typed matrix theorems; retain source hashes and same pinned toolchain.

Even a fully qualified compact circle representation on this 4-real relational sector alone would NOT prove a Hopf fibration, a Spin(9)-equivariant physical Fock implementer, BFSS SU(2) Gauss-law preservation, Hamiltonian invariance, vortex stability, or Standard Model predictions. These remain independent source-binding and empirical obligations.
