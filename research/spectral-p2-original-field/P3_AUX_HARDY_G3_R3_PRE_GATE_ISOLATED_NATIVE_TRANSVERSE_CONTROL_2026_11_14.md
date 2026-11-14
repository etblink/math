# HARDY-G3 R3 prospective diagnostic-first repair

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
R2 #43638440460 RED tested 8b90de4ed5ed176233eb60fb97e9ae895b8efa0b; checkpoint exact evidence before new mutation.

## Required isolation after second related lint red

R1 failed three unused source arguments; R2 fixes them and passes strict source. R2's sole observed failure is unused smul_ite in the native transverse-axis1/56 consumer example. Honor the two-red rule by isolating that exact control in lean/diagnostics/BFSSP3AuxHardyG3NativeTransverseDiagnostic.lean, namespace BFSSP3AuxHardyG3NativeTransverseDiagnostic, named theorem nativeTransverseControl. Keep same candidate/G4J imports, pairedAlgebraData, explicit native Fin color-zero witness, arbitrary X:Boson2 and direction(single(8,colorZero)1). Proof: same fderiv/CLM rewrites and same simp list with only smul_ite removed. Print and audit exactly BFSSP3AuxHardyG3NativeTransverseDiagnostic.nativeTransverseControl.

Mathematical source 03b5236bd91e4664e7101544b065054bd6c925a1 byte-identical. Existing consumer changes only the sole flagged smul_ite list argument; all twelve statements and proof steps otherwise fixed. No weakening of a native control or lint setting.

## Prospective workflow changes

Freeze diagnostic as third candidate file alongside source/consumer; add exact diagnostic hash, import/report/control checks, source-closure traversal and manifest binding. Add push path for diagnostic. After cold source/native G4J build and fresh strict source, compile isolated diagnostic with autoImplicit=false/warningAsError=true and retained500-second budget to separate diagnostic.log. Only then compile full consumer. Extend existing exact log/axiom audit with the one diagnostic root; keep original five/ten report lists, all twelve native controls, baseline 64718d564f311b914e629e8bae536327b053ee1f, donors, toolchain, budgets and strict policy. Diagnostic is an additional gate, never a replacement for full consumer acceptance. Capture diagnostic in evidence.

## Falsifiers and decision

Any source/isolated diagnostic/full consumer compile or strict report failure blocks qualification. Isolated diagnostic failure => preserve smallest exact goal/lint and stop further same-boundary permutations. If it passes but full consumer fails elsewhere, preserve and reassess that new causal layer. No local Lean; static source/consumer delta, diagnostic/import/roots, YAML/bash/Python checks precede CI. The expected manifest gains exactly the isolated diagnostic root path beyond R2 if imports otherwise unchanged.

Scope: original coefficient actual derivative only. No tau, physical Spin9/Hardy/fidelity, zero mode or gap. Commit before source/consumer/diagnostic/workflow mutation.
