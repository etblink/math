# BFSS P2b-B1 — original complexified Fock gamma physical-star gate

**Prepared:** November 9, 2026 (America/Los_Angeles)  
**Branch:** `integration/bfss-unified-research-20261108`  
**Accepted exact parent:** P2b-A [#42736594947](https://github.com/etblink/math/actions/runs/42736594947) at `2e260bbeac70a8aa035b72bdbdda99db7984bb2b`  
**Candidate workflow:** [P2b-B1 #42743015078](https://github.com/etblink/math/actions/runs/42743015078), exact candidate source commit `d859b5236043d3521e7bd97f8f2862056a0a520e`  
**Status:** **CANDIDATE / RUN IN PROGRESS AT STAGING** — not mathematically accepted pending final strict source/consumer/axiom results.  
**Pins:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Exact objective

Extend accepted physical-adjoint compatibility from `sourceGammaRealLinear v` and `z • sourceGammaRealLinear v` to **every** original complexified Clifford generator under the exact source M3I equivalence:

```text
∀ (g : spinGroup source9Quadratic) (w : ℂ ⊗[ℝ] Source48Vector),
    α_g (star (M (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))) =
      star (α_g (M (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w)))
```

Here `M` is the accepted *original* `originalComplexCliffordFockAlgEquiv` and `α` is `source9Spin_originalFockOperatorAutomorphismHom` on the original `Fermion 2 →L[ℂ] Fermion 2`. `star` is physical Fock Hilbert adjoint, **not** the Clifford default odd generator involution.

### Two exact new roots

1. `originalComplexCliffordFockAlgEquiv_tmul_activeGamma`: for `z : ℂ` and `v : Source48Vector`, show `M(ι(z ⊗ₜ[ℝ] v)) = z • sourceGammaRealLinear v`. Use `TensorProduct.tmul_eq_smul_one_tmul`, the exact `CliffordAlgebra.ι` linear-map `map_smul`, the original `M.toLinearEquiv.map_smul`, accepted OP3-A2 source donor equality and C6C active crosswalk.
2. `source9Spin_originalFockOperator_complexifiedGamma_map_star`: apply accepted P2b-A to pure tensors, then `TensorProduct.inductionOn` (pure tensor and addition cases) to cover every `w` without enumerating 48-variable monomials.

### Independent verification surfaces

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB1OriginalFockComplexifiedGammaPhysicalStar.lean`.
- Independent typed consumer: `lean/diagnostics/BFSSP2bB1OriginalFockComplexifiedGammaIndependentAudit.lean`.
- CI: `.github/workflows/bfss-p2bb1-original-fock-complexified-gamma-physical-star-strict.yml`.
- The new workflow inherits all **43 exact P2b-A source/consumer Git blob pins** and adds only the two new source/consumer hashes, for **45 frozen blobs**. It checks exact import and theorem-root lists; fail-closed source/consumer Lean diagnostics; pinned cold Mathlib/toolchain and builds; independent consumer; only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or `Lean.ofReduceBool`. Evidence is uploaded even on failure.

## Causal repair rules

If the candidate runs red, examine the first causal diagnostic before any revision. Do not raise elaboration budgets, weaken the target, replace the physical adjoint, use default odd Clifford star, or rebuild a surrogate Fock model. Prefer explicit typed source linear maps and `M.toLinearEquiv.map_smul` over generic `map_smul` elaboration, following the [P2b-A first-red forensic record](BFSS_P2BA_ORIGINAL_FOCK_GAMMA_PHYSICAL_STAR_GATE_2026_11_09.md). Update only the changed candidate Git blob hash in the strict manifest after a mathematically neutral bounded repair; leave all qualified ancestors untouched.

**No promotion:** Passing B1 would establish only original complexified-generator star compatibility. It does **not** establish all-Fock-operator `StarAlgEquiv`, Hilbert–Schmidt unitarity, continuity, central parity, gauge compatibility, the original closed Hamiltonian domain, or any BFSS spectral claim.

**Next separate gate if B1 qualifies:** P2b-B2, applying pinned `CliffordAlgebra.induction` to M3I to promote star compatibility from all complex Clifford generators to the entire exact original Fock operator algebra. Independent trace-invariance API research may proceed without assuming B1 or B2.


## P2b-B1 first strict RED and bounded typed-add repair (2026-11-09 PT)

- [Original run #42743015078](https://github.com/etblink/math/actions/runs/42743015078), exact candidate `d859b5236043d3521e7bd97f8f2862056a0a520e`, job `129588428882`, completed **FAILURE**. Retained [artifact #13730821891](https://github.com/etblink/math/actions/runs/42743015078/artifacts/13730821891), GitHub-reported ZIP SHA-256 `779b2feb43e4e73815e6ebf2696bb82dd17734974c0f1c4c3f4328cc19b2ce12` (reported by GitHub, not independently downloaded).
- All **45 exact frozen original source/consumer Git blob pins PASSED preflight**. Original OP3/C6/P2b-A accepted ancestors compiled in the pinned Lean 4.34.1 / Mathlib closure, with their permitted foundational-axiom reports intact. The new P2b-B1 **first root** `originalComplexCliffordFockAlgEquiv_tmul_activeGamma` compiled and printed only `propext`, `Classical.choice`, `Quot.sound`.
- **First causal failure:** new source line 88 in the **addition** branch of `TensorProduct.inductionOn` used `simp only [map_add, star_add, ha, hb]`. The broad `map_add` rewrite on the coerced original Fock `AlgEquiv` attempted an unconstrained `AddHomClass` instance and exceeded **20,000 typeclass-synthesis heartbeats**. Lean therefore marked the **second** theorem with `sorryAx`; the independent consumer was not reached. The gate must remain **REJECTED/UNQUALIFIED**, notwithstanding the first successful theorem.
- **Repair commits:** [source `95cd9e1e`](https://github.com/etblink/math/commit/95cd9e1e4993d130b430647f4d3857ecdcd4675e) replaces just the generic addition tactic by exact original Clifford `ι.map_add`, source `M.toLinearEquiv.map_add`, original source Spin(9) `α_g.toLinearEquiv.map_add`, physical `star_add`, and the previously established tensor induction hypotheses. No target type, original `Fermion 2` carrier, `√2` normalization, accepted ancestor, consumer, or resource limit was altered. [Manifest `c53be7d6`](https://github.com/etblink/math/commit/c53be7d67f4c344ff47be21281485201304b6288) replaces **only** the candidate source blob pin `a155e724c56ae36506d47b033f8577e7c8174273` with `98324295fb9a6e2b51b9e3bdcc9c2ef105a6dd44`, preserving the other **44** pins and full strict acceptance contract.
- **Methodological lesson:** a broad coerced `map_add` on a heavyweight `AlgEquiv` repeats the previously diagnosed P2b-A generic `map_smul` instance-synthesis failure. Prefer exact `.toLinearEquiv.map_add` and explicitly typed original carrier, not arbitrary typeclass inference or increased `synthInstance.maxHeartbeats`. Class inference failure is not evidence that the physical-star theorem is mathematically false.
- **Status after repair staging:** New strict workflow must pass its frozen source/independent consumer cold compilation and exact two-root axiom audit before P2b-B1 is promoted; no P2b-B2, `StarAlgEquiv`, Hilbert–Schmidt or spectral result is claimed.


## P2b-B1 second strict RED: redundant physical-star rewrite (2026-11-09 PT)

- [Run #42745083570](https://github.com/etblink/math/actions/runs/42745083570), exact candidate `c53be7d67f4c344ff47be21281485201304b6288`, job `129595153467`, completed **FAILURE**. The preserved [diagnostic artifact #13731294223](https://github.com/etblink/math/actions/runs/42745083570/artifacts/13731294223) has GitHub-reported SHA-256 `ab7575e70d54d55bacec8454fde17f2cc49e348ca4d36ed5ddf3ff6168a89b3b`.
- Exact 45-blob preflight and pinned environment restoration passed; the previously blocked **typed** `CliffordAlgebra.ι.map_add`, `M.toLinearEquiv.map_add`, and `α_g.toLinearEquiv.map_add` declarations elaborated without the first run's typeclass timeout. The first pure-tensor bridge theorem again reported only `propext`, `Classical.choice`, `Quot.sound`.
- **First causal error:** line 106 of the P2b-B1 source: `rw [hGammaAdd, star_add, hAlphaAdd, hAlphaAdd, star_add]` failed to find `star (?r + ?s)` for the final repeated `star_add` rewrite. This was a **rewrite-order/normalization error**, not a failed theorem statement, source bridge, counterexample, or performance-budget limitation. The second theorem was thus unqualified and reported `sorryAx` due to the error.
- **Repair:** [`a2eca780`](https://github.com/etblink/math/commit/a2eca7806ad90618ee96a68a4a6c61542a6b4b19) changes only the final two tactic lines to `simpa only [hGammaAdd, star_add, hAlphaAdd] using (congrArg₂ (· + ·) ha hb)`, using exact previously typed lemmas with no duplicated rewrite. [Manifest commit `815f14d7`](https://github.com/etblink/math/commit/815f14d736cbf5f4ed0a37c76bb9a6f5b9ad86b8) updates only the candidate source Git blob from `98324295fb9a6e2b51b9e3bdcc9c2ef105a6dd44` to `269f14209d21b62b68daf77373cf55e69dd1063b`; all remaining **44 pins**, consumer and strict checks remain unchanged.
- **Status:** repaired candidate submitted to the same automatic strict gate, **NOT ACCEPTED until a new green exact source/consumer run**. Negative-knowledge lesson: don't repeat `star_add` after normalizing both sides; prefer deterministic typed `simp only` on a narrow additive equality once the original source interfaces are established.
