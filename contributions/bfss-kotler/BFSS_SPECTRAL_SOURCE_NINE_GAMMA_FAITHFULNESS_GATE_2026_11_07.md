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

## Retained red: run 42406810092

Tested commit: `104e8bfec43707ccab32a5e50520db2d0c9d728e`.
All 126 ancestors and the complete faithfulness source compiled successfully.
Each of the six new source roots reported only the three permitted foundational
axioms. The independent consumer failed on its identity example at line 80:
a `change` tactic left its goal unchanged, and the strict unused-tactic linter
rejected it. The other consumer elaboration emitted no additional diagnostic.
The receipt is correctly `INCOMPLETE`; the overall microgate is not accepted.

Artifact: `13588237569`, ZIP SHA-256
`b4c3e85cecce60453ea6f53b0a18cf9ffc120265835b0f6d6d100480f672c796`.
The downloaded receipt and complete compiler logs were inspected.

Repair: remove only that redundant consumer tactic and update the consumer's
Git blob/SHA-256 manifest pins. The source proof, all theorem and example types,
all dependencies, verification code, workflow, budgets and strict linter policy
remain unchanged. A fresh complete cold run is required for acceptance.


## Qualified acceptance addendum — 2026-11-07, run #42408460376

**Acceptance status:** ACCEPTED, limited to the six public source gamma-faithfulness declarations and their independent literal-source consumers at **tested commit 2b2b4b0b3134606b7c54784a147aeae2a5072064**. The earlier "candidate" and retained-red text above is preserved as historical prequalification context; this addendum supersedes that status.

- Branch at verification: research/bfss-original-gamma-faithfulness-20261107.
- Workflow: BFSS spectral source nine gamma faithfulness strict gate; run [#42408460376](https://github.com/etblink/math/actions/runs/42408460376) succeeded.
- Successful evidence artifact: [#13589166423](https://github.com/etblink/math/actions/runs/42408460376/artifacts/13589166423); GitHub ZIP SHA-256 ee34977814bbc490cac6bb3a1d24a73b84df2fd53c226521b410c7114e67c779.
- Independently inspected archive: 158/158 original input/control SHA-256 and Git blob pins matched, 42/42 dependency revisions matched the retained manifest, 128/128 cold compilation logs passed with matched digests, the six new public declarations and independent consumer compiled.
- Compiler reports for all six new declarations and the independent audit contained only propext, Classical.choice, and Quot.sound; strict Lean compilation produced no source/consumer errors or warnings; source and independent consumer completion markers plus SPECTRAL_SOURCE_NINE_GAMMA_FAITHFULNESS_GATE_PASS appeared.
- The preceding red run #42406810092 is retained above. Its unused consumer change tactic was removed without changing source proof, theorem declarations, required dependency pins, verification policy or mathematical hypotheses.

**Acceptance scope:** gamma-vector injectivity, nontrivial negative-center gamma image, group-map faithfulness, and the exact source vector-stabilizer/gamma-commutant criterion. **Not accepted by this gate:** a Spin(8) stabilizer identification, complete Fock-operator algebra action, physical domain or spectral existence claim. The later documentation-only commit recording this review is not a retest of its own new Git HEAD.
