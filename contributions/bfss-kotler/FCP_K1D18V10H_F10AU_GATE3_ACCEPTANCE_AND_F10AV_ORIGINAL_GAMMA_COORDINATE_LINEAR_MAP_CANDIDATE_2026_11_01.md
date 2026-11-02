# F10AU Gate 3 acceptance and F10AV original gamma coordinate LinearMap candidate

Date: 2026-11-01 Pacific (run completed 2026-11-02 UTC). Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10AU — accepted
[Run #41372474729](https://github.com/etblink/math/actions/runs/41372474729), exact tested commit `0fab538e626080cc97136755b645dc8372424741`, attempt 1, terminal SUCCESS. All substantive steps passed: exact source pins, frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AT ancestry rebuild, fresh F10AU warnings-as-errors source compilation, independently elaborated COMPLETE theorem type, and declaration-level root axiom audit. Independent marker `V10H_F10AU_EXHAUSTIVE_ORIENTED_PAIR_TYPE_AXIOMS_PASS`; root axioms only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. Artifact #13109554580, SHA256 `57dc0e22f5f79ead5ab65d3274dfc6ed7dcd0527bf071d2f8fab156b11ad9822`.

F10AU proves one exhaustive native `so(16,R)` bracket theorem for every two oriented original gamma-pair inputs (a,b),(c,d), subject only to a≠b and c≠d. Its five cases include shared-left, chain, shared-right, fourth cross-endpoint overlap, and disjoint zero, with dependent-if collision branches. This is a qualified algebraic theorem, not a source `so(9)` LieHom.

## F10AU negative evidence retained
- Gate 1 [#41370068416](https://github.com/etblink/math/actions/runs/41370068416): strict source compile caught unused dependent-if proof binders `hbd` and `had`. Minimal source-only rename to `_hbd`, `_had` retained.
- Gate 2 [#41371314341](https://github.com/etblink/math/actions/runs/41371314341): candidate source compilation passed, but independent exact-type audit restatement retained the old binder names and failed warnings-as-errors. Minimal independent-audit-only correction retained.
- Gate 3 [#41372474729]: complete strict source and independent audit green. Neither prior red is erased.

## Existing qualified 9→48 result — separate representation
The accepted V9R/V9S/V9T chain already constructs a genuine source-native skew (9	imes9) to original paired-Fock skew (48	imes48) `LieHom`, with canonical Mathlib skew-adjoint interface. Do not conflate this target with the original real 16-dimensional gamma-matrix representation.

## F10AV — bounded next candidate
The immediate objective is the distinct native source `so(9)` to original gamma `so(16)` differential representation. The expected normalization is source-derived:
[
F_{rs}=E_{rs}-E_{sr}quadmapstoquad 	frac12,gamma_rgamma_s
quad(r
e s).
]
This matches ([F_{rs},F_{st}]=F_{rt}) and the qualified original gamma relation ([gamma_rgamma_s,gamma_sgamma_t]=2gamma_rgamma_t).

F10AV constructs the full real coefficient LinearMap on every native 9×9 matrix:
[
ho(A)=	frac14sum_{r,s}A_{rs}gamma_rgamma_s.
]
It proves exact Matrix.single evaluation, the coordinate-plane normalization (zero on diagonal), skewness of each plane image, and that every skew source input maps into Mathlib's actual native `LieAlgebra.Orthogonal.so SpinIndex ℝ`.

F10AV deliberately does NOT claim arbitrary bracket preservation or a LieHom. Those are the next independent obligations:
1. generator-level bracket preservation for every four source indices, combining F10AU with the native 9×9 coordinate-plane bracket;
2. extend the exact bilinear bracket defect from all coordinate-plane pairs to arbitrary skew inputs using the accepted skew-plane spanning theorem and explicitly typed linear slices (V9I–V9M successful method);
3. construct the genuine native Mathlib `so(9) → so(16)` LieHom only after the full arbitrary skew commutator identity qualifies;
4. independently verify the exact generator action and canonical Mathlib interface.

The strict F10AV gate pins the original gamma/F10AU ancestry and the accepted V9F source skew-plane spanning ancestry, rebuilds both, compiles the new source with `-DwarningAsError=true`, and independently re-elaborates all eight complete declaration types and root-axiom reports. No linter suppression, axioms, admits, raised resource limits, source basis replacement, main merge, or upstream PR.

## Method lessons applied
- Reuse accepted original gamma bracket theorem and accepted native skew spanning; do not rebuild the mathematical foundations.
- Normalize against the actual source coordinate plane (E_{rs}-E_{sr}), not a guessed sign or color-major basis.
- Keep full-matrix linearity separate from skew-carrier membership.
- Expose typed maps before finite-sum rewrites; V9L showed that an opaque two-argument defect is not a `LinearMap`.
- Preserve `-DwarningAsError=true` and ensure the independent audit restates exactly the repaired binder names, avoiding the two F10AU audit regressions.
