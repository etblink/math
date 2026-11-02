# BFSS Project Lead — current-state succession handoff

**As of:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Active repository:** `etblink/math`  
**Active branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Latest code qualification SHA:** `e646bc5b9d21da7b357fbcb572dc399c519c9600` (F10AV Gate 5).

## Repository roles and authority

- `etblink/math` is the active Lean implementation repository. The current work is on the named research branch, not the default `main` branch.
- `etblink/Foundational-Convergence-Program` is the research/provenance repository. Its current `main` tree has 445 tracked entries and zero `.lean` files; use it for the charter, source register, claim ledger, independent reviews, causal audits, and research history, not as a second Lean build tree.
- Historical FCP branches retain important BFSS/SU(2) source-first investigations and the Project Lead evergreen guidance. The evergreen is on `research/openai-math-su2-s1v52-global-lift-scoping-20261019`; do not rewrite it for each gate. Keep per-gate failures/acceptances and current-state handoffs in scoped records.
- The host math repository's `AGENTS.md` is explicit that repository contents are not peer reviewed or externally certified. Report internal Lean gate outcomes precisely; do not imply peer review, publication validation, or physical truth.

Useful governance/method sources:
- [FCP Project Lead evergreen guidance](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md)
- [FCP procedural success/failure review and execution plan](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_BFSS_PROJECT_LEAD_PROCEDURAL_SUCCESS_FAILURE_REVIEW_AND_EXECUTION_PLAN_2026_10_26.md)
- [FCP source-first crosswalk](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-physical-domain/audits/OPENAI_MATH_BFSS_FCP_SOURCE_FIRST_CROSSWALK_0_1_0.md)
- [Post-Gate-174 scientific scope boundary](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-physical-domain/audits/OPENAI_MATH_BFSS_SU2_POST_GATE_174_SCIENTIFIC_SCOPE_BOUNDARY_0_1_0.md)
- [K1D18 post-V9Z global Spin(9) dependency audit](FCP_K1D18_POST_V9Z_GLOBAL_SPIN9_INTEGRATION_DEPENDENCY_AUDIT_2026_10_31.md)

## Current formalization state

### F10AV — original gamma 16-real image

F10AV Gate 5 is accepted by the owner-maintained strict gate: [run #41381629875](https://github.com/etblink/math/actions/runs/41381629875), exact tested SHA `e646bc5b9d21da7b357fbcb572dc399c519c9600`, artifact #13113149849, ZIP SHA256 `9b20c44947d4b5e4ecef5783e45aacc4a1374eb9fcd47ce58c2b67d4f65a380e`. Eight declarations were freshly compiled under warnings-as-errors and independently type/axiom audited; all have only `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.

Exact content: `rho(A) = (1/4) Σ_{r,s} A_rs γ_r γ_s` from native real 9×9 matrices to the original 16×16 gamma-matrix carrier; `rho(F_rs) = (1/2) γ_r γ_s` for distinct coordinate planes; every skew source input maps into native `so(16,ℝ)`. This is a linear/skew-image theorem only. Arbitrary bracket preservation and a typed `so(9) → so(16)` `LieHom` remain unproved.

See [F10AV Gate 5 acceptance](FCP_K1D18V10H_F10AV_GATE5_ACCEPTANCE_ORIGINAL_GAMMA_COORDINATE_LINEAR_MAP_SKEW_IMAGE_2026_11_01.md), [Gate 4 red/repair](FCP_K1D18V10H_F10AV_GATE4_RED_UNUSED_BINDER_AND_GATE5_REPAIR_2026_11_01.md), [preflight/publication causal review](FCP_K1D18V10H_F10AV_PREFLIGHT_AND_WORKFLOW_PUBLICATION_CAUSAL_REVIEW_2026_11_01.md), [Gate 2 compiler review](FCP_K1D18V10H_F10AV_GATE2_COMPILER_DIAGNOSTICS_AND_GATE3_REPAIR_2026_11_01.md), and [Gate 3/Gate 4 review](FCP_K1D18V10H_F10AV_GATE3_FAILURE_AND_GATE4_SOURCE_PATTERN_REPAIR_2026_11_01.md).

### Distinct 48-real paired-Fock line

Do not conflate F10AV's original 16-real gamma representation with the separately qualified original paired-Fock 48-real representation:
- V9F supplies exact source-native skew 9×9 coordinate-plane spanning.
- V9I/J/K/L/M provide a successful typed bracket-defect route through additivity, real scalar homogeneity, generator-pair zero, one-plane-versus-skew extension, and arbitrary-skew-pair vanishing.
- V9P constructs typed source/target skew carriers and their matrix commutator interfaces.
- V9R/S/T construct and transport a genuine `so(9) → so(48)` LieHom on the original paired-Fock label order.
- V9Z establishes fixed-generator one-parameter flow facts; it does not establish a global Spin(9) group homomorphism, covering, or surjectivity.

These are strong proof-method precedents for F10AV, not permission to identify the 16-real and 48-real targets.

## Immediate research plan

1. Build a small source-exact theorem proving F10AV generator-pair bracket compatibility. Reuse `coordinatePlane9_universal_four_index_bracket`, F10AU's exhaustive original-gamma pair bracket, and F10AV's coordinate-plane evaluation. Preserve the `1/2` normalization and handle all diagonal/overlap cases.
2. Define the 16-real raw matrix bracket defect `D(A,B) = rho([A,B]) - [rho(A),rho(B)]`. Prove real bilinearity with typed linear slices, following V9I/J; prove generator-pair zero with F10AU; extend one plane against arbitrary skew input using V9F/V9L; then extend arbitrary skew pairs using the V9M pattern.
3. Only after the arbitrary-skew bracket identity is strictly accepted, construct the exact source and target skew `LieSubalgebras`, verify the pinned Mathlib skew-adjoint interfaces, and build a genuine typed `LieHom` for the original 16-real target. Reuse the structure of V9P/V9R/S/T without copying their 48-real labels.
4. After any LieHom, perform a separate source/API and topology audit before attempting global Spin(9) integration. Group-level integration, the original Clifford/Fock action, covering/surjectivity, gauge/physical-domain compatibility, and BFSS spectral existence are independent obligations.

## Operational rules

- Two lanes: inexpensive exploration/diagnostics, then fail-closed formal acceptance. Do not turn a diagnostic candidate into an accepted theorem.
- Formal gates require exact source hashes, exact accepted-ancestor pins, pinned Lean/Mathlib, warnings-as-errors compilation, fresh `.olean`, independent exact theorem-type elaboration, declaration-level `#print axioms`, no `sorryAx`, and retained run/artifact SHA evidence.
- Atomic source + workflow-pin commits are preferred. Keep the independent audit restatement synchronized with the source theorem, including binder names and `noncomputable` context.
- Classify the first causal failure. Preflight false negatives, workflow serialization errors, dependency/restore issues, Lean elaboration failures, linter failures, and mathematical counterexamples are different categories.
- Preserve red runs. Do not repeat the same edit without understanding the diagnostic. Never disable linters, weaken theorem statements, add axioms/admissions, increase `maxRecDepth`/heartbeats to hide a bad interface, or change the pinned toolchain to force green.
- Reuse accepted modules only by exact declarations and source pins, not by filename presence or build-job counts. Typed structure-field bridges and explicit finite-index order have repeatedly worked better than large expression unfolding.
- Preserve the original paired-Fock label formula `ℓ(α,a)=2(3j+a)+r` for `α=2j+r`; never substitute a color-major ordering without a proved transport.
- No changes to `math` main or FCP main. No upstream mathcommunity PR without explicit owner authorization. Keep physical/spectral claims separate from formal algebraic results.

## Scientific boundary

FCP's earlier physical-domain branch contains source-level and domain/form work, but its post-Gate-174 audit explicitly leaves the gauge-restricted form identity and any new spectral theorem unadjudicated. Do not infer BFSS spectral existence from F10AV, V9T, V9Z, a finite matrix identity, or a formal Lie algebra map.