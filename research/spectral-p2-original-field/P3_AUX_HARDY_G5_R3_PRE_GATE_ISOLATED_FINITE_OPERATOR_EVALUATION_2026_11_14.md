# HARDY-G5 R3 prospective recovery — isolated typed finite operator evaluation

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
R2 #43647718971 RED tested e76aff10b5ebc16706ac27dec3affcc9d5542e7c; preserve exact typed result before mutation.

## Required isolation and exact Layer1 contract

Create lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG5FiniteOperatorEvaluation.lean, namespace FCP.BFSSP3AuxHardyG5FiniteOperatorEvaluation, import Mathlib only. For any finite index type I and complex normed vector space E, continuous-linear families V,T:I->E->L[Complex]E, an operator identity SUM(a)(V_a*T_a+T_a*V_a)=0 implies for every v:E the vector identity SUM(a)(V_a(T_a v)+T_a(V_a v))=0. Name finiteOperatorAnticommutator_apply; print exactly FCP.BFSSP3AuxHardyG5FiniteOperatorEvaluation.finiteOperatorAnticommutator_apply.

Proof uses congrArg evaluation and only finite sum, add, current mul_apply_eq_comp and root zero_apply rewrites. Pinned Mathlib Topology/Algebra/Module/ContinuousLinearMap/Basic.lean was read: it provides IsMulApplyEqComp, current zero_apply and deprecated protected aliases. Avoid those aliases. No native model is unfolded in this helper.

## Layer2 source delta

Import helper into G5. Replace only originalPotentialTau_anticommutator_apply proof body with explicit helper instantiation on the original potential/tau operator families, actual existing operator-zero theorem and actual v:Fermion2. All six public statements, first five proofs/definitions and original types fixed. Consumer 5e2257d149462ca507c1f9ccde2231846b4bbe65 byte-identical with twelve controls. No new physical assumption: helper's operator premise is discharged by the original source theorem, not added as a public G5 hypothesis.

## Prospective workflow delta

Freeze helper as third candidate source with own expected hash/import/report checks and source-closure exception; add workflow push path. After pinned Mathlib cache/toolchain, build and fresh warning-as-error check only this Mathlib helper before expensive native cold build. Capture helper-build.log and helper.log; audit exact one report/standard axioms plus same error/warning policy. Then run unchanged full cold source/G4J build, fresh source and native consumer. Helper is recompiled as an actual source dependency in that cold build. Keep six/eleven original report lists, twelve controls, baseline f51357761243008201f97d9e0ef0cbefa87d0b06, all donors, Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 and original budgets. Additional helper compile uses existing500-second fresh-check budget, not higher model limits. Evidence includes helper results.

## Falsifiers and acceptance

Any helper/model/native-consumer compile, lint or axiom failure blocks qualification. Isolated helper failure => preserve smallest exact typed output and stop further same-boundary permutations. No maxRecDepth/maxHeartbeats or autoImplicit change. Static exact source/consumer delta, helper/import/report, YAML/bash/Python checks first; no local Lean.

Acceptance requires helper AND complete original source AND native consumer; five clean R2 roots are insufficient. Scope remains pointwise original coefficient-field Fock anticommutator. No literal Core charge equality, full smooth-core identity, physical Spin9/Hardy/fidelity, zero mode or gap. Commit before edits.
