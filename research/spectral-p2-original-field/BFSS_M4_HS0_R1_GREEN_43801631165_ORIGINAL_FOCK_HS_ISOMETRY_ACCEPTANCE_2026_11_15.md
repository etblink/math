# BFSS M4-HS0 R1 — original Spin(9) Fock Hilbert–Schmidt fiber strict GREEN

**Date:** 2026-11-15 Pacific, source GitHub run completed 2026-11-16 UTC.  
**Active branch:** `integration/bfss-unified-research-20261108`, owner-directed single working branch; NO separate research branch / `main` change.  
**Acceptance:** `M4_HS0_ORIGINAL_FOCK_OPERATOR_HS_FIBER_ISOMETRY_QUALIFIED`; this is **not** `ORIGINAL_FOCK_VECTOR_SPIN9_UNITARY_QUALIFIED`, physical singlet, original supercharge covariance, invariant domain, or spectral result.

## Exact tested immutable qualification

- [Strict R1 #43801631165](https://github.com/etblink/math/actions/runs/43801631165), `completed/success`, attempt 1, exact tested commit **`e9c02b1eb5ff0aaf4b90be66abf761d5a5db117f`**.
- Job `133083018245`; all seven substantive steps (checkout, pin preflight, pinned toolchain/cache restore, cold source/independent consumer, evidence upload) PASS.
- Lean **4.34.1**, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold native source **9,179 jobs**, `Build completed successfully`. Exact source/consumer/donor and toolchain preflight `BFSS_M4_HS0_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`.
- New original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4HS0OriginalSpin9FockHSIsometry.lean` tested blob **`780850642b475c53a91fb4c5dd91c3c6f46a1839`**. New independent diagnostic `lean/diagnostics/BFSSP3M4HS0OriginalSpin9FockHSIsometryIndependentConsumer.lean` blob **`327c0c30b9df1f102c97f4ca6695782dc618d2c6`**; workflow blob `c8c86b8999c5d9e5930f86aeb8298dd507fd1c8f`.
- Frozen exact donor blobs: `P2bB3OriginalFockStarAutomorphismAction.lean` `b50ef04695587b267ad8519074b1293f98828749`, `P3OP1AOriginalFockTracePairing.lean` `b79f4230dc03670f4b3fffc425a0cc283688a7c6`, `P3M2AOriginalFockHSFiber.lean` `89543ae62bc971303cbb15d3a0c3207e114d57fa`.
- **5 original source + 3 independent native consumers** freshly compiled and printed 8 restricted-axiom reports; all belong to `{propext, Classical.choice, Quot.sound}`, zero `sorryAx`, zero compiler `error:` in strict audit; marker `BFSS_M4_HS0_ORIGINAL_FOCK_HS_ISOMETRY_5_SOURCE_3_CONSUMERS_STRICT_GREEN`.
- [Evidence artifact #14197640557](https://github.com/etblink/math/actions/runs/43801631165/artifacts/14197640557), ZIP size 17,437 bytes; GitHub-reported SHA-256 `d1cd1578cd5863b2b7ac7e3aa0c34dbe6264cb3ff605e008e24e2e1bd6863298`. This is GitHub's uploaded artifact digest, not a separately recomputed local file checksum.
- This receipt and associated forward-research memo are **documentation-only descendants** of the qualified commit. Exact tested source and consumer Git blobs remain identical on the active unified branch; this is not a claim of a fresh full-tree strict gate at later documentation commits.

## Qualified mathematical content: operator space, not Fock-vector space

Let the actual original finite Fock space be `Fermion 2` and `OriginalFockHSFiber ι := PiLp 2 (fun _ : ι => Fermion 2)`, associated to an actual original Fock orthonormal basis `b`. The original continuous-linear operator carrier still uses its operator norm; M2A supplies the exact, separately normed Hilbert–Schmidt column equivalence.

The accepted source has five declarations:
1. `originalSpin9FockHSFiberLinearEquiv` — conjugate exact B3 physical-star Fock-operator algebra action through actual M2A columns;
2. `originalSpin9FockHSFiberLinearEquiv_toOperator` — reconstruct **the exact** source B3 operator, not a changed representation;
3. `originalSpin9FockHSFiber_inner_invariant` — genuine original Hilbert–Schmidt inner product preserved using accepted OP1A source trace pairing;
4. `originalSpin9FockHSFiberIsometry` — genuine complex-linear isometry on the **separate** source HS column carrier;
5. `originalSpin9FockHSFiberIsometry_apply` — isometry evaluates to the exact transported original operator action.

Independent consumer asserts three distinct source-typed results:
- `sourceSpin9HS_preserves_pairing`,
- `sourceSpin9HS_preserves_norm`,
- `sourceSpin9HS_recovers_source_operator`.

No substitute Fock module or operator-norm-to-HS instance was introduced. This gives an isometry **for each** source Spin9 group element, but this package has **not** yet constructed a continuous group-hom into the full Hilbert-space linear-isometry-equivalence group or a true physical `Fermion 2` implementing unitary.

## Forward research, falsifiers, and next bounded decision

[Source-audited next routes](BFSS_M4_SPIN9_COHERENT_FOCK_LIFT_FORWARD_RESEARCH_2026_11_15.md) record:
- **HS1 small next test:** use the accepted B3 `MonoidHom` and the HS0 inner-preserving equivalence to package a genuine group hom `spinGroup source9Quadratic →* (OriginalFockHSFiber ι ≃ₗᵢ[ℂ] OriginalFockHSFiber ι)` with source operator recovery and explicit group law. Avoid claiming a Fock-vector unitary; the identity operator gives an HS operator singlet, not a physical singlet.
- **Central negative sign:** original source F10T/U/V constructs the actual nontrivial central Spin9 element and proves its 48-real action is `-I₄₈`. Test native Fock Majorana sign `α(-1)(Γ(v))=-Γ(v)`; this is a falsifier of any future scalar/identity physical unitary implementation.
- **Infinitesimal bivector shortcut:** on the original sqrt2-normalized 48 Majoranas `c_p`, test `K(A)=(1/4) ∑_{p,q} A_{pq}c_pc_q` for skew source matrices, `[K(A),c_k]=∑_p A_{pk}c_p` and skew-adjointness. The 1/4 coefficient and signs passed an independent 4×4 CAR numerical sanity check, **not** Lean.
- **Expensive full Fock-vector lift:** global Spin9→Spin48 source continuous covering/lift plus even Clifford Fock unitary, exact source orientation/central sign and eventual combined bosonic pullback. Mathlib has generic covering-lift material, but source Spin9 topology, original SO48 covering, coherence and physical domain are not yet pinned.
- Compare the bottom-up source individual-charge square-difference method before making a global Fock-vector group lift a mandatory prerequisite to any physical energy calculation.

**Stop rule:** Source HS0 green is mathematically significant but does not prove source-invariant unbounded charge domains, Spin9-singlet Fock-vector states, physical Q(w) covariance, Hardy/fidelity inequalities, a mass gap, or a GUT/ToE interpretation. Continue on the **same unified integration branch**; preserve all red first-causal evidence before any repair.
