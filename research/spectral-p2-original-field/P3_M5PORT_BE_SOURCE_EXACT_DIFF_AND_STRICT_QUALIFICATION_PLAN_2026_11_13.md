# M5-PORT0 BE exact-source requalification plan — research only
**Date:** 2026-11-13 Pacific. **Status:** SOURCE-DIFF VERIFIED / NEXT GATE NOT STAGED. No new theorem or source-byte acceptance is asserted by this memorandum. Primary live mathematical run remains P3-M3W0D0 [#43481282293](https://github.com/etblink/math/actions/runs/43481282293).

## Why this has high leverage
The true original relative SU(2) normalized physical Hamiltonian must be the *specific* native closed physical sixteen-charge adjoint square `H=(1/16)T†T`, with **exact natural operator domain**, not merely a matching formal differential expression on smooth vectors. The historical FCP BA/BE/BF/BG/BH program already constructed this object; rebuilding it would add no evidence if the current imported source can be requalified with a small strict source+consumer test.

The current `BFSS` source BF **imports both** the G4K2B original nonzero physical FullL2 witness and the BE original normalized Hamiltonian. M3W0D0's direct current-source requalification of K2B+D2B10C/AZ/BA is therefore a provenance-first upstream preparation for BE/BF and later BH, not a disconnected physical-state result.

## Historical and integrated exact artifacts
- Historical BE [FCP strict #39088799248](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39088799248) **success**, tested commit `184102c5c7f0e8b71fba9ed25ecebf9f6a71b303`; source under `experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean`, Git blob `bbe48532f9f66a7ef493e051453c00d40642752e`.
- Current integrated BE: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean`, blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`. Current `lean/lean-toolchain` Lean 4.34.1, Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Source line-by-line LCS compared at historical tested BE commit **after stripping fully qualified import lines**. Historical source 282 lines, integrated 284; **seven localized editorial/elaboration changes, zero theorem statement changes**:
  1. integrated lines 93 and 101 each add `omit [CompleteSpace E] in` to avoid unused typeclass dependencies on scalar-inner-product lemmas;
  2. historical proof line 156 `exact Iff.trans (by simp [inner_smul_right])` becomes integrated line 158 `exact Iff.trans (by simp)`;
  3. historical `letI : CompleteSpace G.physicalSpace :=` at original lines 192, 226, 250 and 257 becomes ordinary `let : CompleteSpace ... :=` at integrated lines 194, 228, 252 and 259. **Typeclass resolution must be tested**, not presumed.
- Downstream modified BF blob `fd137fc6f62f42d96bcf6ff3eb9355839a59d562`: one `letI` → `let` beyond import qualification. BG blob `fbbe542085f850156491d9b24d8e48afed0e8ee5` has theorem/proof body identical to historical except import paths; BH blob `a4818bb38bf22fd629f6b6c3c373c38479525dd4`: one `letI` → `let` beyond imports. Do not collapse these exact-object differences into byte identity.
- Historical [BH strict #39096180117](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39096180117) **success**, tested `9a65ad89b7000a401655bd1355e27b4ed6ff6d50`. Current modified BH equality is **NOT** qualified solely by this historical receipt.

## Candidate first M5 port qualification (not staged)
1. After accepting M3W0D0 or reconciling any red, freeze the exact current BE blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5` and generate its **deduplicated transitive OAI closure** against immutable baseline `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5`. Do not invent a closure count or reuse an unrelated 463-pin M3B1 count.
2. Cold build the unchanged imported BE file at the actual tested integration SHA; independently compile a consumer on genuine `AlgebraData 2`, `pairedGaugeData`, its literal `G.physicalSpace`, actual full sixteen-charge `PiLp 2 SpinIndex`, and `G.physicalSpace →ₗ.[ℂ] G.physicalSpace` Hamiltonian.
3. Require allowed-axiom audit of **all fourteen existing BE `#print axioms` roots**, especially `originalMinimalPhysicalNormalizedHamiltonian_domain`, `originalMinimalPhysicalNormalizedHamiltonian_apply`, `originalMinimalPhysicalNormalizedHamiltonian_selfAdjoint`, `originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff`, `originalMinimalPhysicalNormalizedHamiltonian_closed`, and `originalMinimalPhysicalNormalizedHamiltonian_domain_dense`. Preserve `(1/16)` and exact `T†T` natural domain. **Do not add an alternate Hamiltonian definition.**
4. On a causal failure at one of the seven editorial deltas, compare historical and integrated Lean elaboration in the narrowest possible surface. Treat `letI` vs `let` as a typeclass-inference question, not a physics failure. Preserve RED receipt, proof statement, exact source and independent consumer through any repair.
5. Only after BE GREEN, plan BF current paired Hamiltonian and source graph, then BG closed charge equality, then BH operator/domain equality. Each demands an independent exact proof receipt; success of BE alone cannot promote BF/BG/BH.

## A prospective next physical join
Current K2B makes the literal paired physical Hilbert space nonzero. BE, if requalified, gives the literal normalized Hamiltonian a dense natural domain. This suggests a subsequent nonzero **Hamiltonian-domain** witness by the same density/closure argument as M3W0D0. It would still **not** show the explicit radial bump lies in the domain or prove any eigenvector.

## Scientific stop conditions
- Preserve distinction of original physical Hilbert subtype from ambient FullL2, and native minimal *closed* graph from a convenient extension.
- Do not transport an unbounded Hilbert adjoint through M2C0's nonisometric continuous Banach equivalence.
- Do not infer a positive eigenpair, a ground state, compact resolvent or BFSS mass gap from self-adjointness and nontrivial domains.
- M3G0B1-BI remains a separate basis-independence research gate; M4 original Spin(9) and M6–M8 physical-sector coercivity remain conditional.

**Decision:** BE is the next independent M5 qualification target **after** the active source-domain gate is adjudicated; no BE proof/workflow/source files are modified by this memo.
