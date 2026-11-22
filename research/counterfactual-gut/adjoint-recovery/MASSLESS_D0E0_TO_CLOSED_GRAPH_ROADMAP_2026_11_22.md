# Original BFSS massless multiplication graph — bounded closedness route

**Date:** 2026-11-22. **Status:** research plan; D0e0 strict result pending. **Target:** original `FCP.BFSSMasslessD0c0.originalMasslessGraph M`. **Do not promote as proved.**

## Mathematical claim to test

For arbitrary original `M : OAI.BFSSQuantum.AlgebraData N`, the maximal pointwise massless quantizer multiplication operator
`originalMasslessMultiplier M : originalMasslessDomain M →ₗ[ℂ] FullL2 N` should have closed algebraic graph in the original `FullL2 N × FullL2 N`. The bosonic configuration measure is not finite, and the field `x ↦ M.quantizeFrequency (masslessSourceFrequency M x)` need not be uniformly bounded over x. Neither property is required for the standard *maximal* multiplication operator closedness argument.

For a sequence `(ψₙ,ηₙ)` in the graph converging to `(ψ,η)` in `FullL2 × FullL2`:
1. First- and second-coordinate continuity gives `ψₙ → ψ` and `ηₙ → η` in `FullL2`.
2. Use Mathlib `MeasureTheory.tendstoInMeasure_of_tendsto_Lp` followed by `MeasureTheory.TendstoInMeasure.exists_seq_tendsto_ae` to choose a subsequence `ψₙₖ → ψ` pointwise almost everywhere. These theorems work with the sigma-finite/nonfinite original volume; do NOT assume `IsFiniteMeasure`.
3. Apply the same operation to the outputs *restricted to that subsequence* to get a subsubsequence with `ηₙₖⱼ → η` almost everywhere. Preserve input convergence under the second subsequence using `StrictMono.tendsto_atTop`.
4. For all indices of the final subsequence, original graph membership gives `ηₙₖⱼ =ᵐ[volume] originalMasslessAction M ψₙₖⱼ`, using `originalMasslessMultiplier_ae`. Gather the countably many a.e. equalities via `countable_iInter_mem` or `ae_all_iff`.
5. Source-exact D0e0 (if independently qualified) gives `originalMasslessAction M ψₙₖⱼ → originalMasslessAction M ψ` almost everywhere: at fixed x, `M.quantizeFrequency (...) : Fermion N →L[ℂ] Fermion N` is continuous. Its norm may grow with x; no uniform bound is needed for this pointwise argument.
6. Uniqueness of the fiberwise limit proves `originalMasslessAction M ψ =ᵐ[volume] η`. Since `η : FullL2 N` has a `MemLp` representative, transfer integrability by `memLp_congr_ae`, obtaining `ψ ∈ originalMasslessDomain M`. Finish with `MemLp.toLp_congr` or `Lp.ext` plus `originalMasslessMultiplier_ae` to prove the exact graph membership.
7. To upgrade sequential closure to topological `IsClosed` on the metrizable product, follow the existing Mathlib pattern `IsSeqClosed.isClosed` (used for `Lp` in `Mathlib/MeasureTheory/Function/LpOrder.lean`). Then separately specialize to original paired SU(2) 48-Majorana data without expanding its explicit quantizer expression.

## Gate structure and stop rules

- **D0e0:** only original pointwise-limit transfer, generic + paired. Source blob `29cc0574389eb82e8a84928fc9e4fb15dda533c3`. Research branch source creation `da32100bee1147fadab7f09cfe4d4996b6e0456d`, strict workflow `.github/workflows/bfss-massless-d0e0-pointwise-limit-transfer-strict.yml`, latest workflow correction `a3a7399fb6de194e34f4a2ca0daffc8bad0b9872`. **UNQUALIFIED until exact native/standalone strict run, two axiom reports, and original artifact.** A previously copied D0d0 root-namespace assertion was corrected before accepting any CI result; do not call an early workflow-preflight failure a proof failure.
- **D0e1 (future):** isolated generic closed-graph argument using D0e0 and the two nested subsequences. Do not construct the paired consumer in the first proof file if source elaboration recurs; prove generic first, then source-exact paired adapter in a separate scope.
- **D0e2 (future, only if D0e1 qualifies):** separately verify literal paired source and full graph closedness. No self-adjointness, symmetry, gauge-domain invariance, physical eigenstates, gap, Hopfion, or GUT claim follows.

For every new gate: strict pinned source SHA preflight; Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; native original import build; warning-as-error standalone compiler; exact root axiom reports restricted to propext/Classical.choice/Quot.sound; sorryAx excluded; artifact on RED/GREEN; independent tested commit and ZIP checksum verification. At two native proof REDs freeze the gate and redesign the architecture. Never extend elaborator resource limits to conceal recursion.

**Integration:** accepted research source allowlist remains exactly **nine** M0→M1a→M1b→M1c→D0a→D0b0→D0c0→D0c1→D0d0. Original D0b1 two native REDs remain frozen. No write to `integration/bfss-unified-research-20261108` or `main` and no bulk branch merge.
