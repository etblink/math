# K1D13 — actual source Spin48 linear representation

## Independent strict acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED — 60 scoped contributor modules and 70/70 selected declaration roots.** [Strict run #40636013385](https://github.com/etblink/math/actions/runs/40636013385), job `122643034366`, attempt 1, completed `success` at exact source-tested SHA [`4a401dd606e9cb5a6dc961dd3392610d4a4dde2e`](https://github.com/etblink/math/commit/4a401dd606e9cb5a6dc961dd3392610d4a4dde2e). The strict workflow freshly verified all **67 accepted ancestor declaration roots** and three K1D13 declarations. Terminal marker: `FCP_K1D13_SOURCE_SPIN48_LINEAR_REPRESENTATION_STRICT_PASS modules=1 roots=3`. All three axioms lists contain only `propext`, `Classical.choice`, `Quot.sound`; no Lean source warnings/errors or `sorryAx` were present. [Immutable source/compiler/theorem evidence artifact #12793648936](https://github.com/etblink/math/actions/runs/40636013385/artifacts/12793648936) is preserved.

**Precisely qualified:** the actual original S1V31 source Spin48 action has a genuine real-linear map and real-linear automorphism representation `spinGroup source48Quadratic →* (Source48Vector ≃ₗ[ℝ] Source48Vector)` with group inverse induced by the genuine inverse Spin element. This creates the representation into GL of the exact source 48-real vector space. The previously qualified pointwise two-sign kernel K1D11 has **not yet** been re-expressed as `MonoidHom.ker` of this new representation.

**Not yet qualified:** an exact kernel theorem specifically for the newly constructed linear representation; quadratic-form preservation / image in O(48) or SO(48), surjectivity, topology/covering, global Spin9 lift and BFSS spectral existence. No such claims should be inferred from the green gate.

**Negative evidence preserved:** [Run #40634336284 attempt 1](https://github.com/etblink/math/actions/runs/40634336284/attempts/1) failed during pinned Lean download due to TLS; [attempt 2](https://github.com/etblink/math/actions/runs/40634336284/attempts/2) rebuilt the original accepted ancestors successfully but rejected two no-op `change` tactics by warning-as-error. The new accepted commit removed only those two tactics. Both failures remain in the original immutable job logs and the attempt-2 artifact #12793407370; historical candidate status below is retained for auditability.

### Archived candidate and repair history


## Gate 1 attempt failures and statement-preserving repair — 2026-10-28 UTC

**CURRENT STATUS: CANDIDATE / NOT ACCEPTED. 59 accepted modules; 67 accepted roots.**

[Strict run #40634336284](https://github.com/etblink/math/actions/runs/40634336284), original source-tested SHA `61fc1351836f1ff8b5e154933db4dee2271e8d0f`:

- **Attempt 1 RED (job `122637705818`):** checkout and source hash checks passed. Pinned Lean 4.34.1 restore failed attempting `https://releases.lean-lang.org/lean4/v4.34.1/lean-4.34.1-linux.tar.zst` with `[35] SSL connect error`. Original ancestor compilation and all K1D13 declarations were **not executed**. No new compiler evidence. No artifact was generated (all evidence directories absent).
- **Attempt 2 RED (job `122638988199`):** dependency restoration and all **67 accepted ancestor declaration roots** passed. The fresh K1D13 compiler emitted only two source linter errors at original lines 43 and 50: `Unused tactic linter: change ... does nothing`, because `change` merely repeated the existing inverse-law goals. It produced `#print axioms` for all three intended K1D13 declarations with only `propext`, `Classical.choice`, `Quot.sound`, and no sorryAx; **strict warning-as-error correctly failed**. [Immutable compiler evidence artifact #12793407370](https://github.com/etblink/math/actions/runs/40634336284/artifacts/12793407370). Neither failed attempt qualifies a new root.

**Next exact-source candidate repair:** delete only these two no-op `change` tactic blocks; retain the same real-linear-map, linear-equivalence and monoid-homomorphism declarations, definitions, proof arguments, and source-defined 48-vector action. New candidate Lean Git blob `ea7b39f86a3ee3da6e69ecde3e84a3e04252567d`, new verifier blob `b051603f6962dbad1ec87586109305bf6134cc3d`. Re-pin both in strict workflow, re-run the complete accepted ancestry from fresh source, and fail closed until the new terminal green source/compiler/axiom evidence is independently inspected. Do not disable the linter or relax the qualification verifier.

The two failures have distinct causes: transient dependency-download TLS on first attempt and unused proof-tactic linter violations on second. Neither warrants weakening the mathematical statements. The original error evidence and compiler results are preserved in the run's job logs and artifact.

### Archived original candidate charter


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
