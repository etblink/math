# IBI-G0B1 FIN-DET3 — source-color signed determinant microgate

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Disposition:** preregistered source/consumer/strict-CI candidate, NOT a proved theorem until independently qualified.

## Motivation

G1B strict GREEN [#43703395473](https://github.com/etblink/math/actions/runs/43703395473) establishes the literal original paired-Pauli signed +sqrt(2) Lie/cross relation and gauge invariance. Exact source G3A supplies `adjointColorMatrix g` with output rows and input columns. The next small gate must identify the **same source `colorCross`** with the ordered-column 3x3 determinant.

## Exact finite mathematics and source binding

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1FinDet3.lean` (Git blob `c53fe995551ec85af6c66f9a5939dd421bbc9c10`) defines
`originalColumnTriple R = ∑ A : Fin 3, colorCross (column 0 R) (column 1 R) A * R A 2`.
The prospective `originalColumnTriple_eq_det R` uses `Fin.sum_univ_three`, literal existing `FCP.BFSSSU2.colorCross`, and `Matrix.det_fin_three` followed by ring normalization. A second source theorem specializes to **the actual source** `FCP.BFSSSU2GaugeG3A.adjointColorMatrix g` for arbitrary `g : GaugeGroup 2`. It does NOT assert `det=1`.

Independent consumer `lean/diagnostics/BFSSIBIG0B1FinDet3IndependentConsumer.lean` (Git blob `61ed8edbf37d54c115768a0df8f75a8f40e909db`) keeps three tests: arbitrary actual G3A adjoint matrix, identity orientation +1, and a **nonsymmetric improper reflection** whose signed triple must equal -1. The reflection is a negative control, not claimed to be in the gauge image.

## Frozen qualifications and stop rules

Workflow `.github/workflows/bfss-ibi-g0b1-fin-det3-strict.yml` (Git blob `bcd47fbe4f856a87e9bf832e2af51fa4cd9421b4`) enforces exact source and consumer bytes; pins G1B original source blob `b42291fe0aa5f8b22a31bad19b9de5c775372a71`, G3A `553869f1287c64893398c3b79c04fe010023bd08`, original Pauli cross `209b3808222730ca5e817d83ed32253a67513f7f`, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; requires fresh cold source + independently compiled 3-example consumer, warning-as-error, and three named `#print axioms` reports allowing only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. Preserve artifacts. First causal RED must be recorded before any bounded repair; two analogous REDs trigger architecture review. Do not escalate limits.

## Scientific claim ceiling

Even GREEN qualifies only the signed finite determinant polynomial and its **original-source specialization**. G0B1 native `det (G3A.adjointColorMatrix g)=+1` remains to be proved using original gauge-conjugated basis columns and preserved source triple. G0C original SU(2) image surjectivity, G2 rank-split orbit classification and physical FullL2/Fock/Hardy applications remain open. Do not infer incidence ontology, mass gap or physical ground-state existence. Unified integration, `main`, FCP, and the original incidence pilot remain unchanged.
