# TD-C1A R4 interface R3 — explicit normed-module import only

**Date:** November 13, 2026 Pacific. **Status:** preregistered focused repair; no mathematical qualification.

R2 #43549082375 at 57e64b3183f8605faf0cc1f824f940f1f6254747 failed first on Unknown identifier NormedField in the generic helper. P0 compiler and its immediate audit passed; native Fock stages were skipped. The verified raw evidence and canonical RED checkpoint were committed as 72532f4d150aef6d182495677c6618d93951f302 before this repair.

The only Lean source change is adding:

    import Mathlib.Analysis.Normed.Module.Basic

to TDC1AR4FockOperatorEvaluationInterface.lean. Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 Module.Basic defines NormedSpace and publicly imports Field.Lemmas, which publicly imports Field.Basic defining NormedField. These exact source imports were read; no unavailable Defs path is used.

Old helper blob: df617aa024e3890465a098b4c339765a8e7f6d15.
New helper blob: a7a5e1b0b4f3f14fbb17a6b509cb7446d69bc3fe.

The focused workflow changes only this expected helper hash. Both generic proof bodies, generic basis helper, native three-root probe, stage auditor, original theorem, original native independent consumer, original full strict workflow, toolchain and stage budgets remain unchanged. The source import repair does not test a different covariance theorem.

**Experiment E-TD-C1A-R4-P0P1-R3:** verify P0 compiler/audit, then P0B compiler/two-root audit before the cold original-axis build, then the same native P1 three-root probe. Any import, generic proof, native source, warning/root/axiom or timeout failure remains RED and must be recorded with its own first cause. No native Fock improvement is inferred from R2's skipped stage.

A focused GREEN means feasibility only. The original full strict TD-C1A source and unchanged native independent consumer must still qualify separately. TD-C1A remains RED_UNQUALIFIED; M5BF0/G0B2 remain accepted.
