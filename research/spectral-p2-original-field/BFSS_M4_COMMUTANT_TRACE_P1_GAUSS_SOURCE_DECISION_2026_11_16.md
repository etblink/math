# BFSS M4 — commutant/trace versus P1 and charge-square/Gauss: source-exact decision

Date: 2026-11-16 Pacific. Project Lead bounded read-only mathematical audit followed by this documentation-only preservation on `integration/bfss-unified-research-20261108`.
Baseline branch HEAD before memo: `74e000fe582c701b4e743905af40146d5935a022`.

**Verdict: PROMISING, NOT QUALIFIED.** Research sequencing decision: audit a minimal original-source *commutant-and-trace* bracket-defect gate before launching P1; retain the prospective P1 four-Majorana contract as the fallback, and keep the equal-norm charge-square/Gauss route as an independent physical-energy comparator. No Lean module, consumer, workflow, accepted theorem, proof receipt or canonical `BFSS_GATE_STATE.json` status is changed by this note. No strict run was launched. This is not a source-typed proof of the full Lie bracket.

## 1. Exact original carrier and target

Let `Op := Fermion 2 →L[ℂ] Fermion 2`, with the *active* original `sourceNormalizedGamma : Source48Label → Op`, whose CAR normalization is `Γ_p Γ_q + Γ_q Γ_p = 2δ_{pq} I`. The immutable original definition in LB1S is

```text
K(A) = ∑ p : Source48Label, ∑ q : Source48Label,
       (A p q / 4 : ℝ) • (Γ_p * Γ_q)
```

for real `Source48Label × Source48Label` matrices. For real skew `A,B`, with `A.transpose=-A`, `B.transpose=-B`, define the *prospective*, not yet staged, defect

```text
D(A,B) = (K(A)*K(B) - K(B)*K(A))
          - K(A*B - B*A).
```

The source-shaped exit theorem is `D(A,B)=0` on actual `Op`, with literal real matrix multiplication, source label order and source `1/4` coefficient. Neither a formal `so(48)` bracket nor a physical Spin(9) vector action is asserted today.

## 2. Mathematical derivation and its precise unproved joins

**Step A — zero action on generators.** LB1C1 already gives, for each *skew* `A`,

```text
[K(A), Γ_k] = ∑ r : Source48Label, (A r k : ℝ) • Γ_r.
```

The Jacobi identity in the original noncommutative Fock operator algebra then formally gives

```text
[[K(A), K(B)], Γ_k]
 = [K(A), [K(B), Γ_k]] - [K(B), [K(A), Γ_k]]
 = ∑ r, ((A*B-B*A) r k : ℝ) • Γ_r,
```

so `[D(A,B),Γ_k]=0` for *every* `k`. The matrix index convention is essential: LB1C1 has `A[r,k]`, not `A[k,r]`; test the sign with an elementary skew plane. This step needs a **small generic Jacobi/finite-sum source adapter**; the native double-expanded `K(A)` expression must remain opaque. The commutator convention is `[X,Y]=XY-YX`.

**Step B — convert commutation with the active generators to original Clifford linearity.** OP3A2 already identifies the original complex Clifford generator image with the *active* `sourceNormalizedGamma` on each original `8 × 2 × 3` coordinate axis. M3B defines the actual `CliffordAlgebra (source48Quadratic.baseChange ℂ)` module on `Fermion 2`; M3I packages the full original Clifford-to-Fock `AlgEquiv`. The remaining source theorem must use the genuine axis exhaustiveness and Clifford generator induction/universal property to show that `D` commutes with the complete original action, then construct the actual `A`-linear endomorphism of `Fermion 2` from the complex-linear `D`. The OP3A2 axis theorem is not by itself the all-label/all-Clifford-module adapter.

**Step C — scalar commutant is ALREADY proved in the original source.** M3C has the exact declaration

```text
originalComplexCliffordFock_scalarCommutant :
  Function.Bijective (algebraMap ℂ (Module.End A V))
```

using the original M3B module and Schur's lemma, with `A` the original complexified 48-Clifford algebra and `V = Fermion 2`. Once Step B is source-bound, this implies `D = λ • I` on the original Fock carrier for some `λ : ℂ`. This result must NOT be imported as a conclusion about an arbitrary substitute representation.

**Step D — trace kills the scalar.** T1 defines the *ordinary original complex trace* `originalFockTrace` via the canonical equivalence between `Module.End ℂ (Fermion 2)` and `Op`. However, the accepted T1 group-action trace invariance statement alone is **not** a proof of cyclic trace for arbitrary `Op`; a source-typed cyclicity lemma must be supplied (by transport of the appropriate pinned Mathlib trace lemma).

For skew `C`, the calculation is

```text
Tr K(C) = 1/4 ∑p,q C[p,q] Tr(Γ_p Γ_q) = 0.
```

It uses only `C[p,q]=-C[q,p]`, exchange of finite summation indices and `Tr(Γ_p Γ_q)=Tr(Γ_q Γ_p)`; **no new CAR expansion is needed**. Real-to-complex scalar transport must use the accepted source interface, not a new global instance. Similarly `Tr([K(A),K(B)])=0` by cyclicity. Therefore `Tr D=0`. Since `D=λI`, this gives `λ · dim_ℂ(Fermion 2)=0`, and the original Fock space is finite-dimensional and nonzero, so `λ=0` in characteristic zero. The last finrank/nonzero step must be on the literal source `Fermion 2`, not an assumed auxiliary matrix dimension.

**Important ceiling:** Together A–D are a conventional mathematical argument *conditional on the four typed joins*. The argument is not itself formal verification, and none of A–D can be silently declared strict-qualified because of its neighbors.

## 3. Recovered source donors and blob pins

All paths below are relative to `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`. These are source Git blob identifiers observed on the baseline HEAD; a new gate must pin its full dependency closure, consumers and workflow separately.

| Role | Original source file | Blob |
| --- | --- | --- |
| K(A) and skewness | `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean` | `d7d460fc8d2806234816e8bd2088f9cebb6addd4` |
| K-gamma covariance | `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` | `c2e7a7c665121283cde13ae5dabc183362b6b420` |
| Real/complex normalized active gamma | `SU2BFSSSource48NormalizedFockGammaProbe.lean` | `7abc03723b3111e4a03389b722054e50d6a9bf30` |
| Original Clifford scalar commutant (M3C) | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3COriginalCliffordFockSchurAndFiniteProbe.lean` | `6fefd9ae344df0b7247feb34c9bec5ea0a27aea0` |
| Original Clifford module (M3B) | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3BOriginalComplexCliffordSimpleModuleProbe.lean` | `e7de3612d83889d8e08318307b37b15ac6567202` |
| Original full Clifford algebra equivalence (M3I) | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean` | `754a5f2a13baea90312f6031eb8fa7963dbdf42b` |
| Clifford axis = active gamma (OP3A2) | `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean` | `a9db27fc28379b35ca85515d733cc0bc43376592` |
| Original operator trace (T1) | `T1OriginalFockTraceInvariance.lean` | `3be6c9a6f2898484df66690f94fdfa1877660897` |
| Sparse-plane normalization fallback (P0B) | `P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean` | `1c47a8645bb8ae18110f29083c95887b8a0e3a15` |
| Opaque-product Leibniz fallback (LB1L2) | `P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean` | `b4012951a26aa7573db513adab3d7ce27396db7e` |

The M3I source header still bears historical candidate language, but the separately recorded Edition 0.8 atlas treats its strict historical run #42547700192 as accepted; provenance should be checked again before a new frozen strict gate. The new memo does not requalify any donor.

## 4. Bounded next proof-contract audit (NO expensive CI yet)

| Candidate microgate | Exactly what would be tested | Stop condition |
| --- | --- | --- |
| **CT0 — abstract traced skew sum** | Typed cyclic trace on the actual `Op`, plus an *opaque finite-index* antisymmetric-coefficient/symmetric-trace contraction, then smallest original source `Tr K(A)=0` specialization | Two similar native scalar/trace conversion failures |
| **CT1 — Jacobi defect on active gamma** | Generic noncommutative Jacobi + real scalar/finite-sum covariance abstraction; bind only LB1C1 and `[D,Γ_k]=0` on original labels | Source must unfold full K double sums or consumes repeated timeout |
| **CT2 — active gamma to scalar commutant** | OP3A2 axis exhaustiveness, original Clifford action induction, actual A-linear endomorphism, M3C scalar decomposition | Missing original source basis/representation join, or an unqualified donor |
| **CT3 — trace eliminates scalar** | `Tr D=0`, `Tr I≠0` on original Fock, hence `D=0` | Trace normalization or finite-rank source mismatch |
| **Strict consumer gate, only after small joins are executable** | Same source statements imported independently, native original skew `A,B`, matrix-plane sign control, `A=0`, `B=0`, repeated labels, exact axioms and source pin audit | Red/diagnostics must be fully preserved; no automatic retry |

Favor **CT0 or CT1 as the first low-cost typed probe** only after reviewing exact signatures and frozen independent consumers. If either turns into the same unbounded native conversion that defeated LB1L0, pause the route and invoke the prospective P1 contract. Do not stage multiple expensive CI lanes at once. Preserve prior 65/36/26 minute job/restore/proof policy, 1100/360/360 second cold/source/consumer limits, warning-as-error and standard axioms only (`propext`, `Classical.choice`, `Quot.sound`); no `sorryAx`, resource escalation, new global instances, commutative operator assumptions or changed accepted donor bytes. This memo is not an authorization to move `main` or an upstream PR.

## 5. Research allocation comparison

| Route | Current mathematical advantage | Remaining original-source obligation | Decision |
| --- | --- | --- | --- |
| **Commutant + trace** | M3C scalar commutant, M3I full original algebra, OP3A2 exact active-axis source bridge and LB1C1 covariance already exist. Avoids explicit four-gamma products | A-linear source bridge and scalar trace elimination are unqualified; may be several small Lean joins | **Audit first, no new expensive run yet** |
| **P1 four-Majorana** | Narrow two-root LB0/LB1L2 donor chain, with P0A/P0B original plane controls and a frozen contract | Native four-gamma source binding; then still plane bracket and finite extension | **Preserved immediate fallback** |
| **Equal-norm charge-square/Gauss** | May remove individual-charge core energy prerequisite without global Spin(9); precise G5P/Q/W, G6H/I/K and G7T source plan already exists | Fermionic difference, scalar fderiv adapter, native invariant-core Gauss join, basis spinors and graph domains | **Independent forward energy lane** |

A completed `so(48)` Lie homomorphism does **not** itself establish the continuous global original Fock-vector Spin(9), correct central sign, physical SU(2)-gauge/charge-domain covariance, reducing spinor sectors, G16 numerical Hardy estimate or fixed-positive-regulator ground-state fidelity. Equally, a source Gauss square-difference theorem does **not** alone give the resolvent identity or source Hardy inequality.

The **leading physical endpoint** remains the fixed-positive-regulator lower bound on original ground-subspace fidelity for a controlled trial state. Select expensive gates by their prospect of removing an actual named physical obstruction. Reassess if two analogous proof-engineering failures recur, if a counterexample defeats a source identity, or if five accepted gates remove no named physical obstruction.

## 6. Governance and next action

- Canonical `BFSS_GATE_STATE.json` remains P0B R3 GREEN (#43962066769); P1 is prospective, not staged. This *research comparison* does not rewrite live qualification or historical Edition 0.8.
- First action after this memo: inspect pinned Mathlib trace cyclicity and original Clifford generator induction signatures; write a one-page CT0/CT1 source-shaped pre-gate contract only if a truly bounded typed route is visible. Otherwise execute the existing P1 contract.
- Preserve all P0A/P0B/LB1L0 negative evidence, run receipts and immutable blobs, plus this new attempted-path reasoning. No branch deletion, `main` changes, accepted source mutations, or publication claim.

**Status: documentation-only research decision; no new proof has been compiled or qualified.**
