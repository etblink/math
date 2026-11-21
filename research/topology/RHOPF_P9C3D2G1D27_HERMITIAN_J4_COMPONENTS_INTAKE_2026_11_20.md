# RHOPF-P9C3D2G1D27 — original Gamma9 Hermitian J4 component identities intake

**Date:** 2026-11-20 Pacific. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until exact-native strict source and independent imported consumer GREEN, axioms audit, and original ZIP integrity verified.

D26 R2 [run #44844922925](https://github.com/etblink/math/actions/runs/44844922925) at exact tested `b62f47a0c04e18ecdca76cc93da742a830eaa677` qualified original source H and conjugate symmetry/positive real diagonal, original ZIP SHA256 `aabbea78a985de02501b3b17b18a3bf1fb5a6c58bd77b0c1241e81b185073a6f`, accepted in commit `b0435951332ac0b625467a20fa88cb402af820d5`. D26 R1 remains separately rejected at run #44841481734.

## D27 narrow source exact scope

Given `H(x,y)=⟨x,y⟩_Q - i⟨J4 x,y⟩_Q`, derive the four exact real and imaginary components of `H(J4 x,y)` and `H(x,J4 y)` by the accepted D10 original Gamma9 `J4²=-I`, D25 Q-orthogonality/skew, D22 real bilinearity and D26 component definitions:

```lean
relationalSourceHermitianCandidate_J4_left_re
relationalSourceHermitianCandidate_J4_left_im
relationalSourceHermitianCandidate_J4_right_re
relationalSourceHermitianCandidate_J4_right_im
```

Expected mathematical identities: `Re H(J4x,y) = -Im H(x,y)`; `Im H(J4x,y) = Re H(x,y)`; `Re H(x,J4y) = Im H(x,y)`; `Im H(x,J4y) = -Re H(x,y)`. They are componentwise precursors to `H(J4x,y)=iH(x,y)` and `H(x,J4y)=-iH(x,y)`; the full complex scalar action and `Module ℂ` remain separate. **No** canonical Euclidean coordinate dot, global norm changes, ad hoc gamma entries, standard Hopf scalar conjugacy or Chern charge, original BFSS physical Fock/Gauss/Hamiltonian implementation or stable hopfion claims.

Strict pinned CI must include original Gamma9/P/J/Circle, accepted D10/D22/D25/D26 exact source hashes and source-independent signed-permutation integer fixture, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Native and independently imported warning-as-error Lean, 4+4 axioms limited to `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, no proof-budget overrides. Archive and independently verify original RED/GREEN ZIP/tested SHA. If native RED, preserve original diagnostics before further work.
