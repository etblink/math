# BFSS CT1-G0 R1 — original Fock Jacobi strict pre-gate

Date: 2026-11-16 Pacific. Repository `etblink/math`, sole research branch `integration/bfss-unified-research-20261108`.

**PROSPECTIVE, UNCOMPILED AT THIS STAGING CHECKPOINT.** The source and independently imported consumer are frozen with an exact donor-pinned strict CI workflow. Committing all together triggers the strict run; no proof is qualified by this note. Previous accepted **CT0 R2 STRICT GREEN #43983772199** (and all accepted P0B/P0A/LB1C1/LB1L2 evidence) remains immutable.

## Bounded G0 target, deliberately smaller than CT1

Three exact original Fock source theorems:
1. `originalFock_commutator_jacobi`: noncommutative Jacobi identity `[[T,S],X]=[T,[S,X]]-[S,[T,X]]` on actual `Fermion 2 →L[ℂ] Fermion 2`; all variables opaque.
2. `originalFock_commutator_sub`: `[T-S,X]=[T,X]-[S,X]` on the same original Fock carrier.
3. `originalSource48K_commutator_jacobi`: the literal original source `K(A),K(B),sourceNormalizedGamma k` specialization, without opening `K(A)=1/4 ∑_{p,q}A[p,q]Γ_pΓ_q`. Source matrix input is the actual `Matrix Source48Label Source48Label ℝ`; source `1/4` and normalized gamma remain unchanged. This identity holds even without assuming skew input because it is purely associative-algebraic.

**Not included in G0:** the source-real/complex scalar bridge for the *double finite-index covariance composition*, `[[K(A),K(B)],Γ_k]=∑_r (AB-BA)[r,k]Γ_r`, the `[D(A,B),Γ_k]=0` defect, CT2 Clifford scalar commutant, CT3 trace elimination, full bivector Lie bracket, physical Spin9 vector action, physical-domain representation, G16/Hardy, ground-state existence, mass gap or fixed-positive-regulator fidelity certificate. These remain explicitly open.

## Frozen Git source and workflow

| Role | Path | Git blob |
| --- | --- | --- |
| Native original Fock source | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean` | `e4837ccb96108ecabcebfd0ba2534398fe0ddb2a` |
| Independent consumer | `lean/diagnostics/BFSSP3M4CT1G0OriginalFockJacobiIndependentConsumer.lean` | `2d38aa70c6b4a55d4b8af3245d6d63b15839d697` |
| Strict workflow | `.github/workflows/bfss-m4-ct1g0-original-fock-jacobi-strict.yml` | `379dd974513f3cf327880c2f1d4203805d4bfbcd` |
| Accepted LB1L2 (opaque Fock product precedent) | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean` | `b4012951a26aa7573db513adab3d7ce27396db7e` |
| Accepted LB1C1 source K-gamma covariance | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` | `c2e7a7c665121283cde13ae5dabc183362b6b420` |
| Accepted CT0 trace-zero | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT0OriginalSkewBivectorTrace.lean` | `a6f93c62c83bf51a0b89691196f875399d2896fa` |

Additional original source `LB1S`, normalized gamma, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` are pinned in the active workflow. No donor may change while this gate runs.

Acceptance requires exact source/consumer/donor/toolchain/checkpoint preflight, 1100-second bounded cold source compilation, separately compiled source and independent consumer with warning-as-error, 3 source and 3 consumer standard-only axiom reports (`propext`, `Classical.choice`, `Quot.sound`), 4 consumer controls (opaque generic, zero, coincident original source index, concrete paired original index), and positive + six negative auditor controls. Preserve any original RED with first causal error, run SHA, complete job log and original artifact digest before R2 consideration. Two analogous native conversion failures terminate this route pending architecture review; do not increase time, memory, heartbeat or recursion limits.

Original evidence must be preserved and separately rehashed before canonical GREEN promotion; until then last qualified remains CT0. This gate's scientific role is a cheap algebraic prerequisite for possible CT1G1/CT1G2 finite-index covariance and Clifford commutant arguments. The original Gauss energy lane remains a live physical comparator, and all accepted provenance stays on this unified integration branch, not `main`.
