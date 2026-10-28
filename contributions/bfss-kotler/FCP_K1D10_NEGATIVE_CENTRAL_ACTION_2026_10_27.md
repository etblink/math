# K1D10 — genuine original negative central Spin48 vector action

## Independent owner acceptance — 2026-10-28 UTC

**CURRENT STATUS: ACCEPTED — 57 scoped contributor modules, 61 selected declaration roots.** [Strict GitHub Actions run #40629007863](https://github.com/etblink/math/actions/runs/40629007863), job `122620713552`, attempt 1, concluded `completed/success` on exact tested source SHA [`009a4b4524c8199f0eea71912dd745acbf1f143c`](https://github.com/etblink/math/commit/009a4b4524c8199f0eea71912dd745acbf1f143c). The job requalified all **59 accepted antecedent roots** and both new K1D10 roots. Terminal marker `FCP_K1D10_NEGATIVE_CENTRAL_ACTION_STRICT_PASS modules=1 roots=2`; only `propext`, `Classical.choice`, `Quot.sound` reported, with no Lean source compiler errors, warnings or `sorryAx`. [Immutable compiled-verification artifact #12791585498](https://github.com/etblink/math/actions/runs/40629007863/artifacts/12791585498) preserves compiler and theorem-type reports.

The source-exact original Spin48 vector action is now proven to equal Clifford-star conjugation of the original generators, and the genuine negative-central Spin element is proven to act trivially on *every* original source vector. The initial [red run #40627931241](https://github.com/etblink/math/actions/runs/40627931241) is retained as negative knowledge; its repair was a precise inverse type annotation, not a theorem-statement change. The historical candidate and repair material below is superseded as a status report but retained for auditability.

**Not yet qualified:** full pointwise-stabilizer/two-sign set equality, identity action and sign distinctness at the new K1D11 proof roots. A formally defined homomorphism to SO(48), its covering/double-covering interpretation, global Spin(9) lift, and BFSS spectral existence remain separate.

**Runtime note:** the observed 11m 54s run duration was dominated by dependency restoration and fresh ancestor requalification. Optimization must not weaken source pins, fresh-compilation conditions, or root-level axiom audit.

### Archived pre-acceptance handoff


## Gate 1 failure and statement-preserving repair — 2026-10-28 UTC

**GATE 1 RED / NO K1D10 ACCEPTANCE:** [strict run #40627931241](https://github.com/etblink/math/actions/runs/40627931241), job `122617240801`, tested exact original source SHA [`42362c32f78b46a56795d539af0c6885b9ea9717`](https://github.com/etblink/math/commit/42362c32f78b46a56795d539af0c6885b9ea9717). All **59 accepted ancestor roots passed independently**; failure was strictly localized to first K1D10 declaration line 34, column 44: `error(lean.synthInstanceFailed): failed to synthesize instance of type class Inv C`. The source expression `(s⁻¹ : C)` demanded an inverse on the arbitrary Clifford algebra, not the existing spinGroup group inverse. The candidate compiler emitted `sorryAx` for both new declarations, so **neither** was accepted. Preserve exact [failed-run evidence artifact #12789964867](https://github.com/etblink/math/actions/runs/40627931241/artifacts/12789964867).

**GATE 2 REPAIR CANDIDATE:** Re-type only the inverse as `((s⁻¹ : spinGroup Q) : C)`. Pinned Mathlib `spinGroup` has an actual group inverse implemented via `star`; this aligns with the actual `spinGroup.toUnits` map and avoids introducing an `Inv C` assumption. Both theorem statements, original source representation, proof dependencies, source-defined quadratic form, and allowed axiom policy remain unchanged. New Lean Git blob `659edfc3998fc078085ec376f61481164f61edf0`; new strict verifier blob `2e92a944eab4680d092e531978760bd572315013`. This repair has **no acceptance** without an independently completed strict run and original axiom reports.

**Accepted baseline remains 56 owner contributor modules / 59 selected declaration roots**, regardless of red K1D10 runs. The original source-vector action of negative central Spin, the full two-sign group kernel, covering, global Spin9, and BFSS spectral existence remain separate.

### Original pre-Gate-1 research charter


**CANDIDATE; NOT YET ACCEPTED BY INDEPENDENT CI.** Owner research branch `research/fcp-k1d10-negative-action-20261027` is a one-commit descendant of qualified `research/fcp-k1d9-negative-spin-20261027@df624017f88678f86167125e4715adc7491e1a4f`.

## Accepted mathematical starting point

**56 owner contributor modules, 59 selected declaration checks** are qualified. K1D9 passed [strict run #40626355158](https://github.com/etblink/math/actions/runs/40626355158) at exact tested source SHA `eeffeade763346c5a8a1278224ef492fb3da48a3`. It proved that the actual original negative Clifford unit `-1` is in `spinGroup source48Quadratic`, with the exact original unit-weighted 48-real quadratic form and source Clifford generators.

K1D8's already accepted result is only the **upper bound**: if a Spin48 element fixes all source real vectors, its original Clifford value is 1 or -1. It did not establish that the *actual* negative-central Spin element fixes all source vectors.

## Exact candidate statement and proof plan

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D10OriginalSpin48NegativeCentralTrivialActionProbe.lean` pinned Git blob `d0a06f78390b8048eb83233bcdd4bd96f59eb987`.

1. `FCP.BFSSS1V52K1D10.originalSourceSpin48VectorAction_clifford_star` identifies the **actual S1V31 source action** on the injective original Clifford generators with conjugation `(s : C) * ι Q v * star (s : C)`. The inverse is source-exact via pinned Mathlib `spinGroup.toUnits`, `spinGroup.star_eq_inv`, and `ConjAct.units_smul_def`. No independent replacement action is introduced.
2. `FCP.BFSSS1V52K1D10.originalSourceSpin48_negativeCentral_trivialAction`: construct the actual source Spin subtype from K1D9's unconditional `-1` membership proof and prove it fixes all original Source48Vectors. Transport equality via accepted S1V30 injectivity of the source `CliffordAlgebra.ι`.

The first declaration may expose non-definitional coercion differences between `spinGroup.toUnits` and `star`; do not promote until strict Lean confirms it. On failure, diagnose exact elaboration/type errors rather than increasing heartbeats or postulating the conjugation formula.

## Owner qualification and preservation

Workflow `.github/workflows/bfss-kotler-k1d10-negative-central-action-owner-strict.yml` pins the candidate source and verifier `contributions/bfss-kotler/tools/qualify_fcp_k1d10.py` (Git blob `212543b427bacd324fd4c58c565c4d69fa90c77f`) with Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and previously admitted source hashes. The job freshly requalifies 59 accepted declaration roots and demands strict compilation, a real `.olean`, two exact axiom checks with only `propext`, `Classical.choice`, `Quot.sound`, and root types. Preserve original compiler logs and all failure/acceptance artifacts.

**Fail closed:** Red or incomplete run is negative evidence, not acceptance. Only a completed independent green qualifies K1D10 and advances the contributor count from 56 to 57, selected declaration roots from 59 to 61.

## Explicit exclusions and upstream plan

K1D10's negative action result, even if accepted, must still be composed with K1D8's upper bound and `1` action in a later theorem to obtain the precise **group-level kernel equality**. Distinctness of ±1 and the final map's group law, its SO48-target mapping, covering and global Spin(9) lift remain separately tracked. No owner `main` merge or upstream PR is authorized. For the eventual community PR, preserve this owner evidence but prepare a clean minimal proof/dependency bundle from the then-current `mathcommunity/oai-math-revised:main`, with full software-assistance disclosure.
