# BFSS CT1-G0 R2 — opaque original Fock Jacobi source adapter

Date: 2026-11-16 Pacific. Branch `integration/bfss-unified-research-20261108`.

**PENDING / UNQUALIFIED.** R1 [strict RED #43988822460](https://github.com/etblink/math/actions/runs/43988822460) at exact tested `a04d3240b8e1649ca058772af7a98f73095a177c` passed preflight and original pinned Lean 4.34.1 / Mathlib restoration, then failed cold source theorem elaboration at original line 53, `maximum recursion depth has been reached`. R1 generic Jacobi/sub outputs had only standard axioms, but third native theorem and independent consumer never qualified.

**Original R1 evidence is complete and immutable:** [R1 RED receipt](BFSS_M4_CT1G0_R1_RED_43988822460_RECURSIVE_NATIVE_ADAPTER_2026_11_16.md), provider artifact `14287816678`, 17,654 bytes, ZIP SHA-256 `c03e06d90de7d0a7e946a55d27f5bd2c2d7e03981355d80ad512ff8dbe61d75e`; original binary Git blob `3af05171c5865f120bd1b93fd99c7be37ba52acb`, complete original job log `064789d736abc1c79f8ffbc6de83c842da309d52`, independent [rehash GREEN #43991194687](https://github.com/etblink/math/actions/runs/43991194687) with full log/manifest. R1 unchanged and recoverable.

## R2 bounded architectural change

Do **not** increase Lean recursion, memory or heartbeat limits. R2 leaves the two qualified generic candidate source lemma bodies unchanged and introduces a small typed Fock operator bracket:

```lean
def originalFock_comm (T S : Op) : Op := T * S - S * T
```

The third theorem's **same mathematical Jacobi assertion**, binding literal original `K(A)`, `K(B)`, and `sourceNormalizedGamma k`, is now expressed with `originalFock_comm` applications rather than 48 repeated huge native Fock products. Its proof remains precisely the already-clean `originalFock_commutator_jacobi` on the original noncommutative Fock carrier. The consumer now restates this abbreviated native theorem and keeps the four controls: arbitrary noncommutative original Fock subtraction, zero Jacobi input, original same-source-index `[K(A),K(A)]=0`, and a concrete distinct paired 48-label coordinate. No source K, Clifford gamma, 1/4 coefficient, donor, Mathlib/toolchain or accepted theorem changed.

## Frozen R2 stage inputs

- Revised source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean`, blob `df368f58b722ec8cd33a5e8656700cbe06badbe6`.
- Revised independent consumer `lean/diagnostics/BFSSP3M4CT1G0OriginalFockJacobiIndependentConsumer.lean`, blob `299475618bdf1b0e6a43326c51f15640fa58c397`.
- Strict workflow `.github/workflows/bfss-m4-ct1g0-original-fock-jacobi-strict.yml`, blob `072516db95e9d09b1aa7555173660104653c0c9c`; exact nine source/consumer/donor/environment pins remain checked; R2 preflight confirms original R1 ZIP hash and causal log.
- `BFSS_GATE_STATE.json` R2 `PENDING_STRICT_CI`, with full original R1 run/tested SHA/digest and byte evidence, last-qualified `P3-M4-CT0 R2 GREEN #43983772199`.
- Expected strict: original source 3 axiom reports, 3 independent consumer reports, 4 native controls, six auditor negative controls, full cold source compile under unchanged bounds, separate original ZIP preservation. All allowed axioms `propext`, `Classical.choice`, `Quot.sound`. Nothing in the source claims G1 contraction or defect-zero.

If R2 repeats the SAME native recursion failure, stop CT1-G0 and perform an architecture review; fallback P1 direct four-Majorana algebra and Gauss energy comparison stay live. The M4 full bivector bracket, physical Spin9/gauge domains, auxiliary Hardy, original fixed-regulator fidelity and ground state are all still unqualified. Edition 0.8 is a dated snapshot and `main` untouched.
