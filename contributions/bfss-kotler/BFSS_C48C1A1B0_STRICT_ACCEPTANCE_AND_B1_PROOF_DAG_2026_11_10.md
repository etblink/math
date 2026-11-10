# FCP–BFSS C48-1A1b0 strict qualification and C48-1A1b1 Proof-DAG handoff

**Date:** 2026-11-10 (Pacific). **Parent:** Foundational Convergence Program (FCP).  
**Repository / branch:** `etblink/math` / `integration/bfss-unified-research-20261108`.  
**Classification:** C48-1A1b0 **QUALIFIED as a direct strict diagnostic**; C48-1A1b1 **UNQUALIFIED candidate until its independent source/consumer strict workflow succeeds**. Not a physical Hamiltonian, spectral, cosmological or three-generation result.

## 1. Exact accepted C48-1A1b0 receipt

- GitHub run: [#42880436131](https://github.com/etblink/math/actions/runs/42880436131), job `130054952858`: **completed SUCCESS**.
- Exact tested commit: `b588df82d5adb272dbda42d88d6fe04dc459f22c`.
- Original diagnostic: [BFSSC48C1A1b0OriginalS1JAxisMulVecMinimalProbe.lean](../../lean/diagnostics/BFSSC48C1A1b0OriginalS1JAxisMulVecMinimalProbe.lean), pinned Git blob `0d1ef875b4932f4171260264488a57de89e22381`.
- Source-parent blob pins: S1J `de0a042cb39f58b81a0ebd54ce64912bff481a80`; G3B `3cdf867357ea2955bf9d88ec6f5f6a0f9228e92a`; S1V5 `fad0eab5014aa038ddb0bf8411b0e81c358e7908`.
- Toolchain: Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. All **9,021** source dependencies built, exact 4-blob preflight matched, `-DwarningAsError=true` diagnostic succeeded, all three named theorem axiom reports contained only `propext`, `Classical.choice`, `Quot.sound`. No sorryAx in proof diagnostics.

Strict-qualified declarations, scoped to `FCP.BFSSC48C1A1b0OriginalS1JAxisMulVecMinimalProbe`:

1. `originalSourceLabel_eq_G1AColorMode`: original S1V5 source label equals actual G1A original complex-mode label paired with its real/imaginary bit.
2. `originalS1J_sourceBlockColor_entry`: literal actual S1J matrix coefficient matches G3A output-color/input-color column on matching spin pair and real/imaginary bit.
3. `originalS1J_mulVec_sourceBlockColorAxis`: original source S1J 48×48 real Majorana matrix acting on the *exact* coordinate axis is the original SU(2) adjoint color-column sum.

**Qualification ceiling:** These theorems were accepted in a direct diagnostic file, but that workflow did **not** separately compile an independent consumer importing them as a source module. Do not overstate it as source-importable C48-Fock covariance. This distinction motivates the next bounded gate.

## 2. Next gate C48-1A1b1: one independent consumer, no new physics

**Tiny DAG**:

- `B1-S0` **PROVEN (diagnostic)** — retain the three exact source-axis proof statements without weakening, recopy into a stable importable module [C48C1A1b1OriginalS1JAxisMulVecSource.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C1A1b1OriginalS1JAxisMulVecSource.lean).
- `B1-S1` **EXISTING QUALIFIED PARENT** — original `FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix_one`.
- `B1-C0` **NEW SEPARATE CONSUMER, CANDIDATE** — import the new source module and derive a distinct consequence: `∑ B, R(1) B A • e(j,s,B) = e(j,s,A)` using the imported axis theorem and the source S1J group-identity matrix. The theorem is finite original-label algebra and deliberately small.
- `B1-GATE` **PENDING** — exact five source/consumer Git-blob pins, pinned Lean/Mathlib, source module build, separately compiled warning-as-error consumer, and four explicit `#print axioms` reports with only standard axioms. Do not claim accepted before success.

**Why this gate:** It verifies the exported proof is really importable, the original types have not drifted, and a distinct downstream corollary can consume it. It avoids reopening the six-red mathematical development and closes the missing consumer requirement before moving on.

## 3. Next actual mathematical DAG, after B1 qualification

- `F1`: exact original source Gamma on each G1A 48-axis matches the genuine G4G/G4H Fock-Majorana action, including normalization and signs.
- `F2`: genuine G4E Fock SU(2) unitary intertwines one source Gamma axis; keep the coefficient color ordering exact.
- `F3`: combine the now exported S1J source-axis column and linearity of the original Gamma map to identify the transformed axis.
- `F4`: extend to all original `Source48Vector` using source basis/real-linear extensionality (separate gate), then provide independent consumer.
- `PHYS`: original source gauge-physical Hilbert, actual closed quadratic form and spectral results remain separate obligations.

**Governance:** No original BFSS Core source, accepted ancestor or FCP canonical frozen corpus is changed by the C48-1A1b1 candidate. Historical red runs are retained in [Proof-DAG-First failure ledger](BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md). Failure is feedback; the next run's first causal diagnostic governs any repair, with no blind multi-red cycling. The speculative Hopf/three-generation investigation is a separate read-only evaluation lane and has **not** been promoted by this C48 result.
