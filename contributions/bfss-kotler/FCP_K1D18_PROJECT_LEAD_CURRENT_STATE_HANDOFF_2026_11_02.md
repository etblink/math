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


## Superseding delta — F10AX Gate 1 ACCEPTED (2026-11-02 UTC)

- Strict F10AX run [#41396797396](https://github.com/etblink/math/actions/runs/41396797396), exact tested commit `7a49c018a8a119790d18032902b73b2a9360ef92`, is terminal green.
- Exact F10AX source blob: `53a7c6bad1a515b87869858f776ee76003980f12`.
- Accepted F10AW ancestry rebuilt successfully.
- Fresh warnings-as-errors compilation and four independent exact theorem-type restatements passed.
- All five declaration-level axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13119819037`; ZIP SHA256 `84fc476cf0548ca0f90ec1eeaef68b2f71995ea135540cf02eb721c0f1acc722`.
- Acceptance record: [F10AX Gate 1 acceptance](FCP_K1D18V10H_F10AX_GATE1_ACCEPTANCE_ORIGINAL_GAMMA_BRACKET_DEFECT_BILINEARITY_2026_11_02.md).

**Accepted scope:** the exact raw original-`16` bracket defect is defined and qualified as additive and real homogeneous in each arbitrary native `9×9` source-matrix argument. No vanishing theorem or `LieHom` is implied.

**Next action:** package the left and right defect slices as real `LinearMap`s and use accepted F10AW to prove defect zero on every coordinate-plane pair. One-plane-versus-skew and arbitrary-skew extension remain later separate gates.


## Superseding delta — F10AY Gate 1 ACCEPTED (2026-11-02 UTC)

- Strict F10AY run [#41398327173](https://github.com/etblink/math/actions/runs/41398327173), exact tested commit `35d7a1acea738ebddec66d0a08e01063a9d604e0`, is terminal green.
- Exact F10AY source blob: `2ea4de72e1b6c2e46b6394849373fcc90fc51f34`.
- Accepted F10AX ancestry rebuilt successfully.
- Fresh warnings-as-errors compilation and the independent generator-zero theorem-type restatement passed.
- All three root declarations report only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13120762966`; ZIP SHA256 `2b84c1271b3fef107c4cc0f47ba123555065d8c97906fe55fec5c025e73d6b31`.
- Acceptance record: [F10AY Gate 1 acceptance](FCP_K1D18V10H_F10AY_GATE1_ACCEPTANCE_ORIGINAL_GAMMA_DEFECT_LINEAR_SLICES_AND_GENERATOR_ZERO_2026_11_02.md).

**Accepted scope:** the exact original-`16` defect is packaged as a real `LinearMap` in each input and vanishes on every source coordinate-plane pair. No finite-sum extension or arbitrary-skew theorem is implied.

**Next action:** use the accepted right-linear slice and V9F's exact source-native skew coordinate-plane expansion to prove one-plane-versus-arbitrary-skew defect zero. Keep the original `16×16` gamma target distinct from the paired-`48` line.


## Superseding delta — F10AZ Gate 1 ACCEPTED (2026-11-02 UTC)

- Strict F10AZ run [#41399709437](https://github.com/etblink/math/actions/runs/41399709437), exact tested commit `572ec235e499c3093c18a2c6854128d0fdb801cc`, is terminal green.
- Exact F10AZ source blob: `d2276d3b4e1de86294a71a042828c32f0ff54d51`.
- Accepted F10AY ancestry rebuilt successfully.
- Fresh warnings-as-errors compilation and the independent exact theorem-type restatement passed.
- The declaration-level axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13121014321`; ZIP SHA256 `116258dcff5d9e567343d52a40933ae490d42ba98e52ae7983f1a043882035df`.
- Acceptance record: [F10AZ Gate 1 acceptance](FCP_K1D18V10H_F10AZ_GATE1_ACCEPTANCE_ORIGINAL_GAMMA_PLANE_SKEW_DEFECT_ZERO_2026_11_02.md).

**Accepted scope:** for every source coordinate plane and every arbitrary skew source matrix, the exact original-`16` bracket defect vanishes. This is a one-plane-versus-skew statement only; arbitrary-skew-pair zero and a typed `so(9) → so(16)` `LieHom` remain unproved.

**Next action:** apply the accepted left-linear defect slice to V9F's exact coordinate-plane expansion of an arbitrary skew first input, using F10AZ on each summand. Qualify arbitrary-skew-pair zero as a separate strict gate before packaging any native `LieHom`.


## Superseding delta — F10BA Gate 1 ACCEPTED (2026-11-02 UTC)

- Strict F10BA run [#41401214015](https://github.com/etblink/math/actions/runs/41401214015), exact tested commit `fc9bfb9e1ea9ab74ef45fdc17306c0be6895160d`, is terminal green.
- Exact F10BA source blob: `2a05796d38b74b401b0054e5944d84583ab0dae5`.
- Accepted F10AZ ancestry rebuilt successfully.
- Fresh warnings-as-errors compilation and the independent exact theorem-type restatement passed.
- The declaration-level axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13121697832`; ZIP SHA256 `febaab841ad979376c878e85563ae265f1a7ac80e7882110e7b10e479903cde0`.
- Acceptance record: [F10BA Gate 1 acceptance](FCP_K1D18V10H_F10BA_GATE1_ACCEPTANCE_ORIGINAL_GAMMA_ARBITRARY_SKEW_PAIR_DEFECT_ZERO_2026_11_02.md).

**Accepted scope:** for every pair of arbitrary native skew real `9×9` source matrices, the exact original-`16` bracket defect vanishes. Equivalently, the accepted coefficient LinearMap preserves the commutator on skew inputs. A typed native `so(9) → so(16)` `LieHom` has not yet been constructed or qualified.

**Next action:** audit the exact Mathlib source and target skew-matrix Lie-subalgebra APIs, then package the already accepted LinearMap, skew-image proof, and F10BA bracket theorem as a native `LieHom`. Keep that packaging as a separate strict gate and do not infer group integration or physical consequences.


## Superseding delta — F10BB Gate 1 RED; explicit membership-field bridge repair (2026-11-02 UTC)

- Strict F10BB run [#41437884545](https://github.com/etblink/math/actions/runs/41437884545), exact tested commit `a8a9ddb975c04605f3aedc8b984b18e33feefe2f`, is terminal red.
- Exact candidate source blob: `5af9eaa5c8b11a91fe671c7841051ff2e0c6a3a6`.
- Exact pins, pinned Lean/Mathlib restore, and complete accepted F10BA ancestry rebuild passed.
- The fresh F10BB compile failed before the independent audit. No F10BB root is accepted.
- Earliest errors at source lines 43, 68, and 71: `rw [LieAlgebra.Orthogonal.mem_so] at A.property` (and `B.property`) is rejected because a tactic location expects a single variable reference, not a structure-field projection.
- The emitted `sorryAx` reports are consequences of failed elaboration and are not accepted declarations.
- Artifact #`13137917249`; ZIP SHA256 `4580811a0d94a84b6eb359360b9e6f6dbee237c00033ca928f249844d6b18691`.
- Full record: [F10BB Gate 1 red](FCP_K1D18V10H_F10BB_GATE1_RED_STRUCTURE_FIELD_REWRITE_LOCATION_2026_11_02.md).

**Repair:** preserve the exact theorem and canonical `so(9) → so(16)` carriers; bind each `.property` proof to a local variable, rewrite that local proof with `LieAlgebra.Orthogonal.mem_so`, and rerun the unchanged strict gate. No limit increase, axiom, admission, theorem weakening, or paired-48 dependency is permitted.


## Superseding delta — F10BB Gate 2 ACCEPTED (2026-11-02 UTC)

This section supersedes the pending F10BB repair status above.

- Strict F10BB run [#41439485836](https://github.com/etblink/math/actions/runs/41439485836), exact tested commit `41fe720842ed92599c852fe013029f52f43894a9`, is terminal green.
- Exact repaired F10BB source blob: `cbf92737d81c5e69efc2fa85735d6af239540070`.
- Exact pins, pinned Lean/Mathlib restore, and complete accepted F10BA ancestry rebuild passed.
- Fresh warnings-as-errors compilation and independent exact type restatements passed.
- Both declarations report only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact #`13141150692`; ZIP SHA256 `fb1c274097b353d947bcb784f25eaac6ae9c3857de311ffa0afe8f89ed3397cd`.
- Acceptance record: [F10BB Gate 2 acceptance](FCP_K1D18V10H_F10BB_GATE2_ACCEPTANCE_CANONICAL_ORIGINAL_GAMMA_SKEW_LIEHOM_2026_11_02.md).

**Accepted scope:** the exact original-gamma coefficient representation is now a genuine Mathlib real Lie algebra homomorphism
`LieAlgebra.Orthogonal.so SpaceIndex ℝ →ₗ⁅ℝ⁆ LieAlgebra.Orthogonal.so SpinIndex ℝ`, with an independently qualified typed bracket specialization. The construction uses the original `16×16` gamma carrier and has no paired-`48` dependency.

**Scope ceiling:** this is a Lie-algebra-level theorem only. It does not establish global Spin(9) integration, continuity or smoothness of an integrated map, kernel or image classification, a Spin(16) or Spin(48) group lift, Fock implementation, gauge-domain compatibility, or any BFSS spectral existence result.

**Next action:** freeze the accepted LieHom interface and perform a separate source-level audit of possible integration theorems and required topology/simply-connectedness hypotheses. Do not infer a group homomorphism from the LieHom alone.
