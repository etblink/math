# GM1A R1 — native RED at source-exact L² representative transport, 2026-11-22

**Do not qualify R1.** This is first-causal native Lean evidence, not an observed failure of the mathematical statement.

- [Original strict run #45066453015](https://github.com/etblink/math/actions/runs/45066453015), push, attempt 1, exact tested commit `0085d8cdef4f9817c7dc232a490d008adadff08c`; conclusion **failure**.
- [Original artifact #14772530392](https://github.com/etblink/math/actions/runs/45066453015/artifacts/14772530392), 11,636 bytes; independently downloaded and checked SHA-256 `8010290436c61bd29bfd6e3fc1546d38fe41b13641409f87cd73fe5e22d94f52` and all ZIP CRCs. `tested-sha.txt` exact match. Preflight log and original native log verified.
- Frozen original upstream source, exact commit ancestry, original consumer structure and pinned Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612: PASS.
- Native source build reached 9,080 targets; GM0B upstream rebuilt successfully with only trusted axioms, but target `BFSSGM1AOriginalMasslessFockGaugeAETransport.lean` failed at **line 49** before independent strict consumer.
- **First-causal error:** `Tactic rewrite failed: Did not find an occurrence` of `((G.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).compLp (...)` in target containing `G.fiberAction g (...)`. The source a.e. lemma `ContinuousLinearMap.coeFn_compLp` is stated in terms of `compLp`, while the conclusion retains original `GaugeData.fiberAction`; likewise the bosonic `Lp.coeFn_compMeasurePreserving` statement retains `Lp.compMeasurePreserving` rather than source `G.bosonPullback`. Resulting `sorryAx` in failed axiom reports is not accepted.
- **Bounded R2 decision:** insert typed `change ... at hf` and `change ... at hb` to normalize both source **a.e. representative lemmas** to the exact upstream GaugeData wrappers *before* `filter_upwards` and `rw`. Preserve theorem statement, GM0B covariance identity, true Fock, original `FullL2`, source pins, native/consumer strict workflow, and no higher elaboration budgets.
- If the R2 compiler detects that these wrappers are not definitionally equal, stop and preserve the native error. Do not use `sorry`, substitute gauge actions, or claim GM1A GREEN until the independent gate and original artifact both qualify.

**Scientific scope:** GM0B pointwise finite-Fock covariance remains qualified. GM1A a.e. transport is pending. GM2 maximal-domain invariance, graph covariance, physical fixedness, and physical Hopfion all remain unproved here.
