# HARDY-X0 R2 prospective repair — explicit real unit-row and sum types

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT LEAN QUALIFIED.
R1 [#43623576828](https://github.com/etblink/math/actions/runs/43623576828) RED at 47e36232762e707d3b72ccb1dacbe9ca2c4f0fb5. [Receipt](P3_AUX_HARDY_X0_R1_RED_43623576828_REAL_UNIT_ROW_INFERENCE_2026_11_14.md) checkpointed before any R2 source change.

## Observation and fixed hypothesis

Same actual original Xi principal-symbol action, per-row norm coefficient 1/2, sixteen-row coefficient 8 and genuine source charge cutoff coupling. Same five roots, ten independent reports and eight native examples/controls. R1 fails locally at the unit-row hv annotation: a Pi.single value expected Nat while provided Real. It does not refute the norm identity.

The existing donor signature in CliffordSymbols.lean at exact cc01379653404c4ede3d551fd8d823e079543b21 explicitly requires v : SpinIndex -> Real. Reuse it unchanged.

## Sole independent proof variable

In originalHardyXi_norm_sq's local hv fact, explicitly annotate
- the whole Pi.single alpha (1 : Real) function as SpinIndex -> Real;
- its squared finite sum as Real.
Retain the same simp proof and the same principalSymbol_unit_norm_sq application. No change to definitions, public statements, other source proofs, consumer or controls.

Source R1 a84f1413524f894b364b1eb274f6d5edb47ad9f5 changes only that local type annotation.
Consumer 1c81d54d3d14c13d0b4bcaddea0a8602d20e73b8 stays byte-identical.
Workflow b4a2b26f0a0fc53307ebddac8dad812892ea96f5 changes only expected source hash. Keep baseline e406851deadc1d5b90ed2f609232d75ebb9e162e, original Core/G4J/CliffordSymbols pins, toolchain, full cold/fresh source+consumer audit, report order, budgets and strict warning policy.

Commit this receipt with R1 checkpoint before first R2 mutation.

## Falsifiers, analysis and decision

If a real annotation fails to resolve the same boundary, preserve exact typed output; a second related red requires an isolated diagnostic. Wrong Xi/phase/coefficient, altered source/control, compiler error, disallowed axiom or warning blocks qualification.
Full source and actual paired consumer must pass; three clean R1 roots do not constitute acceptance. Named five/ten standard-axiom reports and origin/nonzero controls remain required.
Scope stays native Xi norm and smooth-core cutoff only. No tau, physical Spin9, full closed supercharge identity, Hardy/fidelity, zero mode or gap qualification.
