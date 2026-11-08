# BFSS Lean proof reuse and failure-learning playbook

**Accepted project operating procedure — 2026-11-08.**  
**Scope:** `etblink/math` BFSS research; for our *future project sessions*.  
**Location:** `research/bfss-original-gamma-faithfulness-20261107`.  
**Scientific status:** A procedural reference only; it is **not** a new Lean proof or an independent qualification. Mathematical claims below are qualified **only at the separately pinned source commits and strict CI runs**.

> Preserve results, not theories; preserve negative knowledge. Seek exact source fidelity and make each successfully qualified proof easier to reuse. No independent human cold-start usability test is required.

## Decision: seven improvements, one lightweight operating loop

We adopt the following **capabilities as a single process**, not seven new infrastructure projects:

| Capability | Minimum practical action | Do not infer |
| --- | --- | --- |
| Proof-first retrieval | Search H1, prior theorem declarations, pinned Mathlib APIs, and failure records before coding | Similar syntax proves type-level compatibility |
| Reusable mathematical interfaces | Extract a general lemma only after a real second consumer needs it | An abstraction replaces the original physical carrier |
| Tiny proof experiments | Run the smallest possible type/API check before another expensive cold BFSS gate, where feasible | A local experiment qualifies the final source module |
| Declaration-level dependency view | Track exact theorem prerequisites and original-source adapters where bottlenecks recur | Import adjacency implies mathematical dependency or a valid theorem |
| Failure-to-remedy catalogue | Record red run, first causal goal, bad method, corrected precedent, and remaining uncertainty | Any red reveals a false physical claim |
| Explicit module proof contracts | Document type, normalization, source identity, exact accepted outputs, excluded claims | Concrete `Fermion 2` operators instantiate `AlgebraData.theta` automatically |
| Efficiency evidence | Compare verified scientific leverage, retry cost, compile surface, and reusability | The fewest lines, fastest green, or smallest build is always best |

**Prioritization:** start with retrieval, successful proof patterns, red-to-remedy records and a concise pre-proof check. Do not add a new service, CI workflow, separate repository, autonomous state machine, bulk index or general abstraction unless repeated real use justifies it. This is infrastructure in service of mathematical work.

## Standard pre-proof operating contract (for each new bounded gate)

1. **State the exact theorem contract:** physical source carrier, operator type, index convention, norm/sign factor, assumptions, mathematical conclusion, and explicitly *not* established claims. Identify existing accepted theorem/consumer interfaces before writing a replacement.
2. **Retrieve before inventing:** run `python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --search "CAR Fock bivector composition"` or adapt the query; inspect exact source with `git show <qualified-SHA>:<path>`. Search local Lean declarations, prior red-run notes, and pinned Mathlib source at the exact version. Prefer qualified precedents, but verify each exact imported signature.
3. **Resolve API uncertainty cheaply:** when the obstacle is a tactic or typeclass issue, prove a tiny lemma over the exact implicated algebra/module (e.g. `Fermion 2 →L[ℂ] Fermion 2`) before launching an expensive full target gate, when local Lean is available. If local Lean is unavailable, use pinned Mathlib source inspection and one bounded diagnostic CI instead. No local experiment substitutes for strict source qualification.
4. **Implement the smallest composable source proof:** reuse existing original definitions, isolate an exact imported lemma rather than a parallel surrogate, preserve physical normalization, and add an independent consumer. Generalize only if another concrete theorem would reuse it.
5. **Qualify fail-closed:** exact tested commit, pinned Lean/Mathlib, immutable source identity, cold build, source and independent-consumer elaboration, warnings, explicit axiom reports, retained digest. No `sorryAx`, warning suppression, broadened premises or silent source substitution to manufacture green.
6. **Harvest the lesson and move on:** preserve accepted theorem, run/digest, type-level technique, reused module contracts, first red causes, tested remedy, and smallest next open obligation. Update H1 for actual new *qualified* source bundles, not every draft or tactic experiment. Keep rejected attempts discoverable without treating them as accepted.

**Escalation trigger:** after two closely related reds, stop guessing new `simp` sets. Compare normalized goals and precedent proof terms, inspect *the exact pinned Mathlib APIs*, and consider a proof-shape change. Prefer a specific mathematical lemma or exact module rewrite to broad tactic churn.

## Qualified working patterns (immutable precedents)

### P1 — Preserve original delta-one CAR and specialize its scalar result explicitly

- **Goal signature:** `majoranaCandidate p * majoranaCandidate q + majoranaCandidate q * majoranaCandidate p = 0` for `p ≠ q`, at `Source48Label = Fin 24 × Fin 2`, operator ring `FockOp = Fermion 2 →L[ℂ] Fermion 2`.
- **Source:** [F1A proof at its qualified commit](https://github.com/etblink/math/blob/b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1AOriginalThetaBivectorCommutator.lean); [strict gate #42533991101](https://github.com/etblink/math/actions/runs/42533991101).
- **Working shape:** obtain `majoranaCandidate_car p q`; specialize `if p = q` via `ite_eq_right hpq` **without** prematurely rewriting the scalar output; then explicitly compose with `zero_smul ℂ (1 : FockOp)`. The diagonal `p=p` case uses `simpa using ...` on the same original source theorem.
- **Avoid:** replacing `θ` with `√2 θ` to simplify Clifford squares, and generic `simp only` that leaves `0 • 1` unresolved. Also avoid deprecated `if_neg`/`if_pos` names in this Lean version.
- **Reuse check:** correct `Fermion 2` carrier and original CAR law `\{θ_p,θ_q\}=δ_{pq} I`; the normalized unit Clifford generators are a *different* interface.

### P2 — Continuous-linear-map composition-negation via the real Mathlib API

- **Goal signature:** for `a b : Fermion 2 →L[ℂ] Fermion 2`, show `a * (-(a*b)) = -(a*(a*b))` or `(-(a*b))*b = -((a*b)*b)`.
- **Source:** F1A, same exact qualified [commit](https://github.com/etblink/math/commit/b5a875923e467f1aa596f8cd12e6acf5dfa7fb8f) and run.
- **Working shape:** `change a ∘L (-(a ∘L b)) = -(a ∘L (a ∘L b))`; apply **`ContinuousLinearMap.comp_neg`**. For the reversed occurrence, use **`ContinuousLinearMap.neg_comp`**. Then finish the additive calculation with source-exact `rw [mul_assoc, add_mul, mul_add]` and `abel` as appropriate.
- **Pinned API:** `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` at Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; the `ContinuousLinearMap.mul_def` representation identifies multiplication with `∘L`.
- **Known failures:** [#42532370775](https://github.com/etblink/math/actions/runs/42532370775) — `noncomm_ring` left `-1 •`/`2 •` goals; [#42533094586](https://github.com/etblink/math/actions/runs/42533094586) — generic `simp only [mul_neg, neg_mul, ...]` failed to commute negation through CLM composition and caused unused-argument warnings.
- **Reuse check:** these are results for continuous linear map *composition*, not assumed identities for an arbitrary unrelated multiplication.

### P3 — Transport original vacuum nonzeroness through a source equivalence

- **Goal signature:** `fermionVacuum ≠ (0 : Fermion 2)`.
- **Source:** [OP2c qualified source](https://github.com/etblink/math/blob/f84d092b2c71099cda790ee64083b5b81eb360d9/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean); [strict #42530241914](https://github.com/etblink/math/actions/runs/42530241914).
- **Working shape:** unfold the exact source vacuum `fockAlgebraToBFSS (1 : Space 23)`; use `fockAlgebraToBFSS.injective`, `map_zero`, `one_ne_zero`. For fixed-space nontriviality, reuse the already proved gauge action, `mem_gaugeFixedSubspace_iff`, and `Submodule.starProjection_eq_self_iff`; do not rederive projection theory.
- **Failed method:** [OP2c red #42528690361](https://github.com/etblink/math/actions/runs/42528690361) compiled the mathematics but the warning gate rejected deprecated `ContinuousLinearMap.zero_apply`. The warning-clean repair used `zero_apply`; do **not** weaken linter policy.
- **Reuse check:** no conclusion about nonzero *full bosonic L² physical states*, source Spin(9) covariance, or a BFSS mass gap.

### P4 — Source-faithful adapters between verified algebraic interfaces

- **Goal signature:** from the literal original `GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)` obtain the exact `Module.End ℂ (Fermion 2)` representation, bounded operators, canonical orthogonal fixed projection, and properties.
- **Source:** [OP2a](https://github.com/etblink/math/actions/runs/42525538193), [OP2b](https://github.com/etblink/math/actions/runs/42527245991) — separately qualified under exact commits listed in H1.
- **Working shape:** preserve genuine G4-E source action; prove pointwise equality of converted interfaces; instantiate the already-qualified OP0 projection rather than redefining it. Keep original physical carrier and nonzeroness as *separate* proof obligations.
- **Reuse check:** a finite-dimensional Fock fixed-space projection is not an original bosonic physical (L^2) projection; exact `AlgebraData.theta` instantiation remains an independent unproved obligation.

### P5 — Original Fock gamma normalization

- **Goal signature:** original `θ` delta-one CAR versus normalized `√2 θ` unit-square Clifford gamma.
- **Source:** `SU2BFSSSource48NormalizedFockGammaProbe.lean` and the F1A literal-θ proof. See [Fock integration memorandum](BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md).
- **Working shape:** reuse concrete CAR, expose scalar coefficients in separate equalities, then normalize *at the interface where a normalized Clifford relation is actually required*. Do not change `θ` definitions, conventions or signs to satisfy an unrelated target.
- **Qualification note:** the older gamma source was inspected and successfully built as ancestry in F1A's gate; this playbook does **not** make a separate claim that every gamma declaration independently passed a full strict consumer/axiom gate.

## Failure-to-remedy quick index

| Run / class | Actual failing layer | Verified remedy or status |
| --- | --- | --- |
| [#42532370775](https://github.com/etblink/math/actions/runs/42532370775), **Lean source proof RED** | Deprecated condition rewrites, `0 • 1` coercion, `noncomm_ring` on CLM composition | Diagnose actual operator/morphism type; not proof of a mathematical contradiction |
| [#42533094586](https://github.com/etblink/math/actions/runs/42533094586), **Lean source proof RED** | Off-diagonal scalar zero still open; generic `simp only` fails through CLM composition | [F1A #42533991101](https://github.com/etblink/math/actions/runs/42533991101) **GREEN** via explicit zero scalar step, `comp_neg`/`neg_comp`, and additive rewrite |
| [#42528690361](https://github.com/etblink/math/actions/runs/42528690361), **strict warning RED** | Deprecated `ContinuousLinearMap.zero_apply`; math already compiled | [OP2c #42530241914](https://github.com/etblink/math/actions/runs/42530241914) **GREEN** with one-line `zero_apply`, unchanged statement |
| [#42515890832](https://github.com/etblink/math/actions/runs/42515890832), **workflow/CLI RED** | Unsupported `--werror` assumption | [OP0 #42516531636](https://github.com/etblink/math/actions/runs/42516531636) **GREEN** with explicit version-appropriate warning checks |
| [#42524110865](https://github.com/etblink/math/actions/runs/42524110865) and [#42524190259](https://github.com/etblink/math/actions/runs/42524190259), **bookkeeping RED** | Generated workflow index self-reference, then accidental escaped newlines in source | [H2 #42524327310](https://github.com/etblink/math/actions/runs/42524327310) **GREEN** after deterministic self-reference normalization and source-line repair |

Distinguish **RED because a proof did not elaborate**, **RED because a successful proof emitted forbidden warnings**, **RED because infrastructure failed**, and **RED because the theorem is actually refuted**. The latter requires independent mathematical evidence; never infer it from the other three.

## Lean proof contracts and generalization policy

For each mathematical module, keep a short header: (1) source carrier and normalization, (2) imported prerequisites, (3) accepted declarations and exact consumer when qualified, (4) explicit open claims, (5) tested run and source commit, or `CANDIDATE` if not qualified.

Before generalizing a particular proof into a library lemma, require a concrete second consumer or a demonstrated repeated source-level bottleneck, plus a strictly independent proof/consumer path. Do not use a new abstraction as a surrogate for a physical source bridge.

If only a little time or usage remains, prefer **one accurate source/API lookup and a well-scoped next proof contract** to repeated speculative expensive CI. No default-branch writes, branch deletion, rebase, package-pin changes, or source theorem premise weakening.

## Next mathematics, not housekeeping

F1A's two original-label bivector commutator signs are now qualified at [#42533991101](https://github.com/etblink/math/actions/runs/42533991101). The next bounded F1 task is **`star (θ_p * θ_q) = -(θ_p * θ_q)` for `p ≠ q`**, followed by the third distinct-label commutator. Use the original self-adjoint `majoranaCandidate` source and the accepted F1A CAR precedent; require a fresh independent consumer and strict gate.

The **upstream `AlgebraData.theta` identification, irreducibility, complete `so(48)` Lie action, Spin(9) lift, gauge commutation, physical form/domain and any spectral claim remain OPEN**.
