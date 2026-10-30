# K1D18V7I acceptance and source-exact V7J native determinant sign

**Project Lead research handoff, 2026-10-30 UTC.** Preserve evidence and negative knowledge, separate proven native Euclidean facts from source group generation.

## Independently verified V7I Gate 2 acceptance
- [Run #41025968572](https://github.com/etblink/math/actions/runs/41025968572) concluded success at 2026-10-30T08:33:10Z on exact SHA `69a30facd5b7137241e756edc096bcac6d85b40e`, job `123964042767`, attempt 1.
- Accepted V7I source Git blob `b796aef91beed8b57bd1508fea178332517dd8fe`. Evidence artifact ID `12963903586`, SHA-256 `5c62ab634d07c25b79fcaea15905b79096373315cdb04b7b67e901d1683e7772`.
- Exact markers: `K1D18V7I_EXACT_SOURCE_PINS_ONE_HUNDRED_THIRTY_FOUR_DECLARATIONS_PASS`, `FCP_CACHE_PILOT_WARM_REVALIDATION_PASS modules=37 roots=81`, `K1D18V7I_SOURCE_EXACT_THIRTY_EIGHT_FRESH_COMPILATIONS_PASS`, `K1D18V7I_EXACT_ONE_HUNDRED_THIRTY_FOUR_ROOT_TYPES_AXIOMS_PASS`. All five new roots had only `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx`.
- **Accepted scope:** for any native Euclidean orthogonal equivalence on the EXACT original source 48-label index set, a true unit-normal hyperplane-reflection list exists, bounded by real finrank, with zero-normal identity factors omitted and reflection product order unchanged. Does NOT assert even factor length or sourceSO generation.
- [Gate 1 red #41024449305](https://github.com/etblink/math/actions/runs/41024449305) remains preserved at tested SHA `6b14e52af7a6ef22364935d481fac973614370bf`, artifact `12963431632` SHA-256 `3452b82490798b7d7bb7938e79f4d730fdbfd104749abf247c096381ad65f1b4`. Causes: unused dependent-if binder, deprecated `dif_pos`/`dif_neg`, one unused simp argument, promoted by warning-as-error. Gate 2 removed all deprecated proof-lexemes without disabling lints, changing mathematical source, or increasing limits.

## Bounded V7J candidate — NOT ACCEPTED
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7JNativeUnitHyperplaneDeterminantSignProbe.lean`, Git blob `86d741f3eb5cbc0d8a82d2f3f59e525a57ffbb16`.
- Three candidate declarations: `euclideanUnitNormal_ne_zero`, `euclideanUnitLine_finrank_one`, `euclideanUnitHyperplane_reflection_det_neg_one`.
- At pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:61` proves `Submodule.det_reflection`: determinant of `K.reflection` is `(-1) ^ finrank 𝕜 Kᗮ`. `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:536` proves `finrank_span_singleton` for a nonzero vector. The V7J proof uses the same-label real Euclidean target and native double-orthogonal complement theorem to specialize the actual unit-normal hyperplane reflection determinant to **-1**, not a substituted matrix or chosen orientation.
- New workflow `.github/workflows/bfss-kotler-k1d18v7j-native-unit-hyperplane-determinant-strict.yml` is structurally preflighted for 39 fresh warning-as-error modules, 137 independent ordered unique declaration type/axiom checks, and 81 sealed accepted ancestry roots, pinned Lean 4.34.1 and Mathlib SHA. No new limit, axiom, source Q, Clifford action, original 48-label basis, or accepted source modifications.
- **No V7J root may be accepted before exact terminal strict green and independent log evidence.** If red, preserve first compiler error and repair using a typed, explicitly source-defined bridge rather than raising limits.

## Still-unproved frontier
The determinant of an **ordered native Cartan reflection product** must be shown to be `(-1)^length` through actual `LinearIsometryEquiv` product and `LinearMap.det` multiplicativity, then determinant +1 of transported original sourceSO elements (accepted V7E) must imply even list length. Each paired unit normal must be pulled back into the ORIGINAL source Q-unit vector using accepted same-label V7C equivalence; source Spin unit pairs from V6C/V7G can then witness their action. Only a qualified proof of exact sourceSO unit-pair generation permits applying V7A conditional Spin48 surjectivity. Covering topology, global Spin9 lift and BFSS spectra remain separate.

**Governance**: existing research branch only; no upstream community PR, no changes to main, accepted modules or canonical FCP.
