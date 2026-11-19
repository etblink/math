# RHOPF-P9C2D — strict GREEN original-source relational quarter-turn

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44588647958](https://github.com/etblink/math/actions/runs/44588647958), attempt 1, SUCCESS.
**Exact tested SHA:** `5c2766eed1400464cf8411b58097dd6f8e6f5092`.
**Decision:** ACCEPT EXACT THREE ORIGINAL-SOURCE THEOREMS as independently qualified.

## Immutable original evidence and toolchain

- Original source hash/declaration contract: PASS.
- Frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted dependencies: PASS.
- Original Gamma9 independent signed-permutation integer source fixture: PASS.
- Native original source warning-as-error compile, independently imported typed Lean consumer: PASS.
- Three native `#print axioms` and three imported consumer `#print axioms` reports: only `propext`, `Classical.choice`, `Quot.sound`. Zero `sorryAx`, no compiler errors.
- Independently downloaded [artifact #14562898638](https://github.com/etblink/math/actions/runs/44588647958/artifacts/14562898638); ZIP SHA-256 `69b0dd777f70e2e45e0d50fdfe859e167d7968073cbd532529f252ac82c2b433`, equal to original GitHub digest. Embedded `exact-tested-commit.txt` matches exact tested SHA. Six original/independent axiom reports, toolchain SHA hashes, original fixture and dependency-build transcript inspected.

## Qualified source mathematics

- `FCP.RHOPFP9C2D.relationalQuarterTurn_transpose`: for `U = I-P+J`, `Uᵀ = I-P-J`.
- `FCP.RHOPFP9C2D.relationalQuarterTurn_transpose_mul_self`: `UᵀU=I`.
- `FCP.RHOPFP9C2D.relationalQuarterTurn_square`: `U²=I-(2:ℝ)•P`.

Together with accepted P9C1A `P²=P`, P9C1B1 real rank4, P9C1C1A common-action image, P9C2A `J²=-P`, P9C2B `Pᵀ=P, Jᵀ=-J`, and P9C2C support/partial-isometry identities `PJ=JP=J`, this yields exact full-carrier real orthogonal U, quarter turn on im P and identity on ker P, and algebraically U⁴=I.

## Explicit limits and negative knowledge

This is a finite C4 action, not yet a native Lean continuous S¹ group action, a Hopf S³→S² principal fibration, or a generator of a physically conserved BFSS transformation. Source original selected coordinate basis equality `im(P)=span_R(e0,e1,e8,e9)` is not yet native-qualified, direct gamma-column R1/R2 REDs [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) remain STOPPED. No modified original Gamma9, Core, Fock or Hamiltonian implementation.

Next bounded mathematical candidate: define an algebraic unit-circle parameter `(a,b) : ℝ²` with `a²+b²=1`, and exact ambient source matrix `(I-P)+aP+bJ`. Prove orthogonality for each unit parameter and multiplication-law compatibility (in separate microgates if needed), without guessing a physical source action. Then use Mathlib topology to interpret the algebraic circle as continuous.
