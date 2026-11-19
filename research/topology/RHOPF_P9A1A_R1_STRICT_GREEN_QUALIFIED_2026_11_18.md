# RHOPF-P9A1A R1 — independently qualified original-source strict GREEN

**Project Lead checkpoint:** November 18, 2026, America/Los_Angeles.
**Accepted run:** [#44466224648](https://github.com/etblink/math/actions/runs/44466224648)
**Exact tested commit:** `9698423c3365aaa310c5524dbf18351dcef7a81f`
**Status:** **ACCEPT R1 GREEN** — full-generator inequivalence only.

## Exact qualification

The native source is `RHOPFP9A1AOriginalGammaGeneratorInequivalence.lean`, imported from the qualified original source gamma 36-bivector trace-Gram probe. Its four theorems (general scalar-separation, `K13_ne_K25`, `K13_ne_K46`, `K25_ne_K46`) compile in pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` under `-DwarningAsError=true`. Original exact source-hash preflight passed. The Gram dependency built successfully (8,994 jobs); the independent Lean type consumer passed. Both native and independent Lean axiom reports each cover four declarations, reporting exclusively `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.

The independent standard-library Python consumer re-parsed literal original Gamma9 signed permutations, verified the original source SHA, source fixture equivalence, exact Clifford and Gram checks, 384 restricted entries, and full-R16 distinctness. This finite numerical consumer is **not a replacement for a native Lean theorem** about the restricted R4 action.

Original [CI artifact #14501914179](https://github.com/etblink/math/actions/runs/44466224648/artifacts/14501914179) was independently downloaded and inspected. ZIP SHA-256 `df4c7881af68ceec33f760d670af6936b1400edeabe74b0f5ec82d91860f550b` exactly matches the GitHub digest. Retained contents include exact tested commit, pinned toolchain hashes, original trace-Gram source build log, original native and independent Lean logs, and independent integer-consumer output. See adjacent machine-readable evidence ledger for per-file digests.

## Mathematical acceptance

The three chosen full source 16-real gamma bivector generators
`K13 = gamma 1 * gamma 3`,
`K25 = -(gamma 2 * gamma 5)`, and
`K46 = -(gamma 4 * gamma 6)`
are pairwise distinct. The general theorem is stronger: two distinct canonically ordered original gamma bivectors are not real scalar multiples. This reuses source-exact trace-Gram separation instead of reconstructing 16x16 matrices.

## Boundaries and next gate

The selected four-real-coordinate preservation and identical restricted Hopf-phase action of the three generators are independently checked **only as finite-coordinate assertions**, not yet native Lean theorems. Promote that next through a separate P9A1B source-exact finite-entry gate with strict axiom/consumer controls.

No Fock-vector unitary, combined boson/Fock Spin(9) Noether operator, Hamiltonian commutator, closed physical domain, protected vortex, proton or Standard Model charge has been established by this microgate. Original BFSS Core and Fock sources, FCP main and NFC retired forced Hopf tower remain untouched.

**Governance:** Preserve acceptance and failure diagnostics; do not rewrite result statements or promote out-of-scope interpretations.
