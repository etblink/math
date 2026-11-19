# RHOPF-P9A1B — strict native selected-R4 Hopf action candidate

**Date (Pacific):** 2026-11-18. **Status:** PROSPECTIVE / UNQUALIFIED.
**Branch:** `integration/bfss-unified-research-20261108`.
**Qualified parent gates:** P9A0 R2 and P9A1A R1 (acceptance commit `aece541014d8a743bac092418504aef140f2be8e`).

## Scientific target

Promote exact four-coordinate information from the P9 independent integer
consumer to **source-exact native Lean**. Define a mathematical 16x16
sparse `selectedHopfJ` on original SpinIndex coordinates (0,1,8,9),
with J[0,1]=J[8,9]=-1, J[1,0]=J[9,8]=+1, and other entries zero.

Prove that each actual original-source bivector
`gamma 1 * gamma 3`, `-(gamma 2 * gamma 5)`,
`-(gamma 4 * gamma 6)` agrees with J in all
FOUR selected rows and ALL SIXTEEN input columns. Also prove
the equal selected-row action of all three.

Use original source `SU2RealGammaProbe.gamma` and finite
entry evaluation only. Because each source bivector is skew
(P9A0), full preservation of selected R4 follows
mathematically from these row and column facts, but do not
claim an explicit Lean subspace-invariance theorem unless formalized.

The source gamma table is imported, not replaced. The sparse
`selectedHopfJ` is a comparison coordinate matrix and is
not claimed to be an additional full-source Spin9 generator;
P9 research already has an independent exact residual
`||J-proj_spin9 J||^2=1` showing it is not in the
original Spin9 bivector Lie span.

## Controls and negative knowledge

Strict workflow checks original Core/Gamma/P9A0/P9A1A
blobs and independent gamma fixture, pinned Lean/Mathlib,
warning-as-error original native and independent Lean
consumers, exact axiom reports and original CI artifact.
Do not promote candidate before independent run verification.

The independent finite-coordinate consumer already
checks these 384 entries, but it is not a Lean proof.
No Fock-vector Spin9 unitary, Hamiltonian Noether charge,
closed operator domains, source-specific physical selection,
3D vortex, particle or Standard Model charge is inferred.
No changes to original BFSS Core, Fock, Hamiltonian,
FCP, retired NFC canon or existing qualified P9 gates.

**Stop rule:** any RED is a diagnostic, not a reason to
weaken a theorem or substitute gamma representations.
