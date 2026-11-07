# Original gamma faithfulness microgate

Status: candidate; acceptance requires the complete strict run and evidence review.

Exact parent: `5fbe86b73784efa429d01c5b338990540896b1de`.
Isolated branch: `research/bfss-original-gamma-faithfulness-20261107`.
Research input: *BFSS Source-Exact Representation Binding Audit, 2026-11-07*, sections 6–7.

## Proposed source-exact theorem types

In namespace `FCP.BFSSSourceNineGammaFaithfulness`, with the original imported types:

```lean
gammaNineRealLinear_injective : Function.Injective gammaNineRealLinear

source9NegativeCentral_gamma :
  ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) = -1

source9NegativeCentral_gamma_ne_one :
  ((source9SpinGammaSpecialOrthogonalHom source9NegativeCentral) : GammaMatrix) ≠ 1

source9SpinGamma_eq_one_iff (g : spinGroup source9Quadratic) :
  source9SpinGammaSpecialOrthogonalHom g = 1 ↔ g = 1

source9SpinGammaSpecialOrthogonalHom_injective :
  Function.Injective source9SpinGammaSpecialOrthogonalHom

source9SpinGamma_fixes_iff_commutes
  (g : spinGroup source9Quadratic) (v : SpaceIndex → ℝ) :
  source9SpinVectorRepresentation g v = v ↔
    ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix) * gammaNineRealLinear v =
      gammaNineRealLinear v * ((source9SpinGammaSpecialOrthogonalHom g) : GammaMatrix)
```

## Proof and dependency review before commit

The square of the original gamma evaluation is the positive original quadratic form
times the identity. A diagonal entry proves vector injectivity. Exact global
covariance then sends a gamma-kernel element into the natural nine-vector kernel.
F10CU leaves only the two actual central signs; the original Clifford value of the
negative sign evaluates to minus identity and excludes it. Relative kernels give
group injectivity. Covariance and cancellation prove the stabilizer criterion.

The source imports only F10CU and `SpectralSourceNineGammaCovariance`.
Its exact recursive non-Mathlib ancestor closure has 126 modules: 125 original
modules and the separately qualified global-covariance source. Of these, 112 are
contribution modules; there are zero `OperatorDependencies` imports. Every inherited
source hash was compared with the existing compactness/global-covariance manifests.

The manifest pins 158 inputs: these 126 ancestors, source and independent consumer,
and 30 verification/environment controls. Lean 4.34.1, all 42 package revisions,
Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and the existing environment
restoration mechanism remain unchanged.

## Independent consumers and qualification

Twelve independent examples check the exact injectivity type, equality from coerced
gamma-matrix equality, the identity image, the actual negative-central image and
its separation from identity, its trivial natural matrix, both source signs,
the ninth-axis stabilizer equivalence, identity/negative-center stabilizers, the
perpendicular pair e0e1, the mixed pair e0e8 sending e8 to -e8, and failure of that
mixed pair to commute with gamma8. The consumer imports only the new source and
does not reference compiler-generated private names from another module.

The existing source-nine procedure is retained: erase all 128 controlled proof
objects, cold rebuild ancestors, strictly compile accepted covariance and both new
modules, require exact ordered axiom reports and completion markers, preserve all
compiler logs, exact inputs, package/compiler provenance and receipt. The only
permitted foundational axioms are `propext`, `Classical.choice`, `Quot.sound`.
Warnings in strict modules are fatal. No BFSS proof-object cache is restored.
No new proof options, instance setup, linter waiver, or resource-budget increase
is allowed. The ten existing adversarial report-validator tests are reused.

Before commit, source-closure preflight and all ten validator tests pass locally.
The local environment has no Lean executable, so this is not a local compiler
qualification. The dedicated GitHub Actions run must establish that qualification.

## Scope and acceptance boundary

No inherited Lean statement, representation, dependency pin, or existing gate is
modified. No even-Clifford injectivity, covering theorem, Fock lift, or new
mathematical hypothesis occurs in the new source. This gate establishes no Spin(8)
identification, Fock-operator action, physical coercivity, or spectral existence.

A compiler/type/resource failure blocks acceptance; it is not a mathematical
counterexample. An unexpected axiom, source mismatch, collapsed central sign,
incorrect covariance orientation, missing consumer, warning, or incomplete receipt
rejects qualification. The candidate is not accepted merely because it is committed.
