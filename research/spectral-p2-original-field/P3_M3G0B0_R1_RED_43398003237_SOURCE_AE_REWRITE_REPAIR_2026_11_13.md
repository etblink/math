# P3-M3G0B0 R1 — strict RED, first causal rewrite failure
**Observed:** 2026-11-13 Pacific, exact original source-evidence check.
**Verdict:** RED, mathematical gate UNQUALIFIED. This is a **Lean tactic/definitional-matching problem** with two explicit a.e. hypotheses, not a disproved operator equality.

## Immutable strict evidence
- [Strict run #43398003237](https://github.com/etblink/math/actions/runs/43398003237), run attempt 1; **completed/failure**. Immutable tested SHA `9b64f7661918bc07db6d3d8d1db62737d4c036ba`.
- Failed job `original-source-ae-and-consumer` #131793570525; successful setup, checkout, 461-pin original source/consumer preflight, pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration; failed at **Cold build original gauge a.e. B0 source and independent Fock consumer**. Source compilation itself fails, so independent consumer and axiom checks were NOT independently completed or qualified.
- First causal diagnostic: `P3M3G0B0OriginalGaugeAEBasisColumn.lean:57:10`, `Tactic rewrite failed: Did not find an occurrence of the pattern`. Hypothesis `hboson` refers to `(Lp.compMeasurePreserving …) v`; the goal is phrased as `pairedGaugeData.bosonPullback g⁻¹ v`. This is a *definitionally identical* pair, but `rw [hboson]` does not find the syntactic occurrence.
- The second diagnostic is the **same method defect** at source `:106:10`: `hright` is a pulled-back `EventuallyEq` whose hypothesis is expressed with `Function.comp` and the goal is a direct application at `pairedGaugeData.boson g⁻¹ x`; `rw [hright]` does not find the compound application syntactically.
- The build produced three `#print axioms` output blocks containing `sorryAx` because the source errors left proof holes. This is a **real strict RED**; do not call these declarations axiom-free or qualified until the independent new CI succeeds.
- Red artifact: #14024434157, `sha256:d597cecbaf66ff5934b97183a212a68f1b7f9a78b48290cacc2308436c8e2b47`, 73,986 bytes, preserved with cold build failure log and exact 461-pin preflight.

## Grounded prior successful methodology
Historical original SU2 L6G7Y `SU2BFSSPhysicalDomainL6G7YActualSourceFullL2CombinedGaugeGroupLawProbe.lean` blob `a402183a963f4c334da93c32257941e1b92a0e62` already uses `change … at hinner` and `change … at hprod` after `Lp.coeFn_compMeasurePreserving` and `ContinuousLinearMap.coeFn_compLp` to expose wrapper defeq before rewriting. B0 has the *same* interface issue.
- Micro-repair source line 57: retype `hboson` using `change (pairedGaugeData.bosonPullback g⁻¹ v) x = v (pairedGaugeData.boson g⁻¹ x) at hboson`, then prove the target by `congrArg (pairedGaugeData.fermion g) hboson`.
- Micro-repair source line 106: retype `hright` from `Function.comp` into literal point evaluation at the inverse source boson action, then use `congrArg (pairedGaugeData.fermion g) hright`.
- Do NOT change three theorem statements, imported APIs, original operator norm, physical left-output/inverse-boson conventions, any accepted M3G0A/M2/L6G7 source or independent consumer. Preserve the unchanged `459+2=461` exact manifest topology; only the B0 source pin and strict workflow's matching pin string change. No resource escalation, theorem generalization or surrogate action.

## Formal bounded retest protocol
1. Commit this exact R1 RED receipt and update `BFSS_GATE_STATE.json` **before** editing the proof source.
2. Update only two closing tactics on the staged B0 source. Generate the new exact Git blob hash and replace exactly two previous source-hash occurrences in the B0 strict workflow's manifest preflight. Leave independent consumer blob unchanged.
3. Stage strict R2 on canonical integration branch with original 461-pin preflight, source cold build, independent original Fock consumer and three root axiom audits permitting only `propext`, `Classical.choice`, `Quot.sound`.
4. On R2 RED preserve the first new causal error (don't assume R1 fix succeeds); on GREEN verify run tested SHA and source/consumer hashes before promoting B0 and moving to B1 full operator source-a.e. extensionality.

## Scope
The accepted M3G0A gate remains [#43391099205](https://github.com/etblink/math/actions/runs/43391099205), exact `f5fffd4aa3ad0ddfda499f87a5e358cf83e83b2f`. No new physical operator identity, basis independence, source operator-norm isometry, physical fixedness, Hamiltonian or spectral theorem is implied by this R1 failure or its repair.
