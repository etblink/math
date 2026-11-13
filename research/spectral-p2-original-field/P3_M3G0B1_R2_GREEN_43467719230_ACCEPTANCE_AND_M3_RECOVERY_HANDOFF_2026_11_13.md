# P3-M3G0B1 R2 — strict GREEN acceptance and source-recovery handoff
**Accepted checkpoint:** 2026-11-13 Pacific. **Repository:** `etblink/math`, branch `integration/bfss-unified-research-20261108` only; no changes to `main`. **Mathematical status:** `GREEN_QUALIFIED` solely within the three source-exact a.e. original bounded-operator declarations below.

## Exact strict authority
- [GitHub Actions run #43467719230](https://github.com/etblink/math/actions/runs/43467719230), completed **success**, attempt 1; tested **`adb7f1378fd1e06da45352952a15d32b00c4654b`**, job `132031189522` `original-source-operator-and-consumer` completed **success**.
- **463 exact pins** passed: accepted 459-path original baseline, qualified B0, new B1 source and independent original Fock consumer; preflight marker `BFSS_P3_M3G0B1_463_PIN_ORIGINAL_SOURCE_PREFLIGHT_PASS`.
- Exact Lean **4.34.1**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**, cold original-source build, `-DautoImplicit=false -DwarningAsError=true` source compilation, actual `Boson 2` / `Fermion 2` independent consumer, and all three root `#print axioms` reports passed. Allowed axioms only: `propext`, `Classical.choice`, `Quot.sound`; **no `sorryAx`** in the audited roots. Final workflow marker: `BFSS_P3_M3G0B1_ORIGINAL_FULL_OPERATOR_AE_463_PIN_STRICT_GREEN`.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0B1OriginalGaugeAEFullOperator.lean` (blob **`095e63582a5f04a9dd2be0a192fb42586d97dd2f`**).
- Independent consumer: `lean/diagnostics/BFSSP3M3G0B1OriginalGaugeAEFullOperatorIndependentConsumer.lean` (blob **`42e12c82dcf854fa0be0c73dbd38b0fd13f12692`**).
- Strict workflow: `.github/workflows/bfss-p3-m3g0b1-original-gauge-ae-full-operator-strict.yml` (blob **`b3a7a888b89908a170aa4d1a690b11ef5f5ba9aa`**).
- Preserved artifact [#14061845908](https://github.com/etblink/math/actions/runs/43467719230/artifacts/14061845908), 74,720 bytes; digest **`sha256:6d118ba37e6e045c9576265af36a70cca2fda8f1b5e999de21cb8ad8a05c98d6`**. Artifacts are retention-limited; this text is the permanent pointer, not a replacement for exact source/CI.

## Three accepted theorem roots
1. `originalFockOperatorGaugeEquiv_source_all_basis_ae`: for **each fixed** actual `g,b,f`, a single common a.e. event works for every **finite** original Fock basis index, using `Filter.eventually_all`. No simultaneous a.e. set for all uncountably many `g`.
2. `originalFockOperator_eq_of_basis`: genuine original bounded `Fermion 2 →L[ℂ] Fermion 2` operators equal when agreeing on every vector of the actual ONB. The qualified M2B2B0 HS-column continuous equivalence is used **for injectivity only**, not original operator-norm isometry.
3. `originalFockOperatorGaugeEquiv_source_operator_ae`: the true original operator-norm-valued `OriginalFockOperatorLp` source action `Γ_b(g) f` is a.e. equal to **left fermion-output composition** `pairedGaugeData.fermion g ∘ f(pairedGaugeData.boson g⁻¹ x)`. This is **not pointwise conjugation**. The right-hand representative is identified with an already-existing Lp element; no independent `MemLp` claim is introduced.

## RED-to-GREEN methodological evidence
- Preserve [R1 #43461444633](https://github.com/etblink/math/actions/runs/43461444633), tested `f163921f3363be9154a2ffbe0d3c10e94d0c8e75`, as **RED**, job `132009112218`, artifact `14057579425`, digest `sha256:afc1ccc068640839a6941a719b3089a1bc35692df69af96bc0f7c5e036c4db65`.
- First causal error: source line 78 `simpa only [ContinuousLinearMap.comp_apply] using hx i` did not normalize coercion between the actual fermion continuous-linear map and its function application. This yielded `sorryAx` in the failed theorem's dependency report. Its immutable note is [R1 causal receipt](P3_M3G0B1_R1_RED_43461444633_FERMION_COE_NORMALIZATION_2026_11_13.md).
- R2 changed **one tactic only**, to `simpa [ContinuousLinearMap.comp_apply] using hx i`; the three mathematical theorem statements, 463-pin source contract, and independent Fock consumer were preserved. The successful strict job has now independently qualified the repair.
- Earlier [B0 #43422546945](https://github.com/etblink/math/actions/runs/43422546945) remains the accepted 461-pin predecessor, with three per-basis/vector a.e. roots. Do not rewrite its historical reds or success receipt.

## Explicitly NOT qualified by B1
Neither basis independence across potentially different ONBs, nor isometry in the original operator norm, nor a.e. equality uniform over all `SU(2)` elements, nor source physical fixed-space iff columnwise physical, nor a nonzero physical full-L² witness, nor strong gauge-parameter continuity / Haar-range compatibility, nor the original closed Hamiltonian, Spin(9) Fock-vector lift, spectral gap, mass gap or energy eigenpair.

## Next bounded work; none staged in this documentation commit
1. **P3-M3G0B1-BI**: basis independence from two qualified B1 a.e. operator identities followed by `Lp.ext`. See [existing forward-research BI memo](P3_M3G0B1_BI_BASIS_INDEPENDENCE_FORWARD_RESEARCH_2026_11_13.md); it was authored while B1 was pending, and its old pending status is a historical snapshot.
2. **P3-M3G0B2**: original operator-norm isometry from genuine source fermion isometry and measure-preserving inverse boson pullback, **not** from the nonisometric M2 continuous equivalence.
3. **M3G0C-A** and **M3-W0/W1**, in parallel as **research only**, follow the [historical physical-state recovery audit](P3_M3_HISTORICAL_PHYSICAL_WITNESS_FIXED_SPACE_RECOVERY_AUDIT_2026_11_13.md); the basis-relative fixed-space equivalence is algebraically accessible from M3G0A/M2C0/L6G7V without isometry, but intrinsic physical operator fixedness still requires BI/source identification.
4. D2B8C and D2B9C are historically present; verify exact historical/current qualification separately before importing a Haar projection claim.

**Project Lead verdict:** ACCEPT B1 in the three named theorem scopes; preserve causal RED; hand off to bounded BI and parallel provenance-first physical-state/fixed-space recovery. No new proof, workflow, branch or model publication is authorized by this acceptance note.
