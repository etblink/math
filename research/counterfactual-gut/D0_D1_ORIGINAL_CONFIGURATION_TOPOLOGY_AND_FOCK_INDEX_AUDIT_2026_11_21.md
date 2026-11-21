# D0 / D1 — Original BFSS orbit topology, Fock parity, and the missing spacetime-index bridge

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Disposition:** **D0 narrowed / naïve route rejected; D1 source interfaces identified but physical index OPEN.**  
**Research type:** exact-source read-only inspection plus elementary mathematical deductions. **No new Lean kernel check, source/consumer CI, physical BFSS hopfion, chiral particle or GUT is claimed.**

## 0. Exact source and reused negative evidence

Our purpose is to test the *necessary structure* for the counterfactual "a physical BFSS hopfion generates protected chiral matter", not to manufacture a favorable answer. Previously established negative knowledge must constrain what follows.

Source-at-branch-snapshot, all without changes:

| Source | Exact Git blob | Relevant declaration |
| --- | --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | `Boson N`, `Fermion N`, `FullL2 N`, `SmoothCore N`, `AlgebraData.charge` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG2ABosonGaugeProbe.lean` | `898c987cbcc0840f9c137682c3be345baca809d1` | `bosonGaugeEquiv : GaugeGroup 2 → (Boson 2 ≃ₗᵢ[ℝ] Boson 2)` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2aOriginalFockGaugeSource.lean` | `328d607ee2bb45edd4268e5592d784c4c84488a7` | Actual `fermionGaugeUnitaryHom` source bind |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2bOriginalGaugeProjectionBridge.lean` | `13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec` | Actual fixed Fock subspace and orthogonal projection |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean` | `a16d3573b737bb4453e42b0b543d63cbbac1cd1b` | Nonzero original gauge-fixed vacuum |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean` | `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1` | Original normalized native charge-square binding; file explicitly **PROSPECTIVE** without its own strict qualification |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean` | `5633ef2ed7cf182edaee171fb45273d325103b94` | Original source (9\times9) spatial Gram gauge invariance |

Historical controls on this same branch snapshot:

- [RHOPF-P1](../topology/RHOPF_P1_SOURCE_EXACT_OCTONION_SPIN9_AND_ESCAPE_AUDIT_2026_11_18.md) identifies exact gamma octonionic Hopf geometry and a **based escape** when restricted complex/quaternionic targets expand into the original larger carrier.
- [RHOPF-P2](../topology/RHOPF_P2_FOCK_SECTOR_SELECTION_AND_UNWINDING_AUDIT_2026_11_18.md) supplies an explicit finite-barrier, gapped **toy Fock** unwinding: parity + gap alone are insufficient.
- [RHOPF-P3](../topology/RHOPF_P3_ORIGINAL_FOCK_PARITY_AND_INDEX_READINESS_AUDIT_2026_11_18.md) documents the actual original CAR/gauge-vacuum interfaces and that their existence does **not** produce a spatial chiral index.
- [RHOPF-P4](../topology/RHOPF_P4_CHIRAL_FOCK_INDEX_AND_BASED_ESCAPE_AUDIT_2026_11_18.md) checks the original-source (16\times16) five-gamma chiral-family trace cancellation across 126 choices: net complex AIII winding **zero** in the specified original-gamma test family. Its minimal independent control has nonzero winding, which is lost when the protecting chiral condition is relaxed along a based, gapped escape.
- [RHOPF-P9](../topology/RHOPF_P9_RELATIONAL_PROJECTOR_FOCK_FORWARD_RESEARCH_2026_11_18.md) records source Spin(9) phase-lift nonuniqueness and a possible gauge-invariant bosonic observable that separates global lifts. Restricted circle data do not identify a unique physical symmetry.

These were previous mathematical/source-audit results, **not** a new native Lean qualification in this document.

## D0-1. New exact-carrier deduction: the ordinary complete bosonic gauge quotient is contractible

For (N=2), original `Core.lean` defines
[
V := \operatorname{Boson}(2)
 = \operatorname{EuclideanSpace}_{\mathbb R}(\mathrm{Fin}\,9\times\mathrm{Fin}\,3)
 \cong \mathbb R^{27}.
]
The **actual** source group (G:=\operatorname{GaugeGroup}(2)=SU(2)) acts through `bosonGaugeEquiv` by **real-linear isometries** (\rho(g):V\to V). In particular
[
\rho(g)((1-t)X)=(1-t)\rho(g)X,qquad \rho(g)0=0.
]
On the **ordinary topological orbit space** (B=V/G), define
[
\mathcal H_t([X])=[(1-t)X],\quad 0\le t\le1.
]
This is well defined by linearity, jointly continuous (the compact group acts isometrically; equivalently use the metric (d_G([X],[Y])=\min_g\|X-gY\|)), and
[
\mathcal H_0=\mathrm{id},\qquad \mathcal H_1([X])=[0],\qquad \mathcal H_t([0])=[0].
]
**Mathematical consequence:** the ordinary unrestricted quotient (V/SU(2)) is contractible. In particular, its ordinary based (\pi_3) has no nonzero Hopf sector.

**Precision of the obstruction:** This eliminates the *inference* "the entire ordinary gauge-reduced (27)-coordinate configuration space has an intrinsic, protected nonzero 3D Hopf homotopy class". It **does not** exclude (a) a dynamically enforced restricted target or boundary condition; (b) an excised discriminant/gap-degeneracy locus (B\setminus\Delta) with different topology; (c) gauge-equivariant/stacky invariants (stabilizers persist even if the orbit space is contractible); (d) Berry/eigenbundles over a noncontractible parameter locus; (e) topology of **spatial maps** from (S^3_{\rm space}) into a separately justified target; (f) non-topological metastable states. A contraction of classical configurations does **not** by itself contract normalized gauge-physical wavefunctions, preserve a spectral gap, or prove a dynamical decay.

The source spatial Gram (G_{ij}(X)=\langle X_i,X_j\rangle) is gauge invariant, but is homogeneous quadratic: (G((1-t)X)=(1-t)^2G(X)). It is therefore compatible with the contraction and not a new topological obstruction by itself. At points with nontrivial gauge stabilizers, gauge-reduced singular-stratum physics can remain nontrivial despite contractibility of the entire orbit space.

**Status:** source-typed elementary mathematical argument; no new Lean source proof. A future *small* Lean/Mathlib consumer can formalize the scaling equivariance, but mathematical convenience alone is not sufficient reason to divert the ongoing RHOPF branch.

## D1-1. New finite-dimensional parity-index obstruction (only on full fermionic carrier)

The original source defines
[
\mathcal F=\operatorname{Fermion}(2)\cong\mathbb C^{2^{24}},
]
with original (48=16\times3) real Majorana labels and a 24-complex-mode Fock presentation. For the occupation-parity decomposition of the *full* 24-mode exterior Fock space,
[
\mathcal F_+=\Lambda^{\mathrm{even}}\mathbb C^{24},\qquad
\mathcal F_-=\Lambda^{\mathrm{odd}}\mathbb C^{24},
]
the elementary binomial identities yield
[
\dim_\mathbb C\mathcal F_+
=\sum_{k\,\mathrm{even}}\binom{24}{k}
=2^{23}
=\sum_{k\,\mathrm{odd}}\binom{24}{k}
=\dim_\mathbb C\mathcal F_-.
]
Consequently for **every** linear map (D:\mathcal F_+\to\mathcal F_-) of these *full finite-dimensional parity sectors*,
[
\operatorname{ind}(D)
:=\dim\ker D-\dim\operatorname{coker}D
=\dim\mathcal F_+-\dim\mathcal F_-=0.
]
This is rank-nullity, independent of the entries of (D). An isolated zero mode, changing spectral gap or Berry phase may exist; these do not invalidate the finite-dimensional index identity. When (D^*\) is defined, (\dim\mathrm{coker}D=\dim\ker D^*\).

**Strict exclusions from this claim:**
1. The actual source-specific parity-volume operator correspondence still requires its exact accepted Majorana pairing/sign/normalization in Lean (P3 was a local comparison audit).
2. After projecting to the **gauge-fixed fermionic subspaces**, their even/odd dimensions need not be equal; no zero-index statement has been established for the restricted spaces.
3. The full physical `FullL2 2 = L²(V;\mathcal F)` is **infinite-dimensional**. No claim about its supersymmetric/Witten index, spectral flow, bound-state count or Fredholm index follows from this finite-dimensional calculation.
4. Fermion occupation parity is **not** a four-dimensional Weyl-chirality operator. Even a nonzero supersymmetric ground-state index would not automatically count net Standard Model generations.

**Status:** mathematical deduction on the abstract 24-mode occupation decomposition, grounded in the original finite `Fermion 2` carrier; not a new source-qualified parity or physical index result.

## D1-2. Positive source interface: the original supercharge is differential, but not a 3-space Dirac operator

The actual `AlgebraData.charge (α)` in frozen `Core.lean` acts on
[
\mathrm{SmoothCore}(2)\subset L^2(\mathbb R^{27};\mathcal F).
]
Its two source terms are schematically
[
Q_\alpha =
-i\sum_{i,A,\beta}\gamma^i_{\alpha\beta}
  \theta_{\beta A}\,\partial_{X_{iA}}
+\frac12\sum_{i,j,A,B,C,\beta}f_{ABC}
  (\gamma^{ij})_{\alpha\beta}
  \theta_{\beta A}X_{iB}X_{jC}.
]
This is an **actual matrix-quantum-mechanics supercharge with derivatives in all 27 real bosonic configuration coordinates and a quadratic coordinate coupling**. The original Fock `theta` operators and original gamma/structure constants really occur together; this is a positive source fact.

But its coordinate derivatives are (\partial_{X_{iA}}), **not** (\partial_{x^1},\partial_{x^2},\partial_{x^3}) on physical three-space. Nor does it presently contain a source-defined field (n:S^3_{\rm space}\to S^2) or a corresponding physical Hopf background (X[n]). Thus it cannot be renamed as a localized 3D Callias/Dirac operator.

Separately, the source-gauge representation on `Fermion 2`, the original fixed-space projection and its nonzero vacuum are real reusable interfaces. The exact physical native Hamiltonian source port is explicitly marked **prospective**, so no new self-adjoint/spectrum qualification is inferred from its presence in this snapshot.

**Important distinction between indices:** A 0+1D supersymmetric/Witten index on the infinite-dimensional gauge-physical Hilbert space, a family Berry or spectral-flow invariant, a Callias-type index of a 3D spatial Dirac operator, and the net four-dimensional Weyl chirality of a gauge representation are **different mathematical quantities**. The conventional 3D Callias formula requires an operator Fredholm at infinity, with an asymptotic Higgs/mass field over (S^2_\infty) (not simply the Hopf invariant of (n:S^3\to S^2)). See https://arxiv.org/abs/1506.05144 and https://doi.org/10.1112/jlms.70301 .

## D1-3. Smallest useful next test, and null controls

**Research target D1A — physical-source typing diagram (documentation / audit first):**

```text
Original source:
SU(2)  --rho_B-->  O(Boson 2 = R^27)
       --rho_F-->  U(Fermion 2 = C^(2^24))
SmoothCore 2 --Q_alpha--> SmoothCore 2
               | original 27-coordinate differential and quadratic terms

Separate hypothetical data NOT yet sourced:
S^3_space --n--> S^2_selected
             \?/
physical topological background with gauge-compatible map into original fields
 -> genuine spatial fermion / mass / Dirac operator and admissible domain
 -> source-selected conserved symmetry and Fredholm or spectral-flow invariant
 -> 4D effective chirality, gauge reps and anomalies
```

**Necessary queries, to be answered before any new operator gate:**

1. **Topology carrier:** Does original SU(2) BFSS (or a justified limit/EFT) enforce a noncontractible admissible topological sector despite the full orbit contraction? Name the exact source constraint, boundary data or gap-excision. If none, retain the H0 hypothesis but block the strong topological-stability inference.
2. **Actual operator:** From the existing original (Q_\alpha) and gauge/Fock actions, identify the precise physical source operator that a Hopf texture would modify. Do not substitute a (16\times16) one-particle toy for the (2^{24})-state original Fock carrier.
3. **Protection:** Identify a *dynamically enforced* grading/antiunitary/gauge restriction that survives the extra-component escape. Check P4's negative AIII original-gamma trace calculation before proposing a new winding.
4. **Independent controls:** Compare unrestricted original BFSS, strict (S^2) Faddeev–Skyrme texture, a trivial no-hopfion background, and a chiral AIII positive-control model; require an observable difference and keep geometry and physical field carriers distinct.
5. **Only then:** specify whether the desired number is an SQM/Witten index, a 3D defect index, a family index, or 4D net chirality. Never identify them based solely on their common use of integer-valued invariants.

**STOP rules:** stop the naive quotient-Hop f claim now; stop the full finite-parity-index route as a mechanism for net 4D chirality. Do **not** stop the parent RHOPF mathematics, an explicitly constrained physical texture hypothesis, or new source-backed 4D effective theories. Avoid launching more large-scale Lean/CI work until an operator and specific conditional theorem are stated.

## Decision and scientific value

- **D0 / ordinary full bosonic orbit topology:** `NO_GLOBAL_HOPF_CLASS_FROM_UNRESTRICTED_ORBIT_SPACE` (mathematical obstruction to this specific shortcut).
- **D1 / finite Fock-only parity Fredholm index:** `ZERO_ON_FULL_EVEN_ODD_FINITE_CARRIER` (mathematical obstruction to this specific shortcut).
- **D1 / original source differential operator and SU(2) Fock projection:** `SOURCE_INTERFACES_AVAILABLE`; however, `NO_PHYSICAL_SPATIAL_DIRAC_OR_HOPF_COUPLING_IDENTIFIED`.
- **Next bounded research decision:** investigate a physically admissible restricted/gapped sector **only if source-derived**, while separately testing whether a spacetime/large-N effective operator can be justified. Keep empirical Standard Model tests as independent vetoes.

**Governance:** This report is a mathematical research memorandum, **not** a new Lean theorem, physics simulation, CI artifact, proof receipt, or alteration of `main`/unified RHOPF.
