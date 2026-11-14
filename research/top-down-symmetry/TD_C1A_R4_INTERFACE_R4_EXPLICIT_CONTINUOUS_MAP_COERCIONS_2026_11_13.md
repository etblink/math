# TD-C1A R4 focused interface attempt R4 — explicit continuous-map coercions

**Date:** November 13, 2026 Pacific. **Status:** preregistered focused feasibility correction; no full original strict gate or new qualification.

## First-causal evidence and full interface review

R3 #43550275483 at 4f375b1a0a63a20ad7c1260e375aa19b16767306 failed at the generic helper's invalid LinearIsometryEquiv.toContinuousLinearMap field. The preceding explicit normed-module import worked. P0 compiler and immediate audit passed; native stages were skipped.

The raw verified artifact and two-RED interface review are preserved by commit c3400c640721c45b19630e7fbc039a9238ec8bc5. This attempt follows that review rather than adding a broad import or increasing elaboration budgets.

Pinned Mathlib Analysis/Normed/Operator/LinearIsometry.lean directly supplies:
- the isometry-equivalence-to-continuous-map coercion instance;
- LinearIsometryEquiv.coe_coe'', identifying the coerced function with the original isometry;
- the explicit equivalent route through toLinearIsometry followed by LinearIsometry.toContinuousLinearMap.

The first route is used consistently. Normed.Module.Basic remains explicitly imported. ContinuousLinearMap.ext and composition multiplication are the only operator interfaces in the generic proofs; function congruence supplies evaluation. All assumptions and conversions were checked against the pinned source definitions.

## Exact bounded change

- Generic helper: replace four invalid U.toContinuousLinearMap expressions in the two statements by the explicit typed cast (U:E→L[𝕜]E). Proof bodies and hypotheses are unchanged.
- Native diagnostic: replace five analogous intermediate G4E operator expressions by the literal typed continuous-map cast of fermionGaugeUnitaryHom q. All proof tactics and the final original_allVector_pointwise statement/proof remain byte-identical.
- Workflow: update only the generic evaluation and native probe hash pins. The generic basis source, early stage auditor, stage ordering, root sets, toolchain, 120-second compiler budgets and warning policy remain unchanged.
- The original full TD-C1A theorem source, original independent consumer and original strict workflow remain frozen.

New evaluation helper blob: c57e9669a7d7ef9d46a4ed4919fb4baaebcd949a.
New native diagnostic blob: 6329d9014a11ff77042c1a999861aee3b2072f1b.

Local checks parsed YAML, every shell block and embedded Python; validated new source blob pins and absence of the mistaken field shortcut; verified the native final pointwise declaration was unchanged and generic stages still precede the cold original build. No local Lean compiler is available: these checks are not compilation evidence.

## Preregistered decision

Experiment E-TD-C1A-R4-P0P1-R4 preserves the same generic and native targets. First require generic P0 and evaluation P0B compiler plus immediate root/warning audits. Only then incur the cold original-axis build and native P1. Stop on any failure and preserve the first causal stage. A further generic boundary error requires another complete source review; a native recursion error reopens native architecture review.

GREEN means INTERFACE_FEASIBLE_ONLY. Original full strict TD-C1A qualification and its unchanged native independent consumer remain separately required. No physical gauge fixedness, Spin9 vector representation, Hamiltonian or spectral result is promoted.
