# F10AB accepted; F10AC original gamma fixed-left pair nonproportionality strict candidate

Date: 2026-11-01. Research branch research/fcp-k1d17-ancestor-cache-pilot-20261028. Accepted parent f02bc099834f4ce29290cdbdc1b2a7d9f42d63e2.

## Accepted F10AB
[Run #41337109819](https://github.com/etblink/math/actions/runs/41337109819) completed success on first attempt, exact accepted parent SHA. Original source pins, Lean 4.34.1, pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, qualified F10AA build, warning-as-error F10AB compilation, all three exact type and axiom audits passed; marker V10H_F10AB_THREE_GAMMA_PAIR_TRACE_TYPES_AXIOMS_PASS. Only propext, Classical.choice, Quot.sound; no sorryAx.

[Artifact #13095574021](https://github.com/etblink/math/actions/runs/41337109819/artifacts/13095574021), ZIP SHA256 c2ac014fc33fc40c4c1a1899ed5ddf83f33bf0a5e52e104f35dc495da08e5fc4.

Accepted source gamma-pair facts: (γaγb)^2 = -I16 for a≠b; trace of square = -16; trace((γaγb)(γaγc)) = 0 if a≠b and b≠c. These do not classify disjoint-index trace pairings.

## F10AC candidate — first explicit two-word nonproportionality
Use the same actual publicly defined source gamma matrices and F10AB trace pairings to test three stronger precise statements:

1. source9OriginalGamma_fixed_left_pair_trace_gram — uniform signed trace delta, -16 if b=c, zero otherwise, with a≠b.
2. source9OriginalGamma_fixed_left_pair_ne — original gamma words sharing a first label but different second labels have DISTINCT image matrices.
3. source9OriginalGamma_fixed_left_pair_not_smul — neither pair image is a real scalar multiple of the other in the stated direction, for any real scalar r.

These establish nonproportionality of two original matrix words and exact trace extraction at the two-word level, not yet simultaneous independence of all eight fixed-left nontrivial pairs, all 36 ordered distinct pairs, all 256 even basis images, or source even-Clifford gamma injectivity. Do not claim faithful Spin9 → paired SO48, Spin48 lift, Fock operator or BFSS physical result.

Strict gate: pinned original F10AB/F10AA/F10E gamma sources, original Mathlib and Lean, fresh strict compiler, three independent exact source declaration type + axiom audits, exact SHA and immutable artifact. No private gamma signed-permutation tables, sorry/axioms/limit increases. Owner research branch only; no main/upstream.
