# BFSS × QIT × SCC — W0C2A original bivector Lie-defect reduction pre-gate

Date: 2026-11-17 Pacific. **FROZEN SOURCE-EXACT W0C2A CONTRACT; NO NEW QUALIFIED THEOREM.**

Branch `integration/bfss-unified-research-20261108` exclusively; `main` untouched. Latest accepted original gate W0C1 R2 strict [#44208084307](https://github.com/etblink/math/actions/runs/44208084307), provider-original preservation [#44210764881](https://github.com/etblink/math/actions/runs/44210764881), canonical receipt `cc22451aa2dc14466309e9a5787e0ca5861d9bbf`, independent post-acceptance roadmap [#44211348276](https://github.com/etblink/math/actions/runs/44211348276) GREEN.

## Forward audit and source provenance

- Original carrier `V := Fermion 2`; operators `Op := V →L[ℂ] V`; `Source48Label = Fin 24 × Fin 2`; original normalized `sourceNormalizedGamma p`; actual original real skew-matrix K(A) with literal coefficient `A p q / 4`.
- Qualified **LB1C1**, original source `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`, Git blob `c2e7a7c665121283cde13ae5dabc183362b6b420`, [original #43901524171](https://github.com/etblink/math/actions/runs/43901524171): for skew A, `[K(A), Γ_k] = ∑_p A[p,k] • Γ_p`.
- Qualified **CT0 R2**, source `P3M4CT0OriginalSkewBivectorTrace.lean`, Git blob `a6f93c62c83bf51a0b89691196f875399d2896fa`, [original #43983772199](https://github.com/etblink/math/actions/runs/43983772199): ordinary original `originalFockTrace` cyclicity and `originalFockTrace (K A) = 0` for real skew A.
- Qualified **W0C1 R2** original source `P3M4W0C1OriginalCommutatorTraceWitnessR2.lean`, blob `5fafaa3d73d3761719ea160466b40d94b85d74db`: all-48-commutator-plus-original-trace operator injectivity and zero-centralizer-kernel. Provider-original ZIP blob `49e33bdd397f1a803b4818044549bbc6d33c3fe3`, complete job log blob `8f0acb0cc2ddbc1cf525e5ea5973cbed375b09e4`, SHA/CRC manifest blob `bc464292d81b0d9772436e9859f637b2e1d21db7`.
- Qualified **QTC0C/QTC0D**, original source `P3M4QTC0DOriginalFockThinTensorAdapter.lean`, blob `e52b8ca7a440e04ab3c3a93187e5100daa39e074`, [#44018395393](https://github.com/etblink/math/actions/runs/44018395393): finite-index tensor-covariance contraction conditional on a source operator covariance hypothesis. This is a possible W0C2B donor but is **not** required by W0C2A.
- **Do not import unqualified experimental `P3M4QTC1OriginalSourceRealComplexQuarterBridge` or `P3M4CT1G0OriginalFockJacobiSource48Adapter` as accepted theorem donors.** Their source files existing in the repository is not evidence of successful strict source-and-independent-consumer qualification. Earlier CT1/QTC specialization recursion and binding REDs remain negative knowledge.

## Mathematical decomposition and sharp claim boundary

Define the **original source defect** for real square A,B:
`D(A,B) := (K(A) * K(B) - K(B) * K(A)) - K(A*B-B*A)`.
Do **not** silently identify `K(A)` with a surrogate complex-coefficient quadratic or change the real factor 1/4.

Strict W0C2A has exactly THREE original theorem roots:
1. `originalSource48_matrix_commutator_skew`: skew A and B imply the real matrix `A*B - B*A` is skew. Use `Matrix.transpose_sub` and `Matrix.transpose_mul`; no numeric expansion.
2. `originalSource48K_lieDefect_trace_zero`: ordinary original trace of D(A,B) vanishes from CT0 trace cyclicity, K of skew traceless, and root 1.
3. `originalSource48K_lieBracket_of_defect_central`: **conditional** on `∀ k : Source48Label, Commute (D(A,B)) (sourceNormalizedGamma k)`, W0C1's exact original zero-kernel theorem forces `D(A,B)=0`, hence `[K(A),K(B)] = K(A*B-B*A)`. The centralizer premise is **NOT** discharged at this stage.

Frozen proposed Lean source:
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2AOriginalBivectorLieDefectTraceBridge.lean` — Git blob `51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb`, imports W0C1 R2, CT0, Mathlib.Tactic.
- Independent importing consumer `lean/diagnostics/BFSSP3M4W0C2AOriginalBivectorLieDefectIndependentConsumer.lean` — blob `4ddacfbe1ee1d7d55b321f4cb9c0d6d462261aec`, imports **only** proposed W0C2A source and restates all three theorem types with exactly three source-exact operator controls.
- Original source and consumer: **3 + 3 `#print axioms` roots**, allowed `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, three original controls, six deliberately mutated auditor cases.

## Strict CI, governance, and stop rules

1. Freeze this pre-gate contract before stage commit. Freeze exact new source, consumer and workflow SHA-1 Git blobs; pinned `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Preflight must preserve original qualified W0C1 and CT0 source proofs and W0C1 original provider ZIP/log/manifest; no writes to donors or historical RED files.
2. Cold actual original Lean module compilation; independent original consumer; strict `-DautoImplicit=false -DwarningAsError=true`; three source plus three importing-consumer theorem axiom reports; three genuine controls; six negative mutants.
3. Never convert a GREEN native source alone to accepted status. Download and independently inspect provider-original CI ZIP (all members and SHA-256/CRC), complete original Actions transcript and manifest; Git-pin before canonical promotion; independent post-acceptance roadmap check must PASS.
4. Two analogous native-source W0C2A REDs stop repeated attempts and trigger a smaller typed correction; do not raise recursion limits, substitute the Fock model, make new axioms or bury negative knowledge.
5. W0C2B is the next **prospective-only** obligation: prove `[D(A,B), Γ_k]=0` from LB1C1 and finite-index coefficient contraction on the exact original `Source48Label` and real matrix action. Reuse qualified QTC0D/CT1 generic ideas only after exact binding is audited. Do not claim a full original bivector Lie representation until W0C2B is separately qualified.
6. No physical `Spin(9)` integration, gauge- or parity-admissible measurement, BFSS operator domain, singlet state, spectral gap/mass gap or SCC operational claim follows from W0C2A.

**W0C2A prospective, not qualified; W0C1 R2 remains last accepted.**
