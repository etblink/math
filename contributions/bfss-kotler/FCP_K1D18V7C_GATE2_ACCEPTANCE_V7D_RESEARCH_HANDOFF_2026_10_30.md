# BFSS K1D18V7C — strict Gate 2 acceptance and V7D bounded next source bridge

**Project Lead disposition:** research-branch evidence and explicitly UNQUALIFIED next candidate, 2026-10-29 PDT / 2026-10-30 UTC. This file does not update canonical FCP science, and does not independently certify any future gate.

## Accepted V7C evidence

- [Strict GitHub run #40994205137](https://github.com/etblink/math/actions/runs/40994205137), completed **success** at 2026-10-30T03:04:07Z; job `123863416978`, attempt 1.
- Exact tested commit `8f48fea5072446c3d4c15f0ad857bac1db98d4e6`; candidate source V7C Git blob `168e5ddb49ad1d896390c2c16aca5daf59e2b503`. Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Terminal exact source-pins `K1D18V7C_EXACT_SOURCE_PINS_ONE_HUNDRED_FOUR_DECLARATIONS_PASS`; independently revalidated 37-module/81-root sealed ancestry `K1D18V7C_ACCEPTED_81_ROOT_ANCESTRY_PASS`; 32/32 fresh warning-as-error source module compilations `K1D18V7C_SOURCE_EXACT_THIRTY_TWO_FRESH_COMPILATIONS_PASS`; independent 104/104 root type/axiom audit `K1D18V7C_EXACT_ONE_HUNDRED_FOUR_ROOT_TYPES_AXIOMS_PASS`.
- All seven V7C declarations report only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` in independent audit. Evidence artifact `12951071821`, SHA256 digest `16258dc445e88b851a6016915d61b6fa29649ffbe26e629dbd770af9976072a2` ([workflow artifact](https://github.com/etblink/math/actions/runs/40994205137)).
- Previous Gate 1 red [#40992526624](https://github.com/etblink/math/actions/runs/40992526624), source `b615f1fd0b774f4529aa018e8b50e598a3f3bdb6`, failed in the source-specialized `i.map_app'` preservation field at V7C line 66 with maximum recursion depth. Gate 2 avoided the concrete reducible source-Q elaboration by proving generic norm preservation then applying it to the exact source Q. Keep this causal negative evidence; do not re-count accepted ancestors as new theorems.

**Qualified mathematical scope:** the actual original `Source48Vector = (Fin 24 × Fin 2) → ℝ`, with `source48Quadratic`, transports each true `Q.IsometryEquiv Q` through a same-label `WithLp` linear equivalence to a genuine Euclidean linear isometry. No source SO generator equality, image surjectivity, covering, Spin(9) lift or BFSS spectra follow.

## Staged V7D — NOT YET QUALIFIED

- New original-source contributor candidate: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7DOriginalSourceSOWitnessEuclideanTransportProbe.lean`.
- Git blob `56f21caa9b07e58d2d386687f07ebbf83bb0b566`; original source S1V0, accepted V7C and K1D18R declarations are unmodified.
- Four candidate roots: `sourceSO_has_originalQ_witness`, `sourceSO_originalQIsometry`, `sourceSO_originalQIsometry_underlying`, and `sourceSO_toEuclideanIsometry`.
- This bridge selects the actual original Q-isometry witness contained in K1D18R's source-SO subgroup, proves its underlying original GL48 action equals the supplied g, and reuses V7C's accepted Euclidean transport. It is a sourceSO *witness interface*, not an assertion about determinant under conjugation or group generation.
- The new source has received structural/static inspection and exact Git SHA cross-check only; **there is no new Lean compilation, strict gate, axiom audit, or theorem acceptance for V7D yet**. The next run must use independent source hash checks, warning-as-error fresh import closure, sealed ancestor revalidation, individually checked root types/axioms, and no new proof holes/axioms or resource-limit changes. The initial proposed full contract is 33 fresh source modules / 108 independent roots / 81 sealed accepted ancestors.

## Scientific next decisions and stop rules

1. Preflight the V7D verifier offline rather than retrying a broken generated wrapper. In particular compare all source hashes and expected root names, audit imports, script compilation, candidate exact source and tested SHA before any CI. Do not promote a red partial axiom report.
2. If V7D qualifies, prove transported original sourceSO determinant-one membership in the true Euclidean target. Preserve source group/action, not just an arbitrary witness with an unrelated representation.
3. Establish the *actual* original Clifford line-axis matrix `2P-I` equals minus the Euclidean hyperplane reflection `I-2P` on the same 48 coordinates, under explicit source-Q unit/nonzero assumptions. The 48-dimensional parity sign must be proved; do not silently swap bases.
4. Apply pinned Mathlib `LinearIsometryEquiv.reflections_generate_dim` to the transported sourceSO member. Its exported factorization list does not state that all normal vectors are nonzero; a zero-normal hyperplane reflection acts as identity, so avoid inferring parity from raw list length. Normalize nonzero normals with accepted V5 and pair them only after the exact determinant/parity bridge.
5. Only when `Subgroup.closure sourceSOUnitPairMatrixSet = ⊤` is actually proved may accepted V7A's conditional surjectivity become unconditional. Topological covering, global Spin(9), physical-domain and spectral claims remain separate.

**Governance:** Existing main, accepted A–T/U/V1–V7C proofs, old CI files, original FCP repository and draft upstream PRs remain unchanged. This is a research-branch candidate and dated handoff, not a publication or an unqualified claim of Spin(48) surjectivity.
