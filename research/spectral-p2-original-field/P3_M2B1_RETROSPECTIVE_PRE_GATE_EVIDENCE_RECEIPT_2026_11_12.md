# P3-M2B1 — retrospective pre-gate evidence receipt and source-reuse decision
**Recorded:** 2026-11-12 Pacific / 2026-11-13 UTC
**Status:** RETROSPECTIVE PROCESS REPAIR — NOT A PRE-STAGING SIGNOFF, NOT A GREEN, NOT A MATHEMATICAL CLAIM.
**Owner:** BFSS Project Lead.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Candidate first staged:** `f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6`; [strict run #43356859031](https://github.com/etblink/math/actions/runs/43356859031) was IN PROGRESS when this audit began.
**Reason for retrospective receipt:** the published M2B1 blueprint stated target, prerequisites, falsifiers and exclusions but lacked a clearly labeled evidence matrix and full source-retrieval record required by the standing protocol. This receipt is deliberately written **after** initial source staging. It must never be represented as proof that a pre-stage check was completed.

## A. Exact mathematical contract and exclusions
Source carrier `OriginalFockHSFiber ι := PiLp 2 (fun _ : ι => Fermion 2)` on finite `ι`; measure `μ : Measure X`, `[MeasurableSpace X]`. The actual physical consumer uses `X := Boson 2`, `μ := volume`, `Fermion 2` and a concrete `EuclideanSpace.basisFun` basis on `Fin (2 ^ (8 * colorDim 2))`, without enumerating the `2^24` vectors.

Exact target:
```lean
Lp (OriginalFockHSFiber ι) 2 μ ≃ₗᵢ[ℂ]
  PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)
```
The seven current candidate declarations provide finite-column `MemLp` iff, B4B-based equivalence, forward column projection, almost-everywhere component equality, both inverse laws and Hilbert-field norm preservation. The **original operator-norm carrier** `Fermion 2 →L[ℂ] Fermion 2` remains unchanged. No source bounded-operator-norm L² equivalence, almost-everywhere source-operator reconstruction (M2B2), original SU2 gauge action, Spin9 continuity, closed source Hamiltonian/form domain, spectrum, mass gap or unification claim is proved by this contract.

## B. Actual retrieval and coverage
- Inspected original `P3D5B4BOriginalFockL2ColumnEquiv.lean` and `P3D5B0OriginalFockL2Columns.lean` source signatures, M2A source/consumer and predecessor receipts, pinned Lean/Mathlib versions, `BFSS/Core.lean` original Fock carrier, and pinned Mathlib `Mathlib/Analysis/InnerProductSpace/PiL2.lean` `EuclideanSpace.basisFun` in current forward-research pass.
- Consulted active M1/M2 qualified history, the M2A R1/R2 causal-red memos, the M2A R3 acceptance receipt, existing BFSS pre-gate, source-reuse, H1/H2 and historical retrieval operating procedures and dated index descriptions; these are DISCOVERY and procedure, never proof authority by themselves.
- Earlier forward investigation also examined the source-shaped full-L² representative and HS-unitary donor modules. They are relevant to **later** M2B2/M3, not necessary imports for M2B1.
- **Limit:** no claim of a full 99-branch FCP/raw-note exhaustive search or execution of the historical lookup CLI in this audit; qualified source signatures were directly retrieved from the active integration branch. Historical indexes may be dated and incomplete.

## C. Candidate evidence matrix
| Predecessor | Source and evidence | Exact type fit | Disposition |
|---|---|---|---|
| `originalFockL2ColumnsEquiv μ`, plus `apply` and both inverse laws | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B4BOriginalFockL2ColumnEquiv.lean` blob `a0243e653c21c72693dc9484c868851eee1295dc`; [strict #43343959865](https://github.com/etblink/math/actions/runs/43343959865), tested `fa6d34dd54101fc61df5b637e33f92b96aa4c995` | Exact after unfolding M2A `abbrev` HS carrier | **DIRECT REUSE**; no new abstract proof |
| `OriginalFockHSFiber` transparent alias and source-Fock operator linear equivalence/trace pairing | `P3M2AOriginalFockHSFiber.lean` blob `89543ae62bc971303cbb15d3a0c3207e114d57fa`; [strict #43351955062](https://github.com/etblink/math/actions/runs/43351955062), tested `b2b17d2da5e4bc1a97718665f2d9c1d1aef553f3` | Exact Hilbert column carrier, not norm isometry of original operator norm | **DIRECT REUSE** for field notation; **NOT APPLICABLE** to operator-norm L² |
| `originalFockL2ColumnProjection_apply_ae` and `originalFockHilbertColumnField_memLp_iff` | `P3D5B0OriginalFockL2Columns.lean` blob `9c870ed078e09d9bd58dd267c5e21d7fa70cbd40`; accepted D5B0 [strict #43309538795](https://github.com/etblink/math/actions/runs/43309538795) | Exact original `Fermion 2` `Lp` field component and MemLp map | **DIRECT REUSE**; no new a.e. representative construction |
| Concrete original Fock orthonormal basis | Pinned Mathlib `Mathlib/Analysis/InnerProductSpace/PiL2.lean` `EuclideanSpace.basisFun`; physical source `BFSS/Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | Actual source Fock EuclideanSpace; independent consumer must elaborate exact type | **EXACT ADAPTER / INDEPENDENT TEST**; no enumeration |
| Original operator norm vs HS norm comparison | Source trace D5A and M2A; upstream finite HS inequality donors inspected during forward research | **Not** an equality of the original operator norm with HS norm | **UNQUALIFIED** for later M2B2 only |

## D. Negative knowledge and actual novelty
- [M2A R1 #43349181533](https://github.com/etblink/math/actions/runs/43349181533): **preflight RED** — inherited manifest paths renamed during manual workflow cloning; Python silently collapsed two duplicate keys. The recovered 81-key manifest is the current source of truth; do not repeat naive global find/replace on pinned dictionaries.
- [M2A R2 #43349543790](https://github.com/etblink/math/actions/runs/43349543790): **source Lean RED** — opaque `def OriginalFockHSFiber` prevented ordinary `PiLp` algebraic/Hilbert instances, with cascading elaboration errors. R3 changed exactly `def` to `abbrev` and was independently strict GREEN, **without raising resource limits**.
- M2B1 deliberately adds **no new deep isometry argument**: the finite-field isometry already exists as B4B. The only missing source interface is the transparent M2A-named HS-field-to-B4B adapter with source-specific `MemLp`, a.e. projection, norm and a concrete original-Fock consumer. This is an **EXACT ADAPTER** and independent replay, not a reimplementation of B4B.

## E. Bounded plan, decision and CI ceiling
- Candidate source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2B1OriginalFockHSFieldColumns.lean`, blob `e51e9db6d99adfdd9b077ffb846aef6155fecac6`.
- Independent consumer `lean/diagnostics/BFSSP3M2B1OriginalFockHSFieldColumnsIndependentConsumer.lean`, blob `01a72e91bbf8afd1f39d9083224220d6a6480b3d`.
- Strict workflow `.github/workflows/bfss-p3-m2b1-original-fock-hs-l2-columns-strict.yml`; 81 pinned accepted ancestors **plus two** candidate blobs = 83 distinct pins. Pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Require cold source compilation, independent consumer, seven explicitly named source/consumer `#print axioms` with only permitted foundational axioms, retained artifact SHA/digest. A preflight GREEN does **not** imply a proof GREEN.
- **Retrospective decision:** source reuse justified the bounded exact-adapter gate; **GO only for original HS-field finite-column bridge**, and **HOLD on M2B2/M3–M8** pending new source-exact joins. No further gate staged here. If #43356859031 fails, classify first causal layer before repairs; if green, verify exact tested SHA/consumer/axioms and commit acceptance before proceeding.
- **Protocol correction:** future gates require evidence receipt **before** their first source commit. Do not backdate or silently treat this repair as compliance with that chronological rule.
