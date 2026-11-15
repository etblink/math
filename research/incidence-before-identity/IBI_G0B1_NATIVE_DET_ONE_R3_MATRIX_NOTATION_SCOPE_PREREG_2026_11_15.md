# IBI G0B1 native determinant-one R3 — preregister single namespace-scope consumer correction

Date 2026-11-15 Pacific.
Status **PROSPECTIVE / UNQUALIFIED** until a new independent strict
CI run is verified on its exact tested SHA.

## First-causal evidence and narrowly defined fix

R2 [#43731870423](https://github.com/etblink/math/actions/runs/43731870423)
completed **RED** despite all 9,022 source cold-build jobs and
all seven original source standard-axiom audits passing.
The consumer at line 28 uses postfix `ᵀ` in the actual G3A
orthogonality conjunction, but omits `open Matrix`.
Parser error `unexpected token 'ᵀ'` precedes a Prop-vs-Matrix
mismatch. Original G3A module does open `Matrix Finset`.

**Only approved R3 repair:** insert one line `open Matrix` directly
after `open OAI.BFSSQuantum` in
`lean/diagnostics/BFSSIBIG0B1NativeDetOneIndependentConsumer.lean`.
Keep all three independent examples byte-identical otherwise:
(1) arbitrary original gauge det+1,
(2) arbitrary original gauge det+1 and exact G3A column orthogonality,
(3) a nonsymmetric `det=-1` reflection excluded from actual G3A image.
No weakening of any example or substitute standalone SO(3) model.

Update only the consumer blob pin in
`.github/workflows/bfss-ibi-g0b1-native-det-one-strict.yml`;
source stays byte-identical at
`0b82625932304f9e03f07850cef674689475fc09`,
other pinned original G3A/G1B/FIN-DET3/source-column donors unchanged.
Store R2 RED receipt and this preregistration in same atomic branch commit.

## R3 full strict exit criteria

New source+consumer exact pin preflight, Lean 4.34.1 / Mathlib
`d13f23b723b8a846827a245b89c10fc7d3f11612`,
9,022-job native source requalification (or equivalent exact pinned
fresh cold build), fresh warning-as-error source and separately compiled
consumer, all seven `#print axioms` roots exclusively
`propext`, `Classical.choice`, `Quot.sound`,
no `sorryAx`, explicit strict GREEN marker, preserved logs and
artifact. Until then the native det+1 proof is **NOT** a
full strict-qualified gate.

On R3 RED preserve first causal failure; if it is analogous to
consumer R2, apply two-analogous-consumer-failures architecture stop
instead of another speculative syntax patch. If it reveals a true
mathematical wrong sign or improper-reflection counterexample,
halt and preserve it. No loosening resource limits, axiom policy,
original source, integration, main, frozen FCP or original pilot.
