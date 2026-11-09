# BFSS OP3-C5A — Original complex Clifford base-change action and generator covariance

**Date:** 2026-11-09
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent:** `b32cb68ba09e27488605261dd625686970fd910b`
**OP3-C4 status:** Independently STRICT QUALIFIED.
**OP3-C5A status:** CANDIDATE until new exact cold gate completes.
**Lean/Mathlib:** 4.34.1 / `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. OP3-C4 receipt and accepted source scope

[Strict Run #42709755735](https://github.com/etblink/math/actions/runs/42709755735) completed **SUCCESS** on exact commit `b32cb68ba09e27488605261dd625686970fd910b`, attempt 1, job `129475850974`. It passed 19 original-source Git blob pins, pinned toolchain restore, complete cold OP3-B1/C0–C4 build, typed independent consumer and the exact three root source-and-consumer axiom checks. Only `propext`, `Classical.choice`, `Quot.sound` were reported. Final marker `OP3C4_ORIGINAL_REAL_CLIFFORD_SPIN_ACTION_INDEPENDENT_STRICT_PASS`. [Artifact #13714789077](https://github.com/etblink/math/actions/runs/42709755735/artifacts/13714789077), GitHub-reported ZIP SHA256 `f7929dd39be7a1e62722ed5b337760a18593aed44a8ccb31488540a60c15dd57` (not independently downloaded).

Accepted roots in `FCP.BFSSOP3C4OriginalRealCliffordSpinAction`:
- `source9Spin_originalRealCliffordAutomorphismHom`: actual `spinGroup source9Quadratic →* (CliffordAlgebra source48Quadratic ≃ₐ[ℝ] CliffordAlgebra source48Quadratic)`.
- `source9Spin_originalRealCliffordAutomorphismHom_apply`: the group-valued action is exactly the accepted OP3-C3 `AlgEquiv`.
- `source9Spin_originalRealCliffordAutomorphismHom_generator`: original paired-48 generator covariance on all `Source48Vector`.

This is **algebraic real Clifford automorphism** evidence, not physical Fock star/continuity/gauge/source-Hamiltonian evidence.

## 2. Pinned Mathlib API audit and proposed minimal proof

The exact pinned Mathlib files `Mathlib/LinearAlgebra/CliffordAlgebra/BaseChange.lean` and `Mathlib/RingTheory/TensorProduct/Maps.lean` expose:
- `CliffordAlgebra.equivBaseChange ℂ Q`, `CliffordAlgebra.toBaseChange_ι`, `CliffordAlgebra.ofBaseChange_tmul_ι`.
- `Algebra.TensorProduct.congr`, `congr_apply`, `map_tmul`, `congr_refl` and `congr_trans`.

Write `E := CliffordAlgebra.equivBaseChange ℂ source48Quadratic` and `Φ_g := source9Spin_originalRealCliffordAutomorphismHom g`. The proposed complex Clifford equivalence is

`Ψ_g := E.trans ((Algebra.TensorProduct.congr (AlgEquiv.refl : ℂ ≃ₐ[ℂ] ℂ) Φ_g).trans E.symm)`.

This is a pointwise automorphism on `CliffordAlgebra (source48Quadratic.baseChange ℂ)`, not yet a complex group-valued MonoidHom. The exact generator theorem computes `Ψ_g (ι (1 ⊗ₜ[ℝ] v)) = ι (1 ⊗ₜ[ℝ] R₄₈(g).mulVec v)`, with actual original `Source48Label`, original source group and no surrogate representation.

The generator proof reduces by the **three inspected tensor/base-change APIs** and the accepted real OP3-C4 generator covariance. Direct finite Fock coefficient expansion, an unnecessary real quadratic `IsometryEquiv` wrapper, and recursion/heartbeat inflation are explicitly forbidden.

## 3. Qualification gate, troubleshooting, and next decisions

Add a dedicated push-triggered workflow freezing **21 exact original-source and independent-consumer Git blob pins** plus Lean/Mathlib. The new source imports the accepted OP3-C4 and two pinned Mathlib modules; the independent consumer imports only the C5-A source. Cold compile B1/C0–C5A with explicit source and independent typed consumer commands. In both source and consumer independently require the **same two declaration-root** reports with axioms restricted to `propext`, `Classical.choice`, `Quot.sound`. Reject `sorryAx`, missing/extra roots, compiler errors, unexpected source warnings, unpinned ancestry changes and proof-budget alterations. Retain exact logs and scope receipt.

**GREEN:** accept only pointwise original complex Clifford AlgEquiv and generator covariance. Next gate C5-B: package a global group homomorphism using `congr_refl`, `congr_trans` and OP3-C4. Then C6-A transports the complex action through already strict-qualified **M3I** original complex Clifford/Fock `AlgEquiv`; C6-B binds the normalized generator axes using accepted OP3-A2, including `√2`. All are distinct strict steps.

**RED:** inspect the first exact compiler/preflight failure. Base-change definitional shape or complex scalar coercions require small typed rewrites only, never a different Clifford carrier, replacement form or new assumptions. Preserve red diagnostics and stop if repeating a root-cause pattern.

**Physical stop conditions:** Mathlib's default Clifford star negates odd generators, while original physical normalized Majoranas are self-adjoint; therefore no automatic Fock-adjoint `StarAlgEquiv` claim. The original negative center acts nontrivially on 48 labels; identifying its Fock image with parity conjugation, continuity, SU(2) gauge commutation, original physical smooth-core/form domains, coercivity, positive eigenvalues or a mass gap requires separate proofs. The operator fiber weight bound is `M=12`, not vector `M=6`.

## First OP3-C5A RED — explicit transported equality repair (2026-11-09)

- **Failed strict gate:** [#42712236812](https://github.com/etblink/math/actions/runs/42712236812), attempt 1, tested exact commit `8827c27862987d4f3d168fa82666b34eb53a3f58`, job `129484519493`; conclusion FAILURE. Artifact [#13717241354](https://github.com/etblink/math/actions/runs/42712236812/artifacts/13717241354), GitHub-reported archive SHA256 `ca22083373c1c70cbfb4fcdb90c46a206ff9198cbdc2c2cc270a2f0b757fce80` (not independently downloaded).
- **Passed:** all 21 exact source/consumer Git blob pins, Lean 4.34.1/Mathlib restoration, and original C0–C4 cold ancestry compilation. The new pointwise complex Clifford `AlgEquiv` definition compiled with only the permitted axioms.
- **First causal compiler diagnostic:** `OP3C5AOriginalComplexCliffordBaseChange.lean:70:6`: the rewrite tactic did not recognize the original real Clifford automorphism application beneath the `Algebra.TensorProduct.congr`-expanded tensor and function/AlgEquiv coercion. The goal had the explicit form `CliffordAlgebra.ofBaseChange ℂ Q (1 ⊗ₜ[ℝ] ↑(source9Spin_originalRealCliffordAutomorphismHom g) (CliffordAlgebra.ι Q v)) = CliffordAlgebra.ι (Q.baseChange ℂ) (1 ⊗ₜ[ℝ] (R_g.mulVec v))`. The candidate generator theorem therefore printed `sorryAx` because compilation failed; **it is not accepted**. The independent consumer and final axiom gate did not run.
- **Single bounded repair:** preserve the exact two theorem declarations, accepted C4 and all earlier source files, original 48-label data, tensor/base-change construction and toolchain. Replace only the failed `rw [source9Spin_originalRealCliffordAutomorphismHom_generator]` with an explicit `congrArg` that applies the genuine C4 generator identity under the functorial context `fun x => CliffordAlgebra.ofBaseChange ℂ Q (1 ⊗ₜ[ℝ] x)`; compose it with the pinned `CliffordAlgebra.ofBaseChange_tmul_ι` equality. No recursive unfolding, new assumptions, budget increases or weaker axiom checks. Recompute only the new source blob pin.
- **Decision:** the revised source and independent consumer remain CANDIDATE until a separate exact-commit cold gate passes. If the elaborator again rejects the same equality, stop and audit the explicit coercion/type boundary rather than repeatedly trying new tactics.
