# K1D3 scalar common-kernel — bounded independent qualification

**Current state: CANDIDATE / OWNER STRICT CI NOT YET QUALIFIED.**
Owner research branch: `research/fcp-k1d3-scalar-kernel-20261027`.
Parent accepted import checkpoint: `integration/fcp-k1d2-pbw-20261027@4fb719fa729e5cea1c6c21999d8bfcbb7984a8ef`.
That checkpoint admits 49 modules in its bounded scope, supported by the exact-source PBW and Spin48 ancestry strict runs [40611734249](https://github.com/etblink/math/actions/runs/40611734249) and [40611734284](https://github.com/etblink/math/actions/runs/40611734284) on SHA `25a8de278788ef251cc6076784191717fd6bb2bb`.

## Exact proof objectives

1. **K1D3 exterior composition**, source blob `04c477227d2a535e01abe0e01ea1ae57ff116321`, one declaration root: `FCP.BFSSS1V52K1D3.originalExteriorScalar_of_all_coordinateContractions_zero`. If every original Source48 coordinate contraction of the genuine exterior-algebra element vanishes, then the element is scalar. Directly compose the accepted F2 no-occupied-labels result with the *statement-preserving repaired* E5 scalar reconstruction; no new coefficient-contraction lemma is invented.
2. **K1D4 original Spin48 exterior consequence**, source blob `271865855ec72fc428fe29aa005392273fad165f`, one declaration root: `FCP.BFSSS1V52K1D4.originalSourceSpin48_trivialAction_exterior_scalar`. The accepted K1D1 original half-unit polar-to-coordinate identity produces exactly the hypotheses of K1D3 for the exterior image of a genuine source Spin48 vector-action kernel element.

Actual upstream owner parents:
- F2 `eada39fbd5891865e9662a610cf10deb584834da`
- repaired E5 `31f171b108b06c995824cdb84ad70f26f1060b10`
- original K1D1 `7e91352f3d3134b54bbc4e26e0caf702c36f2fa0`.

The original 48 real labels and source-defined quadratic form are unchanged. Neither result treats `CliffordAlgebra.equivExterior` as an algebra homomorphism. The *image in the exterior algebra* being scalar is not yet the same as a proved *Clifford scalar*, until explicit preservation of scalar algebra maps under the real-linear equivalence is qualified.

## Verification contract

The new source-exact strict owner workflow `.github/workflows/bfss-kotler-k1d3-scalar-kernel-owner-strict.yml` pins both source Git blobs and verifier `281a07aeb0a4137a9106930da18f4c6f4cd84035`. With the same Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, it requalifies the accepted 22-module/47-root ancestry closure, then freshly compiles the two new candidate sources with warning-as-error, genuine compiled `.olean` outputs, exact two-root axiom checks (only `propext`, `Classical.choice`, `Quot.sound`) and type evidence. Evidence is archived for both success and failure.

**Fail closed.** A failed, missing, partial or still-running gate does not increase the 49-module accepted count. If only K1D3 compiles in an unsuccessful batch, it is a useful debugging observation, not independent acceptance of the complete new gate.

## Explicit unresolved obligations

- Prove transport of the scalar conclusion back through the exact `CliffordAlgebra.equivExterior` real-linear equivalence using the pinned Mathlib `changeForm_algebraMap` theorem; do not assume it preserves multiplication.
- Establish actual original Spin(48) kernel membership as the two central signs, including the separately tracked negative central representative and exclusion of other scalar Spin elements.
- Keep covering theory, global Spin(9) construction, BFSS spectral questions, and all other physical existence claims separate.
- Do not modify `main`, the parent accepted branch, FCP, or upstream `mathcommunity/oai-math-revised`.

This record is scoped to a new, proof-level extension of the already qualified 21-module owner import. It neither bulk-imports FCP's historical archive nor asserts synchronization of the entire research program.
