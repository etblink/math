# D1S4 — original finite-Fock self-adjointness source gate

**Research date:** November 21, 2026 (America/Los_Angeles).
**Current status at launch:** PENDING / NOT QUALIFIED.

## Motivation and exact scope

D1S3 accepted the source-level theorem that the original BFSS physical real fermionic coefficient is skew-symmetric for every original AlgebraData N and Boson N. It was qualified as strict SOURCE-ONLY GREEN in [run #44976962312](https://github.com/etblink/math/actions/runs/44976962312), tested commit 768446976e6b35e2a23acbcece0c23a97f159e6a, source blob f35d70284bec100dc617935cf41a6c933c618e5b.

D1S4 tests whether the **literal original source finite-Fock quadratic operator** \(M.quantizeFrequency(M.fermionCoefficient(x))\) is self-adjoint. This is NOT a full BFSS Hamiltonian or domain theorem, and DOES NOT retry the frozen D1S1/D1T0/D1T1/D1R0 consumers.

## Literal pinned sources

- Core.lean, blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60: original theta_selfAdjoint and original finite Fermion N.
- FermionFrequency.lean, blob cbb82a42f42b3b3d3695081247bd14d0496abc7d: original real FrequencyMatrix N.
- FermionQuantization.lean, blob c6b72d030225c707ef54f5285a18a7a8175ee280: exact original quantizeFrequency, using \(i/2\) and a double frequency-index sum.
- FrequencyContraction.lean, blob 425edf6d7d0f9d15ce5f8bc92e8788ef60068618.
- SU2BFSSG1APairedThetaProbe.lean, blob 152204ef15a6569534e0503824a697cb9ae8e4ce: literal pairedAlgebraData.
- Strict-qualified D1S3OriginalFermionCoefficientSkewProbe.lean, blob f35d70284bec100dc617935cf41a6c933c618e5b.
- Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Permitted axioms only propext, Classical.choice, Quot.sound.

## Analytic proof architecture — NOT an accepted new Lean theorem until native qualification

Set \(U(r,s)=(K_{rs}:\mathbb C)\,\theta_r\theta_s\), where the theta operators are the original self-adjoint Majoranas. For real skew \(K\), \(K_{rs}=-K_{sr}\).

By the algebraic star identities, \(U(r,s)^\dagger=-U(s,r)\). Swapping the two finite sums shows \(S^\dagger=-S\) for \(S=\sum_{r,s}U(r,s)\). Since \((i/2)^*=-i/2\), the original operator \(Q(K)=(i/2)S\) satisfies \(Q(K)^\dagger=Q(K)\).

The first Lean goal is the generic original-carrier theorem

    sourceQuantizeSkew_isSelfAdjoint:
        K.transpose = -K → IsSelfAdjoint (M.quantizeFrequency K).

The second specializes to K = M.fermionCoefficient x and imports the accepted D1S3 theorem. The third specializes to the literal original paired SU(2) AlgebraData 2 and its 24-mode Fermion 2. These are proofs of **bounded finite-Fock** operators only.

## Exact unqualified R1 gate at launch

Source candidate: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S4OriginalPhysicalQuantizationSelfAdjointProbe.lean
Git blob: ea95d0e0ecdc7e6e0405f1df91d47757d96baed4.

Three candidate roots:

1. FCP.BFSSHopfD1S4.sourceQuantizeSkew_isSelfAdjoint
2. FCP.BFSSHopfD1S4.originalPhysicalQuantization_isSelfAdjoint
3. FCP.BFSSHopfD1S4.pairedOriginalPhysicalQuantization_isSelfAdjoint

Dedicated strict workflow: .github/workflows/bfss-d1s4-original-quantizer-selfadjoint-source-strict.yml
Git blob: 48034f0a42aa6c88257092aba460dd1002f0ffe6.

The workflow freezes exact original source hashes, checks the expected import and roots, restores pinned Lean/Mathlib, performs a native source cold build, recompiles using warning-as-error, parses all three axiom reports and preserves source/environment logs even on failure. It cannot be mistaken for a full independent public-source consumer qualification.

**Original [D1S4 R1 #44978109630](https://github.com/etblink/math/actions/runs/44978109630)** launched at exact tested commit b3c5eeaae14a46ee4c0b2f2bbbf4195b508e0efd. Its result is pending at launch; this memorandum makes no GREEN claim.

## Governance and scientific limits

On a RED, retrieve the first causal Lean/log error and archived artifact at the exact tested SHA. Only one narrowly justified follow-up attempt is permitted, with an invariant two-native-RED stop; no linter/recursion/axiom bypasses. A source-only GREEN requires independent verification of the native build, strict source reports, all three accepted roots, artifact hash and exact SHA.

Even a GREEN would establish finite-Fock self-adjointness only. No self-adjoint unbounded BFSS Hamiltonian, SmoothCore invariance, spectral gap, physical Hopfion, Standard Model derivation or GUT follows. Earlier D1S0 independent GREEN and D1S3 source GREEN are retained; D1S1/D1T0/D1T1 and D1R0 consumers remain RED/FROZEN.
