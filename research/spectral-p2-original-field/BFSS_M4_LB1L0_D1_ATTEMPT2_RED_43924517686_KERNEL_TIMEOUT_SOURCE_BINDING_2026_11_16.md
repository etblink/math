# BFSS M4-LB1L0 D1 — attempt 2 strict diagnostic RED: source-binding kernel timeout

**Date:** 2026-11-16 Pacific. **Canonical owner branch:** `integration/bfss-unified-research-20261108` exclusively. **Status:** verified D1 proof diagnostic **RED**; generic associative lemma qualified locally, but original Source48 product theorem **NOT qualified**. This records scientific negative evidence, distinct from the preceding *operational* D1 preflight REDs.

## Exact frozen evidence

- [D1 workflow #43924517686](https://github.com/etblink/math/actions/runs/43924517686), **attempt 2**, `completed/failure` at exact tested Git commit **`0795d3eb0a2c8e4a4972a0bf0144a713e69fb385`**, job **`133528562419`**. Attempt 1 had an anomalously long checkout stall and no useful live logs; attempt 2 did reach and compile the native D1 diagnostic.
- Exact diagnostic `lean/diagnostics/BFSSP3M4LB1L0D1GeneralizedAtomNativeProductBridge.lean` original Git blob **`4f0358a84d3f79300d5ad077230878803fd200b1`**.
- Exact D1 workflow `.github/workflows/bfss-m4-lb1l0-d1-generalized-atom-native-product-diagnostic.yml` Git blob **`0434bda4e3290afecf083f23c28f423b8edf670e`**.
- [Immutable Actions artifact #14259428570](https://github.com/etblink/math/actions/runs/43924517686/artifacts/14259428570), size **3,107 bytes**, GitHub-reported archive SHA-256 **`6119554ded7065e232e4497bb14bd109211e002bfd5cc233b33c6930563c7601`** (provider-reported, not independently rehashed).
- Hash preflight `BFSS_M4_LB1L0_D1_GENERALIZED_ATOM_SOURCE_DONORS_TOOLCHAIN_PREFLIGHT_PASS` **PASS**; pinned accepted LB1C1/LB1C0/LB1S/LB0 exact donors PASS. Frozen Lean **4.34.1**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`** restored successfully; cold compilation of accepted LB1C1 donor PASS.
- **First causal error:** `diagnostics/BFSSP3M4LB1L0D1GeneralizedAtomNativeProductBridge.lean:45:8: error: (kernel) deterministic timeout` during strict independent D1 diagnostic Lean compilation. This is on the **whole source-specialized theorem declaration**, rather than a tactic line with a more precise causal stage. Do not falsely claim the checker identified a particular `rw`, `generalize` or `calc` as the cause.
- `originalFock_product_three_typed_atoms`: source diagnostic `#print axioms` prints **`[propext, Classical.choice, Quot.sound]`**. The failed native `source48_gamma_product_covariance_via_typed_atoms` printed `does not depend on any axioms` in a compilation that nonetheless **exited nonzero with a kernel timeout**. This is **not proof of accepted axiom-freedom or theorem existence**: successful kernel checking is prerequisite for qualification.
- The D1 strict success marker was **not** emitted. The original Fock full LB1L0 3+3 independent-consumer gate was never reached by this run. No global Spin9 or physical domain result.

## Failure sequence, all retained

1. **Full LB1L0 R1 #43916000648**: elaboration recursion when applying a generic Leibniz theorem to the actual native expanded `originalSource48BivectorK A`.
2. **Full LB1L0 R2 #43918477267**: kernel deterministic timeout on full native source `simp only [sub_mul, mul_sub, mul_assoc]; abel`; secondary unknown generated constant.
3. **D0 #43921140661**: `set T/X/Y : Op := ...` local aliases still led to elaboration recursion at native `calc` boundary.
4. **D1 earlier R1 #43923809697 and R2 #43923947361**: operational workflow filename and exact-pin preflight defects respectively; **not** mathematical diagnostics. Both repaired.
5. **D1 attempt 2 #43924517686**: preflight and toolchain clean, accepted donor builds, abstract theorem passes, original Source48 theorem **kernel timeout** at declaration line 45.

## Stop and repair architecture

**Stop rule invoked.** Do not increase `maxRecDepth`, `maxHeartbeats`, deterministic kernel budget, or rerun the unchanged D1 without new evidence. Do not weaken the strict warning-as-error / axiom policy. All accepted original source gamma+Fock donors and failed source / consumer files remain untouched.

Reframe the next method as a genuinely **separate reusable theorem module** for abstract opaque `Op = Fermion 2 →L[ℂ] Fermion 2`, finite labels `ι`, arbitrary `T X Y : Op`, and TWO **explicit covariance hypotheses** `T*X-X*T=U`, `T*Y-Y*T=V` with `U,V : Op`. Prove `[T,XY]=UY+XV` with no occurrence of `originalSource48BivectorK`, `sourceNormalizedGamma`, or `Source48Label` in the theorem, and qualify it separately if needed. That small algebra is mathematically routine; importantly, **it is not the missing native adapter**. For the adapter, inspect source-generated proof term / definitional reductions and avoid any calculation step that unfolds the original `K(A)` during elaboration or kernel checking. Investigate an **elementary skew-plane basis and finite linear extension** as an alternative to direct native Leibniz specialization.

A **minimal native boundary diagnostic** may be justified only after its exact expected expression, reductions and proof-checking cost are specified; do not launch a third full LB1L0 strict gate by simply swapping tactics. Any alternative requires exact original source+consumer strict qualification before promotion.

## Scientific scope

Accepted **LB1C1 #43901524171** remains immutable and STRICT GREEN: `[K(A),Γ_k] = ∑_p A[p,k] Γ_p` for skew real original 48×48 A, in genuine `Fermion 2`. The full `[K(A),K(B)]=K(AB-BA)` Lie bracket, original 39-generator Yukawa normalizer identification, group-level Spin9 Fock action, SU2 gauge+16 charge domain invariance and spectral claims are **OPEN**. Preserve earlier mathematical and operational RED receipts without overwrites.

**Documentation-only acceptance:** this record is a negative-results audit, not a new mathematical theorem.
