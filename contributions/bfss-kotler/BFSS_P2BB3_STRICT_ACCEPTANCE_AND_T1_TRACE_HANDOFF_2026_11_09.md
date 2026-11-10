# BFSS — P2b-B3 accepted original Fock star-action and T1 trace handoff

**Research date:** 2026-11-09 (America/Los_Angeles; CI events UTC 2026-11-10)  
**Repository / branch:** `etblink/math` / `integration/bfss-unified-research-20261108`  
**Evidence convention:** a source or consumer commit is not acceptance; only the exact tested commit plus green cold build, independent consumer, allowed-axiom audit and pinned dependency closure qualifies a theorem.

## 1. B3 strict acceptance

B2 was strictly accepted in [run #42759465245](https://github.com/etblink/math/actions/runs/42759465245) on tested commit `f21db5d7fdf36b8ee07c230787af8691859956a9`. It provides the global Hilbert-adjoint intertwining on the literal original 24-complex-mode `Fermion 2 →L[ℂ] Fermion 2` algebra, not on the default Clifford odd-generator star.

B3 upgrades the accepted C6A algebra action to:
- `source9Spin_originalFockOperatorStarAlgEquiv`, original pointwise `StarAlgEquiv` via pinned `StarAlgEquiv.ofAlgEquiv`;
- `source9Spin_originalFockOperatorStarAlgEquiv_apply`, agreement with the accepted original C6A action;
- `source9Spin_originalFockOperatorStarAutomorphismHom`, genuine original source `spinGroup source9Quadratic →* (Fermion 2 →L[ℂ] Fermion 2 ≃⋆ₐ[ℂ] Fermion 2 →L[ℂ] Fermion 2)` group action.

The B3 candidate source was committed at [`524202f6`](https://github.com/etblink/math/commit/524202f6cdd16a7023186c40c28707bdafe51bb3) and the independent consumer at [`9074b46a`](https://github.com/etblink/math/commit/9074b46a5bc605b77353da2ce32deb802655f674).

**First RED:** [run #42762309173](https://github.com/etblink/math/actions/runs/42762309173), exact tested commit `fbb2ceea8d89c1c3bcb9ef5995152552eef4aeea`. The 53 exact blob pins and B3 source compilation passed; the independent consumer triggered a `StarHomClass` typeclass-synthesis heartbeat timeout when calling generic `map_star` at its lines 32 and 53. This red was proof-elaboration pressure, *not a disproof of the source mathematical theorem*. The incomplete consumer reported `sorryAx` as expected when its elaboration failed, so that failed consumer was never accepted.

**Bounded repair:** [commit `ac7438a9`](https://github.com/etblink/math/commit/ac7438a9ae069db323863562c5462f3c59753a22) changed only the independent consumer and matching manifest blob pin. It replaced generic star-class synthesis with the exact already-accepted B2 typed original-Fock adjoint theorem. No B3 source, previous accepted parent blob, axiom limit, Lean/Mathlib pin, or resource ceiling changed.

**Accepted GREEN:** [run #42764649026](https://github.com/etblink/math/actions/runs/42764649026) on exact tested commit `ac7438a9ae069db323863562c5462f3c59753a22`. Final log marker:
`P2BB3_ORIGINAL_FOCK_STAR_AUTOMORPHISM_INDEPENDENT_STRICT_PASS`.

The job passed 53/53 source/consumer Git blob pins, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold compilation, typed independent consumer, strict warnings and `#print axioms` reports (allowed `propext`, `Classical.choice`, `Quot.sound`). Retained artifact [#13739787874](https://github.com/etblink/math/actions/runs/42764649026/artifacts/13739787874) reported SHA-256 `e96140d1a28a271361c20fd1e58fb9e288d8f46fd375a187f141ad5a1c8712d5`.

**Scientific boundary:** B3 is a strict algebraic star-action qualification. It does not certify source-parameter continuity, an actual Fock-vector implementing unitary family, original SU(2) gauge fixedness or projector covariance, Hilbert-Schmidt trace invariance, closed original Hamiltonian domain comparison, or any BFSS spectral claim.

## 2. T1 source-exact trace candidate (NOT accepted yet)

The next bounded objective is the ordinary complex operator trace invariance on the same literal original Fock carrier:

`originalFockTrace (α_g T) = originalFockTrace T`.

Pinned Mathlib provides:
1. `Module.End.toContinuousLinearMap (Fermion 2)` in `Mathlib/Topology/Algebra/Module/FiniteDimension.lean` lines 314–320, an algebra equivalence between the actual original Fock linear endomorphism algebra and its bounded/continuous counterpart.
2. `LinearMap.trace_map` in `Mathlib/LinearAlgebra/Trace.lean` lines 307–311, which proves trace invariance under any algebra equivalence of exact linear endomorphism carriers.

There is no substitute finite matrix module and no basis enumeration of `2^24` Fock vectors or `2^48` operators. T1 transports the qualified B3 action to the original `Module.End ℂ (Fermion 2)` using the exact `AlgEquiv` composition `(e.trans α_g.toAlgEquiv).trans e.symm`, applies `LinearMap.trace_map`, and translates back.

- T1 source commit [`dfce3538`](https://github.com/etblink/math/commit/dfce35380223d3fce0f63ef020b8d98b61f462db).
- T1 independent consumer commit [`f3fec57f`](https://github.com/etblink/math/commit/f3fec57f5a570650b809d5d7dc653ad2a6a45ae7). It additionally checks the ordinary finite-dimensional trace pairing `Tr_F((α_g S)† (α_g T)) = Tr_F(S† T)`, using exact B2 star and B3 multiplicativity.
- T1 strict workflow commit [`9d4280a1`](https://github.com/etblink/math/commit/9d4280a17388f540a1def6e13bac05f549bc6273). Closure is 55 Git blob pins: all 53 accepted B3 source/consumer predecessors, plus the source/consumer T1 candidate, with identical toolchain, warning, axiom and resource discipline.
- Candidate CI: [run #42767247872](https://github.com/etblink/math/actions/runs/42767247872), **IN PROGRESS at handoff** at tested commit `9d4280a17388f540a1def6e13bac05f549bc6273`. No T1 mathematical acceptance is recorded here.

## 3. Bounded next decision and lessons

If T1 turns red, inspect the **first causal** error. Prefer exact Lean type annotations and the already pinned `AlgEquiv` and trace APIs over recursion-limit increases, a new matrix coordinate model, or an unqualified Skolem–Noether theorem. Do not touch green B2/B3 ancestors to work around a new consumer.

If T1 turns green, record exact run, tested commit, artifact digest, source/consumer axiom reports and acceptance scope. The resulting finite-dimensional trace pairing is useful for a source-exact Hilbert–Schmidt operator-fiber isometry, but it does **not** automatically establish continuity in source `g`, SU(2) gauge-operator fixedness, physical smooth-core and form-domain invariance, original closed Hamiltonian covariance, coercivity, compact resolvent, eigenpairs or a mass gap.

Further research should branch into separately qualified source-continuity and original gauge-compatibility/projector routes, with negative-center parity tests as adversarial sign controls. Keep original operator-fiber weight target `M=12` distinct from the Fock-vector `M=6` estimate and treat both as conditional until source-exact proofs.

**Method lesson:** A global proof succeeded by aggregating qualified small original-carrier lemmas; a subsequent typeclass-search red was repaired in the consumer by applying the existing typed theorem. Preserve this pattern and the negative evidence. The source of truth remains Git objects and exact strict CI receipts.
