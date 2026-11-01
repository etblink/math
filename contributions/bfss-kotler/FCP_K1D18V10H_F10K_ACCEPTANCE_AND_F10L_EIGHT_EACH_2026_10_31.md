# V10H — accepted F10K source cardinality equality; candidate F10L original eigenvalue eight/eight

Research branch: research/fcp-k1d17-ancestor-cache-pilot-20261028. Date 2026-10-31 PDT.

## Independently qualified F10K
- [F10K strict gate #41276231901](https://github.com/etblink/math/actions/runs/41276231901), completed SUCCESS, attempt 1, job 124758840918, exact SHA 9c392a8b0221dfe67b43c7769d75cb36d4ee35de. Qualified source Git blob 680122d148d53078f7b0493369b6a53f8f1101ef.
- Source-exact original BFSS public gamma blob b9b8192055c70f0d001d7982669b9823c55562ed. Accepted F9 and F10E/F10F/F10G/F10H/F10I/F10J ancestor blobs pinned. Lean v4.34.1; Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Preflight, dependency restoration, accepted F10J rebuild, fresh warning-as-error F10K compilation, FOUR independent source-type checks and all root axiom whitelists PASS.
- EXACT qualified source declarations: source9PositiveEigenIndices_sum_eq_card_mul_sqrt, source9NegativeEigenIndices_sum_eq_card_mul_neg_sqrt, source9Eigenvalue_sign_card_cast_equal, source9Eigenvalue_sign_card_equal. For any nonzero original nine-vector v the cardinalities of the ACTUAL positive/negative spectral index filters coincide. Only propext, Classical.choice, Quot.sound root axioms, no sorryAx.
- [Immutable qualified F10K artifact #13071800388](https://github.com/etblink/math/actions/runs/41276231901/artifacts/13071800388), SHA256 c33bba62488229ad48b8ee2d76dc6663abcbd4fa830efeb1bb30286547f83a98.

## F10L next exact-source gate: eight positive and eight negative eigenvalues, NOT YET QUALIFIED
- Primary original BFSS source lean/OAI/MathematicalPhysics/BFSS/Core.lean defines `abbrev SpinIndex := Fin 16`. Pinned Mathlib contains Fintype.card_fin 16 (source Mathlib/Data/Fintype/Card.lean) and Mathlib.Tactic (includes builtin omega tactic). Original source SpinIndex is NOT the paired 48 Fock/color-major index order. No assumed Spin9 lift or permutation enters here.
- F10L candidate theorem source9SpinIndex_card_sixteen: `Fintype.card SpinIndex = 16` with an explicit definitional `Fin 16` type bridge and pinned cardinality lemma.
- F10L candidate theorem source9PositiveEigenIndices_card_eight: for v!=0, `(source9PositiveEigenIndices v).card = 8`, using accepted F10J `source9Eigenvalue_sign_partition_card` and F10K `source9Eigenvalue_sign_card_equal`, reducing 2*card = 16 by exact Nat arithmetic omega.
- F10L candidate theorem source9NegativeEigenIndices_card_eight: the same exact proof for the original negative spectral filter; no cardinality assumed or imported from physics.
- Independent warning-as-error compiler and three declaration-level exact types, plus three axiom audits are REQUIRED to qualify F10L. No early acceptance from mathematical plausibility or green ancestry.
- A prospective prepublication import `Mathlib.Tactic.Omega` does not exist in the pinned Mathlib version. It was caught and changed to verified `Mathlib.Tactic` before any branch publication. This is a prevented API error, not a failed CI run.

## After F10L: determinant sign is still independent
- Accepted F10G proves original determinant = finite product of actual 16 real eigenvalues; accepted F10I proves ±sqrt(Q). F10L would prove exactly 8 occurrences of each sign. A separate exact source finite product partition and pow/sqrt algebra gate must derive det Gamma(v) = Q(v)^8 for v!=0, plus a separate v=0 boundary. The proof must use original SpinIndex and accepted identities, not copied private gamma tables.
- Global Spin9 orientation/character, original paired SO48 representation, Spin48 lift/cover, source Fock ordering and physical BFSS spectral existence are separate OPEN obligations.

## Negative knowledge and immutable scope
- Historical original private matrix F10 runs #41266215820 #41266892206 #41267510559 and F10D #41268424166 are RED, unqualified. F10E Gate1 #41269330982 (deprecated if_neg), F10F Gate1 #41270798888 (invalid matrix sum entrywise simp), F10H Gate1 #41273184444 (missing WithLp) remain immutable RED, later corrected by strict typed gates.
- Frozen qualified F1–F9 and F10E–F10K; no sorry/admit/native_decide, new axioms, private gamma table exposure, changed theorem statements, large compiler-limit increases, resource shortcuts, non-source matrix substitutions, modified pin hashes, main/upstream publication or invented physical claims.
