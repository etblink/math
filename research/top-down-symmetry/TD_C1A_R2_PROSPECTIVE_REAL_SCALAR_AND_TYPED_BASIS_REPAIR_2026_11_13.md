# TD-C1A R2 — exact original 48-vector gauge-gamma proof-interface repair

**Date:** 2026-11-13 Pacific. **Qualification:** PROSPECTIVE until strict cold Lean source, original Fock independent consumer, and permitted axiom audit GREEN.

R1 [strict #43536957727](https://github.com/etblink/math/actions/runs/43536957727), tested `5564c2f15044326f34f16d8a06c1cba7e131a958`, failed at two source proof steps: line 38 real-vs-complex scalar linearity and line 68 excessive definitional expansion of all 48 Fock expressions during a basis comparison. [Immutable R1 first-causal RED](TD_C1A_R1_RED_43536957727_FIRST_CAUSAL_2026_11_13.md), artifact #14090063603.

## Exact bounded R2 changes

- `L.map_smul'`: replace a broad simplifier with the original G4E complex-linear unitary's `map_smul` at scalar `(c : ℂ)`, then use `Complex.coe_smul` to identify the underlying real action on original `Fermion 2`. No replacement unitary or Majorana map.
- In basis-ext proof, preserve abstract native real-linear maps `L` and `R`, use `change L (Pi.single p 1) = R (Pi.single p 1)` instead of forcing a fully expanded source equality, then rewrite the pinned source `haxis` and apply the independently qualified C48C1A1d0 axis theorem. No structural recursion-limit or timeout increases.
- Keep identical theorem statement, full Source48Vector, original sourceBlockColorEquiv, G4E gauge unitary, sourceGammaRealLinear, S1J matrix and all source original types.
- Native original independent consumer blob `7c9998173589de762a486e60508c3a40fcdee2ac` unchanged. Existing strict workflow blob `cc55480565ee935d499baef11c0ea4fe0f712372` unchanged. Lean 4.34.1/Mathlib d13f23b7 and prior source blobs still frozen.

## Success/negative-knowledge controls

A new source and independent consumer strict GREEN, with the sole full-qualified root and permitted axioms only, is necessary for qualification. If new source red, preserve first-causal then narrow; the R1 negative evidence is permanent. This gate proves only original SU2 all-48-vector gauge covariance; full Spin automorphism fixedness of gauge unitaries, OP2b gauge projection, Spin9 Fock-vector implementer, physical singlet Hamiltonian, auxiliary H or gap remain open.
