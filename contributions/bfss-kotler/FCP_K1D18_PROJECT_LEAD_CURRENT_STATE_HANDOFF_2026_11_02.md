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


## Superseding delta — post-F10BB API audit and F10BC Gate 2 ACCEPTED (2026-11-02 UTC)

- The pinned Mathlib integration census found no theorem integrating an arbitrary `LieHom` to a group homomorphism, no exact source `spinGroup` Lie-group/manifold instance, no exact SO(16) Lie-group/manifold instance, and no tangent/skew Lie-algebra comparison. Direct abstract integration of F10BB is therefore blocked.
- Existing accepted constructive results V10C/V10E/F10Q already supply the exact whole-Clifford original gamma representation, a global algebraic map into O(16), and determinant `+1`.
- F10BC Gate 1 [#41451815156](https://github.com/etblink/math/actions/runs/41451815156), tested at `2a16904937d431116086adb5f8d77e2fa5ca5132`, is preserved red. Its fresh compile left one definitional subtype-multiplication coercion goal after `rw [map_mul]`; no F10BC root was accepted. Artifact `13144718561`, SHA256 `f14b4eeb5962845747c1f032cca54d5debe33a29803e01fc8f5c52065b9d3751`.
- Gate 2 [#41453417697](https://github.com/etblink/math/actions/runs/41453417697), exact tested commit `0504e72d34679fdb0684c5ee29e4d7e7f93ff534`, is terminal green.
- Exact repaired F10BC source blob: `7798089cb8ac4ec4fffc3ead4caa474def81b3f8`.
- Fresh warnings-as-errors compilation, all three independent exact type restatements, and all three root-axiom whitelists passed. Only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.
- Artifact `13146522049`; ZIP SHA256 `0157739705189ddafc3966554191bf2afc4fb90a3b85c5647e17110d96d45cd2`.
- Acceptance record: [F10BC Gate 2 acceptance](FCP_K1D18V10H_F10BC_GATE2_ACCEPTANCE_GLOBAL_ALGEBRAIC_ORIGINAL_GAMMA_SO16_HOM_2026_11_02.md).

**Accepted scope:** a genuine global algebraic homomorphism
`spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup SpinIndex ℝ`
whose underlying `16×16` matrix is exactly the accepted original-gamma Clifford evaluation.

**Separation:** F10BB gives the canonical infinitesimal `so(9) → so(16)` LieHom; F10BC gives the global algebraic source-group `Spin9 → SO(16)` homomorphism. No theorem yet identifies the differential of F10BC with F10BB, and no continuity, smoothness, Lie-group structure, simply-connectedness, covering, Spin(16) lift, Fock, gauge, or spectral claim is implied.

**Next action:** freeze both interfaces. Any continuation toward a differential comparison must start with diagnostic-only manifold/Lie-group and tangent/skew bridge experiments. Do not open an integration theorem gate under the current pinned API.


## Project Lead succession delta — pinned differential bridge decision (2026-11-02)

**Status: SOURCE-AUDIT ONLY; ZERO NEW THEOREM ROOTS.** The post-F10BC source re-audit is appended to [the existing pinned integration API audit](FCP_K1D18V10H_POST_F10BB_GLOBAL_SPIN9_TO_SO16_API_AUDIT_AND_F10BC_CANDIDATE_2026_11_02.md), published in research-branch commit `b1be96a8e9b2ea4da338e3a712c50243b3ad4cbd`.

- Preserve **F10BB** `so(9) →ₗ⁅ℝ⁆ so(16)` and **F10BC** `spinGroup source9Quadratic →* SO(16)` independently. The derivative equality, continuity/smoothness, manifold structures, and tangent/skew identifications are unproved.
- Confirmed directly from the pinned Mathlib source: `spinGroup` and `specialOrthogonalGroup` are algebraic submonoids with group structures, whereas `GroupLieAlgebra` is a tangent-space construction requiring charted manifold data. The earlier source census blocking **direct abstract integration** stands; no second integration search or vanity green gate is justified.
- **Dependency refinement:** source simply-connectedness and an abstract LieHom-integration theorem are not intrinsic prerequisites to differentiating the already constructed F10BC algebraic map, once suitable topology/smoothness and tangent identifications are actually proved. Do not conflate these two theorem routes.
- **Inventory correction:** **F10R** already qualifies the original paired-label algebraic source Spin(9) → SO(48) map, strict [run #41287580971](https://github.com/etblink/math/actions/runs/41287580971), exact tested SHA `4e79469dae20001d8fcab770b5baae62d50afa22`. It is neither a Spin(48) lift nor a Fock implementer.
- **Next actionable experiment:** isolated, source-exact manifold/typeclass and tangent/skew feasibility checks; if that route is unpromising, first develop a source-correct one-parameter coordinate-plane path and gamma-image comparison without calling it a differential theorem. Do not add a Lean theorem gate until an exact checkable obligation is stated. Preserve all red evidence and existing pins.

No Lean file, theorem statement, workflow, canonical branch, FCP source, or upstream repository was modified by this succession delta.


## F10BD — manifold/typeclass feasibility diagnostic (2026-11-02)

**Workflow run:** [#41496951766](https://github.com/etblink/math/actions/runs/41496951766) — green, diagnostic success  
**Exact tested commit:** `441ee6485b7d5c09f3214ba7abbeafd2366b7b04`  
**Branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Toolchain:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`  
**Job:** `manifold-typeclass-feasibility` (`125454292047`)  
**Diagnostic source blob:** `26ed463480ed316e8e86582a34f48db06d42f55e`  
**Artifact:** `13168290519`; ZIP SHA-256 `f9fd37f69376933bfcd757cbd449a0b840de463bef65d0a9ea7d749e0f3490b0`

The workflow intentionally runs expected-failing `#synth` probes, checks their exact diagnostics, and exits successfully only when the expected gaps are present. Therefore this green is a **successful feasibility diagnostic**, not a successful manifold or Lie-group construction.

Observed typeclass boundary:

- `TopologicalSpace (spinGroup source9Quadratic)`: absent. The subtype cannot inherit topology because the ambient source Clifford algebra has no registered topology.
- `TopologicalSpace (Matrix.specialOrthogonalGroup SpinIndex ℝ)`: available through the matrix subtype.
- `ChartedSpace (EuclideanSpace ℝ (Fin 120)) (specialOrthogonalGroup SpinIndex ℝ)`: absent.
- The candidate Spin(9) charted-space and Lie-group synthesis checks fail at the missing Spin(9) topology; the SO(16) Lie-group check fails at its missing charted-space structure.
- Positive controls `Units.instChartedSpace` and `Units.instLieGroupModelWithCornersSelf` resolve. No unknown-identifier, unknown-constant, or parser errors occurred.

The same Lake package “local changes” warnings occur in the accepted F10BC workflow, so they are recorded as a recurring nonblocking environment warning, not a new regression. The pinned Mathlib check and exact F10BC ancestry checks passed.

**Interpretation:** Mathlib's unit-group manifold infrastructure is available, but it does not automatically furnish manifolds on these proper algebraic subgroups. The diagnostic has not established that a closed-subgroup or Cayley-chart construction is unavailable; it has established that the required instances are not already synthesized.

### Next bounded test: F10BD2 PBW-coordinate topology bridge

F10Y already supplies the exact source-nine PBW basis and finite-dimensionality theorem. The next diagnostic transports a normed structure from the finite coordinate Pi space through that basis, locally (without registering global instances), and checks whether the exact Spin(9) subtype inherits a Hausdorff topology.

- Diagnostic-only source: `lean/diagnostics/FCP_K1D18V10HD2CliffordTopologyBridgeDiagnostic.lean`
- Source blob: `29a367d76ef75839ffa9b7dec1ded37a6094439c`
- Workflow: `.github/workflows/bfss-kotler-v10h-f10bd2-clifford-topology-bridge-diagnostic.yml`
- Workflow commit: `75932f4679ead6d1e3b23bcf077437624217b0ae`
- Run: [#41501881751](https://github.com/etblink/math/actions/runs/41501881751), completed red; failure classification and repair are recorded below.

A successful F10BD2 result will establish only a chosen Hausdorff topology on the source Spin(9) carrier. It will **not** establish continuity of Clifford multiplication, a topological-group structure, a charted space, a Lie group, or the differential of the F10BC homomorphism. Those remain separate obligations.


### F10BD attempt history — failure classification

The first F10BD attempt, [run #41495163096](https://github.com/etblink/math/actions/runs/41495163096), was red on exact commit `96ec97f9de4203d2ec167ae36aceaf725068dc08`. This was a **diagnostic-source syntax/scope defect**, not evidence against the mathematical construction:

- Lean reported `unknownIdentifier: Unknown identifier 𝓘` at the positive-control and LieGroup probe lines, followed by parser errors.
- The Spin9 topology and SO16 charted-space synthesis failures were also present, but the malformed LieGroup probes made the run's output contaminated; the expected-gap classifier correctly rejected the run because it disallowed unknown identifiers and parser errors.
- The minimal correction in commit `441ee6485b7d5c09f3214ba7abbeafd2366b7b04` was `open scoped Manifold ContDiff`, which brings the model-with-corners notation into scope. No mathematical statement or theorem was changed.
- The corrected [run #41496951766](https://github.com/etblink/math/actions/runs/41496951766) then passed the expected-gap classifier with no unknown-identifier or parser errors.

**Failure lesson:** diagnostic harnesses must validate notation/scoped syntax before interpreting downstream typeclass failures. A red compile containing parser/identifier errors is harness feedback, not mathematical negative evidence. Preserve the original red artifact rather than rewriting its history.

First-attempt artifact `13165899252`; ZIP SHA-256 `5ec0a60cfba7bbe943a3af945062e258f51c50cae456aea146dfe57a1b6ec682`. The accepted F10BC ancestry rebuild and pinned Lean/Mathlib restore had already passed before the malformed diagnostic failed.


### F10BD2 attempt 1 — PBW coordinate codomain mismatch

**Run:** [#41501881751](https://github.com/etblink/math/actions/runs/41501881751) — red  
**Exact commit:** `75932f4679ead6d1e3b23bcf077437624217b0ae`  
**Job:** `source-spin9-pbw-topology` (`125471162089`)  
**Artifact:** `13168748501`; ZIP SHA-256 `5a15c82e924328939dfe6bc0acdc41e166f227f99f5da3b1492b886d79f32bc1`

All prerequisite stages passed: source pins/scope checks, pinned Lean 4.34.1 and Mathlib restoration, F10X ancestry rebuild, and fresh F10Y PBW compilation. The only failing step was the isolated topology diagnostic.

**Exact defect:** the accepted `source9CliffordPBWBasis.repr` has codomain `Finset SpaceIndex →₀ ℝ` (a finitely supported function), while the attempted norm transport declared codomain `Finset SpaceIndex → ℝ` (a Pi function). The source map was passed directly to `NormedAddCommGroup.induced` and `NormedSpace.induced` without converting codomains. Lean consequently reported:
- no `FunLike` instance for the mismatched additive hom into Finsupp where a Pi target was expected;
- injectivity proof mismatch between the PBW linear equivalence and its additive-hom coercion;
- the analogous `FunLike` failure for `NormedSpace.induced`.

This is a **coordinate-adapter implementation defect**, not a failure of F10Y finite-dimensionality and not evidence against the existence of a Hausdorff topology. The F10Y source compilation and finite-dimensionality declaration completed successfully.

**Repair:** compose the accepted PBW representation with the pinned Mathlib equivalence `Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex)`, yielding an actual linear equivalence
`source9PBWCoordinates : CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ)`.
Transport the norm through this composite equivalence, using its additive-hom coercion and injectivity proof. The adapter is explicit and finite-index; no new mathematical axiom, theorem, or global instance is introduced.

The next workflow attempt must still prove, rather than assume, the ambient and Spin(9) Hausdorff typeclass goals. A green result would establish only the chosen PBW-coordinate topology and inherited separation.


### F10BD2 attempt 2 — invalid declaration modifier and term layout

**Run:** [#41504802784](https://github.com/etblink/math/actions/runs/41504802784) — red  
**Exact commit:** `d79fbf22470b575a29ea58cb54d54c081a7488a9`  
**Diagnostic blob:** `cf98001dfcebe0e76c2dc8f6955f9ae4469e8d6d`  
**Job:** `source-spin9-pbw-topology` (`125481237918`)  
**Artifact:** `13171400943`; ZIP SHA-256 `0058e56e424a7e5f6b06c7690610dcbec2f8abbc038a78342b9b24bfd5a6c801`

Exact source/toolchain pins, pinned dependency restoration, the accepted F10X ancestry rebuild, and fresh warnings-as-errors F10Y compilation all passed. The isolated diagnostic failed after approximately 14 seconds.

**Earliest error:** line 30, `local def` is invalid declaration syntax in Lean 4.34.1 (`unexpected token 'def'`). The compiler then reported an unapplied `source9CliffordPBWBasis.repr.trans` and an unexpected opening parenthesis on the continuation line. These diagnostics do not qualify or refute the Finsupp/Pi adapter or the downstream topology goals.

**Bounded correction:** use `private def source9PBWCoordinates`, and put the entire `.trans (...)` application on one line. Lean's pinned `src/Lean/Parser/Command.lean` explicitly supports `private` as a declaration visibility modifier; the pinned Mathlib source also confirms the intended finite-index equivalence interface. Keep all local instances, exact carrier types, synthesis goals, accepted ancestry, compiler strictness, and time limits unchanged. Update the diagnostic blob pin atomically with the source.

**Procedural lesson:** a source pin and token-presence check are not a Lean syntax check. Parser-contaminated output is implementation feedback; do not interpret its later errors as mathematical negative evidence. Preserve this red run and require a fresh compiler result before drawing conclusions about the adapter.

**Validation state:** no Lean executable is installed in the editing workspace. Source inspection and static source/pin checks are available locally; actual elaboration remains the isolated CI diagnostic's obligation. The correction is unqualified until that run passes. Even a green diagnostic adds zero formal theorem roots and establishes no multiplication continuity, topological group, manifold, Lie group, or differential comparison.


### F10BD2 attempt 3 — PBW-coordinate Hausdorff topology DIAGNOSTIC PASS

**Run:** [#41506887965](https://github.com/etblink/math/actions/runs/41506887965) — terminal green  
**Exact tested commit:** `11f5fdbf6bead4d9a9a2bd95822a62fe96eef3f6`  
**Diagnostic source blob:** `2adc47f7faac87c35f3c76a95171eb21b6e5c0ff`  
**Job:** `source-spin9-pbw-topology` (`125488357590`)  
**Artifact:** `13171602607`; ZIP SHA-256 `eaee6cb3e18e03aad6648fe1f36a36736c66e23833f3c07f31e855e1b2e51f85`

All exact pins, pinned Lean 4.34.1/Mathlib restoration, accepted F10X ancestry rebuild, fresh warnings-as-errors F10Y compilation, and isolated warnings-as-errors topology compilation passed. The compiler reached `V10H_F10BD2_SOURCE9_PBW_TOPOLOGY_PASS` without parser, type, or synthesis errors. Recurring Lake package-local-change messages remained nonblocking launcher warnings.

**Observed scope:** the explicit PBW/Finsupp-to-Pi coordinate equivalence supports the local induced `NormedAddCommGroup` and `NormedSpace ℝ` structures on exactly `CliffordAlgebra source9Quadratic`. The ambient Hausdorff topology, inherited `TopologicalSpace` and `T2Space` on exactly `spinGroup source9Quadratic`, and standard SO(16) subtype topology/separation all synthesized.

**Acceptance level:** successful isolated construction diagnostic, zero new accepted named theorem roots. No global topology instance was registered. Clifford multiplication continuity, topological-group structure, manifolds, Lie groups, smoothness, and equality of the F10BC differential with F10BB remain unproved. The earlier two red F10BD2 runs and their artifacts remain immutable implementation evidence.

**Success lesson:** explicit codomain conversion followed by valid declaration syntax removed the adapter/harness defects while preserving the exact source carrier and all topology goals. No limits, theorem propositions, or accepted dependencies were weakened.

### Next bounded diagnostic — F10BD3 exact original gamma continuity

The pinned Mathlib source `Mathlib/Topology/Algebra/Module/FiniteDimension.lean` supplies `LinearMap.continuous_of_finiteDimensional` for Hausdorff finite-dimensional real topological vector spaces. The accepted whole-Clifford evaluation `source9GammaCliffordAlgHom` is already an ℝ-algebra homomorphism, hence an ℝ-linear map. F10BC already supplies the exact matrix identity `source9SpinGammaSpecialOrthogonalHom_apply`.

**Candidate:** `lean/diagnostics/FCP_K1D18V10HD3GammaContinuityDiagnostic.lean`  
**Candidate blob:** `a40a345d01ac3051f5b6ec148b7433a6c7a75b12`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bd3-gamma-continuity-diagnostic.yml`

The diagnostic preserves the accepted F10BD2 topology prelude verbatim; the workflow checks its equality against the pinned authoritative F10BD2 source. It adds a local instance from accepted F10Y finite-dimensionality and checks only:
1. `Continuous source9GammaCliffordAlgHom` for the chosen PBW-coordinate topology and standard matrix topology.
2. `Continuous source9SpinGammaSpecialOrthogonalHom`, using an explicit equality of underlying matrix functions before crossing the SO(16) subtype.

This route does not require asserting that the source is already a topological group. Multiplication continuity is a distinct obligation. This remains diagnostic-only and unqualified until CI compiles both examples. Any later named theorem promotion must separately expose the exact chosen structures and pass an independent type/axiom audit.

Local static validation checks the candidate/workflow pins, exact reused topology prelude, required scope tokens, YAML, and unchanged absence of admissions or limit increases. No local Lean executable is available; CI owns elaboration.


### F10BD3 — original gamma continuity DIAGNOSTIC PASS

**Run:** [#41509271718](https://github.com/etblink/math/actions/runs/41509271718) — terminal green  
**Exact tested commit:** `f4716536ad876ce20097f516630525e8a4db8a0e`  
**Diagnostic blob:** `a40a345d01ac3051f5b6ec148b7433a6c7a75b12`  
**Job:** `original-gamma-continuity` (`125496574998`)  
**Artifact:** `13173340315`; ZIP SHA-256 `883560bda225e12ba31b8ceb3148be95d7109d257b17e1c54ac4ca2da04600e9`

Exact diagnostic/ancestor/toolchain pins, verbatim topology-prelude comparison, pinned Lean 4.34.1/Mathlib restoration, F10X/F10BC ancestry rebuild, and fresh warnings-as-errors F10Y compilation passed. Both isolated continuity examples compiled; the compiler reached `V10H_F10BD3_ORIGINAL_GAMMA_CONTINUITY_PASS`.

**Observed scope:** continuity of exactly `source9GammaCliffordAlgHom` from the chosen PBW-coordinate source topology to the standard real matrix topology, and continuity of exactly `source9SpinGammaSpecialOrthogonalHom` from the inherited Spin9 subtype topology to the standard SO(16) subtype topology. The latter used the accepted F10BC underlying-matrix identity explicitly before the subtype continuity bridge.

**Acceptance level:** successful isolated continuity diagnostic, zero new accepted named theorem roots. No multiplication-continuity, topological-group, smoothness, manifold, Lie-group, differential, lift, Fock, gauge or spectral statement follows. Named reusable exports still require a separate strict type/axiom gate.

**Success lesson:** reuse finite-dimensional linear-map continuity for the already constructed algebraic representation; cross the target subtype with the explicit accepted matrix-function equality. Neither an abstract LieHom integration theorem nor an assumed source topological-group structure is needed for these two continuity obligations.

### F10BE Gate 1 — named PBW topology and continuity CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity.lean`  
**Source blob:** `a39fe3c332c89e9f405f55ff3f20c58b5b2600fd`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BEIndependentAudit.lean`  
**Audit blob:** `dc765801abaf11df1cd08118b91ce37fe2e19337`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10be-pbw-topology-gamma-continuity-strict.yml`

Promote only the successful F10BD2/F10BD3 constructions. The candidate names the coordinate equivalence, induced normed additive group, and compatible real normed space as ordinary values. Only local instance attributes are used. Downstream code must explicitly install the named structures; no global topology or norm is registered.

The candidate inventory is seven declarations: three constructions and four proof declarations.
- `source9PBWCoordinates`
- `source9PBWNormedAddCommGroup`
- `source9PBWNormedSpace`
- `source9Clifford_t2Space_pbw`
- `source9Spin_t2Space_pbw`
- `source9GammaCliffordAlgHom_continuous_pbw`
- `source9SpinGammaSpecialOrthogonalHom_continuous_pbw`

The independent audit reconstructs the coordinate map and normed structures directly from accepted F10Y and pinned Mathlib, instead of installing the candidate's structures. It checks exact equality of the coordinate map and induced normed additive group, then restates both Hausdorff and both continuity conclusions under that independently reconstructed topology. This checks the hidden topology parameters, not merely the printed `Continuous` notation.

The gate requires a fresh warnings-as-errors candidate compilation, fresh independent type audit, exactly seven axiom reports in each log, and an axiom whitelist limited to `propext`, `Classical.choice`, and `Quot.sound`. Existing red evidence and successful diagnostic sources remain unchanged. No new root is accepted until the gate is terminal green and its outputs are reviewed.

**Local validation:** source/audit inventory, source and audit blob pins, YAML, shell syntax, embedded Python syntax, and the workflow's static source-scope preflight pass. The local workspace still has no Lean executable; this is not a claim of local elaboration.

**Next action:** review F10BE's strict compiler and independent-audit outputs. If accepted, reuse the named PBW structures for the next separately bounded multiplication or group-topology obligation; do not skip to a differential identification.


### F10BE Gate 1 RED — named class-definition reducibility

**Run:** [#41511437870](https://github.com/etblink/math/actions/runs/41511437870) — terminal red  
**Exact tested commit:** `ceba60faa30f75e577a9d1a29bcbec8d026304eb`  
**Candidate blob:** `a39fe3c332c89e9f405f55ff3f20c58b5b2600fd`  
**Job:** `pbw-topology-original-gamma-continuity` (`125503972925`)  
**Artifact:** `13173991889`; ZIP SHA-256 `f1d74be8f71cad5f5d52576238b0ed1ae3c8008bb8cf92c2177c48730d3bb7d3`

Exact source/audit/toolchain pins, pinned dependency restoration, accepted F10X/F10BC ancestry rebuild, and fresh F10Y compilation all passed. Fresh F10BE warnings-as-errors compilation failed. The independent exact-topology/type/axiom audit was skipped. **Zero F10BE roots are accepted.**

**Earliest failure:** the named `source9PBWNormedAddCommGroup` definition at source line 39 has class type but ordinary `def` makes it semireducible. Lean 4.34.1 requires the intended class-definition transparency, recommending `@[instance_reducible]`. The same diagnostic occurred at its local instance registration, at the `source9PBWNormedSpace` definition, and at that definition's registration. Both continuity proofs then failed to synthesize `IsTopologicalAddGroup (CliffordAlgebra source9Quadratic)` at lines 75 and 82.

The emitted `sorryAx` dependencies on the two failed continuity declarations are failed-elaboration artifacts, not accepted proofs or source admissions. The earlier successful anonymous-instance F10BD2/F10BD3 diagnostics remain valid at their exact commits.

**Classification:** named-structure packaging/transparency defect. Naming the previously anonymous local structures with ordinary definitions changed their availability to instance reduction. This does not refute either successful diagnostic and supplies no mathematical counterexample.

### F10BE Gate 2 — explicit instance-reducibility repair CANDIDATE

**Repaired source blob:** `db887aa6e495eb2a74c2e826018ffb5453158806`  
**Independent audit blob unchanged:** `dc765801abaf11df1cd08118b91ce37fe2e19337`

Add exactly `@[instance_reducible]` to the two named class-valued definitions `source9PBWNormedAddCommGroup` and `source9PBWNormedSpace`, as the pinned compiler recommends. Their bodies, all seven declaration names and types, local-only instance registration, and the independent reconstructed-topology audit remain unchanged. No warning suppression, global instance, limit increase, admission, or theorem weakening is introduced.

Update the source blob pin atomically and add an explicit static check for the two reducibility attributes. The strict compilation must demonstrate that the secondary topological-additive-group synthesis failures are resolved; do not presume that from the attribute edit alone. All seven declaration axiom reports in each of the candidate and independent-audit logs must still pass the existing whitelist.

**Procedural lesson:** when promoting a successful anonymous `local instance` to a reusable named class-valued definition, preserve instance-reduction transparency explicitly. A compile-time class-definition warning is interface feedback and must be repaired, not disabled. Pinned Mathlib's transfer-instance file likewise uses transparent class-valued abbreviations.

**Local validation:** the exact source diff consists of the two reducibility attributes; independent audit content is unchanged. Source/audit hashes, declaration inventory, scope guards, YAML, shell syntax, and embedded Python syntax are checked before publication. Actual Lean elaboration remains the unchanged strict CI gate's obligation.


### F10BE Gate 2 ACCEPTED — named PBW topology and original gamma continuity

**Run:** [#41513371560](https://github.com/etblink/math/actions/runs/41513371560) — terminal green  
**Exact tested commit:** `4ac2164fb698b02d099a78d4dc5f2d03b6b594b5`  
**Accepted source blob:** `db887aa6e495eb2a74c2e826018ffb5453158806`  
**Independent audit blob:** `dc765801abaf11df1cd08118b91ce37fe2e19337`  
**Job:** `pbw-topology-original-gamma-continuity` (`125510588178`)  
**Artifact:** `13174452197`; ZIP SHA-256 `41901253fe12a989258c019778e59400f9380a9d5240635fea0f86be03ac8cfa`

Exact pins and dependency restoration, accepted F10X/F10BC ancestry rebuild, fresh F10Y compilation, fresh F10BE warnings-as-errors compilation, and independent topology/type/axiom audit all passed. The final classifier emitted `V10H_F10BE_EXACT_PBW_TOPOLOGY_CONTINUITY_TYPES_AXIOMS_PASS`.

All seven declarations reported only `propext`, `Classical.choice`, and `Quot.sound` in both candidate and independent-audit logs; no `sorryAx`. The independent audit reconstructed the coordinate equivalence and induced normed group, checked their exact equality, and restated the four proof types under that independently reconstructed topology.

**Accepted inventory:** three reusable constructions (`source9PBWCoordinates`, `source9PBWNormedAddCommGroup`, `source9PBWNormedSpace`) and four proof declarations (`source9Clifford_t2Space_pbw`, `source9Spin_t2Space_pbw`, `source9GammaCliffordAlgHom_continuous_pbw`, `source9SpinGammaSpecialOrthogonalHom_continuous_pbw`). Do not describe all seven as new proposition-level theorems.

**Exact scope:** the named PBW-coordinate normed structures, ambient and source Spin9 Hausdorff separation, whole-Clifford gamma continuity, and continuity of the exact existing F10BC source Spin9-to-SO(16) homomorphism. These structures remain explicit named values, with no global instance registration.

**Still open:** multiplication continuity (until a separate gate passes), source Spin9 inversion continuity/topological-group structure, manifolds, Lie groups, smoothness, tangent/skew identifications and differential equality with F10BB, lifts, Fock, gauge-domain compatibility and BFSS spectral claims.

**Confirmed repair lesson:** adding `@[instance_reducible]` to the two named class-valued definitions, with unchanged definition bodies and unchanged independent audit, resolved both the strict class-definition warnings and the topological-additive-group synthesis failures. Preserve the red Gate 1 record as the negative knowledge for future anonymous-instance promotion.

### F10BF Gate 1 — ambient Clifford multiplication and topological-ring CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BFPBWCliffordTopologicalRing.lean`  
**Candidate source blob:** `f3d3121ef76af1d25a43ec574bbfc2fbeefce111`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BFIndependentAudit.lean`  
**Audit blob:** `dd00871d12e1d533d15aa67608713d85eed0ec66`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bf-pbw-clifford-topological-ring-strict.yml`

Source inspection of pinned Mathlib `Mathlib/Topology/Algebra/Module/FiniteDimension.lean` confirms the explicit bridge `isModuleTopologyOfFiniteDimensional`: the existing finite-dimensional Hausdorff real vector-space topology carries `IsModuleTopology`. The pinned `ModuleTopology.lean` then supplies `IsModuleTopology.continuous_mul_of_finite ℝ D` and `IsModuleTopology.isTopologicalRing ℝ D` for a finite real algebra `D`.

The candidate installs exactly the accepted F10BE normed structures locally and uses accepted F10Y finite-dimensionality. It proves the module-topology bridge for that existing topology; it does not substitute a new topology. Three separate, exact declarations are proposed:
- `source9Clifford_isModuleTopology_pbw`
- `source9Clifford_mul_continuous_pbw`
- `source9Clifford_isTopologicalRing_pbw`

The multiplication proposition is joint continuity of `(x,y) ↦ x*y` on the actual `CliffordAlgebra source9Quadratic`, using its actual algebra multiplication. The independent audit reconstructs the PBW norm again, checks its equality with the accepted norm, and restates all three conclusions without installing module-topology, multiplication-continuity or topological-ring hypotheses.

The strict gate pins the accepted source, recompiles accepted F10Y and F10BE, freshly compiles F10BF with warnings as errors, and checks exactly three root-axiom reports in each of the candidate and independent-audit logs against the established whitelist. Local source/audit hashes, declaration inventory/scope checks, YAML, shell and embedded Python checks pass. No local Lean elaboration is claimed.

**Scope ceiling:** even if F10BF is accepted, its result is an ambient topological-ring statement. It will not itself establish inverse continuity or a topological-group structure on the source Spin9 subtype, a manifold, smoothness, a differential theorem, a Spin lift, a Fock realization, gauge-domain compatibility or spectral existence.

**Next action:** inspect F10BF's terminal strict result. If accepted, audit the source group's exact inversion formula and the required continuity bridge as a separate bounded task.


### F10BF Gate 1 ACCEPTED — ambient PBW Clifford topological ring

**Run:** [#41515322947](https://github.com/etblink/math/actions/runs/41515322947) — terminal green  
**Exact tested commit:** `1b2b0b82e6cba478167dea480bef92f0376f5fa2`  
**Accepted source blob:** `f3d3121ef76af1d25a43ec574bbfc2fbeefce111`  
**Independent audit blob:** `dd00871d12e1d533d15aa67608713d85eed0ec66`  
**Job:** `pbw-clifford-ambient-topological-ring` (`125517288084`)  
**Artifact:** `13175681311`; ZIP SHA-256 `5aa3edc1eb7c9cd89028f64e19696ca098cb1e6e189a765dedbb686e29cf7c6f`

Exact pins and pinned Lean 4.34.1/Mathlib restoration, accepted ancestry rebuild, fresh F10Y/F10BE compilations, fresh F10BF warnings-as-errors compilation, and independent PBW topology/type/axiom audit all passed. The classifier emitted `V10H_F10BF_EXACT_PBW_AMBIENT_RING_TYPES_AXIOMS_PASS`. All three declaration reports in both candidate and independent-audit logs contained only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

**Accepted declarations:**
- `source9Clifford_isModuleTopology_pbw`
- `source9Clifford_mul_continuous_pbw`
- `source9Clifford_isTopologicalRing_pbw`

These identify the existing named PBW topology as the real module topology, establish joint continuity of the actual ambient Clifford multiplication, and establish `IsTopologicalRing` for that exact Clifford ring and topology. No new topology was substituted and no global instance was registered.

**Scope ceiling:** this ambient ring result does not by itself establish source Spin9 inversion continuity, a source topological-group structure, any manifold or Lie group, smoothness, tangent identification or differential equality, covering/lift, Fock, gauge or spectral claim.

**Success lesson:** source-audit the pinned library's finite-module topology theorem, supply the explicit bridge for the already accepted normed space, and specialize the existing bilinear multiplication infrastructure. No custom multiplication estimates or new norm were necessary.

### F10BG Gate 1 — exact source Spin9 PBW topological group CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BGPBWSourceSpinTopologicalGroup.lean`  
**Candidate source blob:** `df8bbc6de6b456b344684c65b032f1e299e45736`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BGIndependentAudit.lean`  
**Audit blob:** `2934f82e5b6742896385f85083e96de563440ba0`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bg-pbw-source-spin-topological-group-strict.yml`

The pinned `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` defines the exact existing source group's inverse as `star`. Its `spinGroup.involute_eq` theorem applies to the actual membership proof. Pinned `Star.lean` identifies Clifford star as `reverse (involute x)`; consequently inversion on this even source carrier equals grade reversal. Pinned `Conjugation.lean` defines grade reversal as an ℝ-linear map, so accepted finite-dimensional PBW infrastructure gives its continuity.

Do not replace Clifford star with reversal on arbitrary Clifford elements. The candidate crosses that boundary only after applying the exact source Spin9 membership/evenness theorem.

The five proposed declarations are:
- `source9Clifford_reverse_continuous_pbw`
- `source9Spin_inv_coe_eq_reverse`
- `source9Spin_inv_continuous_pbw`
- `source9Spin_mul_continuous_pbw`
- `source9Spin_isTopologicalGroup_pbw`

The candidate keeps the existing carrier `spinGroup source9Quadratic`, inherited PBW topology and actual group operations. It proves inverse continuity via an explicit equality of underlying Clifford-valued functions, and joint multiplication continuity by composing accepted F10BF ambient multiplication with the continuous pair of subtype coercions. Only then does it assemble `IsTopologicalGroup` from those two proofs. No group/topology/continuity hypothesis is installed to prove that result.

The independent audit reconstructs the PBW normed structures, checks their equality with the accepted structures, and restates all five exact theorem types. The strict workflow pins and freshly compiles the accepted F10Y/F10BE/F10BF ancestry, freshly compiles the candidate, and requires exactly five whitelisted axiom reports in each of the candidate and independent-audit logs.

Local static source/audit hashes, declaration inventory, scope checks, YAML, shell syntax and embedded Python checks pass. Actual elaboration remains CI's obligation; zero F10BG declarations are accepted before the terminal strict result and output review.

**Scope ceiling:** a successful F10BG would establish a topological group on the exact existing source carrier with this inherited topology. It would not establish a charted space, Lie group, smoothness, standard geometric Spin9 identification, simply-connectedness, a tangent/skew comparison, the F10BC differential equality, kernel classification, covering/lift, Fock realization, gauge-domain compatibility or BFSS spectral existence.

**Next action:** review F10BG's strict result. If accepted, source-audit the manifold/smoothness obligations and their relation to the existing exact carrier before proposing another theorem gate; topological-group structure alone is not a Lie-group construction.


### F10BG Gate 1 ACCEPTED — exact source Spin9 PBW topological group

**Run:** [#41517689579](https://github.com/etblink/math/actions/runs/41517689579) — terminal green  
**Exact tested commit:** `d872b38d3ff65c2e0b122e7731975ce8cf012732`  
**Accepted source blob:** `df8bbc6de6b456b344684c65b032f1e299e45736`  
**Independent audit blob:** `2934f82e5b6742896385f85083e96de563440ba0`  
**Job:** `pbw-exact-source-spin-topological-group` (`125525323091`)  
**Artifact:** `13176697656`; ZIP SHA-256 `160b4286cb0e0a6e8fb745668ae03189de792ed5938410dda7a25ab75f80fc21`

Exact pins and pinned dependency restoration, accepted ancestry rebuild, fresh F10Y/F10BE/F10BF compilations, fresh F10BG warnings-as-errors compilation, and the independent reconstructed-topology audit all passed. The classifier emitted `V10H_F10BG_EXACT_PBW_SOURCE_SPIN_GROUP_TYPES_AXIOMS_PASS`. All five declarations in both candidate and independent-audit logs use only `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx`.

**Accepted declarations:**
- `source9Clifford_reverse_continuous_pbw`
- `source9Spin_inv_coe_eq_reverse`
- `source9Spin_inv_continuous_pbw`
- `source9Spin_mul_continuous_pbw`
- `source9Spin_isTopologicalGroup_pbw`

**Exact scope:** the existing source carrier `spinGroup source9Quadratic`, with its actual operations and the topology inherited from the named PBW norm, is a topological group. The independent audit reconstructed that topology and restated all five exact types without assuming operation continuity or a topological-group instance.

**Scientific ceiling:** no charted space, manifold, Lie group, smoothness, standard geometric Spin9 identification, simply-connectedness, tangent/skew identification, F10BC differential equality, covering/lift, Fock realization, gauge compatibility or spectral result is inferred.

**Success lesson:** use the exact existing inversion formula, prove the even-element star/reversal bridge, and cross subtype boundaries with explicit underlying-function identities. Multiplication continuity follows by restricting the accepted ambient map. The subtype group and its topology were not replaced.

### Post-F10BG route decision and F10BH CANDIDATE

The targeted source audit is appended to [the existing manifold/integration API audit](FCP_K1D18V10H_POST_F10BB_GLOBAL_SPIN9_TO_SO16_API_AUDIT_AND_F10BC_CANDIDATE_2026_11_02.md). Its decision is to keep the whole-group manifold route paused and take the constructive source-curve alternative. The unit-group manifold theorem does not provide an atlas on this proper Spin9 carrier; the inspected paired-48 matrix flows do not supply actual source Spin9 curves.

**Next bounded prerequisite:** normalized source vector-pair Spin membership and exact original-gamma image.

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BHUnitVectorPairMembership.lean`  
**Candidate blob:** `f17d83d961055ebf4b00b74dfb35010a51c886d4`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BHIndependentAudit.lean`  
**Audit blob:** `441cca373a4d3ae9ec72277afc5c3339f1af2cf2`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bh-source-unit-vector-pair-membership-strict.yml`

Five declarations are proposed: two constructions and three proofs.
- `source9UnitVectorCliffordUnit`
- `source9UnitVectorCliffordUnit_mem_lipschitzGroup`
- `source9UnitVectorPair_mem_spinGroup`
- `source9UnitVectorPairSpin`
- `source9UnitVectorPairSpin_gamma`

Both quadratic norm-one hypotheses are explicit. The candidate constructs the actual Clifford units, proves their generated Lipschitz membership, verifies both unitary products with the correct Clifford-star signs, supplies evenness, and only then packages the actual Spin element and computes its F10BC image. It assumes no individual positive unit vector is in Pin, and uses no alternate gamma or 48-label carrier.

The independent audit restates the normalized hypotheses and exact carrier/image types, and checks that both constructed units and Spin elements coerce to the claimed actual Clifford expressions. The strict gate requires fresh warnings-as-errors compilation and exactly five whitelisted axiom reports in each compiler/audit log. Local source/audit pins, inventory/scope checks, YAML, shell and embedded Python checks pass; actual elaboration remains CI's obligation.

**Next action:** review F10BH's strict result. If accepted, define the distinct-coordinate-plane candidate curve and first prove normalization, membership, value at zero and original-gamma image. No derivative or global differential comparison is claimed at this prerequisite stage.


### F10BH Gate 1 ACCEPTED — normalized source vector-pair Spin membership

**Run:** [#41520309715](https://github.com/etblink/math/actions/runs/41520309715) — terminal green  
**Exact tested commit:** `f0739d85aa0c125aa85628b7164e805d4e42398e`  
**Accepted source blob:** `f17d83d961055ebf4b00b74dfb35010a51c886d4`  
**Independent audit blob:** `441cca373a4d3ae9ec72277afc5c3339f1af2cf2`  
**Job:** `actual-source-unit-vector-pair` (`125534323722`)  
**Artifact:** `13178221036`; ZIP SHA-256 `3d5c4408be63ff40c9fcfdce7d5be80290ee5bd50058ad3c4b1337ed4d147910`

Exact pins and pinned dependency restoration, accepted F10BC ancestry rebuild, fresh F10BH warnings-as-errors compilation and independent exact type/coercion/axiom audit all passed. The classifier emitted `V10H_F10BH_EXACT_NORMALIZED_SOURCE_PAIR_TYPES_AXIOMS_PASS`. Both logs report only `propext`, `Classical.choice`, and `Quot.sound` for each of the five declarations; no `sorryAx`.

**Accepted inventory:** two constructions (`source9UnitVectorCliffordUnit`, `source9UnitVectorPairSpin`) and three proof declarations (`source9UnitVectorCliffordUnit_mem_lipschitzGroup`, `source9UnitVectorPair_mem_spinGroup`, `source9UnitVectorPairSpin_gamma`).

**Exact scope:** if the two actual source vectors each satisfy `source9Quadratic = 1`, their actual Clifford product belongs to the existing source Spin9 carrier, and its F10BC image is exactly the product of their original real gamma evaluations. The audit also checks the underlying Clifford values of both constructions. No alternate group/carrier is used, and no individual positive unit vector's Pin membership is assumed.

**Success lesson:** prove Lipschitz generator membership, the two unitary identities and evenness separately; use the source's actual Clifford-star convention. This qualified a reusable source membership primitive before attempting a curve or derivative.

### F10BI Gate 1 — distinct-coordinate-plane source curve CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BICoordinatePlaneSourceCurve.lean`  
**Candidate source blob:** `faabd83f813eab9ae2026c5d426f8baed80d33a6`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BIIndependentAudit.lean`  
**Audit blob:** `119ab4569f0ef663838856ed3611e500a7125c82`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bi-coordinate-plane-source-curve-strict.yml`

Using the unchanged nine-coordinate source labels, define `e_r := Pi.single r 1` and `v_rs(t) := cos(t/2) • e_r + sin(t/2) • e_s`. For **distinct** labels `r ≠ s`, the candidate proves both actual quadratic norm-one conditions and applies accepted F10BH to form the actual source element `g_rs(t) := ι(e_r) * ι(v_rs(t))`.

The source proof reuses the accepted `source9Quadratic_eq_dot` bridge, pinned Matrix dot-product add/scalar/single-vector lemmas, and the imported real identity `Real.sin_sq_add_cos_sq`. It does not use a guessed coordinate norm or gamma-side orthogonality as a substitute for Spin membership.

Eight declarations are proposed: three constructions and five proofs.
- `source9CoordinateVector`
- `source9CoordinateVector_unit`
- `source9PlaneUnitVector`
- `source9PlaneUnitVector_unit`
- `source9PlaneSpinCurve`
- `source9PlaneSpinCurve_coe`
- `source9PlaneSpinCurve_zero`
- `source9PlaneSpinCurve_gamma`

The exact Clifford expression to qualify is `cos(t/2) • 1 + sin(t/2) • (ι(e_r)*ι(e_s))`; the actual source group identity occurs at `t=0`. Its F10BC underlying matrix is to be proved exactly `cos(t/2) • 1 + sin(t/2) • (gamma r * gamma s)` on the **original 16-real target**, with the product order and sign fixed.

The diagonal case `r=s` is deliberately outside the normalization proposition; the same moving-vector formula need not have norm one there. No one-parameter homomorphism, continuity, derivative, exponential identity, tangent/skew identification, manifold, Lie-group structure or global differential equality is included in this candidate.

The independent audit restates each exact type and checks the coordinate vector, moving vector and raw Clifford product definitions by reflexivity. It retains the distinct-label hypothesis and explicit half-angle expressions. The strict gate pins the accepted F10BH source, freshly compiles its actual F10BC/F10BH ancestry, and requires fresh warnings-as-errors candidate/audit compilation plus exactly eight whitelisted axiom reports per log.

Local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. No local Lean elaboration is claimed; zero F10BI declarations are accepted before the strict result and output review.

**Next action:** inspect F10BI's strict result. If accepted, state and independently qualify the first-order derivatives at zero of the Clifford-valued curve and its original-gamma matrix image. Keep those directional curve statements distinct from a manifold differential theorem or an asserted match to the canonical F10BB input until the exact source-plane normalization is checked.


### F10BI Gate 1 ACCEPTED — exact distinct-plane source curve

**Run:** [#41524270429](https://github.com/etblink/math/actions/runs/41524270429) — terminal green  
**Exact tested commit:** `de39a1a185af9b446c620f524c25b821aacfab89`  
**Accepted source blob:** `faabd83f813eab9ae2026c5d426f8baed80d33a6`  
**Independent audit blob:** `119ab4569f0ef663838856ed3611e500a7125c82`  
**Job:** `exact-distinct-plane-source-spin-curve` (`125547873201`)  
**Artifact:** `13178798237`; ZIP SHA-256 `49e260ad931e29dd697611ca3bee4ac9ad2656d47d7d23570fd301dcefa0f459`

Exact pins and pinned dependency restoration, accepted F10BC ancestry rebuild, fresh F10BH compilation, fresh F10BI warnings-as-errors compilation, and independent type/coercion/axiom audit all passed. The classifier emitted `V10H_F10BI_EXACT_DISTINCT_PLANE_SOURCE_CURVE_TYPES_AXIOMS_PASS`. All eight reports in each compiler/audit log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

**Accepted inventory:** three constructions (`source9CoordinateVector`, `source9PlaneUnitVector`, `source9PlaneSpinCurve`) and five proofs (`source9CoordinateVector_unit`, `source9PlaneUnitVector_unit`, `source9PlaneSpinCurve_coe`, `source9PlaneSpinCurve_zero`, `source9PlaneSpinCurve_gamma`).

For every distinct actual source-label pair, the actual source curve has the qualified Clifford expression `cos(t/2) • 1 + sin(t/2) • (ι(e_r)*ι(e_s))`, lies in the existing source Spin group for every parameter, equals the actual group identity at zero, and has exact F10BC matrix image `cos(t/2) • 1 + sin(t/2) • (gamma r * gamma s)` on the original 16-real target.

**Scope ceiling:** no continuity or derivative result was part of F10BI, and no one-parameter group law, exponential identity, manifold, tangent identification or global differential theorem follows merely from these formulas. The distinct-label hypothesis remains mandatory.

**Success lesson:** normalize vectors with the existing source quadratic/dot-product bridge, reuse actual source membership, then obtain the Clifford/gamma formulas by explicit linearity and multiplication preservation. Source membership precedes gamma-image interpretation.

### F10BJ Gate 1 — vector-space derivatives at zero CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BJSourceCurveDerivatives.lean`  
**Candidate source blob:** `5e95c7085849fe2e4331e0d491ee6fe1ac99625c`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BJIndependentAudit.lean`  
**Audit blob:** `dcf36c44cf9ee35ddef71207289853cbb03e598b`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bj-source-curve-derivatives-strict.yml`

The three proposed declarations are:
- `realHalfAngleVectorCurve_hasDerivAt_zero`
- `source9PlaneSpinCurve_coe_hasDerivAt_zero`
- `source9PlaneSpinCurve_gamma_hasDerivAt_zero`

The first declaration is a generic real normed-vector-space helper: the curve `cos(t/2) • a + sin(t/2) • b` has derivative `(1/2) • b` at zero. The source proof uses the pinned scalar `HasDerivAt.div_const`, `.cos`, `.sin`, `.smul_const` and `.add` interfaces. This isolates the scalar chain rule from the source/group coercion boundaries.

The second and third declarations cross those boundaries through explicit equalities of functions with the already qualified F10BI formulas. Their exact conclusions are:
- The **Clifford-valued** actual source curve has velocity `(1/2) • (ι(e_r)*ι(e_s))` at zero, for the accepted named PBW normed structures.
- The actual F10BC image curve, **coerced to the original gamma matrix vector space**, has velocity `(1/2) • (gamma r * gamma s)` at zero, for the standard matrix norm/topology.

The independent audit reconstructs the PBW coordinate equivalence and normed structures directly, checks their equality with the accepted values, and restates the source derivative under that reconstructed norm. It separately restates the generic helper and exact gamma derivative types. The distinct-label and explicit positive half-angle conventions are preserved.

The gate pins the accepted curve and PBW sources, rebuilds the actual F10BI and F10BE dependency closures once, then freshly compiles only the new candidate and independent audit with warnings as errors. It requires exactly three whitelisted axiom reports per log. No unrelated F10BF/F10BG theorem is rebuilt as a claimed mathematical dependency.

Local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. Actual Lean elaboration remains CI's obligation; no F10BJ declaration is accepted before terminal strict success and output review.

**Scope ceiling:** these are ordinary derivatives of real-parameter maps into vector spaces. They do not construct a manifold tangent space, a Lie-group atlas, the global differential of F10BC, or an identification with the canonical F10BB source-plane input. No covering/lift, Fock, gauge or spectral assertion is implied.

**Next action:** inspect F10BJ's strict result. If accepted, audit the exact accepted F10BB coordinate-plane evaluation and source-label convention before qualifying a derivative-velocity comparison; do not silently identify a Clifford bivector with a skew-matrix tangent.


### F10BJ Gate 1 RED — pointwise-function bridge and matrix norm scope

**Run:** [#41526230040](https://github.com/etblink/math/actions/runs/41526230040) — terminal red  
**Exact tested commit:** `9c504cb893d84b9cad4060f6448c6a0fda2cfbc3`  
**Candidate blob:** `5e95c7085849fe2e4331e0d491ee6fe1ac99625c`  
**Audit blob:** `dcf36c44cf9ee35ddef71207289853cbb03e598b`  
**Job:** `exact-pbw-source-and-gamma-curve-derivatives` (`125554543609`)  
**Artifact:** `13180318026`; ZIP SHA-256 `8feea9ad19f77cbe1ef7f7f4b40dd8e8d01e20814ff7f2f20f4168e1f38516fa`

Exact source/audit/toolchain pins, pinned dependency restoration, and the joint accepted F10BI/F10BE dependency rebuild passed. Fresh F10BJ warnings-as-errors compilation failed; the independent audit was skipped. **Zero F10BJ roots are accepted.** The three emitted `sorryAx` reports are failed-elaboration artifacts, not accepted declarations.

Two source-interface failures were observed:
1. **First error, line 45:** the scalar cosine and sine derivative proofs elaborated, but `HasDerivAt.add` produced the function-valued sum `(fun y => cos(y/2) • a) + (fun y => sin(y/2) • b)`. The final `simpa` did not bridge this to the explicitly pointwise lambda in the helper's proposition. This is a function-representation mismatch, not a scalar derivative counterexample.
2. **Line 83:** specialization of the normed-vector helper to `GammaMatrix` could not synthesize `NormedAddCommGroup GammaMatrix`. The standard matrix product topology existed, but a matrix norm had not been explicitly selected. The pinned matrix norm file deliberately supplies multiple norm choices as scoped non-instances.

The exact source alias is `GammaMatrix := Matrix SpinIndex SpinIndex ℝ`, not a different carrier or a 48-label replacement. Pinned `Mathlib/Analysis/Calculus/Deriv/Add.lean` confirms that `HasDerivAt.add` returns the function sum. Pinned `Mathlib/Analysis/Matrix/Normed.lean` explicitly supplies `Matrix.Norms.Elementwise`, whose normed group and real normed space are constructed from the iterated Pi structures.

### F10BJ Gate 2 — explicit pointwise bridge and elementwise matrix norm CANDIDATE

**Repaired source blob:** `528937bc6f528eed64aea16ecc5eb69c74c2dd99`  
**Strengthened audit blob:** `13186e289439acf51af42c80cb0585f74a6285c2`

The three theorem declarations and their printed propositions remain textually unchanged:
- Replace the helper's final broad `simpa` with an explicit equality of the function-valued sum and pointwise lambda, proved by `funext` and pointwise reflexivity. Rewrite the derivative proof through that equality, then simplify only `zero_smul` and `zero_add`.
- Explicitly import the pinned matrix norm module and enable `open scoped Matrix.Norms.Elementwise` in the candidate. This supplies the normed structures needed by the generic derivative helper.
- In the independent audit, capture the existing gamma product topology **before** opening the matrix norm scope. Add positive controls for `NormedAddCommGroup GammaMatrix` and `NormedSpace ℝ GammaMatrix`, and require the post-scope topology to equal the captured product topology by reflexivity. This equality must compile; do not presume topology compatibility merely because the carrier is finite-dimensional.
- Retain the independent PBW norm reconstruction and all three original derivative-type restatements. Update source and audit pins atomically and extend the static scope checks to require the explicit bridges.

No limit increase, warning suppression, admission, theorem weakening, changed curve, alternate matrix/gamma carrier or global instance registration is introduced. The matrix norm is an explicit scoped choice, and its compatibility with the already used topology is now an additional compiler obligation.

**Local validation:** the three theorem headers/propositions are textually unchanged; source/audit hashes, declaration inventory, required bridge controls, YAML, shell and embedded Python checks pass. The local workspace has no Lean executable, so this is static verification only.

**Procedural lesson:** ordinary topology synthesis does not supply a normed-vector-space instance for a matrix type with several legitimate norm choices. Also, do not assume broad simplification will cross a function-valued operator boundary; provide a qualified pointwise equality or source-verified function-form API before raising any limits.

**Next action:** review the unchanged strict gate, including the stronger independent audit. If the same function/topology boundary remains unresolved, isolate it in a small diagnostic before another full-source edit. Even a green F10BJ would establish only the stated vector-space curve derivatives, not a manifold differential or an F10BB tangent identification.


### F10BJ Gate 2 ACCEPTED — exact source and gamma curve derivatives at zero

**Run:** [#41528424272](https://github.com/etblink/math/actions/runs/41528424272) — terminal green  
**Exact tested commit:** `278600c4e694b9e27dbd8b3a229c66e7846a978a`  
**Accepted source blob:** `528937bc6f528eed64aea16ecc5eb69c74c2dd99`  
**Independent audit blob:** `13186e289439acf51af42c80cb0585f74a6285c2`  
**Job:** `exact-pbw-source-and-gamma-curve-derivatives` (`125562047366`)  
**Artifact:** `13182055810`; ZIP SHA-256 `cdd4893708ae458e9f1aa2290b56fe023ebce375f73aa46245745d856ef8a871`

Exact pins and dependency restoration, accepted F10BI/F10BE ancestry rebuild, fresh F10BJ warnings-as-errors compilation, and the strengthened independent topology/type/axiom audit passed. The classifier emitted `V10H_F10BJ_EXACT_PBW_SOURCE_AND_GAMMA_DERIVATIVE_TYPES_AXIOMS_PASS`. All three root reports in both compiler/audit logs contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

**Accepted declarations:**
- `realHalfAngleVectorCurve_hasDerivAt_zero`
- `source9PlaneSpinCurve_coe_hasDerivAt_zero`
- `source9PlaneSpinCurve_gamma_hasDerivAt_zero`

For distinct labels, the actual source curve coerced into the accepted PBW-normed Clifford vector space has derivative `(1/2) • (ι(e_r)*ι(e_s))` at zero. Its exact F10BC original-gamma matrix image has derivative `(1/2) • (gamma r * gamma s)` at zero. The audit independently reconstructed the PBW structures and confirmed the elementwise matrix norm's topology equals the pre-existing product topology by reflexivity.

**Confirmed repair lesson:** an explicit function-sum/pointwise-lambda equality and an explicitly selected matrix norm resolved Gate 1's two source-interface defects. The theorem propositions, scalar half-angle convention and curve were unchanged. Preserve Gate 1 red and its artifacts as negative knowledge.

**Scientific ceiling:** these are real-parameter vector-space derivatives at zero, not a manifold derivative of the whole F10BC group homomorphism. No canonical `so(9)` tangent identification, source group-action differential, Lie-group atlas, covering/lift, Fock, gauge or spectral result follows.

### F10BK Gate 1 — canonical native-plane velocity comparison CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BKCoordinatePlaneVelocityComparison.lean`  
**Candidate source blob:** `382e0c369c1455cfd39a7153c9017e6b9b546fd1`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BKIndependentAudit.lean`  
**Audit blob:** `7c83f0446ed37b935cff96ce27df67acad83fd05`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bk-coordinate-plane-velocity-comparison-strict.yml`

The source audit inspected accepted F10BB `coordinateToOriginalGammaSkewLieHom`, F10AV `coordinateToOriginalGammaLinearMap_coordinatePlane`, and the original source `coordinatePlane9` definition and matrix-unit bridge.

**Exact normalization:** the accepted F10AV coefficient map is `(1/4) • Σ_rs A_rs • (gamma r*gamma s)`. The source plane is exactly `F_rs = E_rs - E_sr`; for `r ≠ s`, its image is **positive** `(1/2) • (gamma r*gamma s)`. F10BB packages this same coefficient map in the canonical native `so SpaceIndex ℝ →ₗ⁅ℝ⁆ so SpinIndex ℝ` carriers. No label reorder or extra source half factor is needed.

Four declarations are proposed: one canonical-plane construction and three proofs.
- `source9CoordinatePlaneInSo`
- `coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply`
- `source9PlaneCliffordVelocity_gamma_eq_coordinatePlaneLieHom`
- `source9PlaneSpinCurve_gamma_hasDerivAt_coordinatePlaneLieHom`

The new plane value packages the **existing** `coordinatePlane9 r s` into exactly `LieAlgebra.Orthogonal.so SpaceIndex ℝ` with the accepted transpose proof. An explicit raw-carrier bridge exposes F10BB's existing coefficient evaluation. The candidate then checks that evaluating the qualified Clifford velocity through the original gamma algebra hom gives that canonical LieHom image, and restates the qualified target-curve derivative with the LieHom image as its derivative value.

The independent audit checks the plane's underlying matrix is literally `Matrix.single r s 1 - Matrix.single s r 1`, not a differently normalized input. It restates the canonical evaluation, Clifford-velocity image equality and derivative comparison, and rechecks the elementwise matrix topology against the pre-existing product topology.

The workflow pins F10BB, F10AV, the exact original-plane definition/matrix-unit bridge, accepted F10BJ and curve/PBW sources. It rebuilds the actual F10BJ/F10BB dependency closures once and requires fresh warnings-as-errors compilation plus exactly four whitelisted root reports per candidate/audit log. Static source/audit hashes, inventory/scope guards, YAML, shell and embedded Python checks pass. No local Lean elaboration is claimed; no F10BK declaration is accepted before terminal success and output review.

**Scope ceiling:** a successful comparison would identify the **target velocity** along each accepted distinct-coordinate-plane source curve with F10BB evaluated on the corresponding canonical matrix label. It would not establish that the source curve's manifold tangent is that `so(9)` element, identify the full source tangent Lie algebra, or prove a global F10BC differential theorem.

**Next action:** inspect F10BK's strict result. If accepted, source-audit the exact Clifford commutator/conjugation action on source nine-vectors as the next possible normalization bridge. Do not silently equate a Clifford bivector, a skew matrix and a manifold tangent vector.


### F10BK Gate 1 ACCEPTED — canonical native-plane gamma velocity comparison

**Run:** [#41530621671](https://github.com/etblink/math/actions/runs/41530621671) — terminal green  
**Exact tested commit:** `6f36df1b0901288d0d755855f468851427424772`  
**Accepted source blob:** `382e0c369c1455cfd39a7153c9017e6b9b546fd1`  
**Independent audit blob:** `7c83f0446ed37b935cff96ce27df67acad83fd05`  
**Job:** `native-source-plane-original-gamma-velocity` (`125569542465`)  
**Artifact:** `13181798807`; ZIP SHA-256 `4829b0b9a8dce0e7367c4802f2e9e2104ed5d52631b250c458a6a32967740cb8`

Exact pins, pinned dependency restoration, accepted F10BJ/F10BB ancestry rebuild, fresh warnings-as-errors F10BK compilation and independent type/normalization/axiom audit passed. The classifier emitted `V10H_F10BK_EXACT_NATIVE_PLANE_LIEHOM_VELOCITY_TYPES_AXIOMS_PASS`. All four reports in both logs contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

**Accepted inventory:** the construction `source9CoordinatePlaneInSo` and the proofs `coordinateToOriginalGammaSkewLieHom_coordinatePlane_apply`, `source9PlaneCliffordVelocity_gamma_eq_coordinatePlaneLieHom`, and `source9PlaneSpinCurve_gamma_hasDerivAt_coordinatePlaneLieHom`.

**Exact result:** for distinct source labels, the velocity at zero of the exact F10BC gamma-image curve equals the underlying original gamma matrix of F10BB evaluated on the exact canonical `so(9)` plane `F_rs = E_rs - E_sr`. Evaluating the actual Clifford curve velocity through the original gamma algebra hom gives the same matrix. The audit checked the full native plane, with no extra source half factor, and product-topology compatibility.

**Scientific ceiling:** no theorem identifies the source curve's manifold tangent with that matrix plane, identifies the full tangent Lie algebra, or proves a global group-map differential equality. Clifford bivectors, matrix planes and manifold tangent vectors remain distinct interfaces.

**Success lesson:** reuse the accepted coefficient-map evaluation and expose the canonical LieHom's underlying matrix by an explicit carrier bridge. This qualified the positive half-gamma normalization without altering the source plane or re-proving the LieHom.

### F10BL Gate 1 — algebraic source-vector commutator action CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BLSourceCoordinateCommutatorAction.lean`  
**Candidate source blob:** `c373443985d1541ed5d9a68bf787c90e7f8d2c1d`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BLIndependentAudit.lean`  
**Audit blob:** `1900ee7fa3f95d025dd3a2e210f2fa63d9c659d1`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bl-source-coordinate-commutator-action-strict.yml`

Targeted pinned-source inspection confirms `QuadraticMap.polar`, its symmetry, the accepted source quadratic/dot-product bridge, and `CliffordAlgebra.ι_mul_ι_comm`. The candidate uses these actual source interfaces, not the gamma image, to test the normalization on source vectors.

Four proof declarations are proposed:
- `source9Quadratic_polar_coordinate`
- `source9Clifford_pair_commutator_vector`
- `source9CoordinatePlane_mulVec`
- `source9CoordinateBivector_commutator_vector`

The proof sequence is:
1. Polarization of the actual quadratic form against `e_r` is `2 * z r`.
2. The commutator of an arbitrary embedded vector pair with an embedded vector is expressed through the actual quadratic polarization.
3. The literal native matrix plane acts by `F_rs *ᵥ z = (z s) • e_r - (z r) • e_s`.
4. Hence commutation by `(1/2) • (ι(e_r)*ι(e_s))` gives exactly `ι(F_rs *ᵥ z)`.

The last proposition is an equality inside the actual `CliffordAlgebra source9Quadratic`, quantified over **every** actual nine-coordinate source vector. It includes all source-label pairs as an algebraic identity. In particular, diagonal labels give a vanishing commutator action; this does not extend the previously qualified distinct-plane curve to the diagonal.

The independent audit restates all four exact types and checks the matrix plane is the same full `Matrix.single r s 1 - Matrix.single s r 1` used in F10BK. No gamma replacement, source-label change, special basis-vector-only restriction, manifold tangent assumption, or source-action derivative is smuggled into the conclusions.

This algebraic candidate imports its actual source-coordinate dependencies directly, so the gate rebuilds F10BI and the accepted coordinate matrix-unit bridge without rebuilding F10BB/F10BJ as unnecessary mathematical dependencies. Fresh warnings-as-errors source/audit compilation and exactly four whitelisted axiom reports in each log remain mandatory.

Local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. No local Lean elaboration is claimed; zero F10BL proofs are accepted before the terminal strict result and output review.

**Scope ceiling:** the candidate is an algebraic commutator action calculation. It is not a derivative of the actual group conjugation curve and does not construct a source tangent equivalence, Lie-group atlas or global F10BC differential theorem.

**Next action:** inspect F10BL's strict result. If accepted, source-audit the bounded-bilinear multiplication and inverse-curve calculus required to differentiate the actual source conjugation curve under the already accepted PBW norm. Do not assume a normed-ring multiplication estimate or a manifold tangent identification from a topological-ring theorem.


### F10BL Gate 1 RED — unresolved guarded coordinate sums

**Run:** [#41533585179](https://github.com/etblink/math/actions/runs/41533585179) — terminal red  
**Exact tested commit:** `c3d8c520aee5ac2512180c4338acdb225fa43590`  
**Candidate blob:** `c373443985d1541ed5d9a68bf787c90e7f8d2c1d`  
**Job:** `actual-source-coordinate-commutator-action` (`125579694000`)  
**Artifact:** `13184271082`; ZIP SHA-256 `d22e8a7f017390f294f0cdfa317f2e47d8278fc99f665d76678ebd82df5e5a27`

Exact pins, pinned dependency restoration and accepted actual-source ancestry rebuild passed. Fresh F10BL warnings-as-errors compilation failed; the independent audit was skipped. **Zero F10BL proofs are accepted.**

The polarization and general Clifford pair-commutator declarations elaborated with only the permitted axioms. The first failure was `source9CoordinatePlane_mulVec` at source line 65. Its four coordinate-equality cases left three residual goals, each of the same form:
`(∑ x, if p ∧ x=j then z x else 0) = if p then z j else 0`.
The displayed instances used `p := r=s`, `j := r`, or their swapped versions. Ordinary simplification had not split the guard inside the finite sum. No Clifford identity or source action counterexample was produced.

The matrix-plane theorem's failed elaboration introduced the displayed `sorryAx`, which propagated to the final commutator-action declaration. Those are failed-elaboration artifacts, not source admissions or accepted proofs.

### F10BL Gate 2 — explicit guarded-sum bridge CANDIDATE

**Repaired source blob:** `bc0d8539c2523fffe2f36ee4b121a1b81a1431be`  
**Independent audit blob unchanged:** `1900ee7fa3f95d025dd3a2e210f2fa63d9c659d1`

Add a local `sum_guarded_coordinate` lemma inside the matrix-plane proof, quantified over an arbitrary decidable proposition `p` and source coordinate `j`. Split `p` explicitly; the true branch becomes the ordinary single-coordinate finite sum, and the false branch is zero. Apply that exact lemma to each residual goal after the existing coordinate-case simplification.

All four theorem headers/propositions are textually unchanged. The polarization proof, general Clifford proof, final normalized action proof, actual source labels and carriers, independent audit, compiler strictness, axiom whitelist and limits remain unchanged. The workflow changes only the source blob pin.

**Procedural lesson:** a conjunction inside a finite-sum selector may survive broad simplification even when the outer coordinate cases were split. Bridge the guard explicitly with a general local sum identity; do not add a distinct-label hypothesis or use substitution-heavy source-label case repairs.

**Local validation:** theorem-header equality, source/audit hashes, declaration inventory/scope guards, YAML, shell and embedded Python checks pass. This is static validation; the unchanged strict CI gate must compile the new local bridge and complete the independent audit. If the same selector boundary remains unresolved, isolate it in a diagnostic before another full-source edit.


### F10BL Gate 2 ACCEPTED — exact algebraic source coordinate action

**Run:** [#41535514514](https://github.com/etblink/math/actions/runs/41535514514) — terminal green  
**Exact tested commit:** `fdd0771396d783f930544e48f6765522be55ac0e`  
**Accepted source blob:** `bc0d8539c2523fffe2f36ee4b121a1b81a1431be`  
**Independent audit blob:** `1900ee7fa3f95d025dd3a2e210f2fa63d9c659d1`  
**Job:** `actual-source-coordinate-commutator-action` (`125586229478`)  
**Artifact:** `13184607938`; ZIP SHA-256 `51b4627b74cc337ca9506d2579b379e707dbe392d07195aa0dca269a339f97cd`

Exact pins, pinned Lean/Mathlib restoration, accepted source ancestry rebuild, fresh warnings-as-errors source compilation and independent exact-type/normalization/axiom audit passed. Each of the four root reports in both logs contains only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

All four F10BL proofs are now accepted: `source9Quadratic_polar_coordinate`, `source9Clifford_pair_commutator_vector`, `source9CoordinatePlane_mulVec`, and `source9CoordinateBivector_commutator_vector`. In the actual source Clifford algebra, commutation by the positive half-bivector gives exactly the embedded action of the literal full native matrix plane `E_rs - E_sr` on every source nine-vector. The algebraic identity includes diagonal labels; the distinct-plane curve remains restricted to `r ≠ s`.

**Success lesson:** the local guarded-coordinate-sum lemma closes the selector boundary without changing any theorem proposition, source labels, normalization or audit. The Gate 1 red run and its failed-elaboration provenance above remain immutable.

**Scope ceiling:** this is an algebraic commutator identity, not yet a derivative of the actual conjugation curve, a source tangent equivalence, a manifold atlas or a global differential theorem.

### F10BM Gate 1 — actual inverse source curve derivative CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BMInverseSourceCurveDerivative.lean`  
**Candidate source blob:** `f400909e5bf8d7ecb6d5428c48f4218c6c46550b`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BMIndependentAudit.lean`  
**Audit blob:** `057c3313f16775de85109fd5ca257eef69c04cf8`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bm-inverse-source-curve-derivative-strict.yml`

Pinned Mathlib source inspection confirms that the existing `spinGroup` inverse is definitionally `star`, that Clifford star sends `ι(v)` to `-ι(v)`, and that `CliffordAlgebra.star_smul` is real-linear. The candidate uses this actual inverse and the accepted F10BI half-angle source curve, without replacing the group or its PBW topology.

Three proof declarations are proposed:
- `source9CoordinateClifford_anticommute`: distinct actual coordinate Clifford vectors anticommute, derived from the actual quadratic polarization.
- `source9PlaneSpinCurve_inv_coe`: the actual inverse curve has the exact expression `cos(t/2) • 1 + sin(t/2) • (-(ι(e_r)*ι(e_s)))`.
- `source9PlaneSpinCurve_inv_coe_hasDerivAt_zero`: under the accepted named PBW norm, the actual inverse curve has derivative `-((1/2) • (ι(e_r)*ι(e_s)))` at zero.

The independent audit reconstructs the PBW coordinate equivalence and induced norm/space from the accepted basis, checks definitional equality with the accepted named coordinates and norm, and restates all three exact propositions. The strict workflow pins accepted F10BL/F10BJ and their actual source ancestry, rebuilds their closures, freshly compiles the candidate and audit with warnings-as-errors, and requires exactly three permitted root reports in each log. No global normed-ring instance, multiplication bound, new axiom, admission, linter suppression or limit increase is introduced.

**Route refinement:** F10BF supplies a topological ring, not a normed-ring estimate for this PBW norm. The exact half-angle formulas allow an explicit scalar-coefficient route to differentiating the actual conjugation curve. F10BM qualifies only the inverse expression and negative inverse velocity prerequisite; it does not yet differentiate multiplication or conjugation. A later conjugation proof must either justify the appropriate bounded-bilinear calculus or derive and differentiate the explicit finite scalar-coefficient expansion. Neither can be inferred from topological-ring continuity alone.

**Validation state:** local source/audit hashes, inventory/scope guards, YAML, shell syntax and embedded Python checks pass. No local Lean executable is installed; actual elaboration remains the new strict CI obligation. Zero F10BM proofs are accepted before terminal success and output review.

**Next action:** inspect F10BM's strict result. If accepted, prove the actual source conjugation-curve derivative on arbitrary embedded nine-vectors and compare it to F10BL's literal coordinate-plane action. Keep Clifford velocities, matrix planes and manifold tangent vectors distinct; source tangent identification and the global F10BC differential remain open.


### F10BM Gate 1 RED — implicit quadratic-form inference and unused simp argument

**Run:** [#41538300404](https://github.com/etblink/math/actions/runs/41538300404) — terminal red  
**Exact tested commit:** `806db8af5df8d5c7ee149f66902f08539005c4f2`  
**Candidate source blob:** `f400909e5bf8d7ecb6d5428c48f4218c6c46550b`  
**Job:** `actual-inverse-source-curve-derivative` (`125595684507`)  
**Artifact:** `13185357682`; ZIP SHA-256 `653996769f1e5ac28fa2a3435da5554547c84d950c5a7d01ff795c65a5c9223b`

Exact pins, pinned Lean/Mathlib restoration and accepted F10BL/F10BJ ancestry rebuild passed. Fresh F10BM warnings-as-errors compilation failed; the independent audit was skipped. **Zero F10BM proofs are accepted.**

The first anticommutation proof called `CliffordAlgebra.ι_mul_ι_comm` with only its two vector arguments. At line 44 Lean left the scalar/quadratic-form parameters unresolved and reported a stuck `Module ?m.52 (SpaceIndex → ℝ)` instance problem. The `simpa ... using` elaboration did not obtain the needed quadratic form from the expected final equality. At line 42 the strict linter also reported that `hrs` was unused in `simp [source9CoordinateVector, hrs, Ne.symm hrs]`; the reversed inequality is the needed selector fact.

All three displayed root reports consequently contain `sorryAx`, originating in failed elaboration of the first declaration and propagating through its dependents. These reports qualify no proofs. No mathematical counterexample, failure of the actual inverse formula, or failure of the accepted PBW derivative helper was established.

### F10BM Gate 2 — explicit quadratic-form bridge CANDIDATE

**Repaired source blob:** `545581346eaf563b54dcf3c828e43d19c2d1dd23`  
**Independent audit blob unchanged:** `057c3313f16775de85109fd5ca257eef69c04cf8`

Pinned Mathlib `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` confirms that `ι_mul_ι_comm` takes an implicit quadratic form `Q`. Supply `(Q := source9Quadratic)` at that application, which also fixes the scalar and module carrier. Remove only the unused `hrs` simp argument; retain `Ne.symm hrs`. All three theorem headers/propositions and the downstream inverse-expression and derivative proofs are textually unchanged. The workflow changes only the candidate source pin.

**Failure lesson:** in a `simpa ... using` argument, two vectors can determine the underlying module without determining the scalar/quadratic form of a polymorphic Clifford identity. Supply the actual quadratic form explicitly before simplification. Strict unused-simp feedback is repaired by removing the redundant fact, not by disabling its linter.

**Validation state:** local source/audit hashes, unchanged theorem headers and audit, declaration/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean elaboration is claimed. The unchanged strict gate must freshly compile the explicit bridge and run the independent audit before any F10BM acceptance. Source conjugation differentiation, manifold tangent identification and the global F10BC differential remain open.
