# RHOPF-P9A0 — strict original Gamma9 bivector microgate intake

**Date:** 2026-11-18. **Project Lead, unified integration branch.**
**Accepted parent research checkpoint:** P9 commit e3a1b78dc90799107a8d3d54ea0f4b397d3d7b99.
**Status at source staging:** PROSPECTIVE PENDING ORIGINAL NATIVE LEAN + INDEPENDENT LEAN CONSUMER CI.

## Bounded reason for gate

P9's exact-original signed-permutation Python consumer found that three different
Spin(9) bivectors, Γ1Γ3, −Γ2Γ5, −Γ4Γ6, restrict to the *same*
complex Hopf circle on original R16 spinor coordinates (0,1,8,9). They differ
outside that R4 and rotate different SO(9) planes. This is a useful structural
counterfactual *failure of identifying the full source generator*.

Before a large explicit matrix theorem, isolate the source-family algebra:
for any two distinct original gamma indices, the real 16×16 product is skew
and squares to -identity; instantiate three bivector choices. These proofs
import the **literal original** FCP.BFSSGamma9.gamma from
SU2RealGammaProbe.lean (Git blob b9b8192055c70f0d001d7982669b9823c55562ed),
not an alternate gamma matrix or the 2^24-dimensional Fermion 2 carrier.

**P9A0 Lean theorems:** originalGamma_sq, originalGamma_anticommute,
originalGammaPair_sq_neg_one, originalGammaPair_skew, K13_sq, K25_sq,
K46_sq, K13_skew, K25_skew, K46_skew.

**Independent finite source check:** standard-library-only Python parses
the literal original signed-permutation tables, compares the previously
verified source fixture byte for byte, checks all 9×9 Clifford relations,
384 selected subcarrier entries, all three nonidentical full source matrices,
and the 36-bivector orthogonal Gram projection. Exact results:
||J_selected||_F²=4; ||P_Spin9 J_selected||_F²=3;
||J_selected−P_Spin9 J_selected||_F²=1.

**Qualification boundary:** The finite-coordinate R4 equality, triple
inequivalence and residual have **not yet been written as Lean proofs in P9A0**.
They are independent source tests only. P9A1 may promote those finite
identities after a green original-source compiler gate. No new
Fock-vector Spin(9) implementer, Hamiltonian/domain-invariant Noether
current, physical 3D vortex, particle spectrum or Standard Model charge
is constructed.

**Original source pins:** Core.lean Git 9882359ced78b0a3bd7e2f057974bd0a031b3e60,
SU2RealGammaProbe.lean Git b9b8192055c70f0d001d7982669b9823c55562ed,
fixture Git 684680e139cfcd09c37bf075c0c014bdaa80ba35.
Pinned Lean 4.34.1; Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
The strict workflow is limited to new P9A0 paths and retains original
tested commit, compiler output, full axiom reports and failed diagnostic logs.
No axioms, sorry, admits, unsafe or custom compiler resource escapes.
Any failure is evidence; do not silently weaken theorem statements.

**Project Lead stop rules:** Do not mark green until the exact original
native source and independent Lean consumer finish strict CI at the tested
commit, the preflight and axiom reports pass, and the evidence is retained.
Even a green P9A0 proves only elementary original Gamma9 bivector algebra,
not the P9A1 restricted Hopf equivalence or a physical conserved symmetry.
Preserve BFSS, FCP, SM-D1 and retired NFC canon unchanged.
