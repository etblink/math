# TD-C1A R3 — avoid expensive original Fock elaboration using pinned scalar restriction

**Date:** November 13, 2026 Pacific. **Status:** SOURCE CANDIDATE / UNQUALIFIED until exact cold Lean and independent consumer strict GREEN.

R1 [#43536957727](https://github.com/etblink/math/actions/runs/43536957727) failed first at source real-versus-complex scalar map and second at an expanded full-basis `change`. R2 [#43539398734](https://github.com/etblink/math/actions/runs/43539398734) changed those two tactics but both now triggered recursion-depth errors at source lines 40 and 70, with `sorryAx` merely reflecting the unproved theorem. See [R1 immutable ledger](TD_C1A_R1_RED_43536957727_FIRST_CAUSAL_2026_11_13.md) and [R2 immutable ledger](TD_C1A_R2_RED_43539398734_FIRST_CAUSAL_2026_11_13.md). R2 artifact #14092041009, SHA256 `b7bc1fd6092506ee711d4e378e7942b26ae8a26e848c69f3da613d114ed8c37f`.

## Source-faithful R3 experiment

- Use the **pinned Mathlib API** `ContinuousLinearMap.restrictScalars ℝ` (source Mathlib file `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/RestrictScalars.lean` at pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`) to view the *same exact* G4E complex-linear Fock unitary as a real-linear `Ureal : Fermion 2 →L[ℝ] Fermion 2`.
- Rebuild only the new proof's local auxiliary real-linear map `L` using `Ureal` and literal `sourceGammaRealLinear`. Its scalar linearity follows by three explicit calculations (`sourceGammaRealLinear.map_smul`, pointwise operator smul, and `Ureal.map_smul`), avoiding the heavy `simpa only [map_smul, Complex.coe_smul]` on a concrete Fock unitary.
- Keep original `R` construction (S1J color `mulVec` and source real-linear gamma) and exact `Pi.basisFun` extension, but remove line-70 `change`. Prove a named source-axis equality `hsource`, then transport it to the basis using the literal sourceBlockColorEquiv and `congrArg L/R`. This minimizes implicit definitional expansion on a basis-coordinate check.
- **No global maxRecDepth increase**, no copy of theta/gamma CAR or replacement Fock carrier. Explicit import of pinned Mathlib scalar restriction is allowed.

**Frozen:** original full-vector theorem statement, source `Source48Vector`, true `GaugeGroup 2` G4E unitary, S1J `sourceRealMajoranaMatrix`, `sourceGammaRealLinear`, original 48-axis `C48C1A1d0` theorem, unchanged native independent consumer blob `7c9998173589de762a486e60508c3a40fcdee2ac`, unchanged strict workflow blob `cc55480565ee935d499baef11c0ea4fe0f712372`, source pins Core/C48C1A1d0/C48C1A0/OP3C6C/S1H, Lean 4.34.1 Mathlib d13f23b7. No new axiom, sorry, unsafe source or theory strengthening.

**Qualification rule:** a fresh exact strict source + independent consumer + sole root permitted axioms GREEN. Any R3 RED must preserve first-causal source error, not widen theorem or retry by guesswork. No source Spin9 gauge fixedness, Fock vector Spin9 unitary, physical projection, Hamiltonian, gap or NFC scientific promotion until separately qualified.
