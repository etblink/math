# BFSS feasibility decision — gauge-fixed projection without a Spin(9) Haar integral

**Date:** 2026-11-08  
**Repository / branch:** `etblink/math` / `research/bfss-original-gamma-faithfulness-20261107`  
**Research baseline inspected:** `ae9eedadfaa6595cf3dbcc040e692ca5202c7167`  
**Status:** MATHEMATICAL FEASIBILITY ARGUMENT AND FUTURE LEAN GATE SPECIFICATION. Not a compiled Lean proof or qualified spectral theorem.

## 1. Decision

Investigate a **parallel, bounded operator-algebra feasibility gate**, without displacing the original-Fock F1–F6 schedule in `BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md`.

The proposed optimization is to use the orthogonal projection onto the literal original SU(2)-fixed Fock subspace rather than integrate a rank-one projection over Spin(9). This removes a *second* Haar-average construction, but does **not** remove the obligation to prove the exact source operator automorphism, its gauge compatibility, the original gauge-singlet vector, or original closed-form comparison.

## 2. Precise finite-dimensional lemma

Let `F` be a finite-dimensional complex Hilbert space; `G` a group with a genuine unitary representation `U : G → U(F)`; `A = End_ℂ(F)`. Define

`W = {v : F | ∀ h : G, U(h)v = v}`.

Let `P_W` be the orthogonal projection onto `W`. Suppose `α : A ≃⋆ₐ[ℂ] A` is a unital complex-linear star-algebra automorphism, and `α(U(h)) = U(h)` for every `h`. Then **`α(P_W)=P_W`**.

Proof, avoiding any choice of implementing Fock unitary:

1. `P_W` is self-adjoint, idempotent, and has range `W`. For all `h`, `U(h) P_W = P_W`.
2. Applying `α` gives `U(h) α(P_W) = α(P_W)`. Since `α` preserves multiplication and star, `α(P_W)` is again an orthogonal projection, and its range is contained in `W`.
3. Orthogonal projections onto subspaces are ordered by range inclusion, so `α(P_W) ≤ P_W` (projection order).
4. Apply the same argument to `α⁻¹`, which also fixes every `U(h)`, obtaining `α⁻¹(P_W) ≤ P_W`. Applying the order-preserving `α` yields `P_W ≤ α(P_W)`.
5. By antisymmetry, `α(P_W)=P_W`.

Alternative **simpler finite-dimensional proof**: star automorphisms preserve rank and the range-inclusion relation; the two inclusions follow by the same inverse argument. The proof should be expressed with `ContinuousLinearMap` and the existing projection lemmas rather than a new operator order framework unless necessary.

**Nonzero:** the original vacuum is a nonzero SU(2)-fixed vector according to the *separate* pinned `SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean` source snapshot; it is not automatically imported/qualified on the current branch. Once imported and verified at the exact original Fock type, `W ≠ ⊥`, so `P_W ≠ 0`.

**Important limit:** a merely multiplicative algebra automorphism need not preserve orthogonality. Require star preservation (or prove equivalent adjoint compatibility). A commuting *superoperator* need not be an algebra automorphism. Do not silently weaken either hypothesis.

## 3. Smaller theorem order for a Lean diagnostic

**OP0 — API-only diagnostic (no project physics):** Using pinned Mathlib, construct `W` as a submodule, its orthogonal projection, and prove the universal characterization: a self-adjoint idempotent `P` with `U(h)P=P` for every `h` has range contained in `W`. Inspect `Mathlib.Analysis.InnerProductSpace.Projection.Basic`: `Submodule.starProjection`, `starProjection_apply_mem`, `starProjection_mem_subspace_eq_self`, `range_starProjection`, `isIdempotentElem_starProjection`. Avoid any imported BFSS theorem.

**OP1 — abstract fixed-projection lemma:** Prove `α(P_W)=P_W` for a genuine star-algebra automorphism fixing the unitary gauge operators. Use a two-sided inverse and uniqueness of orthogonal projection. Keep this theorem generic and tiny; no Spin(9), no Haar integration, no Clifford word recursion.

**OP2 — original source binding:** Instantiate `F` with the literal 24-orbital Fock space and `U` with the genuine original SU(2) gauge action. Reuse the pinned G4K2A nonzero vacuum after verifying dependency ancestry, representation conventions, and whether its exact source declarations are available in the active branch.

**OP3 — actual 48-Majorana operator action:** From the existing original paired-label source homomorphism `R₄₈ : Spin(9) → SO(48)`, construct a *complex-linear, star-preserving* automorphism of the original full Fock operator algebra, and prove on **all original** Majorana generators `α_g(θ(w))=θ(R₄₈(g)w)`. Do not confuse the abstract Clifford automorphism with the operator automorphism until the exact original Clifford-to-Fock algebra isomorphism and its inverse are qualified. Check composition orientation: `α_(gh)=α_g ∘ α_h`.

**OP4 — gauge commutation:** Prove `α_g(U_h)=U_h` for every original gauge element. If only adjoint actions commute, derive the scalar-character obstruction and eliminate it using the *literal* SU(2) character triviality argument, not an unproved phase convention. The separate S1G source proof is a candidate dependency; its transitive import size must be assessed.

**OP5 — concrete invariant witness:** Combine OP1–OP4 to prove `α_g(P_W)=P_W` and `P_W ≠ 0`. This is the feasibility gate's endpoint. No physical spectrum claim.

**OP6 — only if OP5 qualifies:** Form candidate source operator-valued test functions `χ(‖X‖²) P(X)^k P_W`, prove source gauge covariance and nonvanishing for some explicit `χ`, and then independently test Spin(9) type and original smooth-core membership. A pointwise nonzero profile is not automatically nonzero in L².

## 4. Adversarial cases and STOP rules

- `α_g` only fixes `Ad(U_h)` and not `U_h`: **STOP** at OP4; record the residual scalar character.
- Original Fock representation is not genuinely unitary on the exact source carrier: **STOP** at OP2.
- A Clifford algebra equivalence changes the original 48 Majorana scaling, sign, or basis: **STOP** at OP3; do not rename the replacement representation as original.
- A star automorphism is replaced by an arbitrary linear automorphism: **STOP**; the projection argument does not apply.
- The resulting operator-valued Hilbert space uses **left-output** gauge action, `(G_h T)(X)=U_h T(h⁻¹X)`. Its right/input index is *not* gauge transformed. The spatial action by `α_g` is gauge compatible only after OP4. The column decomposition `H_phys^{⊕dim F}` still requires the exact source core/form/operator-domain identification.
- The operator fiber's first-Cartan bound is **M=12**, not the original Fock-vector bound **M=6**. Never transfer the latter to `End(F)`. The candidate `(24,24,0,0),m=11` threshold remains analytical and conditional on source branching.
- No claim of an eigenpair follows from test functions, formal covariance, or finite multiplicity.

## 5. Pin-specific API reuse

The pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` provides:
- `Mathlib.Analysis.InnerProductSpace.Projection.Basic`: `Submodule.starProjection`, `starProjection_apply_mem`, `starProjection_mem_subspace_eq_self`, `range_starProjection`.
- `Mathlib.LinearAlgebra.CliffordAlgebra.Basic`: `CliffordAlgebra.map`, `map_apply_ι`, `map_comp_map`, `equivOfIsometry`, `equivOfIsometry_trans`.
- `Mathlib.LinearAlgebra.CliffordAlgebra.BaseChange`: `toBaseChange`, `ofBaseChange`, `equivBaseChange`.
- `Mathlib.RepresentationTheory.FDRep`: `FDRep.ρ`, `FDRep.Iso.conj_ρ`, and `dualTensorIsoLinHom`. These are optional organizational tools, not required by OP0–OP1.

**Caution:** `CliffordAlgebra.equivExterior` was suggested in an earlier audit but not verified in the inspected pinned `CliffordAlgebra.Equivs` file. Do not write a gate depending on that exact name without an independent symbol search. The category route is an organizational option, not a replacement for source-faithful gamma and gauge identities.

## 6. Verification and resource budget

Make **one theorem per gate**, with an independent consumer importing the exact source declaration. Run local/CI syntax and type-check diagnostics before introducing expensive original-source ancestors. Preserve original accepted Lean source bytes and workflow, pin exact commit and Mathlib/Lean versions, check `#print axioms`, warnings-as-errors, exact source closure and retained logs. Do not claim a theorem qualified until its actual strict gate passes.

**Decision checkpoint:** OP0–OP1 are worthwhile only if they reduce imports/proof surface; OP3–OP4 remain substantial and may be harder than the genuine Fock F1–F3 route. If they are, return to the original Fock path. This is a **conditional feasibility branch**, not a change of the project's scientific target.

## 7. Sources

- [Original Fock Spin(9) and closed-form integration memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md)
- [Whole-sector oscillator exclusion and operator-column audit](BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md)
- [Compact Spin(9) operator columns](BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md)
- [Original representation binding audit](BFSS_SPECTRAL_SOURCE_EXACT_REPRESENTATION_BINDING_AUDIT_2026_11_07.md)
- [Pinned separate nonzero vacuum source](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean)

**Scope of this commit:** new research memorandum only. No Lean source, manifest, workflow, dependency, PR, or publication changed.


## 8. OP0 exact qualification — 2026-11-08

**Disposition:** OP0 **QUALIFIED AT COMMIT**; OP1–OP6 remain **PROPOSED / UNQUALIFIED**.
The earlier status at the top of this feasibility memorandum describes its original research stage;
the exact qualification below supersedes that status for OP0 only.

- **Qualified workflow:** [Run #42516531636](https://github.com/etblink/math/actions/runs/42516531636), completed SUCCESS, attempt 1.
- **Exact tested commit:** `93e58dab8d077306250e7fb1140dc1dc1a5dd8c2`.
- **Source:** `lean/OAI/LinearAlgebra/GaugeFixedProjectionOP0.lean`.
- **Independent consumer:** `lean/diagnostics/BFSSGaugeFixedProjectionOP0IndependentAudit.lean`.
- **Strict gate:** `.github/workflows/bfss-gauge-fixed-projection-op0-strict.yml`.
- **Pinned dependencies:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- **Observed:** source Lake build completed successfully (2,437 jobs); direct Lean warning-as-error source/independent-consumer invocations passed; six source `#print axioms` reports had only `propext`, `Classical.choice`, and `Quot.sound`; the gate's `sorryAx` and `Lean.ofReduceBool` checks passed.
- **Retained evidence:** Actions artifact ID `13631981588`, expiring 2026-11-22; permanent source and Git workflow history remain canonical.

### What OP0 actually proves

For an abstract complex-linear group homomorphism to finite-dimensional endomorphisms:
the literal common fixed subspace has a canonical orthogonal projection; its range is
the fixed subspace, its outputs are fixed, and it is idempotent and a star projection.
A dimension-independent range-containment theorem applies to any continuous linear
map with gauge-fixed output. This is a Mathlib-only proof surface; no original BFSS
Fock carrier, Spin(9) action, star-algebra automorphism, original physical Hilbert
space, or Hamiltonian domain is bound by OP0.

### Negative knowledge / procedural correction

The initial red sequence was due to the exact pinned Mathlib completeness name,
a theorem namespace mismatch, an unnecessarily placed local Lean `omit` directive,
and a CI CLI `--werror` option unsupported by Lean 4.34.1. The accepted workflow uses
`-E warning` and checks its output. Those engineering errors do not constitute
mathematical counterexamples. Reuse the verified signatures and syntax rather than
recreating the same red-green cycle.

**Next bounded unit:** inspect pinned star-algebra automorphism and star-projection
extensionality interfaces for OP1 before committing OP1 declarations. OP1 is not
qualified or implemented by this OP0 acceptance.


## 9. OP1 source-and-consumer verification and warning-gate correction

**Observed proof checkpoint:** [OP1 run #42517863002](https://github.com/etblink/math/actions/runs/42517863002) completed SUCCESS (attempt 1) at exact commit \`aa23e95f47667df4346400f01dabd7730157bf4f\`.
The pinned Lean 4.34.1 / Mathlib \`d13f23b723b8a846827a245b89c10fc7d3f11612\`
build finished 2,438 jobs successfully. The independent consumer completed, and both
OP1 \`#print axioms\` reports contained only accepted foundations:
the general absorbing-projection theorem [\`Quot.sound\`], and the
gauge-fixed corollary [\`propext\`, \`Classical.choice\`, \`Quot.sound\`].
No \`sorryAx\` or \`Lean.ofReduceBool\` was reported. Evidence:
artifact \`13632118417\` (expires 2026-11-22).

**Qualification nuance (positive green audit finding):** Source build and direct
Lean invocation both emitted a nonfatal style warning at OP1 line 85,
despite the workflow's \`-E warning\` flag. This flag did not enforce the
advertised all-warnings-fatal property on Lean 4.34.1. Consequently the
\`aa23e95\` gate demonstrates compiled mathematical proofs, source/consumer
verification and allowed axioms, but **does not demonstrate a clean warning gate**.
Do not silently promote it as a warning-clean strict acceptance.

**Batched correction:**
- Atomic source/workflow commit \`350115b87cfaf8aae67614407aed4b00a32f8552\`:
  preserved the theorem statements/proofs; scoped the known
  \`haveI\` style-linter diagnostic consistently with OP0, and replaced
  ineffective warning enforcement with an explicit check for Lean source and
  independent-consumer diagnostics. This is a style-linter exception for a
  required local instance, **not** a mathematical axiom relaxation.
- Shell quoting/regex correction commit
  \`44ea6b8001209d92f0e023a7f30f5125cde127e9\`:
  used \`[.]\` for literal file extensions and a one-line regex, avoiding
  escaped line-continuation mistakes. Enabled cancellation of superseded
  runs to limit wasted qualification resources.
- [Corrected warning gate run #42518687725](https://github.com/etblink/math/actions/runs/42518687725):
  **RUNNING at this memorandum update**. It must complete green before
  claiming all-warnings-clean strict OP1 acceptance at \`44ea6b8\`.
  The prior intermediate #42518648691 was cancelled as superseded, not
  recorded as a mathematical failure.

**Scientific scope:** OP1 proves a generic star-algebra automorphism invariance
theorem under explicit fixed-operator and projection compatibility premises;
the corollary reuses OP0. This is not yet a construction of a source Spin(9)
star automorphism, the original SU(2) Fock action, an invariant high-weight
sector, or a closed physical Hamiltonian-domain result.

### OP2 read-only source-binding reconnaissance

On the active branch, \`lean/OAI/MathematicalPhysics/BFSS/Core.lean\`
defines the **literal** \`Fermion 2\` as \`EuclideanSpace ℂ (Fin (2 ^ (8 * colorDim 2)))\`
and \`GaugeGroup 2\` as a special unitary matrix group.
\`GaugeCore.lean\` defines the general
\`AlgebraData.GaugeData.fermion\` as a genuine monoid homomorphism
to complex linear isometries, but it does **not** instantiate the
specific Fock gauge action by itself.

The pinned, separate OperatorDependencies snapshot
\`fa00aa36e770ca516f57b41f5b02229a5033d50f\` contains
\`SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean\`, which names
\`fermionGaugeUnitaryHom\`, proves \`fermionVacuum_ne_zero\`, and
proves \`fermionVacuum_unitary_invariant\` on \`Fermion 2\`.
That file is **absent on this active branch**. Its observed direct
ancestry begins with \`SU2BFSSG4K1PhysicalSpaceCoreProbe.lean\`,
then \`SU2BFSSG4JExactGaugeDataAssemblyProbe.lean\`, which itself
imports further G4-IC2 and G2-B modules. This is not a one-file import.

**OP2 decision:** STOP before importing the snapshot wholesale.
First enumerate the exact transitive dependency closure, existing
qualifications and source-level representation conventions; admit only
a bounded adapter to the genuine original \`Fermion 2\` gauge action,
with a separate consumer and fresh gate. No surrogate Fock carrier,
no assumed invariant vacuum, and no inference of spectral confinement.
