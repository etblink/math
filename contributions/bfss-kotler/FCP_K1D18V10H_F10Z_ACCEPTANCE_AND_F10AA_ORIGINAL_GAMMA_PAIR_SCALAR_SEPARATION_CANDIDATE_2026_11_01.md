# F10Z accepted; F10AA original even gamma-pair scalar separation

Date 2026-11-01. Research branch research/fcp-k1d17-ancestor-cache-pilot-20261028. Parent db636704847d4a5debec543f1bb0a91ac9c5a9d3.

## Acceptance F10Z
[Run #41334069677](https://github.com/etblink/math/actions/runs/41334069677) passed on the exact parent commit, attempt 1; pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, original Cl9 source and accepted F10Y ancestry, fresh warning-as-error compile, six independent exact declaration type and root-axiom audits. Exact marker V10H_F10Z_SIX_SOURCE_PBW_WORD_TYPES_AXIOMS_PASS; only propext, Classical.choice, Quot.sound, no sorryAx. [Acceptance artifact #13094762312](https://github.com/etblink/math/actions/runs/41334069677/artifacts/13094762312), zip SHA256 43750fa687ec98607c1ae82325292bd56610ee812cb649814473495966747bd7.

Accepted source nine-coordinate exterior PBW basis, finite ordered exterior word, nodup source labels and precise real-LINEAR transport to F10Y source Clifford PBW basis. CliffordAlgebra.equivExterior is NOT an algebra equivalence; gamma images of ordered Clifford words have NOT been identified by these results.

## F10AA UNQUALIFIED concrete separation candidate
Move beyond another basis interface. Use ONLY the accepted public F10E original gamma anticommutation and gamma-square identity (no private signed-permutation tables) to prove:
- source9OriginalGamma_pair_trace_zero: for distinct actual a,b : SpaceIndex, trace of original gamma a * gamma b is zero by Clifford anticommutation and trace cyclicity.
- source9OriginalGamma_pair_ne_zero: for any a,b, original gamma a * gamma b is nonzero using original gamma-square=1 on a diagonal coordinate.
- source9OriginalGamma_pair_not_scalar: for distinct a,b, no real scalar r makes gamma a * gamma b = r times identity; use trace=0 and nonzero.

This is genuine separation of one length-two even gamma word from the scalar matrices, NOT the full 256-word real-linear independence or even Clifford gamma AlgHom injectivity; Spin9 representation faithfulness, Spin48 topological lift, Fock implementation and BFSS physical conclusions all remain OPEN.

Strict gate: original Cl9/F10E/F10Z blobs pinned, warning-as-errors Lean 4.34.1 with pinned Mathlib, three independent exact types and axioms, immutable tested SHA and preserved logs, no sorry/admit/new axioms or raised resource limits. Research owner branch only; no main merge/upstream PR.
