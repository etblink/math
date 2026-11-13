# P3-M3W0D0 R2 — source-exact original paired algebra namespace repair

**Date:** 2026-11-13 Pacific. **Status:** R2 STAGED; NO mathematical qualification until a new exact successful strict run.

Predecessor R1 [#43481282293](https://github.com/etblink/math/actions/runs/43481282293) completed **RED** at exact tested source `a8c6b285d6477ef037ec863e530a22478268611f`, job `132078130827`, artifact `14065039518`, digest `sha256:ebb7493ff8898bef81644213be98a61ffd342e5d004f3bda1b129ad743d6f89a`. [First-causal immutable R1 RED receipt](P3_M3W0D0_R1_RED_43481282293_PAIRED_ALGEBRA_NAMESPACE_2026_11_13.md).

The immutable import-closure preflight **PASSED** with 201 paths, historical original K2B and BA Lean source imports compiled, and Lean 4.34.1/pinned Mathlib restored. The first new error was source line 50: unknown identifier `pairedAlgebraData`; same identifier errors at 64 and 71, and derived unknown theorem/provisional `sorryAx` followed. This is Lean namespace resolution, not a refutation of dense-domain nontriviality.

**Exactly one added `open FCP.BFSSSU2GaugeG1A` line** in each:
- original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3W0D0OriginalNonzeroPhysicalChargeDomain.lean`, R1 `6f307c53e84499b53d2ac78ac4086cc39dcdf9c0` → R2 `86823abdddb70d1c2158f8e215fb35760e107fd5`;
- original independent consumer `lean/diagnostics/BFSSP3M3W0D0OriginalNonzeroPhysicalChargeDomainIndependentConsumer.lean`, R1 `d0801eec68a52a89206acc8cadabe296e0043fa2` → R2 `38fab7d4dd44728cb1aef81d581340bcce755ac7`.

This matches historical BF's original `open FCP.BFSSSU2GaugeG1A` before using `pairedAlgebraData pairedGaugeData`. Only the two immutable blob checks were updated in the existing strict workflow, and the advisory canonical-checker expected source/consumer byte pins. **All three theorem statements and complete proof bodies are unchanged**, as are every historical donor, original Hamiltonian/domain definition, toolchain, imported-closure baseline, five donor axiom roots, and independent consumer examples.

Strict R2 workflow: `.github/workflows/bfss-p3-m3w0d0-original-physical-charge-domain-strict.yml`, push triggered only for source/consumer/workflow, read-only provenance until genuine verdict. Guard against false promotion: original physical L² nonzero, native physical sixteen-charge-domain dense and a nonzero native domain vector are the only three proposed roots; a new Hamiltonian eigenvector, radial domain membership, supersymmetric vacuum, original BE port or mass gap are not claimed.

**R2 qualification is not a result.** On a RED, preserve first causal error and repair narrowly; on a GREEN, independently verify source+consumer+allowed-axiom reports and exact tested SHA, update canonical checkpoint *before* moving on to BE.
