# Project Lead — V8A three-gate causal audit and validator recovery

**UTC date:** 2026-10-30. **Scope:** original paired-label Spin(9) plane generator strict proof, owner branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
**Governing instruction:** Seek truth; preserve both successful and failed evidence; distinguish Lean kernel results, workflow tooling, topological structures, and physical hypotheses.

## 1. Three-red exact evidence: the failures are not equivalent

| Attempt | Run, tested SHA | What passed | First causal failure | Classification |
|---|---|---|---|---|
| Gate 1 | [#41137852252](https://github.com/etblink/math/actions/runs/41137852252), `36a2736a59566742ace408ed2420cd6969225609`, job `124344621413` | Immutable pins, toolchain and ancestors | Lean parser `unexpected token 'ᵀ'` at source 72:17, then dependent syntax errors | Source syntax; module RED, no root qualified |
| Gate 2 | [#41138786968](https://github.com/etblink/math/actions/runs/41138786968), `0eb5a2930d5e7ff10ade37f1935176837ff18c9e`, job `124347697045` | Source pins, ancestors, fresh warnings-as-errors candidate compile, both allowed axiom reports, independent Lean #check | Python assertion required `theoremName + ' :'` but Lean prints binder parameters | **False-negative audit parser**; full gate RED |
| Gate 3 | [#41139797455](https://github.com/etblink/math/actions/runs/41139797455), `f9a049c06f03929fce3e2e22e1ece1995e847757`, job `124351015337` | Source pins, ancestors, fresh warnings-as-errors candidate compile, **both independent exact Lean `example` propositions**, both #check, both allowed axiom reports | Python binder-aware regex expected `OAI.BFSSQuantum.SpaceIndex`, but Lean correctly printed short `SpaceIndex` | **Second false-negative audit parser**; full gate RED |

Gate 3 artifact `13017648599`, digest `sha256:949f843d7385705fe1de8a4b701cdf828f4142413659b0728d86d52115214d4e`. The Gate 2 artifact is `13018221747` (`sha256:ad43cfe7d0a6bea4166656c3c1910c59feb4c0acf5b3b5d0f6030c87e67669de`). Gate 1 evidence is separately retained in the Gate 1 diagnostic. The complete Gate 3 fresh compiled audit showed:

```text
FCP.BFSSPairedSpin9Plane.originalPairedPlane_transpose (r s : SpaceIndex) (hrs : r ≠ s) :
  (FCP.BFSSPairedSpin9Plane.originalPairedPlane r s).transpose = -FCP.BFSSPairedSpin9Plane.originalPairedPlane r s
FCP.BFSSPairedSpin9Plane.originalPairedPlane_sq (r s : SpaceIndex) (hrs : r ≠ s) :
  FCP.BFSSPairedSpin9Plane.originalPairedPlane r s * FCP.BFSSPairedSpin9Plane.originalPairedPlane r s = -1
'FCP.BFSSPairedSpin9Plane.originalPairedPlane_transpose' depends on axioms: [propext, Classical.choice, Quot.sound]
'FCP.BFSSPairedSpin9Plane.originalPairedPlane_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
```

Both **exact Lean `example` proofs passed** in Gate 3. The second printed RHS `-1` is standard normalized matrix notation for negative identity, not a changed mathematical statement. That result constitutes strong Lean compilation and exact-type evidence, yet does **not** change the fact that the entire Gate 3 was RED under the declared full strict qualification policy.

## 2. Compare with successful historical technique

- **V7Z Gate 2** [#41133563019](https://github.com/etblink/math/actions/runs/41133563019): source-exact unchanged original 48-label algebraic composite, 55 fresh Lean sources and 174 declaration-root axioms qualified, positive artifact and exact tested SHA. Its one failed previous gate was recovered by correcting a concrete extra parser parenthesis, not modifying mathematical semantics or increasing proof limits.
- **Paired source CAR/index bridge** [#40573189822](https://github.com/etblink/math/actions/runs/40573189822) and [#40581813437](https://github.com/etblink/math/actions/runs/40581813437): reuse already accepted `pairedLabelEquiv` and exact real-mode source index. Avoid a substitute color-major label.
- **Clifford universal Fock hom** [#40593379663](https://github.com/etblink/math/actions/runs/40593379663): source-typed bridge, not an assumed global Spin(9) unitary.
- Across accepted K1D ancestor chains, **structure → exact source specialization → typed premise bridge → small composition** beat aggressive unfolding, guessing basis order, or raising heartbeat/recursion limits.

## 3. Compare with failed historical techniques and their guards

- FCP M4F8 DE1C [#40046838616](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40046838616): a regex parsed the word `theorem` in a Lean doc comment as a real declaration. Compiler never ran. **Lesson:** validators are fallible; inspect first failing step and never interpret a text parser red as a proof failure.
- FCP M4F6 C2 consecutive [#39889826778](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39889826778), [#39890728887](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39890728887), [#39891517647](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39891517647): genuine repeated recursive elaboration at approximately 7GB RSS. A three-gate stop was appropriate. **Different from V8A:** V8A fresh Lean compilation has passed for two gates and both explicit independent types passed on Gate 3; the blocker is demonstrably validator string matching, not conversion recursion.
- V7H, V7J, V7Q, V7Z red-to-green sequences: preserve first compiler error, prefer exact named typed bridges; remove a redundant tactic, wrong instance assumption, or extraneous punctuation rather than escalating resource limits.

## 4. Design correction and preflight — remove the failure *class*

The offending current Gate 3 validator has this exact requirement:

```python
signature = r'(?m)^' + re.escape(name) + r' \(r s : OAI\.BFSSQuantum\.SpaceIndex\) \(hrs : r ≠ s\) :'
assert re.search(signature,s)
```

Even a semantically correct theorem may pretty-print `SpaceIndex`, fully qualified `OAI.BFSSQuantum.SpaceIndex`, or type aliases in another normal form. Regexes over Lean pretty-printing are not independent semantic type verification. **Never try another wider regex variant** for the type. Instead:

1. Keep the existing independent, freshly compiled Lean `example` declarations that each state the **exact original source proposition and original type** and invoke the exact candidate theorem. Lean elaborates them under `-DwarningAsError=true`. Keep `#check` for human-readable evidence.
2. Keep `#print axioms` for each of the **exact fully qualified two root names**, parse only their controlled axiom declaration lines, fail closed on mismatch, duplicates, forbidden axioms, `sorryAx`, warnings/errors. This is a bounded log contract, not semantic theorem-type parsing.
3. Remove all Python requirements for any particular abbreviated/qualified name in pretty-printed types, line wrap, spaces, or `-1` normalization. The kernel-checked examples replace them, not another text-based approximation.
4. Pin the already compiled theorem source Git blob to prevent accidental source drift. The corrective commit must touch only the **verification workflow**; no Lean theorem statements, proof source, original paired/Fock labels, accepted ancestors, resource limits, `main`, FCP, or upstream repo.
5. Before triggering Gate 4, regression-check the axiom parser against the **literal successful Gate 3 output**, including both printed axiom lines, and verify a bad name/forbidden axiom/duplicate fails closed; retain its evidence. One new path-scoped strict gate is justified because the repair is an **architectural** removal of false-negative type-string parsing, not another variant of the same regex.

**Promotion:** only terminal success for full Gate 4, exact tested SHA/blob, both fresh Lean examples, both independent allowed-axiom reports, and artifact digest justify two newly accepted V8A roots. Skew/square on the *doubled* source 48-label matrix do **not** constitute the Lie bracket representation, continuous Spin(9) group lift, topological covering, Fock group action, or BFSS spectral result. Preserve all previous reds.
