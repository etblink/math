# G15 R2 — preregister typed real-table proof before source substitution

REGISTERED_NOT_EXECUTED; commit verified R1 evidence and this contract before proof edits. G14 #43749092953 remains accepted. G15 R1 #43751403932 is RED at source48:31; see [red receipt](P3_AUX_HARDY_G15_R1_RED_43751403932_FOUR_PLANE_COEFFICIENT_TRANSPARENCY_2026_11_15.md).

## Exact permitted proof-tail change

Only originalHardyTau_fourPlane_sum_eq_cliffordLinear changes. First prove, with a neutral coefficient table b : Fin4 -> FermionIndex2 -> Real,

    sum_t M.cliffordLinear (b t)
      = M.cliffordLinear (fun p => sum_t b t p).

Unfold only AlgebraData.cliffordLinear in that local proof. Apply the same original real-to-complex sum, scalar-sum distribution and sum permutation to b, where no source matrix entry occurs. Then instantiate the established local identity with

    fun t p => originalHardyY M (i t) (j t) X p.2 alpha p.1.

Do not unfold originalHardyTau before performing the finite calculation on b. The concluding application may consume its literal definition by ordinary definitional equality. This is a proposed repair requiring CI, not a proved explanation of every internal compiler step.

All six source statements, other five source bodies, the complete consumer `7e873eae9001339a0f746637b9ac906311ec106b`, imports, roots, cross-term square, half factor, native controls and all existing donors stay fixed. No new helper module or extra build phase. Workflow may change only source blob pin. Expected169 closure, helpers1+3+1/source6/native12/all12 and Lean/Mathlib/warning/axiom/time/compiler limits stay fixed.

Before publication require exact one-proof delta and unchanged statements/consumer; hashes; YAML/bash/five Python/literal preflight; positive-six-negative auditor fixtures; guarded checkpoint. Local Lean unavailable. Fresh CI must recompute169 pins and complete all source/native controls.

Same source coefficient/transparency or native conversion boundary again => stop full retries for isolated source-shaped diagnostic and two-red review. No resource increase or warning suppression. Numerical tau estimate and physical symmetry/energy-domain/Hardy/fidelity assumptions remain separate.
