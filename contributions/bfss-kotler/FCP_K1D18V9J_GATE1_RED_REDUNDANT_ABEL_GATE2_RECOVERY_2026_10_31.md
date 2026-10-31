# Project Lead — V9J Gate 1 RED: both exact scalar proofs closed before redundant `abel`; Gate 2 bounded recovery

**Research date:** 2026-10-31 PDT. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`. No V9J theorem root qualifies until a fully green strict gate.

## Immutable failed run and precise cause

- [V9J strict Gate 1 #41200062246](https://github.com/etblink/math/actions/runs/41200062246), attempt 1, terminal **completed/failure**, tested SHA **`83d58f76a2fb7277678130ea99eee2e2d2d5d2a6`**, job **`124533929011`**.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9BracketDefectScalarProbe.lean`, exact original source Git blob **`9429126cdd3f21e769da4bb5e176fce9dd456ea0`**.
- Original Fock-paired gamma and 48-label source pins **PASS**; pinned `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; accepted V9I typed additive bracket defect ancestors compiled **PASS**.
- **Fresh V9J warning-as-error source compilation RED** at **line 35:2** and **line 46:2**, each `error: No goals to be solved`, exactly at the separate trailing `abel` tactic. Preceding `simp only [smul_mul_assoc, mul_smul_comm, map_smul, map_sub, smul_sub]` had **already discharged each theorem's goals**.
- The source compiler still printed allowed declaration axiom reports on `coordinateToPairedBracketDefect_smul_left` and `coordinateToPairedBracketDefect_smul_right`: each **`[propext, Classical.choice, Quot.sound]`**, no `sorryAx` or unclosed proof. **Independent fresh theorem specialization and axiom check SKIPPED** because strict source compilation failed. A mathematically complete declaration is not an accepted strict gate until it compiles free of errors.
- [Preserved Gate 1 compiler artifact #13042387231](https://github.com/etblink/math/actions/runs/41200062246/artifacts/13042387231), name `bfss-v9j-original-paired-bracket-defect-scalar-83d58f76a2fb7277678130ea99eee2e2d2d5d2a6-1`, ZIP SHA256 **`ba33924b92e841ba2029e06c2ebd88facf5404af0d5ac66233f8a55e473bbf7c`**, size 543 bytes.
- Separately seen in logs: Lake warnings that some cached external packages have local changes. They are not the V9J Lean compilation failure. Keep this warning as infrastructure provenance; do not conflate it with the two exact source errors or attempt to alter frozen dependencies.

## Gate 2 bounded correction

- Only remove the two trailing `abel` lines. Preserve the original definitions of `coordinateToPairedBracketDefect` and `coordinateToPairedLinearMap`, source-native real 9×9 input `SpaceIndex`, original paired-Fock 48-real output `Source48Label`, and both theorem statements verbatim.
- Corrected exact source Git blob **`41d74947e5e4d272f2b174274f62af7c8d52bce7`**; source-hash-only workflow update Git blob **`7d9f9fa35e92443f11db3e74894f0b93a550fdaa`**.
- Normal fast-forward atomic source/workflow commit **`2673e3c8dd06a094228188577145b73802746dea`**. Verified parent-child diff: **two proof tactic lines removed**, **one workflow exact hash replaced**, no linter suppression, timeout increase, changed theorem, or ancestor source modification.
- [V9J strict Gate 2 #41200902831](https://github.com/etblink/math/actions/runs/41200902831) triggered at exact tested commit `2673e3c8dd06a094228188577145b73802746dea`. **Pending** until complete strict source build, two independent imported typed proof checks, two axiom reports, and preserved artifact digest.

## Qualification boundary and next theorem

V9I establishes both additivity laws `D(A+B,C)=D(A,C)+D(B,C)`, `D(A,B+C)=D(A,B)+D(A,C)`. V9J seeks **real scalar homogeneity** `D(c•A,B)=c•D(A,B)`, `D(A,c•B)=c•D(A,B)` for arbitrary real native 9×9 `A,B`, with `D` the exact original paired 48-real commutator-preservation defect. Full `ℝ`-bilinearity is unqualified until Gate 2 passes.

**Accepted ledger remains V8A–V9I = 63 theorem roots; V9J contributes 0 pending Gate 2.** Neither arbitrary skew-input commutator preservation, a typed so(9) LieHom, a global Spin(9) group lift nor any BFSS physical/spectral result follows from the Gate 1 source error. All are separate obligations.

**Negative-knowledge method:** “No goals to be solved” on a trailing tactic is an *extra proof command* problem, not missing mathematical evidence. Preserve the red artifact, edit only the redundant command, retain exact source/test pin synchronization, and rerun independent strict checking. Do not weaken gates. Keep accepted Lean files and frozen FCP, mathcommunity upstream, and `main` untouched. Do not create an upstream PR without owner authorization.
