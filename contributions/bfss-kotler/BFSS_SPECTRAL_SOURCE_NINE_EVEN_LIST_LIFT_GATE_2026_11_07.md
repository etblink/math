# C0-A4a: ordered even Q-unit list lifted into the original source Spin group

Status: **candidate; not qualified** until the dedicated strict run and its
retained evidence have been reviewed. This is the first bounded part of C0-A4.
It does not complete the exact-eight word theorem.

Parent: `f65398f849beb782dd48cac96b07c15094d72d64` on the separate spectral
research branch. C0-A3 qualified at `b3bb2bd77498251dc6361e143ac7713b05d150a3`
in [run #42352505826](https://github.com/etblink/math/actions/runs/42352505826).

## Exact proposed result

The source file is
`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineEvenListLift.lean`.
Its sole import is the accepted source-nine UnitCartan file. It introduces:

| Public root in `FCP.BFSSSourceNineEvenListLift` | Proposed meaning |
| --- | --- |
| `source9CliffordWord` | Original ordered Clifford product, with empty product one |
| `source9NativeReflectionWord` | Ordered native hyperplane-reflection product after the same-label Euclidean transport |
| `source9EvenUnitList_lift` | For an even original Q-unit list, an actual source Spin element whose Clifford value is exactly that word and whose original action is exactly that reflection product |
| `source9Spin_sourceUnitCartan_lift` | For every original g, an even unit list of length at most eight and an actual source h with that exact Clifford word and the same original action as g on every source vector |

The proof strips two entries at a time by strong induction on length,
uses the original F10BH pair element, and composes through the original
F10BP action. C0-A1 supplies the ordered pair action. The empty list lifts
to the actual identity. The Cartan specialization uses the accepted
C0-A3 witnesses; it never silently identifies h with g.

The single positive Clifford vector implements line reflection, minus the
native hyperplane reflection. Only consecutive pairs are used as Spin
elements. There is no assertion that each individual vector is in Spin.

## Independent consumption and strict boundary

`lean/diagnostics/BFSSSpectralSourceNineEvenListLiftIndependentAudit.lean`
has eight consumers: the two exact word types, both full existential
statements, the empty-list actual identity, an arbitrary ordered pair,
repeated-pair actual identity, and original quadratic preservation for the
bounded lift. It reprints all four public-root axiom reports.

The dedicated workflow is
`.github/workflows/bfss-spectral-source-nine-even-list-lift-strict.yml`.
Its separate manifest and qualifier pin 130 inputs: 94 unchanged original
modules, four already accepted source modules, two new candidates and
30 controls. The complete imported closure is rebuilt cold in order;
no BFSS proof cache is restored. The four accepted source modules are
Lipschitz representation, orientation, reflection pair and UnitCartan.

Acceptance requires all 100 compiler exits to succeed, the independent
consumer to compile, all 63 strict reports to match their exact names and
order, six completion markers, and matching source, compiler, dependency,
object and log provenance. Only `propext`, `Classical.choice` and
`Quot.sound` are permitted. Recovery axioms, warnings, errors, incomplete
markers and replacement carriers are rejected. Default proof budgets and
strict source options remain enabled. Ten adversarial output tests exercise
the report boundary. Inputs and all compiler logs are retained on failure
as well as success, with a fourteen-day Actions retention period.

Lean remains pinned to 4.34.1 and Mathlib to
`d13f23b723b8a846827a245b89c10fc7d3f11612`. Local source-pin/closure
preflight, qualifier tests and workflow syntax are checked before publishing.
The local Lean executable fails to start with `failed to locate application`;
local static checks are not a substitute for the dedicated compiler run.

## Nonclaims and next decision

This gate does not import F10CU or invoke its two-sign theorem. Even if it
qualifies, h may be either source sign over the original action of g.
It proves neither h = g nor an exact eight-factor word for g.

After qualification, compare the attained original matrices and use F10CU's
actual two-sign fiber theorem. Pad to exactly eight Q-unit factors before
negating a factor for the negative sign; this explicitly includes the empty
Cartan list and the negative central element. Preserve the order when
passing to `Fin 8`. Split those obligations further if a larger proof hides
causal failures. No continuous witness selection is required.

Original PBW continuity, source-unit-locus compactness, compactness of source
Spin, covering, Fock/gauge actions, physical closed domains, full-sector
branching, coercivity and spectral existence retain separate gates. The
original research branch, upstream PRs, accepted source and existing gates
are unchanged by this candidate.
