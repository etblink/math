# RHOPF-P9C1C0 R2 — original coordinate rank-saturation strict GREEN qualification

**Date:** 2026-11-19 (UTC / US Pacific).
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original CI:** [#44531869219](https://github.com/etblink/math/actions/runs/44531869219), success attempt 1.
**Exact tested commit:** `a66e3e5ccd665f73c9442af56f15c8c946ef6aa7`.
**Decision:** ACCEPT P9C1C0 R2 **at the exact four conditional/index declarations**, NOT the still-unproved original indexed basis witness.

## Source-exact evidence

1. Frozen original Core, original gamma `SU2RealGammaProbe.lean`, P9A0, F10AN, F10AE, original P9C0/P9C1A/P9C1B0/P9C1B1 accepted modules, exact new source and independent audit hashes: PASS.
2. Pinned Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. Accepted original source dependencies built PASS.
3. Original native source and independent typed consumer compiled with warning as error PASS.
4. All **four original native** plus **four independent imported** axiom reports list only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx` or Lean errors. Independent original gamma signed-permutation fixture consumer PASS.
5. Downloaded original [artifact #14535621103](https://github.com/etblink/math/actions/runs/44531869219/artifacts/14535621103), ZIP SHA-256 `5426495691152dbd2d402e8397a526e06123d7e3be524069cd3e765380f6da2d`, equal to GitHub digest. Inside `exact-tested-commit.txt` matches exact tested commit. `native-coordinate-rank-bridge-and-axioms.log` and `independent-lean-types-and-axioms.log` each contain four reports with no sorryAx.

## Precisely qualified results

The original SpinIndex labels `[0,1,8,9]` selected by `selectedIndex` are injective; `selectedCoordinatePlane` is the real span of those four original coordinate basis vectors in `SpinIndex → ℝ`. Native source proved:
- `selectedIndex_injective`.
- `selectedCoordinatePlane_finrank_four` : `Module.finrank ℝ selectedCoordinatePlane = 4`.
- `selectedCoordinatePlane_le_projector_range` under `SelectedBasisFixed`.
- `selectedCoordinatePlane_eq_projector_range_of_fixed` under `SelectedBasisFixed`.

`SelectedBasisFixed` means original projector `P` fixes four source-selected standard basis vectors. The antecedent has NOT been proved by this gate. This is a rank-saturation bridge: if each basis vector is fixed, their span (dim4) equals the range of the already accepted rank4 original projector.

## Negative knowledge / open obligations

R1 [#44528603322](https://github.com/etblink/math/actions/runs/44528603322) remains RED because Lean `whnf` exceeded 200000 heartbeats while implicitly elaborating the reindexed basis independence statement. R2 explicitly separates `basisFamily`, `hbase`, `hcomp`, `hspan`; it does NOT raise resources or change any theorem statement.

P9A1B original row approaches R1 (huge matrix normalization), R2 (private `import all`), D0 (kernel `rfl` on two concrete cells) all remain RED; do not repeat blindly. The source-exact equality `im(P) = span(e0,e1,e8,e9)` is still NOT Lean-qualified: it requires an independent native proof that `Pe_i=e_i` at those four source indices. This may be modularized via common-generator equalizers, source-gamma sparse row/column certificates and well-tested polynomial projector algebra.

A four-dimensional original spinor carrier does not itself prove a physical Hopfion, physical Fock group implementation, Hamiltonian protection, conserved charge, unique physical sector or Standard Model prediction. No original Core, gamma source, Hamiltonian or Fock implementation changed.
