# RHOPF-P9C3D2G1D12 — source Circle formula using original phase J on im(P)

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until strict source-native and imported consumer GREEN plus independent evidence verification.

D11 [run #44788869110](https://github.com/etblink/math/actions/runs/44788869110), exact tested `9344798af0bd2863bad10c0cc00fff02ccf478af`, qualified the original spinor and transported-Q phase metric preservation. Original evidence ZIP SHA-256 `7e8ed57ce89bfafd01830f909071f3df689d04d404fe7f869ad08ff470361357` was recomputed from the ZIP; acceptance preserved at commit `49d0493f1810dae513c74ae2156ecb59e59c00d0`.

## D12 bounded source-exact target

The accepted original `RHOPFP9C3D0` defines `relationalCircleMatrix z = relationalCirclePhase (z : ℂ).re (z : ℂ).im`, `RHOPFP9C3D2A` defines `relationalCircleVector z v` as this matrix acting on an original real 16-spinor vector, and `RHOPFP9C3D2D` proves `relationalCirclePhase a b` acts as `a • v + b • J.mulVec v` when `P.mulVec v=v`.

D12 tests that those accepted formulas agree without new original-source coordinate matrix expansions:

```lean
theorem relationalCircleVector_phase_on_projector_image
    (z : Circle) (v : SpinIndex → ℝ)
    (hv : relationalProjector.mulVec v = v) :
    relationalCircleVector z v =
      (z : ℂ).re • v + (z : ℂ).im • relationalPhaseJ.mulVec v

theorem relationalCircleVector_phase_on_projector_range
    (z : Circle)
    (v : LinearMap.range (Matrix.toLin' relationalProjector)) :
    relationalCircleVector z v.1 =
      (z : ℂ).re • v.1 +
        (z : ℂ).im • (relationalPhaseJRangeLinear v).1
```

Native compilation and independent imported consumer must qualify both theorem statements and all four axiom reports must contain only `propext`, `Classical.choice`, `Quot.sound`, without `sorryAx`. Continue frozen original Gamma9, accepted P/J, Circle, G1C0 and D11 blob pins, independent source integer fixture, Lean 4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, warnings-as-errors and original archive integrity.

Next bounded objective, **if** D12 qualifies, is to transfer the actual Circle action formula into the exact noncanonical real-four coordinate system using `E` and D10 `J₄`, before searching for a complex orthonormal basis and proving an actual Hopf-equivariance theorem.

No action on `main`, original source edits, new axioms, Hopf quotient/Chern class, physical 48-Majorana Fock or Hamiltonian/soliton claim.
