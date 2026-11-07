# BFSS original massless charge/core-form recovery — 2026-11-06

**Status: recovered source and new composition proposed; fresh compiler qualification pending.**
Parent: `2c2f632e97a4883caedf96d426fe79b7c4c3ecb8`, on the exploratory
`research/bfss-spectral-confinement-roadmap-20261106` branch. This implements
the next task selected by the [source-premise audit](BFSS_SPECTRAL_SOURCE_PREMISES_AUDIT_2026_11_06.md).
The compactness lane remains qualified and unchanged. This is a bounded
source-binding gate, not full P2 discharge or a physical spectral theorem.

## Source recovery and exact diff

Recover only K9A–D from
`etblink/math@fa00aa36e770ca516f57b41f5b02229a5033d50f`, preserving their
original paths under `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/`:

| Recovered file | Public roots | Role |
|---|---:|---|
| `SU2BFSSG4K9ASourceChargeCoefficientCrosswalkProbe.lean` | 2 | Negative massless matrix and authentic beta-alpha column sign |
| `SU2BFSSG4K9BSourcePairAndChargeReductionProbe.lean` | 6 | Original pair crosswalk and explicitly conditional reductions |
| `SU2BFSSG4K9COrderedPairCoefficientProbe.lean` | 5 | Actual half-weighted ordered-pair coefficient identity |
| `SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean` | 3 | Unconditional source multiplier, charge and named core-form equalities |

Only these source edits are permitted:

1. K9A's chronological import of the paired radial noncancellation chain is
   replaced by the original `MassiveMoments` import, which supplies every
   source definition and lemma actually used. K9B–D retain their imports.
2. Each file receives a scoped recovery note, `autoImplicit false`, and a
   distinct completion marker. No proof-resource option is introduced.
3. K9D's standalone print of its private coefficient helper is omitted.
   Both private proof bodies remain unchanged and are transitively covered
   by the public multiplier/charge/form axiom reports. No guessed private
   compiler-generated declaration name is used as a gate root.

The manifest records the full original blobs, SHA-256 values, import
mapping and reversible edits. The qualifier reverses those edits and
requires the **entire original file** to match its immutable snapshot blob
and digest, with the four origin blobs also frozen in the qualifier. This
checks preservation of every statement, hypothesis, public/private proof
body and namespace, not merely a selected excerpt. Artifacts retain both
the recovered inputs and the reconstructed original reader files.

Historical headers are preserved as source history. They are not fresh
acceptance. Four files are recovered here; the other operator dependencies,
concrete paired witness and closed-Hamiltonian package are not imported.
The separate contribution branch and PR remain untouched.

## New source composition and precise result

[SpectralMasslessCoreFormIdentity.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean)
proposes one additional root:
`OAI.BFSSQuantum.AlgebraData.massless_coreForm_energy`.
For every explicit original `M : AlgebraData N` and `f : SmoothCore N`,

\[
\begin{aligned}
 M.\mathrm{coreForm}(f)
 &=\frac12\sum_{p=(i,a)}\|\mathrm{coreToL2}(\partial_{ia}f)\|^2\\
 &\quad+\int\Big(M.\mathrm{deformedBosonicPotential}(1,0,X)\|f(X)\|^2
   +\langle f(X),M.\mathrm{deformedFermionField}(1,0,X)f(X)\rangle_{\mathbb R}\Big)dX.
\end{aligned}
\]

The proof uses the recovered unconditional **named core-form** equality
and then the original `averaged_core_energy 1 0`. The left side is the
original `Core.coreForm`, with its literal sixteen-charge `1/16`
normalization. The right side retains the actual source fields. No
potential-agreement premise or replacement charge norm is assumed.

This is a source-generic identity with an explicit `AlgebraData` parameter.
It does not construct a concrete instance, silently identify the Pauli
wedge potential, prove the sharp `8√3` fermionic norm bound, construct a
physical Spin(9) action, or identify a closed physical Hamiltonian domain.

## Independent consumer and strict gate

The [consumer](../../lean/diagnostics/BFSSSpectralMasslessSourceIndependentAudit.lean)
contains ten exact-type examples: negative potential sign, source-column
coefficient, ordered-pair half factor, actual complex-linear multiplier
equality, smooth-core charge equality, pointwise charge equality, named
core-energy/core-form equality, literal `1/16` charge normalization,
full generic energy identity, and `N=2` specialization with `FullL2 2`.
The last example still quantifies over `M : AlgebraData 2`; it is not a
concrete paired-instance discharge. Conditional K9B lemmas keep their
premises; the final K9D and composed consumers have no `hp` premise.

The [manifest](BFSS_SPECTRAL_MASSLESS_SOURCE_MANIFEST_V1.json),
[qualifier](tools/qualify_spectral_massless_source.py),
[recovery tests](tools/test_spectral_massless_source.py), and
[workflow](../../.github/workflows/bfss-spectral-massless-source-strict.yml)
form a new isolated gate. It pins 32 inputs: fifteen original modules,
four recovered modules, composition/consumer pair, eleven environment and
gate controls. All fifteen original modules match preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`. The exact imported closure
and topological order are checked before setup. No compactness or full
operator package is cold-built unnecessarily for this distinct source test.

All 21 controlled Lean objects are removed and cold-rebuilt. The recovered
files report sixteen public roots, the composition reports one, and the
independent consumer re-audits all seventeen: 34 reports across six strict
files. Only `propext`, `Classical.choice`, `Quot.sound` are permitted.
The six source/consumer files require zero compiler warnings, successful
compiler status and their own completion markers. Private lemmas remain
transitive dependencies of the audited public roots. A marker printed
after an error cannot qualify a file.

The six new recovery tests reject changed proof text, option changes,
unrecorded imports, trailing commands and private-audit drift, and check
all four round trips. The eight accepted environment/report controls and
five accepted generic report tests run unchanged: nineteen checks total.
Static tests and the exact source inverse are not Lean acceptance.

Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` remain
pinned. Existing environment/report utilities are reused unchanged, with
Lake diagnostics separated from compiler logs. Per-file wall limits stay
300 seconds, the build step 28 minutes and job 60 minutes. Proof budgets
remain default. No BFSS object cache, guarded DD/AI cache change, linter
waiver, extra axiom or admission is introduced. Inputs, reconstructed
original readers, complete logs and exact-commit digest receipt are retained.

## Admission and next boundary

If the full gate and retained-artifact review pass, qualify the recovered
source identities and this single new composition under their exact
original-data hypotheses. That would close the massless charge/named
core-form presentation bridge here; it would not close all of P2.

Next select the literal source-field contraction and sharp bound, using
the finite evidence already recorded in the source-premise audit. Keep
the actual Pauli/color/gamma binding, full Fock action and physical
sector/domain obligations P1/P3 distinct. Do not interpret this equality
as a confinement estimate or eigenpair existence result.


## 2026-11-07 retained-evidence review — scoped acceptance

[Run #42325087575](https://github.com/etblink/math/actions/runs/42325087575)
completed successfully at exact commit
`c1f309ca6de85b6f9e6c76a38254140e333fe819`. Artifact 13554134798 was
downloaded and reviewed: all 32 pinned inputs, 21 cold-build exit statuses,
21 log digests, 34 public-root reports, six completion markers and ten
exact-type consumers pass. All fifteen original logs are empty; all 42
dependency revisions match, and the compiler digest matches the previous
qualified gate. The four original whole-file recovery inverses also pass.

The [scoped acceptance](evidence/spectral-confinement-2026-11-06/massless-source-42325087575-acceptance.json),
receipt, full logs and separate source/consumer logs are retained alongside
the earlier evidence. Qualify the sixteen recovered source identities and
the single new `AlgebraData.massless_coreForm_energy` composition under
their explicit original-data hypotheses. This discharges the massless
charge/named-core-form presentation bridge, not all of P2, a concrete
paired instance, physical closed domains, confinement or eigenpair existence.

The new research memorandum changes prioritization: its qualitative route
can use the existing finite growth constant, so a sharp fermionic norm
constant is optional. The next proposed formal test is the separately
chartered [source nine-vector reflection-pair gate](BFSS_SPECTRAL_SOURCE_NINE_REFLECTION_PAIR_GATE_2026_11_07.md),
not an assumed spectral consequence of this accepted identity.
