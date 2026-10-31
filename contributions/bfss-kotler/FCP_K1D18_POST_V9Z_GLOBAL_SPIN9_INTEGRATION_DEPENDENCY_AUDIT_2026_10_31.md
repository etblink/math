# Project Lead — Post-V9Z source Spin(9) global integration dependency audit

**Date:** 2026-10-31 (PDT/UTC).  
**Repository:** \`etblink/math\`.  
**Owner research branch:** \`research/fcp-k1d17-ancestor-cache-pilot-20261028\`.  
**Disposition:** REPORT-ONLY SOURCE RECONNAISSANCE — zero new mathematical declarations, zero new CI gates, no qualified theorem promotion.  
**Authority:** FCP \`FCP_CHARTER.md\` and \`EPISTEMIC_RULES.md\`: preserve results, prove each promotion bridge, retain negative knowledge.

## 1. Immutable qualified starting boundary

- Latest independently rechecked original paired-label V9Z run: [#41245738090](https://github.com/etblink/math/actions/runs/41245738090), job \`124668661095\`, completed **success** at exact commit \`a399e53aa093603c00c032af51221dbd36617eca\`.
- All relevant steps passed: exact source/ancestry preflight, pinned dependencies, V9Y ancestry build, fresh V9Z \`-DwarningAsError=true\` compilation, independent three-hom/three-evaluation Lean elaboration and six declaration-level axiom checks.
- V9Z compiler/audit artifact **13059024494**, SHA-256 \`0289d6be2dad82da1dc2b34648cf4bb2abba6ba327e03468f156b5a0889814ef\`, nonexpired at review.
- Lean \`leanprover/lean4:v4.34.1\`, Mathlib \`d13f23b723b8a846827a245b89c10fc7d3f11612\`; no \`sorryAx\` in qualified V9Z declarations, allowed axiom list \`[propext, Classical.choice, Quot.sound]\`.
- Six preceding V9Z reds are retained individually by exact CI SHA, causal classification and artifacts in \`FCP_K1D18V9Z_SIX_RED_METHOD_CAUSAL_REVIEW_GATE7_2026_10_31.md\`; green does not recolor earlier reds. The accepted corrective commit only changed three \`simpa only\` to \`simp only\` sites, the source-blob pin in its workflow, and the retrospective record.

## 2. Source-bound existing mathematics — not the global group theorem

1. **Original label source:** \`FCP.BFSSS1V0.Source48Label := Fin 24 × Fin 2\`, \`Source48Vector := Source48Label → ℝ\` and \`source48Quadratic := QuadraticMap.weightedSumSquares ℝ (fun _ => 1)\`; source file \`SU2BFSSPhysicalDomainS1V0StandaloneOrthogonalGeometryProbe.lean\`.
2. **True paired Fock indexing:** \`FCP.BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv\` packs spinor index \`α=2j+r\` and color \`a\` to original flattened \`2(3j+a)+r\`, not color-major \`16a+α\`. The original FCP finite gate [#40478381697](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/40478381697) found 44/48 positions differ and deliberately falsified 27 untransported original B-tensor identifications. The finite test is **not** a Lean global-group proof.
3. **Original Spin(48) algebraic closure:** V7S proves surjectivity of \`spinGroup source48Quadratic →* source48SpecialOrthogonalWitnessGL\`; V7T gives exact two-sign fibers; V7Z supplies a source-exact \`MulEquiv\` from original Spin48 modulo original negative central closure to the *independently defined*, same-label native Euclidean determinant-one isometry subgroup. Source modules \`...V7SOriginalSourceSpinSOImageSurjectivityProbe.lean\` and \`...V7ZOriginalSpinQuotientNativeEuclideanDetOneEquivProbe.lean\`. These proofs are **algebraic**, not a continuous covering.
4. **Actual source Lie algebra:** V9R's \`coordinateToPairedSkewLieHom\` maps the actual \`Matrix SpaceIndex SpaceIndex ℝ\` skew Lie subalgebra into the original paired-Fock \`Matrix Source48Label Source48Label ℝ\` skew Lie subalgebra. V9S identifies both with pinned Mathlib \`skewAdjointMatricesLieSubalgebra (1 : Matrix _ _ ℝ)\`; V9T names the canonical \`coordinateToPairedCanonicalSkewLieHom\`. This is a genuine \`LieHom\` on actual commutators, not a chosen differential of a group representation.
5. **Actual one-parameter result:** V9X/V9Y/V9Z construct and prove continuous fixed-generator paths. V9Z's three definitions have the concrete type \`ContinuousMonoidHom (Multiplicative ℝ) (Matrix.orthogonalGroup Source48Label ℝ)\`. The corresponding matrix evaluations are \`exp (t • X)\` for a fixed original skew generator. There is **no** V9Z theorem asserting determinant-one, compatibility for arbitrary noncommuting generators, a single Spin9 map, source-group coherence or a covering.

## 3. Pinned Mathlib source interface audit

Inspected the *exact pinned revision* \`d13f23b723b8a846827a245b89c10fc7d3f11612\`:

- \`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean\`: \`spinGroup (Q : QuadraticForm R M)\` is the infimum of Pin and even Clifford elements (lines 291-299); a \`Group (spinGroup Q)\` instance is constructed (line 385) and \`spinGroup.toUnits\` is a \`MonoidHom\` (line 404). **This inspected source does not itself establish a \`LieGroup\`, a topological covering, or a global source Spin9 representation.** This is not a claim that no theorem exists elsewhere.
- \`Mathlib/Geometry/Manifold/Algebra/LieGroup.lean\`: \`LieGroup I n G\` requires compatible charted-manifold and differentiability structures for the group.
- \`Mathlib/Geometry/Manifold/GroupLieAlgebra.lean\`: \`GroupLieAlgebra I G\` is defined as \`TangentSpace% (1 : G)\` (line 56); the bracket uses left-invariant vector fields. It is **not definitionally** V9T's matrix skew subalgebra. This file also marks its alternate derivation-based identification as a TODO; no source-specific differential identification was established.
- \`Mathlib/LinearAlgebra/UnitaryGroup.lean\`: \`Matrix.orthogonalGroup n R\` and \`Matrix.specialOrthogonalGroup n R\` are distinct; the latter's membership means orthogonality **and determinant one** (lines 313-324). A V9Z \`orthogonalGroup\` result cannot be silently assigned the stronger special-orthogonal type.
- \`Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean\`: \`CliffordAlgebra.star_ι\` (line 50) states \`star (ι Q v) = -ι Q v\`. This sign matters in any attempted Clifford-gamma restriction to an orthogonal group; do not assume odd Clifford generators are star-unitary.

**Audited scope limit:** these are exact-file, exact-revision observations, not an exhaustive cross-file proof of absence of all topology or integration APIs. No new Lean compile occurred in this report-only operation.

## 4. Missing bridge graph and independent falsifiers

\`\`\`text
Accepted original source gamma and paired-Fock label permutation
                           |
                           v
 V9R/V9S/V9T: source so(9) --genuine LieHom--> paired original so(48)
                           |
 V9U-V9Z: each fixed generator has a continuous R -> O(original 48) flow
                           |
              [not a global Spin(9) hom]
                           |
      +--------------------+-------------------+
      |                                        |
 A: source Spin(9) Lie-group,          B: original gamma-driven
 tangent/skew identification,          Clifford(Q9) algebra lift,
 integration and derivative            group restriction to Spin(Q9),
 equality                              Fock-paired label transport
      |                                        |
      +--------------------+-------------------+
                           |
   coherent global group hom Spin9 -> SO(original paired 48)
                           |
   original Spin48 -> SO48 *continuous based covering* + lifting
                           |
   original group hom Spin9 -> original Clifford Spin48
                           |
   exact -1 center image and original CAR Fock implementation
                           |
   SU(2) gauge commutation and physical domain/form invariance
                           |
   independent BFSS spectral/eigenstate obligations
\`\`\`

A source Spin(9) group object, compatible smooth/group structure, source/target group Lie-algebra comparison, group hom law, covering and Fock action are **OPEN** unless separately demonstrated. The V7Z algebraic quotient, two-sign fibers, V9T commutator proof and V9Z fixed-generator exponentials do not discharge any of these automatically.

**Hard negative controls:** reject (i) untransported \`16a+α\` color-major identification, (ii) a replacement gamma basis without an explicit conjugation theorem, (iii) a central action factoring trivially through SO9 when the exact original Fock parity/source Pfaffian predicts the nontrivial sign, (iv) a two-sign algebraic fiber advertised as a covering, or (v) a \`LieHom\` advertised as an already-integrated \`ContinuousMonoidHom Spin9 SO48\`. FCP's center/Pfaffian inference remains conditional on the actual global lift.

## 5. Next executable mathematical tasks: evidence-driven order

**Task T0 — source/API census (first; no gate yet).** Search the existing qualified owner Lean modules and pinned Mathlib for an actual source Spin9 group/type and canonical \`GroupLieAlgebra\`/Spin covering theorem. Record exact import paths, declaration types, required instances, and whether a genuine source Q9 is already defined. Stop if the proposed type assumes unprovided structure; do not invent an instance.

**Task T1 — minimal SO48 compatibility.** Determine whether the original V9Z \`exp (t • X)\` flows can be shown to have determinant one using a pinned \`det_exp\`/trace route or continuity plus connectedness. This is a genuine missing statement needed for a Spin9-to-SO48 target, not proof of group integration. Only launch a source-exact Lean gate after the exact theorem statement and pinned lemma API are established. Do not modify V9Z.

**Task T2 — choose an actual group construction, not both speculatively.**
- **Route A (Lie integration):** supply the actual source Spin9 \`LieGroup\`, target special orthogonal Lie-group structure, \`GroupLieAlgebra\` comparison maps, source simply-connectedness, a genuine integration theorem, exact derivative equality to V9T, and proper smooth/continuous result.
- **Route B (constructive Clifford):** identify \`Q9\` on the actual nine source labels; prove the exact accepted real gamma linear combination squares to \`Q9(v) I\` as a *Lean theorem*; then specialize \`CliffordAlgebra.lift\`, restrict an appropriate unit-preserving action to the actual \`spinGroup Q9\`, prove orthogonality and determinant one, and conjugate only via the already accepted \`pairedLabelEquiv\`. A bare \`CliffordAlgebra.lift\` does not supply the missing star/orthogonality/continuity law. Prior finite signed-permutation verification is a discriminator, not substitute for this proof.

**Task T3 — original target topology and lifting.** Verify or construct compatible original Spin48 and SO48 topological group structures, continuity and two-sheeted covering/local trivialization for *the same original Q/labels*; only then lift a **based continuous** source hom. A \`MulEquiv\` alone is insufficient. Avoid assumed \`IsCoveringMap\` hypotheses unless explicitly stated as conditional.

**Task T4 — physical bridge (separate).** Prove exact source Fock unitary and SU(2) gauge-group compatibility, forms and domains. Keep the spectral/eigenstate question independent.

## 6. Operational method and controls

- Source/Mathlib exact declaration search and narrow typed lemma before CI; first Lean error is causal diagnostic, not a reason to guess names.
- Repeat-failure stopping rule: three failures with the same root cause trigger a minimal typed test or explicit obstruction note, rather than another full identical gate.
- Preserve strict \`-DwarningAsError=true\`, original gamma/paired-label constraints, immutable source hashes and accepted ancestral proofs, six-axiom acceptance contract when applicable. No \`sorry\`, \`admit\`, new \`axiom\`, artificial proof limits, or validator pretty-print regex used as semantic truth.
- Any later source theorem gets independent exact-typed Lean examples, declaration-by-declaration axiom checks, source SHA, pinned toolchain and retained artifact; all red attempts get their own failed diagnostic.
- A new branch write must be based on the observed current parent/tree, followed by full compare-commits inspection. No force push, no \`main\` mutation, no FCP historical rewrite, no external \`mathcommunity\` PR or merge.
- **This operation is a read-only mathematical reconnaissance plus this report-only branch record.** No source theorem, CI workflow or physical claim has been added.

## 7. Final decision

**Do not open a new broad integration gate yet.** First establish source Spin9/group/topological API feasibility and select a proof route that names its actual type-level obligations and falsifiers. Keep V9Z frozen and qualified; retain every historical red; prefer the narrowest theorem that materially advances global source-exact group coherence.
