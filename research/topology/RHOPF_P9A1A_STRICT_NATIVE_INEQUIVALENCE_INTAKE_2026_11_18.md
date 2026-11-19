# RHOPF-P9A1A — original gamma generator inequivalence gate (PROSPECTIVE)

Date: 2026-11-18. Branch: `integration/bfss-unified-research-20261108`.
Accepted parent: P9A0 R2 strict GREEN, tested SHA `7ce988d6fa44330dc436aa94c2750d33de07bf4f`, evidence accepted at `91b53ca97269672f1aad085b413104286b0950f9`.

## Mathematical target

Prove in original native Lean that `K13 = gamma 1 * gamma 3`,
`K25 = -(gamma 2 * gamma 5)`, and
`K46 = -(gamma 4 * gamma 6)` are pairwise different as full
original `GammaMatrix` (16x16 real spinor matrices).

Reuse the accepted original 36-pair trace-Gram theorem
`source9OriginalGamma_ordered_distinct_pair_trace_zero`
and diagonal source trace
`source9OriginalGamma_pair_square_trace_neg_sixteen`.
Their pairing is zero across different source planes but -16 on
a canonical pair with itself. Hence distinct canonical bivectors are
not even scalar multiples. This is a general statement about the
original source gamma representation, not an alternative model.

Four candidate declarations:
`originalGammaPair_ne_scalar_distinct`,
`K13_ne_K25`, `K13_ne_K46`, `K25_ne_K46`.

## Independent verification and scope

An independent Lean consumer elaborates the three full-R16 inequalities.
The original-gamma independent integer consumer rechecks the literal
signed-permutation source, different full matrices, common selected-R4
phase and transverse projection residual. Only the full-R16 inequalities
will be native P9A1A theorems; the common four-coordinate restricted
action remains P9A1B and is NOT qualified as Lean here.

Exact hash preflight, pinned Lean 4.34.1/Mathlib, warning-as-error
native/independent consumers, #print axioms, original CI artifact
and no sorry/axiom additions are required. No acceptance can be
reported until the tested run is independently inspected and GREEN.
Any RED must be retained, diagnosed and repaired without changing
the mathematical claims or original physical source files.

No source BFSS Core/Fock/Hamiltonian modification, full physical
Spin(9) implementer, Noether charge, vortex particle, conserved Hopf
density, or Standard Model identification is claimed. FCP and NFC
governance remain unchanged.
