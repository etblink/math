# K1D13 — actual source Spin48 linear representation

**CANDIDATE — independent new strict CI not yet qualified.** Research branch `research/fcp-k1d13-linear-representation-20261027`, descended from accepted `research/fcp-k1d12-action-laws-20261027@52aeea6029a53ee422698e4c36ba32415e40c016`.

## Frozen accepted starting point

K1D12 strict [run #40632924482](https://github.com/etblink/math/actions/runs/40632924482), job `122633242128`, exact tested SHA `8f587c246e77783abad13d70d0e4d9fbee14c6c3`: **59 scoped owner contributor modules, 67/67 qualified selected declaration roots**, permitted axioms only `propext`, `Classical.choice`, `Quot.sound`. That run established real scalar-linearity and multiplicativity for the exact original S1V31 Spin48 vector action on `Source48Vector := Fin 24 × Fin 2 → ℝ`. Existing S1V31 additivity, K1D11 identity action and two-sign pointwise kernel are separately independently accepted. Source is not a surrogate SO action.

## Proposed source-declaration closure

New module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D13OriginalSpin48LinearRepresentationProbe.lean`, pinned Git blob `8fe66d3c57fc823433b11d3940542a5248fad3cd`.

1. `FCP.BFSSS1V52K1D13.originalSourceSpin48LinearMap`: package the *same* source S1V31 action of every genuine original Spin48 element as a real-linear endomorphism, with S1V31 additivity and qualified K1D12 scalar-linearity.
2. `FCP.BFSSS1V52K1D13.originalSourceSpin48LinearEquiv`: construct a genuine invertible real-linear map. Its inverse is the same source action by the actual inverse Spin element, with both sides discharged by K1D12 multiplication law and K1D11 identity action.
3. `FCP.BFSSS1V52K1D13.originalSourceSpin48LinearRepresentation`: give the genuine `spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)` homomorphism, with source-exact identity and multiplication proofs.

**No stronger interpretation is admitted by these declarations:** They create a **GL-level real-linear representation**. They do not prove that its image preserves the original quadratic form, lands in SO(48), is surjective, or produces a topological two-sheeted covering. K1D11's independently qualified exact two-sign pointwise kernel is *not automatically* called the homomorphism kernel until the new map and a separate equality theorem are qualified. Global Spin9 lift, exact Fock/source index alignment, and BFSS spectral existence remain separate open obligations.

## Exact strict gate and negative knowledge

Workflow `.github/workflows/bfss-kotler-k1d13-source-spin48-linear-representation-owner-strict.yml`; verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d13.py`, Git blob `53809d93be094f15a898904b7f4a4360e343ad85`. These freeze Lean 4.34.1, Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612`, original source Git hashes, and permitted axioms only `propext`, `Classical.choice`, `Quot.sound`. The job freshly recompiles all **67 previously accepted declaration roots**, then compiles this new module with warning-as-error to a nonempty `.olean`, checks 3 exact declaration axiom reports and 3 root types, and preserves original compiler and failure logs.

**Fail closed:** a red/partial run preserves compiler diagnostics and does not increase accepted roots. Only a completed independent strict green, with exact tested commit and original compiler/axiom evidence inspected, may qualify the new module. Intended new accepted frontier: 60 contributor modules and 70 selected roots.

Previous lessons remain active: no eager Clifford subgroup expansion (K1D9 red), no arbitrary Clifford inverse (K1D10 red), and no deprecated Mathlib rewrite under warning-as-error (K1D11 red). Guard source exactness and avoid multiple overlapping authority files.

## Review and publication boundaries

Keep owner `main`, all qualified checkpoints and the sibling `mathcommunity/oai-math-revised` untouched. An eventual upstream PR requires new, explicit owner authorization, a clean minimal theorem closure rebased onto then-current community `main`, independent strict requalification and disclosure of substantial automated assistance. This research candidate is not an upstream PR or a merge.
