# F10S Gate 2 acceptance and F10T exact source Spin9 negative central candidate

Date: 2026-11-01. Branch: research/fcp-k1d17-ancestor-cache-pilot-20261028. Verified parent: 0e0b163646b7cbecd54ba4d44c1918fb834882be.

## F10S accepted, Gate 1 preserved red

Strict [F10S Gate 2 #41289313888](https://github.com/etblink/math/actions/runs/41289313888) completed success on exact SHA 0e0b163646b7cbecd54ba4d44c1918fb834882be. Source pins, frozen Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, full accepted F10R ancestry, fresh warnings-as-errors compiler, and four independent negative scalar exact-type and root-axiom audits passed. Audit token: V10H_F10S_FOUR_NEGATIVE_SCALAR_TYPES_AXIOMS_PASS. Exact root axioms among propext, Classical.choice, Quot.sound, no sorryAx.

[Gate 2 evidence artifact #13077001199](https://github.com/etblink/math/actions/runs/41289313888/artifacts/13077001199); SHA-256 a1acef8e8cd7f26f371d68e589b4ee9c66907ab7e8ececdf94532003f523d682.

Original [Gate 1 #41288470788](https://github.com/etblink/math/actions/runs/41288470788) remains RED at SHA b6df2559e7dc1717feaee61926156f81c57aca05, due to unknown pairedColorSpinEquiv namespace; preserve [red artifact #13076845287](https://github.com/etblink/math/actions/runs/41288470788/artifacts/13076845287). Repair added one accepted namespace opening without a theorem change.

## F10T: CANDIDATE / UNQUALIFIED

Original Spin48's K1D9 supplied a source-typed structural method but has a DIFFERENT 48-dimensional Q. F10T reuses only the proof method, specializing to the actual nine-dimensional source9Quadratic and SpaceIndex → ℝ.

1. source9_neg_one_mem_of_unitVector: arbitrary actual nine-vector of Q-norm 1; Clifford generators for v and -v as explicit units, source Lipschitz subgroup closure membership without unfolding the closure, unitary condition, even condition, actual Spin9 membership.
2. source9_neg_one_mem: concrete original nine-coordinate unit-vector witness with its exact source Q.
3. source9NegativeCentral: a genuine source Spin9 subtype group element, not an assumed central sign.
4. source9NegativeCentral_coe: its underlying original Clifford scalar is exactly -1.

Strict gate: frozen source blobs, no resource-limit changes, fresh warnings-as-errors compilation, four independent exact type checks and four declaration-level axiom whitelists. If red, retain SHA and first diagnostic and make one bounded correction.

F10S's conditional SO48 action can be specialized to source9NegativeCentral only once F10T passes. The relation to the original Spin48 two-sign kernel is a separate question, not to be inferred from this witness. Topological lift/cover, Fock implementation, gauge invariance, BFSS spectrum and FCP physical inference remain independent. Owner research branch only; no main merge or upstream PR.
