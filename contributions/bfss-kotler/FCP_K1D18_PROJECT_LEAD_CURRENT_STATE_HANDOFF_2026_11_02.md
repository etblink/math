# BFSS Project Lead — current-state delta handoff

> **Latest accepted mathematical increment remains F10CM**, [run 41784700161](https://github.com/etblink/math/actions/runs/41784700161), tested `3626ee413b72781aa34d8344fbc79963c598b03f`. **F10CN is now a candidate pending strict CI:** full orthogonal-matrix recovery from upper entries inside an explicit open identity neighborhood, and equality of the actual reconstructed/original natural matrices with both neighborhood hypotheses retained. Original source Spin equality, local kernel control and source neighborhood coverage remain open. All prior evidence is preserved.

**As of:** 2026-11-03 UTC  
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


### F10BM Gate 2 ACCEPTED — actual inverse curve and negative PBW velocity

**Run:** [#41540062431](https://github.com/etblink/math/actions/runs/41540062431) — terminal green  
**Exact tested commit:** `ae580875eb931bd46afb82d215f25b69c0b236a1`  
**Accepted source blob:** `545581346eaf563b54dcf3c828e43d19c2d1dd23`  
**Independent audit blob:** `057c3313f16775de85109fd5ca257eef69c04cf8`  
**Job:** `actual-inverse-source-curve-derivative` (`125601637956`)  
**Artifact:** `13186532529`; ZIP SHA-256 `6a1012230330971135d86e045faf7fedbdcfae8a466e45c2995ae94fec121581`

Exact pins, pinned dependency restoration, accepted F10BL/F10BJ ancestry rebuild, fresh warnings-as-errors source compilation and independent PBW/type/axiom audit passed. The classifier emitted `V10H_F10BM_ACTUAL_INVERSE_EXACT_PBW_DERIVATIVE_TYPES_AXIOMS_PASS`. All three root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The three F10BM proofs are accepted: `source9CoordinateClifford_anticommute`, `source9PlaneSpinCurve_inv_coe`, and `source9PlaneSpinCurve_inv_coe_hasDerivAt_zero`. For distinct original source labels, the actual group inverse has the negative-bivector half-angle formula and PBW-space derivative `-((1/2) • (ι(e_r)*ι(e_s)))` at zero. The audit reconstructed the accepted coordinate equivalence and induced norm/space rather than silently selecting another topology.

**Success lesson:** an explicit `Q := source9Quadratic` supplies the missing scalar/module information before the polymorphic Clifford identity is simplified. Removing the unused simp fact resolves the strict linter feedback. No theorem proposition, audit, norm, limit or strictness setting was changed. The Gate 1 red provenance remains above.

**Scope ceiling:** F10BM alone does not differentiate the actual conjugation action or identify a manifold tangent space.

### F10BN Gate 1 — actual source conjugation derivative CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BNSourceConjugationDerivative.lean`  
**Candidate source blob:** `4090ad6c9ad58249b5a617245065454baa4fb58a`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BNIndependentAudit.lean`  
**Audit blob:** `a94269a67a995b25aeea3fc3f8a597e97ef5772a`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bn-source-conjugation-derivative-strict.yml`

Pinned Mathlib source inspection verifies the scalar `HasDerivAt.mul` and `HasDerivAt.smul_const` interfaces. The candidate reuses the accepted actual curve and inverse formulas. With `B := ι(e_r)*ι(e_s)`, `c := cos(t/2)`, and `s := sin(t/2)`, it expands actual conjugation on any fixed Clifford element `W` as
`(c*c) • W + (c*s) • (W*(-B)) + (s*c) • (B*W) + (s*s) • ((B*W)*(-B))`, with the explicit two-pair grouping in the Lean proposition.

Only the real scalar products vary. Their derivatives at zero are respectively `0, 1/2, 1/2, 0`. The four-term vector-space helper uses those scalar derivatives, scalar multiplication by fixed Clifford coefficients, and addition. Explicit function equalities bridge pointwise multiplication/addition before simplification, following the accepted F10BJ lesson. Algebraic scalar-multiplication bridges fix the expansion order without assuming commutativity of Clifford multiplication.

Four proof declarations are proposed:
- `realHalfAngleQuadraticVectorCurve_hasDerivAt_zero`: four scalar-product coefficients in any real normed vector space.
- `source9PlaneSpinCurve_conjugation_coe`: the exact four-term expansion using the actual source-group inverse at the same parameter.
- `source9PlaneSpinCurve_conjugation_hasDerivAt_zero`: for every fixed Clifford `W`, the PBW-space derivative is `[(1/2) • B, W]` in explicit subtraction form.
- `source9PlaneSpinCurve_conjugation_vector_hasDerivAt_zero`: for every source nine-vector `z`, the derivative is exactly `ι((coordinatePlane9 r s).mulVec z)`, using accepted F10BL.

All actual curve statements require `r ≠ s`. The independent audit reconstructs PBW coordinates and the induced norm/space, restates all four exact types including arbitrary `W` and arbitrary `z`, and rechecks that the source matrix is literally `Matrix.single r s 1 - Matrix.single s r 1`. The workflow pins accepted F10BM/F10BL/F10BJ and source ancestry, rebuilds the F10BM closure once, freshly compiles the candidate and independent audit, and requires exactly four permitted root reports in each log.

**Method boundary:** this is scalar-coefficient differentiation of an explicit algebraic expansion. No Clifford normed-ring instance, multiplication estimate, abstract topological-ring-to-calculus inference, global instance, admission, extra axiom, linter suppression or limit increase is introduced. The accepted F10BM negative inverse velocity remains independently qualified; the new conjugation proof uses its exact inverse formula.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. There is no local Lean executable; elaboration remains the strict CI obligation. Zero F10BN proofs are accepted before terminal success and output review.

**Scientific ceiling:** even a successful result will be an ordinary real-parameter derivative in the accepted ambient Clifford PBW vector space. It will not construct a source or target Lie-group atlas, identify a source manifold tangent with native `so(9)`, or establish the full global F10BC differential equality.

**Next action:** inspect F10BN's strict result. If accepted, use its actual source action derivative together with F10BK's exact gamma-image velocity comparison to assess the remaining source tangent-identification interface. Do not silently identify a Clifford velocity, a native skew-matrix plane and a manifold tangent vector.


### F10BN Gate 1 ACCEPTED — actual source conjugation derivative

**Run:** [#41542519552](https://github.com/etblink/math/actions/runs/41542519552) — terminal green  
**Exact tested commit:** `52b82a7b3eef287b2e1b2671a4b9350c1c37c7d1`  
**Accepted source blob:** `4090ad6c9ad58249b5a617245065454baa4fb58a`  
**Independent audit blob:** `a94269a67a995b25aeea3fc3f8a597e97ef5772a`  
**Job:** `actual-source-conjugation-derivative` (`125609965111`)  
**Artifact:** `13188170867`; ZIP SHA-256 `77fd08a8eb3c8bcf6b4fd14c3c1c83801188f0c6084a777f0d1b9ad401dfe7e0`

Exact pins, pinned dependency restoration, accepted F10BM ancestry rebuild, fresh warnings-as-errors source compilation and independent PBW/type/axiom audit passed. The classifier emitted `V10H_F10BN_ACTUAL_CONJUGATION_NATIVE_PLANE_PBW_DERIVATIVE_TYPES_AXIOMS_PASS`. All four root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The four F10BN proofs are accepted: `realHalfAngleQuadraticVectorCurve_hasDerivAt_zero`, `source9PlaneSpinCurve_conjugation_coe`, `source9PlaneSpinCurve_conjugation_hasDerivAt_zero`, and `source9PlaneSpinCurve_conjugation_vector_hasDerivAt_zero`. Actual source-curve conjugation of every fixed Clifford element has the positive half-bivector commutator velocity. On every embedded actual nine-vector, the derivative is exactly `ι((coordinatePlane9 r s).mulVec z)` for distinct labels.

**Success lesson:** expanding the accepted actual curve and inverse into four fixed vector coefficients reduces the derivative to scalar products, scalar multiplication and addition. Explicit function-equality bridges avoid the earlier pointwise-function simplification issue. No normed-ring multiplication estimate, atlas or extra instance is needed for this route.

**Remaining interface assessment:** F10BN gives an ambient Clifford-valued derivative, while F10BK separately gives the original gamma-image velocity as the canonical LieHom's native-plane image. To put the source action in the original nine-vector carrier, recover the vector canonically and prove its embedding is exact actual conjugation. Neither of these curve facts alone identifies a manifold tangent space. The next bounded step below addresses vector recovery and vector-valued differentiation; a source/target atlas and full tangent identification remain separate.

### F10BO Gate 1 — actual nine-vector conjugation derivative CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BOSourceVectorConjugationDerivative.lean`  
**Candidate source blob:** `03287d741b05cd4e373f1b5e608d0e6888b63e89`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BOIndependentAudit.lean`  
**Audit blob:** `744a1917c34857f40c08aded9f2b1480c7dfe62c`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bo-source-vector-conjugation-derivative-strict.yml`

Targeted pinned-source inspection reuses the following actual Mathlib interfaces:
- `SpinGroup.lean`: `spinGroup.toUnits` and `spinGroup.conjAct_smul_ι_mem_range_ι`, which prove that actual source Spin conjugation preserves the embedded vector range. The inspected file supplies range invariance, rather than a packaged vector-space action or manifold atlas.
- `CliffordAlgebra/Contraction.lean`: the accepted real-linear `equivExterior`, `changeForm_ι`, and `changeForm.associated_neg_proof` send the Clifford vector embedding to the exterior vector embedding.
- `ExteriorAlgebra/Basic.lean`: `ιInv` and `ι_leftInverse` recover the original vector linearly.
- `FDeriv/Linear.lean` and `Deriv/Comp.lean`: continuous-linear differentiation and `HasFDerivAt.comp_hasDerivAt` transport the accepted F10BN derivative to nine-vectors.

Two constructions and five proofs are proposed:
- `source9CliffordVectorProjection`: `ExteriorAlgebra.ιInv` composed with the accepted real-linear Clifford/exterior equivalence.
- `source9CliffordVectorProjection_ι`: this explicit projection is a left inverse of the actual source vector embedding.
- `source9CliffordVectorProjection_continuous_pbw`: continuity under the accepted named PBW norm and the standard output Pi norm, using accepted finite-dimensionality.
- `source9Spin_conjugation_mem_range`: actual conjugation lies in the original embedded vector range for every actual source Spin element and every source nine-vector.
- `source9SpinVectorConjugation`: the recovered nine-vector obtained by applying that explicit projection to actual conjugation.
- `source9SpinVectorConjugation_ι`: its embedding is literally the actual group conjugation expression, so the projection has not discarded a nonvector component.
- `source9PlaneSpinCurve_vectorConjugation_hasDerivAt_zero`: on the original nine-coordinate real vector space, this actual conjugation curve has derivative `(coordinatePlane9 r s).mulVec z` at zero for every `z` and every distinct pair.

The derivative uses an explicit continuous-linear-map structure-field bridge (`toLinearMap` and `cont`), an explicit composition-function equality, and the projection/embedding left-inverse theorem. No choice of vector preimages, replacement carrier, multiplicative Clifford/exterior equivalence, normed-ring instance or new topology is assumed. The Clifford/exterior equivalence is used only linearly.

The independent audit reconstructs PBW coordinates and the induced norm/space, checks both constructions by definitional equality, restates all five proof types, and rechecks the full literal native plane `Matrix.single r s 1 - Matrix.single s r 1`. The output remains the original `SpaceIndex → ℝ` with its standard Pi structure. The workflow pins accepted F10BN/F10BM/F10BL/F10BJ and actual source ancestry, rebuilds the F10BN closure once, and requires fresh warnings-as-errors compilation and exactly seven permitted root reports in both source and audit logs.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. Zero F10BO declarations are qualified before terminal strict success and output review. No new axiom, admission, global instance, linter suppression or limit increase is introduced.

**Scientific ceiling:** the candidate constructs and differentiates an exact vector-valued conjugation function. It does not yet package a linear/group/orthogonal homomorphism on nine-vectors, prove global smoothness, construct a Lie-group atlas, identify source or target manifold tangent spaces, or establish the global F10BC differential equality. The actual pinned source `spinGroup source9Quadratic` definition is unchanged.

**Next action:** inspect F10BO's strict result. If accepted, reuse the projection left inverse and exact embedding identity when packaging the nine-vector conjugation laws; assess that interface against F10BK's target velocity before any manifold tangent claim. Preserve the distinction between actual action-curve derivatives and a full Lie-group differential.


### F10BO Gate 1 ACCEPTED — actual nine-vector conjugation derivative

**Run:** [#41545078833](https://github.com/etblink/math/actions/runs/41545078833) — terminal green  
**Exact tested commit:** `71488c84e714f9491d182d40ea2fb78b9e04d956`  
**Accepted source blob:** `03287d741b05cd4e373f1b5e608d0e6888b63e89`  
**Independent audit blob:** `744a1917c34857f40c08aded9f2b1480c7dfe62c`  
**Job:** `actual-nine-vector-conjugation-derivative` (`125618581416`)  
**Artifact:** `13188428684`; ZIP SHA-256 `7cff220105a5754a339918fb5fee6051000b047c4c227452b2767500a2813af7`

Exact pins, pinned dependency restoration, accepted F10BN ancestry rebuild, fresh warnings-as-errors source compilation and independent PBW/type/axiom audit passed. The classifier emitted `V10H_F10BO_ACTUAL_NINE_VECTOR_CONJUGATION_DERIVATIVE_TYPES_AXIOMS_PASS`. All seven root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The two constructions `source9CliffordVectorProjection` and `source9SpinVectorConjugation`, and all five associated proofs, are accepted. Canonical vector recovery is a continuous real-linear left inverse of the actual Clifford vector embedding. Conjugation by every actual source Spin element lies in the original vector range, and the recovered vector embeds back to that exact expression. Along each accepted distinct-plane curve, the actual nine-vector-valued conjugation function has derivative `(coordinatePlane9 r s).mulVec z` at zero for every original nine-vector.

**Success lesson:** reuse the existing Clifford/exterior linear equivalence, exterior `ιInv`, and Spin range-invariance theorem. Explicit unit-coercion, continuous-linear-map structure-field and composition-function bridges give an exact transfer to the original vector carrier. No preimage choice or multiplicative Clifford/exterior equivalence is required.

**Scope ceiling:** F10BO supplies an exact vector-valued function and curve derivative. It does not yet package the function's real linearity or group laws, prove quadratic preservation, construct an atlas, or identify a full manifold differential.

### F10BP Gate 1 — actual nine-vector linear representation CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation.lean`  
**Candidate source blob:** `23097e1842b4af3109afe4f5afe181a8a88f5c03`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BPIndependentAudit.lean`  
**Audit blob:** `577618970cc8ed20c8d625564f4a0479583451be`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bp-source-vector-linear-representation-strict.yml`

Pinned `Mathlib/RepresentationTheory/Basic.lean` defines `Representation ℝ G V` as a monoid homomorphism `G →* (V →ₗ[ℝ] V)`. For groups it already proves both `inv_self_apply` and `self_inv_apply`. Reuse that infrastructure to bundle the accepted actual conjugation function; a separate custom invertible-linear-map implementation is unnecessary.

Two constructions and three proofs are proposed:
- `source9CliffordVectorEmbedding_injective`: the actual vector embedding is injective by the accepted explicit projection left inverse.
- `source9SpinVectorLinearMap`: for each actual source Spin element, the exact accepted vector conjugation is a real LinearMap on `SpaceIndex → ℝ`.
- `source9SpinVectorConjugation_one`: the actual identity acts as the vector identity.
- `source9SpinVectorConjugation_mul`: `C(g*h,z) = C(g,C(h,z))`, in the composition order of Mathlib endomorphism multiplication.
- `source9SpinVectorRepresentation`: a genuine `Representation ℝ (spinGroup source9Quadratic) (SpaceIndex → ℝ)` with that exact evaluation.

Linearity follows from the already qualified projection and Clifford embedding linearity plus scalar/distributive ring identities. Identity and composition are proved after applying the now-injective vector embedding, then using the accepted exact conjugation identity, the actual group inverse-product law, explicit subgroup-coercion bridges and ring associativity. No topology, norm or global instance is needed for these algebraic laws.

The independent audit exposes the representation as the raw monoid homomorphism into `Module.End ℝ (SpaceIndex → ℝ)`, checks its exact evaluation by definitional equality, restates all proof types, and verifies its Clifford embedding is literal actual conjugation. It tests both inverse identities through Mathlib's generic representation theorems and rechecks the accepted F10BO plane derivative through the bundle by exact evaluation. These inverse/derivative controls do not add new source theorem roots.

The workflow pins accepted F10BO/F10BN/F10BM/F10BL/F10BJ and actual source ancestry, rebuilds the F10BO closure once, freshly compiles the candidate and independent audit with warnings-as-errors, and requires exactly five permitted root reports in each log. The previous PBW topology and derivative remain qualified at their pinned sources; this new algebraic package introduces no normed structure.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. Zero F10BP declarations are qualified before terminal strict success and output review. No new axiom, admission, global instance, linter suppression or limit increase is introduced.

**Scientific ceiling:** vector-embedding injectivity does not classify the group-representation kernel. The candidate does not prove quadratic preservation, orthogonal or special-orthogonal matrix membership, global smoothness, a manifold tangent identification, a covering/surjectivity theorem, or the global F10BC differential equality.

**Next action:** inspect F10BP's strict result. If accepted, prove preservation of the actual `source9Quadratic` using the exact embedding/conjugation identity and Clifford square law, then assess packaging into the appropriate orthogonal carrier. Determinant-one membership and manifold tangent identification remain separate obligations; do not assume them from the existence of an algebraic linear representation.


### F10BP Gate 1 RED — unresolved identity-ring-hom scalar in LinearMap field

**Run:** [#41547734483](https://github.com/etblink/math/actions/runs/41547734483) — terminal red  
**Exact tested commit:** `e64731db8884703d12f491ac033e498dc8d343ed`  
**Candidate source blob:** `23097e1842b4af3109afe4f5afe181a8a88f5c03`  
**Job:** `actual-nine-vector-linear-representation` (`125627340392`)  
**Artifact:** `13190211742`; ZIP SHA-256 `ccd66f6e6aec6f8198a4d8ed00141759c4a794e3995bdfad26e53b72915196d7`

Exact pins, pinned dependency restoration and accepted F10BO ancestry rebuild passed. Fresh F10BP warnings-as-errors compilation failed; the independent audit was skipped. **Zero F10BP declarations are qualified.**

The only compiler error was the unsolved `map_smul'` field of `source9SpinVectorLinearMap` at line 39. Scalar distribution and projection/embedding linearity had already reduced the goal to
`c • v = (RingHom.id ℝ) c • v`, where `v` is the recovered actual conjugation vector. The restricted `simp only` list did not include identity-ring-hom application normalization.

The embedding-injectivity, actual identity-action and actual multiplication/composition proofs elaborated with only the permitted three axioms. The failed LinearMap field produced `sorryAx` in its declaration and in the dependent representation construction; those reports qualify neither construction. No failure of conjugation linearity or group composition was demonstrated.

### F10BP Gate 2 — explicit scalar identity-ring-hom normalization CANDIDATE

**Repaired source blob:** `47684d3586cf7c53674c8d52341853f3f03fa319`  
**Independent audit blob unchanged:** `577618970cc8ed20c8d625564f4a0479583451be`

Pinned `Mathlib/Algebra/Ring/Hom/Defs.lean` confirms `RingHom.id_apply (x) : RingHom.id α x = x`. Add only this lemma to the existing `map_smul'` simplification list. It directly resolves the exact residual scalar identity. All five declaration headers/types, construction evaluations, other proof bodies, actual carriers, independent audit, compiler strictness, axiom whitelist and limits remain unchanged. The workflow changes only the candidate source blob pin.

**Failure lesson:** a LinearMap's scalar-law structure field may retain its semilinear parent expression `(RingHom.id ℝ) c`. Normalize that scalar homomorphism explicitly when using a restricted simplification list. Reuse the explicit `RingHom.id_apply` bridge already present in accepted source modules rather than relying on transparency to erase the field boundary.

**Validation state:** local source/audit hashes, exact proof-only edit, unchanged declaration headers and audit, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. The unchanged strict gate must freshly compile the scalar bridge and run the independent audit before any F10BP qualification. Quadratic preservation, orthogonal membership and manifold tangent identification remain open.


### F10BP Gate 2 ACCEPTED — actual nine-vector linear representation

**Run:** [#41549431192](https://github.com/etblink/math/actions/runs/41549431192) — terminal green  
**Exact tested commit:** `de1c4143b8489bbe67d1517135ab2cfbe7644f1e`  
**Accepted source blob:** `47684d3586cf7c53674c8d52341853f3f03fa319`  
**Independent audit blob:** `577618970cc8ed20c8d625564f4a0479583451be`  
**Job:** `actual-nine-vector-linear-representation` (`125633026187`)  
**Artifact:** `13192135647`; ZIP SHA-256 `5932f410118956a7379aabafea7e0f7cfea4a09c48149fb3f1e40721374a4aef`

Exact pins, pinned dependency restoration, accepted F10BO ancestry rebuild, fresh warnings-as-errors source compilation and independent exact-type/representation-law/inverse/derivative/axiom audit passed. The classifier emitted `V10H_F10BP_ACTUAL_NINE_VECTOR_LINEAR_REPRESENTATION_TYPES_AXIOMS_PASS`. All five root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The two constructions `source9SpinVectorLinearMap` and `source9SpinVectorRepresentation`, and the three proofs of vector-embedding injectivity, identity action and multiplication/composition, are accepted. The actual source `spinGroup source9Quadratic` now has a genuine algebraic real linear representation on the original `SpaceIndex → ℝ`. Its evaluation is exactly the accepted actual vector conjugation. The independent audit verified both inverse identities through Mathlib's generic representation infrastructure and the existing native-plane curve derivative through the bundle.

**Success lesson:** `RingHom.id_apply` explicitly normalizes the scalar homomorphism retained by the semilinear parent of `LinearMap.map_smul'`. This closes the exact residual field equality without altering any declaration type, construction evaluation, audit, compiler strictness or limit. The Gate 1 red evidence remains immutable above.

**Scope ceiling:** algebraic linear representation is qualified. Quadratic preservation, an orthogonal matrix homomorphism, determinant-one membership, group-kernel classification, smoothness and a full manifold differential are not inferred from it.

### F10BQ Gate 1 — actual source quadratic preservation and isometric equivalence CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BQSourceVectorQuadraticIsometry.lean`  
**Candidate source blob:** `cc78661038f8a9685f9e3eef397941ee90d39ca2`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BQIndependentAudit.lean`  
**Audit blob:** `81a86e36de23f922eb9aafac7f2cafd82f921340`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bq-source-vector-quadratic-isometry-strict.yml`

Pinned source inspection reuses `CliffordAlgebra.ι_sq_scalar` with explicit `Q := source9Quadratic`, `Algebra.commutes` for central real scalars, and `FaithfulSMul.algebraMap_injective` in the actual source Clifford algebra. The new theorem has no scalar-faithfulness hypothesis; the concrete typeclass obligation must synthesize and is separately checked in the audit. No gamma image is used to replace the source scalar carrier.

Two declarations are proposed:
- `source9SpinVectorRepresentation_preserves_quadratic`: for every actual source Spin element and every original nine-vector, the accepted linear representation preserves exactly `source9Quadratic`.
- `source9SpinVectorQuadraticIsometryEquiv`: each actual source Spin element gives an existing Mathlib `source9Quadratic.IsometryEquiv source9Quadratic`, with forward map the accepted representation at `g` and inverse map the same representation at `g⁻¹`.

The preservation proof embeds the claimed real equality faithfully in the actual Clifford algebra. It uses the exact accepted vector-conjugation identity to square the conjugated vector, an explicit coerced `g⁻¹*g=1` bridge, the actual Clifford square law, centrality of the quadratic scalar and an explicit coerced `g*g⁻¹=1` bridge. It never treats the Clifford/exterior equivalence as multiplicative.

Pinned `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean` supplies the exact structure fields `toLinearEquiv` and `map_app'`, plus the existing `refl`, `symm` and `trans` operations. Reuse these fields and Mathlib Representation's generic inverse identities; register no custom group structure. The candidate is an isometric-equivalence family, rather than a newly bundled matrix-group homomorphism.

The independent audit checks scalar injectivity in the actual Clifford carrier, restates the quadratic theorem, checks the same result against the accepted dot-product form, and checks the isometry type and exact forward/inverse evaluations. It verifies literal Clifford conjugation, identity and the `trans` composition order, and rechecks the accepted distinct-plane derivative through the isometry interface. These controls add no extra source theorem roots.

The workflow pins accepted F10BP/F10BO/F10BN/F10BM/F10BL/F10BJ and actual source ancestry, rebuilds the accepted F10BP closure once, freshly compiles the candidate and independent audit with warnings-as-errors, and requires exactly two permitted root reports in each log. No norm, topology or global instance is introduced.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. Zero F10BQ declarations are qualified before terminal strict success and output review. No new axiom, admission, linter suppression or limit increase is introduced.

**Scientific ceiling:** the candidate preserves the actual positive source quadratic form and packages individual isometric equivalences. It does not yet construct an orthogonal matrix homomorphism, prove determinant-one membership, classify the group kernel, prove surjectivity/covering or global smoothness, construct an atlas, or identify the full F10BC manifold differential.

**Next action:** inspect F10BQ's strict result. If accepted, source-audit the existing finite-coordinate linear-map-to-matrix and orthogonal-group interfaces to package the same actual nine-vector representation. Keep determinant-one membership and manifold tangent identification as separately proved obligations.


### F10BQ Gate 1 ACCEPTED — actual source quadratic preservation and isometric equivalence

**Run:** [#41551925679](https://github.com/etblink/math/actions/runs/41551925679) — terminal green  
**Exact tested commit:** `a9bad2a088b862c017d08e8ddf32d6840b609e51`  
**Accepted source blob:** `cc78661038f8a9685f9e3eef397941ee90d39ca2`  
**Independent audit blob:** `81a86e36de23f922eb9aafac7f2cafd82f921340`  
**Job:** `actual-source-quadratic-preservation-isometry` (`125641371373`)  
**Artifact:** `13192128928`; ZIP SHA-256 `fe6253e23f26c91e45fceb95855e108ba3bffa8d30fd08b99439053f170b63e6`

Exact pins, pinned dependency restoration, accepted F10BP ancestry rebuild, fresh warnings-as-errors source compilation and independent exact-type/scalar-faithfulness/isometry/inverse/composition/derivative/axiom audit passed. The classifier emitted `V10H_F10BQ_ACTUAL_QUADRATIC_PRESERVATION_ISOMETRY_TYPES_AXIOMS_PASS`. Both root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The theorem `source9SpinVectorRepresentation_preserves_quadratic` and construction `source9SpinVectorQuadraticIsometryEquiv` are accepted. Every actual source Spin element preserves the actual original-nine-vector quadratic form. The isometric equivalence evaluates by the accepted representation at `g`, with explicit inverse at `g⁻¹`. The independent audit checked the dot-product form, exact Clifford conjugation, identity, composition convention and accepted plane-curve derivative through the interface.

**Success lesson:** the Clifford square law plus the actual group inverse identities reduces preservation to a central real scalar; faithful scalar embedding in the actual Clifford algebra closes the real equality. Existing Representation inverse identities fill the exact quadratic-isometry structure fields. No topology, replacement carrier, unproved scalar-faithfulness hypothesis or custom group instance was needed.

**Scope ceiling:** an isometric-equivalence family is qualified. An orthogonal matrix homomorphism, determinant-one membership, group-kernel classification, smoothness and a full manifold differential remain separate.

### F10BR Gate 1 — actual original-nine-vector orthogonal homomorphism CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BRSourceVectorOrthogonalHom.lean`  
**Candidate source blob:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BRIndependentAudit.lean`  
**Audit blob:** `563518d39305ef2e2f72b21497e7eebfe2e9ffff`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10br-source-vector-orthogonal-hom-strict.yml`

Targeted pinned-source inspection reuses `Mathlib/LinearAlgebra/Matrix/ToLin.lean`'s canonical `LinearMap.toMatrixAlgEquiv'`, literal column evaluation and `LinearMap.toMatrix'_mulVec`. `Mathlib/LinearAlgebra/UnitaryGroup.lean` supplies the actual `Matrix.orthogonalGroup SpaceIndex ℝ` and the exact `mem_orthogonalGroup_iff'` criterion `A.transpose * A = 1`. The existing source Spin-to-gamma O(16) implementation provides a qualified subtype/group-law packaging pattern; the new mathematical output carrier is the original nine-vector action matrix.

Two constructions and four proofs are proposed:
- `source9SpinVectorRepresentation_preserves_dotProduct`: all-vector dot-product preservation, derived by polarizing accepted quadratic preservation with the representation's actual additivity.
- `source9SpinVectorMatrixHom`: the canonical matrix monoid homomorphism of the accepted nine-vector representation, through the existing matrix algebra equivalence.
- `source9SpinVectorMatrixHom_mulVec`: matrix multiplication on every original vector is exactly the accepted representation's value.
- `source9SpinVectorMatrixHom_mem_orthogonalGroup`: the exact original-nine matrix is orthogonal, by its column Gram matrix.
- `source9SpinVectorOrthogonalHom`: the global algebraic homomorphism `spinGroup source9Quadratic →* Matrix.orthogonalGroup SpaceIndex ℝ`.
- `source9SpinVectorOrthogonalHom_mulVec`: the bundled orthogonal homomorphism still evaluates as literal actual nine-vector conjugation.

The dot-product proof compares quadratic preservation for `z`, `w` and `z+w`, uses actual map additivity and dot-product symmetry, then cancels the two real cross terms. The matrix equivalence uses `Pi.single j 1` as column `j`. Orthogonality is checked on every original coordinate pair, with no source-label reorder, new normalization or basis substitute. Explicit canonical matrix/linear-map carrier bridges precede the subtype group-law packaging.

The independent audit checks exact matrix entries and column ordering by definitional equality, exact action on every vector, the concrete transpose identity, the full native O(9) homomorphism type and both homomorphism laws. It verifies that embedding the matrix action gives the exact actual Clifford conjugation expression. It also rechecks the accepted distinct-plane derivative after applying the matrix to every vector. This is a vector-valued derivative control; no whole-matrix manifold differential is asserted.

The workflow pins accepted F10BQ/F10BP/F10BO/F10BN/F10BM/F10BL/F10BJ and actual source ancestry, rebuilds the F10BQ closure once, freshly compiles the candidate and independent audit with warnings-as-errors, and requires exactly six permitted root reports per log. Leaf source/audit scope checks prohibit the alternate `SpinIndex`/`GammaMatrix` target. No new norm, topology, global instance, axiom, admission, linter suppression or limit increase is introduced.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. Zero F10BR declarations are qualified before terminal strict success and output review.

**Scientific ceiling:** the proposed target is O(9) on the original source vectors. Determinant-one membership, the group kernel, surjectivity/covering, continuity/smoothness of the full homomorphism, manifold charts and the full F10BC differential are not proved here. F10BC's original gamma SO(16) homomorphism and F10BK's target-velocity comparison remain separately accepted; this gate supplies the source-side natural nine-vector action.

**Next action:** inspect F10BR's strict result. If accepted, source-audit the remaining determinant and matrix-curve-velocity interfaces against the source chart/tangent obligations. Do not infer determinant one or a Lie-group structure from an algebraic orthogonal homomorphism, or infer source connectedness from a topological-group theorem.


### F10BR Gate 1 RED — malformed primed-iff projection in independent audit

**Run:** [#41554624051](https://github.com/etblink/math/actions/runs/41554624051) — terminal red  
**Exact tested commit:** `5ed3fbcb90397bd4742ebd1b2bb7ba7e4b10f444`  
**Candidate source blob:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Independent audit blob:** `563518d39305ef2e2f72b21497e7eebfe2e9ffff`  
**Job:** `actual-source-nine-vector-orthogonal-hom` (`125650372523`)  
**Artifact:** `13195350353`; ZIP SHA-256 `b652c1a7c3841aa1eca8028efb25aa159d15a7a0ed80d3ce6ce3866b7a9c47ec`

Exact pins, pinned dependency restoration, accepted F10BQ ancestry rebuild and fresh F10BR warnings-as-errors source compilation passed. All six source root reports contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`. The independent audit failed on one anonymous transpose-orthogonality control. **Zero F10BR declarations are qualified by this red gate.**

At audit line 45 Lean reported `Unknown constant Matrix.mem_orthogonalGroup_iff'.mp`. The expression was read as a fully qualified constant name rather than as the `mp` projection of the primed iff theorem. The actual pinned theorem `Matrix.mem_orthogonalGroup_iff'` exists and was already successfully used in the candidate source's membership proof. No missing orthogonal criterion, matrix-coordinate error or mathematical counterexample was shown.

The imported six root reports in the audit output also contain only the permitted three axioms, but these reports do not certify a failed anonymous control. The shell stopped on the audit compiler's nonzero exit before the final two-log classifier ran. This is an independent-audit identifier-application defect; source compilation success alone does not replace complete qualification.

### F10BR Gate 2 — explicit iff-term projection in audit CANDIDATE

**Mathematical source blob unchanged:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Repaired audit blob:** `fd6212be282a100b1ab8ed8601931e25de50592e`

Replace only the audit expression
`Matrix.mem_orthogonalGroup_iff'.mp (source9SpinVectorOrthogonalHom g).property`
with
`(Matrix.mem_orthogonalGroup_iff').mp (source9SpinVectorOrthogonalHom g).property`.
The concrete transpose-orthogonality proposition and its membership premise are unchanged. All six source declarations, implementations, exact coordinates, carriers and derivative controls remain unchanged.

Update the audit blob pin and the syntax-presence guard to the parenthesized expression atomically. The source pin, ancestry, compiler strictness, axiom whitelist and time/resource limits remain unchanged. The guard still requires the explicit intended iff projection; it is not removed or weakened.

**Failure lesson:** parenthesize the fully qualified primed iff theorem as a term before applying `.mp`. A token-presence guard can preserve malformed Lean syntax; source and audit elaboration remain the authority. Classify an anonymous audit-control error separately from theorem compilation, and keep full qualification withheld until both pass.

**Validation state:** local source/audit hashes, unchanged mathematical source and audit control types, exact parenthesis-only audit edit, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. The unchanged strict gate must freshly compile the same source and repaired independent audit before any F10BR acceptance. Determinant-one membership and manifold differential obligations remain open.


### F10BR Gate 2 RED — explicit theorem parameters still unapplied in audit

**Run:** [#41556302867](https://github.com/etblink/math/actions/runs/41556302867) — terminal red  
**Exact tested commit:** `e3d7be9863d8e9dda296cdf9c499bc313ad6461e`  
**Mathematical source blob unchanged:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Audit blob:** `fd6212be282a100b1ab8ed8601931e25de50592e`  
**Job:** `actual-source-nine-vector-orthogonal-hom` (`125655907158`)  
**Artifact:** `13193949745`; ZIP SHA-256 `f6e3dbf00a6ed0c256a3d44596b7c7e932a31d8f90c8bed69eaa5ebc3aa56ff4`

Exact pins, pinned dependency restoration, accepted F10BQ ancestry rebuild and fresh warnings-as-errors source compilation passed again. All six root reports in both printed outputs contain only the permitted three axioms; no `sorryAx`. The independent audit again failed at the same anonymous transpose-orthogonality control, so the final classifier did not run and **zero F10BR declarations are qualified**.

The previous parenthesis repair resolved the unknown-constant interpretation but was incomplete. Lean now reported `Invalid field mp` and displayed the full type of `Matrix.mem_orthogonalGroup_iff'`:
`∀ (n : Type) [DecidableEq n] [Fintype n] (R : Type) [CommRing R] {A : Matrix n n R}, A ∈ Matrix.orthogonalGroup n R ↔ A.transpose * A = 1`.

Thus the parenthesized term was still a function awaiting explicit `n` and `R` arguments. It was not yet an iff proposition to which `.mp` applies. The attempted field lookup was consequently `Function.mp`. No new failure of the orthogonal homomorphism, matrix-coordinate evaluation or source proof was shown.

**Correction to the prior diagnosis:** parsing was only the first issue. The pinned `UnitaryGroup.lean` source declares `variable (n) (R : Type v) [CommRing R]` in the orthogonal-group section. These parameters are explicit. The successful source `rw` application instantiated them from its goal; a direct proof-term projection requires the theorem to be applied first. This explicit-argument boundary should have been checked in the first repair.

### F10BR Gate 3 — fully specialized orthogonality iff in audit CANDIDATE

**Mathematical source blob unchanged:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Repaired audit blob:** `2795a632293658d2fad33e5c0444c7ea0a6f8ff0`

Instantiate `Matrix.mem_orthogonalGroup_iff'` with `SpaceIndex`, `ℝ`, and the exact matrix `(source9SpinVectorOrthogonalHom g : Matrix SpaceIndex SpaceIndex ℝ)`, then apply `.mp` to the existing membership property. This makes the iff proposition and all relevant carriers explicit before field projection. No `Function.mp` definition or alternate mathematical lemma is introduced.

Only that anonymous audit proof term changes. Its concrete transpose-orthogonality proposition, all other controls, all six mathematical source declarations and implementations, actual group/vector/matrix carriers, ancestry, compiler strictness, axiom whitelist and time/resource limits remain unchanged. Update the audit pin and strengthen the syntax guard to require both the explicit index/scalar arguments and the exact matrix argument.

**Failure lesson:** inspect the full declaration type before using theorem field notation. Parentheses resolve term parsing; they do not instantiate explicit parameters. Fully specialize a parameterized iff theorem before `.mp`, using an explicit matrix type when auditing a concrete carrier. Preserve rewrite-tactic and direct-proof-term argument conventions as distinct interfaces.

**Validation state:** local source/audit hashes, unchanged mathematical source and audit control types, exact one-control proof-term edit, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. The unchanged strict gate must freshly compile the same source and fully specialized independent audit before F10BR acceptance. Determinant-one membership and manifold differential obligations remain open.


### F10BR Gate 3 ACCEPTED — actual original-nine-vector orthogonal homomorphism

**Run:** [#41558027343](https://github.com/etblink/math/actions/runs/41558027343) — terminal green  
**Exact tested commit:** `c842d6bcbea24310011237c58611af675fbab520`  
**Accepted mathematical source blob:** `8aa718eba564ae945e618aefbee9329f952256f0`  
**Independent audit blob:** `2795a632293658d2fad33e5c0444c7ea0a6f8ff0`  
**Job:** `actual-source-nine-vector-orthogonal-hom` (`125661573607`)  
**Artifact:** `13195756711`; ZIP SHA-256 `e47bb97e322145d4c6ddd01620e1f2ba4b2dc829cbb42ba32ddc04f7c06d88fd`

Exact pins, pinned dependency restoration, accepted F10BQ ancestry rebuild, fresh warnings-as-errors source compilation and complete independent matrix-coordinate/action/orthogonality/homomorphism/derivative/axiom audit passed. The classifier emitted `V10H_F10BR_ACTUAL_NINE_VECTOR_ORTHOGONAL_HOM_TYPES_AXIOMS_PASS`. All six root reports in each log contain only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`.

The two constructions `source9SpinVectorMatrixHom` and `source9SpinVectorOrthogonalHom`, and all four associated proofs, are accepted. The actual source `spinGroup source9Quadratic` now has a genuine global algebraic homomorphism into the native `Matrix.orthogonalGroup SpaceIndex ℝ`, acting exactly by the accepted original-nine-vector conjugation. The independent audit verified literal column ordering, full all-vector action, the concrete transpose identity, homomorphism laws, exact Clifford embedding and the accepted derivative after application to every vector.

**Success lesson:** fully apply the existing orthogonality iff theorem to its explicit index, scalar and exact matrix before projecting `.mp`. Parenthesizing alone does not supply explicit parameters. The mathematical source was unchanged across all three attempts; both prior red runs and the incomplete first repair remain recorded above. Complete independent qualification is now established rather than inferred from clean source compilation alone.

**Scope ceiling:** O(9) membership and the algebraic homomorphism are qualified. Determinant-one membership, the group kernel, surjectivity/covering, global continuity/smoothness and a manifold differential remain separate obligations.

### F10BS Gate 1 — whole original-nine matrix curve velocity CANDIDATE

**Source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BSSourceMatrixCurveVelocity.lean`  
**Candidate source blob:** `d06ba831accab10dc09b6f150a7b0c0d9a7a4072`  
**Independent audit:** `lean/diagnostics/FCP_K1D18V10HF10BSIndependentAudit.lean`  
**Audit blob:** `fde386d80e3a219dbc696bb20bc3617f6370b244`  
**Workflow:** `.github/workflows/bfss-kotler-v10h-f10bs-source-matrix-curve-velocity-strict.yml`

**Route assessment:** inspected F10Q's determinant-one proof. It concerns `gammaDetDirectHom` and uses the separately qualified F10P positivity theorem for that original gamma determinant character. No equality between that character and the new nine-vector matrix determinant has been proved, so it cannot establish determinant one for F10BR. That remains a distinct source-action obligation. The next bounded result instead completes the whole source-action matrix velocity from the already qualified vector-valued derivative.

Pinned `Mathlib/Analysis/Calculus/Deriv/Prod.lean` supplies `hasDerivAt_pi` with implicit family/function/derivative/point parameters. It is applied to a typed existing vector derivative and twice to the typed matrix derivative goal. Pinned `Mathlib/Analysis/Matrix/Normed.lean` defines the scoped elementwise matrix norm through the corresponding Pi normed structures. Reuse the accepted F10BJ/F10BK scope and product-topology audit pattern; register no global normed instance.

Two proofs are proposed:
- `source9PlaneSpinCurve_vectorMatrix_entry_hasDerivAt_zero`: each literal nine-by-nine matrix entry of the actual source plane curve has derivative `coordinatePlane9 r s i j` at zero.
- `source9PlaneSpinCurve_vectorOrthogonalMatrix_hasDerivAt_zero`: the entire underlying matrix of the actual O(9) image curve has derivative exactly `coordinatePlane9 r s` at zero.

The entry proof uses F10BO's actual vector-conjugation derivative on the original column `source9CoordinateVector j`, the forward Pi criterion, and an explicit equality with F10BR's literal matrix-entry evaluation. The derivative coordinate is reduced using `dotProduct_single` and multiplication by one. The whole-matrix proof assembles all rows and columns using the existing Pi criterion twice. Every curve theorem retains `r ≠ s`; no diagonal source curve is introduced.

The mathematical source uses only the original-nine matrix target. The independent audit separately imports accepted F10BK. It restates both exact derivative types, checks the standard elementwise source-matrix and original-gamma product topologies against their pre-scope values, and rechecks the literal full native plane `E_rs - E_sr` in the canonical `so SpaceIndex ℝ` carrier. A joint control checks the same exact source curve has native-plane matrix velocity under F10BR and canonical LieHom-image velocity under F10BC/F10BK. No extra source half factor or replacement input plane is used.

The workflow combines the accepted F10BR ancestry pins with F10BK/F10BB/F10AV and the exact native-plane carrier/matrix-unit pins. It rebuilds the F10BR and F10BK closures together once, freshly compiles the candidate and independent audit with warnings-as-errors, and requires exactly two permitted root reports per log. The source/audit time caps and whitelist are unchanged.

**Validation state:** local source/audit hashes, declaration inventory/scope guards, YAML, shell syntax and embedded Python checks pass. These are static checks; no local Lean executable is installed. Zero F10BS proofs are qualified before terminal strict success and output review. No new axiom, admission, global instance, linter suppression or limit increase is introduced.

**Scientific ceiling:** these are ordinary derivatives of underlying matrix curves. The joint comparison does not identify a full source manifold tangent space, construct source or target Lie-group charts, prove global smoothness, establish determinant one for F10BR, classify a kernel/covering, or prove the full F10BC manifold differential equality.

**Next action:** inspect F10BS's strict result. If accepted, consolidate the source-side and gamma-side coordinate-curve differential data into a source-exact chart/tangent work plan. Formulate the actual missing geometric construction and its prerequisites; keep the new determinant-one obligation separately tracked. A topological group, a family of differentiable coordinate curves and an algebraic homomorphism do not by themselves supply a Lie-group atlas or full tangent identification.

## F10BS accepted — whole original-nine matrix curve velocity

**Verified strict result:** [run 41560403653](https://github.com/etblink/math/actions/runs/41560403653), tested commit `100347bf0cfadb49083802eaaf823cefca36f502`, job `125669384994`, completed/success with every required step successful. The terminal classifier is `V10H_F10BS_WHOLE_NINE_MATRIX_NATIVE_PLANE_VELOCITY_TYPES_AXIOMS_PASS`. Both the fresh source compiler and independent audit report exactly the two expected qualified roots, with axioms contained in `{propext, Classical.choice, Quot.sound}` and no `sorryAx`.

Source blob `d06ba831accab10dc09b6f150a7b0c0d9a7a4072`; independent audit blob `fde386d80e3a219dbc696bb20bc3617f6370b244`; workflow blob `69633358de4a9591ed42588efd79cafcb5532082`. Evidence artifact `13197500439`, ZIP SHA-256 `360499b0396a1bf08167c99bac191d2834718f4ca42f5c0bcf5afd214f795d02`.

**Qualified increment:** for every distinct original-nine coordinate pair, the actual F10BR orthogonal action evaluated on the actual source plane curve has entrywise and whole-matrix ordinary derivative equal to the literal full native plane `coordinatePlane9 r s = E_rs - E_sr`. The joint audit also checks the same curve's accepted original-gamma velocity is the F10BB canonical LieHom image of that native plane. This adds no source half factor. These are ordinary vector-space derivatives; the source/target subgroup charts, full tangent identifications and manifold differential equality remain open.

The requested consolidation is now the [source Spin(9) chart/tangent work plan](FCP_K1D18_SOURCE_SPIN9_CHART_TANGENT_WORK_PLAN_2026_11_02.md). Its pinned Mathlib census distinguishes the complete-normed-algebra unit-group construction from the proper-subgroup chart problem. Algebraic subgroup closure is not a proof of topological closedness. It explicitly tracks the missing local fiber/kernel control in a prospective source chart, and keeps natural nine-dimensional determinant one separate from the accepted original-gamma determinant result.

## F10BT candidate — actual PBW bilinear multiplication and ambient smoothness

**Candidate only; no F10BT qualification yet.** The next bounded mathematical dependency is actual ambient Clifford multiplication under the unchanged accepted named PBW norm. The candidate imports accepted F10BF, bundles left multiplication using `Algebra.lmul` and finite-dimensional continuity, then bundles its linear dependence on the left factor.

Files:

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BTPBWBilinearMultiplicationSmoothness.lean`, blob `ce1e9f1c965109b0c8804c0a0c2d6ac67e9b3532`.
- Independent audit: `lean/diagnostics/FCP_K1D18V10HF10BTIndependentAudit.lean`, blob `3a10cead83dc2ea4dcf1bdca00abaaef1e7761e4`.
- Strict workflow: `.github/workflows/bfss-kotler-v10h-f10bt-pbw-bilinear-multiplication-smoothness-strict.yml`.
- Frozen planning baseline: `contributions/bfss-kotler/FCP_K1D18_SOURCE_SPIN9_CHART_TANGENT_WORK_PLAN_2026_11_02.md`. This handoff remains the qualification ledger.

The exact four candidate declarations are:

| Declaration | Obligation |
|---|---|
| `source9CliffordLeftMulCLM` | Continuous linear map of actual left multiplication in the accepted PBW vector space. |
| `source9CliffordMulCLM` | Curried continuous bilinear map of actual multiplication. |
| `source9CliffordMulCLM_apply` | Literal evaluation equals `a * b`, by reflexivity. |
| `source9Clifford_mul_contDiff_pbw` | Actual ambient product is `ContDiff ℝ n` for every `n : ℕ∞ω`. |

The independent audit reconstructs the PBW coordinates and induced norm from the actual source basis, checks exact map types and multiplication values, checks a bounded-bilinear certificate for the literal product, and restates every-order smoothness. It prints all four roots independently. No `NormedRing` instance, constant-one submultiplicative estimate, altered norm, carrier substitution or new global instance is introduced. A continuous bilinear map provides some finite bound; it does not assert the chosen PBW norm has multiplication bound one.

The workflow pins Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, actual source/gamma, PBW basis, accepted BE/BF and BF audit, plus exact candidate source/audit blobs. It restores pinned dependencies, rebuilds accepted F10BF ancestry, freshly compiles F10BT with warnings-as-errors and checks the independent audit with the unchanged root-axiom whitelist. Compiler/audit time caps remain 840/600 seconds. The terminal marker is `V10H_F10BT_EXACT_PBW_BILINEAR_MULTIPLICATION_SMOOTHNESS_TYPES_AXIOMS_PASS`.

**Validation state:** local hashes, declaration/scope preflight, YAML parsing, shell syntax and embedded Python syntax pass. No local Lean executable is installed; Lean elaboration and the independent mathematical checks are pending strict CI. All earlier red history, including both F10BR audit failures, remains preserved.

**Scientific ceiling and next action:** if accepted, use the ambient multiplication calculus toward smooth finite products of actual coordinate-plane curves and ambient polynomial conjugation. Completeness and any operator-algebra embedding remain separate obligations. F10BT supplies no Spin/orthogonal atlas, smooth subgroup inversion, source tangent identification, covering/kernel result, natural-action determinant-one theorem or full F10BC manifold differential equality. Inspect the exact strict result before qualifying any of the four roots, then select the next bounded prerequisite from the work plan.

## F10BT red diagnosis and bounded notation-scope repair

**Rejected strict attempt:** [run 41571102917](https://github.com/etblink/math/actions/runs/41571102917), exact tested commit `31e08e28a8456e694f4f336b7a9ee2e43539912f`, job `125703928754`, completed/failure. Pins, dependency restoration and accepted F10BF ancestry rebuild passed. Fresh F10BT warnings-as-errors compilation failed; the independent audit was skipped. Evidence artifact `13202061220`, ZIP SHA-256 `90562dd3e80ecb9dd019f508e7e38dfc0956cb92cc1f889599ee1a554be3ad5c`.

**Exact failure:** source line 69, column 48, `unexpected identifier; expected ')'`, at the order binder `(n : ℕ∞ω)`. The file imports the calculus theorem but omits `open scoped ContDiff`. Pinned Mathlib `Analysis/Calculus/ContDiff/Defs.lean` explicitly documents `ℕ∞ω`, `∞` and `ω` as scoped in `ContDiff`; `ContDiff/Basic.lean` itself opens that scope before the same kind of binder.

The other three candidate declarations produced root reports using only the standard three permitted axioms. The malformed smoothness declaration's “does not depend on any axioms” report is not acceptance evidence: its statement did not parse and the compiler exited 1. Zero F10BT roots are qualified from this failed gate.

**Repair:** add `open scoped ContDiff` to both source and independent audit. Imported files' local scope openings do not replace the consumer audit's own opening. No proof term, proposition, norm, typeclass construction, carrier or theorem inventory is changed. Update the two exact blob pins and require the scope opening in both files in the preflight.

| Repaired file | Exact candidate blob |
|---|---|
| F10BT source | `0d734b95f044a574490df1597118dbdc5d4ac0f6` |
| F10BT independent audit | `7fd6812e2e5ee4bdfa5b56422a9905c5611e6bd3` |

**Method lesson:** when reusing a theorem involving scoped notation, inspect both its declaration and surrounding `open scoped` commands. Static declaration inventories and shell/Python checks do not establish Lean parser acceptance. Keep terminal compiler status and independent audit mandatory even when a root printout appears harmless.

**Validation/next action:** local candidate hash, declaration/scope preflight, YAML, shell syntax and embedded Python checks must pass before publication. No local Lean executable is installed. Run the unchanged fresh strict compiler and independent PBW/type/axiom audit; all four roots remain pending. Existing 840/600-second compiler/audit caps, warning strictness and axiom whitelist are retained. All earlier accepted checkpoints and red histories are preserved.

## F10BT accepted — exact PBW bilinear multiplication and every-order ambient smoothness

**Verified strict result:** [run 41572318768](https://github.com/etblink/math/actions/runs/41572318768), tested commit `2a0e4932c7ecfc0ca8b2e637b9088eb462acd47d`, job `125707834552`, completed/success with every required step successful. The actual terminal marker is `V10H_F10BT_EXACT_PBW_BILINEAR_MULTIPLICATION_SMOOTHNESS_TYPES_AXIOMS_PASS`. Fresh source compilation and the independent reconstructed-PBW audit each produced exactly the four expected root reports; all eight reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level compiler warning/error occurred in the fresh source/audit phases.

Accepted source blob `0d734b95f044a574490df1597118dbdc5d4ac0f6`; independent audit blob `7fd6812e2e5ee4bdfa5b56422a9905c5611e6bd3`; workflow blob `ae4c521f434dd5f58ed82a3bcd15b2a4d9f76812`. Evidence artifact `13202078533`, ZIP SHA-256 `3e581af3295437db24bc0c84f2330abe997fa61adc4f67e6113755cb3a7253fb`.

**Qualified increment:** the actual Clifford product is the accepted curried continuous bilinear map and its literal uncurried multiplication is `ContDiff ℝ n` for every `n : ℕ∞ω`, under the unchanged named PBW norm. This includes the smooth order; no constant-one submultiplicative norm estimate or `NormedRing` instance was needed or proved. No subgroup atlas, smooth subgroup inversion or tangent identification follows from this ambient theorem alone.

**Success/failure lesson:** the first attempt failed at the scoped `ℕ∞ω` binder. Opening `ContDiff` separately in both consumers fixed that parser prerequisite; the proof terms and propositions were unchanged. The fresh strict compiler and independent audit are what now qualify the four roots. Retain red run 41571102917 and its misleading malformed-root empty axiom printout as evidence that root reports never override compiler failure.

## F10BU candidate — jointly smooth ambient extension of the actual nine-vector action

**Candidate only; zero F10BU roots qualified before strict success.** Use accepted F10BT multiplication, F10BG reversal/inverse identity and F10BO canonical projection. The expression
`(a,z) ↦ source9CliffordVectorProjection (a * ι(z) * reverse(a))`
is defined on the entire actual Clifford algebra times the original nine-vector space. On an actual source Spin element it must equal the already accepted `source9SpinVectorConjugation` exactly.

| Candidate declaration | Exact obligation |
|---|---|
| `source9CliffordReverseCLM` | Continuously bundle actual real-linear grade reversal under the named PBW norm. |
| `source9VectorEmbeddingCLM` | Continuously bundle the actual source-nine Clifford embedding with its standard Pi-domain norm. |
| `source9VectorProjectionCLM` | Continuously bundle the accepted canonical vector projection. |
| `source9AmbientVectorConjugation` | Literal ambient polynomial formula on all Clifford elements and nine-vectors. |
| `source9AmbientVectorConjugation_eq_spin` | Exact equality with actual source Spin vector conjugation, using accepted inverse = reversal. |
| `source9AmbientVectorConjugation_contDiff_pbw` | Joint every-order `ContDiff` in both inputs, by the pinned composition/product API and accepted F10BT. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BUAmbientVectorActionSmoothness.lean`, candidate blob `08f716184dd87a1cb724fad2ad8455b69909c340`.
- `lean/diagnostics/FCP_K1D18V10HF10BUIndependentAudit.lean`, independent audit blob `7a8e3f09d3a799d49ca5c3fa2060abe957ef7628`.
- `.github/workflows/bfss-kotler-v10h-f10bu-ambient-vector-action-smoothness-strict.yml`.

The independent audit reconstructs the exact accepted PBW coordinates/norm, checks the three complete continuous-linear-map types and literal values, restates the ambient polynomial definition by reflexivity, checks its equality with both the accepted action and actual inverse-coercion formula, and restates joint smoothness both with and without the ambient wrapper. It prints all six roots. The `ContDiff` scope is opened explicitly in each file.

**Pinned primary API inspected:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `ContDiff/Comp.lean` explicitly imports `Basic`, supplies `ContDiff.comp`, `comp₂`, `contDiff_fst` and `contDiff_snd`; `Basic.lean` supplies smoothness of continuous linear maps. Clifford grade reversal is the actual real-linear map from `CliffordAlgebra/Conjugation.lean`. The source explicitly imports F10BG for its accepted inverse/reversal and continuity roots.

**Workflow/validation:** retain Lean 4.34.1, exact Mathlib revision, source/PBW/BE/BF pins, accepted F10BG/F10BO/F10BT source pins and relevant independent audits. Rebuild BT/BO/BG ancestry together, freshly compile the six-root source and independent audit with warnings-as-errors, and enforce exactly six permitted root reports per log. Compiler/audit caps remain 840/600 seconds; no limit increase or linter suppression. Local exact candidate hashes, source/audit preflight, YAML parsing, shell syntax and embedded Python syntax pass. Local Lean is unavailable, so elaboration and all independent mathematical checks remain pending CI.

**Scientific ceiling/next action:** this candidate is ambient vector-space calculus. It constructs no source/target subgroup chart, LieGroup instance, full tangent equivalence, natural-action determinant-one theorem, kernel/covering result or F10BC manifold differential equality. If accepted, this joint ambient formula can support smooth multivariable products of the actual plane curves and their action coordinates. Inspect the exact strict result first, then select that bounded parameterization prerequisite from the existing chart/tangent work plan.

## F10BU red diagnosis — generated local-instance names collide across accepted branches

**Rejected attempt:** [run 41573878864](https://github.com/etblink/math/actions/runs/41573878864), exact commit `6721dc727a30eeee8d3e01876147237d1a8a6be9`, job `125712816232`, completed/failure. Exact pins, dependency restoration and the separate BT/BO/BG ancestry build all passed. Fresh BU compilation failed at import line 1; the independent BU audit was skipped. Evidence artifact `13203540564`, ZIP SHA-256 `78fca38726393eb9a549558c0d1aa42616f5fdcb5f16914d179323ea3f7cb3f3`.

**Exact diagnostic:** import of F10BJ failed because the environment already contained
`FCP.BFSSPairedSpin9Clifford.instNormedAddCommGroupCliffordAlgebraRealForallSpaceIndexSource9Quadratic`
from F10BF. BF and BJ had each compiled an anonymous `local instance` of the same class/type in the same namespace on independent branches of the import graph. Their separate `.olean` files succeeded. Loading them together encountered duplicate declaration names, before BU's own declarations or proofs were elaborated. This is an import-composition failure, not a failed smoothness proof or a contradiction of the qualified mathematics.

**Bounded structural repair:** name the local-instance declarations explicitly and uniquely in BF, BG, BT and the pending BU file:

- BF: `f10bfLocalNormedAddCommGroup`, `f10bfLocalNormedSpace`, `f10bfLocalFiniteDimensional`, `f10bfLocalIsModuleTopology`.
- BG: `f10bgLocalNormedAddCommGroup`, `f10bgLocalNormedSpace`, `f10bgLocalFiniteDimensional`.
- BT: `f10btLocalNormedAddCommGroup`, `f10btLocalNormedSpace`, `f10btLocalFiniteDimensional`.
- BU: `f10buLocalNormedAddCommGroup`, `f10buLocalNormedSpace`, `f10buLocalFiniteDimensional`.

The directly observed collision is BF versus BJ. Naming all local instances on the BF/BG/BT branch prevents the same generated-name hazard when the rest of the BO branch is loaded; BU uses the same convention for future composition. The shared BE ancestor and the BJ/BM/BN/BO branch are unchanged.

A source normalization check removes only those new explicit identifiers and recovers each exact pre-repair file byte-for-byte. Thus no instance type, value, registration scope, proof term, theorem statement, mathematical carrier, norm or topology is changed. These remain `local instance` declarations, with no new global instance registration. All four independent audits are unchanged.

| Repaired source variant | Exact candidate blob |
|---|---|
| F10BF | `f7ea4c9e9d996d04d07a7733ffe7ab6a91ce2636` |
| F10BG | `9092ccaa5b4436bfa25cafe8b71541e6642999f6` |
| F10BT | `10c56519331f867d5f453a63953e0018c03a09a3` |
| F10BU | `aa38de95852718445ddd0448068592f9cefe4db4` |

**Requalification:** the accepted mathematics remains tied to its earlier exact tested commits. The renamed source variants require fresh evidence. Refresh only the relevant exact source pins in each of the existing BF/BG/BT strict workflows and the BU workflow. Keep their existing theorem inventories, fresh warnings-as-errors compilation, independent audits, axiom whitelists and time caps. New static guards require the explicit stage-specific local-instance names; the existing BF/BG forbidden-instance guard now handles named declarations too.

The atomic repair triggers four strict workflows. Require BF's 3 roots, BG's 5 roots and BT's 4 roots to pass their respective original independent audits at the new commit, and BU's 6 roots to pass its combined import, exact PBW joint-smoothness and actual-action audit. BU's independent audit remains blob `7a8e3f09d3a799d49ca5c3fa2060abe957ef7628`. Do not qualify BU or report all renamed variants requalified from only one of the four runs.

**Validation state:** all four YAML files parse, all shell blocks pass `bash -n`, embedded Python parses, and each exact source/audit preflight passes. The only source differences are the explicit local-instance identifiers. Local Lean is unavailable; actual import compatibility, elaboration and independent audits await strict CI.

**Method lesson:** a local typeclass registration still has a declaration in the compiled environment. Anonymous generated names can collide across separately accepted branches in a shared namespace. Separate ancestor builds do not establish that their environments compose. Use unique explicit names for local instances in reusable modules, and require a consumer that imports the branches together.

**Scientific ceiling:** no new BU mathematical result is qualified from this red attempt. The proposed joint ambient extension remains the same candidate and still supplies no source/target subgroup atlas, tangent identification, kernel/covering or full manifold differential. Next action is to inspect all four exact-commit strict results before proceeding.

## F10BU accepted and BF/BG/BT renamed variants requalified together

**Common exact tested commit:** `1429369557b52487c8d5b02831144852233a9407`. All four runs below are completed/success, and all required fresh compiler and independent audit steps passed. This verifies both the renamed ancestors and their combined consumer; the previous independent ancestor build alone had not established import compatibility.

| Gate | Strict run | Job | Evidence artifact | Artifact ZIP SHA-256 |
|---|---|---|---|---|
| F10BU | [41575250552](https://github.com/etblink/math/actions/runs/41575250552) | `125717122102` | `13203553085` | `51cf007b8c154bc8b40786e046a96ebbc9f00c9fbf59351359709e268f545b7e` |
| F10BF | [41575250674](https://github.com/etblink/math/actions/runs/41575250674) | `125717122921` | `13203767632` | `4b1ae55e92b7cbba5435a4576706361d418a401a0e255c005fdb528fe5d106f4` |
| F10BG | [41575250610](https://github.com/etblink/math/actions/runs/41575250610) | `125717122195` | `13203388396` | `cd2d89e83175e97e063684ebdc35a3475245d99211700d0531a1a556828d4f8c` |
| F10BT | [41575250675](https://github.com/etblink/math/actions/runs/41575250675) | `125717122543` | `13202559882` | `ea0dba077b4051e9b791e4ee0d93b728424562754c427f9fab2a86e9436d0f57` |

Actual terminal classifiers reviewed:

- `V10H_F10BU_EXACT_PBW_JOINT_AMBIENT_VECTOR_ACTION_SMOOTHNESS_TYPES_AXIOMS_PASS`.
- `V10H_F10BF_EXACT_PBW_AMBIENT_RING_TYPES_AXIOMS_PASS`.
- `V10H_F10BG_EXACT_PBW_SOURCE_SPIN_GROUP_TYPES_AXIOMS_PASS`.
- `V10H_F10BT_EXACT_PBW_BILINEAR_MULTIPLICATION_SMOOTHNESS_TYPES_AXIOMS_PASS`.

Each fresh source/audit pair has exactly its expected roots: BF 3, BG 5, BT 4, BU 6; 36 permitted root reports across the eight phases. Every report's axioms are contained in `{propext, Classical.choice, Quot.sound}`. No `sorryAx` or source-level warning/error occurs in those terminal compiler/audit phases.

Accepted source variants are BF `f7ea4c9e9d996d04d07a7733ffe7ab6a91ce2636`, BG `9092ccaa5b4436bfa25cafe8b71541e6642999f6`, BT `10c56519331f867d5f453a63953e0018c03a09a3` and BU `aa38de95852718445ddd0448068592f9cefe4db4`. Their workflows are BF `581c0820bac70164529f6ad83e9f8f91f347f3f5`, BG `e6f72121057c5caa69ee655e0333a853aff25bf8`, BT `517bc2bced67edbfa2fa6462142020a1b1688dd6` and BU `2867e15663deeefe6d5f055689ce8a7becfe2536`. BU's unchanged independent audit is `7a8e3f09d3a799d49ca5c3fa2060abe957ef7628`.

**New qualified mathematical scope:** the actual maps reversal, vector embedding and canonical projection are continuously bundled for the accepted PBW/Pi norms. The literal ambient formula
`(a,z) ↦ source9CliffordVectorProjection (a * ι(z) * reverse(a))`
is jointly `ContDiff ℝ n` for every order, and on the actual source Spin group it equals accepted `source9SpinVectorConjugation`. The independent audit checks this restriction against the actual inverse-coercion expression as well as the accepted action wrapper.

**Qualified structural lesson:** explicit stage-specific local-instance names let the BF/BG/BT branch compose with the unchanged BJ/BM/BN/BO branch. The source changes were identifier-only and all original audits passed. Keep the failed BU run 41573878864 as evidence that separate successful builds do not prove joint importability. New reusable modules should use unique explicit local-instance names and a combined consumer gate.

This remains ambient calculus. It does not install a subgroup manifold or prove a full tangent equivalence, determinant, kernel/covering or global manifold differential.

## F10BV candidate — smooth finite ordered actual source plane words

**Candidate only; six declaration roots pending.** Build the actual parameterized source word needed for the chart plan. Each factor is the accepted `source9PlaneSpinCurve`, retaining its explicit distinct-label proof and positive half-angle normalization. Parameters are `Fin k → ℝ`; an arbitrary `List (Fin k)` fixes multiplication order and allows repeated parameter indices. This avoids a commutative product on a noncommutative group.

| Candidate declaration | Exact obligation |
|---|---|
| `source9PlaneSpinCurve_coe_contDiff_pbw` | Every-order smoothness of the entire actual source curve after coercion into the accepted PBW Clifford space, using its accepted sine/cosine formula. |
| `source9PlaneSpinWord` | Recursive ordered product taking values in actual `spinGroup source9Quadratic`. |
| `source9PlaneSpinWord_eq_listProd` | Equality with the literal list product in that group. |
| `source9PlaneSpinWord_zero` | At the all-zero parameter vector, every ordered word equals the actual group identity. |
| `source9PlaneSpinWord_coe_contDiff_pbw` | Joint every-order smoothness in all finite real parameters of the underlying Clifford-valued word, using accepted BT multiplication. |
| `source9PlaneSpinWord_vectorAction_contDiff_pbw` | Joint every-order smoothness of the actual vector action in both parameters and vector, using accepted BU and an explicit function-equality bridge. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BVFinitePlaneWordSmoothness.lean`, candidate source blob `1c0f3ddfc4fba9e28be411a4fd241e36398095a9`.
- `lean/diagnostics/FCP_K1D18V10HF10BVIndependentAudit.lean`, independent audit blob `54d3a22f75892e7a98d3f0986e3544b57d82a54e`.
- `.github/workflows/bfss-kotler-v10h-f10bv-finite-plane-word-smoothness-strict.yml`.

The independent audit reconstructs the exact accepted PBW coordinates/norm, restates all six complete interfaces, checks empty words and an explicit two-factor order control in the actual group, checks the zero parameter, and restates the actual vector-action smoothness using the literal group-inverse coercion formula. Source local instances have unique `f10bvLocal...` names; each file explicitly opens `ContDiff`.

**Pinned API reused:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Trigonometric/Deriv.lean` supplies real sine/cosine smoothness; `ContDiff/Operations.lean` supplies addition, scalar-constant multiplication, scalar division and `contDiff_apply ℝ ℝ i`; `ContDiff/Comp.lean` supplies composition/products. Scalar multiplication uses the real scalar field and normed vector space, with no Clifford `NormedRing` hypothesis. `List.prod_cons` retains the exact ordered group multiplication. No new generic ring-norm calculus is forced.

The workflow pins accepted compatible BF/BG/BT/BU, original source/PBW and plane-curve source/audit blobs; rebuilds combined BU ancestry once; freshly compiles the six-root candidate and independent audit with warnings-as-errors; and enforces exactly six permitted root reports per log. The compiler/audit caps remain 840/600 seconds. Local hashes, declaration/scope preflight, YAML, shell syntax and embedded Python checks pass; no local Lean executable is available. Lean elaboration and independent mathematical checks await strict CI.

**Scientific ceiling and next action:** ordinary smoothness of an actual parameterized word and its actual action does not make the word a chart. The chosen 36-plane order, full derivative and its model-space isomorphism, inverse-function theorem, actual source neighborhood/fiber control, subgroup atlases, tangent Lie-algebra identifications and full F10BC differential remain open. Inspect BV's strict result before qualifying any root. If accepted, qualify a source-exact full derivative of the finite-word action at zero and its canonical native-plane normalization before attempting a local inverse.

## F10BV accepted — smooth finite ordered actual plane words and vector action

**Verified strict result:** [run 41576849333](https://github.com/etblink/math/actions/runs/41576849333), exact tested commit `8bdc6c513439d825b8010f05c97a59c4dcb390b9`, job `125722239464`, completed/success with all required steps successful. The actual terminal marker is `V10H_F10BV_EXACT_ORDERED_ACTUAL_SPIN_WORD_SMOOTHNESS_TYPES_AXIOMS_PASS`. Fresh compilation and independent audit each produced exactly six expected root reports, all using only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or source-level warning/error appears in those phases.

Accepted source blob `1c0f3ddfc4fba9e28be411a4fd241e36398095a9`; audit `54d3a22f75892e7a98d3f0986e3544b57d82a54e`; workflow `1f22e63630f23ee19c15a0e83346e549b6132854`. Evidence artifact `13204551822`, ZIP SHA-256 `9086948c116076a21a1e419fa46f4f58b18800992fb7d571a75e3eb835540955`.

**Qualified increment:** the entire actual source coordinate-plane curve is every-order smooth in the accepted ambient PBW space. For any finite family of distinct source-coordinate pairs, arbitrary ordered list of parameter indices and finite real parameter vector, `source9PlaneSpinWord` lies in the actual source Spin group, equals its literal ordered list product, and is the identity at the zero parameter. Its underlying Clifford-valued map is jointly every-order smooth in all parameters; its actual nine-vector action is jointly every-order smooth in parameters and vector. Empty words, exact two-factor order and the actual inverse-coercion action formula are checked independently.

The proof reuses the qualified half-angle formula, finite-coordinate evaluation, BT multiplication and BU's exact ambient/action equality. Explicit function-equality bridges and unique local-instance names compose successfully. No source/target atlas or local inverse is obtained from these smooth parameterizations.

## F10BW candidate — full ambient finite-word derivative at zero

**Candidate only; six roots await fresh strict compilation and independent audit.** Differentiate the actual Clifford-valued finite-word parameterization at the all-zero vector. The expected value in direction `v : Fin k → ℝ` is the literal listed sum
`Σ_{i in l} v i • ((1/2 : ℝ) • (ι(e_(r i)) * ι(e_(s i))))`.
The list retains repeated indices: each occurrence contributes. This is the source Clifford half-bivector normalization, not the full native nine-matrix plane that appears after the natural action.

| Candidate declaration | Exact obligation |
|---|---|
| `source9PlaneParameterVelocity` | Continuous linear map of one coordinate evaluation into the exact half-bivector, using `toSpanSingleton` and `proj`. |
| `source9PlaneParameterCurve_hasFDerivAt_zero` | Full finite-parameter derivative of an actual distinct-plane factor, from accepted BJ and the chain rule. |
| `source9PlaneSpinWordVelocity` | Recursive sum of those continuous linear maps over the exact word list. |
| `source9PlaneSpinWordVelocity_apply` | Evaluation is the literal finite sum for every direction. |
| `source9PlaneSpinWord_coe_hasFDerivAt_zero` | Actual ambient word has that full Fréchet derivative at zero. |
| `source9PlaneSpinWord_coe_fderiv_zero` | Actual `fderiv` is exactly the independently evaluable linear sum. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BWFinitePlaneWordDerivative.lean`, candidate source blob `d8ec57fa4e6ac8674cfc864ad8219feef37dfec9`.
- `lean/diagnostics/FCP_K1D18V10HF10BWIndependentAudit.lean`, independent audit blob `0d0692e7920f20bc126789ffc767c2d86bf74da3`.
- `.github/workflows/bfss-kotler-v10h-f10bw-finite-plane-word-derivative-strict.yml`.

The linear formula can be defined for arbitrary pairs, but every actual-curve derivative theorem retains `hrs : ∀ i, r i ≠ s i`. No diagonal source curve is introduced. Both source normed instances have unique stage-specific names and are exactly the accepted named PBW values.

The induction uses the actual BT continuous bilinear map and pinned `ContinuousLinearMap.hasFDerivAt_of_bilinear`, with its `precompR`/`precompL` derivative. Explicit zero-value coercion bridges come from accepted curve/word identity theorems. A pointwise equality of continuous linear maps reduces the product derivative at identity to the head-plus-tail velocity. No Clifford `NormedRing` estimate or generic normed-ring product rule is assumed.

**Pinned API inspected:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; `Deriv/Basic.lean` converts `HasDerivAt` to `HasFDerivAt` using `toSpanSingleton`; `FDeriv/Bilinear.lean` supplies the exact bilinear product-rule type; `Operator/Bilinear.lean` supplies its precomposition maps; `FDeriv/Const.lean` takes `hasFDerivAt_const (c) (x)` in that explicit order. The base case follows this inspected signature.

The independent audit reconstructs the accepted PBW coordinates/norm, restates the complete six interfaces, checks literal half-bivector evaluation, empty-list velocity, a repeated-index control, `HasFDerivAt`, the actual `fderiv` equality and its literal finite-sum value in every direction. It prints all six roots.

**Workflow/validation:** pin compatible BF/BG/BT/BU/BV, exact original source/PBW and BI/BJ curve source/audits, plus the candidate blobs. Rebuild combined BV ancestry, freshly compile BW and its independent audit with warnings-as-errors, require exactly six permitted root reports per log, and retain 840/600-second compiler/audit caps. Local exact hashes, source/audit preflight, YAML, shell syntax and embedded Python checks pass. No local Lean executable is available, so elaboration and independent mathematical acceptance remain pending CI.

**Scientific ceiling and next action:** this is a full derivative of an ambient Clifford-valued parameterization. It is not yet the full derivative of the actual nine-vector action, a 36-dimensional model-space isomorphism, a source tangent equivalence, an atlas/local inverse or the full F10BC manifold differential. Inspect BW's exact strict result first. If accepted, transport the derivative through the actual action and recover the full native coordinate-plane sum before selecting a 36-plane order or invoking an inverse-function theorem. Preserve all prior red histories, including the scoped-notation and cross-branch local-instance collisions.

## F10BW red diagnosis and explicit projection-type bridge

**Rejected attempt:** [run 41578446550](https://github.com/etblink/math/actions/runs/41578446550), tested commit `a0ca8ff2095fb030a8a30ad868586bacc24045c6`, job `125727391898`, completed/failure. Pins, pinned dependency restoration and combined BV ancestry rebuild succeeded. Fresh BW compilation failed; the independent audit was skipped. Evidence artifact `13205078298`, ZIP SHA-256 `2904344cb9b5061324f97b38deebeab8aa6b026083d906c70803ce855050ed81`.

Two exact source diagnostics:

1. Line 51, column 20: `Application type mismatch` at `(ContinuousLinearMap.proj i).hasFDerivAt`. The untyped generic projection retained metavariables for the scalar, coordinate family and instances; its inferred product-space presentation did not unify with the expected real normed finite-Pi-domain derivative application. The explicitly typed projection in the velocity definition itself elaborated. This is an elaboration/type bridge failure, not evidence that the chosen topologies are mathematically different.
2. Line 71, column 47: `ContinuousLinearMap.add_apply` is deprecated; the compiler directs consumers to `add_apply`. Warnings-as-errors correctly rejected the alias.

The single-plane derivative root and its dependent full-word `HasFDerivAt` and `fderiv` roots reported `sorryAx` from compiler-error placeholders. Three other root reports contained only the permitted axioms, but the failed terminal compiler and skipped independent audit qualify no BW result. No admission was written into the source.

**Bounded repair:** in the single-plane derivative proof, declare
`P : (Fin k → ℝ) →L[ℝ] ℝ := ContinuousLinearMap.proj i`,
then explicitly prove
`hP : HasFDerivAt (fun t : Fin k → ℝ => t i) P (0 : Fin k → ℝ)`
using `P.hasFDerivAt`. Compose accepted BJ's derivative with this typed bridge. Replace only the deprecated addition alias with the current unqualified `add_apply`. The finite-word induction and its explicit bilinear derivative/identity bridges remain the same.

**Exact repaired source blob:** `6a67d6fb7a1d01f5d0045adb8a6edb3747d0ee70`. Independent audit unchanged: `0d0692e7920f20bc126789ffc767c2d86bf74da3`. All six declaration names, complete proposition statements, source/PBW carriers, norm values and local-instance registrations are unchanged. No new hypothesis, norm bound, global instance, limit increase or linter suppression is introduced.

The workflow updates the candidate source pin, requires the typed `P`/`hP` bridge and current addition lemma, and rejects the deprecated alias. It retains the same fresh warnings-as-errors source/audit compilation, exact six-root reports, three-axiom whitelist and 840/600-second caps.

**Validation/lesson:** local source hash, unchanged audit hash, complete source/audit preflight, YAML parsing, all shell syntax and embedded Python checks pass. No local Lean executable is available, so elaboration and independent acceptance remain pending the next strict run. For generic continuous-linear maps, fix the scalar, domain and codomain before invoking derivative fields; importing a suitable theorem alone need not solve its instance metavariables. Compiler-directed deprecation repairs should use the current lemma while keeping warning strictness intact.

**Next action/scientific ceiling:** rerun the exact repaired six-root gate and inspect source plus independent audit before qualification. BV remains the latest accepted mathematical increment. BW still asserts only the full ambient Clifford-valued parameter derivative at zero; the actual-action derivative, native 36-plane model isomorphism, source/target charts, tangent identifications and full F10BC manifold differential remain open. Preserve this failure alongside the earlier scoped-notation and local-instance composition evidence.

## F10BW second red — clean mathematical source, final independent directional audit repair

**Rejected strict attempt:** [run 41579847679](https://github.com/etblink/math/actions/runs/41579847679), exact commit `40b77e83a4a0a9ef9739e1a49302ed038e055a54`, job `125731852959`, completed/failure. Pins, dependency restoration, combined BV ancestry and fresh BW warnings-as-errors source compilation all passed. The independent audit ran and failed at its final example. Evidence artifact `13206465562`, ZIP SHA-256 `8757033a90761e34439898cd605a8859f6d8cc1e2eb8892af923ddd4a412d655`.

**Verified diagnostic progress:** the explicit real `P`/`hP` bridge and current `add_apply` repair solved both earlier source diagnostics. All six fresh mathematical source roots now report only `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`. This is successful source compilation, not complete BW qualification.

**Remaining failure:** independent audit line 89, column 6, `Tactic rewrite failed: Did not find an occurrence of the pattern`, at
`rw [source9PlaneSpinWord_coe_fderiv_zero, source9PlaneSpinWordVelocity_apply]`.
The final target applies the derivative map to a direction `v`. The generic uninstantiated rewrite did not match that elaborated map application. Earlier audit examples, including direct restatement of the complete map equality, reached the final example without diagnostics. Root printouts from the audit remained clean, but its failed example and nonzero terminal exit prevent acceptance.

**Bounded repair:** keep the complete final directional finite-sum statement. In its proof, first instantiate an explicitly typed `hmap` of the full `fderiv` equality using
`source9PlaneSpinWord_coe_fderiv_zero r s hrs l`.
Apply
`congrArg (fun L : (Fin k → ℝ) →L[ℝ] CliffordAlgebra source9Quadratic => L v) hmap`,
then use equality transitivity with
`source9PlaneSpinWordVelocity_apply r s l v`.
This proves the same literal directional sum without generic rewriting beneath the continuous-linear-map coercion.

**Source unchanged:** blob `6a67d6fb7a1d01f5d0045adb8a6edb3747d0ee70`. **Repaired audit:** blob `26d4bc3768986a3d5ec9bb44484ba818085f57f6`. All theorem statements, audit examples, six root names, norms, actual source carrier and finite-word definition are unchanged. The workflow refreshes only the audit pin and the proof-shape guard for the typed map/evaluation bridge. Fresh source and audit compilation, warnings-as-errors, axiom whitelist, root counts and 840/600-second caps are retained.

**Validation/lesson:** local hashes, YAML parsing, shell syntax, embedded Python and exact source/audit preflight pass. No local Lean executable is available; complete acceptance awaits fresh CI. For an equality of bundled maps applied to a direction, instantiate all theorem parameters and use typed evaluation congruence when generic rewriting cannot match the elaborated target. A clean imported-root axiom inventory does not certify failed independent examples; terminal audit success remains mandatory.

**Next action and ceiling:** inspect both phases of the next exact-commit strict run before BW qualification. The successful source proof covers the full ambient Clifford-valued word derivative at zero. Its independent acceptance is still pending; the actual-action derivative, native model isomorphism, source/target subgroup charts, tangent identifications and full F10BC manifold differential remain open. Preserve both BW red attempts and their distinct source-versus-audit failure boundaries.

## F10BW accepted — full ambient finite-word derivative and directional finite sum

**Verified strict result:** [run 41581121118](https://github.com/etblink/math/actions/runs/41581121118), exact tested commit `f16060f061dc84815f13a78bfb4e2354f9c4b066`, job `125735946133`, completed/success with every required step successful. Actual terminal marker: `V10H_F10BW_EXACT_PBW_FULL_WORD_DERIVATIVE_TYPES_AXIOMS_PASS`. Fresh source compilation and the independent PBW/type/value audit each report exactly six expected roots, all with axioms contained in `{propext, Classical.choice, Quot.sound}`. No `sorryAx` or source-level warning/error occurs in those phases.

Accepted source blob `6a67d6fb7a1d01f5d0045adb8a6edb3747d0ee70`; independent audit `26d4bc3768986a3d5ec9bb44484ba818085f57f6`; workflow `3c150f9875585796b707180244727990b50ecac8`. Evidence artifact `13206048636`, ZIP SHA-256 `21bcf7ae2c930c34030833dbe00f770ae5bcc39a6b01253a319d29f7df059fca`.

**Qualified increment:** the actual Clifford-valued finite ordered source word has full Fréchet derivative at the all-zero parameter vector equal to `source9PlaneSpinWordVelocity`. Its value in every direction is the listed sum of coordinate coefficients times the exact positive source half-bivectors. Every actual-curve derivative retains the distinct-label proof. Repeated indices contribute repeatedly, and the empty word has zero derivative.

The accepted proof uses a typed real coordinate projection and derivative bridge, the actual continuous bilinear Clifford multiplication, explicit curve/word identity values, and pointwise continuous-linear-map equalities. The independent directional check instantiates the full derivative equality and applies typed evaluation congruence before transitivity with the literal finite sum. Both BW red attempts remain preserved: source elaboration/deprecation first, final independent audit rewrite second. Clean root printouts alone did not bypass either terminal failure.

This is an ordinary derivative into the ambient Clifford vector space. The full derivative of the actual nine-vector action and its native model-space identification remain separate.

## F10BX candidate — native vector commutator transport of the actual full word derivative

**Candidate only; six roots pending strict CI.** First make the algebraic transport explicit using qualified BL and BW. The commutator of the full source half-bivector sum with an embedded original vector must equal the embedding of the full native-plane action sum. The canonical projection must recover that sum. Finally, tie this identity to the literal actual-word `fderiv` at zero, with explicit map/value congruences.

| Candidate declaration | Exact obligation |
|---|---|
| `source9PlaneParameterVectorVelocity` | Coordinate evaluation times the literal full native plane `coordinatePlane9 r s` applied to the original vector. |
| `source9PlaneWordVectorVelocity` | Recursive continuous-linear sum of those full native-plane maps over the exact list. |
| `source9PlaneWordVectorVelocity_apply` | Literal full native-plane finite sum for every direction, retaining repetitions. |
| `source9PlaneSpinWordVelocity_commutator_vector` | BW's source velocity commutator equals the Clifford embedding of that native vector sum. |
| `source9PlaneSpinWordVelocity_projected_commutator` | Accepted canonical vector projection recovers exactly that sum. |
| `source9PlaneSpinWord_fderiv_projected_commutator` | The projected commutator of the literal actual-word `fderiv` applied to any direction equals the same native vector sum. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BXWordDerivativeNativeVectorAction.lean`, candidate source blob `bbf201b5af11213eacef21fe6ec41947635cc781`.
- `lean/diagnostics/FCP_K1D18V10HF10BXIndependentAudit.lean`, independent audit blob `30d42b22ebadafb09c2b0c65db839af71ccf4ba7`.
- `.github/workflows/bfss-kotler-v10h-f10bx-word-derivative-native-vector-action-strict.yml`.

The induction reuses `source9CoordinateBivector_commutator_vector` for each weighted source half-bivector and real-linearity of the actual Clifford embedding. Source half factors are retained inside BW's velocity; BL's commutator identity produces full native planes without an extra half. The new algebraic identities can include diagonal labels as BL already does. Every connection to an actual curve/word `fderiv` retains `hrs : ∀ i, r i ≠ s i`; no diagonal actual source curve is introduced.

The source explicitly uses typed `hmap`/`hvalue` bridges and evaluation congruences when specializing the actual derivative. Its norm values remain exactly the named PBW structures, with unique `f10bxLocal...` local-instance names. No new global instance, norm, hypothesis or limit change is introduced.

**Independent controls:** reconstruct the accepted PBW coordinates/norm; restate all six complete interfaces; check the literal full `coordinatePlane9 = E_rs - E_sr` matrix-unit equality; check exact coordinate-map evaluation, empty velocity and repeated-index contributions; and finish with the projected commutator of the literal actual `fderiv` equal to the literal full native-plane finite sum. The final check uses explicitly instantiated equalities and transitivity. Six root reports are required in each phase.

**Pinned reuse:** accepted BW and BL, the actual source/PBW basis and compatible BF/BG/BT/BU/BV chain, and the exact native-plane carrier/matrix-unit bridge. Primary native-plane files at the baseline were checked: carrier blob `92a26e8380abe9c1f9bdf011d27b8e97b4e17ef3`, matrix-unit bridge `d80001bbe5052357dbca559232d81cc01c56fb34`. BL source/audit remain `bc0d8539c2523fffe2f36ee4b121a1b81a1431be`/`1900ee7fa3f95d025dd3a2e210f2fa63d9c659d1`.

**Workflow/validation:** rebuild combined BW ancestry, freshly compile BX and its independent audit with warnings-as-errors, require the exact six roots and standard three-axiom whitelist, and keep the existing 840/600-second compiler/audit caps. Local hashes, full declaration/scope preflight, YAML, shell syntax and embedded Python checks pass. Local Lean is unavailable; elaboration and independent mathematical acceptance remain pending CI.

**Scientific ceiling/next action:** algebraic commutator transport of the actual word derivative is not yet `HasFDerivAt` for the actual vector-action parameterization. If BX is accepted, differentiate that actual action using the qualified ambient multiplication/reversal/projection formula, and connect its full derivative to the now-checked native sum. A chosen 36-plane model isomorphism, source neighborhood/fiber control, subgroup charts, tangent Lie-algebra identifications and full F10BC manifold differential remain open. Inspect BX's exact strict result before qualifying any root.

## F10BX accepted — full native-plane algebraic transport of the actual word derivative

**Verified strict result:** [run 41582840775](https://github.com/etblink/math/actions/runs/41582840775), tested commit `7f42df60823ba77e82ca7db0494eb9c07ec98e39`, job `125741378052`, completed/success with all required steps successful. Actual terminal marker `V10H_F10BX_ACTUAL_WORD_DERIVATIVE_FULL_NATIVE_PLANE_TRANSPORT_TYPES_AXIOMS_PASS`. Fresh source compilation and independent audit each report exactly six expected roots, using only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or source-level warning/error occurs in those phases.

Accepted source blob `bbf201b5af11213eacef21fe6ec41947635cc781`; audit `30d42b22ebadafb09c2b0c65db839af71ccf4ba7`; workflow `e31b731af063be5c633f24191a03dbae5ca60e25`. Evidence artifact `13207745464`, ZIP SHA-256 `4a9c5f611f2f6c156d7c91069d977ce189e4cc2c462acba72f139ac05c534ab8`.

**Qualified scope:** source half-bivector commutation on an embedded original nine-vector yields the embedding of the full native-plane finite sum. The accepted canonical projection recovers that sum. The final equality uses the literal full actual-word `fderiv` applied to any direction. Repeated indices are retained; the audit checks the literal `E_rs - E_sr` plane. Typed map/value congruences and explicit equality transitivity pass independently.

This accepted increment is algebraic transport of the ordinary ambient derivative. The `HasFDerivAt` assertion for the actual vector-action parameterization is the next separate obligation.

## F10BY candidate — actual finite-word conjugation and vector-action derivative

**Candidate only; six theorem roots pending strict CI.** For a fixed original vector `z`, differentiate the actual source-word action with respect to every finite real parameter at the all-zero vector. Use the actual source inverse and its qualified reversal identity; preserve the PBW norm and standard original-vector Pi norm.

| Candidate theorem | Exact obligation |
|---|---|
| `source9CoordinateHalfBivector_reverse` | Reversal negates an actual distinct-coordinate source half-bivector. |
| `source9PlaneSpinWordVelocity_reverse` | Reversal negates the full source-word velocity in every direction, with distinctness retained. |
| `source9PlaneSpinWord_conjugation_hasFDerivAt_zero` | Actual Clifford conjugation by the actual word has full derivative equal to the commutator linear map composed with BW's word velocity. |
| `source9PlaneSpinWord_vectorAction_hasFDerivAt_zero` | Actual nine-vector action has full parameter derivative `source9PlaneWordVectorVelocity` at zero for every fixed vector. |
| `source9PlaneSpinWord_vectorAction_fderiv_zero` | The actual vector-action `fderiv` is exactly that full native-plane linear map. |
| `source9PlaneSpinWord_vectorAction_fderiv_zero_apply` | In every direction, the actual action derivative is the literal list sum of full native-plane vector actions. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BYActualWordVectorActionDerivative.lean`, candidate source blob `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`.
- `lean/diagnostics/FCP_K1D18V10HF10BYIndependentAudit.lean`, independent audit blob `0aa936caf290e1761082e0259e8bdb2033d6208b`.
- `.github/workflows/bfss-kotler-v10h-f10by-actual-word-vector-action-derivative-strict.yml`.

**Proof route:** pinned grade reversal is a real-linear map with `reverse.map_mul`, `reverse_ι` and `reverse.map_one`. Accepted BM's actual distinct-coordinate anticommutation supplies the half-bivector reversal sign. Extend that sign to the full word velocity by linearity.

Let `W` be the actual Clifford-valued word, `H` its accepted full derivative, and `L` right multiplication by `ι(z)` bundled with the accepted BT bilinear map's flip. Differentiate `L(W(t)) * reverse(W(t))` with the actual continuous bilinear product rule. Explicit value-at-zero and pointwise linear-map bridges reduce its derivative to `h ↦ h*ι(z) - ι(z)*h` composed with `H`. An explicit function equality replaces reversal by the actual group-inverse coercion. Then compose the accepted continuous projection, use BX's full native commutator identity, and bridge to the actual `source9SpinVectorConjugation` definition. The final directional equality uses an instantiated map equality and typed evaluation congruence.

**Independent audit:** reconstruct the actual PBW coordinates/norm; restate all six complete theorem types; independently evaluate the bundled Clifford derivative as the literal commutator by reflexivity; check the actual inverse-coercion conjugation formula and its projected vector action without the wrapper; check `HasFDerivAt`, exact `fderiv`, and literal full native-plane directional sum; recheck the matrix-unit plane normalization. Six root reports are required per phase. Source local instances have unique explicit stage-specific names.

**Pinned reuse and validation:** actual source/Clifford/PBW, compatible BF/BG/BT/BU/BV/BW/BX chain, BL native transport and carrier/matrix-unit bridge, BM anticommutation and its independent audit, and qualified BG inverse/reversal. Mathlib remains `d13f23b723b8a846827a245b89c10fc7d3f11612`; `CliffordAlgebra/Conjugation.lean` was inspected for the exact protected reversal API. No `NormedRing` estimate or instance is required. The workflow rebuilds combined BX ancestry, freshly compiles source and audit with warnings-as-errors, enforces the same three-axiom whitelist and six roots, and retains 840/600-second compiler/audit caps. Local hashes, source/audit preflight, YAML, shell syntax and embedded Python checks pass. No local Lean executable is available, so elaboration and independent acceptance remain pending CI.

**Scientific ceiling/next action:** the derivative is with respect to all finite word parameters at zero, with the vector fixed; the theorem does not assert a source manifold tangent equivalence. Arbitrary words may repeat or omit planes, so no injectivity, rank or model isomorphism is inferred. If BY is accepted, package the corresponding derivative of the entire natural nine-matrix action and select a source-exact nonredundant native-plane model/order before attempting a local inverse. Source/target subgroup charts, source local fiber/kernel control, determinant/covering claims, tangent Lie-algebra identifications and the full F10BC manifold differential remain open.

## F10BY red diagnosis — clean source, explicit audit subtraction-result types

**Rejected strict attempt:** [run 41584710436](https://github.com/etblink/math/actions/runs/41584710436), tested commit `81dc01df6bf787a5b890ce8da9c3678ffe4030b1`, job `125747383788`, completed/failure. Exact pins, pinned dependency restoration, combined BX ancestry and fresh BY source compilation with warnings-as-errors all passed. The independent audit ran and failed. Evidence artifact `13207638715`, ZIP SHA-256 `edeb5bfe1c63245e3a09f1f96c9c842882cd0f6195546d937f850a5c00925613`.

**Exact failure boundary:** audit line 46, column 6 and line 60, column 8 report `failed to synthesize instance of type class HSub` for two real Clifford continuous-linear endomorphisms, with an unresolved result metavariable. Both occurrences form the difference of right- and left-multiplication maps and immediately call `.comp`. They are the independent literal-commutator evaluation control and the complete Clifford-conjugation derivative restatement. The mathematical source uses the same operator and compiled cleanly.

All six mathematical source roots report only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` occurs. Imported roots printed by the failing audit have the same permitted reports. Those reports do not qualify the failing audit examples or override its terminal nonzero exit. BY remains unqualified under the complete-gate policy.

**Bounded repair:** annotate the result of each of the two subtractions as
`CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic`
before applying `.comp`. This fixes the result type at the subtraction expression in the reconstructed-PBW audit environment. A normalization check removes only those two annotations and recovers the previous audit exactly. No audit example or proposition is weakened or removed; the commutator evaluation must still hold by reflexivity.

**Exact files:** mathematical source unchanged at blob `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`; repaired audit blob `6f8d5cafcb8a9950f2ab3dac5162e5ac0e34b8a9`. The workflow refreshes the audit pin and requires exactly two explicit endomorphism annotations at the composition sites. All six root names, source/PBW carriers, actual inverse formula, fixed-vector derivative scope and literal full native-plane sum are unchanged.

**Validation and lesson:** exact hashes, source/audit preflight, YAML, shell syntax and embedded Python checks pass. Local Lean is unavailable; actual elaboration of the annotated audit and complete independent acceptance await a fresh strict run. Keep warnings-as-errors, the standard three-axiom whitelist, fresh source/audit compilation and 840/600-second caps. For overloaded algebra on bundled maps followed by field notation, give the algebraic result an explicit complete type rather than relying on the later composition to infer it.

**Next action/scientific ceiling:** inspect the exact source and independent-audit phases of the repaired run before qualifying BY. The source now compiles the actual conjugation and fixed-vector full finite-parameter derivative at zero, but full gate acceptance is pending. Native model isomorphisms, subgroup charts, source local fiber/kernel control, tangent identifications and the full F10BC manifold differential remain open. Preserve this audit-only failure alongside both earlier BW source/audit failures.

## F10BY second red — annotation-only repair rejected; derived instance and operand-type bridge

**Rejected strict attempt:** [run 41586108954](https://github.com/etblink/math/actions/runs/41586108954), exact tested commit `15b5c5ab64ee0eb66e4a6720d36d7141f7a9a823`, job `125751864371`, completed/failure. Pins, dependencies, combined BX ancestry and fresh mathematical source compilation all passed. The independent audit failed again. Evidence artifact `13207993586`, ZIP SHA-256 `f03cf59fdfe336e187a0068f3a1c88a13ea14917cf669f92e93b408ef3b3b985`.

**Negative result:** the two result-type annotations from the previous repair did not resolve the audit. Lines 46:7 and 61:9 still report `HSub` inference failure for the two Clifford continuous-linear endomorphisms. This overrides the previous expectation that the result annotation would suffice. The source continues to compile and print six permitted roots; the complete independent gate remains failed.

**Pinned prerequisite inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`, defines continuous-linear-map subtraction in a section requiring `IsTopologicalAddGroup` on the codomain. The operation is pointwise subtraction with continuity supplied by that instance. `Topology/Algebra/Ring/Basic.lean` supplies the current theorem `IsTopologicalRing.isTopologicalAddGroup`. Qualified BF supplies the actual Clifford `IsTopologicalRing` theorem for the named PBW topology; current BF source is blob `f7ea4c9e9d996d04d07a7733ffe7ab6a91ce2636`.

The audit reconstructs its norm through a private coordinate-map definition, whereas imported operators carry the named structures. These are checked equal by the existing reflexive norm/coordinate controls. An annotation of a compound result alone did not settle the instance inference involving imported operands. The revised repair explicitly handles the topology prerequisite and declares the operand types in the consumer environment.

**Revised bounded repair:**

- Add a uniquely named local `auditPBWIsTopologicalAddGroup` proof. Within that proof, install the already proved `source9Clifford_isTopologicalRing_pbw` and apply `IsTopologicalRing.isTopologicalAddGroup`. The instance is a proved consequence of accepted BF under the reconstructed PBW structures.
- Check the ground capability `Sub (CliffordAlgebra source9Quadratic →L[ℝ] CliffordAlgebra source9Quadratic)` explicitly.
- In each of the two failing examples, bind `R` and `L` with that complete audit endomorphism type, assigning exactly the accepted right- and left-multiplication maps. Subtract these typed operands before composition.
- Keep both complete checks: the literal commutator evaluation still must hold by reflexivity, and the actual conjugation derivative must still have the full source proposition. The let-bound operands reduce to the same imported maps.

**Exact source/audit:** mathematical source remains unchanged at `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`; revised audit blob `63b13c337d63df13cbc8d9d7aeaa51d685a0cd6b`. No new norm, carrier, group operation, bound, hypothesis or global instance is introduced. Existing coordinate/norm reconstruction, actual inverse formula, all six root statements, fixed-vector parameter scope and literal full native-plane output are retained.

**Workflow and validation:** update only the audit pin and static guards for the derived local topology, ground subtraction check and typed operands. Keep fresh warnings-as-errors source/audit compilation, the exact six-root reports, permitted-axiom whitelist and 840/600-second caps. Local YAML, shell, embedded Python and source/audit preflight pass. No local Lean executable is available; the new instance/operand bridge is a candidate until strict CI elaborates it.

**Method lesson and next action:** repeated identical diagnostics after a type annotation reject that annotation as a sufficient explanation. Inspect the required instance's actual declaration and its structural hypotheses, then align the consumer's typed operands with the reconstructed dictionaries and check the ground prerequisite explicitly. Inspect both phases of the next exact-commit strict run before qualification. Preserve both BY failures; source-level success and imported-root reports do not certify failed audit expressions.

**Scientific ceiling unchanged:** actual fixed-vector finite-parameter action derivatives compile in the mathematical source, but BY is still awaiting complete independent acceptance. Native model isomorphisms, subgroup charts, source local fiber/kernel control, tangent identifications and the full F10BC manifold differential remain open.

## F10BY third red — instance bridge passed, proof-style linter isolated; method review implemented

**Run preserved:** [41587795099](https://github.com/etblink/math/actions/runs/41587795099), exact tested commit `91764a75f189ccb7e59c937ccb00db31d1cb9fd1`, job `125757234015`, completed/failure. Pins, restoration, BX ancestry and fresh BY source compilation passed. Audit failed only at 30:2 under warnings-as-errors. Evidence artifact `13208927770`, ZIP SHA-256 `4b5146f08f9b0ef3dc83e53221f0daa4233691d957495d9c164e0434a87d06fc`.

**New evidence:** neither of the previous `HSub` errors is present. The explicit additive-topology proof, ground subtraction capability and typed operand checks reached their propositions without those diagnostics. The combined bridge supports the intended audit; the individual contributions of its two changes were not separately isolated.

**Exact remaining diagnostic:** the goal is a proposition, so Lean's `linter.style.haveILetI` requires `let` in place of `letI`. The compiler explains that value inlining is irrelevant here by proof irrelevance. This is a distinct proof-style failure. Source and imported audit roots each print six permitted reports, but the failed terminal audit still prevents BY acceptance.

At the owner's request, reviewed the FCP evergreen and procedural success/failure plan at FCP `cc608e2282e1b32bb11bbb64424e4775b28138e2`, the V9Z six-red review, V8A validator recovery, V8L linter recovery, V10E conversion review, and the recent BW/BX acceptance and failure records. The evidence, causal comparison, procedural shortcomings, bounded plan and stop rules are in the new scoped [F10BY three-red review](FCP_K1D18V10H_F10BY_THREE_RED_METHOD_REVIEW_AND_RECOVERY_PLAN_2026_11_02.md). The evergreen itself is unchanged.

**Implemented correction:** replace the single proof binding `letI : IsTopologicalRing ...` with compiler-requested `let : IsTopologicalRing ...`. The complete old audit is recovered by reversing that one keyword change. Repaired audit blob `4e89a6df00269492b91bee147cd4a24bb3b688a3`; mathematical source remains `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`. The workflow refreshes only its exact audit pin and local binding guard. No linter suppression, semantic validator relaxation, increased limit or new hypothesis is introduced.

**Validation:** one-keyword audit diff checked; mathematical source hash unchanged; YAML, all shell blocks, embedded Python and complete source/audit preflight pass. These checks do not substitute for Lean. Local Lean is unavailable, so the strict run must validate the corrected audit and all original controls.

**Ordered next action:** inspect the repaired run through terminal status, then review both fresh Lean phases, the exact six-root/axiom classifier and evidence artifact before accepting BY. If the previous `HSub` returns, stop broad wrapper retries and isolate the already defined ground/type bridge with complete types; do not repeat result-only annotations. If only a different style diagnostic appears, correct it locally while retaining warning strictness.

**Scientific scope unchanged:** ordinary finite-parameter derivative of the actual word's vector action at zero, with the vector fixed. Subgroup charts, native model isomorphisms, tangent identifications, source local fiber/kernel control and the full F10BC manifold differential remain open.

## F10BY accepted after causal review — actual word vector-action full derivative

**Terminal strict acceptance:** [run 41590375172](https://github.com/etblink/math/actions/runs/41590375172), exact tested repair commit `96a8d19755c90c42222fa8dabfaf383ff81db6bc`, job `125765477791`, completed/success. All ten job steps, including exact pins, restored environment, combined BX ancestry, fresh warnings-as-errors source compilation, independent audit and evidence preservation, completed successfully.

The actual terminal classifier is `V10H_F10BY_ACTUAL_WORD_VECTOR_ACTION_FULL_DERIVATIVE_TYPES_AXIOMS_PASS`. Both fresh Lean phases contain exactly the six expected fully qualified root reports; each of the six names appears once in each phase. All twelve reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error occurs. This qualifies the complete gate; earlier red source/audit printouts are retained only as partial diagnostic evidence.

| Accepted component | Exact Git blob |
|---|---|
| Mathematical source | `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc` |
| Independent audit | `4e89a6df00269492b91bee147cd4a24bb3b688a3` |
| Strict workflow | `0f00d9b291f5d67b53f64917aace155e487b97e2` |

Evidence artifact `13210162560`, ZIP SHA-256 `08d8ed0097e406f8421cd8286bec84e33ccc0a44660e1d737073474228792514`, size 5120 bytes. Lean remains 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

**Qualified six roots:**

- `source9CoordinateHalfBivector_reverse`.
- `source9PlaneSpinWordVelocity_reverse`.
- `source9PlaneSpinWord_conjugation_hasFDerivAt_zero`.
- `source9PlaneSpinWord_vectorAction_hasFDerivAt_zero`.
- `source9PlaneSpinWord_vectorAction_fderiv_zero`.
- `source9PlaneSpinWord_vectorAction_fderiv_zero_apply`.

**Exact mathematical scope:** for any finite real parameter family, list of parameter indices and family of original source-coordinate pairs with `hrs : ∀ i, r i ≠ s i`, actual Clifford conjugation by `source9PlaneSpinWord` has the stated full Fréchet derivative at zero. For every fixed original vector `z`, its actual `source9SpinVectorConjugation` action has derivative exactly `source9PlaneWordVectorVelocity`. In every direction `v`, the derivative is the literal list sum
`(l.map (fun i => v i • ((coordinatePlane9 (r i) (s i)).mulVec z))).sum`.
Repeated indices contribute repeatedly, and the output uses full native planes `E_rs - E_sr` without an extra half factor.

The independent audit retains PBW reconstruction, the derived additive topology and ground subtraction check, both explicitly typed multiplication operands, literal bundled commutator evaluation by reflexivity, actual inverse-coercion conjugation, exact fixed-vector `HasFDerivAt`/`fderiv`, directional finite sum and matrix-unit normalization.

**Outcome of the method review:** result annotations alone failed. The combined derived-topology and typed-operand bridge removed the prior inference errors. Its first strict attempt then failed only because `letI` was unsuitable in the proposition proof. The one-keyword compiler-directed `let` correction passed without changing mathematical source or propositions, suppressing linters, raising limits or relaxing axioms. The three failed runs 41584710436, 41586108954 and 41587795099 remain red with exact evidence. The [frozen three-red review](FCP_K1D18V10H_F10BY_THREE_RED_METHOD_REVIEW_AND_RECOVERY_PLAN_2026_11_02.md) records the comparison with historical FCP/math techniques, the prior procedural shortcomings and stop rules. This live handoff supplies the later acceptance.

**Current next obligation and ceiling:** package the entire natural nine-matrix action derivative and establish a source-exact nonredundant native skew-plane model/order. BY does not select an invertible 36-plane parameterization, install a subgroup atlas, identify a tangent Lie algebra, establish source local fiber/kernel control or covering, prove the full F10BC manifold differential, or establish a physical BFSS conclusion. No further theorem candidate was introduced during this review/recovery task.

## F10BZ candidate — full natural nine-matrix derivative of actual finite source words

**Project Lead resumption baseline:** branch HEAD `6352fbf663f30cd87c7caa4857a70d0d6c09112f` is the documentation-only acceptance commit after strictly accepted BY. The latest accepted mathematical source/audit/workflow are unchanged at `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`/`4e89a6df00269492b91bee147cd4a24bb3b688a3`/`0f00d9b291f5d67b53f64917aace155e487b97e2`. The live branch and current handoff were checked before selecting new work.

**Candidate only; six declaration roots pending.** Assemble accepted BY's full vector-action derivatives on the original coordinate columns into the full derivative of the actual BR natural orthogonal image matrix. The derivative's value in direction `v` is the literal matrix sum
`(l.map (fun a => v a • coordinatePlane9 (r a) (s a))).sum`.
Every actual-word derivative retains `hrs : ∀ a, r a ≠ s a`; repeated parameter indices remain repeated contributions.

| Candidate declaration | Exact obligation |
|---|---|
| `source9PlaneWordMatrixVelocity` | Continuous linear finite-parameter-to-original-nine-matrix map, assembled by two Pi constructors from accepted vector-column velocities. |
| `source9PlaneWordMatrixVelocity_apply` | The assembled map equals the literal full native-plane matrix sum in every direction. |
| `source9PlaneSpinWord_vectorMatrix_entry_hasFDerivAt_zero` | Exact entry derivative of the actual canonical natural matrix homomorphism. |
| `source9PlaneSpinWord_vectorOrthogonalMatrix_hasFDerivAt_zero` | Full `HasFDerivAt` for the entire actual underlying O(9) image matrix. |
| `source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero` | Actual matrix `fderiv` equals the assembled continuous linear map. |
| `source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero_apply` | The actual whole-matrix derivative, evaluated in any direction, is the literal native-plane matrix sum. |

Files:

- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BZFullNaturalMatrixWordDerivative.lean`, source blob `6602ec877561b8751d8505b4cff096746bf0c27b`.
- `lean/diagnostics/FCP_K1D18V10HF10BZIndependentAudit.lean`, independent audit blob `c8983613c3bed672b4b997e6b70875682de94c1a`.
- `.github/workflows/bfss-kotler-v10h-f10bz-full-natural-matrix-word-derivative-strict.yml`.

**Pinned source/API reuse:** BR's actual natural matrix/orthogonal homomorphisms, BY's actual full vector-action derivative, and BS's accepted original-column/entry bridge pattern. Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `FDeriv/Prod.lean`, was inspected: `hasFDerivAt_pi'` extracts component derivatives via typed projections; `hasFDerivAt_pi` assembles a family of derivatives through `ContinuousLinearMap.pi`. `ContinuousLinearMap/PiProd.lean` defines the actual Pi constructors and their pointwise values. `Analysis/Matrix/Normed.lean` supplies the standard elementwise Pi norm. The prime and unprimed criteria have distinct roles and were selected from their complete pinned signatures.

The literal matrix-sum proof uses entrywise induction, explicit coordinate-column evaluation and typed congruence from the induction hypothesis. Matrix entries are the accepted actual vector action on original coordinate columns; an explicit function equality bridges the derivative statement. The whole derivative is assembled twice through the Pi criterion. Final directional evaluation uses a fully instantiated map equality and typed evaluation congruence, following the accepted BW/BY audit recovery pattern.

**Independent checks:** capture the standard matrix product topology before opening `Matrix.Norms.Elementwise`, then check it equals the scoped topology by reflexivity. Restate all six complete interfaces, check every assembled entry equals its accepted column velocity, check empty and repeated-index words, check the actual O(9) underlying matrix `HasFDerivAt`/`fderiv`, finish with the literal matrix sum, and recheck full native `E_rs - E_sr` normalization. No Clifford norm or topology is reconstructed here because the new asserted derivatives live only in the original vector/matrix spaces; BY supplies the already qualified source-action theorem.

**Scope and verification discipline:** no new instance is registered. The only norm scope opened is the standard elementwise matrix norm. No normed-ring estimate, target/source atlas, tangent equivalence or carrier substitution is introduced. The source and audit contain no speculative proof-style bindings or overloaded endomorphism subtraction.

The workflow pins the accepted compatible ancestry through BY, plus exact BP/BQ/BR source/audits. All newly added BP/BQ/BR pins were checked against the resumption baseline. It rebuilds BY and BR together, freshly compiles BZ and the independent audit with warnings-as-errors, requires exactly six permitted root reports in each phase and retains the standard three-axiom whitelist and 840/600-second caps. Local exact hashes, source/audit preflight, YAML, shell syntax and embedded Python checks pass. Local Lean is unavailable; actual elaboration and independent acceptance await strict CI.

**Next action and scientific ceiling:** inspect the exact BZ strict result before qualification. If accepted, research/reuse the existing native skew-matrix spanning/coordinate modules and pinned Mathlib basis APIs to choose and prove a nonredundant source-exact model/order. Arbitrary words may omit or repeat planes, so this derivative alone gives no injectivity or invertibility. Proper subgroup charts, source local fiber/kernel control, tangent Lie-algebra identifications, determinant/covering claims and the full F10BC manifold differential remain open. Preserve all earlier red histories and the method review; no further mathematical step is authorized by a source-only or audit-only partial pass.

## F10BZ strict red — captured topology class-definition reducibility

**Immutable failed evidence:** [run 41599911562](https://github.com/etblink/math/actions/runs/41599911562), tested commit `fcf8371b9b3fc00dbc878462effeb910917e14c9`, job `125795950450`, completed/failure. Exact pins, pinned Lean/Mathlib restoration, combined BY/BR ancestry rebuild and fresh BZ warnings-as-errors source compilation passed. The independent audit failed at line 9: the private `auditNaturalMatrixProductTopology` definition has class type but is semireducible. Lean explicitly recommends `@[instance_reducible]`. This is the only source-level warning/error diagnostic in the fresh phases. All six expected root reports appear in each phase, twelve total, using only `propext`, `Classical.choice`, and `Quot.sound`; these partial reports do not qualify a failed gate. The terminal classifier did not execute.

The retained artifact is `13215155031`, `bfss-v10h-f10bz-whole-natural-nine-matrix-word-derivative-fcf8371b9b3fc00dbc878462effeb910917e14c9-1`, 1414 bytes, GitHub-reported ZIP SHA-256 `81d1a0c6a634482b43e2ce54cc2393555ba12f882ea7e3e4ac00e5f11d7d1321`. Failed source/audit/workflow blobs are `6602ec877561b8751d8505b4cff096746bf0c27b` / `c8983613c3bed672b4b997e6b70875682de94c1a` / `7db8f33b00d5dcb03685dd2af1296826c01aab79`.

**Bounded repair:** mark the existing private topology capture `@[instance_reducible]`, retaining its definition body, position before the matrix-norm scope, and independent reflexive topology equality. This changes definition reducibility and registers no instance. No theorem, proposition, original carrier, source norm, matrix topology, or derivative formula is changed. Do not disable `warn.classDefReducibility` or any warning. Source blob remains `6602ec877561b8751d8505b4cff096746bf0c27b`; repaired audit blob is `0b5dd933bf5c36fe7daeece45f28b54cf54a58e9`; workflow blob `537e87ce72ff1d9f9a4b383138bcc0796ecca72c` changes only that audit pin. Require complete fresh source and independent audit success before qualification, with unchanged time caps and axiom whitelist.

**Next-step inventory, not a new result:** inspected at `fcf8371b9b3fc00dbc878462effeb910917e14c9`, `SU2BFSSPairedSpin9SkewCoordinatePlaneSpanningProbe.lean` blob `626124eaa4635f64223b48bd6b986a367dc9b40e` gives a half-scaled sum over all ordered pairs. `SU2BFSSPairedSpin9InputSkewMatrixUnitBridgeProbe.lean` blob `da4020a35b3784a90ce76c03798061993fc6275b` gives the exact native matrix-unit decomposition and skew-entry bridge. Those are reuse candidates; the ordered-pair spanning formula does not itself provide a nonredundant 36-plane model or independence. No new model/chart theorem is claimed.

## F10BZ accepted — full natural nine-matrix word derivative

**Verified strict result:** [run 41601609222](https://github.com/etblink/math/actions/runs/41601609222), tested commit `686cf015d0a33d256a28f4cefabae998bbfe95bb`, attempt 1, job `125801433535`, completed/success with all ten recorded steps successful. Exact pins, pinned Lean 4.34.1/Mathlib restoration, combined BY/BR ancestry rebuild, fresh warnings-as-errors BZ source compilation, independent audit and evidence preservation all passed.

The actual terminal classifier is `V10H_F10BZ_WHOLE_NATURAL_NINE_MATRIX_WORD_DERIVATIVE_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the six expected fully qualified roots, each once per phase (twelve reports total). Every report uses only `propext`, `Classical.choice`, and `Quot.sound`. There is no `sorryAx` or source-level warning/error. Complete audit success now qualifies the gate; the first run remains an immutable audit-only failure, not an accepted result.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BZFullNaturalMatrixWordDerivative.lean` | `6602ec877561b8751d8505b4cff096746bf0c27b` |
| `lean/diagnostics/FCP_K1D18V10HF10BZIndependentAudit.lean` | `0b5dd933bf5c36fe7daeece45f28b54cf54a58e9` |
| `.github/workflows/bfss-kotler-v10h-f10bz-full-natural-matrix-word-derivative-strict.yml` | `537e87ce72ff1d9f9a4b383138bcc0796ecca72c` |

All six qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9PlaneWordMatrixVelocity`
2. `source9PlaneWordMatrixVelocity_apply`
3. `source9PlaneSpinWord_vectorMatrix_entry_hasFDerivAt_zero`
4. `source9PlaneSpinWord_vectorOrthogonalMatrix_hasFDerivAt_zero`
5. `source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero`
6. `source9PlaneSpinWord_vectorOrthogonalMatrix_fderiv_zero_apply`

The retained artifact is `13214538227`, `bfss-v10h-f10bz-whole-natural-nine-matrix-word-derivative-686cf015d0a33d256a28f4cefabae998bbfe95bb-1`, 4356 bytes, GitHub-reported ZIP SHA-256 `75d7ad5407b7b2666bdb40a1196cc5cef4b424aaccc7210f30aecad2ef68c129`. Exact run metadata, job status, decoded log, terminal marker, root counts, axiom whitelist and artifact metadata were checked before this acceptance record.

**Qualified mathematical content:** for arbitrary finite parameters `Fin k → ℝ`, labels `r s`, distinctness proofs `hrs`, and ordered word `l`, the underlying original-nine matrix of the actual `source9SpinVectorOrthogonalHom` image of `source9PlaneSpinWord r s hrs t l` has a full Fréchet derivative at `t = 0`. Its value on any direction `v` equals `(l.map (fun a => v a • coordinatePlane9 (r a) (s a))).sum`. This is a derivative of the actual homomorphism applied to the actual source word, with the original source labels and full native-plane normalization. Empty and repeated-index words and standard matrix product topology were independently checked. The mathematical source stayed identical through the audit-only repair.

**Method outcome and next obligation:** reuse of the pinned Pi derivative APIs, explicit original-coordinate column bridge and typed map evaluation succeeded. The audit definition needed the compiler-recommended reducibility attribute; no new instance or linter suppression was needed. Next choose a source-exact nonredundant 36-plane index/order and prove the corresponding native skew-coordinate model isomorphism, using existing exact decomposition/entry bridges and pinned APIs. Only after independence and the actual word derivative specialize to an invertible model can a chart argument be attempted. Subgroup charts, source local fiber/kernel control, tangent Lie-algebra identifications, determinant/covering claims, the full F10BC manifold differential and BFSS physical conclusions remain open. No new theorem candidate was introduced after acceptance in this task.

## F10CA candidate — native nonredundant strict-plane coordinate model

**Resumption baseline:** live research branch checked at `bc9eba63476002ab9045c7eedf0b2cf4cf04d1f3`, the documentation-only BZ acceptance commit. Root AGENTS instructions and the current handoff were read; all eleven relevant ancestor directories were checked for nested AGENTS files, with none present. Accepted sources are unchanged.

**Plan and scope:** replace the redundant all-ordered-pair spanning parameterization with the original increasing-pair subtype `{p : SpaceIndex × SpaceIndex // p.1 < p.2}`. Prove its cardinality 36, reconstruct the upper entries directly, obtain lower entries by sign reversal and zero diagonal, and package explicit inverse upper-entry extraction as a real linear equivalence to the existing canonical `LieAlgebra.Orthogonal.so SpaceIndex ℝ`. Then show each unit coordinate is the exact native `coordinatePlane9 r s` and derive the full reconstruction as the literal single sum, with no one-half factor. This gate establishes the algebraic model only; it does not yet choose a `Fin 36` enumeration or actual source word order, assert continuity of the equivalence, specialize BZ's derivative, or construct charts.

**Reuse/API inspection:** existing V9F source `SU2BFSSPairedSpin9SkewCoordinatePlaneSpanningProbe.lean`, blob `626124eaa4635f64223b48bd6b986a367dc9b40e`, gives a half-scaled ordered-pair sum rather than independence. V8T's exact matrix-unit bridge, blob `d80001bbe5052357dbca559232d81cc01c56fb34`, supplies normalization; its native plane carrier, blob `92a26e8380abe9c1f9bdf011d27b8e97b4e17ef3`, supplies transpose skewness. Accepted BB, blob `cbf92737d81c5e69efc2fa85735d6af239540070`, identifies the canonical source carrier. At pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Algebra/Lie/Classical.lean` (blob `b5398a77f3282c2f21325182ae26f06d5e822a79`) defines canonical `so` and the exact transpose-negation membership criterion. `Algebra/BigOperators/Pi.lean` (blob `05cecf2b42377841c193d36fc91824aa031d7892`) provides `pi_eq_sum_univ'`, the exact unit-coordinate decomposition. The source uses that pinned decomposition through a fully typed linear inclusion into the original matrix carrier.

Seven candidate roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9StrictPlaneIndex_card`
2. `source9StrictPlaneMatrix`
3. `source9StrictPlaneMatrix_transpose`
4. `source9StrictPlaneModelEquiv`
5. `source9StrictPlaneModelEquiv_symm_apply`
6. `source9StrictPlaneModelEquiv_plane`
7. `source9StrictPlaneModelEquiv_apply_sum`

Candidate source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CANativeStrictPlaneModel.lean`, blob `ead68a8cdc6a25d42314c25a7efa48b17737a9b9`; independent audit `lean/diagnostics/FCP_K1D18V10HF10CAIndependentAudit.lean`, blob `658e557d5ff5d4e09fe44d43e08be98234b5abca`. Workflow `.github/workflows/bfss-kotler-v10h-f10ca-native-strict-plane-model-strict.yml` retains the accepted ancestry pins through BZ and unchanged fresh compiler/audit time caps, warning policy and three-axiom whitelist. It requires exactly all seven root reports per phase, permitting genuine axiom-free declarations as before.

**Independent audit:** literal original strict-pair subtype equality, exact card 36, complete canonical linear-equivalence type, upper-coordinate recovery, reconstruction of an arbitrary canonical skew matrix, unit-coordinate image, independent `Matrix.single r s 1 - Matrix.single s r 1` normalization, literal sum formula and coefficient uniqueness from equality of literal native-plane sums. No captured class definition, new instance, carrier substitution or linter suppression is introduced.

**Validation and next action:** local candidate hashes, scope/declaration preflight, YAML parsing, all shell blocks and both embedded Python blocks pass. No local Lean executable is available; mathematical elaboration is pending CI. Inspect the exact fresh source and independent audit result before qualifying any CA root. If accepted, next select a source-exact deterministic enumeration/order, connect the actual ordered-word derivative to this model, and establish the appropriate continuous linear isomorphism before any chart claim. Local fiber/kernel control, tangent identifications, determinant/covering statements, full F10BC manifold differential and physical BFSS conclusions remain open. All earlier red and green evidence remains immutable.

## F10CA strict red — explicit order, additive and canonical-instance bridges

**Immutable failed evidence:** [run 41628943110](https://github.com/etblink/math/actions/runs/41628943110), tested `072c859e744ac13e42ff89d79fbb852f5877bcc1`, job `125893270013`, completed/failure. Exact pins, dependency restoration and accepted BZ ancestry passed. Fresh source compilation failed; the independent audit was skipped and the terminal type/axiom classifier did not run. Zero CA roots are qualified. The cardinality, matrix definition and transpose roots printed only the three permitted axioms, but four downstream root reports contained compiler-recovery `sorryAx` after failed proof elaboration. Those are failed diagnostic output, not admissible theorem evidence or source-level admissions.

Retained artifact `13227078740`, `bfss-v10h-f10ca-native-strict-plane-model-072c859e744ac13e42ff89d79fbb852f5877bcc1-1`, 1478 bytes, GitHub-reported ZIP SHA-256 `2277784d29516c83750478c9ee18f4e2a7daabc525b0d739be298bb34921189e`. Failed source/audit/workflow blobs are `ead68a8cdc6a25d42314c25a7efa48b17737a9b9` / `658e557d5ff5d4e09fe44d43e08be98234b5abca` / `63e8958a3ff26665ffbc49e47f4dd353dbbe7e2f`.

**Diagnostics and bounded repair:** the lower-entry additive proof simplified to a commuted sum of negatives; finish that explicit commutative-group equality with `abel`. Replace deprecated `dif_pos` by the compiler-recommended `dite_eq_left`. `omega` found no arithmetic constraints through the native spatial-index order; use the general linear-order bridge `le_antisymm (le_of_not_gt hji) (le_of_not_gt hij)` rather than unfolding or increasing limits. Remove compiler-identified unused simp arguments `neg_add`, `smul_neg` and the unused orientation of `hpq`. The typed inclusion through canonical `so.toSubmodule` lacked `LieRing (Matrix SpaceIndex SpaceIndex ℝ)` in local instance search; import `Mathlib.Algebra.Lie.OfAssociative` explicitly and activate the existing `LieRing.ofAssociativeRing` locally at priority 100, exactly as accepted BB does. This is reuse of Mathlib's existing structure, not a newly defined instance or carrier change. Add a fully typed pointwise evaluation equality `hL` for the inclusion/composition and rewrite through it, replacing the failed broad `change` at the finite-sum bridge.

The original index, reconstruction definition, declaration statements, seven roots and independent mathematical audit are unchanged. Repaired source blob is `4ab3a48b947db73c3d7102431b418e81c62f79fa`; audit stays `658e557d5ff5d4e09fe44d43e08be98234b5abca`; workflow `dac51d4b641f6da1c4919da4a01ab3b71de0049e` changes only the source pin. No warning suppression, limit increase or axiom-policy change. Require complete fresh source plus independent audit success and seven permitted root reports in each phase before acceptance.

**Read-only next-stage API reconnaissance:** pinned Mathlib `Data/Fintype/EquivFin.lean`, blob `80c4fd3f66ca34b754a300f1ac79312e7fcd920f`, supplies `Fintype.equivFinOfCardEq` as a noncomputable finite bijection. `Data/Finset/Sort.lean`, blob `7b0a4c48f708fe480d641bb9df04e8861bca3c39`, supplies sorting, nodup/length/membership facts and `orderIsoOfFin` for a specified linear order. A general finite bijection alone does not establish a chosen lexicographic word order. These APIs are only reconnaissance; no ordered-word or chart result is introduced here.

## F10CA second strict red — single additive tactic-focus style diagnostic

**Immutable evidence:** [run 41630736020](https://github.com/etblink/math/actions/runs/41630736020), tested `c1d7117c16efc88738b605918f66d6c4988258cd`, job `125899334195`, completed/failure. Pins, pinned environment restoration and accepted BZ ancestry passed. All seven source root reports now use only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`. The previous order, additive equality, deprecated API, unused simp and matrix Lie-ring errors no longer appear. The only source diagnostic is line 100:48, `unnecessarySeqFocus`, for `simp [...] <;> abel`. Because warnings remain errors, source compilation failed and the independent audit was skipped; no CA declaration is qualified.

Artifact `13228722208`, `bfss-v10h-f10ca-native-strict-plane-model-c1d7117c16efc88738b605918f66d6c4988258cd-1`, 833 bytes, GitHub-reported ZIP SHA-256 `5f8de817624750f9d4d8d5c696d617ee64e905c925120e3153d30db82857933e`. Failed source/audit/workflow blobs: `4ab3a48b947db73c3d7102431b418e81c62f79fa` / `658e557d5ff5d4e09fe44d43e08be98234b5abca` / `dac51d4b641f6da1c4919da4a01ab3b71de0049e`.

**Bounded correction:** make the additivity proof's upper, lower and diagonal cases explicit. Only the lower-entry case unfolds the dependent conditions and function addition with `simp only`, then invokes `abel` on the remaining negative-sum identity. This removes the unnecessary sequence-focus combinator without relying on an extra tactic after already closed branches. All statements, the reconstruction definition, canonical carrier and independent audit remain unchanged. New source blob `c9c4bea7ef07c08d2ca1b8344dcf2a6532b0ff61`; workflow blob `5fa9119ee25d5e8a3a1016ec2d46c395343e1405` changes only its pin. Retain strict linter policy, time caps, exact seven-root checks and axiom whitelist. Inspect the next run through both Lean phases before acceptance; clean partial root reports are insufficient.

## F10CA accepted — nonredundant native 36-plane model of canonical so(9,R)

**Verified strict result:** [run 41632537353](https://github.com/etblink/math/actions/runs/41632537353), tested `e289e2397ec41009a41f13d60190243f55ef5458`, attempt 1, job `125905454297`, completed/success with all ten recorded steps successful. Exact source/ancestry pins, pinned Lean 4.34.1/Mathlib restoration, accepted BZ ancestry rebuild, fresh warnings-as-errors source compilation, independent audit and evidence preservation all passed.

The actual terminal classifier is `V10H_F10CA_NATIVE_STRICT_PLANE_MODEL_TYPES_AXIOMS_PASS`. Each fresh phase contains exactly the seven expected fully qualified root reports, each once per phase (fourteen total). Every report uses only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or source-level warning/error occurs. The first two runs remain strict failures; their partial reports do not qualify them retroactively.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CANativeStrictPlaneModel.lean` | `c9c4bea7ef07c08d2ca1b8344dcf2a6532b0ff61` |
| `lean/diagnostics/FCP_K1D18V10HF10CAIndependentAudit.lean` | `658e557d5ff5d4e09fe44d43e08be98234b5abca` |
| `.github/workflows/bfss-kotler-v10h-f10ca-native-strict-plane-model-strict.yml` | `5fa9119ee25d5e8a3a1016ec2d46c395343e1405` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9StrictPlaneIndex_card`
2. `source9StrictPlaneMatrix`
3. `source9StrictPlaneMatrix_transpose`
4. `source9StrictPlaneModelEquiv`
5. `source9StrictPlaneModelEquiv_symm_apply`
6. `source9StrictPlaneModelEquiv_plane`
7. `source9StrictPlaneModelEquiv_apply_sum`

Artifact `13228853906`, `bfss-v10h-f10ca-native-strict-plane-model-e289e2397ec41009a41f13d60190243f55ef5458-1`, 4510 bytes, GitHub-reported ZIP SHA-256 `86af9895dc3668410ff7c39d864996c385e710cadd84be207a2f5d4ebaf3695b`. Exact run metadata, tested SHA, every job step, decoded log, terminal marker, root multiplicities, axiom whitelist and artifact metadata were checked before acceptance.

**Qualified mathematical content:** the exact original increasing spatial-pair subtype has cardinality 36. `source9StrictPlaneModelEquiv` is a real linear equivalence from functions on that subtype to Mathlib's existing `LieAlgebra.Orthogonal.so SpaceIndex ℝ`. Its inverse literally extracts original upper-triangular matrix entries. A unit coordinate maps to the full native `coordinatePlane9 r s = E_rs - E_sr`, and arbitrary coordinates reconstruct the literal single native-plane sum without a half factor. The independent audit separately checks original subtype identity, cardinality, full equivalence type, both coordinate-recovery directions, literal matrix-unit normalization, the full sum and uniqueness from equality of literal sums.

**Method outcome:** the explicit linear-order bridge succeeds without unfolding `SpaceIndex` or invoking arithmetic automation. Activating Mathlib's existing associative Lie-ring structure locally, as in BB, resolves the canonical submodule inclusion. A typed pointwise `hL` bridge succeeds for the literal finite-sum calculation. Explicit additivity cases remove the tactic-focus warning while preserving warning strictness. Static comparison confirms all seven declaration signatures and the reconstruction definition are identical to the first candidate; the independent audit remained byte-identical through both repairs. No new instance definition, custom limit or warning suppression was introduced. During the final run, pinned `Algebra/Notation/Pi/Defs.lean`, blob `77be7fd2c8ebe0f0e1dce25043113ad5e2303fd7`, was inspected: `Pi.add_apply` is generated from the ordinary pointwise `Pi.mul_apply` theorem, not a deprecated alias.

**Next bounded obligation and ceiling:** choose and record a source-exact enumeration of the 36 strict pairs, use each exactly once in an explicit ordered source word, and specialize BZ's actual natural-matrix derivative to CA's nonredundant coordinate map. Check the derivative's model range or its upper-coordinate projection explicitly. CA's linear equivalence targets canonical skew matrices; it does not assert an isomorphism onto the entire ambient 9x9 matrix space. Establish the appropriate continuity/continuous linear equivalence using pinned finite-dimensional APIs before an inverse-function or chart argument. Source local fiber/kernel control, subgroup charts, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and physical BFSS conclusions remain open. No further theorem candidate is introduced in this acceptance record.

## F10CB candidate — chosen enumeration and actual ordered strict-plane word

**Baseline:** live branch checked at `fd9436e2a1f22f5468f6ae7679630b5e0856b3b0`, the documentation-only CA acceptance commit. The reported green run is already fully inspected and accepted; this resumption introduces a new bounded candidate rather than repeating CA qualification. Root AGENTS and current handoff were reread. Previously checked ancestor instructions are unchanged at this documentation-only baseline.

**Chosen order and API:** define `source9StrictPlaneEnumeration : Fin 36 ≃ source9StrictPlaneIndex` as the inverse of `Fintype.equivFinOfCardEq source9StrictPlaneIndex_card`. This is one named, noncomputable chosen bijection; it makes no lexicographic or concrete label-table claim. The product order is explicitly the increasing parameter-index list `List.finRange 36`. Pinned Mathlib `Data/Fintype/EquivFin.lean`, revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, blob `80c4fd3f66ca34b754a300f1ac79312e7fcd920f`, was inspected again for the complete API. Strict-pair projections retain the original source labels and give each actual curve's distinctness proof.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`: `source9StrictPlaneEnumeration`, `source9StrictPlaneEnumeration_bijective`, `source9StrictPlaneEnumeration_ne`, `source9OrderedStrictPlaneWord`, `source9OrderedStrictPlaneWord_zero`, `source9OrderedStrictPlaneWord_matrix_hasFDerivAt_zero`, and `source9OrderedStrictPlaneWord_matrix_fderiv_zero_apply`. The two projection helper definitions are also checked through these exact interfaces and their root dependencies.

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CBOrderedStrictPlaneWord.lean`, blob `d154844afabdfb7d66e9e3ec72c9b94714a781fa`; audit `lean/diagnostics/FCP_K1D18V10HF10CBIndependentAudit.lean`, blob `f03c13f9e692aa404affcac76e4f96c4bf76435b`; workflow `.github/workflows/bfss-kotler-v10h-f10cb-ordered-strict-plane-word-strict.yml`. Exact accepted ancestry pins through CA are retained. Rebuild CA, then compile CB and its independent audit freshly with warnings-as-errors and unchanged 840/600-second caps. Require exactly seven permitted axiom reports per phase under the unchanged three-axiom whitelist.

**Independent checks:** exact finite-equivalence type, bijectivity, unique preimage of every original strict pair, literal row/column projections, distinct labels, list length 36, nodup and complete parameter-index coverage, actual Spin-group word type, equality with the literal ordered product of accepted source curves, zero identity, full actual natural-matrix `HasFDerivAt`, literal directional matrix-sum evaluation and independent native matrix-unit normalization. No new instance, norm context, linter suppression, custom limit or replacement carrier is introduced.

**Validation and ceiling:** local source/audit hashes, declaration/scope preflight, YAML, trigger paths, shell syntax and both embedded Python blocks pass. The embedded-Python static check caught and corrected a generated marker-string substitution before publication. Local Lean is unavailable; no CB root is qualified until full strict CI passes. Next reindex the literal finite derivative sum into CA's model (or its upper-coordinate projection), then establish the appropriate continuous linear equivalence. Subgroup charts, source local fiber/kernel control, tangent identifications, determinant/covering statements, full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all earlier red and green evidence.

## F10CB accepted — chosen ordered 36-plane actual source word

**Verified strict result:** [run 41649415524](https://github.com/etblink/math/actions/runs/41649415524), tested `0ed5c9e8fe4847f50978929e639880daa207764b`, attempt 1, job `125963321451`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CA rebuild, fresh warnings-as-errors source compilation, independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CB_ORDERED_STRICT_PLANE_WORD_TYPES_AXIOMS_PASS`. Both fresh Lean phases contain exactly the seven expected fully qualified root reports, each once per phase (fourteen total), all using only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. Exact run metadata, tested SHA, all job steps, decoded log, terminal marker, root multiplicities, axiom whitelist, artifact metadata and candidate blob identities were inspected before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CBOrderedStrictPlaneWord.lean` | `d154844afabdfb7d66e9e3ec72c9b94714a781fa` |
| `lean/diagnostics/FCP_K1D18V10HF10CBIndependentAudit.lean` | `f03c13f9e692aa404affcac76e4f96c4bf76435b` |
| `.github/workflows/bfss-kotler-v10h-f10cb-ordered-strict-plane-word-strict.yml` | `75534316835ac34b4a1ca1a6802701f44d29784a` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9StrictPlaneEnumeration`
2. `source9StrictPlaneEnumeration_bijective`
3. `source9StrictPlaneEnumeration_ne`
4. `source9OrderedStrictPlaneWord`
5. `source9OrderedStrictPlaneWord_zero`
6. `source9OrderedStrictPlaneWord_matrix_hasFDerivAt_zero`
7. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_apply`

Retained artifact `13236068551`, `bfss-v10h-f10cb-ordered-strict-plane-word-0ed5c9e8fe4847f50978929e639880daa207764b-1`, 3519 bytes, GitHub-reported ZIP SHA-256 `f3a9709d4870a85e7cbd5023b841f735aae9e1cd6e75928c45c312d99ffb6226`.

**Qualified mathematical content:** a single named chosen bijection `Fin 36 ≃ source9StrictPlaneIndex` enumerates each original increasing spatial pair exactly once. It is not asserted to be lexicographic or a computable label table. The parameter order is explicitly `List.finRange 36`. The word is the actual `spinGroup source9Quadratic` product of accepted source plane curves with their original labels, distinctness proofs and half-angle normalization; at zero it is the actual identity. The entire actual natural nine-matrix image has the full finite-parameter derivative at zero supplied by BZ. Evaluating in any direction gives the literal listed sum of the full native `E_rs - E_sr` planes, without a half factor.

The independent audit checks the exact original strict-pair equivalence type, bijectivity, unique preimages, literal row/column projections, distinct labels, list length 36, nodup, complete parameter-index coverage, actual Spin-group membership, equality to the literal ordered curve product, zero identity, the complete actual matrix `HasFDerivAt` statement, literal directional sum and separate matrix-unit normalization.

**Successful method:** reuse the inspected pinned finite-equivalence API and accepted BV/BZ interfaces with explicit finite parameters and source-label proofs. No additional Clifford norm instances, new structural instances, overloaded operator subtraction, custom limits or linter suppression were needed. This candidate passed on its first strict CI run. Earlier CA and BY failures remain evidence for their specific mechanisms; this green does not retroactively qualify any red run.

**Next bounded plan and ceiling:** define parameter transport through the chosen enumeration, then reindex CB's literal list sum into CA's strict-pair sum using pinned list/finite-sum and equivalence APIs. Prove equality with the underlying matrix of CA's linear model and/or prove that the upper-coordinate projection of the actual derivative is the corresponding parameter transport. Keep the fully typed map/evaluation bridges that succeeded previously. After this algebraic identity, establish the appropriate continuous linear equivalence with the standard finite-dimensional topologies before any inverse-function or chart argument. The derivative into the full ambient 9x9 matrix space is not claimed to be an isomorphism onto all matrices. Source local fiber/kernel control, subgroup charts, tangent Lie-algebra identifications, determinant/covering claims, the full F10BC manifold differential and BFSS physical conclusions remain open. No new mathematical candidate is introduced in this acceptance-only update.

## F10CC candidate — actual ordered derivative into the canonical native model

**Baseline:** live branch checked at `b35fe7abfda1c91c36b5b33a5d48db7e4230e346`, the documentation-only CB acceptance commit. Root AGENTS and current handoff reread. Previously checked ancestor instruction files are unchanged at this baseline. The new code imports accepted CB; all accepted sources remain unchanged.

**Bounded plan and implementation:** reuse Mathlib's `LinearEquiv.piCongrLeft'` to transport `Fin 36` parameter coordinates through the already chosen enumeration. Compose with CA's existing linear equivalence to canonical `LieAlgebra.Orthogonal.so SpaceIndex ℝ`. Convert CB's exact list sum via `Fin.sum_univ_def`, then use `Fintype.sum_equiv` with an explicit equality of each summand. Compose that equality with CB's actual matrix `fderiv` evaluation. Recover the original input coordinates from actual enumerated upper entries using CA's two-sided inverse and explicit typed equality bridges, and deduce injectivity. No ambient-matrix surjectivity, continuous linear equivalence, subgroup atlas or group-manifold differential is asserted.

**Pinned API inspection:** Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`. `LinearAlgebra/Pi.lean`, blob `bb28df575bc416f6a7820f54d0bab7e056f2dba1`, gives the complete dependent coordinate-transport signature and its forward function. `Algebra/BigOperators/Fin.lean`, blob `0925d3fd11f19650de9a7f095870f5d1382ff44a`, gives the additive `Fin.sum_univ_def` via `to_additive`. `Algebra/BigOperators/Group/Finset/Defs.lean`, blob `0eec64f2576f4d449b44b877678fe95678cfc9f0`, gives `Fintype.sum_equiv`, including its explicit summand-equality argument. `Group/Finset/Basic.lean` was also inspected, blob `c3b552527a22e70a3d2535dfa37841520dcba3b0`. Existing canonical model and derivative proofs are reused rather than introducing another skew carrier or coefficient reconstruction.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9StrictPlaneParameterEquiv`
2. `source9StrictPlaneParameterEquiv_apply`
3. `source9OrderedStrictPlaneModelEquiv`
4. `source9OrderedStrictPlane_sum_eq_model`
5. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_model`
6. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_upper`
7. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_injective`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CCOrderedDerivativeNativeModel.lean` | `d29e46f62d923da0c47cb14caf547ee0dc5fa31e` |
| `lean/diagnostics/FCP_K1D18V10HF10CCIndependentAudit.lean` | `2d550e34db5942dc6f712194339d543e9d31be21` |
| `.github/workflows/bfss-kotler-v10h-f10cc-ordered-derivative-native-model-strict.yml` | `53a2a102f6bbfc7dd7154e25b88bfeca1c5827b8` |

**Independent audit:** exact transport and canonical model equivalence types; literal inverse-enumeration parameter formula; model composition; literal list-sum equality; actual `fderiv` equality restated with CA's reconstruction on the explicit parameter function; exact upper-coordinate recovery; derivative injectivity; and existence of a derivative preimage for every canonical native skew matrix. The last check targets only canonical `so(9,ℝ)`, preserving the distinction from all ambient matrices.

**Verification discipline:** retain exact accepted pins through CB, pinned Lean 4.34.1/Mathlib, fresh compiler and independent audit with warnings-as-errors, exactly seven permitted root reports per phase, unchanged three-axiom whitelist and 840/600-second caps. No new instance, norm context, linter suppression, custom limit, gamma basis or carrier substitution. Local exact hashes, declaration/scope preflight, YAML parsing, workflow trigger paths, every shell block and both embedded Python blocks pass. Local Lean is unavailable; all seven CC roots remain candidates until strict CI succeeds.

**Next action and scientific ceiling:** inspect the exact fresh source and independent audit phases before qualification. If accepted, establish the appropriate continuous linear equivalence with the standard finite-dimensional topology and connect a coordinate-projected actual map to the inverse-function prerequisites. Source local fiber/kernel control, subgroup charts, tangent Lie-algebra identifications, determinant/covering claims, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all prior failures and accepted checkpoints.

## F10CC accepted — actual ordered derivative identified with canonical native model

**Verified strict result:** [run 41672054647](https://github.com/etblink/math/actions/runs/41672054647), tested `69ad47237d37a06c19ef9d93c84789b13aecc9cb`, attempt 1, job `126042721008`, completed/success with all ten recorded steps successful. Accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CB ancestry rebuild, fresh warnings-as-errors source compilation, independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CC_ORDERED_DERIVATIVE_NATIVE_MODEL_TYPES_AXIOMS_PASS`. Each of the seven expected fully qualified roots appears once in each fresh phase, fourteen reports total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error occurs. Exact run SHA and terminal state, every step, decoded log, terminal classifier, root multiplicities, axiom whitelist, artifact metadata and all three candidate blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CCOrderedDerivativeNativeModel.lean` | `d29e46f62d923da0c47cb14caf547ee0dc5fa31e` |
| `lean/diagnostics/FCP_K1D18V10HF10CCIndependentAudit.lean` | `2d550e34db5942dc6f712194339d543e9d31be21` |
| `.github/workflows/bfss-kotler-v10h-f10cc-ordered-derivative-native-model-strict.yml` | `53a2a102f6bbfc7dd7154e25b88bfeca1c5827b8` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9StrictPlaneParameterEquiv`
2. `source9StrictPlaneParameterEquiv_apply`
3. `source9OrderedStrictPlaneModelEquiv`
4. `source9OrderedStrictPlane_sum_eq_model`
5. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_model`
6. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_upper`
7. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_injective`

Retained artifact `13249996773`, `bfss-v10h-f10cc-ordered-derivative-native-model-69ad47237d37a06c19ef9d93c84789b13aecc9cb-1`, 3721 bytes, GitHub-reported ZIP SHA-256 `e17848c012f1ad4a0c64a8ce9d596cf8b8b16b6426c44806a007d660e1bb8639`.

**Qualified mathematical content:** `source9StrictPlaneParameterEquiv` transports `Fin 36` parameters through CB's existing chosen enumeration, with literal value `v (source9StrictPlaneEnumeration.symm p)`. Composing that transport with CA gives a real linear equivalence from `Fin 36 → ℝ` to the existing canonical `LieAlgebra.Orthogonal.so SpaceIndex ℝ`. CB's literal ordered native-plane sum equals the underlying matrix of this composed model. Consequently, the actual full natural-matrix `fderiv` of `source9OrderedStrictPlaneWord` at zero, evaluated in any direction, equals that model's underlying original nine-matrix value. Its entry at the original enumerated row/column is exactly the corresponding input parameter. The actual matrix derivative is injective.

The independent audit separately checks transport and model equivalence types, literal parameter transport, model composition, list-sum equality, the actual derivative equality restated with CA's reconstruction on an explicit parameter function, exact upper-coordinate recovery, injectivity and a derivative preimage for every canonical skew matrix. This establishes the stated algebraic model/range relationship, not surjectivity onto the full ambient matrix space.

**Successful method:** the inspected pinned `LinearEquiv.piCongrLeft'`, `Fin.sum_univ_def` and `Fintype.sum_equiv` interfaces compose directly with CA and CB. Explicit equality of each reindexed summand, typed coordinate extraction from CA's inverse law, and typed matrix-entry evaluation congruence succeed without broad overloaded rewrites. This candidate passed on its first strict run. No instance/norm context, linter suppression, custom proof limit, gamma basis or carrier replacement was introduced. Earlier red histories retain their original status.

**Next bounded plan and ceiling:** inspect and reuse the pinned finite-dimensional continuity APIs to promote the existing parameter/canonical model equivalence to the appropriate continuous linear equivalence with standard function/matrix-subspace topologies. Audit those topologies and the literal underlying linear map independently. Then formulate the actual ordered-word map's upper-coordinate projection and its derivative identity for the inverse-function prerequisites. These steps do not themselves supply source local fiber/kernel control or show that nearby source Spin elements are exhausted by the word chart. Subgroup charts, source local fiber/kernel control, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. No new theorem candidate is introduced in this acceptance-only update.

## F10CD candidate — continuous canonical native model with standard topologies

**Baseline:** live research branch checked at `6f83e3e4e43ba958df5d99b815bc830fdc64793d`, the documentation-only CC acceptance commit. Root AGENTS and current handoff reread. Previously checked ancestor instruction files are unchanged at this baseline. Accepted sources and verification records remain unchanged.

**Plan and implementation:** promote the existing `source9OrderedStrictPlaneModelEquiv` directly through Mathlib's `LinearEquiv.toContinuousLinearEquiv`. Use the standard topology on `Fin 36 → ℝ` and the canonical skew subtype induced by the original matrix entries; register no topology or norm instance. Prove the underlying linear equivalence is literally CC's qualified map, expose continuity forward and backward, restate CC's actual ambient-matrix derivative using the continuous model, and derive the inverse's original upper-entry formula by typed model/derivative/entry equalities. This does not define a subgroup atlas or a group-manifold differential.

**Pinned API inspection:** Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`. `Topology/Algebra/Module/FiniteDimension.lean`, blob `b145c6f6f798571ca4680cf424fa53796437524e`, gives the complete topological vector-space assumptions and the constructor `LinearEquiv.toContinuousLinearEquiv`. Its definition retains the same `e`, proves forward continuity by finite-dimensional linear-map continuity, and obtains finite dimensionality of the target from `e.finiteDimensional` to prove inverse continuity. `Analysis/Normed/Module/FiniteDimension.lean`, blob `7acfd4dbd8e38944b0e6b935086dda443187b532`, was also inspected; the more general topological constructor suffices here without adding a norm context.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9NativeSkewTopology_induced`
2. `source9OrderedStrictPlaneModelContinuousEquiv`
3. `source9OrderedStrictPlaneModelContinuousEquiv_toLinearEquiv`
4. `source9OrderedStrictPlaneModelContinuousEquiv_continuous`
5. `source9OrderedStrictPlaneModelContinuousEquiv_symm_continuous`
6. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_continuousModel`
7. `source9OrderedStrictPlaneModelContinuousEquiv_symm_apply`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CDContinuousNativeModel.lean` | `fa3049fae4e0392ea259e20184307c4edd0f08f9` |
| `lean/diagnostics/FCP_K1D18V10HF10CDIndependentAudit.lean` | `2647fa9273c035885b4edf8b805070d0ddc71ec4` |
| `.github/workflows/bfss-kotler-v10h-f10cd-continuous-native-model-strict.yml` | `4cb57cee4e10df03e758f486f53e38a5779aff9d` |

**Independent audit:** capture the standard matrix and parameter product topologies before opening the elementwise matrix norm scope, using the BZ-tested `@[instance_reducible] private def` style. Reflexive equalities check that the scoped matrix and parameter topologies remain those captured topologies and that canonical skew matrices have the induced matrix-entry topology. Check finite dimensionality of the actual parameter space and canonical model, the complete continuous-equivalence type, exact underlying CC linear equivalence and CA composition, continuity in each direction, inverse upper-coordinate formula, actual derivative equality and both-sided reconstruction on canonical skew matrices. No new instance definition or linter suppression is introduced.

**Verification discipline:** retain accepted ancestry pins through CC, pinned Lean 4.34.1/Mathlib, fresh compiler and independent audit with warnings-as-errors, unchanged 840/600-second caps, exactly seven expected root reports per phase and the same three-axiom whitelist (including genuine axiom-free reports as before). Local candidate hashes, source/audit declaration and scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is installed; all seven roots remain candidates until strict CI succeeds.

**Next action and scientific ceiling:** inspect the exact source and independent topology/type/axiom audit before qualification. If accepted, formulate the actual ordered-word map's upper-coordinate projection and prove the appropriate `HasFDerivAt` identity into the parameter model before considering inverse-function machinery. A continuous model of the derivative alone does not prove that nearby source Spin elements are exhausted by the word, identify the source tangent algebra or control the source local kernel. Subgroup charts, source local fiber/kernel control, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all prior negative evidence and accepted checkpoints.

## F10CD strict red — canonical Lie-subalgebra topological compatibility instance

**Immutable failed evidence:** [run 41700469209](https://github.com/etblink/math/actions/runs/41700469209), tested `16740234a1ce5ae39f42c69d8a73475d693a161b`, job `126142087370`, completed/failure. Pins, dependency restoration and accepted CC ancestry passed. Fresh CD source compilation failed; the independent audit was skipped and the final classifier did not run. Zero CD roots are qualified.

The first causal diagnostic is line 24:2: failed synthesis of `IsTopologicalAddGroup ↥(LieAlgebra.Orthogonal.so SpaceIndex ℝ)` while constructing `source9OrderedStrictPlaneModelEquiv.toContinuousLinearEquiv`. The later definitional/map-equality errors occur after this failed construction. The topology root reports only the permitted three axioms; the remaining six root reports contain compiler-recovery `sorryAx`. Those are invalid partial elaboration reports, not admissible theorem evidence. No source-level admission is present.

Retained artifact `13265388361`, `bfss-v10h-f10cd-continuous-native-model-16740234a1ce5ae39f42c69d8a73475d693a161b-1`, 1202 bytes, GitHub-reported ZIP SHA-256 `e61089a5cb1b612cdd9fc02fe8e54849ba5f55d45817eabb12290a05fe2ea270`. Failed source/audit/workflow blobs: `fa3049fae4e0392ea259e20184307c4edd0f08f9` / `2647fa9273c035885b4edf8b805070d0ddc71ec4` / `4cb57cee4e10df03e758f486f53e38a5779aff9d`.

**Pinned structural/API review:** at Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Topology/Algebra/Module/Basic.lean`, blob `5097dd7ae0d4e5c2eb3f8cb96adeb5bb188b83cd`, registers `Submodule.isTopologicalAddGroup` and itself uses `inferInstanceAs` on the underlying additive subgroup. Its deprecated `topologicalAddGroup` alias is not used. `Algebra/Lie/Subalgebra.lean`, blob `515b576ec709f978ebf32e85229a3b9fbaa15ff7`, exposes the canonical `toSubmodule` view, module structure through that view and reflexive carrier/membership equalities. This is a structure-search bridge, not a reason to change the model, topology or limits.

**Bounded repair:** explicitly import `Algebra.Lie.OfAssociative` and activate the existing associative matrix Lie-ring instance locally, following qualified BB/CA. Add uniquely named local compatibility instances `f10cdNativeSkewIsTopologicalAddGroup` and `f10cdNativeSkewContinuousSMul`, each derived by `inferInstanceAs` on `↥((LieAlgebra.Orthogonal.so SpaceIndex ℝ).toSubmodule)`. These prove topological compatibility of the existing operations/topology; neither installs a topology nor a norm. The scalar-continuity control discharges the other topological-vector-space compatibility premise of the same inspected constructor. The audit independently derives both standard submodule controls, rather than inheriting the source's local instance attributes.

All seven declaration signatures and the entire original source body from the first theorem onward are byte-identical to the failed candidate. The continuous-equivalence constructor and every mathematical proof body are unchanged. Existing audit controls are retained with the two independent structural controls added. No limit, linter, axiom or standard-topology change. The workflow's instance guard now permits exactly the two named local structural derivations in source, none in the audit, and checks their standard submodule bodies; it continues to reject other instance declarations.

Repaired source/audit/workflow:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CDContinuousNativeModel.lean` | `b0f54834164eb031b880a6f96aa276cfac031f3b` |
| `lean/diagnostics/FCP_K1D18V10HF10CDIndependentAudit.lean` | `cd034f48ca310be62c95f0fc5a26158980744224` |
| `.github/workflows/bfss-kotler-v10h-f10cd-continuous-native-model-strict.yml` | `b0882dab41de5f6e66ca83af5dc025dd7335371d` |

**Validation and next action:** local exact hashes, unchanged seven signatures and mathematical source body, declaration/scope guard, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available. Run complete fresh compilation and the independent topology/type/axiom audit with the unchanged 840/600-second caps and three-axiom whitelist. Do not qualify CD on partial reports or treat downstream constructor errors as separate mathematical counterexamples. If the next run identifies another structural premise, isolate its exact standard-submodule control; retain the same carrier and standard topology. Continuity acceptance, charts, source local fiber/kernel control, tangent identifications and full F10BC manifold differential remain pending.

## F10CD accepted — continuous canonical native model and exact inverse coordinates

**Verified strict result:** [run 41706060408](https://github.com/etblink/math/actions/runs/41706060408), tested `3061ea5b8337209d71f600427f5f544f3bc23bba`, attempt 1, job `126161565130`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CC rebuild, fresh warnings-as-errors source compilation, independent topology/type/axiom audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CD_CONTINUOUS_NATIVE_MODEL_TYPES_AXIOMS_PASS`. Each of the seven expected fully qualified roots appears exactly once per fresh phase, fourteen total. Every report uses only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The failed first CD run remains red and does not become qualified retroactively.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CDContinuousNativeModel.lean` | `b0f54834164eb031b880a6f96aa276cfac031f3b` |
| `lean/diagnostics/FCP_K1D18V10HF10CDIndependentAudit.lean` | `cd034f48ca310be62c95f0fc5a26158980744224` |
| `.github/workflows/bfss-kotler-v10h-f10cd-continuous-native-model-strict.yml` | `b0882dab41de5f6e66ca83af5dc025dd7335371d` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9NativeSkewTopology_induced`
2. `source9OrderedStrictPlaneModelContinuousEquiv`
3. `source9OrderedStrictPlaneModelContinuousEquiv_toLinearEquiv`
4. `source9OrderedStrictPlaneModelContinuousEquiv_continuous`
5. `source9OrderedStrictPlaneModelContinuousEquiv_symm_continuous`
6. `source9OrderedStrictPlaneWord_matrix_fderiv_zero_continuousModel`
7. `source9OrderedStrictPlaneModelContinuousEquiv_symm_apply`

Retained artifact `13266098351`, `bfss-v10h-f10cd-continuous-native-model-3061ea5b8337209d71f600427f5f544f3bc23bba-1`, 3780 bytes, GitHub-reported ZIP SHA-256 `96bdcaccb7ab7cf81b74af53d507b3409a7d59d78d3362299997f6e632bee6c7`. Exact tested SHA and run state, all step verdicts, decoded log, terminal classifier, root multiplicities, axiom whitelist, artifact metadata and all three candidate blob identities were inspected before acceptance.

**Qualified mathematical content:** `source9OrderedStrictPlaneModelContinuousEquiv` has type `(Fin 36 → ℝ) ≃L[ℝ] LieAlgebra.Orthogonal.so SpaceIndex ℝ`. Its underlying linear equivalence is literally CC's already qualified model. Both it and its inverse are continuous. Canonical skew matrices retain the topology induced by original matrix entries; the audit captures the standard parameter and matrix product topologies before opening the elementwise norm scope and checks the resulting topologies by reflexivity. The inverse evaluates a canonical skew matrix at the original enumerated upper row/column. The actual ambient natural-matrix derivative of the chosen ordered source word remains exactly the underlying matrix of this continuous model in every direction.

The independent audit also checks finite dimensionality of the actual parameter and canonical skew spaces, the full continuous-equivalence type, exact CC linear map and CA composition, continuity in both directions, inverse coordinates, actual derivative equality, and canonical target reconstruction. There is no surjectivity claim onto all ambient 9x9 matrices and no change to the standard topology or any norm instance.

**Repair outcome and method:** the canonical Lie-subalgebra carrier needed explicit compatibility structures for typeclass search. The uniquely named local instances derive `IsTopologicalAddGroup` and `ContinuousSMul` through the existing canonical `toSubmodule` view, with Mathlib's associative matrix Lie-ring instance activated locally as in BB/CA. Independent audit controls derive the standard submodule structures afresh. With that bounded bridge, all later construction/map-equality errors disappeared while the original seven signatures and mathematical source bodies stayed byte-identical. The combined repair passed; the necessity of the additional scalar-continuity control was not isolated by ablation. No linter suppression, limit increase, source/gamma replacement, topology replacement or norm reconstruction was used. Preserve the missing-instance diagnosis as the first cause of the red, and the later recovery reports as invalid partial elaborations.

**Next bounded plan and ceiling:** inspect the pinned Pi/projection composition derivative APIs and define the actual ordered-word natural matrix map's enumerated upper-coordinate projection into `Fin 36 → ℝ`. Prove its value at zero and full `HasFDerivAt` with the literal identity continuous linear map, using CC's coordinate-recovery theorem and fully typed evaluation/composition bridges. Only after these exact interfaces are qualified should inverse-function prerequisites be assembled. A continuous equivalence between the parameter and skew models does not prove that the word exhausts nearby source Spin elements or control the source local kernel. Subgroup charts, source local fiber/kernel control, tangent Lie-algebra identifications, determinant/covering results, full F10BC manifold differential and BFSS physical conclusions remain open. No new theorem candidate is introduced in this acceptance-only update.

## F10CE candidate — actual upper-coordinate map with identity derivative

**Baseline:** live research branch checked at `ae12460c2c08d471186d18296b6b42be1067cb9e`, the documentation-only CD acceptance commit. Root AGENTS and current handoff reread; previously checked ancestor instruction files are unchanged at this baseline. Accepted source/audit modules and red histories remain unchanged.

**Bounded implementation:** construct `source9OrderedUpperProjection` as a continuous linear Pi family of two explicitly typed coordinate projections on the original nine-matrix carrier. Define `source9OrderedUpperCoordinateMap` by applying this projection to the actual `source9SpinVectorOrthogonalHom` image of the actual `source9OrderedStrictPlaneWord`. Prove its zero value using the actual word identity and distinct original row/column labels. Prove equality of continuous linear maps `projection.comp wordVelocity = ContinuousLinearMap.id ℝ (Fin 36 → ℝ)` using CB's exact matrix derivative and CC's coordinate recovery, with fully typed evaluation congruence. Apply the actual chain rule to obtain the full `HasFDerivAt` statement with literal identity derivative and its `fderiv` equality.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Analysis/Calculus/FDeriv/Linear.lean`, blob `f0f78fdab141575c21f16a99dc2d1f88a62674dd`, supplies `ContinuousLinearMap.hasFDerivAt`. `Analysis/Calculus/FDeriv/Comp.lean`, blob `d7dee1ff3320db9442853106989cda47b2c0a221`, supplies `HasFDerivAt.comp`; its section explicitly makes the evaluation point an argument. The source uses `.comp (0 : Fin 36 → ℝ)` following this full signature and the accepted BY projection pattern. Standard continuous-linear Pi/projection constructions are the same inspected interfaces used in accepted BZ.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperProjection`
2. `source9OrderedUpperProjection_apply`
3. `source9OrderedUpperCoordinateMap`
4. `source9OrderedUpperCoordinateMap_zero`
5. `source9OrderedUpperProjection_wordVelocity`
6. `source9OrderedUpperCoordinateMap_hasFDerivAt_zero`
7. `source9OrderedUpperCoordinateMap_fderiv_zero`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CEUpperCoordinateIdentityDerivative.lean` | `4793e7633f71e1a68071314697bfa42f4f727f20` |
| `lean/diagnostics/FCP_K1D18V10HF10CEIndependentAudit.lean` | `a42a5499acff2569a8ea96c39a479ceca2462cb1` |
| `.github/workflows/bfss-kotler-v10h-f10ce-upper-coordinate-identity-derivative-strict.yml` | `f638ebd7ae04ca5e195607460dd2ba63d7fdd64d` |

**Independent audit:** capture the standard parameter/matrix product topologies with the BZ-tested reducibility attribute and check that opening the elementwise matrix norm scope preserves them. Check the complete projection CLM type and literal entry evaluation, projection of the identity matrix to zero, the literal actual-word upper entries, actual zero value, exact composition identity of CLMs, `HasFDerivAt` for the completely expanded actual function with the literal identity CLM, `fderiv` equality and its directional value `v ↦ v`. Directional evaluation uses typed congruence, avoiding an extra tactic after a potentially closed rewrite.

**Verification discipline:** retain accepted ancestry pins through CD and the qualified CD source/audit blobs, rebuild CD, then compile CE and its independent audit freshly with warnings-as-errors. Require exactly seven expected permitted root reports per phase, with unchanged three-axiom whitelist and 840/600-second caps. CE introduces no instance, new norm or topology, gamma/carrier replacement, linter suppression or proof-limit change. Local exact hashes, source/audit scope and declaration preflight, YAML, trigger paths, all shell blocks and both embedded Python blocks pass. Local Lean is unavailable; no CE root is qualified until strict CI succeeds.

**Next action and ceiling:** inspect the exact fresh source and independent topology/type/axiom audit before acceptance. If accepted, inspect the pinned strict-derivative/smoothness and inverse-function APIs. An ordinary `HasFDerivAt` with identity derivative at one point alone is not sufficient for a local inverse theorem; supply the appropriate strict differentiability or neighborhood smoothness hypothesis explicitly, reusing the existing actual-word smoothness results. Any resulting finite-parameter local inverse must remain separate from source Spin coverage, local kernel control and a subgroup atlas. Tangent identifications, determinant/covering statements, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all previous negative evidence.

## F10CE strict red — deprecated conditional alias under warnings-as-errors

**Immutable failed evidence:** [run 41712069481](https://github.com/etblink/math/actions/runs/41712069481), tested `d076a97be761711f7e7d0fea110a8b84857f04b9`, job `126182400204`, completed/failure. Candidate/accepted pins, pinned environment restoration and accepted CD rebuild passed. Fresh CE source compilation failed; the independent audit was skipped and the terminal classifier did not run. Zero CE roots are qualified.

The only source-level diagnostic is line 42:31: `if_neg` is deprecated; use `ite_eq_right`. All seven source root reports contain only `propext`, `Classical.choice`, and `Quot.sound`, with no `sorryAx`. Those clean partial reports do not replace successful source compilation and the complete independent audit. The identical old alias was also present in the not-yet-run audit's identity-matrix projection control.

Retained artifact `13270242308`, `bfss-v10h-f10ce-upper-coordinate-identity-derivative-d076a97be761711f7e7d0fea110a8b84857f04b9-1`, 787 bytes, GitHub-reported ZIP SHA-256 `a9680a498d514cf89a26cb809c9e17e6c39ecf98ea65c196204dd884c7c38d00`. Failed source/audit/workflow blobs: `4793e7633f71e1a68071314697bfa42f4f727f20` / `a42a5499acff2569a8ea96c39a479ceca2462cb1` / `f638ebd7ae04ca5e195607460dd2ba63d7fdd64d`.

**Bounded repair and recurrence control:** replace the single `if_neg (source9StrictPlaneEnumeration_ne i)` occurrence in each Lean file with the compiler-recommended `ite_eq_right` form. Static comparison confirms those are the only changes to either Lean file; all definitions, seven signatures, proof logic and independent mathematical controls are retained. Update both exact hash pins. The declaration/scope preflight now rejects `if_pos`, `if_neg`, `dif_pos` and `dif_neg` in candidate/audit code, after comments are stripped. This addresses the same conditional-alias family that previously caused CA's `dif_pos` failure. The guard is a targeted early check; warnings-as-errors remain the authoritative compiler check for other API changes. No linter suppression, limit increase, norm/topology change or statement weakening.

Repaired source/audit/workflow:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CEUpperCoordinateIdentityDerivative.lean` | `e61f10d8b5726a84dd1fadc55e15318f3c40b158` |
| `lean/diagnostics/FCP_K1D18V10HF10CEIndependentAudit.lean` | `b8e6f1956f984f02aabfae550e1a91e4bc61d0ba` |
| `.github/workflows/bfss-kotler-v10h-f10ce-upper-coordinate-identity-derivative-strict.yml` | `8b5e1d7312493f75bf2c8a6a9bebac668f77bd64` |

**Validation and next action:** exact candidate hashes, source/audit alias-only comparison, declaration/scope/legacy-alias preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. Local Lean is unavailable. Run complete fresh source compilation and the independent topology/type/axiom audit with unchanged 840/600-second caps, seven expected roots per phase and the same three-axiom whitelist. CE remains pending until the entire gate passes. Strict differentiability or suitable smoothness must still be established before inverse-function use; source coverage, local kernel control, subgroup charts, tangent identification and full F10BC manifold differential remain open.

## F10CE second strict red — explicit scalar and literal-function audit bridges

**Immutable evidence:** [run 41718384697](https://github.com/etblink/math/actions/runs/41718384697), tested `04e600cda1cb2f4b6942cb2bd078196c4a4eb4ab`, job `126204310830`, completed/failure. Pins, pinned environment restoration, accepted CD rebuild and fresh warnings-as-errors CE source compilation passed. The original deprecated-alias failure is resolved. The independent audit failed; the terminal classifier did not run. Zero CE roots are qualified.

The audit at line 22 left the scalar goal `0 = 0 i` in the identity-matrix projection control because its explicit `simp only` set did not reduce the pointwise zero function. Lines 30 and 44 hit the default recursion-depth limit while comparing the expanded literal actual-word upper-entry function to the named coordinate map, first through `rfl` and then by direct application of the derivative theorem. Both fresh output phases printed all seven roots, fourteen total, with only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`. These source-root reports do not certify failed anonymous audit controls.

Artifact `13271759586`, `bfss-v10h-f10ce-upper-coordinate-identity-derivative-04e600cda1cb2f4b6942cb2bd078196c4a4eb4ab-1`, 1366 bytes, GitHub-reported ZIP SHA-256 `d978215e3bb6356b2e87091e662b187485c4779aae8972b7b043f9758762a77c`. Failed source/audit/workflow blobs: `e61f10d8b5726a84dd1fadc55e15318f3c40b158` / `b8e6f1956f984f02aabfae550e1a91e4bc61d0ba` / `8b5e1d7312493f75bf2c8a6a9bebac668f77bd64`.

**Bounded audit-only repair:** after function extensionality, expose the identity-matrix projection goal with explicit scalar `(0 : ℝ)`. Prove a private `auditActualUpperCoordinateMap_eq` naming the equality between the coordinate map and the fully expanded actual-word matrix-entry function. Its proof unfolds only the map wrapper and applies the existing typed projection theorem to the actual matrix argument. Obtain the entry control by evaluation congruence on this equality. Rewrite the accepted `HasFDerivAt` theorem through this named function equality before checking the identical fully literal audit proposition. This replaces expensive definitional comparisons with explicit proposition bridges, following prior BW/BY recovery practice. The default recursion limit is retained.

Source blob stays exactly `e61f10d8b5726a84dd1fadc55e15318f3c40b158`; no mathematical source file or declaration statement is changed. The complete literal actual-function `HasFDerivAt` audit, identity CLM, topology checks, zero controls and directional evaluation remain required. The workflow updates the audit pin and checks that the named bridge and explicit rewrite are present; the legacy-alias guard and all strict policies remain active.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/diagnostics/FCP_K1D18V10HF10CEIndependentAudit.lean` | `22d23f1f272a14f8067f51524e4c17a6c138e72a` |
| `.github/workflows/bfss-kotler-v10h-f10ce-upper-coordinate-identity-derivative-strict.yml` | `3b07098a7927bde883befa0e53d205057404aae3` |

**Validation and next action:** unchanged source hash, exact audit hash, declaration/scope and legacy-alias guard, YAML, trigger paths, all shell blocks and both embedded Python blocks pass. No local Lean executable is installed. Require complete fresh source and independent audit success under unchanged 840/600-second caps, seven expected root reports in each phase and the three-axiom whitelist. Preserve this audit-only red independently of the first source-deprecation red. If another deep comparison appears, isolate that comparison with a typed interface bridge before considering any limit change. Strict differentiability/smoothness for inverse-function use, source coverage, local kernel control, charts, tangent identifications and full F10BC manifold differential remain open.

## F10CE accepted — actual upper-coordinate map has literal identity derivative at zero

**Verified strict result:** [run 41725353183](https://github.com/etblink/math/actions/runs/41725353183), tested `abcd11965c65ae64739c460cb5dbb3148f30e236`, attempt 1, job `126228570270`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CD rebuild, fresh warnings-as-errors CE source compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CE_UPPER_COORDINATE_IDENTITY_DERIVATIVE_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the seven expected fully qualified roots, each once per phase, fourteen reports total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. There is no `sorryAx` or source-level warning/error. Exact tested SHA and run state, every step, decoded log, terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three candidate blob identities were inspected before acceptance. Both prior CE runs remain strict failures.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CEUpperCoordinateIdentityDerivative.lean` | `e61f10d8b5726a84dd1fadc55e15318f3c40b158` |
| `lean/diagnostics/FCP_K1D18V10HF10CEIndependentAudit.lean` | `22d23f1f272a14f8067f51524e4c17a6c138e72a` |
| `.github/workflows/bfss-kotler-v10h-f10ce-upper-coordinate-identity-derivative-strict.yml` | `3b07098a7927bde883befa0e53d205057404aae3` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperProjection`
2. `source9OrderedUpperProjection_apply`
3. `source9OrderedUpperCoordinateMap`
4. `source9OrderedUpperCoordinateMap_zero`
5. `source9OrderedUpperProjection_wordVelocity`
6. `source9OrderedUpperCoordinateMap_hasFDerivAt_zero`
7. `source9OrderedUpperCoordinateMap_fderiv_zero`

Retained artifact `13275559334`, `bfss-v10h-f10ce-upper-coordinate-identity-derivative-abcd11965c65ae64739c460cb5dbb3148f30e236-1`, 3699 bytes, GitHub-reported ZIP SHA-256 `8c307fc17821deb7c475a2de72beb1a196805d527a51b98db57fc7be37f0ba83`.

**Qualified mathematical content:** `source9OrderedUpperProjection` is a continuous linear map from the original nine-matrix space to `Fin 36 → ℝ`, evaluating each original enumerated upper entry. `source9OrderedUpperCoordinateMap` applies it to the actual natural orthogonal image matrix of the actual ordered source word. This actual finite-parameter map takes zero to zero. The projection composed with the accepted matrix word velocity is exactly `ContinuousLinearMap.id ℝ (Fin 36 → ℝ)`. Consequently, the entire actual upper-coordinate map has `HasFDerivAt` at zero with the literal identity CLM and its `fderiv` there equals that identity.

The independent audit checks standard parameter/matrix product topologies, complete projection type and literal entries, projection of the identity matrix to zero, the actual word's literal upper-entry function, zero value, exact CLM composition identity, `HasFDerivAt` restated on the completely expanded actual function with the literal identity CLM, the exact `fderiv` equality and directional value `v ↦ v`. The explicit private function-equality bridge is proved from the typed projection theorem and then used to rewrite the derivative statement; the literal audit proposition is preserved.

**Recovery outcome and method:** replacing the deprecated conditional alias in source and audit resolved the first red; the early guard against the four legacy conditional aliases remains active. The second run demonstrated full source success but failed independent controls. Exposing a scalar zero and using a named actual-function equality resolved those controls without raising recursion limits. The mathematical source blob `e61f10d8b5726a84dd1fadc55e15318f3c40b158` stayed unchanged through the successful audit-only repair. No theorem was weakened, no audit obligation dropped, and no instance, norm/topology, linter or proof-limit change was introduced. Clean partial root printouts never replaced complete audit success.

**Next bounded plan and ceiling:** inspect pinned strict-derivative and smoothness APIs, and reuse BV's actual finite-word vector-action smoothness plus the original coordinate-column/matrix-entry bridges to obtain appropriate smoothness or strict differentiability of this exact upper-coordinate map. Qualify a strict identity-derivative statement or the necessary neighborhood regularity before invoking inverse-function machinery. An ordinary identity derivative at one point alone does not justify a local inverse. Any resulting parameter-space local inverse remains separate from proving source Spin coverage, local kernel control or a subgroup atlas. Tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. No new theorem candidate is introduced in this acceptance-only update.

## F10CF candidate — actual smooth upper-coordinate map and strict identity derivative

**Baseline:** live research branch checked at `a6d1a92e941ec982bee3f01a8cb70e37d53e1bdc`, the documentation-only CE acceptance commit. Root AGENTS and current handoff reread; previously checked ancestor instruction files are unchanged at this baseline. Accepted source and independent-audit modules remain unchanged.

**Bounded plan and implementation:** obtain every-order smoothness of each original coordinate-column action by composing BV's qualified actual finite-word/vector joint smoothness with `t ↦ (t, source9CoordinateVector j)`. Use a general actual natural-matrix entry equality on a source group variable to bridge to matrix entries, then assemble the whole matrix map with two Pi smoothness criteria. Compose with CE's actual continuous upper projection. Specialize to `ContDiffAt ℝ (1 : ℕ∞ω)` at zero and apply the inspected real/complex strict-derivative constructor to CE's qualified literal identity `HasFDerivAt`. The target remains the exact actual upper-coordinate map; no surrogate model function replaces it.

**Pinned API review:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Analysis/Calculus/ContDiff/Basic.lean`, blob `cbed95fb0f6362777de54bccea7a4854f2292029`: continuous-linear-map smoothness and smooth product pairing.
- `Analysis/Calculus/ContDiff/Operations.lean`, blob `80e898b98348cb111761430989137705f4a3cf63`: exact `contDiff_apply` and `contDiff_pi` interfaces.
- `Analysis/Calculus/ContDiff/RCLike.lean`, blob `dff89ca9f7fee6191d8496a39a7aa2b1426fb6f0`: `ContDiffAt.hasStrictFDerivAt'` accepts the specified ordinary derivative and a nonzero regularity order. Use order one and `one_ne_zero`; do not infer strict differentiability from CE alone.
- Read-only reconnaissance of `InverseFunctionTheorem/ContDiff.lean`, blob `add6679659423f2fa4d6ac3f2150ade77e93d7ae`, confirms the next local-inversion API route. No inverse-function construction is introduced in CF.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9NaturalMatrix_entry_eq_vectorConjugation`
2. `source9OrderedStrictPlaneWord_column_contDiff`
3. `source9OrderedStrictPlaneWord_matrix_entry_contDiff`
4. `source9OrderedStrictPlaneWord_matrix_contDiff`
5. `source9OrderedUpperCoordinateMap_contDiff`
6. `source9OrderedUpperCoordinateMap_contDiffAt_one_zero`
7. `source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CFSmoothStrictUpperCoordinateMap.lean` | `dee9feb80e2ae02ea6b639daaa1133409bf9b3cb` |
| `lean/diagnostics/FCP_K1D18V10HF10CFIndependentAudit.lean` | `dab723eea335c83d7824a16f59acd55e6b39d713` |
| `.github/workflows/bfss-kotler-v10h-f10cf-smooth-strict-upper-coordinate-map-strict.yml` | `3235a045496abfcb48805aeb0945778ec0d85246` |

**Independent audit:** standard parameter and matrix product topologies with the accepted class-definition reducibility style; exact actual group-variable matrix-entry/vector-action bridge; every-order original coordinate-column action, matrix-entry and full matrix smoothness; every-order smoothness of both the named map and the completely expanded literal actual function; order-one regularity at zero; `HasStrictFDerivAt` of both functions with the literal identity CLM; and recovery of the ordinary identity derivative from the strict one. The audit proves a named literal-function equality through the typed projection API before rewriting smoothness/strict derivative statements, preserving CE's successful recovery method and avoiding deep definitional comparisons.

**Verification discipline:** retain accepted ancestry pins through CE, including its repaired source/audit; rebuild CE, then compile CF and its independent audit freshly with warnings-as-errors. Require exactly seven permitted root reports in each phase, unchanged three-axiom whitelist and 840/600-second caps. No new instance, Clifford norm context, topology, gamma/carrier replacement, linter suppression or custom limit is introduced. The legacy conditional-alias guard remains active. Local exact hashes, declaration/scope preflight, YAML, trigger paths, all shell blocks and both embedded Python blocks pass. Local Lean is unavailable; all seven CF roots remain candidates until complete strict CI succeeds.

**Next action and ceiling:** inspect both exact fresh Lean phases before qualification. If accepted, use the strict literal identity derivative and standard finite-parameter completeness to construct the appropriate local inverse or open partial homeomorphism for the actual upper-coordinate map, auditing its exact forward function and source/target neighborhoods. A parameter-space local inverse does not prove source Spin coverage, source local kernel control or a subgroup atlas. Tangent Lie-algebra identifications, determinant/covering statements, full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all earlier negative evidence.

## F10CF strict red — normalize the composition hypothesis before the entry rewrite

**Immutable evidence:** [run 41733830143](https://github.com/etblink/math/actions/runs/41733830143), tested `d16d0e375426bd2085f1eb42cbe736e957176cbe`, job `126257749635`, completed/failure. Pins, environment restoration and accepted CE rebuild passed. Fresh CF source compilation failed; the independent audit was skipped and the terminal classifier did not run. Zero CF roots are qualified.

The sole source diagnostic is line 54:6: the rewrite `rw [← heq] at h` cannot find the literal lambda in `h`, whose function is still `(fun f => f i) ∘ columnAction`. The proposition equality `heq` instead describes `fun t => columnAction t i`. Although these functions are definitionally equal, the rewrite matcher does not expose the composition in this occurrence. The first two roots print only the permitted axioms; the five downstream roots contain compiler-recovery `sorryAx` after the failed entry proof. Those are invalid partial reports, not source admissions or qualification.

Artifact `13276954441`, `bfss-v10h-f10cf-smooth-strict-upper-coordinate-map-d16d0e375426bd2085f1eb42cbe736e957176cbe-1`, 1003 bytes, GitHub-reported ZIP SHA-256 `edc65e053c3995840659e8d43ee8d6c05bea799a12e6334265856abb34e058ee`. Failed source/audit/workflow blobs: `dee9feb80e2ae02ea6b639daaa1133409bf9b3cb` / `dab723eea335c83d7824a16f59acd55e6b39d713` / `3235a045496abfcb48805aeb0945778ec0d85246`.

**Bounded repair:** immediately after composing the smooth evaluation map with the smooth actual column action, use a fully typed `change ContDiff ℝ n (fun t : Fin 36 → ℝ => source9SpinVectorConjugation (source9OrderedStrictPlaneWord t) (source9CoordinateVector j) i) at h`. Then apply the existing named entry-function equality and finish as before. This exposes only the beta-reduced composition shape; no actual source word, carrier, regularity order or derivative is replaced. Static comparison confirms that these three lines are the only mathematical source change and that all seven theorem signatures are identical. The independent audit remains byte-identical.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CFSmoothStrictUpperCoordinateMap.lean` | `18dfa7cb7391446b72658036730ae98f990d809d` |
| `.github/workflows/bfss-kotler-v10h-f10cf-smooth-strict-upper-coordinate-map-strict.yml` | `db5c0c83e001fe4ad2d7fbb1662e4d879734daa4` |

The workflow updates only the source pin and adds a preflight check for the explicit shape bridge. All warning/linter rules, legacy conditional-alias guard, three-axiom whitelist, seven expected root reports per phase and 840/600-second caps remain. Local exact hashes, unchanged seven signatures, unchanged audit hash, declaration/scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available.

**Next action and ceiling:** inspect complete fresh source and independent literal-function smoothness/strict-derivative audit before qualification. Treat a composition/lambda mismatch as an explicit interface obligation; do not repeat the same rewrite against the unnormalized hypothesis or raise limits. Parameter-space local inversion, source Spin coverage/local kernel control, subgroup charts, tangent identifications, determinant/covering results, full F10BC manifold differential and BFSS physical conclusions remain open. Preserve this red separately from CE's earlier audit failures.

## F10CF accepted — actual upper-coordinate smoothness and strict identity derivative

**Verified strict result:** [run 41735793415](https://github.com/etblink/math/actions/runs/41735793415), tested `31aa83a26375c40a13dc6decf414c62baab15d5f`, attempt 1, job `126264522476`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CE rebuild, fresh warnings-as-errors CF compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CF_SMOOTH_STRICT_UPPER_COORDINATE_MAP_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the seven expected fully qualified roots, each once per phase, fourteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. Exact tested SHA and run state, all step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three candidate blob identities were checked before acceptance. The first CF run remains a strict source failure.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CFSmoothStrictUpperCoordinateMap.lean` | `18dfa7cb7391446b72658036730ae98f990d809d` |
| `lean/diagnostics/FCP_K1D18V10HF10CFIndependentAudit.lean` | `dab723eea335c83d7824a16f59acd55e6b39d713` |
| `.github/workflows/bfss-kotler-v10h-f10cf-smooth-strict-upper-coordinate-map-strict.yml` | `db5c0c83e001fe4ad2d7fbb1662e4d879734daa4` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9NaturalMatrix_entry_eq_vectorConjugation`
2. `source9OrderedStrictPlaneWord_column_contDiff`
3. `source9OrderedStrictPlaneWord_matrix_entry_contDiff`
4. `source9OrderedStrictPlaneWord_matrix_contDiff`
5. `source9OrderedUpperCoordinateMap_contDiff`
6. `source9OrderedUpperCoordinateMap_contDiffAt_one_zero`
7. `source9OrderedUpperCoordinateMap_hasStrictFDerivAt_zero`

Retained artifact `13280091046`, `bfss-v10h-f10cf-smooth-strict-upper-coordinate-map-31aa83a26375c40a13dc6decf414c62baab15d5f-1`, 3731 bytes, GitHub-reported ZIP SHA-256 `2acb61f8646bfcb188590189981c85dfee298a1991ff749551903be240c455e0`.

**Qualified mathematical content:** for every regularity order `n : ℕ∞ω`, the actual ordered source word's action on each fixed original coordinate vector is `ContDiff ℝ n`. The general actual natural-matrix entry/vector-conjugation bridge then gives every-order smoothness of all matrix entries and the entire actual underlying nine-matrix map. Composing with CE's actual continuous upper projection proves `ContDiff ℝ n source9OrderedUpperCoordinateMap`. In particular, the actual map is order-one smooth at zero. Combining this with CE's specified ordinary derivative through the inspected `ContDiffAt.hasStrictFDerivAt'` API proves `HasStrictFDerivAt source9OrderedUpperCoordinateMap (ContinuousLinearMap.id ℝ (Fin 36 → ℝ)) 0`.

The independent audit checks the standard parameter/matrix product topologies, original coordinate-column and actual matrix-entry interfaces, full matrix smoothness, smoothness of the named and completely expanded literal actual upper-coordinate map, order-one regularity at zero, the strict identity derivative for both functions, and recovery of the ordinary identity derivative from the strict result. The named literal-function equality bridge remains explicit and independently proved from the typed projection theorem.

**Successful method and repair outcome:** reuse of BV's joint actual vector-action smoothness, typed product pairing, coordinate evaluation and two Pi assembly steps suffices; no new Clifford norm instance or normed-ring estimate is required. The first source rewrite failed only because its hypothesis retained composition syntax. Exposing the explicitly typed beta-reduced lambda before rewriting resolved that failure. All seven statements, the independent audit and strict limits remained unchanged. Explicit argument/function-shape bridges continue to succeed where an unnormalized rewrite does not. No linter suppression, custom proof limit, gamma/carrier replacement or topology change was introduced.

**Next bounded plan and ceiling:** inspect the pinned inverse-function constructor and instantiate the actual upper-coordinate map with its strict literal identity derivative, the identity continuous linear equivalence and standard finite-parameter completeness. Construct a parameter-space local inverse or open partial homeomorphism and independently check its exact forward function, zero source/target neighborhood membership and local inverse identities. This step must not infer that nearby source Spin elements are exhausted by the word image; source local fiber/kernel control and subgroup-chart coverage remain separate obligations. Tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. No new theorem candidate is introduced in this acceptance-only update.

## F10CG candidate — actual upper-coordinate parameter-space local inverse

**Baseline:** live research branch checked at `0a9d9f3d2f72a4896cf5b132dc1f1fb86768cb7f`, the documentation-only CF acceptance commit. Root AGENTS and current handoff reread; previously checked ancestor instruction files are unchanged at this baseline. Accepted source and independent-audit modules remain unchanged.

**Bounded implementation:** expose CF's strict identity derivative using the explicitly typed identity continuous linear equivalence `ContinuousLinearEquiv.refl ℝ (Fin 36 → ℝ)`. Instantiate the pinned `HasStrictFDerivAt.toOpenPartialHomeomorph` constructor on the exact actual `source9OrderedUpperCoordinateMap`, with that equivalence passed explicitly as `f'`. The resulting object has type `OpenPartialHomeomorph (Fin 36 → ℝ) (Fin 36 → ℝ)`. Prove the complete forward-function equality, zero membership in source and target, and inverse identities with explicit neighborhood membership hypotheses. Use typed function evaluation/congruence and the forward-function equality when transporting the generic inverse laws to the actual map.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`, blob `e628f119f19643501a84e461c29575ff1365d511`: complete constructor signature, explicit forward function, invertible strict derivative, `CompleteSpace` domain requirement, source/target membership and forward-function theorem.
- `Topology/OpenPartialHomeomorph/Defs.lean`, blob `9754374286e46a881a41d0977869a571d2353e79`: open source/target and complete `left_inv`/`right_inv` signatures with membership assumptions.
- `Topology/OpenPartialHomeomorph/Continuity.lean`, blob `54b56e1b8b657b0417e16ed2e823b6f8aa757f03`: inverse continuity at each target point, used in the independent zero control.

Seven pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl`
2. `source9OrderedUpperCoordinateLocalHomeomorph`
3. `source9OrderedUpperCoordinateLocalHomeomorph_coe`
4. `source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source`
5. `source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target`
6. `source9OrderedUpperCoordinateLocalHomeomorph_left_inv`
7. `source9OrderedUpperCoordinateLocalHomeomorph_right_inv`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CGUpperCoordinateLocalInverse.lean` | `0d4ff0b02af7fc5e007b2943f03c72300720aafd` |
| `lean/diagnostics/FCP_K1D18V10HF10CGIndependentAudit.lean` | `1c3e79574861ab27f1564d648bc6e81ac20b51ed` |
| `.github/workflows/bfss-kotler-v10h-f10cg-upper-coordinate-local-inverse-strict.yml` | `f3a53ccada95bc77923e3a5e6456a36df6d0ebb7` |

**Independent audit:** standard parameter product topology, actual `CompleteSpace (Fin 36 → ℝ)`, literal equality of the coerced identity continuous equivalence and identity CLM, exact strict-derivative interface, complete open-partial-homeomorphism type, actual forward-function equality, zero in both source/target and both sets as zero neighborhoods, inverse continuity at zero, local left/right inverse laws and inverse value zero. The accepted typed projection API proves a named equality with the completely expanded actual upper-entry function. It then checks every forward matrix entry, the literal actual-function left inverse, and each literal actual matrix entry of the right inverse. These checks preserve the original source word and native spatial labels and impose the required source/target membership conditions.

**Verification discipline:** retain accepted ancestry pins through CF, including its repaired source and unchanged audit; rebuild CF, then compile CG and its independent audit freshly with warnings-as-errors. Require exactly seven expected permitted root reports in each phase, unchanged three-axiom whitelist and 840/600-second caps. The legacy conditional-alias guard remains active. No new instance, norm/topology, source/gamma replacement, linter suppression or custom proof limit is introduced. Local exact hashes, declaration/scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. Local Lean is unavailable; all seven CG roots remain candidates until complete strict CI succeeds.

**Next action and ceiling:** inspect both fresh Lean phases before qualification. If accepted, inspect the same pinned inverse-function API for inverse regularity and derivative, and derive local parameter injectivity of the actual source word only on the established parameter neighborhood. Do not identify this parameter-space local inverse with a source Spin chart: exhaustion of nearby source Spin elements and source local fiber/kernel control remain independent obligations. Subgroup-chart coverage, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all previous negative evidence.


## F10CG accepted — actual upper-coordinate parameter-space local inverse

**Verified strict result:** [run 41738870699](https://github.com/etblink/math/actions/runs/41738870699), tested `0417579e042e5d7cde3919283ce51ded9d7c9cba`, attempt 1, job `126275024265`, completed/success with all ten recorded steps successful. Exact ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CF rebuild, fresh warnings-as-errors CG compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CG_UPPER_COORDINATE_LOCAL_INVERSE_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the seven expected fully qualified roots, each once per phase, fourteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The tested commit, terminal run state, ten step verdicts, decoded log, actual terminal marker, exact root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CGUpperCoordinateLocalInverse.lean` | `0d4ff0b02af7fc5e007b2943f03c72300720aafd` |
| `lean/diagnostics/FCP_K1D18V10HF10CGIndependentAudit.lean` | `1c3e79574861ab27f1564d648bc6e81ac20b51ed` |
| `.github/workflows/bfss-kotler-v10h-f10cg-upper-coordinate-local-inverse-strict.yml` | `f3a53ccada95bc77923e3a5e6456a36df6d0ebb7` |

All seven qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperCoordinateMap_hasStrictFDerivAt_refl`
2. `source9OrderedUpperCoordinateLocalHomeomorph`
3. `source9OrderedUpperCoordinateLocalHomeomorph_coe`
4. `source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_source`
5. `source9OrderedUpperCoordinateLocalHomeomorph_zero_mem_target`
6. `source9OrderedUpperCoordinateLocalHomeomorph_left_inv`
7. `source9OrderedUpperCoordinateLocalHomeomorph_right_inv`

Retained artifact `13280913671`, `bfss-v10h-f10cg-upper-coordinate-local-inverse-0417579e042e5d7cde3919283ce51ded9d7c9cba-1`, 3629 bytes, GitHub-reported ZIP SHA-256 `0d755bce15a858e7d3f095d16601972b47381762e9501f4565b0ce244b87f15a`. This records GitHub's artifact metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** CF's strict identity derivative is exposed as the coercion of the identity continuous linear equivalence. The inspected inverse-function constructor yields `source9OrderedUpperCoordinateLocalHomeomorph : OpenPartialHomeomorph (Fin 36 → ℝ) (Fin 36 → ℝ)`, whose complete forward function equals the actual `source9OrderedUpperCoordinateMap`. Zero lies in its open source and target. On the source neighborhood, applying the inverse to the actual upper-coordinate image recovers the original parameter; on the target neighborhood, applying the actual map to the inverse recovers the coordinate. Each inverse law retains its explicit neighborhood membership hypothesis.

The independent audit also checks standard parameter topology and completeness, the literal identity derivative interface, open source/target zero neighborhoods, inverse continuity and inverse value zero. Its separately proved typed actual-function bridge expands the forward map into the original source ordered word's actual natural nine-matrix upper entries. The audit checks the forward entry formula and both inverse identities at that literal actual-function interface. It neither substitutes a surrogate map nor assumes source Spin coverage.

**Successful method:** instantiate the pinned constructor with the explicit identity continuous linear equivalence and actual forward function; transport generic local inverse laws using the complete forward-function equality and typed function congruence. The previously successful projection-to-literal-function bridge avoids deep normalization in the independent audit. This first CG strict run passed without source repair. No new instances, norm/topology changes, gamma/carrier replacement, admissions, linter suppression, relaxed whitelist or proof-limit increase was introduced.

**Next bounded plan and ceiling:** inspect the same pinned inverse-function API for the inverse's strict derivative at zero and regularity on its target neighborhood. Derive local parameter injectivity of the actual source ordered word from the established actual upper-coordinate left inverse, with both parameters restricted to the accepted source neighborhood. Independently audit literal original-word/matrix interfaces and all membership hypotheses. This remains parameter-space work: exhaustion of nearby source Spin elements, source local fiber/kernel control and subgroup-chart coverage are separate open obligations. Tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff; all earlier evidence remains intact.


## F10CH candidate — inverse regularity and actual source-word local injectivity

**Baseline:** live research branch checked at `e596de9ff9b261ed9d9bb0fdee64ad7186b5e3c0`, the documentation-only CG acceptance commit. Root AGENTS and current canonical handoff reread. Previously inspected ancestor instruction files and all accepted modules remain unchanged at this baseline.

**Bounded implementation:** retain exactly CG's open partial homeomorphism and its inverse. Its left inverse at zero proves inverse value zero. Apply the pinned strict inverse-function derivative theorem, with the identity continuous linear equivalence supplied explicitly; bridge the library's local-inverse function to the accepted inverse by complete typed function equality, and bridge the inverse identity equivalence to the literal identity CLM. This gives the strict derivative at zero, its ordinary derivative and exact `fderiv` equality.

Use `OpenPartialHomeomorph.contDiffAt_symm` on that same object, CG's zero target membership, CE's actual identity derivative and CF's actual every-order smoothness. Explicit forward-function and inverse-value equalities transport both prerequisites. The candidate is `ContDiffAt ℝ n` of the accepted inverse at zero for every `n : ℕ∞ω`, including analytic order; it does not assert derivative invertibility or regularity on the entire original target neighborhood.

CG's actual left inverse proves `Set.InjOn source9OrderedUpperCoordinateMap` on its source. A typed application of the accepted upper projection transfers matrix equality to coordinate equality, giving injectivity of the complete actual natural nine-matrix word image on that set. A typed application of the actual natural homomorphism transfers original source-word equality to matrix equality, giving injectivity of `source9OrderedStrictPlaneWord` on the same set. Every local injectivity theorem retains both parameters' neighborhood restrictions.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`, blob `e628f119f19643501a84e461c29575ff1365d511`: `HasStrictFDerivAt.to_localInverse` gives strict derivative equal to the inverse continuous linear equivalence at the forward image.
- `Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean`, blob `add6679659423f2fa4d6ac3f2150ade77e93d7ae`: its alternate constructor was inspected; the candidate preserves CG's existing object instead of introducing another chosen inverse.
- `Analysis/Calculus/ContDiff/Operations.lean`, blob `80e898b98348cb111761430989137705f4a3cf63`: complete `OpenPartialHomeomorph.contDiffAt_symm` signature, explicit target membership, forward derivative at the inverse point and forward regularity at that same point. Its regularity parameter includes the analytic case.

Eight pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperCoordinateLocalHomeomorph_symm_zero`
2. `source9OrderedUpperCoordinateLocalHomeomorph_symm_hasStrictFDerivAt_zero`
3. `source9OrderedUpperCoordinateLocalHomeomorph_symm_hasFDerivAt_zero`
4. `source9OrderedUpperCoordinateLocalHomeomorph_symm_fderiv_zero`
5. `source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_zero`
6. `source9OrderedUpperCoordinateMap_injOn_source`
7. `source9OrderedStrictPlaneWord_matrix_injOn_source`
8. `source9OrderedStrictPlaneWord_injOn_source`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CHInverseRegularityLocalInjectivity.lean` | `82835111241ebd88745a17743421cb2f82d23ddc` |
| `lean/diagnostics/FCP_K1D18V10HF10CHIndependentAudit.lean` | `f8860e4365a6261ba0e3f31b8ec215965e6498a9` |
| `.github/workflows/bfss-kotler-v10h-f10ch-inverse-regularity-local-injectivity-strict.yml` | `b746e31a6733e3aa02f10615c3db13a20525f998` |

**Independent audit:** standard parameter product topology and completeness; exact accepted inverse value; strict and ordinary literal identity derivatives; full `fderiv` equality and every direction/coordinate evaluation; inverse regularity for every `n : ℕ∞ω`; actual map injectivity; separately proved equality with the completely expanded actual upper-entry function and injectivity of that literal function; full actual matrix injectivity and recovery from equality of every matrix entry; original source-word injectivity and its expansion to the original `source9PlaneSpinWord` with the exact enumeration and `List.finRange 36`. It also checks that an accepted-neighborhood parameter whose word equals the identity is zero. This last consequence concerns the parameterized word image, not arbitrary nearby source Spin elements or the natural representation's full local kernel.

**Verification discipline:** preserve every accepted ancestry pin through CG and add exact CH source/audit pins. Rebuild CG, then compile CH and its independent audit freshly with warnings-as-errors. Require exactly eight expected permitted root reports per phase, unchanged three-axiom whitelist, actual terminal classifier `V10H_F10CH_INVERSE_REGULARITY_LOCAL_INJECTIVITY_TYPES_AXIOMS_PASS`, and unchanged 840/600-second fresh-phase caps. No new instance, norm/topology, source/gamma replacement, admission, linter suppression or custom proof limit is introduced. Local exact hashes, ancestry-pin preservation, eight-root scope preflight, YAML, three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all eight roots remain candidates until complete strict CI succeeds.

**Next action and ceiling:** inspect complete fresh source and independent audit evidence before qualification. Preserve explicit inverse-function and derivative-operator bridges if an interface fails; do not normalize deeply or raise limits first. After qualification, inspect a bounded parameter-domain/actual-word-image inverse package and its inherited topology before attempting any source neighborhood coverage statement. General source Spin local fiber/kernel control, coverage of nearby source Spin elements, subgroup-chart coverage, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CH accepted — inverse regularity and actual source-word local injectivity

**Verified strict result:** [run 41741804304](https://github.com/etblink/math/actions/runs/41741804304), tested `fc11df43ce9e6a268a0fc6b0a30d26c00a943d94`, attempt 1, job `126284870536`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CG rebuild, fresh warnings-as-errors CH compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CH_INVERSE_REGULARITY_LOCAL_INJECTIVITY_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the eight expected fully qualified roots, each once per phase, sixteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CHInverseRegularityLocalInjectivity.lean` | `82835111241ebd88745a17743421cb2f82d23ddc` |
| `lean/diagnostics/FCP_K1D18V10HF10CHIndependentAudit.lean` | `f8860e4365a6261ba0e3f31b8ec215965e6498a9` |
| `.github/workflows/bfss-kotler-v10h-f10ch-inverse-regularity-local-injectivity-strict.yml` | `b746e31a6733e3aa02f10615c3db13a20525f998` |

All eight qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrderedUpperCoordinateLocalHomeomorph_symm_zero`
2. `source9OrderedUpperCoordinateLocalHomeomorph_symm_hasStrictFDerivAt_zero`
3. `source9OrderedUpperCoordinateLocalHomeomorph_symm_hasFDerivAt_zero`
4. `source9OrderedUpperCoordinateLocalHomeomorph_symm_fderiv_zero`
5. `source9OrderedUpperCoordinateLocalHomeomorph_symm_contDiffAt_zero`
6. `source9OrderedUpperCoordinateMap_injOn_source`
7. `source9OrderedStrictPlaneWord_matrix_injOn_source`
8. `source9OrderedStrictPlaneWord_injOn_source`

Retained artifact `13281219471`, `bfss-v10h-f10ch-inverse-regularity-local-injectivity-fc11df43ce9e6a268a0fc6b0a30d26c00a943d94-1`, 3894 bytes, GitHub-reported ZIP SHA-256 `17b8fc34677cb66be76b58beb2d38602ba3976c6260759b957fc13c039495ba6`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** CG's existing inverse sends zero to zero. At zero it has the literal identity strict derivative, hence the ordinary identity derivative and exact identity `fderiv`. That same inverse is `ContDiffAt ℝ n` at zero for every `n : ℕ∞ω`, including analytic order. This is pointwise regularity at zero; it does not assert regularity on the entire original target neighborhood.

On CG's source neighborhood, the actual upper-coordinate map is injective. Projecting equality of the complete actual natural nine-matrix word images to their upper coordinates proves local injectivity of that full matrix image. Applying the actual natural homomorphism to equality of the original source ordered words then proves local injectivity of the original source word. Both parameters must belong to the accepted source neighborhood in every injectivity statement.

The independent audit checks the standard parameter topology and completeness, exact inverse value and derivative operators, every directional/coordinate derivative evaluation, every-order inverse regularity at zero, named and completely expanded literal actual upper-coordinate injectivity, full actual matrix injectivity and recovery from equality of every entry, and the original ordered word with its exact `source9PlaneSpinWord`/`List.finRange 36` expansion. It also checks that a parameter in this neighborhood whose word is the identity is zero. This consequence applies only to the parameterized word image and does not settle the natural representation's kernel on arbitrary nearby source Spin elements.

**Successful method:** preserve the accepted inverse; use the pinned library's inverse strict derivative and continuous-differentiability theorems with explicit continuous-equivalence arguments. Complete typed equalities bridge the library local-inverse function, CG's actual inverse, and the literal identity operator. The full forward-function equality and inverse value zero expose the regularity prerequisites. Typed congruence through the accepted upper projection and natural homomorphism transports injectivity without changing the source word or carrier. This first CH strict run passed without repair. No new instances, topology/norm changes, gamma/carrier replacement, admissions, linter suppression, relaxed whitelist or proof-limit increase was introduced.

**Next bounded plan and ceiling:** inspect the inherited topology and existing Mathlib APIs for packaging the established parameter neighborhood and its actual source-word image with coordinate recovery as inverse. Keep the actual word, spatial enumeration and membership restrictions explicit; audit continuity and the inverse identities independently before claiming a homeomorphism onto that image. Such a package would still not prove that the image exhausts a source Spin neighborhood. General source local fiber/kernel control, source neighborhood coverage, subgroup-chart coverage, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves all earlier evidence.


## F10CI candidate — inherited-topology homeomorphism onto the actual source-word image

**Baseline:** live research branch checked at `1056b74a1e5cdfd65268e7d7b13741962e798144`, the documentation-only CH acceptance commit. Root AGENTS and the canonical handoff reread. Previously checked ancestor instruction files and all accepted mathematical modules remain unchanged at this baseline.

**Bounded implementation:** define `source9SpinUpperCoordinates` on the original `spinGroup source9Quadratic` by applying the accepted continuous upper projection to its actual natural nine-matrix image. Prove continuity for the inherited PBW topology by using BU's continuous ambient vector-conjugation extension on the source Clifford coercion and original fixed coordinate columns, followed by original row evaluation. The accepted actual matrix-entry/vector-conjugation and ambient/Spin bridges identify the exact function; expose the composed function's typed lambda before rewriting.

BV's ambient PBW smoothness gives continuity of the actual ordered word's Clifford coercion. The inherited source Spin subtype topology then gives continuity into the original group. Only the two accepted named PBW normed structures are activated locally by uniquely named aliases; no new norm, topology, group structure, global instance or topological hypothesis is introduced.

Define the local image exactly as `source9OrderedStrictPlaneWord '' source9OrderedUpperCoordinateLocalHomeomorph.source`. The explicit parameter recovery is CG's inverse applied to the actual natural upper coordinates. On every parameter in CG's source, CG's left inverse proves recovery. Image membership proves that recovery stays in the source and that its coordinates lie in CG's target. Package the actual forward word and this specified inverse as `source9OrderedStrictPlaneWordImageHomeomorph` between the parameter-source subtype and the actual word-image subtype. Both inverse laws and both continuities are supplied explicitly. Inverse continuity is checked pointwise using CG's inverse continuity at each coordinate in the target, composed with the continuous actual upper-coordinate map. The complete forward and inverse formulas are exported as exact coercion equalities.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Topology/Homeomorph/Defs.lean`, blob `7c7e9c3c815eb873ab5e637aaac83e4cdf80f39d`: complete structure fields, inherited equivalence, explicit forward/inverse continuity, inverse identities and continuity projections.
- `Topology/Constructions.lean`, blob `91a7136cc7b39e609f8becbf9e0785069bb2610d`: inherited subtype continuity, Pi continuity and coordinate evaluation; no substitute topology is needed.
- `Topology/OpenPartialHomeomorph/Continuity.lean`, blob `54b56e1b8b657b0417e16ed2e823b6f8aa757f03`: inverse continuity at any point with explicit target membership.

Eight pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9SpinUpperCoordinates`
2. `source9SpinUpperCoordinates_continuous_pbw`
3. `source9OrderedStrictPlaneWord_continuous_pbw`
4. `source9OrderedStrictPlaneWordLocalImage`
5. `source9OrderedStrictPlaneWord_coordinate_recovery`
6. `source9OrderedStrictPlaneWordImageHomeomorph`
7. `source9OrderedStrictPlaneWordImageHomeomorph_apply`
8. `source9OrderedStrictPlaneWordImageHomeomorph_symm_apply`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CIActualWordImageHomeomorph.lean` | `ccee4ca45358a5bd0b63093b96144a6095b8bcb8` |
| `lean/diagnostics/FCP_K1D18V10HF10CIIndependentAudit.lean` | `2b74d9256ef8be2d18689a2629ed8ab88b0b83f5` |
| `.github/workflows/bfss-kotler-v10h-f10ci-actual-word-image-homeomorph-strict.yml` | `c94415e84b5089978c7209a736ac824b71e7a7a3` |

**Independent audit:** reconstruct the accepted PBW coordinates and induced norm from the original Clifford basis and finite-coordinate adapter, and independently install the compatible normed-space structure. Check equality to the accepted coordinates/norm and capture the standard parameter and inherited original-source topologies. Check both the parameter-source and word-image subtype topologies as literal induced topologies. Check the actual upper-coordinate map's native matrix-entry formula and continuity, actual word continuity, exact image set and identity membership, coordinate recovery, the full homeomorphism type with the literal image set, and continuity in both directions. The forward formula is checked against the actual original ordered `List.finRange 36` product of source plane curves. The inverse formula is checked against the literal actual natural upper-entry function via a separately proved typed coordinate equality. Both subtype inverse laws and the expanded source-group reconstruction formula are checked without added continuity or inverse assumptions.

**Verification discipline:** preserve every accepted ancestry pin through CH; add exact CI source/audit pins, rebuild CH, then freshly compile CI and the independent audit with warnings-as-errors. Require eight exact permitted root reports in each phase and actual terminal classifier `V10H_F10CI_ACTUAL_WORD_IMAGE_HOMEOMORPH_TYPES_AXIOMS_PASS`. Retain the three-axiom whitelist, legacy conditional-alias guard, 840/600-second fresh-phase caps and evidence preservation. The local-instance guard now permits exactly the two accepted source aliases and the three independent audit reconstruction instances while rejecting global instance declarations or registrations; the source preflight prohibits constructing a replacement norm or topology. All source/audit bytes are pinned. Local exact hashes, accepted-pin preservation, eight-root scope preflight, YAML, all three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all eight roots remain candidates pending complete strict CI.

**Next action and ceiling:** inspect the complete fresh compilation and independent literal-function/PBW-topology audit before qualification. If accepted, determine the separate source-neighborhood coverage obligation and the exact local fiber/kernel facts it requires before constructing any source chart or atlas. A homeomorphism onto an image does not prove that image open or a neighborhood of the source identity. General source local kernel control, source Spin neighborhood coverage, subgroup-chart coverage, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all prior red and green evidence.


## F10CI first strict run RED — explicit subtype-domain continuity composition repair

**Preserved negative evidence:** [run 41744452128](https://github.com/etblink/math/actions/runs/41744452128), tested `49d3305835113234b4f0e2939ce52ca04ec3bf31`, attempt 1, job `126293828319`, completed/failure. Exact pins and scope preflight, pinned environment restoration and accepted CH rebuild passed. Fresh CI source compilation failed. The independent audit was skipped and the terminal classifier did not run. Zero CI roots are qualified.

The sole source diagnostic is line 124:58, an application type mismatch in the inverse-continuity composition. The supplied `hc.continuousAt` proves continuity of `fun h : source9OrderedStrictPlaneWordLocalImage => source9SpinUpperCoordinates h.val` at an image-subtype point. The elaborated application of `ContinuousAt.comp` instead expects continuity of unrestricted `source9SpinUpperCoordinates` at `g.val`. The image-subtype restriction was lost while inferring the composition's inner function from the image point. This is a function-domain inference failure, not evidence of a missing continuity hypothesis.

The first five root reports contain only the three permitted axioms; the homeomorphism and its two dependent formula roots contain compiler-recovery `sorryAx` after the failed continuity field. These reports are invalid partial output, not authored admissions or qualification. The independent audit has not yet elaborated.

Retained artifact `13283915859`, `bfss-v10h-f10ci-actual-word-image-homeomorph-49d3305835113234b4f0e2939ce52ca04ec3bf31-1`, 945 bytes, GitHub-reported ZIP SHA-256 `d70084a6f97a7c4a61c9a3486a4d10e453731f43525bff7db379e8239f0c00bf`. Failed source/audit/workflow blobs: `ccee4ca45358a5bd0b63093b96144a6095b8bcb8` / `2b74d9256ef8be2d18689a2629ed8ab88b0b83f5` / `c94415e84b5089978c7209a736ac824b71e7a7a3`.

**Pinned interface inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `Topology/Continuous.lean`, blob `620526f00d25f19d30d07ba5cad2b7a3370ba6bb`. The complete `ContinuousAt.comp` signature has implicit inner function `f`, outer function `g` and point `x`; its hypotheses are `ContinuousAt g (f x)` and `ContinuousAt f x`. Merely providing the previously typed global continuity `hc` after a dot-notation composition did not constrain the first argument's inferred inner domain sufficiently.

**Bounded repair:** retain `hc` and separately state `hinv` as continuity of the fully coerced accepted inverse on `(Fin 36 → ℝ) → (Fin 36 → ℝ)` at the actual upper coordinates of `g.val`. State `hcoords` as continuity of the explicitly restricted coordinate lambda at the actual image-subtype point `g`. Apply `ContinuousAt.comp` with explicit `f := fun h : source9OrderedStrictPlaneWordLocalImage => source9SpinUpperCoordinates h.val`, the fully typed inverse as `g`, and `x := g`, then supply the two hypotheses. This fixes the intended domain before either proof argument can drive inference through the subtype coercion.

Static comparison confirms this proof block is the only source change. All eight declaration signatures, the forward and inverse functions, domain/image sets, PBW structures and inverse laws are unchanged. The independent audit remains byte-identical at `2b74d9256ef8be2d18689a2629ed8ab88b0b83f5`.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CIActualWordImageHomeomorph.lean` | `7e7cc455efe13b804608f69d34cd1e106d9d3bbf` |
| `.github/workflows/bfss-kotler-v10h-f10ci-actual-word-image-homeomorph-strict.yml` | `14386da3565fb682935ed7c08226834a5c55f3ad` |

The workflow updates only the candidate source pin and adds scope assertions for the explicit `hinv`/`hcoords` statements and composition functions/point. Every accepted ancestry pin, audit pin, eight-root requirement, warnings-as-errors policy, three-axiom whitelist, local-instance bounds, legacy conditional-alias guard and 840/600-second caps remains unchanged. Local exact hashes, unchanged statements/audit, candidate-only pin change, scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; fresh source and independent audit elaboration remain required.

**Method lesson and next action:** at subtype boundaries, supply the complete intended composition domain and actual point, as well as typed continuity hypotheses. Do not repeat a dot-notation call whose implicit inner map is already inferred on the ambient domain, or raise limits for a direct type mismatch. Inspect both fresh phases before qualification and preserve this red separately from earlier composition/lambda rewrite failures. Image openness, source Spin neighborhood coverage, general local kernel control, subgroup charts, tangent identifications, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CI accepted — inherited-topology homeomorphism onto the actual source-word image

**Verified strict result:** [run 41746257725](https://github.com/etblink/math/actions/runs/41746257725), tested `9ede511761a51b6784f6df4883ec01fcc4b06d8e`, attempt 1, job `126299905635`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CH rebuild, fresh warnings-as-errors CI compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CI_ACTUAL_WORD_IMAGE_HOMEOMORPH_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the eight expected fully qualified roots, each once per phase, sixteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CIActualWordImageHomeomorph.lean` | `7e7cc455efe13b804608f69d34cd1e106d9d3bbf` |
| `lean/diagnostics/FCP_K1D18V10HF10CIIndependentAudit.lean` | `2b74d9256ef8be2d18689a2629ed8ab88b0b83f5` |
| `.github/workflows/bfss-kotler-v10h-f10ci-actual-word-image-homeomorph-strict.yml` | `14386da3565fb682935ed7c08226834a5c55f3ad` |

All eight qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9SpinUpperCoordinates`
2. `source9SpinUpperCoordinates_continuous_pbw`
3. `source9OrderedStrictPlaneWord_continuous_pbw`
4. `source9OrderedStrictPlaneWordLocalImage`
5. `source9OrderedStrictPlaneWord_coordinate_recovery`
6. `source9OrderedStrictPlaneWordImageHomeomorph`
7. `source9OrderedStrictPlaneWordImageHomeomorph_apply`
8. `source9OrderedStrictPlaneWordImageHomeomorph_symm_apply`

Retained artifact `13283198839`, `bfss-v10h-f10ci-actual-word-image-homeomorph-9ede511761a51b6784f6df4883ec01fcc4b06d8e-1`, 4891 bytes, GitHub-reported ZIP SHA-256 `e18e3f23c11f308d51e4c989ffc4e86fb2c7c4d971d49706ae2cecb57749995f`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** `source9SpinUpperCoordinates` reads the accepted enumerated upper entries from the actual natural nine-matrix image of an arbitrary original source Spin element and is continuous for the inherited PBW topology. The actual original ordered source word is continuous into that same source Spin carrier. Its local image is exactly the image of CG's parameter-source neighborhood, and the identity belongs to it.

The actual word restricted to the parameter-source subtype is a homeomorphism onto that exact image subtype. Its inverse is explicitly the accepted coordinate inverse applied to the original element's actual natural upper coordinates. Parameter recovery, both inverse laws and both continuities are established with the inherited subtype topologies. This proves a homeomorphism onto the word image; it does not prove the image open or a neighborhood in the full source Spin group.

The independent audit reconstructs the PBW coordinates and induced norm from the original source Clifford basis and independently installs the compatible normed-space structure. It checks equality to the accepted coordinates/norm, standard parameter and inherited source topologies, and the two subtype topologies as literal induced topologies. It checks continuity of the actual coordinate map and word, the exact image set and identity membership, the complete homeomorphism type, both continuities and both subtype inverse laws. It checks the forward map against the literal `List.finRange 36` ordered product of the original source plane curves, and the inverse against the literal natural matrix upper-entry formula. The expanded source-group reconstruction identity is checked for every element with explicit membership in the word image. No continuity or inverse hypotheses are added by the audit.

**Repair outcome and successful method:** first run [41744452128](https://github.com/etblink/math/actions/runs/41744452128) remains a strict source failure. Its inverse-continuity composition inferred the inner map on the ambient Spin group rather than the image subtype. Separately typed inverse and restricted-coordinate continuity hypotheses, together with explicit `f`, `g` and `x` arguments to the pinned `ContinuousAt.comp` theorem, resolved the mismatch. All eight declaration signatures and the independent audit remained unchanged. The repair supplies the intended composition domain before proof arguments drive inference through subtype coercions. This extends the established method of using complete type/function bridges at structure and coercion boundaries. No new norm/topology, source/gamma replacement, authored admission, linter suppression, relaxed whitelist or proof-limit increase was introduced; the source activates only the two accepted PBW structures by local aliases.

**Next bounded plan and ceiling:** isolate the source-neighborhood coverage obligation. Inspect the open preimage of CG's coordinate target under the actual continuous source upper-coordinate map, the specified word reconstruction there, and which inverse identities follow solely from the existing parameter-space laws. Explicitly separate coordinate recovery from equality to an arbitrary source Spin input. Determine the additional local natural-matrix and source fiber/kernel facts needed for that equality before promoting any image package to a source chart. A continuous reconstruction or homeomorphism onto an image alone does not settle neighborhood coverage. Image openness, general source local kernel control, source Spin neighborhood coverage, subgroup-chart coverage, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves every earlier red and green record.


## F10CJ candidate — open reconstruction domain and exact fixed-point coverage gap

**Baseline:** live research branch checked at `8e8267ced3c5eaa8dbc3ae2d361e050e6866ff39`, the documentation-only CI acceptance commit. Root AGENTS and current canonical handoff reread. Previously checked ancestor instruction files and all accepted modules remain unchanged at this baseline.

**Bounded implementation:** define `source9SpinCoordinateReconstructionDomain` as the preimage of CG's target under the accepted actual `source9SpinUpperCoordinates`. Its openness follows from the accepted continuity and open target. The actual coordinates of the source identity equal zero, using the accepted zero-parameter word and actual coordinate-map zero theorem, so the domain contains the source identity.

Define the total function `source9SpinCoordinateReconstruction g := source9OrderedStrictPlaneWord (source9OrderedUpperCoordinateLocalHomeomorph.symm (source9SpinUpperCoordinates g))`. All laws requiring coordinate-target membership carry an explicit reconstruction-domain hypothesis. Prove continuity on that domain by composing the accepted actual coordinate map, CG's inverse continuity at the specific target point, and the accepted actual word continuity. Reuse the successful CI repair method immediately: separately typed continuity hypotheses and explicit `f`, `g`, `x` arguments for both composition steps.

The accepted actual word image lies in this domain. CG's inverse target-to-source law ensures every reconstructed parameter is in the accepted parameter source; hence reconstruction lands in the accepted actual word image. CG's right inverse proves equality of the actual upper coordinates before and after reconstruction. On the reconstruction domain, the reconstruction fixes an input if and only if that input belongs to the accepted word image. The reverse direction uses CI's actual source-word parameter recovery; the forward direction uses reconstruction's image membership.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Topology/Continuous.lean`, blob `620526f00d25f19d30d07ba5cad2b7a3370ba6bb`: full `IsOpen.preimage` argument order and complete `ContinuousAt.comp` signature. Composition domains and actual points are supplied explicitly.
- `Topology/OpenPartialHomeomorph/Defs.lean`, blob `9754374286e46a881a41d0977869a571d2353e79`: exact `map_source` and `map_target` membership laws; no conclusion about arbitrary group inputs is built into these parameter-space laws.

Nine pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9SpinCoordinateReconstructionDomain`
2. `source9SpinCoordinateReconstructionDomain_isOpen_pbw`
3. `source9SpinCoordinateReconstructionDomain_one_mem`
4. `source9SpinCoordinateReconstruction`
5. `source9SpinCoordinateReconstruction_continuousOn_pbw`
6. `source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain`
7. `source9SpinCoordinateReconstruction_mem_wordImage`
8. `source9SpinCoordinateReconstruction_upperCoordinates`
9. `source9SpinCoordinateReconstruction_eq_self_iff`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CJCoordinateReconstructionDomain.lean` | `6cc49685be9e93320841e3c31fa147e1fbea161d` |
| `lean/diagnostics/FCP_K1D18V10HF10CJIndependentAudit.lean` | `b5614635c499a92b712b3451e98b424e59a4473f` |
| `.github/workflows/bfss-kotler-v10h-f10cj-coordinate-reconstruction-domain-strict.yml` | `910596d7511157bcb3cac45409d4fb7180a644f4` |

**Independent audit:** reconstruct the accepted PBW coordinates, induced norm and compatible normed-space structure independently, as in the accepted CI audit. Check the standard parameter topology, inherited original-source topology, accepted image subtype topology and the reconstruction-domain subtype topology. Check the literal target-preimage definition, openness, identity membership and identity-neighborhood status. Check the reconstruction formula both with named coordinates and with the literal actual natural matrix upper entries, using a separately proved typed function bridge. Check continuity on the stated domain, accepted-image inclusion in the domain, recovered parameter membership in CG's source, reconstruction membership in the exact word image and equality of each literal original natural upper entry. Check the full fixed-point equivalence, idempotence on the domain and fixation of every accepted-neighborhood source word.

The audit also proves the exact additional coverage criterion for any `V ⊆ source9SpinCoordinateReconstructionDomain`: `V ⊆ source9OrderedStrictPlaneWordLocalImage` if and only if reconstruction fixes every input in `V`. This is a conditional equivalence for arbitrary smaller sets; it neither asserts the right-hand side nor supplies an open identity neighborhood on which it holds. Coordinate equality remains explicitly distinct from equality of full natural matrices or original source Spin elements.

**Verification discipline:** preserve every accepted ancestry pin through the repaired CI source and its unchanged independent audit; add exact CJ source/audit pins. Rebuild CI, then freshly compile CJ and its independent audit with warnings-as-errors. Require exactly nine permitted expected root reports per phase and actual terminal classifier `V10H_F10CJ_COORDINATE_RECONSTRUCTION_DOMAIN_TYPES_AXIOMS_PASS`. The three-axiom whitelist, 840/600-second fresh-phase caps, legacy conditional-alias guard, exact local-instance bounds and evidence preservation remain unchanged. The source uses only two aliases of the accepted PBW structures; the audit independently reconstructs them. No replacement norm/topology, source/gamma substitution, authored admission, linter suppression or custom proof limit is introduced. Local exact hashes, accepted-pin preservation, nine-root scope preflight, YAML, all three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all nine roots remain candidates pending complete strict CI.

**Next action and ceiling:** inspect complete fresh source and independent audit evidence before qualification. Then inspect local uniqueness for the actual natural orthogonal matrices from their upper coordinates and the source representation's local fibers. Any coverage proof must specify a suitable smaller source identity neighborhood and establish the full source reconstruction identity there; do not presume it on the entire coordinate preimage or infer it from upper-coordinate recovery/idempotence. Source image openness, general local kernel control, source Spin neighborhood coverage, subgroup charts, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all previous negative evidence.


## F10CJ first strict run RED — literal-entry audit bridge repair

**Preserved negative evidence:** [run 41748489293](https://github.com/etblink/math/actions/runs/41748489293), tested `b66af63aa54ebb114572662e89281160118c865b`, attempt 1, job `126307385550`, completed/failure. Exact pins and scope preflight, pinned environment restoration, accepted CI rebuild and fresh warnings-as-errors CJ source compilation passed. The independent audit failed; its terminal classifier did not run. Zero CJ roots are qualified.

The sole diagnostic is `diagnostics/FCP_K1D18V10HF10CJIndependentAudit.lean:95:2`: maximum recursion depth reached. The failing `change` attempts to convert the literal natural matrix upper-entry equality into equality of `source9SpinUpperCoordinates` applied to the deeply defined reconstruction and input. This asks definitional equality to unfold the reconstruction, actual ordered word, coordinate projection and matrix representation at once. The named coordinate bridge immediately above already proves the complete required function equality; the failing proof bypassed that bridge.

Both phases printed the nine expected root axiom reports, eighteen total, using only `propext`, `Classical.choice` and `Quot.sound`, with no `sorryAx`. Those clean root reports do not override the independent audit's failed literal-interface check. This is distinct from CI's preceding source type mismatch and its downstream compiler-recovery `sorryAx`.

Retained artifact `13284902468`, `bfss-v10h-f10cj-coordinate-reconstruction-domain-b66af63aa54ebb114572662e89281160118c865b-1`, 1391 bytes, GitHub-reported ZIP SHA-256 `dac9c8799c99e9a7b08d528d5b9c9f6162ad4baa823c6f53c4efc4570bb0ef1f`. Tested source/audit/workflow blobs: `6cc49685be9e93320841e3c31fa147e1fbea161d` / `b5614635c499a92b712b3451e98b424e59a4473f` / `910596d7511157bcb3cac45409d4fb7180a644f4`.

**Bounded repair:** replace only that audit proof block. Evaluate `auditReconstructionActualCoordinates_eq` at the reconstructed source element and at the original input using `congrFun`, naming the resulting equalities `hleft` and `hright`. Evaluate the accepted source theorem `source9SpinCoordinateReconstruction_upperCoordinates g hg` at the same enumerated coordinate, naming it `hcoords`. The exact literal matrix-entry goal follows by `hleft.symm.trans (hcoords.trans hright)`. This transports the proposition through the already proved explicit interface and avoids unfolding the underlying source word. No audit conclusion or hypothesis is removed or weakened.

Static comparison confirms that the source remains byte-identical at `6cc49685be9e93320841e3c31fa147e1fbea161d`, all nine root declarations are unchanged, and every audit statement is unchanged. Only one audit proof block and the workflow's audit pin/scope assertions change.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/diagnostics/FCP_K1D18V10HF10CJIndependentAudit.lean` | `b2ac643dc4c9b39fce3820a33414843110aa3400` |
| `.github/workflows/bfss-kotler-v10h-f10cj-coordinate-reconstruction-domain-strict.yml` | `7a63f5ec2aa7c4d0339a1417586ecdd09c0fdedd` |

The workflow adds scope assertions for the evaluated coordinate bridges and their explicit equality chain. All accepted ancestry pins and the candidate source pin remain unchanged. The nine-root requirement per fresh phase, exact terminal classifier, warnings-as-errors, three-axiom whitelist, local-instance bounds, legacy conditional-alias guard and 840/600-second caps remain. Local exact hashes, source identity, audit-statement identity, candidate-audit-only pin change, scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; fresh source and independent audit elaboration remain required.

**Method lesson and next action:** a literal interface check should use its explicit named function equality at every occurrence, including coordinate evaluation at a reconstructed element. A definitionally valid `change` can still traverse a large actual-word term and exhaust elaboration recursion. Reuse the already successful typed equality/evaluation method from CE, CF, CG and CI; do not raise recursion limits for this avoidable normalization path. Inspect the complete independent audit before qualification even when all source root reports are clean. Source image openness, source Spin neighborhood coverage, general local kernel control, subgroup charts, tangent identifications, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CJ accepted — open coordinate reconstruction domain and fixed-point criterion

**Verified strict result:** [run 41750357148](https://github.com/etblink/math/actions/runs/41750357148), tested `2ea75c9463d53e9d588c2f1246897a76f31211b1`, attempt 1, job `126313635578`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CI rebuild, fresh warnings-as-errors CJ compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CJ_COORDINATE_RECONSTRUCTION_DOMAIN_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the nine expected fully qualified roots, each once per phase, eighteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CJCoordinateReconstructionDomain.lean` | `6cc49685be9e93320841e3c31fa147e1fbea161d` |
| `lean/diagnostics/FCP_K1D18V10HF10CJIndependentAudit.lean` | `b2ac643dc4c9b39fce3820a33414843110aa3400` |
| `.github/workflows/bfss-kotler-v10h-f10cj-coordinate-reconstruction-domain-strict.yml` | `7a63f5ec2aa7c4d0339a1417586ecdd09c0fdedd` |

All nine qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9SpinCoordinateReconstructionDomain`
2. `source9SpinCoordinateReconstructionDomain_isOpen_pbw`
3. `source9SpinCoordinateReconstructionDomain_one_mem`
4. `source9SpinCoordinateReconstruction`
5. `source9SpinCoordinateReconstruction_continuousOn_pbw`
6. `source9OrderedStrictPlaneWordLocalImage_subset_reconstructionDomain`
7. `source9SpinCoordinateReconstruction_mem_wordImage`
8. `source9SpinCoordinateReconstruction_upperCoordinates`
9. `source9SpinCoordinateReconstruction_eq_self_iff`

Retained artifact `13286911032`, `bfss-v10h-f10cj-coordinate-reconstruction-domain-2ea75c9463d53e9d588c2f1246897a76f31211b1-1`, 4577 bytes, GitHub-reported ZIP SHA-256 `6d0761a09cc20d89b2540f7a3ebfdcbfee25f361a1bd3c8f214da0fa5684a195`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** the preimage of CG's coordinate target under the actual source `source9SpinUpperCoordinates` is open for the inherited PBW topology and contains the original source Spin identity. On this stated domain, the specified reconstruction applies CG's inverse to the actual natural upper coordinates and then evaluates the original ordered source word. It is continuous on the domain. The accepted word image is contained in the domain; every reconstructed parameter lies in CG's source, so reconstruction lands in that exact word image.

Reconstruction preserves the actual enumerated natural upper coordinates. On the domain, reconstruction equals the original input if and only if that input belongs to the accepted word image. These statements preserve all domain hypotheses and the actual original source group, word and spatial enumeration. They do not equate arbitrary source elements with their reconstructions or equate their complete natural matrices.

The independent audit reconstructs the accepted PBW coordinates, induced norm and compatible normed space independently and checks the standard parameter, inherited source and subtype topologies. It checks the exact target preimage, openness, identity membership and identity-neighborhood status; the named and completely expanded literal matrix-entry reconstruction formulas; continuity on the domain; image inclusion; recovered parameter membership; reconstruction image membership; and equality of every enumerated actual natural upper entry. It checks the fixed-point equivalence, idempotence on the domain and fixation of every accepted-neighborhood word. For every smaller set `V` contained in the domain, it also checks the equivalence between `V` lying in the word image and reconstruction fixing every input in `V`. This identifies the additional coverage condition without asserting it.

**Repair outcome and successful method:** first run [41748489293](https://github.com/etblink/math/actions/runs/41748489293) remains a failed independent audit despite successful source compilation and clean root reports. Its literal matrix-entry `change` exhausted recursion while unfolding the reconstruction. Evaluating the already proved explicit coordinate equality at each source element, then composing those equalities with the coordinate-recovery theorem, resolved the audit failure. The source stayed byte-identical and every audit statement was preserved. The repaired run passes the complete literal-interface audit under the original limits.

The two repeated lessons remain operational: supply complete composition functions and points at subtype/coercion boundaries, and use named actual-function equalities rather than deep definitional unfolding at literal interfaces. No source/gamma replacement, new norm/topology, authored admission, linter suppression, relaxed whitelist or proof-limit increase was introduced. The source activates only the two accepted PBW structures by local aliases.

**Next bounded plan and ceiling:** inspect existing native orthogonal-matrix infrastructure for local recovery of the complete matrix from the enumerated upper coordinates, then inspect the original source natural representation's local fibers. Coordinate equality alone is insufficient. A coverage proof must identify a suitable smaller original-source identity neighborhood and prove the full reconstruction identity there; the accepted conditional criterion can then transfer that identity to image coverage. Do not assume the entire coordinate-target preimage has that identity or that a continuous idempotent reconstruction implies source coverage. Image openness, source Spin neighborhood coverage, general local kernel control, subgroup charts, tangent Lie-algebra identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves every earlier red and green record.


## F10CK candidate — algebraic orthogonal completion coordinates

**Baseline:** live research branch checked at `475c022e100081f68fcffa0ad300d5dd8770a78f`, the documentation-only CJ acceptance commit. Root AGENTS and current canonical handoff reread. All accepted mathematical modules and previously checked ancestor instructions remain unchanged.

**Research decision:** work on the existing full native matrix perturbation space before attempting source Spin coverage. The accepted orthogonality identity supplies an explicit polynomial completion map whose linear part is the identity and whose quadratic part vanishes to second order at zero. First qualify the exact algebraic relationship to native upper entries; strict differentiability and local injectivity will be separate later gates. No new source group, matrix carrier, basis order or gamma representation is introduced.

For a perturbation `B : Matrix SpaceIndex SpaceIndex ℝ`, define `source9OrthogonalCompletionMap B` entrywise:
- for `i < j`, use `B i j`;
- for `j < i`, use `B i j + (B.transpose * B) i j`;
- on the diagonal, use `B i i + (B.transpose * B) i i / 2`.

The diagonal factor comes from the quadratic Gram expansion, not from any change to the accepted source rotor/generator normalization. The function is defined on the entire original nine-matrix space and maps zero to zero.

**Bounded algebraic implementation:** expand `(1+B).transpose * (1+B) - 1` exactly as `B + B.transpose + B.transpose * B`. For `A ∈ Matrix.orthogonalGroup SpaceIndex ℝ`, set `B = A - 1` and deduce that this sum is zero. Its entries show that completion at `A - 1` is exactly `source9StrictPlaneMatrix (fun p => A p.val.1 p.val.2)`: original strict upper entries, their negative transpose below, and zero diagonal. Thus two orthogonal inputs with the same strict upper entries have equal completion values, without yet asserting equality of the inputs.

Prove explicitly that equality under the accepted `source9OrderedUpperProjection` is equivalent to equality of all original increasing-pair entries. Use the already chosen `source9StrictPlaneEnumeration` and its exact inverse, with typed evaluation through `source9OrderedUpperProjection_apply`; no alternate enumeration is selected. Apply this bridge to CJ's coordinate recovery. Both the reconstructed and original actual natural matrices are members of the original orthogonal group, by the existing actual homomorphism subtype properties. Therefore their perturbations have equal completion values on CJ's stated reconstruction domain.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `LinearAlgebra/UnitaryGroup.lean`, blob `2bc60a3c9927cdbf9c28371d1b4e9f66b7447583`: the original `Matrix.orthogonalGroup` and complete `mem_orthogonalGroup_iff'` equivalence with `A.transpose * A = 1`. Reuse the accepted BR orthogonal homomorphism, CA native strict-plane matrix, CB chosen enumeration, CE upper projection and CJ actual reconstruction. Matrix addition/transpose/multiplication and scalar entry algebra suffice; no new norm estimate or normed-ring structure is needed.

Eight pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrthogonalCompletionMap`
2. `source9OrthogonalCompletionMap_zero`
3. `source9Matrix_perturbation_gram_identity`
4. `source9Orthogonal_perturbation_gram_zero`
5. `source9OrthogonalCompletionMap_on_orthogonal`
6. `source9OrderedUpperProjection_eq_iff_strict_entries`
7. `source9OrthogonalCompletionMap_eq_of_upperProjection_eq`
8. `source9OrthogonalCompletionMap_actual_reconstruction`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CKOrthogonalCompletionCoordinates.lean` | `635a1c667697627c349e4139be4bfa3808ddbcc6` |
| `lean/diagnostics/FCP_K1D18V10HF10CKIndependentAudit.lean` | `0693c8c32d28bee27ba39a3c5f594892b2c9cef0` |
| `.github/workflows/bfss-kotler-v10h-f10ck-orthogonal-completion-coordinates-strict.yml` | `f1d30254aabe8c7687b5b245be2fc6a05f443332` |

**Independent audit:** capture the standard matrix product topology and verify its equality after the elementwise norm scope. Check the exact original matrix-domain/codomain, complete entrywise polynomial with each Gram product expanded as the literal original-label finite sum, strict-upper preservation, zero value, full Gram identity, orthogonal perturbation identity, collapse to CA's exact native skew model, and projection/native-strict-entry equivalence. Check equality of completion values for arbitrary native orthogonal-group inputs with equal native upper entries, and for CJ's actual reconstructed/original natural matrices with explicit domain membership. A separately named equality exposes the completely expanded original source-word reconstruction interface without deep definitional `change`.

The audit includes a concrete negative control: completion at `(-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1` is zero, just as completion at zero is zero, and these perturbations are distinct by their original zero-index diagonal entries. It therefore checks `¬ Function.Injective source9OrthogonalCompletionMap` on the full ambient matrix domain. This is a matrix-level control; it makes no claim that the negative identity matrix lies in the actual source Spin representation's image. Locality is essential for the planned inverse-function argument.

**Verification discipline:** preserve accepted ancestry pins through CJ's unchanged source and repaired audit, then add exact CK source/audit pins. Rebuild CJ, freshly compile CK and the independent audit with warnings-as-errors, and require exactly eight expected permitted root reports per phase and terminal classifier `V10H_F10CK_ORTHOGONAL_COMPLETION_COORDINATES_TYPES_AXIOMS_PASS`. Keep the three-axiom whitelist, 840/600-second fresh-phase caps, legacy conditional-alias guard and evidence preservation. CK needs no local instances; the guard rejects instance declarations/registrations in both new files and prohibits source norm/topology replacement. Local exact hashes, accepted-pin preservation, eight-root scope preflight, YAML, all three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all eight roots and audit controls remain candidates pending complete strict CI.

**Next bounded plan and ceiling:** if the complete algebraic gate passes, qualify smoothness and the strict literal identity derivative at zero of this same completion map using the standard matrix product topology and existing finite-coordinate calculus. Instantiate the pinned strict inverse-function constructor to obtain local ambient injectivity, then combine the accepted orthogonal-completion identity with explicit neighborhood membership to deduce local full-matrix recovery from the actual upper coordinates. The global negative control must remain in force; do not infer global injectivity. Even local full-matrix equality will leave original source Spin fiber/kernel control and source neighborhood coverage separate. Image openness, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all prior red and green evidence.


## F10CK first strict run RED — instantiate the membership equivalence before projection

**Preserved negative evidence:** [run 41753221578](https://github.com/etblink/math/actions/runs/41753221578), tested `2257b4cc01711f2cb98a70b983ee8fd052d1aac7`, attempt 1, job `126323089075`, completed/failure. Exact pins and scope preflight, pinned environment restoration and accepted CJ rebuild passed. Fresh CK source compilation failed. The independent audit was skipped and the terminal classifier did not run. Zero CK roots are qualified.

The first causal diagnostic is line 37:11: invalid projection. `Matrix.mem_orthogonalGroup_iff'` is still a function with explicit index type `n` and coefficient ring `R` arguments, so `Matrix.mem_orthogonalGroup_iff'.1 hA` is not an Iff projection. The additional unsolved goal at line 34:69 is a consequence: the Gram expansion has not been rewritten using orthogonality. There are no other source diagnostics.

Four independent root reports contain only the permitted axioms: the completion-map definition, zero value, general Gram expansion and strict-entry/projection equivalence. The orthogonal perturbation theorem and its three dependent roots contain compiler-recovery `sorryAx` after the failed proof. These are invalid partial reports, not authored admissions or qualification. The unchanged independent audit, including its ambient-global-noninjectivity control, has not yet elaborated.

Retained artifact `13287079696`, `bfss-v10h-f10ck-orthogonal-completion-coordinates-2257b4cc01711f2cb98a70b983ee8fd052d1aac7-1`, 1076 bytes, GitHub-reported ZIP SHA-256 `1a7297a346c841f517c402f0faf84dde7066ead36651b6a9f1f9a7383189f617`. Failed source/audit/workflow blobs: `635a1c667697627c349e4139be4bfa3808ddbcc6` / `0693c8c32d28bee27ba39a3c5f594892b2c9cef0` / `f1d30254aabe8c7687b5b245be2fc6a05f443332`.

**Pinned interface inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, `LinearAlgebra/UnitaryGroup.lean`, blob `2bc60a3c9927cdbf9c28371d1b4e9f66b7447583`. The `OrthogonalGroup` section explicitly declares `variable (n) (R : Type v) [CommRing R]`. Hence the Iff is obtained by applying `Matrix.mem_orthogonalGroup_iff' SpaceIndex ℝ`; only then is `.1` valid. Earlier accepted `rw [Matrix.mem_orthogonalGroup_iff']` uses let the rewrite machinery instantiate those arguments and did not establish that the unapplied theorem itself was an Iff.

**Bounded repair:** introduce `horth : A.transpose * A = 1 := (Matrix.mem_orthogonalGroup_iff' SpaceIndex ℝ).1 hA`. Rewrite the existing Gram identity with the existing perturbation/identity equality, this completely typed `horth` and subtraction of one from itself. This replaces only the failed rewrite line with an instantiated proposition bridge. Every theorem statement, completion formula, original matrix/group carrier and spatial enumeration is unchanged.

Static comparison confirms that this is the only mathematical source change, all eight declaration signatures are identical, and the independent audit remains byte-identical at `0693c8c32d28bee27ba39a3c5f594892b2c9cef0`.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CKOrthogonalCompletionCoordinates.lean` | `98f847e34ada50f3c971c6ae3fa336667d0913f2` |
| `.github/workflows/bfss-kotler-v10h-f10ck-orthogonal-completion-coordinates-strict.yml` | `0a71402d3270ce6914a4053518fc8ab9453fae6c` |

The workflow updates only the candidate source pin and adds scope assertions for the complete instantiated membership equivalence, exact `horth` type and named rewrite. Every accepted ancestry/audit pin, eight-root requirement, warnings-as-errors policy, three-axiom whitelist, instance guard, legacy conditional-alias guard, negative-control check and 840/600-second fresh-phase caps remains unchanged. Local exact hashes, source-change scope, unchanged statements/audit, source-only pin change, scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; complete source and independent audit success remain required.

**Method lesson and next action:** inspect the declaration's full telescope, including section-level explicit parameters, before applying structure projections to a library theorem. Instantiate its index and coefficient types and name the exact proposition first; do not infer a projection interface from a successful rewrite use. This extends the existing explicit type/structure-field bridge method. Inspect both fresh phases and the global-noninjectivity control before qualification. Local matrix injectivity, full matrix recovery from upper coordinates, original source local fiber/kernel control, source neighborhood coverage, subgroup charts, tangent identifications, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CK accepted — native orthogonal completion-coordinate bridge

**Verified strict result:** [run 41754991438](https://github.com/etblink/math/actions/runs/41754991438), tested `b106e809965b8790d7679c74389e8a21fa6c62b0`, attempt 1, job `126328888649`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CJ rebuild, fresh warnings-as-errors CK compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CK_ORTHOGONAL_COMPLETION_COORDINATES_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the eight expected fully qualified roots, each once per phase, sixteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CKOrthogonalCompletionCoordinates.lean` | `98f847e34ada50f3c971c6ae3fa336667d0913f2` |
| `lean/diagnostics/FCP_K1D18V10HF10CKIndependentAudit.lean` | `0693c8c32d28bee27ba39a3c5f594892b2c9cef0` |
| `.github/workflows/bfss-kotler-v10h-f10ck-orthogonal-completion-coordinates-strict.yml` | `0a71402d3270ce6914a4053518fc8ab9453fae6c` |

All eight qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrthogonalCompletionMap`
2. `source9OrthogonalCompletionMap_zero`
3. `source9Matrix_perturbation_gram_identity`
4. `source9Orthogonal_perturbation_gram_zero`
5. `source9OrthogonalCompletionMap_on_orthogonal`
6. `source9OrderedUpperProjection_eq_iff_strict_entries`
7. `source9OrthogonalCompletionMap_eq_of_upperProjection_eq`
8. `source9OrthogonalCompletionMap_actual_reconstruction`

Retained artifact `13287758154`, `bfss-v10h-f10ck-orthogonal-completion-coordinates-b106e809965b8790d7679c74389e8a21fa6c62b0-1`, 4940 bytes, GitHub-reported ZIP SHA-256 `a2f72148b9e907f84041d643b9fcee6aca3ec8bbc499c57647a0a53848d69be0`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** the specified completion map acts on the original `Matrix SpaceIndex SpaceIndex ℝ` perturbation space. It retains strict upper entries, adds the quadratic Gram entries below the diagonal, and adds half the diagonal Gram entry on the diagonal. It maps zero to zero. The exact expansion `(1+B).transpose * (1+B) - 1 = B + B.transpose + B.transpose * B` is established without replacing the matrix carrier or operations.

For any native orthogonal matrix `A`, its perturbation `A - 1` satisfies the zero Gram-defect identity. Completion of this perturbation is exactly CA's original strict-upper-entry skew matrix. Equality under the accepted finite upper projection is equivalent to equality of all native strict upper entries, via the already chosen enumeration. Thus equal upper projections of orthogonal matrices give equal completion values of their perturbations. This does not yet give equality of the matrices.

In particular, on CJ's reconstruction domain, the actual natural matrix of the reconstructed source element and the actual natural matrix of the original input have equal completion values. The theorem uses their actual orthogonal-group subtype memberships and CJ's actual coordinate recovery; it does not assume equality of full matrices or source Spin elements.

The independent audit checks the standard matrix topology, literal polynomial finite-sum entry formula, upper-entry preservation, zero value, Gram expansion, orthogonal perturbation identity and collapse to the exact accepted native skew model. It checks the projection/native-entry equivalence, arbitrary native orthogonal-group inputs with equal upper entries, actual original/reconstructed natural matrices with explicit domain membership, and the completely expanded original source-word reconstruction interface using a named equality bridge.

**Accepted negative control:** the independent audit proves completion at `(-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1` is zero, while completion at zero is also zero. Their original zero-index diagonal entries prove the perturbations distinct. Hence the audit proves `¬ Function.Injective source9OrthogonalCompletionMap` on its full ambient matrix domain. Any eventual matrix-recovery theorem must retain a suitable local neighborhood restriction. This is not a statement that the negative identity matrix occurs in the actual source Spin representation's image.

**Repair outcome and successful method:** first run [41753221578](https://github.com/etblink/math/actions/runs/41753221578) remains a failed source compilation with skipped independent audit. The repair supplies the explicit `SpaceIndex` and `ℝ` parameters to `Matrix.mem_orthogonalGroup_iff'` before taking `.1`, and names the resulting exact orthogonality equality. Every mathematical statement and the audit remained unchanged. The complete repaired gate, including the global-noninjectivity control, now passes. Inspecting the complete library telescope and introducing a fully typed proposition bridge resolved the error without changing scope or limits.

No source/gamma replacement, new norm/topology or instance, authored admission, linter suppression, relaxed whitelist or proof-limit increase was introduced. The completion coordinates use the same native spatial labels and existing upper enumeration; the diagonal Gram factor does not alter the accepted rotor or generator normalization.

**Next bounded plan and ceiling:** qualify smoothness and the strict literal identity derivative at zero of this same completion map in the standard matrix product topology. Reuse finite-coordinate calculus and explicit function/operator bridges; do not introduce a normed-ring structure solely for the matrix product. Once the derivative gate passes, instantiate the pinned strict inverse-function constructor and extract local ambient injectivity. Combine that local result with the accepted completion identity only when both orthogonal perturbations lie in the established neighborhood. The global counterexample remains a permanent negative control. Full local matrix recovery, original source local fiber/kernel control, source neighborhood coverage, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves every earlier red and green record.


## F10CL candidate — smooth completion map and strict identity derivative

**Baseline:** live research branch checked at `f4e5a2226641d86cfa7dba4ee373179d7e385502`, the documentation-only CK acceptance commit. The duplicate user report of green run 41754991438 was already verified and accepted; no second qualification or duplicate acceptance commit is made. Root AGENTS and the canonical handoff reread. Previously checked ancestor instructions and all accepted mathematical modules remain unchanged.

**Bounded implementation:** retain exactly CK's `source9OrthogonalCompletionMap` on `Matrix SpaceIndex SpaceIndex ℝ`. Define a row/column entry continuous linear map using the original nested Pi projections and prove its literal evaluation formula. Express each actual Gram entry `(B.transpose * B) i j` by a named complete function equality with `∑ k : SpaceIndex, B k i * B k j`. Entry evaluation is continuous linear, so scalar products and finite sums give every-order smoothness of each Gram entry.

For each scalar product, separately type both evaluation derivatives at the actual zero matrix before applying the product rule. Both scalar values there are zero, so each product derivative and the finite Gram sum derivative are the literal zero CLM. State the sum function, derivative operator and evaluation point completely before rewriting through the named Gram-entry equality.

Use the fixed native index comparisons in CK's formula to obtain every-order smoothness of each completion entry, then assemble the two Pi levels. For the ordinary derivative, decompose the full literal identity operator through the two Pi derivative equivalences. An explicit equality, proved by continuous-linear-map extensionality, bridges the nested projection/identity compositions to the named entry CLM. Each branch has its entry derivative: upper entries are linear; lower and diagonal entries add zero quadratic derivatives, with the diagonal constant factor retained. Assemble the complete ordinary identity derivative and derive exact `fderiv` equality. Finally combine order-one smoothness with that specified ordinary derivative through the pinned strict-derivative API.

The construction does not install a matrix normed-ring instance or replace any norm/topology. Only real scalar product calculus is used for multiplication; the ambient domain/codomain remain the original full matrix space with its standard product topology. No inverse-function constructor or local injectivity theorem is introduced in this gate.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Analysis/Calculus/FDeriv/Add.lean`, blob `99f2c6461a9d095cfde92b3a93aa450da1f128e1`: complete `HasFDerivAt.fun_sum` function/operator family and finite-set interface.
- `Analysis/Calculus/FDeriv/Mul.lean`, blob `5c625329be59e8f6f32f242efbf6ccb9e783f1c5`: scalar product rule and multiplication by a fixed scalar.
- `Analysis/Calculus/FDeriv/Prod.lean`, blob `411b5f2f6a95bdce18d85ba51f9f21e78f36e770`: `hasFDerivAt_pi'` retains the prescribed full derivative operator and projects it coordinatewise.
- `Analysis/Calculus/ContDiff/Operations.lean`, blob `80e898b98348cb111761430989137705f4a3cf63`: finite sum and fixed-denominator regularity interfaces.
- `Analysis/Calculus/ContDiff/RCLike.lean`, blob `dff89ca9f7fee6191d8496a39a7aa2b1426fb6f0`: `ContDiffAt.hasStrictFDerivAt'` requires the ordinary derivative and nonzero regularity order, as already used successfully in CF.

Eight pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9CompletionEntryCLM`
2. `source9CompletionEntryCLM_apply`
3. `source9CompletionGramEntry_contDiff`
4. `source9CompletionGramEntry_hasFDerivAt_zero`
5. `source9OrthogonalCompletionMap_contDiff`
6. `source9OrthogonalCompletionMap_hasFDerivAt_zero`
7. `source9OrthogonalCompletionMap_fderiv_zero`
8. `source9OrthogonalCompletionMap_hasStrictFDerivAt_zero`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CLCompletionSmoothStrictDerivative.lean` | `810b849b50b94320d66c3b724fa121e5ff07888d` |
| `lean/diagnostics/FCP_K1D18V10HF10CLIndependentAudit.lean` | `4df471178bd0045ccdf7fea3e12da06d78bd0e9b` |
| `.github/workflows/bfss-kotler-v10h-f10cl-completion-smooth-strict-derivative-strict.yml` | `9a2b2d5efadffc01059d004d9fa485aa088143f7` |

**Independent audit:** capture and check the standard matrix topology before/after the elementwise norm scope; check completeness for the same full matrix space. Check the exact entry CLM and literal evaluation, Gram-entry regularity at every order, literal zero Gram-entry derivative and its evaluation on every matrix direction. Check completion regularity at every order, full ordinary identity derivative, full `fderiv` equality and strict identity derivative. Evaluate the full derivative on every original matrix direction and every original row/column.

Independently prove named full function equalities for the Gram entry's literal sum and the completion map's completely expanded piecewise finite-sum expression. Transport all required regularity and derivative checks through those equalities instead of deeply unfolding literal interfaces. The audit retains CK's concrete global noninjectivity control in full: both zero and the perturbation from the identity to the negative identity have completion zero, and their original diagonal entries are distinct. This control does not assert anything about the negative identity lying in the actual source Spin representation's image.

**Verification discipline:** preserve all accepted ancestry pins through CK's repaired source and unchanged audit, add exact CL source/audit pins, rebuild CK and freshly compile CL and its independent audit with warnings-as-errors. Require exactly eight expected permitted root reports per phase and terminal classifier `V10H_F10CL_COMPLETION_SMOOTH_STRICT_DERIVATIVE_TYPES_AXIOMS_PASS`. Keep the three-axiom whitelist, 840/600-second fresh-phase caps, no-instance-registration guard, legacy conditional-alias guard and evidence preservation. No source/gamma substitution, new norm/topology/instance, authored admission, linter suppression or custom proof limit is introduced. Local exact hashes, accepted-pin preservation, eight-root scope preflight, YAML, all three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all eight roots remain candidates pending complete strict CI.

**Next action and ceiling:** inspect complete fresh compilation and independent literal-function/operator audit before qualification. If accepted, instantiate the pinned strict inverse-function constructor with this same map, its strict literal identity derivative and the identity continuous linear equivalence on the full original matrix space. Extract zero source-neighborhood membership and local injectivity with explicit hypotheses. Combine that future result with CK's orthogonal completion identity only when both perturbations lie in the accepted ambient neighborhood. The global counterexample forbids dropping locality. Full local matrix recovery, original source local fiber/kernel control, source Spin neighborhood coverage, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all earlier red and green evidence.


## F10CL first strict run RED — explicit zero-sum and full Pi-operator transport

**Preserved negative evidence:** [run 41778629430](https://github.com/etblink/math/actions/runs/41778629430), tested `b5dc7d1b3c7e6e11975dd6bbe6287b5c34e1bf91`, attempt 1, job `126404758254`, completed/failure. Exact pins and scope preflight, pinned environment restoration and accepted CK rebuild passed. Fresh CL source compilation failed; the independent audit was skipped and the terminal classifier did not run. Zero CL roots are qualified.

Two source diagnostics were observed:

1. Line 60:4: after `simpa`, the finite-sum derivative still has derivative operator `∑ i, 0`, whereas the target requires the literal zero CLM. The scalar product derivatives themselves were obtained; automatic simplification did not bridge this operator equality.
2. Line 100:6: `rw [hoperator]` failed even though the displayed nested projection/identity composition looked identical to the rewrite pattern. Lean's diagnostic says the target is not type-correct under implicit transparency and reports `function expected source9OrthogonalCompletionMap x i`. This occurs inside the goal produced by two prescribed-operator Pi projections of a matrix-valued function. The named operator equality alone did not make that target safe for the rewrite matcher.

The entry CLM, its evaluation, Gram-entry smoothness and whole completion-map smoothness print only permitted axioms. The Gram-entry derivative and its dependent full ordinary/fderiv/strict derivative roots contain compiler-recovery `sorryAx`. These reports are invalid partial output, not authored admissions or qualification. The independent literal-function/operator audit and its global-noninjectivity control have not yet elaborated.

Retained artifact `13298865512`, `bfss-v10h-f10cl-completion-smooth-strict-derivative-b5dc7d1b3c7e6e11975dd6bbe6287b5c34e1bf91-1`, 1285 bytes, GitHub-reported ZIP SHA-256 `b71850198a41500bbb82693ae1810d9d6596bb4835dac04d1651ecd0dd8bcfc8`. Failed source/audit/workflow blobs: `810b849b50b94320d66c3b724fa121e5ff07888d` / `4df471178bd0045ccdf7fea3e12da06d78bd0e9b` / `9a2b2d5efadffc01059d004d9fa485aa088143f7`.

**Pinned interface inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Algebra/BigOperators/Group/Finset/Defs.lean`, blob `0eec64f2576f4d449b44b877678fe95678cfc9f0`: the additive `Finset.sum_const_zero` theorem is generated from `prod_const_one` and supplies the exact finite zero-sum equality.
- `Analysis/Calculus/FDeriv/Prod.lean`, blob `411b5f2f6a95bdce18d85ba51f9f21e78f36e770`: `hasFDerivAt_pi` assembles a full Pi derivative from a family of entry derivatives with operator `ContinuousLinearMap.pi`. This allows full-operator equality to be checked independently instead of rewriting inside the problematic prescribed-operator Pi goal.

**Bounded repairs:** retain the finite-sum theorem's exact derivative operator in a completely typed `hsum`. State `hzero` as the exact equality of that sum with the literal zero CLM, proved directly by `Finset.sum_const_zero`. Apply `congrArg` to the fully typed derivative predicate and use `Eq.mp` to transport the result. Retain the existing named Gram-function equality and all product-rule proofs.

For the whole map, first prove each entry derivative in a separately typed `hentry`. Assemble them through the two ordinary `hasFDerivAt_pi` interfaces into `hmatrix` with an explicit nested `ContinuousLinearMap.pi` operator. Prove that this complete operator equals the literal matrix identity by CLM extensionality. Apply `congrArg` to the complete `HasFDerivAt source9OrthogonalCompletionMap` predicate and transport with `Eq.mp`. No rewrite is applied inside the nested matrix/Pi goal. The branch derivatives, function, point and final derivative operator are unchanged.

Static comparison confirms that only the Gram-entry ordinary derivative proof and whole-map ordinary derivative proof change. Every declaration signature is identical, the smoothness and strict-derivative statements remain the same, and the independent audit is byte-identical at `4df471178bd0045ccdf7fea3e12da06d78bd0e9b`.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CLCompletionSmoothStrictDerivative.lean` | `34346c73eb3f294831710ea1a6412f75d6d0b2ae` |
| `.github/workflows/bfss-kotler-v10h-f10cl-completion-smooth-strict-derivative-strict.yml` | `1eb92241e3ecc07fd9ae084059a5c170d4cded66` |

The workflow updates only the candidate source pin and the corresponding scope assertions for the exact zero-sum bridge, typed proposition transport and full Pi assembly. All accepted ancestry/audit pins, eight-root requirements, warnings-as-errors, three-axiom whitelist, instance/legacy-alias guards, global-noninjectivity control and 840/600-second fresh-phase caps remain. Local exact hashes, two-proof scope, unchanged statements/audit, source-only pin change, scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; complete source and independent audit success remain required.

**Method lesson and next action:** when simplification leaves a finite operator sum, prove the exact operator equality separately and transport the complete derivative proposition. When a target is not type-correct at a tactic's transparency level, adding an equality and feeding it back into the same rewrite matcher is insufficient. Assemble a well-typed complete operator independently, prove its identity, then transport through the fully typed predicate. Neither diagnostic justifies raising limits or changing norm/topology instances. Inspect both fresh phases before qualification. Local matrix injectivity, full local matrix recovery, original source local fiber/kernel control, source neighborhood coverage, subgroup charts, tangent identifications, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CL second strict run RED — complete scalar-branch operator transport

**Preserved negative evidence:** [run 41780259692](https://github.com/etblink/math/actions/runs/41780259692), tested `1f28270099f0640e615db0525218cd0413cdb2a0`, attempt 1, job `126409936940`, completed/failure. Exact pins and scope preflight, pinned environment restoration and accepted CK rebuild passed. Fresh CL source compilation failed; independent audit was skipped and the terminal classifier did not run. Zero CL roots are qualified.

**Progress relative to the first red:** the explicit finite zero-sum transport now elaborates, and the Gram-entry ordinary derivative prints only permitted axioms. The earlier prescribed-operator Pi rewrite diagnostic is absent after the full Pi assembly/typed proposition transport change. The remaining three diagnostics are confined to scalar branches of the whole-map ordinary derivative:

1. Line 106:8: `he.add hq` retains derivative `source9CompletionEntryCLM i j + 0` instead of the entry CLM. Its function is displayed as pointwise function addition instead of the explicit entry-sum lambda.
2. Line 111:10: multiplication of the zero Gram derivative by the fixed reciprocal leaves `2⁻¹ • 0` as derivative instead of the literal zero CLM.
3. Line 112:8: `he.add hhalf` again retains `source9CompletionEntryCLM i j + 0`, now for the diagonal branch.

The five roots for entry evaluation, Gram smoothness, Gram ordinary derivative and whole-map smoothness print only permitted axioms. The whole-map ordinary derivative and its fderiv/strict-derivative consequences contain compiler-recovery `sorryAx`. These are invalid partial reports, not authored admissions or qualification. The independent audit, including its full literal-function tests and retained global-noninjectivity control, has not yet elaborated.

Retained artifact `13299167785`, `bfss-v10h-f10cl-completion-smooth-strict-derivative-1f28270099f0640e615db0525218cd0413cdb2a0-1`, 982 bytes, GitHub-reported ZIP SHA-256 `f569b897f4ee4064d5697783e1e7b3ff74597d25bbba56d8cdf870509c4469b7`. Failed source/audit/workflow blobs: `34346c73eb3f294831710ea1a6412f75d6d0b2ae` / `4df471178bd0045ccdf7fea3e12da06d78bd0e9b` / `1eb92241e3ecc07fd9ae084059a5c170d4cded66`.

**Bounded repair:** extend the successful explicit operator-transport method consistently through the remaining scalar branches. A local typed `hadd` helper retains the exact derivative `L + 0`, proves its equality to `L` directly with `add_zero L`, and transports the complete derivative proposition by `Eq.mp (congrArg ...)`. For fixed division, retain the multiplication-rule operator `2⁻¹ • 0`, prove its literal zero equality by `smul_zero`, and transport the complete derivative proposition. Prove the complete division/multiplication function equality separately with `div_eq_mul_inv`, then transport the function argument. For each lower/diagonal branch, separately prove the full equality of the completion-entry function and its literal scalar formula, then transport the already typed derivative through that equality.

This removes dependence on automatic simplification of the three remaining CLM algebra expressions and separates function-shape normalization from derivative-operator normalization. The preceding corrected Gram-entry proof and the full Pi-operator assembly/identity transport are retained. All evaluation points and final operators stay literal and explicit; no derivative, locality requirement, carrier or regularity order changes.

Static comparison confirms that only `source9OrthogonalCompletionMap_hasFDerivAt_zero`'s proof changes. Every declaration signature and all other declaration bodies, including the corrected Gram-entry derivative, remain unchanged. The independent audit is byte-identical at `4df471178bd0045ccdf7fea3e12da06d78bd0e9b`.

Repaired files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CLCompletionSmoothStrictDerivative.lean` | `902b063ca869c7efeea21828cdf3f97847c96b70` |
| `.github/workflows/bfss-kotler-v10h-f10cl-completion-smooth-strict-derivative-strict.yml` | `79295806960a04903b548671a267225bc12da589` |

The workflow updates only the candidate source pin and adds scope assertions for the local addition bridge, literal addition/scalar-zero equalities and full function transports. All accepted ancestry/audit pins, eight-root requirements, warnings-as-errors, three-axiom whitelist, instance/legacy-alias guards, global-noninjectivity control and 840/600-second fresh-phase caps remain. Local exact hashes, one-proof scope, unchanged statements/other proofs/audit, source-only pin change, scope preflight, YAML, trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; fresh source and independent audit success remain required.

**Method lesson and next action:** once operator simplification fails in a representation-sensitive derivative statement, inspect the complete remaining operator algebra rather than repairing just its first sum. Addition of zero and scalar multiplication of zero need the same standalone typed-equality/proposition-transport treatment. Normalize function shape separately from the derivative operator. Preserve and reuse the portions the new run actually elaborates; do not repeat the earlier failed Pi rewrite or raise limits. Inspect both fresh phases before qualification. Local matrix injectivity/recovery, original source local fiber/kernel control, source neighborhood coverage, subgroup charts, tangent identifications, the full F10BC manifold differential and BFSS physical conclusions remain open.


## F10CL accepted — completion smoothness and strict matrix identity derivative

**Verified strict result:** [run 41782743051](https://github.com/etblink/math/actions/runs/41782743051), tested `1eb18d6e7979c134480c643e29c99cbdfb2d1fdf`, attempt 1, job `126417824440`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CK rebuild, fresh warnings-as-errors CL compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CL_COMPLETION_SMOOTH_STRICT_DERIVATIVE_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the eight expected fully qualified roots, each once per phase, sixteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CLCompletionSmoothStrictDerivative.lean` | `902b063ca869c7efeea21828cdf3f97847c96b70` |
| `lean/diagnostics/FCP_K1D18V10HF10CLIndependentAudit.lean` | `4df471178bd0045ccdf7fea3e12da06d78bd0e9b` |
| `.github/workflows/bfss-kotler-v10h-f10cl-completion-smooth-strict-derivative-strict.yml` | `79295806960a04903b548671a267225bc12da589` |

All eight qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9CompletionEntryCLM`
2. `source9CompletionEntryCLM_apply`
3. `source9CompletionGramEntry_contDiff`
4. `source9CompletionGramEntry_hasFDerivAt_zero`
5. `source9OrthogonalCompletionMap_contDiff`
6. `source9OrthogonalCompletionMap_hasFDerivAt_zero`
7. `source9OrthogonalCompletionMap_fderiv_zero`
8. `source9OrthogonalCompletionMap_hasStrictFDerivAt_zero`

Retained artifact `13300366721`, `bfss-v10h-f10cl-completion-smooth-strict-derivative-1eb18d6e7979c134480c643e29c99cbdfb2d1fdf-1`, 4943 bytes, GitHub-reported ZIP SHA-256 `f8561719b722c39ac1a183ca265f3240532a9a9f6e35d74bedd794e44b2036fa`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** the original row/column evaluation is bundled continuously and linearly with its exact entry formula. Every actual Gram entry `(B.transpose * B) i j` is `ContDiff ℝ n` for every `n : ℕ∞ω` and has the literal zero CLM as its ordinary derivative at zero. The same accepted CK completion map is `ContDiff ℝ n` at every order on the original full matrix perturbation space. Its ordinary derivative at zero is exactly `ContinuousLinearMap.id ℝ (Matrix SpaceIndex SpaceIndex ℝ)`, its full `fderiv` equals that identity, and its strict derivative at zero is that same literal identity operator.

The proof uses scalar entry evaluation, scalar products and finite sums, followed by assembly of the two original Pi levels. It does not install a new norm, topology, matrix normed ring or instance. The matrix carrier and completion function remain exactly CK's. The diagonal factor and original spatial labels are unchanged.

The independent audit checks the standard matrix product topology before/after the elementwise norm scope and completeness of the same space. It checks exact entry evaluation, every-order Gram regularity, zero Gram derivative and evaluation on every original matrix direction. It checks every-order completion smoothness, full ordinary/strict identity derivative and full fderiv equality, including every direction and every original row/column entry. Separately proved complete function equalities transport the Gram and completion results to their literal finite-sum formulas. Thus the strict derivative applies to the fully expanded accepted map, not a surrogate function.

The unchanged audit again proves the ambient-global-noninjectivity control using zero and the perturbation from the identity to the negative identity. This negative result remains compatible with the strict derivative at zero and requires any subsequent injectivity theorem to retain locality. No assertion is made that the negative identity is an actual natural source Spin image.

**Repair outcomes and successful method:** first red [41778629430](https://github.com/etblink/math/actions/runs/41778629430) exposed an unreduced finite zero-operator sum and a rewrite inside a matrix/Pi target that was not type-correct under the rewrite matcher's implicit transparency. Second red [41780259692](https://github.com/etblink/math/actions/runs/41780259692) showed those repairs working and isolated the remaining scalar-branch additions/scalar-zero operators and function shapes. Both failed source runs remain preserved; neither qualified any CL roots.

The successful implementation proves exact operator equalities independently and transports complete typed derivative predicates with `Eq.mp (congrArg ...)`. It separately normalizes the function argument with complete named function equalities. The full derivative is assembled as an explicit nested Pi CLM and identified with the literal identity by extensionality, outside the fragile projected target. This method covers finite sums, addition of zero, scalar multiplication of zero, division/multiplication function equality and branch functions consistently. Every theorem statement and the independent audit remained unchanged across the repairs. No authored admission, linter suppression, relaxed whitelist, proof-limit increase, gamma/carrier replacement or norm/topology change was introduced.

**Next bounded plan and ceiling:** instantiate the pinned strict inverse-function constructor on this same full matrix completion map, using its strict literal identity derivative, the identity continuous linear equivalence and standard matrix completeness. Independently audit the exact forward function, zero source/target memberships, open neighborhoods, local inverse identities and injectivity with explicit source membership. Then combine local ambient injectivity with CK's orthogonal-completion equality only when both perturbations lie in the established neighborhood. The global negative control forbids dropping those hypotheses. Full local natural-matrix recovery, original source local fiber/kernel control, source Spin neighborhood coverage, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves every prior red and green record.


## F10CM candidate — completion local inverse and ambient local injectivity

**Baseline:** live research branch checked at `d368452783ce0f7bef6e26184f317367008a43f0`, the documentation-only CL acceptance commit. Root AGENTS and current canonical handoff reread. Previously checked ancestor instructions and every accepted mathematical module remain unchanged.

**Bounded implementation:** reuse the successful CG constructor/identity-transport pattern on the existing full `Matrix SpaceIndex SpaceIndex ℝ` domain and codomain. Expose CL's strict literal identity derivative through `ContinuousLinearEquiv.refl ℝ (Matrix SpaceIndex SpaceIndex ℝ)`. Instantiate the pinned `HasStrictFDerivAt.toOpenPartialHomeomorph` constructor with this explicit equivalence and the exact accepted `source9OrthogonalCompletionMap`. The new `source9OrthogonalCompletionLocalHomeomorph` is an open partial homeomorphism of that same full matrix space.

Prove the complete forward-function equality, zero membership in the source and target, and both local inverse identities with explicit source/target membership hypotheses. Transport the generic inverse identities through the complete forward-function equality with typed matrix-function evaluation/congruence. Derive `Set.InjOn source9OrthogonalCompletionMap` on the constructed source by applying the actual left inverse to equal completion images. Both matrices' source-membership assumptions are retained. No full matrix recovery from upper entries is inferred yet.

**Pinned API inspection:** Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`, blob `e628f119f19643501a84e461c29575ff1365d511`: complete constructor, explicit forward function, identity-equivalence interface, complete-domain requirement, exact forward-function theorem and source/forward-image target memberships.
- `Topology/OpenPartialHomeomorph/Defs.lean`, blob `9754374286e46a881a41d0977869a571d2353e79`: complete left/right inverse laws, each requiring its relevant membership hypothesis.
- The inverse continuity and open-neighborhood interfaces are the same pinned APIs already used successfully in CG and CI. Completeness of the standard full matrix space is checked independently, as in CL.

Eight pending roots in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrthogonalCompletionMap_hasStrictFDerivAt_refl`
2. `source9OrthogonalCompletionLocalHomeomorph`
3. `source9OrthogonalCompletionLocalHomeomorph_coe`
4. `source9OrthogonalCompletionLocalHomeomorph_zero_mem_source`
5. `source9OrthogonalCompletionLocalHomeomorph_zero_mem_target`
6. `source9OrthogonalCompletionLocalHomeomorph_left_inv`
7. `source9OrthogonalCompletionLocalHomeomorph_right_inv`
8. `source9OrthogonalCompletionMap_injOn_source`

Candidate files:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CMCompletionLocalInverse.lean` | `04281724e6305c3d3d06c001fd3e37b91b17962f` |
| `lean/diagnostics/FCP_K1D18V10HF10CMIndependentAudit.lean` | `db0462336ba7bd677cec97de3aa8a94456d9f820` |
| `.github/workflows/bfss-kotler-v10h-f10cm-completion-local-inverse-strict.yml` | `610c676222be3e0177348bfa53d71f3211c3fc50` |

**Independent audit:** capture and check the original standard matrix topology before/after the elementwise norm scope; check completeness and the literal identity equivalence/CLM equality. Check the exact strict-derivative interface, complete open-partial-homeomorphism type, complete forward-function equality and zero source/target memberships. Check both open sets as actual zero neighborhoods, inverse continuity at zero, the two local inverse laws and inverse value zero. Check local injectivity with its exact source set and recovery of matrix equality from equality of every completion entry.

Independently prove a named equality between the accepted completion map and its full original-label piecewise finite-sum formula. Check the forward entry formula, literal-function left inverse, every literal right-inverse entry and injectivity of the completely expanded map on the same source set. Use typed `congrArg` matrix-entry evaluation on whole matrix equalities, avoiding fragile deep normalization or rewriting inside projected matrix derivative targets.

The audit retains CK/CL's global counterexample and `¬ Function.Injective source9OrthogonalCompletionMap` on the entire ambient domain. It additionally checks that the perturbation `(-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1` is not in this local injective source: otherwise its zero completion image and the accepted zero source member would contradict local injectivity at their distinct original diagonal entries. This is an explicit locality control, not a claim about which matrices lie in the actual source Spin image.

**Verification discipline:** preserve accepted ancestry pins through CL's repaired source and unchanged audit, add exact CM source/audit pins, rebuild CL and freshly compile CM and its independent audit with warnings-as-errors. Require exactly eight expected permitted root reports in each phase and terminal classifier `V10H_F10CM_COMPLETION_LOCAL_INVERSE_TYPES_AXIOMS_PASS`. Keep the three-axiom whitelist, 840/600-second fresh-phase caps, no-instance-registration guard, legacy conditional-alias guard and evidence preservation. No new norm/topology/instance, gamma/carrier replacement, authored admission, linter suppression or custom proof limit is introduced. Local exact hashes, accepted-pin preservation, eight-root scope preflight, YAML, all three trigger paths, every shell block and both embedded Python blocks pass. No local Lean executable is available; all eight roots and the new audit controls remain candidates until complete strict CI succeeds.

**Next action and ceiling:** inspect complete fresh compilation and independent literal-function/locality audit before qualification. If accepted, combine CM's local ambient injectivity with CK's exact orthogonal-completion identity to prove full matrix equality for orthogonal inputs with equal native upper coordinates, requiring both perturbations `A - 1` and `B - 1` to lie in this source neighborhood. Then inspect the corresponding actual original/reconstructed natural matrices under those same explicit hypotheses before selecting any smaller source Spin neighborhood. Original source local fiber/kernel control remains separate even after full natural-matrix equality. Source image openness/coverage, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. Preserve all previous red and green evidence.


## F10CM accepted — completion local inverse and ambient matrix local injectivity

**Verified strict result:** [run 41784700161](https://github.com/etblink/math/actions/runs/41784700161), tested `3626ee413b72781aa34d8344fbc79963c598b03f`, attempt 1, job `126424063819`, completed/success with all ten recorded steps successful. Exact accepted ancestry/candidate pins, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, accepted CL rebuild, fresh warnings-as-errors CM compilation, complete independent audit and evidence preservation passed.

The actual terminal classifier is `V10H_F10CM_COMPLETION_LOCAL_INVERSE_TYPES_AXIOMS_PASS`. Both fresh Lean phases report exactly the eight expected fully qualified roots, each once per phase, sixteen total. All reports use only `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or source-level warning/error appears. The exact tested commit, terminal run state, all ten step verdicts, decoded log, actual terminal marker, root multiplicities, axiom whitelist, artifact metadata and all three tested blob identities were checked before acceptance.

Accepted files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CMCompletionLocalInverse.lean` | `04281724e6305c3d3d06c001fd3e37b91b17962f` |
| `lean/diagnostics/FCP_K1D18V10HF10CMIndependentAudit.lean` | `db0462336ba7bd677cec97de3aa8a94456d9f820` |
| `.github/workflows/bfss-kotler-v10h-f10cm-completion-local-inverse-strict.yml` | `610c676222be3e0177348bfa53d71f3211c3fc50` |

All eight qualified roots are in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrthogonalCompletionMap_hasStrictFDerivAt_refl`
2. `source9OrthogonalCompletionLocalHomeomorph`
3. `source9OrthogonalCompletionLocalHomeomorph_coe`
4. `source9OrthogonalCompletionLocalHomeomorph_zero_mem_source`
5. `source9OrthogonalCompletionLocalHomeomorph_zero_mem_target`
6. `source9OrthogonalCompletionLocalHomeomorph_left_inv`
7. `source9OrthogonalCompletionLocalHomeomorph_right_inv`
8. `source9OrthogonalCompletionMap_injOn_source`

Retained artifact `13300958361`, `bfss-v10h-f10cm-completion-local-inverse-3626ee413b72781aa34d8344fbc79963c598b03f-1`, 4290 bytes, GitHub-reported ZIP SHA-256 `e4077b02128cc7d24f1b066fd9789882e455a6f1a4778ab97c351943b035f985`. This records GitHub's metadata; no independent binary archive digest calculation is claimed.

**Qualified mathematical content:** CL's strict literal identity derivative is exposed through the identity continuous linear equivalence on the original full matrix space. The inspected strict inverse-function constructor yields `source9OrthogonalCompletionLocalHomeomorph`, with domain and codomain `Matrix SpaceIndex SpaceIndex ℝ` and complete forward function exactly `source9OrthogonalCompletionMap`. Zero belongs to both open source and target. The inverse recovers each matrix in the source from its completion value, and the completion map recovers each matrix in the target from its inverse. Both laws retain their explicit source/target membership assumptions.

Consequently the actual completion map is injective on this constructed source set. Both matrices must belong to that source. This is ambient local injectivity of the accepted completion map, not yet a theorem recovering orthogonal matrices from upper entries or recovering original source Spin elements from their natural matrices.

The independent audit checks the standard matrix topology, completeness, literal identity equivalence/operator interface, exact open-partial-homeomorphism type, complete forward equality, zero memberships and both open sets as zero neighborhoods. It checks inverse continuity and inverse value zero, local inverse laws and injectivity. A separately proved complete function equality connects the map with its original-label piecewise finite-sum formula. The audit checks the literal forward entry formula, complete literal left inverse, every literal right-inverse entry, injectivity of that expanded map and recovery from equality of every completion entry. Typed matrix-entry congruence avoids the earlier projected-target normalization failures.

**Locality controls:** the unchanged global counterexample remains checked: completion at zero and at the perturbation `(-1 : Matrix SpaceIndex SpaceIndex ℝ) - 1` is zero, so global ambient injectivity is false. The audit additionally proves that this nonzero perturbation cannot belong to the constructed local source, because local injectivity and the accepted zero source member would then equate their distinct original diagonal entries. Thus locality is retained both in theorem statements and in an explicit exclusion check. No assertion is made about the negative identity occurring in the actual source Spin image.

**Successful method:** reuse the accepted CG constructor and typed inverse-identity transport on the full native matrix space. Supply the actual forward map and identity continuous linear equivalence explicitly, retain complete forward-function equality, and transport the generic inverse laws with typed matrix-function evaluation/congruence. Derive local injectivity from the actual left inverse. This first CM strict run passed without repair. No norm/topology/instance replacement, source/gamma substitution, authored admission, linter suppression, relaxed whitelist or proof-limit increase was introduced.

**Next bounded plan and ceiling:** combine CM's local ambient injectivity with CK's exact orthogonal completion identity. For native orthogonal matrices `A` and `B` with equal accepted upper projections, require both perturbations `A - 1` and `B - 1` to belong to CM's source before concluding the full matrices equal. Audit the complete matrix conclusion and all neighborhood/membership hypotheses, then apply it to the actual original/reconstructed natural matrices under those same conditions. Choosing a suitable smaller original-source neighborhood and controlling the original source representation's local fibers remain separate obligations. Full local orthogonal-matrix recovery, original source local kernel control, source Spin neighborhood coverage, subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. This acceptance-only update changes only the canonical handoff and preserves every earlier red and green record.


## F10CN candidate — full local orthogonal recovery and actual natural-matrix reconstruction

**Base and scope:** implemented on accepted F10CM handoff head `e8a50686c8895e86251aaa0ab7f555a0f6a7397d`, after strict CM run [41784700161](https://github.com/etblink/math/actions/runs/41784700161). This bounded candidate combines CK's exact orthogonal completion identity with CM's injectivity on its constructed matrix source. No prior source, audit or workflow is edited.

**Eight candidate roots**, all in `FCP.BFSSPairedSpin9Clifford`:

1. `source9OrthogonalRecoveryNeighborhood`
2. `source9OrthogonalRecoveryNeighborhood_isOpen`
3. `source9OrthogonalRecoveryNeighborhood_one_mem`
4. `source9Orthogonal_eq_of_upperProjection_eq_near_one`
5. `source9OrderedUpperProjection_injOn_orthogonal_near_one`
6. `source9Orthogonal_eq_of_strict_entries_eq_near_one`
7. `source9NaturalMatrices_eq_of_upperCoordinates_eq_near_one`
8. `source9NaturalMatrix_reconstruction_eq_near_one`

The neighborhood is exactly the preimage of CM's source under `A ↦ A - 1` on the original full matrix space. Its candidate openness and identity membership use the ordinary matrix topology and subtraction continuity. For two native orthogonal matrices in this set, equal accepted upper coordinates yield equal completion values; CM injectivity equates their perturbations, and an explicitly typed addition bridge recovers full matrix equality. The finite native-pair statement and intersection-set injectivity retain all orthogonality and neighborhood conditions.

The actual-source application concerns `source9SpinVectorOrthogonalHom` on the original `spinGroup source9Quadratic`. Both actual natural matrices must lie in the same neighborhood. Reconstruction additionally requires the accepted CJ reconstruction-domain membership. Only full natural-matrix equality is concluded; source Spin equality is not inferred.

**Independent audit:** standard matrix topology is captured before the existing norm scope and checked unchanged. The audit checks the literal neighborhood preimage, its exact membership characterization, openness, identity membership and neighborhood property. It checks full matrix equality, the exact orthogonal/intersection injectivity type, native strict-pair indexing and the finite enumeration on actual orthogonal subtypes. Actual-source and reconstructed/original full natural-matrix conclusions, arbitrary matrix entries, and the literal accepted finite-word reconstruction formula are independently typed. Complete matrix equalities and typed entry congruence follow the successful CL/CM method; no fragile projected derivative target normalization is introduced.

Locality remains explicit. The accepted completion-map global collision and its exclusion from CM's source are rechecked; the audit consequently excludes `-I` from the translated recovery neighborhood. It also independently checks that the accepted upper projection is not injective on the entire orthogonal group, using `I` and `-I`. This is a counterexample on the orthogonal group, with no assertion that `-I` belongs to the actual source Spin image.

Candidate files and exact blobs:

| File | Blob SHA |
|---|---|
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CNLocalOrthogonalRecovery.lean` | `897ea47e2ac9e7ef937fabbb74178073d18f52c5` |
| `lean/diagnostics/FCP_K1D18V10HF10CNIndependentAudit.lean` | `75c9abb205c1db13f9e4ed281f1e9c1b0bf954f4` |
| `.github/workflows/bfss-kotler-v10h-f10cn-local-orthogonal-recovery-strict.yml` | `e6404ef2dc183c8ae1509d6dd9357832decd8038` |

**Gate and local checks:** all 65 accepted ancestry pins remain unchanged, with two exact candidate source/audit pins appended. The gate rebuilds accepted CM, removes the fresh candidate olean, then compiles CN and its independent audit with warnings as errors and the unchanged 840/600-second phase caps. The expected terminal classifier is `V10H_F10CN_LOCAL_ORTHOGONAL_RECOVERY_TYPES_AXIOMS_PASS`. Each phase must report exactly the eight expected fully qualified roots, using only `propext`, `Classical.choice`, and `Quot.sound`; actual Lean errors/warnings and `sorryAx` are rejected. Evidence is retained even on failure. YAML, all run-block bash syntax, both Python ASTs, the executable source-scope preflight, exact local/remote pinned blobs, ancestry-pin preservation, trigger scope and phase caps were checked. No local Lean executable is available; no elaboration success is claimed before complete CI.

**Next action and ceiling:** inspect the complete strict source/audit outcome and retain any red diagnostic before repairing. If accepted, choose a smaller original-source neighborhood where CJ reconstruction is defined and both actual natural matrices satisfy this matrix neighborhood condition. Original source local fiber/kernel control is still required before converting natural-matrix equality into source equality or source word-image coverage. Subgroup charts, tangent identifications, determinant/covering results, the full F10BC manifold differential and BFSS physical conclusions remain open. No authored admission, instance registration, norm/topology replacement, gamma/carrier substitution, linter suppression, limit increase, main/frozen-FCP/upstream change or upstream PR is introduced.
