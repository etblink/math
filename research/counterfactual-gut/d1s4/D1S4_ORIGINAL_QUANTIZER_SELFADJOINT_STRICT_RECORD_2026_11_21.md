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


## R1 strict RED — original first-causal failure independently verified

[Original R1 run #44978109630](https://github.com/etblink/math/actions/runs/44978109630), exact **tested** source commit `b3c5eeaae14a46ee4c0b2f2bbbf4195b508e0efd`, GitHub job `137072428155`, `completed/failure` on first run attempt. Exact frozen source/hash preflight **PASS**, pinned Lean 4.34.1 and Mathlib restoration **PASS**, D1S3 dependency builds and axiom checks **PASS**. The original D1S4 source compilation **RED** before warning-as-error recompilation.

The **first causal error**, source file `D1S4OriginalPhysicalQuantizationSelfAdjointProbe.lean:41:48`:

```text
Tactic `rewrite` failed: Did not find an occurrence of the pattern
  -?r • ?x
in the target
  -↑(K s r) • (θ_s * θ_r) = -(↑(K s r) • (θ_s * θ_r))
```

Other source-elaboration errors: line 48:31, `simp` made no progress on star of nested frequency sums; line 65:32, unsolved scalar goal `-Complex.I / 2 = -(Complex.I / 2)`; line 66:27, `rewrite` failed on over-applied `neg_smul` while proving `(-i/2) • (-S) = (i/2) • S`.

**R1 is mathematically unqualified:** all three `#print axioms` outputs include **`sorryAx`** (in addition to allowed `propext, Classical.choice, Quot.sound`). These arise from missing proof obligations. There is **no source GREEN sentinel** or successful native D1S4 build.

Original archived [R1 artifact #14736927094](https://github.com/etblink/math/actions/runs/44978109630/artifacts/14736927094), 8,595 bytes, GitHub-reported SHA-256 `00f3ba1c20120502b230d14987abd40d32469b1dfe9d0c693e79bc1b332f699e`. Its original job log agrees on SHA and ID.

## R2 targeted proof-only repair — second attempt, NOT accepted at launch

The mathematical statements and original dependent source files are **identical**. The second native attempt modifies ONLY the D1S4 generic theorem's tactics:

- Pairwise sign: use exact reality and skew coefficient rewrites, then `simp only [neg_smul]` only if a goal remains.
- Double star sum: apply two explicit `star_sum Finset.univ` identities, one for the outer sum and one for each inner sum.
- Pure complex scalar sign: `simp <;> ring`.
- Final double negative: `rw [star_smul, hsum, hI]` then `simp only [neg_smul, smul_neg, neg_neg]` on remaining goals.

D1S4 source blob: original `ea95d0e0ecdc7e6e0405f1df91d47757d96baed4` → repaired `de987a392a2e3510aafa835f8522e753725021cc`. Its dedicated workflow **remains** `48034f0a42aa6c88257092aba460dd1002f0ffe6`; original and D1S3 pinned source hashes have not moved. No `sorry`, extra axioms, increased recursion/heartbeats, or linter bypass introduced.

**R2 exact tested source commit:** `c8a92c991ba1dae72627a4f5b81efc4fe7851d2e`. [Strict R2 run #44979114078](https://github.com/etblink/math/actions/runs/44979114078) **launched, still IN PROGRESS at this evidence checkpoint**. No accepted R2 theorem, no axiom report, no archive claim before it completes.

**Two-attempt stop:** On R2 RED, preserve its original first-causal logs and artifact, freeze D1S4, do not launch R3; consider a separate architecture with a typed elementary adjoint lemma after offline review. On R2 GREEN, verify exact source SHA, frozen hash preflight, native build, warning-as-error, all three `#print axioms` roots **without sorryAx**, success sentinel and archive before promotion. This gate is **SOURCE ONLY** and proves nothing about unbounded BFSS Hamiltonian or physical state.


## Final D1S4 R2 exact verdict — SECOND STRICT RED, STOP and frozen source

**Verified [original R2 #44979114078](https://github.com/etblink/math/actions/runs/44979114078)** at exact tested commit `c8a92c991ba1dae72627a4f5b81efc4fe7851d2e`, original job `137075482774`, GitHub `completed/failure`, first attempt. Frozen original source preflight and Lean/Mathlib restoration **PASS**; original D1S3 dependency builds and has permitted axioms; native D1S4 **RED**, strict recompilation skipped.

**First causal source error** at `D1S4OriginalPhysicalQuantizationSelfAdjointProbe.lean:41:52`: `simp made no progress`. Crucial deeper compiler diagnostic: `target expression is not type-correct under the implicit transparency level`, with `function expected K s`. This occurs while rewriting a real matrix entry `K r s` inside the complex scalar action on the original bounded Fock operator. The exact RED is a **Lean elaboration/interface failure**, not evidence against finite Fock Hermiticity. R2's explicit star-of-double-sum and scalar normalization repairs removed the other R1 errors; no additional D1S4 proof error printed. R2's three emitted `#print axioms` reports **contain `sorryAx`** and are therefore **not accepted proofs**.

[Original R2 artifact #14736879317](https://github.com/etblink/math/actions/runs/44979114078/artifacts/14736879317), 8,690 bytes, GitHub ZIP digest `sha256:674bc154852888374f9b80a916f3081b1e2e532579b9e9c75ac5109a75306add`; this matches the GitHub job upload log. Earlier R1 artifact #14736927094, SHA256 `00f3ba1c20120502b230d14987abd40d32469b1dfe9d0c693e79bc1b332f699e`, remains preserved separately.

**FINAL disposition:** D1S4 R1 RED + D1S4 R2 RED → **FROZEN / STOP**. Source candidate frozen at blob `de987a392a2e3510aafa835f8522e753725021cc`, original strict workflow `48034f0a42aa6c88257092aba460dd1002f0ffe6`. **No D1S4 R3**. D1S3 original coefficient skewness strict source GREEN continues to qualify unchanged.

The new [ADJ-A0 method audit and recovery proof DAG](../adjoint-recovery/ADJ_A0_D1S4_TWO_RED_METHOD_AUDIT_AND_PROOF_DAG_2026_11_21.md) synthesizes the successful NORM-0B, JOIN-0B3, D1S3 and F1 techniques and documents the recurrent failure mechanisms. ADJ-A0 is a **new coefficient-independent Mathlib lemma**: no `K`, theta, BFSS carrier or original source import; it is NOT a relabeled D1S4 theorem and will NOT be promoted to physical self-adjointness. Only after that small interface independently qualifies may a separate explicitly typed source adapter be considered. No new claim for unbounded Hamiltonian, physical SmoothCore, spectrum, Hopfion or GUT.
