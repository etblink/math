# Project Lead — V9P Gate 1 ACCEPTED: original paired-Fock typed skew carriers and commutator preservation

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T16:14:46Z. **Disposition:** `ACCEPTED_TWO_TYPED_CARRIER_COMMUTATOR_ROOTS__ADDITIVE_SCALAR_STRUCTURE_NEXT`.

## Immutable strict acceptance

- [V9P Gate 1 #41217837889](https://github.com/etblink/math/actions/runs/41217837889), attempt **1**, terminal **completed/success**, exact tested SHA **`c6267503567fb3c4a9a869bf4a8db02034a8c18d`**, job **`124585976484`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9TypedSkewCarrierCommutatorProbe.lean`, Git blob **`d8d36c3207031a7429e00c0b3a7e383bf277e4ea`**.
- Exact original paired-Fock gamma/48-label ancestry pins; accepted V9O native source skew commutator closure, V9N matrix commutator preservation, V9C image skewness; pinned Lean **v4.34.1** and Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**: preflight **PASS**, pinned dependency restore **PASS**, accepted ancestor compilation **PASS**. `Build completed successfully (8991 jobs)` denotes build workload, **not theorem roots**.
- Exact fresh `lake env lean -DwarningAsError=true`, .olean generation and source-level `#print axioms` for both theorems **PASS**.
- Independent imported theorem-type examples **2/2 PASS**, seven `#check` carrier/declaration checks, independent `#print axioms` for both theorems **PASS**, terminal marker **`K1D18V9P_TYPED_SKEW_CARRIER_COMMUTATOR_AXIOMS_PASS`**.
- Axiom sets only **`[propext, Classical.choice, Quot.sound]`**, with no `sorryAx`, custom axiom, disabled linter or increased proof limits.
- [Preserved independent compiler/theorem/axiom artifact #13049360885](https://github.com/etblink/math/actions/runs/41217837889/artifacts/13049360885), `bfss-v9p-original-paired-typed-skew-carriers-commutator-c6267503567fb3c4a9a869bf4a8db02034a8c18d-1`, ZIP SHA256 **`c84081b092fec13e69dc54d51deace2a80ad36eb663ba724700969857945abe7`**, size **1121 bytes**.

## Exact qualified theorem roots

1. **`pairedSkewMatrix48_commutator_closed`**: for any two skew `Matrix Source48Label Source48Label ℝ` values X,Y, `(X*Y-Y*X).transpose=-(X*Y-Y*X)`. This constructs and verifies closure of the *original Fock-paired* 48-real skew carrier under native product commutator.
2. **`coordinateToPairedSkewCarrier_commutator`**: for all `A B : coordinateSkewMatrix9Carrier`,
```lean
coordinateToPairedSkewCarrier (coordinateSkewMatrix9Carrier_commutator A B) =
  pairedSkewMatrix48Carrier_commutator
    (coordinateToPairedSkewCarrier A)
    (coordinateToPairedSkewCarrier B)
```
It is a genuine Lean `Subtype` equality of exact typed skew carriers proved by `Subtype.ext` and accepted V9N's source-exact matrix equality. No LieHom is assumed.

Verified **definitions**, not counted as theorem roots: source skew `coordinateSkewMatrix9Carrier`, original paired output skew `pairedSkewMatrix48Carrier`, exact map `coordinateToPairedSkewCarrier`, source and target carrier commutator operations.

**Ledger:** V8A–V9O **70** qualified algebraic theorem roots; V9P **+2 = 72**.

## Next bounded typed obligations

Build source/target skew subtype addition and real scalar operations, certifying skew closure explicitly and verifying that the genuine restricted coefficient map respects addition and scalar multiplication by direct use of accepted `coordinateToPairedLinearMap` real linearity. Do not replace the source carriers with an unrelated basis, change accepted source pin, or assume built-in Lie algebra structures without checking their exact Mathlib interfaces. Package a real LinearMap of exact skew carriers only after source/target module structures are verified, and then construct a genuine typed `LieHom` from the verified commutator operation (or prove equivalent source-exact interfaces as needed).

Global Spin(9) group integration, original Clifford/Fock operator implementation, covering/surjectivity, and BFSS physical/spectral existence are still unproved. Preserve all historical red proofs and independent fixture failures, frozen FCP, `main`, community upstream, immutable accepted Lean blobs. No unauthorized upstream PR. This report adds no theorem root.
