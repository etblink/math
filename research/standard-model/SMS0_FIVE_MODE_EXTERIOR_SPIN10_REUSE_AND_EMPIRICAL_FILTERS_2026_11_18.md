# SM-S0: five-mode exterior algebra, Spin(10) chiral mathematics, and empirical filters

**2026-11-18. Forward research only; NO code gate staged, and NO physical unification claimed.** This work derives its priorities from the [truth-first mandate](../methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md), not from BFSS success. It is separate from [SM-Y0's independently tested one-family anomaly coefficient ledger](SMY0_ONE_FAMILY_HYPERCHARGE_ANOMALY_PRE_GATE_2026_11_18.md). A mathematical Spin(10) representation does **not** establish an underlying physical Spin(10) force.

## Why five modes are a plausible reusable construction

Let \(W=\mathbb{C}^{5}\) and \(F=\Lambda^\bullet W\) (the full fermionic exterior/Fock space). A basis is indexed by all subsets of five one-particle labels, so \(\dim_{\mathbb C}F=2^5=32\). The even/odd degree sectors have basis labels of respective cardinalities

\[
 \dim_{\mathbb C}\Lambda^{\mathrm{even}} W
  = \binom50+\binom52+\binom54=1+10+5=16,
 \qquad
 \dim_{\mathbb C}\Lambda^{\mathrm{odd}} W
  = \binom51+\binom53+\binom55=5+10+1=16.
\]

This is **mathematical**, independent of BFSS's 48 original Majoranas/24 complex fermion modes and the Spin(9) 16-real spinor. Neither 16 nor the number 48 alone is explanatory evidence. Ordinary Spin(10) representation theory gives chiral complex 16-dimensional Weyl spinors in these sectors after constructing the correct Clifford action; those are **not** the BFSS physical fermions.

Under an \(SU(5)\) subgroup, one choice of chiral sector branches as

\[
\Lambda^{\mathrm{even}}\mathbb{C}^{5}
 = \Lambda^0 W\oplus\Lambda^2 W\oplus\Lambda^4 W
 \simeq \mathbf1\oplus \mathbf{10}\oplus\overline{\mathbf5}.
\]

This matches the familiar **possible** one-generation representation content (including a singlet conjugate right-handed neutrino). The opposite chiral 16 has conjugate branching; determinant twists matter for \(U(5)\) actions and are trivialized in the \(SU(5)\) restriction. A complete theorem must explicitly construct its group maps, not silently identify an exterior vector-space decomposition with a Spin(10) group representation.

**Independent references:** [PDG 2025 Grand Unified Theories review](https://pdg.lbl.gov/2025/reviews/rpp2025-rev-guts.pdf) (background only; do not transfer 2025 precision parameters into a 2026 benchmark); [PTEP 2024, CPT, Majorana Fermions, and Particle Physics Beyond the Standard Model](https://academic.oup.com/ptep/article/2024/8/08C101/7687822); [An Algebraic Roadmap of Particle Theories (2024)](https://onlinelibrary.wiley.com/doi/full/10.1002/andp.202400322); [Physics lecture: QFT 2, group representations](https://www.tpi.uni-jena.de/~floerchinger/qft2/lecture17/). These describe conventional candidate representations; no experimental confirmation of GUT is implied.

## Source-exact pinned Mathlib interfaces verified

Pinned Mathlib commit: \`d13f23b723b8a846827a245b89c10fc7d3f11612\`, Lean 4.34.1. The following were inspected at their actual Git blobs.

1. \`Mathlib/LinearAlgebra/ExteriorAlgebra/Basis.lean\`, blob \`dd57600e2c23acdf4fcbaf89a4c769d342450dbd\`: \`Module.Basis.ExteriorAlgebra\` makes a basis indexed by \`Finset I\`, with lemmas \`ExteriorAlgebra.basis_apply\` and \`basis_mul_of_disjoint\`. This supplies a genuine linear basis, not merely a free-floating combinatorial coincidence.
2. \`Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean\`, blob \`28eb28e5bfeeb71a4e6ae355c3fb28d8b1c9d951\`: \`ExteriorAlgebra.gradedAlgebra\` and a \`DirectSum.Decomposition\` by degree. Need a **new exact parity-submodule adapter** to aggregate even/odd degrees and restrict the exterior basis.
3. \`Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean\`, blob \`fbcf362039a1c89e3e3344372fc6f723435d003e\`: \`CliffordAlgebra.ι\`, \`lift\`, \`hom_ext\` and \`adjoin_range_ι\` for universal quadratic-generator relations. The 10 *complex* Majorana generators require a carefully specified quadratic form and a map from the 5 creation/annihilation pairs.
4. \`Mathlib/LinearAlgebra/CliffordAlgebra/Even.lean\`, blob \`eb3939dd0375a82171010e720eb32507d951b3b3\`: even Clifford subalgebra and universal even lift, which should preserve the parity sectors **only after proof of the concrete exterior action**.
5. \`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean\`, blob \`f06d1130ec5d8d4a552fdb9e670c650135e75f9c\`: existing pin/spin group and conjugation infrastructure. Does not automatically prove faithful Spin(10) action on the proposed parity modules.

Exact app-independent technical pattern: **five-mode CAR → ten Clifford generators → even Clifford action on parity sectors → 16-dimensional chiral modules → subgroup branching**. Keep each arrow a separately reviewable mathematical obligation.

## Proposal: bounded mathematical gates (no Green asserted)

| Gate | Exact formal target | Proposed source strategy | Strong failure criterion |
|---|---|---|---|
| **SM-S0A** | Cardinalities of 5-mode exterior subset bases with even/odd cardinality equal 16 | \`Finset (Fin 5)\` plus Mathlib \`Module.Basis.ExteriorAlgebra\`; prove cardinalities and expose basis-index subset | If only subsets count is proved, report **combinatorial** result, not vector-space dimension of parity modules |
| **SM-S0B** | Construct even/odd homogeneous parity submodules and restrict exterior basis to each | Mathlib exterior \`DirectSum.Decomposition\`, grading and basis API | Do not presume closure/finite-rank from bare cardinality; require actual basis proof |
| **SM-S0C** | Five creation/annihilation pairs satisfy CAR on the constructed space | Wedge multiplication and contraction as **typed linear operators**; avoid reusing BFSS source fermion operators as physical input | If source-exact 5-mode contraction is missing, write a method memo rather than invent a representation |
| **SM-S0D** | Ten Clifford relations and even-action parity invariance | \`CliffordAlgebra.lift\`/even subalgebra, source-exact quadratic form, no new axioms | If group action is unproved, do not label a Lie algebra identity a Spin(10) representation |
| **SM-S0E** | SU(5) branching \(16\to1\oplus10\oplus\overline5\), then SM branching/hypercharges | Exact explicit subgroup homomorphisms and basis intertwiners | Mere dimension equality or suggestive field labels are *not* a branching proof |

No SM-S0 gate should change \`BFSS_GATE_STATE.json\` or claim any originally accepted BFSS anchor. Use independent Lean namespace, consumer and native integrity archive as done for SM-Y0. A failed proof is mathematical negative evidence, not experimental disconfirmation.

## Physical-falsifiability filter: don't overvalue elegant representation theory

A mathematically exact \(SU(5)\) or Spin(10) branching can still be inconsistent with particle physics. A useful candidate **dynamical** GUT must predict relationships between couplings, symmetry-breaking scales, particle masses/mixings and observable processes. These are model-dependent and not settled by the spinor dimension.

A crucial test is proton decay. For example, Super-Kamiokande's published \(p\to e^+\pi^0\) search with enlarged fiducial exposure reported

\[
 \tau/B(p\to e^+\pi^0)>2.4\times10^{34}\ {\rm years}
 \quad\text{(90% CL, published 2020/2021).}
\]

[Source: Super-Kamiokande search, eScholarship archival publisher record](https://escholarship.org/uc/item/9gz4c03p). **This is a specific older decay channel and date**, not an assertion that it is the most recent global constraint. Distinct 2026 searches involve other channels, e.g. [\(p\to e^++X\) and \(p\to\mu^++X\)](https://journals.aps.org/prd/abstract/10.1103/rsr5-d3x2) (October 13, 2026), and cannot be numerically substituted. The 2026 [PDG](https://pdg.lbl.gov/2026/) is the versioned source for model comparisons.

Other necessary challenges: explain three observed generations instead of one spinor, mass and CKM/PMNS mixing structures, measured Higgs/electroweak sector, neutrino mass effects, chiral locality and gauge symmetry breaking, and the existing null-search constraints. **Representation geometry is a necessary construction test, not sufficient explanatory physics.**

## Project Lead recommendation

**First finish/adjudicate SM-Y0 as a tiny independent benchmark.** In parallel, forward research SM-S0A/B's exact parity-module basis, but do not launch a complex Spin(10) formalization solely because the group has an attractive dimension. More than one external framework should remain eligible for comparison on identical empirical requirements, especially 4D QFT and general field representations unrelated to BFSS.

Scientific stopping rule: if a proposed representation fails the known Standard Model charge/anomaly ledger or contradicts measured constraints, record the discrepancy even if the Clifford construction is internally beautiful.
