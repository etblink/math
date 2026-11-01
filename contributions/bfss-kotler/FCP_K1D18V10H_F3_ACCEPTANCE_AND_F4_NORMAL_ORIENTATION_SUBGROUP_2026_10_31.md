# K1D18V10H-F3 accepted; F4 source-exact orientation normal subgroup experiment (2026-10-31 PDT)

## V10H-F3 — ACCEPTED

- [GitHub Actions run #41259758805](https://github.com/etblink/math/actions/runs/41259758805), attempt 1, completed success, job `124710410888`. Exact tested SHA `50e5737c6c2d174cd1f4bf2d95767036c04de7c8`.
- Pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Accepted F2 rebuilt; source exact source blob `76fa0635c0a4a7c1564d114bfc9442024d31177e`; warning-as-error fresh compilation, independent three typed declarations, and root axiom whitelist all PASS. Only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Exact accepted declarations: `gammaDet_mul` (multiplicativity on original source Spin9 gamma O16 action), `gammaDet_square_one` (every genuine Spin9 group square has gamma determinant +1), `originalPaired48_mem_SO_of_square` (original G1A paired-48 image of each genuine source Spin9 group square lies in SO48).
- [Artifact #13064299316](https://github.com/etblink/math/actions/runs/41259758805/artifacts/13064299316), SHA256 `abc0e863139f055b4dad55b7c6fe40219a2e3b86da958e53cd8f63ae2418b2ed`, nonexpired when inspected.
- This says nothing about all source Spin9 elements being squares, source-group connectivity or global determinant +1.

## F4 — CANDIDATE, strict gate not yet qualified

The mathematical next interface is **the orientation-preserving subgroup of the original actual source Spin9 group** rather than an unfounded global assertion. Define `source9OrientationSubgroup : Subgroup (spinGroup source9Quadratic)` by membership `det(((source9SpinGammaOrthogonalHom g): GammaMatrix))=1`. Strictly test source det-one on the group identity, subgroup one/mul/inverse closure, exact equivalence with the already qualified original G1A paired48 SO membership, membership of all source group squares, and normality under arbitrary source Spin9 conjugation. All algebra follows from the accepted F3 determinant multiplication, group inverses and F2 orientation equivalence; no composite `source9SpinGammaDetHom` needs elaboration. Exact 5 declaration-level independent source-type/axiom checks are mandatory before acceptance.

Proving this subgroup normal and containing squares, if successful, would **not** prove `source9OrientationSubgroup=⊤`. That equality is the real orientation obstacle, potentially reducible to a source-exact generation or perfectness theorem. A topological continuity route is not licensed by this algebraic gate.

## Negative knowledge and protected boundary

V10H Gate1 [#41257058496](https://github.com/etblink/math/actions/runs/41257058496) and Gate2 [#41257744030](https://github.com/etblink/math/actions/runs/41257744030) remain RED: unqualified determinant-character composition exhausted recursion and incorrectly used unapplied `Matrix.mem_orthogonalGroup_iff.mp`. F1-F3 avoided those interfaces using smaller typed source proof bridges. Do not import unqualified V10H, raise recursion/heartbeat limits, use new axioms/sorries, or relabel conditional claims as theorem results.

Other still-open mathematical obligations: unconditional genuine source Spin9 → SO(original paired48), source-group topological continuity, original Spin48 group lift/covering and Fock-unitary implementation, physical BFSS covariance and spectral claims. The accepted original paired Fock-label permutation is unchanged; no main or external upstream changes.
