# RHOPF-P9C3D2G1D28 — original Gamma9 full complex J4 Hermitian equalities intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Disposition:** UNQUALIFIED until native and independent source-exact strict GREEN + original evidence ZIP.

D27 [run #44847059964](https://github.com/etblink/math/actions/runs/44847059964) at exact tested `70cfd69c9e8137e1ea19001162af463c4a868892` strictly qualifies original Gamma9 Hermitian/J4 four real and imaginary component identities. ZIP SHA-256 independently verified `d0f9e108100ff648c94de1a7807dd1e98d90a6e2b1a72ffa9e151b5cf197aca3`; acceptance commit `00af944f7a9fd3bdfd233453acd08a9487d9dcdc`.

## D28 bounded proof target

Source-original exact Hermitian H and J4, neither assumed ordinary Euclidean nor postulated:
```lean
relationalSourceHermitianCandidate_J4_left_mul_I
    (x y : Fin 4 → ℝ) :
    H (J4 x) y = Complex.I * H x y

relationalSourceHermitianCandidate_J4_right_neg_mul_I
    (x y : Fin 4 → ℝ) :
    H x (J4 y) = -(Complex.I * H x y)
```
Lean uses actual accepted names `relationalSourceHermitianCandidate` and `relationalPhaseJFourLinear`. Reassemble the four source-typed D27 component equations via pinned Mathlib `Complex.ext`, `Complex.I_mul_re`, `Complex.I_mul_im`, `Complex.neg_re`, `Complex.neg_im`. The resulting full complex equations are **not by themselves full complex sesquilinearity**, since a compatible complex scalar action on the real-four carrier has not yet been constructed.

Strict original CI: exact frozen original Gamma9/P/J/Circle, accepted D26/D27 source SHA pins, source-independent original signed-permutation Gamma9 integer fixture, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Native and independently imported warning-as-error Lean, two plus two `#print axioms` restricted to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, no proof-budget override. Original RED/GREEN artifact archive, exact tested SHA and independently recomputed ZIP SHA-256.

After qualification: define source complex scalar action `z • x := z.re • x + z.im • J4 x` as a **separate** bounded gate, prove complex module laws and compatible Hermitian sesquilinearity, then a source Q-isometric ℂ² frame and classical scalar Circle equivariance/quotient. Original physical BFSS 48-Majorana Fock/Gauss/Hamiltonian and stable hopfion remain unproved. Do not change original Gamma9, `main`, toolchain or accepted evidence.
