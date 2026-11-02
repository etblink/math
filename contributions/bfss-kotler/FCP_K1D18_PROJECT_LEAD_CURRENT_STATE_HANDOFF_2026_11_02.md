# BFSS Project Lead — current-state delta handoff

**As of:** 2026-11-02 UTC  
**Repository:** \`etblink/math\`  
**Active branch:** \`research/fcp-k1d17-ancestor-cache-pilot-20261028\`

This delta supersedes the F10AW portion of [the 2026-11-01 current-state handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_01.md). Read that handoff for the broader project scope, accepted theorem inventory, governance, and scientific boundaries. The FCP Project Lead evergreen and procedural success/failure review remain governing methodology; neither is rewritten for this gate.

## Accepted checkpoints unchanged

- F10AU exhaustive oriented original-gamma pair bracket remains accepted at run [#41372474729](https://github.com/etblink/math/actions/runs/41372474729), exact source SHA \`0fab538e626080cc97136755b645dc8372424741\`.
- F10AV original-gamma coefficient LinearMap and skew-image remains accepted at run [#41381629875](https://github.com/etblink/math/actions/runs/41381629875), exact source SHA \`e646bc5b9d21da7b357fbcb572dc399c519c9600\`.
- The native source four-index coordinate-plane bracket remains accepted at its exact pinned source.
- These establish the correct input objects, output carrier, source labels, and \`1/2\` coordinate-plane normalization. They do not establish the original 16-real \`so(9) → so(16)\` LieHom.

## F10AW failure history

The following strict runs are immutable and remain red:

| Run | Tested SHA | First material result |
|---|---|---|
| [#41386533662](https://github.com/etblink/math/actions/runs/41386533662) | \`6a6d437885603c6dbe6d4b259cdb023f89602f15\` | Initial source-level type/case proof failure |
| [#41386877451](https://github.com/etblink/math/actions/runs/41386877451) | \`e097871ffaed77b923d00df40fbc380cfbb9da26\` | Subtype dependent-if coercion still not bridged |
| [#41387034218](https://github.com/etblink/math/actions/runs/41387034218) | \`ab524749fa9701e0da9a9a8b92f5692353466573\` | Overlap case handling and strict linter failure |
| [#41388590016](https://github.com/etblink/math/actions/runs/41388590016) | \`277fef5d9f53de80a0668b4203e6126bfa75665a\` | Subtype coercion type mismatch; substitution-based case proof cascaded |

The causal review is [F10AW Gate 1 red: subtype coercion and dependent-if repair](FCP_K1D18V10H_F10AW_GATE1_RED_SUBTYPE_COERCION_AND_DEPENDENT_IF_REPAIR_2026_11_02.md).

## Gate 2 candidate

The next candidate preserves the exact theorem proposition and accepted dependencies. It replaces the fragile \`simp only\` coercion attempt with ordinary simplification at the explicit Lie-subalgebra-to-matrix boundary, and replaces the hand-written \`subst\` case table with a \`split_ifs\` proof over the source and target dependent-if formulas.

This is an unqualified candidate until the fresh strict run and independent exact-type/root-axiom audit both pass. The source/workflow pins are updated atomically. No root is added by the red run.

## Next mathematical sequence

1. Qualify F10AW generator-pair bracket compatibility for every four source labels, including diagonal and all overlap/collision cases.
2. Define the 16-real matrix bracket defect and prove its typed bilinearity.
3. Use the successful V9I/V9J/V9K/V9L/V9M strategy, together with V9F's exact source skew-plane spanning, to extend generator-pair zero to arbitrary skew inputs. Do not import the 48-real target or its label order into the 16-real gamma target.
4. Only after arbitrary-skew bracket preservation is accepted, construct the exact native Mathlib skew-subalgebra \`LieHom\`.
5. Audit group integration and topology separately. Do not infer Spin(9) global integration, Spin(48) covering, Fock realization, gauge-domain compatibility, or BFSS spectral existence from a generator theorem or Lie algebra map.

## Operational and governance boundaries

- Keep the research branch as the only write target; canonical \`main\` and FCP \`main\` remain untouched.
- No upstream mathcommunity PR without explicit owner authorization.
- Preserve every red run and exact artifact; do not count a build-job total as theorem roots.
- Keep the two lanes distinct: low-cost source-interface diagnosis first, fail-closed formal acceptance second.
- No axioms, admissions, linter suppression, theorem weakening, source-basis substitution, or proof-limit increases.


## Superseding delta — F10AW Gate 2 RED (2026-11-02 UTC)

This section supersedes the earlier "Gate 2 candidate" paragraph above.

- [Run #41390535566](https://github.com/etblink/math/actions/runs/41390535566), exact tested SHA `9faaa0f6e25367ab2b53002b219f7bb3d94c045d`, failed at the fresh F10AW compile. Exact source/ancestor pins, Lean 4.34.1/Mathlib restore, accepted F10AV/F10AU ancestry, and native source four-index bracket ancestry passed.
- Earliest error: F10AW line 97 still has the subtype-coerced expression `↑(if ... : LieSubalgebra)` where the target is the matrix-valued `if ... : GammaMatrix`. Ordinary `simp` did not cross this dependent conditional boundary.
- The later two residual goals are impossible overlap cases: `s=u` and `r=u`, or `s=t` and `r=t`, each contradicting `hrs : r ≠ s`. They remain secondary until the carrier conversion is qualified.
- No independent theorem-type/root-axiom audit ran. No F10AW root is accepted. Full immutable evidence is in [the Gate 2 red record](FCP_K1D18V10H_F10AW_GATE2_RED_REPEATED_SUBTYPE_COERCION_AND_DIAGNOSTIC_2026_11_02.md); artifact #13117102550 has ZIP SHA256 `fecff59b4bc5c65e95b9bed0f1bd5e7da996e073ae3160012b2e70b13fae507b`.

### Bounded diagnostic — pending

The Gate 1 stop rule is active. Diagnostic-only source `SU2BFSSPairedSpin9V10HF10AWSubtypeCoercionInterfaceDiagnostic.lean` was added at commit `9357900fc8ae5f0ea8ef112ff1c81dccbd201969`. It tests (A) splitting the dependent conditional after coercing the accepted F10AU equality and (B) an explicit local subtype-`if` coercion lemma.

The isolated workflow was added at commit `9175bfedd38cb2f788eedd5039809bdbab9f01ab`. [Run #41392402777](https://github.com/etblink/math/actions/runs/41392402777) passed its exact source/toolchain pin step and was restoring pinned Lean/Mathlib at the time of this update. It is exploratory only, not a formal theorem gate, and adds zero accepted roots.

**Next action:** inspect the diagnostic's terminal compiler result and full log. Transfer only an independently compiling carrier bridge into F10AW. Then discharge the two contradictory overlap branches with explicit equality composition, run static checks, and only then launch another full strict gate. If both diagnostic approaches fail, isolate the primitive subtype/conditional conversion further rather than editing the full theorem again.


## Superseding delta — F10AW Gate 3 ACCEPTED (2026-11-02 UTC)

This section supersedes the earlier pending-diagnostic and unqualified-F10AW status.

- Diagnostic run [#41392402777](https://github.com/etblink/math/actions/runs/41392402777), tested at `9175bfedd38cb2f788eedd5039809bdbab9f01ab`, failed informatively: it split the dependent conditionals only in the coerced equality, not the target, and its ordinary-`if` coercion lemma did not match F10AU's proof-dependent subtype values. It added zero roots.
- Corrected diagnostic run [#41394112952](https://github.com/etblink/math/actions/runs/41394112952), tested at `a95c9d03883bb8a194b7bdb715bc27df26cea575`, compiled after splitting the same conditionals simultaneously in the coerced equality and target. It remained exploratory and added zero roots.
- Strict F10AW run [#41395358308](https://github.com/etblink/math/actions/runs/41395358308), exact tested commit `1b4653358727d040b9984bdfa4bd242cd6ecabac`, is terminal green.
- Exact F10AW source blob: `449905b6dd06fc9e747a0c9c22c8b6c66afab1a5`.
- Fresh warnings-as-errors compilation and the independent exact theorem-type restatement both passed.
- Both declaration-level axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13119627191`; ZIP SHA256 `ec7da473bd8b17fc9694ed4905552c4f7c49c04cb9c112cdae8e777cbda1191e`.
- Acceptance record: [F10AW Gate 3 acceptance](FCP_K1D18V10H_F10AW_GATE3_ACCEPTANCE_ORIGINAL_GAMMA_COORDINATE_PLANE_BRACKET_2026_11_02.md).

**Accepted scope:** the exact original-gamma coefficient LinearMap preserves the commutator of every pair of source-native coordinate planes, including diagonal and all collision cases. Arbitrary-skew bracket preservation and a typed `so(9) → so(16)` `LieHom` remain unproved.

**Next action:** define the raw original-`16` bracket defect and prove typed real additivity and scalar homogeneity in each input, following the accepted V9I/V9J architecture without importing the distinct `48`-real target or its label order. Generator zero, arbitrary-skew extension, and the native `LieHom` remain separate later gates.
