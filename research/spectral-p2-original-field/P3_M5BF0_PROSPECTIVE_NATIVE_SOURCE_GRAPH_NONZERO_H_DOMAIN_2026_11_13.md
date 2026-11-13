# P3-M5BF0 — prospective original charge graph and nonzero natural H-domain

**Date:** 2026-11-13 Pacific. **Status:** prospective, NOT Lean qualified until a new exact strict GREEN.

## Evidence already accepted
- [M3W0D0 #43484147197](https://github.com/etblink/math/actions/runs/43484147197) formally verifies a nonzero original paired physical FullL2 state and dense native physical sixteen-charge domain.
- [M5BE0 #43493125150](https://github.com/etblink/math/actions/runs/43493125150) accepts exact current native H = (1/16)T†T, original Hilbert natural domain, self-adjointness, closedness, dense domain and full weak-form iff.
- Historical imported original BF `SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe.lean` blob `fd137fc6f62f42d96bcf6ff3eb9355839a59d562` has 9 proof roots and one localized letI→let compatibility edit beyond imports, so its historical FCP GREEN is not current-source qualification.

## Bounded R1 experiment
- New source adapter `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean`, Git blob `f954917f21669fd68befc12f48a2b092b71a9044`.
- Independent concrete original Fock consumer `lean/diagnostics/BFSSP3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomainIndependentConsumer.lean`, Git blob `3d00bacf4b8e8cbf88c28d821d6b13336d23a2c2`.
- Strict workflow `.github/workflows/bfss-p3-m5bf0-native-graph-nonzero-h-domain-strict.yml`, Git blob `40e56e2ddd53bfbc325a8991e94b3bf34d537e8e`.
- The three proposed new roots: `originalPairedChargeGraph_eq_sourceRebased`, `originalPairedH_eq_accepted_BE`, `originalPairedH_naturalDomain_has_nonzero`. The last asserts **existence of some nonzero vector in the literal normalized physical Hamiltonian's natural domain**, derived from the already proved nontrivial original Hilbert subtype and accepted dense native H-domain. It does **not** show that the explicit radial state itself is in that domain.
- Nine original BF root axioms are audited alongside the three new roots and the two accepted predecessors: 14 total consumer declarations. Permitted axioms only `[propext, Classical.choice, Quot.sound]`.
- Frozen original BF `fd137fc6f62f42d96bcf6ff3eb9355839a59d562`, imported original BE `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`, qualified BE0 adapter `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1`, and qualified M3W0D0 adapter `86823abdddb70d1c2158f8e215fb35760e107fd5`.
- Source manifest checks all other transitive local OAI blobs against immutable historical baseline `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5`. The **two previously accepted new adapter modules** are explicit pinned exceptions, not unverified drift; a new manifest count must be measured in CI, never guessed.
- Toolchain Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold build and original consumer with `warningAsError=true` and full axiom-print analysis.

**Stop conditions:** BF exact source graph can be current-qualified only by strict source/consumer GREEN. No accepted BG/BH full original-versus-historical operator equality, nonzero Hamiltonian eigenstate, SUSY vacuum, point gap or BFSS mass gap is implied. A RED requires a permanent first-causal receipt with source/consumer bytes and tested SHA, not rewriting the historical source. On GREEN, follow BG then BH as separate source-exact gates.
