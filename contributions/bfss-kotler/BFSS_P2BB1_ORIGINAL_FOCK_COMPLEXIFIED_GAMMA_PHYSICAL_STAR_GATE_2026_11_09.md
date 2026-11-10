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
