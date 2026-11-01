# Accepted F10AA and F10AB original gamma pair trace-pairing candidate

Research branch research/fcp-k1d17-ancestor-cache-pilot-20261028; date 2026-11-01; parent 11d224613ba096eeb9ff405bdf41fd08af32db8c.

## Accepted F10AA
[Strict run #41335877821](https://github.com/etblink/math/actions/runs/41335877821): success, attempt 1, tested parent exactly. All original source pin checks, frozen Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, F10Z and public F10E builds, fresh warning-as-error compiler, three independently elaborated exact declaration types and axiom audits passed; audit marker V10H_F10AA_THREE_EVEN_PAIR_SCALAR_TYPES_AXIOMS_PASS. No sorryAx, root axiom whitelist propext/Classical.choice/Quot.sound.

[Artifact #13094928808](https://github.com/etblink/math/actions/runs/41335877821/artifacts/13094928808), ZIP SHA256 8634751e6607a6b65784801edf44f1de61cceb520bc998422f6aad2658fc382e.

Accepted original real gamma pair facts: for distinct actual nine source directions, γaγb has trace zero and is nonscalar; all pairs are nonzero.

## F10AB candidate: concrete Gram-matrix separation, not 256-word independence
Under the unchanged exact PUBLIC gamma Clifford relations and no private tables, test:
1. source9OriginalGamma_pair_square_neg_one: for a≠b, (γaγb)^2 = -I16.
2. source9OriginalGamma_pair_square_trace_neg_sixteen: for a≠b, trace of that square is -16.
3. source9OriginalGamma_pair_shared_left_trace_zero: for a≠b and b≠c, trace((γaγb)(γaγc))=0 (a=c is allowed).

These are true source matrix-image discrimination claims: diagonal trace pairing is nonzero, selected off-diagonal pairing vanishes. They are not yet a full orthogonality theorem for 36 gamma pairs, not full 256 even Clifford gamma-word linear independence, not even Clifford gamma AlgHom injectivity, and not faithfulness of the original Spin9→SO48 representation. No topological Spin48 lift, Fock action or BFSS physical/spectral existence.

Strict qualification: pin accepted F10AA/F10E original gamma source blob hashes, unchanged frozen Lean/Mathlib versions, fresh full accepted ancestry and F10AB warning-as-error compilation, three independent exact type and axiom audits, immutable tested SHA/compiler logs. Never raise resource limits or introduce sorry/axioms. No main branch merge or external PR.
