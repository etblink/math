# BFSS M2C0 → M3/M5 source-reuse and operator-domain guardrails
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC.
**Scope:** READ-ONLY research result preserved as DOCUMENTATION ONLY on the active integration branch; no new Lean theorem, strict qualification, existing pin mutation or source-port repair.
**Active checkpoint at inspection:** [M2C0 strict #43375482588](https://github.com/etblink/math/actions/runs/43375482588) testing exact `548d7978779e0a9ca5a91e01fccb686a786640f1`; **94-pin preflight passed** and pinned environment restoration underway, verdict NOT YET OBSERVED in this memorandum.

## 1. Verified current original L² and column inputs
- [B2 strict #43371757607](https://github.com/etblink/math/actions/runs/43371757607) is accepted GREEN at `e95886123e78015351c9fffa73a0e5f2b4d986fc`: source `P3M2B2B2OriginalOperatorLpContinuousEquiv.lean` blob `7bab48f3da13633049afe94100bcde80e2be0c27`, genuine **original bounded Fock operator-norm** `Lp` ↔ separately normed HS-field `Lp` continuous equivalence. Not an isometry.
- [M2B1 strict #43356859031](https://github.com/etblink/math/actions/runs/43356859031) qualified genuine HS-field original Fock-vector `Lp` column isometry, source blob `e51e9db6d99adfdd9b077ffb846aef6155fecac6`.
- [M2C0 prospective receipt](P3_M2C0_PROSPECTIVE_SOURCE_OPERATOR_TO_GENUINE_FOCK_LP_COLUMNS_RECEIPT_2026_11_12.md) preceded the M2C0 candidate. M2C0's `≃L[ℂ]` source plus a.e. `(f x) (b i)` output-column law and independent actual-Fock consumer require SAME-SHA strict GREEN, not an inference from B2 or M2B1 alone.

## 2. Recovered exact original SU(2) physical L² action and fixed-space sources
The current integrated `OperatorDependencies/` directory contains these source files. **Source presence is NOT a current-tree strict source/consumer qualification without explicit matching run evidence.** Their comments may date to prospective historical stages; establish exact test SHA and consumer/axiom receipts before promoting.

| Historical/current source file | Blob on current integration branch | Declaration/interface visibly present |
|---|---|---|
| `SU2BFSSPhysicalDomainD2B6SourceFullL2GaugeActionProbe.lean` | `02a0e02fde11ae8b0b6162df9a7f7a3df9a0800b` | `sourceFullGaugePairCLM M G g` on actual `FullL2 2`, equal to `G.fiberAction g (G.bosonPullback g⁻¹ v)`; source norm bound |
| `SU2BFSSPhysicalDomainD2B7SourceFullL2GaugeIsometryAndFixednessProbe.lean` | `351d2d226c53a3cff8a5e1d08c2d3e24c63a0f86` | source gauge isometry and physical fixedness |
| `SU2BFSSPhysicalDomainL6G7VActualSourceFullL2PhysicalFixedSpaceProbe.lean` | `cd7f1dd791daa930f5fa5a0016c607abc40903cd` | `actualOriginalFullL2GaugePair_fixed_iff_physical` for source `pairedGaugeData.physicalSpace` |
| `SU2BFSSPhysicalDomainL6G7WActualSourceFullL2GaugeIsometryProbe.lean` | `26cebbbd7c13dde06347637245ee53abfa9e3ed9` | actual original gauge isometry |
| `SU2BFSSPhysicalDomainL6G7YActualSourceFullL2CombinedGaugeGroupLawProbe.lean` | `a402183a963f4c334da93c32257941e1b92a0e62` | true group law of combined original boson-pullback and Fock-fiber action |
| `SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe.lean` | `7f42aab817da8061aa76b251e4e2ba7c3b8379ed` | `actualOriginalFullL2GaugeUnitaryHom : GaugeGroup 2 →* (FullL2 2 ≃ₗᵢ[ℂ] FullL2 2)` (group law, not strong group-parameter continuity) |

The exact physical VECTOR-valued gauge action is `(U_g ψ)(X) = pairedGaugeData.fermion g (ψ(pairedGaugeData.boson g⁻¹ X))`, acting on genuine `FullL2 2`. **For new OPERATOR-valued fields, the correct corresponding action is left-output**:
```text
(G_g T)(X) = pairedGaugeData.fermion g ∘ T(pairedGaugeData.boson g⁻¹ X)
```
It is NOT operator conjugation `U_g T U_g⁻¹`. The right/input Fock basis `b i` is left untouched. Thus at the representative level, candidate equation:
```text
columns_b(G_g T)_i = U_g (columns_b T)_i
```
where `U_g` on the right is the existing full physical vector `Lp` gauge action. This pointwise equation must be promoted to Lp-class equality using the **actual source a.e. representative laws** and the **original bosonic measure-preserving pullback**. It does not follow merely from a renamed symbol.

## 3. Recommended M3 dependency DAG after M2C0
1. **Qualification audit FIRST** for the exact current source gauge unitary/fixed-space chain G4J, L6G7U/V/W/Y/Z or a smaller exact earlier D2B6/7 path. Recover strict source/consumer SHA, axiom roots and group-law orientation. Do not claim an integrated theorem green from inspectable source only.
2. Define one literal left-output original operator-valued Lp gauge action using true `pairedGaugeData.fermion g` and the actual boson `g⁻¹` pullback; prove bounded action and group law at original operator norm (left unitary preserves pointwise operator norm). Avoid norm substitution.
3. Prove the one-column a.e. intertwiner under the accepted M2C0 continuous column equivalence. Source `M2C0` must be GREEN before promotion. No column/input-index gauge transform.
4. Prove operator-sector fixedness iff *every* original-Fock Lp column is fixed under the genuine original `FullL2 2` gauge action; reuse L6G7V `physicalSpace` characterization only after exact-current-source qualification. This should identify a closed subspace corresponding to a finite PiLp of `pairedGaugeData.physicalSpace` as a **bounded linear equivalence**, NOT automatically a Hilbert-space isometry for the operator-norm carrier.
5. Only after original left-output gauge and full physical fixedness qualify, investigate source Spin9 operator automorphism compatibility. Operator conjugation may describe Spin/gauge algebra automorphisms but is NOT the SU2 physical left-output operator field action.

## 4. Historically qualified actual physical Hamiltonian route and critical port differences
The historical FCP BA→BE→BF→BG→BH operator-domain chain is **strict GREEN only at the original tested commits**, e.g. [BA #39079626713](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39079626713), [BE #39088799248](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39088799248), [BF #39092193590](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39092193590), [BG #39093937250](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39093937250), [BH #39096180117](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39096180117). The original BH job explicitly rebuilt the original D2B18–28 dependency chain, and its **seven** source theorem axiom roots reported only `propext`, `Classical.choice`, `Quot.sound`, with final kernel-pass marker and historical artifact `12125201817`.

Original FCP BH source at `9a65ad89b7000a401655bd1355e27b4ed6ff6d50`, blob `05a540772eb1b0e5c8570fd4eca101be76bbdd9b`; current imported BH port blob `a4818bb38bf22fd629f6b6c3c373c38479525dd4`. Exactly **two import-path changes and one `letI : CompleteSpace ...` → `let : CompleteSpace ...`** in BH. The adjacent current BG port only changes imports; BF changes imports and one `letI`; BE changes imports, multiple `letI` local instances, two `omit [CompleteSpace E]` annotations and a simplifier proof line. Earlier M3H `letI`/lint RED was *not* a theorem counterexample, so do not infer an actual BE/H failure from text changes alone.

**M5 requalification recommendation:** begin at the earliest ported BE interface (and any changed ancestor if relevant), compare exact proof-body edits with historical source, compile under current pinned Mathlib, independently consume the native physical Hamiltonian `(1/16)T†T` on its **natural domain**, then advance BF→BG→BH in source/consumer microgates. Do NOT rederive a new source Hamiltonian or use the historical BH run to certify edited current bytes without a current-tree strict gate.

## 5. Spectral and operator-domain safety constraints
An M2C0 continuous equivalence between an operator-NORM Lp Banach carrier and a Hilbert PiLp2 column model does not by itself preserve an *adjoint* or *self-adjointness* assertion on the source. Topological/closed graph equivalence and Hilbert-unitary equivalence are different. Self-adjoint direct-sum amplification belongs naturally on the **declared Hilbert source column realization** with its inner product and must inherit exact original natural operator domains; separate source operator-norm Lp isomorphic space cannot be relabeled as Hilbert with an unproved equality of inner products.
Moreover, neither gauge fixedness nor domain equality alone proves a spectral gap. Keep high-sector coercivity, genuine physical reducing sector, massless-valley exclusion, and positive eigenpair existence separate and falsifiable.

## 6. Status and preservation boundaries
**This memorandum is research-only**. No Lean source/consumer, current strict M2C0 workflow, historical FCP original, `main`, frozen monograph or source proof blob changed. M2C0 will be qualified only by independent strict run #43375482588. Do not start M3 theorem source before M2C0 acceptance and a fresh prospective M3 evidence receipt.
