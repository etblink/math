# RHOPF-P9C3D2G1D19 — source original polarized Q preservation under J4 intake

**Pacific date:** 2026-11-20. **Branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until native source, imported independent consumer strict GREEN and original evidence ZIP checksum verified.

D18 [run #44819128759](https://github.com/etblink/math/actions/runs/44819128759) qualified the exact original source projector-range/Q-unit homeomorphism's Circle equivariance at `0ef355db5e39c25d5d126d8740af954d11cc4942`; independently verified original ZIP SHA-256 `4719cd2b9065e4c88763648de135ab50c6e0abc2d93e5e4a6f70fa33a2143d91`; accepted in `7a93b19184d927a98763ae72082de2d94dc6dc64`.

## Source-exact bounded target

D10's original Gamma9 `relationalPhaseJFourLinear` is a real-linear endomorphism of `Fin 4 → ℝ` with `J4²=-I`. D11 separately proved `Q(J4 x)=Q(x)`, where `Q` is **the original source 16-spinor Euclidean norm transported** by G1C0's noncanonical real-linear `E`, not ordinary coordinate R4 Euclidean dot.

D19 introduces a polarization candidate (NOT yet asserted as an inner product):
```lean
noncomputable def relationalSourcePolarQuadratic
    (x y : Fin 4 → ℝ) : ℝ :=
  (relationalRangeCoordinateDotSelf (x+y) -
   relationalRangeCoordinateDotSelf x -
   relationalRangeCoordinateDotSelf y) / 2
```
and proves from accepted D11 Q-preservation and D10 linearity:
```lean
theorem relationalSourcePolarQuadratic_J4_invariant (x y : Fin 4 → ℝ) :
    relationalSourcePolarQuadratic (relationalPhaseJFourLinear x)
      (relationalPhaseJFourLinear y) =
        relationalSourcePolarQuadratic x y
```
The proof must operate on *the exact original J4 and Q declarations*; no synthetic matrices or preselected complex basis. Independently import and check both declarations, two native and two independent `#print axioms` reports with only `propext`, `Classical.choice`, `Quot.sound` permitted, no `sorryAx` or compilation errors. Preserve original source hash contract, original integer fixture, pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, archived original RED/GREEN CI results. Do not change `main` or Gamma9.

**Strictly not claimed by D19:** B_Q is bilinear or definite (despite its mathematical definition); a complex Hermitian inner product, complex-two orthonormal basis or source-to-standard scalar `Circle` equivariant isometry; Hopf quotient, first Chern/charge; BFSS Fock/Gauss/Hamiltonian or stable physical hopfion. Subsequent gates can prove B_Q equals the transported native dot-product via explicit dot bilinearity, then use finite-dimensional complex isometry machinery to construct the original-source-compatible frame without assuming E is standard Euclidean isometric.
