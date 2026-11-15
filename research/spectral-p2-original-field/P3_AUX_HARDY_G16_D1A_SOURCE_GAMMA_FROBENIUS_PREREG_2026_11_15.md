# G16 D1A — preregister source-exact Frobenius gamma-word orthogonality diagnostic

**REGISTERED_NOT_EXECUTED · November 15, 2026.** Accepted full predecessor G15 R4 strict [#43763173942](https://github.com/etblink/math/actions/runs/43763173942), canonical roadmap GREEN [#43768817888](https://github.com/etblink/math/actions/runs/43768817888). G16 D0 finite index/rational diagnostic GREEN [#43768003845](https://github.com/etblink/math/actions/runs/43768003845) with independent [audit](diagnostics/P3_AUX_HARDY_G16_D0_R2_GREEN_43768003845_AUDIT_2026_11_15.json); none is a full G16 numerical source theorem.

## Precise hypothesis

For the **actual original source gamma family** `M.gamma : SpaceIndex → GammaMatrix` in `M : AlgebraData 2`, and finite spatial index sets `s,t : Finset SpaceIndex` with `s.card≤4` and `t.card≤4`, prove
```lean
Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
              OAI.BFSSGamma.word M.gamma t)
  = if s = t then 16 else 0.
```
This must consume unmodified `OAI.BFSSGamma.list_transpose`, `M.gamma_symmetric`, and `OAI.BFSSGamma.trace_reverseWord_word M.gamma M.gamma_clifford` (canonical `GammaWords.lean` blob `d12051e70de679f5458dbd456667a32c7b407ce4`). Also expose self-pair 16 and distinct-pair 0 with named roots, but do NOT silently claim `originalHardyY` or Fock tau reduction.

## Bounded D1A test plan

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG16SourceGammaWordFrobenius.lean` imports only literal original `Core` and `GammaWords`. No new representation, no proof of Clifford by a synthetic matrix, no axiom/sorry/admit/unsafe, no high resource tweaks. Three proofs: generic trace-or-thogonality, exact self/diagonal, exact distinct/off-diagonal. Independent consumer `lean/diagnostics/BFSSP3AuxHardyG16SourceGammaWordFrobeniusIndependentConsumer.lean` imports source and accepted `SU2BFSSG4JExactGaugeDataAssemblyProbe` to specialize to the original `pairedAlgebraData`. At least five native examples, including variable-data orthogonality, diagonal and explicit singleton vs singleton/triple literal controls. Source and consumer each emit exactly the 3 source reports and the trusted `OAI.BFSSGamma.trace_reverseWord_word` donor report.

Fresh strict workflow: checkout pinned G15 baseline `4d45f9c3bd1b3b2e94c7d23e2576a8fb87a65166`, freeze all imported existing OAI source blobs against that baseline; explicitly pin `GammaWords`, G15 source+consumer+workflow, G16 D0 source+consumer+workflow; record exact recursive OAI closure without guessing its count. Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, source/consumer -DautoImplicit=false -DwarningAsError=true, cold native build and full evidence artifact with first-causal log; root axiom reports must be subset of `propext`, `Classical.choice`, `Quot.sound`.

## Falsifiers and stop

A mismatch of `GammaMatrix`/GammaWords native types, a missing symmetric-gamma interface or new Lean axiom, wrong singleton/triple mixed trace, linter warning, a donor byte mismatch, or an incorrect consumer statement is a RED diagnostic. On first red preserve complete evidence and isolate smallest causal repair; on two analogous reds stop for architecture review. Never change accepted G15, D0, source `Core` or `GammaWords`, and never relax warning/axiom/resource checks.

D1A GREEN would certify **only** source gamma Frobenius word pairing and its original paired carrier consumer. D1B later must prove consecutive-plane ordered-triple = sorted-word identity and unique supports, then the exact original coefficient quadratic. Full G16, Spin(9) covariance, energy/domains, sector Hardy and fidelity remain OPEN.
