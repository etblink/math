# Historical-gate retrieval pilot — F1B skew-adjointness

**Date:** 2026-11-08  
**Repository/ref:** etblink/math, research/bfss-original-gamma-faithfulness-20261107  
**Status:** Evidence-backed read-only investigation and retrieval procedure. **No new Lean theorem, mathematical acceptance, or F1B strict gate.**

## Why this investigation was conducted

The project has invested in extensive per-gate red/green records distributed across math and FCP history. A small curated H1 registry of 16 records is useful for accepted milestones, but should **not** be mistaken for the full search corpus. The BFSS branch holds more than 300 Markdown source/gate notes. Search historical notes and provenance **before** authoring a replacement lemma, using the acceptance note as a lead to an exact theorem, not as an automatic proof certificate.

This F1B audit is a worked example of *gate note → original source → accepted method → outstanding contract*. The decisions are scoped to the original ordered Majorana bivector, not to a global Spin(9) action.

## Retrieval inventory and evidence distinctions

| Evidence recovered | Exact source / historical qualification | How F1B should use it | Classification |
| --- | --- | --- | --- |
| Original theta CAR and two commutator orientations | [F1A green #42533991101](https://github.com/etblink/math/actions/runs/42533991101), source commit b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f; lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1AOriginalThetaBivectorCommutator.lean | **Direct qualified precedent** on actual Fermion 2 and Source48 labels. Reuse its CAR specialization and original normalization, avoid new substitute gamma. | Qualified *for those two commutators*, not F1B |
| Concrete original Majorana self-adjointness | lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2FermionF2Probe.lean; declaration FCP.BFSSFermionF2.majoranaCandidate_selfAdjoint | **Same original carrier**; use this declaration in an F1B proof. It is in existing imported ancestry; require exact declaration and axiom audit at F1B's future gate, not an inferred separate acceptance claim. | Source present; no new independent strict qualification adjudicated in this audit |
| Normalized Source48 gamma self-adjointness | lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockGammaSelfAdjointProbe.lean | **Proof method/reference**, source has IsSelfAdjoint.smul and explicit real-to-complex scalar transport. It is explicitly marked RESEARCH CANDIDATE. Normalized sqrt(2) gamma is *not* the original unnormalized theta. | Staged, not independently qualified by this audit |
| Original Clifford bivector star compatibility | [Existing source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockBivectorStarCompatibilityProbe.lean). Earlier FCP S1V52L9E5E3 commit 109baa5a4e0e3d5480a17dc4ca3a3a0526d4b333 is cited in that source | **Reuse proof technique**, specifically change CLM multiplication to comp, apply ContinuousLinearMap.adjoint_comp, rewrite each factor's self-adjointness, compare star with adjoint. **Do not import its full Clifford universal-lift chain** for the smaller F1B goal. | Explicitly STAGED RESEARCH CANDIDATE; no independently qualified gate shown |
| Historical gamma-coordinate LinearMap skew image | [F10AV Gate 5 accepted note](FCP_K1D18V10H_F10AV_GATE5_ACCEPTANCE_ORIGINAL_GAMMA_COORDINATE_LINEAR_MAP_SKEW_IMAGE_2026_11_01.md); [strict #41381629875](https://github.com/etblink/math/actions/runs/41381629875), source commit e646bc5b9d21da7b357fbcb572dc399c519c9600 | **Method only**, preserves 1/2 gamma-pair normalization, stable source-label simplification, and strict eight-root independent consumer discipline. Matrix so(16) is a **different carrier** from Fermion 2 continuous operators. | Historical qualified theorem only for its exact matrix source |
| Historical gamma bracket coercion repair | [F10AW Gate 2 red note](FCP_K1D18V10H_F10AW_GATE2_RED_REPEATED_SUBTYPE_COERCION_AND_DIAGNOSTIC_2026_11_02.md), [F10AW Gate 3 accepted note](FCP_K1D18V10H_F10AW_GATE3_ACCEPTANCE_ORIGINAL_GAMMA_COORDINATE_PLANE_BRACKET_2026_11_02.md), [strict #41395358308](https://github.com/etblink/math/actions/runs/41395358308) | **Procedure only**: isolate dependent subtype coercions using a discriminating diagnostic, then apply the accepted exact label-case split. Do not transplant F10AW's matrix Lie theorem into F1B. | Historical red → accepted source repair on a distinct carrier |
| Program methodological control | [FCP Evergreen Research Guidance](https://github.com/etblink/Foundational-Convergence-Program/blob/cc608e2282e1b32bb11bbb64424e4775b28138e2/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md) and [BFSS procedural review](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md) | **Two lanes**: inexpensive source/API/type exploration followed by independent fail-closed scientific qualification. Remember older red-run diagnoses already measured the cost of repeated full CI. | Operating guidance, not theorem evidence |

## Recommended F1B gate contract after retrieval

**Target:** on the **literal original** source operators theta_p = majoranaCandidate p : Fermion 2 →L[ℂ] Fermion 2, prove for every p ≠ q (Source48Label):

    star (theta_p * theta_q) = -(theta_p * theta_q).

**Smallest proof path worth trying:**
1. Import the qualified F1A source, not the exploratory universal Clifford-lift module.
2. Use original majoranaCandidate_selfAdjoint for p and q and source-original off-diagonal CAR. Note that F1A's helper theta_anticommute is private; either prove a local public-facing equality from the same source CAR or create a reusable exact original-CAR helper when actual second use warrants it.
3. Convert star of CLM product to adjoint via the correct pinned Mathlib APIs; apply ContinuousLinearMap.adjoint_comp, replace adjoints using original theta self-adjointness, then use CAR theta_q theta_p = -(theta_p theta_q).
4. Add an independent consumer verifying the precise star equality, warn/error policy and axiom whitelist on the exact source commit. Test a minimal CLM-adjoint expression in exploration first if API uncertainty remains.
5. A follow-up gate addresses the commutator with a **third distinct label**. Do not overclaim a complete 48-label LieHom, Spin(9) lift, gauge commutation, original AlgebraData.theta realization, full L² physical state or Hamiltonian spectral result.

**Key negative knowledge:** the source Clifford star sends odd real generators to minus themselves while the Fock gamma image is self-adjoint. Thus the *global* Clifford map is **not** automatically star-preserving. The existing bivector-star candidate is specifically degree two; importing it would add unrelated, unqualified ancestry to the smaller F1B theorem.

## How our future sessions can retrieve this without guessing

Use a new **stdlib-only, read-only** note finder alongside H1. It searches actual checkout Markdown instead of only H1's handpicked accepted records:

    python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "Fock bivector adjoint" --include-lean --limit 12
    python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "subtype coercion gamma" --limit 12
    python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "original gamma bracket" --notes-dir ../Foundational-Convergence-Program/handoffs

The last command needs a separately checked-out FCP directory; the tool makes no network requests and never treats documented status as independently qualified. Search result fields include text relevance, reported status, run IDs, candidate source paths and exact commit hashes. Always fetch/verify the cited actual source and strict gate before using it as a qualified theorem.

**No wholesale historical mining is necessary for every gate.** Begin with relevant headings and high-signal failure/acceptance notes; follow the evidence only as far as needed to resolve the next exact mathematical obligation. This F1B pilot found a likely reusable proof method and a smaller dependency cut **without writing a new Lean proof**.
