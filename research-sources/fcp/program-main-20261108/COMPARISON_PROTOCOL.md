# FCP Common Comparison Protocol

## 1. Purpose

Every framework must be evaluated through the same protocol. Framework-specific vocabulary may be translated for clarity, but the comparison burdens may not be relaxed or strengthened selectively.

## 2. Pre-registration boundary

Before substantive scoring begins for a framework or comparison:

1. freeze the source set or declare a bounded source window;
2. define the framework/version being evaluated;
3. define the null or weaker comparator;
4. define material equivalence notions;
5. list known model choices and empirical inputs;
6. state the questions to be tested;
7. state what would count as positive, negative, nonforcing, or unresolved evidence.

FCP-2 historically froze the framework-neutral K1–K10 coordinates, M1–M3 status metadata, E1–E5 equivalence classes, convergence-credit rules, and anti-retrofitting rule before the first cross-framework comparison. Those artifacts remain controlling for the historical semantics of FCP-1 through FCP-21. After explicit integration authorization, Method 0.2.0 governs future comparisons prospectively; it retains K1–K10 as required reporting coordinates and applies the active versioned relation/evidence/governance rules in `comparison_keys/` and `governance/`.

## 3. Ten mandatory analysis layers

### Layer 1 — Primitive assumptions

Identify objects, axioms, background structures, symmetries, dimensions, causal assumptions, state spaces, probability rules, and other inputs not derived inside the evaluated framework.

### Layer 2 — Derived mathematical structure

Identify what follows as theorem from Layer 1. Separate definitions, existence, uniqueness, equivalence-up-to-isomorphism, and computational evidence.

### Layer 3 — Model choices

Identify vacuum, compactification, representation, gauge, boundary condition, truncation, discretization, renormalization scheme, coarse-graining, initial condition, test language, or other selections not uniquely forced.

### Layer 4 — Physical-realization bridges

Identify maps connecting formal objects to spacetime, fields, particles, measurements, causal events, laboratory variables, or other physical quantities.

### Layer 5 — Dynamics

Identify whether the framework supplies a deterministic law, stochastic kernel, action/extremal principle, constraint/evolution system, sum-over-histories rule, or other selector of physical histories. Distinguish allowed transformations from actual evolution.

### Layer 6 — Observables

Identify how observables are defined, what is operationally measurable, whether the observable family is complete, and what equivalences are quotiented away.

### Layer 7 — Empirical predictions

Separate fitted inputs, retrodictions, consistency checks, postdictions, genuinely held-out predictions, and prospective risky predictions.

### Layer 8 — Falsification conditions

State what observation, theorem, countermodel, or incompatibility would count against the claim or framework at the declared scope.

### Layer 9 — Selection problems

Record every unresolved choice among multiple mathematically lawful possibilities: state/vacuum, dynamics, measure, realization, parameter, observable language, continuum limit, branch, or history.

### Layer 10 — Weaker-framework test

For each surviving result ask:

> Does the same result follow in a substantially weaker framework?

If yes, classify it `GENERIC_MATHEMATICS` or otherwise restrict framework-specific credit.

## 4. Allowed result classifications

Every result receives exactly one primary classification:

- `SOURCE_DERIVED` — follows from source-bound assumptions at the declared scope;
- `GENERIC_MATHEMATICS` — valid but equally available in a substantially weaker framework;
- `VALID_CONDITIONAL` — theorem/result valid only after named additional hypotheses;
- `MODEL_CHOICE` — supplied selection rather than derived consequence;
- `PHYSICAL_BRIDGE` — explicit bridge from formal structure to physical interpretation;
- `EMPIRICAL` — supported by declared observational/experimental evidence;
- `NONFORCED` — stated premises do not determine the claimed conclusion;
- `COUNTERMODELED` — explicit lawful countermodel defeats the strong claim;
- `OPEN` — materially unresolved at the declared source scope.

For prospective Method 0.2.0 work, these primary labels are accompanied by the separate relation/evidence/provenance/scope/lineage/target-conditioning/physical-realization/calibration/viability/independence/empirical/maturity axes defined in the active Method 0.2.0 governance files. The historical primary labels are not retroactively reinterpreted.

## 5. Credit discipline

A result contributes framework-specific convergence credit only if:

1. it is source-bound;
2. its assumptions are explicit;
3. the correspondence between frameworks is defined independently of the desired conclusion;
4. the structure is not merely generic;
5. any physical interpretation has an explicit bridge;
6. any empirical claim has a declared comparator and falsification condition.

Generic mathematics earns zero framework-specific convergence credit. Functional analogy does not qualify as strong convergence.

For prospective Method 0.2.0 analyses, this historical credit language is operationalized through separate axes rather than a scalar convergence score; consult the active Method 0.2.0 comparison architecture and relation/evidence rules.

## 6. Comparison output

A completed comparison should contain:

- source register additions;
- framework assumption/source-binding ledger;
- ten-layer and/or K1–K10 analysis as applicable;
- claim ledger rows;
- countermodels/negative results where relevant;
- convergence candidates;
- divergence/selection ledger;
- strict scope ceiling;
- recommended next test.

Prospective Method 0.2.0 comparisons must additionally include the active multi-axis claim record, typed comparator role(s), and both overclaim and over-subtraction checks required by the versioned governance specification.

## 7. Current operational state

The protocol remains active. Historical FCP-1 through FCP-21 retain the FCP-2/Method 0.1.0 semantics under which they were produced. Method 0.2.0 is now active prospectively after exact integration on canonical `main` and controls future comparison methodology unless later superseded through explicit governance.

Current live scientific/routing state is maintained primarily in `CURRENT_STATE.md`. `README.md` is the durable repository landing page; `FRAMEWORK_REGISTER.md` tracks live framework identities and bounded status; `SOURCE_REGISTER.md` tracks source/provenance bindings; `governance/FCP_METHOD_0_2_0_ACTIVATION.md` records the Method 0.2.0 activation event and activation-time routing context. Detailed historical scientific conclusions and provenance remain in their qualified versioned phase artifacts and handoffs.

Historical phase artifacts remain frozen as records of what was true at their phase. Live repository metadata must reflect the current project state without rewriting those historical records.
