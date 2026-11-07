# BFSS smooth-core linear-moment bridge — 2026-11-06

**Status: proposed Lean source and six independent consumers; compiler qualification pending.**
This follows the [qualified linear-moment gate](BFSS_SPECTRAL_LINEAR_MOMENT_FORMAL_GATE_2026_11_06.md#scoped-acceptance-complete-cold-run-42315568670)
at `6b7f43be416bcfcef6d293dff423e13d2468f9d7`, run #42315568670.
The proposal parent is `4b3df7b237e590b94a2ad70d90dd7e55ad5dbab4` on
`research/bfss-spectral-confinement-roadmap-20261106`. AI-assisted source and
gate design are not compiler evidence or independent human review.

## Exact bounded task

For finite `ι`, a finite-dimensional real inner-product target `F`, and any
index type `J`, let `f : J → BFSSSliceSobolev.Core` use the **original** smooth
compactly supported test-function carrier on `EuclideanSpace ℝ ι`. Let `μ`
be Euclidean volume and `e` the original coordinate orthonormal basis.

1. Uniform bounds `‖gradient μ e (f j)‖ ≤ A` and `‖toL2 μ (f j)‖ ≤ B`
   imply local L2 total boundedness on every positive-radius closed ball.
   No moment or common compact-support hypothesis is added to this statement.
2. Adding the first radial moment bound
   `∫ x, ‖x‖ * ‖f j x‖² ≤ C` gives total boundedness of the full original
   `toL2 μ` family. The radius and the bound `C` are not squared.

`A`, `B`, `C` are nonnegative reals. The result is for arbitrary families,
including sequences, and requires no extra completeness hypothesis on `F`.
The original smooth-core carrier already supplies each function's smoothness
and compact support. The target's finite-dimensional hypothesis is explicit
and is appropriate for the original finite SU(2) Fock carrier.

Two named declarations are proposed:

- `OAI.BFSSSliceSobolev.core_gradient_l2_local_totallyBounded`.
- `OAI.BFSSSliceSobolev.core_linear_moment_totallyBounded`.

The first reuses the derivative estimate and local Rellich step from
`FormCompactness.core_moment_totallyBounded`. The operator-derivative L2
bound follows from the coordinate gradient with
`D=(Fintype.card ι+1)*A`; `localRellich_on` then gives local compactness.
The second composes this local theorem with the qualified
`BFSSRellich.linear_moment_tight_compactness`. The final equality between
the original `toL2` and `compactLp` constructions is definitional.

The source imports `WeightedGradients` and the qualified linear-moment
module, which supply the necessary original interfaces. It does not import
the larger `FormCompactness` closure merely to reuse the shape of its proof.
All 45 original modules in the imported closure match the preserved exact
parent `4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e` byte for byte.

## Independent consumers and strict gate

- [Source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralCoreLinearMomentCompactness.lean).
- [Independent consumer](../../lean/diagnostics/BFSSSpectralCoreLinearMomentIndependentAudit.lean).
- [Exact source/control manifest](BFSS_SPECTRAL_CORE_LINEAR_MOMENT_MANIFEST_V1.json).
- [Qualifier](tools/qualify_spectral_core_linear_moment.py),
  [regression controls](tools/test_spectral_core_linear_moment.py), and
  [dedicated workflow](../../.github/workflows/bfss-spectral-core-linear-moment-strict.yml).

Six independent exact-type examples consume the generic local statement,
generic global statement, sequence specialization, enlargement of the
linear moment bound, original `SmoothCore 2` local compactness, and original
`SmoothCore 2 → FullL2 2` global compactness. The latter two use the original
real coordinate gradient on the literal original Fock carrier. No surrogate
Hilbert space, energy estimate, action or physical sector is substituted.

The gate reuses the accepted environment-resolution utilities **without
editing them or changing their module globals**. It also runs the old
manifest preflight and eight accepted wrapper regression tests. Five new
tests cover exact new-root reports, diagnostics despite completion markers,
foreign/missing/duplicate roots, recovery/unexpected axioms, and completion
marker failures. These thirteen tests validate gate behavior, not mathematics.

The new manifest pins 45 original modules, the accepted source and consumer,
the new source and consumer, and eleven environment/gate controls: sixty
input pins in total. The imported graph, topological order, exact two-root
inventories and six-example inventory are checked before expensive setup.
Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` remain pinned.

Every one of the 49 controlled Lean objects is removed and cold-rebuilt.
The accepted source/consumer are freshly compiled and audited, followed by
the new source/consumer. Both pairs use fatal compiler warnings, default
proof-resource limits, exact root reports, and distinct completion markers.
Only `propext`, `Classical.choice`, `Quot.sound` are allowed in those reports.
Original legacy warnings, if any, remain separately reviewable. Per-file
wall limits remain 300 seconds, with a 28-minute build step and 60-minute job.
Only pinned upstream Mathlib cache data may be restored; no BFSS object
cache or guarded DD/AI contract is changed.

Lake diagnostics remain separate from compiler logs. Inputs, full logs,
tested commit, dependency/compiler provenance and object/log hash receipt
are retained. The uploader now includes the workflow's hidden `.github`
input directory inside the evidence folder; proposed-input tar retention
also remains. Any failure remains unaccepted, even if later root reports or
a completion marker print. No proof budgets, linter waivers or admissions
are introduced to address inference failures.

## Acceptance boundary and next decision

Success would qualify only the two named **smooth-core analysis** interfaces
under their actual hypotheses. Gradient, L2 and radial-moment bounds remain
assumptions. It would remove local compactness as a separate premise when
these smooth-core norm bounds are available; it would not derive them from
the BFSS Hamiltonian or a proposed high-type coercivity estimate.

An extension to the actual weighted Sobolev closure is a separate bounded
bridge. It must match the original closure definition and control a linear
radial weight, rather than reintroducing the old quadratic-moment mismatch.
Source obligations P1 (global physical action/lift), P2 (exact source core
form), and P3 (physical reduction and closed-source Hamiltonian binding)
remain open, as do confinement, compact resolvent and spectral existence.

Do not advance to those claims from a static pass or a green setup step.
Review the actual compiler, independent consumers and retained artifact
before any scoped acceptance. Diagnose a failure at its exact statement or
proof boundary, preserving the failed attempt and the unchanged hypothesis
contract. The original F10DW branch, upstream PRs and existing gates remain
outside the modification scope.
