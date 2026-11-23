# GM5E2 R1 — original source native RED: redundant change tactic

**Disposition: R1 UNQUALIFIED. Preserve this original error; a subsequent GREEN may supersede its qualification outcome but never delete the negative diagnostic.**

- [Original strict RED #45114089413](https://github.com/etblink/math/actions/runs/45114089413), attempt 1, exact tested SHA `06bc2e6606117ee6321e8472ef48a6f8ada4b782`, original job `137492808415`. Frozen original-source / consumer preflight **PASS**; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored **PASS**.
- Native source **RED** at build job 9,145/9,145; first-causal error:
```text
OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSGM5E2OriginalRadialWeightedCoreSubtraction.lean:34:2:
Unused tactic linter: `change ...` does nothing
```
The source theorem `FCP.BFSSGM5E2.radialWeightedCore_sub` printed `[propext, Classical.choice, Quot.sound]` after the diagnostic, **but a permitted-axiom report during a failed build does not qualify the source**. The independent paired consumer was **not executed**. The required strict GREEN sentinel was not emitted.
- Original provider [artifact #14791960823](https://github.com/etblink/math/actions/runs/45114089413/artifacts/14791960823), **17,187 bytes**, SHA-256 `e9b4d86a7f60c37e7afe24b13a2aaf44865697b3c54b1b9d208141467d51e52d`, matches the original provider metadata and job upload log. Independently downloaded original ZIP: all **six** members passed CRC and member SHA-256 checks; embedded tested SHA and exact three tested blob hashes agree. [Evidence manifest](evidence/gm5e2-r1-original-red-manifest.json) and [complete original job log](evidence/gm5e2-r1-original-red-complete-job.log) are preserved. The original provider ZIP remains accessible at its provider link, but its binary bytes have **not** been committed to this repository.

| Tested file | Git blob SHA |
| --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSGM5E2OriginalRadialWeightedCoreSubtraction.lean` | `d831c6022a34f34b336c06c52815e6e19d346bc3` |
| `lean/diagnostics/BFSSGM5E2OriginalRadialWeightedCoreSubtractionIndependentAudit.lean` | `99457caf1f3412468ef09739c7fb874884280d6d` |
| `.github/workflows/bfss-gm5e2-original-radial-weighted-core-subtraction-strict.yml` | `e33e9563771deb540eb62716b763a66b9fe0c8e7` |

## Causal analysis and bounded response

The original weighted source proof successfully elaborated through `Lp.ext`, the four source a.e. identities, pointwise rewrites and `smul_sub`, but one `change` tactic after the `filter_upwards` binders was definitional no-op. With `set_option warningAsError true`, Lean makes the linter warning an actual native build failure. This is a **tactic-hygiene defect**, not a counterexample to weighted subtraction.

**R2:** remove the redundant `change` and preserve every substantive proof line; leave theorem statement, source dependencies, original Fock carrier, independent consumer, frozen CI workflows, toolchain, and elaboration budgets untouched. Require a separate original strict full native source and independent consumer GREEN, permitted-axiom reports, tested Git bytes and evidence artifact before promotion. Do not disable the linter.

No result about weighted closure density, physical Hamiltonian spectra, gap, Hopfion, GUT, or the Standard Model follows from R1. Preserve the separate M4 anchor list and all prior RED/qualified GM statuses.
