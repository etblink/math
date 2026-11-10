# BFSS — upstream proof reuse and unified research-branch chronology

**Prepared:** 2026-11-09 (America/Los_Angeles)  
**Disposition:** RESEARCH MEMORANDUM / CHRONOLOGICAL NAVIGATION / NO NEW MATHEMATICAL ACCEPTANCE  
**Repository:** `etblink/math`  
**Active branch:** `integration/bfss-unified-research-20261108`  
**Read-only audit baseline:** `2e260bbeac70a8aa035b72bdbdda99db7984bb2b`  
**Most recent verified strict green:** [P2b-A #42736594947](https://github.com/etblink/math/actions/runs/42736594947), exact commit `2e260bbeac70a8aa035b72bdbdda99db7984bb2b`  
**Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`  
**Upstream `openai/math` inspection pin:** `4eaee87548250b2682affda7d05d947c05554bae`

> This is a durable research checkpoint, not a qualified Lean theorem. Preserve source fidelity, exact run/commit/consumer receipts, and negative knowledge. Do not turn a green workflow into a spectral claim. No Lean source, original BFSS physical carrier, strict-gate manifest, workflow, or accepted theorem was modified in preparing this memorandum.

## 1. What the current branch actually is

The unified branch is **a chronological descendant**, not a separate restart or a replacement for old work. GitHub compare results at the read-only baseline show:

| Compared ancestor ref | Exact ancestor HEAD / merge base | Unified branch ahead | Unified branch behind |
| --- | --- | ---: | ---: |
| `main` | `fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` | 1,214 | 0 |
| `integration/community-20261027-bfss` | `d931f88731e5acb07ccd431d2edabfaa6c7b1734` | 978 | 0 |
| `research/fcp-k1d17-ancestor-cache-pilot-20261028` | `4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e` | 268 | 0 |
| `research/bfss-spectral-confinement-roadmap-20261106` | `5fbe86b73784efa429d01c5b338990540896b1de` | 229 | 0 |
| `research/bfss-original-gamma-faithfulness-20261107` | `d3e524c0b660cec8f55f42ae1fb6019ae5afd7b7` | 100 | 0 |

The **unified branch was based exactly on `d3e524c0b660...`**, whose commit timestamp is 2026-11-08 16:02:55 PST (2026-11-09 00:02:55 UTC). The branch's original [unified entry point](UNIFIED_RESEARCH_ENTRYPOINT_2026_11_08.md) records that same parent. The comparison distances are ancestry distances **at this snapshot**, not numbers of independently qualified theorems, not counts of unique ideas, and not numbers of conflicts resolved. They will change as this branch advances.

The parent chain establishes a useful map:

```text
community integration ancestry
  → FCP K1D17 source/provenance research
    → spectral confinement/Spin(9) roadmap
      → original-gamma-faithfulness and original-Fock workbench
        → unified integration (2026-11-08, parent d3e524c0)
          → OP3 source-bound automorphism development
            → P2a → P2b-A (accepted)
              → P2b-B1 (next candidate; not implemented)
```

**Crucial distinction:** Git ancestry proves that commits are inherited; it does not transfer strict mathematical qualification from a different tested commit to an imported or edited module. Likewise, dated source comments may describe an earlier *candidate* state even when a later, separately verified strict gate has qualified the relevant source. The authoritative unit of acceptance is the exact theorem, source/consumer closure, toolchain, tested commit, and run receipt.

## 2. Historical phases and why the path changed

### A. FCP source and proof provenance (late October–early November)

The earlier `integration/community-20261027-bfss` and `research/fcp-k1d17-ancestor-cache-pilot-20261028` ancestry contains the long K1D/F10 historical proof and verification program, including original Spin(9) algebraic interfaces, source representations, formal gate failures, repairs, and dependency evidence. `etblink/Foundational-Convergence-Program` remains a separate provenance/research authority; `etblink/math` contains the implementation, original BFSS Lean sources, and strict consumers. The unified branch did **not** subsume every historical FCP branch merely by copying selected files.

The source-lineage and historical gate notes under `contributions/bfss-kotler/`, and the dated [cross-repo branch locator](BFSS_CROSS_REPO_BRANCH_LOCATOR_2026_11_08.json), retain this older evidence. The central lesson is that actual original-source bridges and adverse CI evidence must be retrieved before re-proving or importing anything.

### B. Spectral and representation bifurcation (November 6–7)

The [spectral confinement roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md), [compact source Spin(9)/operator-column memorandum](BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md), and [adversarial frontier decision](BFSS_SPECTRAL_FRONTIER_ADVERSARIAL_DECISION_2026_11_07.md) established **parallel** paths: (R) representation/source action, (A) adversarial whole-sector spectral analysis, and (P) original physical form/domain binding.

A proposed finite operator-column model could bypass the need to choose a globally consistent Spin(9) **Fock-vector** implementation, but not source continuity, physical gauge compatibility, closed Hamiltonian identification, full-sector Spin(9)→Spin(8) branching, or coercivity. For the full operator fiber, the conservative candidate first-Cartan weight cap is **M=12**, not Fock-vector M=6; its source-exact proof is still an obligation. Neither a representative high-weight test vector nor positivity creates an original Hamiltonian eigenpair.

### C. Recoverability and original-Fock microgates (November 8, before unification)

The [project map](BFSS_PROJECT_MAP_2026_11_08.md) and H1/H2 tools brought together dated 99-branch discovery, an evidence registry, a 420-module source-import inventory, and a 337-workflow lexical index. These are retrieval aids rather than theorem certificates.

Original SU(2) source work advanced through OP0/OP1 generic projection interfaces and original OP2a/OP2b/OP2c bindings. In particular, [OP2c #42530241914](https://github.com/etblink/math/actions/runs/42530241914), at `f84d092b2c71...`, qualified an original nonzero gauge-invariant Fock vacuum and its fixed projection. The original F1A onward path investigated exact 48-label CAR and Fock bivector identities with narrow independent gates. These achievements are useful source ingredients, **not** a global original Spin(9) Fock-vector lift or closed-form spectral theorem.

### D. Unified source consolidation (November 8, starting from parent `d3e524c0`)

The [initial source import record](UNIFIED_INTEGRATION_SOURCE_IMPORT_2026_11_08.md) reports **468 missing original v0.4.0 OperatorDependencies source blobs** copied from the pinned `fa00aa36e770ca516f57b41f5b02229a5033d50f` donor. The 30 preexisting dependency files were retained. Four differing versions were copied into `research-sources/math/v040-conflicts/OperatorDependencies/` instead of overwriting the active files. Subsequent commits added selected immutable FCP source/provenance snapshots under `research-sources/fcp/`, including donor pins `beeb331836bb13a92c275f06f61337a6b97c0ada` (Clifford/Fock) and `cf06212a57db0ceffad74bd78280a8a240856a17` (main program ledger).

The [unified entry point](UNIFIED_RESEARCH_ENTRYPOINT_2026_11_08.md) is the navigation front door. These additions were **source consolidation, not a whole-tree strict Lean acceptance**.

### E. Historical M3I requalification and F1F investigation (November 8–9)

[M3H/M3I #42547700192](https://github.com/etblink/math/actions/runs/42547700192), tested at `741e629e228e83071f757ab4adc5588715136fd1`, accepted the actual **original complex 48-Majorana Clifford algebra–full Fock operator algebra equivalence**. It is a `ℂ`-`AlgEquiv`, not automatically a physical-star or unitary equivalence.

The parallel concrete F1F original-Fock 48-coefficient specialization encountered repeated Lean recursion/definitional-reduction obstacles. The smaller accepted [C3 #42651438879](https://github.com/etblink/math/actions/runs/42651438879) and [C4 #42654797722](https://github.com/etblink/math/actions/runs/42654797722) isolated symbolic plane transport and original CAR half-antisymmetrization; they **did not** qualify the stalled entire concrete F1F equation. Preserve the reds: a proof-engineering failure is neither an accepted theorem nor a mathematical disproof. Recovering M3I made a source-faithful alternative viable without forcing the expensive F1F unfolding.

### F. OP3 source-action pivot (November 9)

The [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md) and [interface-first protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md) selected narrowly verified interfaces, reusing source-label crosswalks and the M3I equivalence.

- OP3-A original donor/active source gamma axes, followed by OP3-B1 original source-48 quadratic preservation, supplied the exact source and normalization bridge.
- OP3-B2's attempted `IsometryEquiv` wrapper recursed after two similar failures ([#42678500270](https://github.com/etblink/math/actions/runs/42678500270), [#42680558526](https://github.com/etblink/math/actions/runs/42680558526)). The team **held** it, inspected lower Mathlib interfaces, and adopted a direct `CliffordAlgebra.lift` route instead.
- [OP3-C0 #42685719690](https://github.com/etblink/math/actions/runs/42685719690) qualified the original real Clifford generator square, and successive bounded gates reached [C4 #42709755735](https://github.com/etblink/math/actions/runs/42709755735), the original real Clifford Spin(9) group action.
- [C5A #42714280905](https://github.com/etblink/math/actions/runs/42714280905) and [C5B #42716548152](https://github.com/etblink/math/actions/runs/42716548152) transferred and packaged the actual original complex Clifford action.
- [C6A #42719194702](https://github.com/etblink/math/actions/runs/42719194702) transported the genuine algebraic Spin(9) group action through M3I to `Fermion 2 →L[ℂ] Fermion 2`; [C6B #42725375970](https://github.com/etblink/math/actions/runs/42725375970) qualified donor gamma covariance; [C6C #42728268316](https://github.com/etblink/math/actions/runs/42728268316) qualified exact active gamma covariance.

These **algebraic** results do not by themselves qualify the physical Hilbert-star, continuity, SU(2) gauge commutation, Fock-vector unitary, original Hamiltonian covariance, or spectrum.

### G. Physical Majoranas and immediate checkpoint (November 9)

[P2a #42731578061](https://github.com/etblink/math/actions/runs/42731578061) qualified original normalized Majorana Hilbert self-adjointness on all real source vectors. P2b-A then combined that exact source theorem with C6C covariance:

- [First P2b-A red #42734472650](https://github.com/etblink/math/actions/runs/42734472650) was a **generic `map_smul` typeclass-inference heartbeat failure**, not a counterexample to star compatibility.
- The bounded repair used the exact original `AlgEquiv.toLinearEquiv.map_smul` interface instead of generic homomorphism synthesis, without raising resource limits or altering the mathematical target.
- [P2b-A green #42736594947](https://github.com/etblink/math/actions/runs/42736594947), exact `2e260bbeac70a8aa035b72bdbdda99db7984bb2b`, completed source/independent-consumer cold build with 43 frozen source/consumer pins and permitted axiom checks. It qualifies **physical-star commutation on real source gamma generators and their complex scalar multiples**. Full `T : Fermion 2 →L[ℂ] Fermion 2` star preservation is **not yet qualified**.

## 3. Fresh `openai/math` reuse: exact sources already present

At the pinned upstream `4eaee87548250b2682affda7d05d947c05554bae`, six relevant upstream Lean file Git blobs were **independently compared against the active unified branch** and found byte-identical. No cherry-pick is needed for these six files. A prior read-only note reported nine matches; **only these six were rechecked in this audit**:

| Source on both repositories | Matching Git blob | Actual reuse / limitation |
| --- | --- | --- |
| `OAI/MathematicalPhysics/Heisenberg/MatrixUnitTrace.lean` | `9dee8995f214f99ff7e377a6c91228cd6f0ea07e` | `Heisenberg.TensorUnits.trace_unit`, `trace_lift`; requires complete **actual original Fock** matrix-unit bridge |
| `OAI/RepresentationTheory/VertexAlgebra/GeneratedIntertwinerAction.lean` | `fb726ce085edd823ad27a568056bee9dc674809e` | `adjoint_intertwines`, `gram_commutes_generator`, `gram_commutes_generated`; requires genuine intertwining/adjoint hypotheses |
| `OAI/RepresentationTheory/VertexAlgebra/GraphCovariance.lean` | `7e5be5062ea482b643089e7b32a3908fa44919d0` | `onSubmodule_affine_graph`, `onSubmodule_affine_graph_iff`; requires full-space linear isometry, invariant core and genuine closability |
| `OAI/RepresentationTheory/PartialPermutation/HilbertSchmidt.lean` | `b5e24bef9a423db0b4b5e5a957a58f907fb2b79b` | `hsNormSq_eq_sum`, `hsNormSq_adjoint`, projection left/right; needs `Module.End`↔original bounded-Fock-operator bridge |
| `OAI/Analysis/KadisonKastler/StarEquivTraceTransport.lean` | `a794a94ca5becd3db4e571fcfc563d1554ad79f8` | **DEFER**: type II₁ factor setting is not the original finite type I Fock endomorphism algebra |
| `OAI/Analysis/KadisonKastler/CommutingKMSActions.lean` | `1b9244067b6cdbef5f6d844c93addcce72216e14` | **DEFER**: KMS/separating-vector/one-parameter group hypotheses offer no source-exact immediate Spin(9) shortcut |

Use exact modules already on this branch, with **new narrowly typed BFSS consumers** where needed. A matching upstream Git blob is evidence of source identity, **not** a successful new BFSS proof gate.

## 4. Revised, parallel proof architecture

### Primary lane — P2b-B1 then P2b-B2 (next mathematical work)

Let `F = Fermion 2`, `A = F →L[ℂ] F`, `Cl = CliffordAlgebra (source48Quadratic.baseChange ℂ)`, `M : Cl ≃ₐ[ℂ] A` the accepted M3I equivalence, and `α_g : A ≃ₐ[ℂ] A` the accepted C6A action.

**P2b-B1, complexified-generator extension (candidate):** From P2b-A on real `sourceGammaRealLinear` and all complex multiples, and the accepted C6C/M3I donor/active crosswalk, derive

```text
α_g (star (M (CliffordAlgebra.ι Q w))) =
  star (α_g (M (CliffordAlgebra.ι Q w)))
```

for every genuine source `g` and every `w : ℂ ⊗[ℝ] Source48Vector`. Separate tensor pure-vector cases `z ⊗ₜ v` and finish by typed tensor-product linearity/induction. **Never** assume an arbitrary complexified Clifford generator is self-adjoint, and never use default Clifford star, which negates the odd generator, as the physical Fock adjoint.

**P2b-B2, full physical-star theorem (candidate):** On the same source Clifford carrier, define

```text
P_g(x) := α_g (star (M x)) = star (α_g (M x))
```

and use pinned `CliffordAlgebra.induction` with explicit scalar, generator, add and mul clauses (verified in pinned Mathlib `Basic.lean`). The scalar clause must respect physical complex-conjugate-linearity; the product clause must reverse order under `star_mul`. By surjectivity of M3I, conclude `∀ T : A, α_g (star T) = star (α_g T)`, then package with `StarAlgEquiv.ofAlgEquiv` if the pinned signature is suitable. An alternative exact-carrier route defines `β_g(T) = star (α_g (star T))` and proves `β_g=α_g` by generator uniqueness; do not introduce a redundant global construction if Clifford induction is smaller.

**Falsifier:** `star (Complex.I • Γ(v)) = -Complex.I • Γ(v)`; do not claim `iΓ(v)` is self-adjoint. Keep the original `√2` Majorana normalization and exact Source48 labels.

### Parallel lane — T1 original matrix trace invariance (independent of P2b-B2)

For a complex algebra automorphism `α` of the **literal finite-dimensional** `A`, and normalized trace `τ`, `τ ∘ α` is still normalized and tracial. Two valid candidate proofs are:

1. **Heisenberg complete matrix units:** construct genuine original Fock matrix units (a basis-dependent proof with a strict exact-carrier bridge), use `trace_unit` / `trace_lift`, and recover `Tr(α(T)) = Tr(T)`.
2. **Left-regular trace:** `L_(α T) = α ∘ L_T ∘ α⁻¹` on `A`; the trace identity `Tr_A(L_T) = (finrank ℂ F) * Tr_F(T)` and nonzero Fock dimension imply invariance.

Both are *plans* until typed consumer acceptance. Compare the **first missing Lean interface**, source closure and proof complexity before selecting. Trace invariance requires no star compatibility; Hilbert–Schmidt isometry **does** require both trace and physical star. Don't substitute a different matrix model without an exact isomorphism of the original carrier.

### Follow-on lane — P3 / P4 / P5–P6

- **P3:** Combine full physical star + trace to prove `⟪α_g S, α_g T⟫_HS = ⟪S,T⟫_HS`; separately prove continuity of the actual source Spin(9) action. Adapt upstream finite-dimensional Hilbert–Schmidt lemmas with an exact bounded-vs-linear Fock operator bridge. **Do not** assume a preexisting global Fock-vector Spin(9) unitary.
- **P4:** Establish true original SU(2) gauge-operator fixedness/commutation, physical projection preservation and nonzero physical columns. The generated-intertwiner Gram/commutant theorem is a technique, not a gauge-projection theorem. Preserve the separate central Spin(9) element's **fermion-parity conjugation**, not false scalar `-1` action on all operators.
- **P5–P6:** Build the actual full Hilbert–Schmidt/operator-column unitary, source-invariant physical smooth core, exact original supercharge covariance, closability and graph-core/domain identification. Then specialize upstream `GraphCovariance` with `c=0` to transport covariance to closures. Still prove the original physical Hamiltonian and column Hamiltonian agree at **complete operator and closed quadratic-form domains**. Core-only equality cannot be substituted for this.
- **Adversarial spectral lane stays parallel:** require entire isotypic-sector Spin(9)→Spin(8) exclusion, nonzero gauge-physical high-type sector, collinear-valley/escape tests, original-source coercivity, compactness and positive eigenstate derivation. A positive point spectrum in a selected sector would **not** constitute a global BFSS mass gap. A counterexample or obstruction must remain visible.

## 5. Decision and verification protocol

**Next bounded implementation candidate:** **P2b-B1**, not a large combined P2b/P3/P4 gate. In parallel, perform **read-only T1 trace API diagnostics**; choose a trace strategy only after comparing exact typed carriers and transitive cost. Once P2b-B1 passes independently, attempt P2b-B2 full Clifford induction.

Acceptance requires: pinned original source/consumer Git blobs; exact tested commit and toolchain; independent consumer of the **actual original declaration**; cold Lean compilation and warning checks; only permitted foundational axioms `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, `admit`, hidden assumptions, altered normalization or automatic promotion from an ancestor run. An `AlgEquiv` is not a `StarAlgEquiv`; a star-equivalence is not a continuous group action; and neither yields a spectral theorem.

**Preserve procedural negatives:**

- F1F original large-form specialization: reduce the interface and reuse qualified symbolic identities; do not endlessly retry the same recursive elaboration.
- OP3-B2: two same-mechanism `IsometryEquiv` recursion failures led to the successful lower `CliffordAlgebra.lift` route; keep the rejected wrapper on HOLD.
- P2b-A first red: unqualified `map_smul` caused expensive typeclass synthesis; explicit `.toLinearEquiv.map_smul` resolved it without theorem weakening.
- Type II₁/KMS machinery: source assumptions do not match this finite-dimensional operator carrier or immediate research need.

**Navigation after interruption:** Start with this memo for the current chronology and next gate; follow [unified research entry point](UNIFIED_RESEARCH_ENTRYPOINT_2026_11_08.md) for paths/source pins; [project map](BFSS_PROJECT_MAP_2026_11_08.md) and H1/H2 for earlier evidence; [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md) for scientific guardrails; [post-C6 physical-star memorandum](BFSS_OP3_POST_C6_PHYSICAL_STAR_CENTER_GAUGE_FORM_RESEARCH_MEMORANDUM_2026_11_09.md) and [P2b-A gate forensic](BFSS_P2BA_ORIGINAL_FOCK_GAMMA_PHYSICAL_STAR_GATE_2026_11_09.md) for exact immediate proof details. These historical notes have their own dated status fields; later exact verified green receipts supersede *stale status prose*, not underlying immutable evidence.

**Repository scope of this preservation:** research Markdown only; no implementation, gate trigger or new mathematical acceptance.
