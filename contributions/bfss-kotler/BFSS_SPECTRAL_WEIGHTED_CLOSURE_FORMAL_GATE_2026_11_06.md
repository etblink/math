# BFSS original weighted-closure bridge — 2026-11-06

**Status: proposed Lean source and six independent consumers; compiler qualification pending.**
This follows the [qualified smooth-core bridge](BFSS_SPECTRAL_CORE_LINEAR_MOMENT_FORMAL_GATE_2026_11_06.md#scoped-acceptance-first-complete-run-42318037096)
at `5d7ba89d4ef46efdd5411169c35926c807fee76f`, run #42318037096.
Proposal parent: `7016ef6c6373918d611bd658688b136a101f6010`, on the separate
`research/bfss-spectral-confinement-roadmap-20261106` branch. AI-assisted
implementation and gate design are not compiler qualification or human review.

## Exact statements and original carrier

Use finite `ι`, Euclidean volume `μ` on `X=EuclideanSpace ℝ ι`, the original
coordinate basis `e`, and a complete finite-dimensional real inner-product
target `F`. The original `BFSSSliceSobolev.weightedClosure μ e w hw` is the
closure of the original smooth-core triples
`(toL2 μ f, gradient μ e f, weightedToL2 μ w hw f)`.
No new closure, quotient, Hilbert space, norm, or operator is defined here.

The first proposed theorem assumes a continuous real weight `w`, `c>0`, and
the **linear** radial domination `c*‖x‖ ≤ w(x)^2`. For sequences of triples
`(u n,v n,m n)` in that original closure, uniformly bounded gradient,
unweighted L2 and weighted L2 components imply `TotallyBounded (range u)`.
The three norm bounds `A,B,C` are nonnegative reals. Closure membership and
all three bounds remain hypotheses.

The second proposed theorem fixes `w(x)=Real.sqrt ‖x‖` on the same original
closure. Its continuity follows from continuity of the norm and square
root, and `w(x)^2=‖x‖` proves the domination with `c=1`. This requires no
false smoothness assumption on the radial weight at the origin: the
original closure definition requires only continuity of `w`.

Two declarations are proposed:

- `OAI.BFSSSliceSobolev.weightedClosure_linear_totallyBounded`.
- `OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded`.

## Proof reuse and the linear-moment boundary

Reuse `weightedClosure_approx` with errors `1/(n+1)` to choose smooth-core
approximants. Their gradient, L2 and weighted L2 norms are bounded by
`A+1`, `B+1`, `C+1`. The original weighted norm identity and the linear
domination then give the **first** radial moment bound

\[
\int \|x\|\,\|f_n(x)\|^2\,dx \leq \frac{(C+1)^2}{c}.
\]

Use the qualified `core_linear_moment_totallyBounded` with that bound
directly. In contrast to the older quadratic-radius proof, the moment
constant is not the square root of this expression and the radius is not
squared. Finally reuse `BFSSRellich.totallyBounded_asymptotic` to transfer
total boundedness from the core approximants to the original `u` sequence.
The proof otherwise follows the original `weightedClosure_totallyBounded`
approximation argument. The original quadratic theorem is preserved.

Imports are `FormCompactness` and the qualified smooth-core module. The
exact imported closure contains 59 original sources, all matching preserved
parent `4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`, and the two accepted
contribution sources. The existing source/consumer pairs are not modified.

## Independent consumers and bounded strict gate

- [Source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralWeightedClosureCompactness.lean).
- [Independent consumer](../../lean/diagnostics/BFSSSpectralWeightedClosureIndependentAudit.lean).
- [Exact input manifest](BFSS_SPECTRAL_WEIGHTED_CLOSURE_MANIFEST_V1.json).
- [Qualifier](tools/qualify_spectral_weighted_closure.py)
  and [workflow](../../.github/workflows/bfss-spectral-weighted-closure-strict.yml).

Six independent examples consume the exact general-weight statement, the
square-root corollary, membership of original core triples in the same
closure, enlargement of the weighted L2 bound, general weights on literal
original `FullL2 2`/gradient carriers, and the literal square-root SU(2)
closure. No actual physical-sector or Hamiltonian domain is substituted.

The new qualifier reuses the accepted report validator and environment
utilities without modifying accepted files or module globals. It checks
both prior gates' frozen manifests, plus its own 79 exact input pins:
59 originals, four accepted source/consumer files, two new files, fourteen
controls. It checks exact imports/topological order, original-source and
control hashes, six consumers, two new declarations and their exact root
report inventories. The thirteen accepted wrapper regression checks are
run unchanged; local new-root fixtures also reject diagnostics, recovery
axioms, foreign roots and duplicate completion markers. These static checks
are not Lean evidence.

All 65 controlled proof objects are removed and cold-rebuilt: the original
closure, both accepted pairs with fresh root audits, and the new pair.
Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` remain
pinned. The strict six source/consumer files must compile without warnings,
print their exact roots and emit distinct completion markers. Only
`propext`, `Classical.choice`, `Quot.sound` are allowed in those reports.
Compiler status and diagnostics remain decisive even if a marker prints.

There are no new proof-resource options, linter waivers, admissions or BFSS
object caches. Per-file wall limits remain 300 seconds, the build step
28 minutes, and the complete job 60 minutes. Pinned upstream Mathlib cache
restoration is separate from cold compilation of the controlled BFSS files.
Original parent warnings, if present, remain separately reviewable. Lake
environment diagnostics remain separate from compiler logs. Exact inputs,
all logs, tested commit, environment provenance and object/log digest receipt
are retained, including the workflow input under `.github`.

## Acceptance boundary and subsequent decision

If the complete gate and retained-evidence review pass, qualify only the
two named statements on the actual weighted closure and their hypotheses.
This would complete this bounded **compactness analysis** lane for a
linear radial weight. It would not derive gradient or moment bounds from
an energy estimate, prove a source physical action, show isotypic reduction,
identify the physical Hamiltonian form domain, or establish compact
resolvent or a positive eigenpair of that Hamiltonian.

After qualification, return to the remaining source premises P1–P3 and
choose a physical binding obligation with a precise source statement.
Do not keep extending this compactness lane merely because more wrappers
could compile. Actual identification of the weighted closure with a
physical form domain is a separate theorem, not a change of terminology.
The full high-type confinement inequality and spectral existence remain
open until their source premises and domain-accurate implications survive.

The original F10DW branch, upstream PRs, accepted Lean sources and gates,
and the guarded DD/AI cache remain outside the modification scope.
