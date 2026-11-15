# HARDY-G10 R3 — explicit finite native control proof tails

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit with R2 red checkpoint before consumer edits.

## Exact changes

Freeze source `59aaed1da894e8b91b2df51eda6f47a37cf4c517`, which passes R2 fresh strict compilation with six standard-axiom reports. In old complete consumer `ed4507504ac58eef9bcb4299bb8092c9b9679b75`, change only:

1. Example7, positive +1 coefficient: after existing `simp_all [PiLp.single_apply]`, append `exact Ne.symm hij`, matching the compiler's exact residual goal.
2. Example8, negative -1 coefficient: replace `simp_all [PiLp.single_apply]` by `simp_all`; the compiler identifies that argument as unused.
3. Example10, swapped-plane -1 coefficient: append `exact Ne.symm hij` after existing `simp_all [PiLp.single_apply]`, matching its residual.
4. Example12, distinct-color zero: remove the same compiler-flagged unused simp argument, leaving `simp_all`.

All twelve example statements, all imports, the private pairing abbreviation, the other eight proof bodies and all twelve print reports stay fixed. The strict workflow may change only its expected consumer blob, from old workflow `5e126c42ae799170ee6d4aeca33172747eaa3fc4`. All donor/helper/source bytes, actual carriers, normalization, warning policy, resource budgets and baseline `e22dda02233c1e703cbb092e2ee705c3b169519a` remain fixed. Narrowly extend the checkpoint checker for the exact R2 red and R3 lineage.

## Hypothesis, falsifier, acceptance and stop

Hypothesis: the two remaining finite inequality goals are closed by symmetry of inequality, and deleting compiler-proven unused arguments retains the already successful simplifications. Unknown/mismatched terms, any remaining or new warning, altered statement, failed example or forbidden axiom falsifies the candidate at its boundary.

Require complete163-pin preflight, early helper1+3 audits, cold original build, fresh source6/native12 reports, all twelve actual paired-data examples and final scope audit before qualification. Source-only success is insufficient. Static checks are not Lean proof.

If the same reverse-inequality or native control-conversion boundary recurs, stop full-gate retries and preregister an isolated exact typed/finite control diagnostic. Preserve a distinct first failure and review it before further changes. Do not increase limits, disable warnings, remove controls or change hypotheses. G9 remains accepted; G10 remains only the pointwise orbital CAR coefficient, with no physical or spectral promotion.
