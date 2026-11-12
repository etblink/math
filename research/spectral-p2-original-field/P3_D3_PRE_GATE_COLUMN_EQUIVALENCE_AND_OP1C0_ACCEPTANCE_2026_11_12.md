# P3-D3 pre-gate receipt and OP1C0 strict-green acceptance — 2026-11-12

**Project Lead decision:** GO, one isolated D3 original-Fock column equivalence.
**Branch:** `integration/bfss-unified-research-20261108`.
**D3 status:** CANDIDATE until exact cold strict-green. No FCP canonical or physical-Hamiltonian change.

## Accepted prerequisites and negative evidence

- T1 `originalFockEndAlgEquiv` is the genuine
  `Module.End ℂ (Fermion 2) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`,
  blob `3be6c9a6f2898484df66690f94fdfa1877660897`;
  [strict #42769361446](https://github.com/etblink/math/actions/runs/42769361446).
  D3 **DIRECTLY imports** T1.
- OP1A pairing invariant, blob `b79f4230dc03670f4b3fffc425a0cc283688a7c6`,
  [green #43263788066](https://github.com/etblink/math/actions/runs/43263788066).
  OP1B source trace-to-columns, blob `768e6557415816beefe1d0bf5ddae468d3a82452`,
  [green #43271525095](https://github.com/etblink/math/actions/runs/43271525095).
  These qualified declarations remain preserved, not re-proved in D3.
- OP1C0 source real-part positivity, blob `7be61572588c638da0e1964c5574fc7f9161c2e6`;
  independent consumer blob `6d1307aa5363a91c4c208c98354ab9c25f11a1ac`.
  [Green #43282964940](https://github.com/etblink/math/actions/runs/43282964940),
  tested `199f9f252dc2ae577d32e6de46b2daab44205c1c`,
  job `131408841467`, artifact `13974548367`,
  SHA256 `b8c661055715538df7f63e2f6f25d9459ce973dee9cd12e288277fab057406de`.
  Accepted 61 source+consumer pins, cold build, independent consumer and
  standard allowed `propext`, `Classical.choice`, `Quot.sound` axioms.
  Historical reds #43275220286 (implicit argument) and #43278998368
  (Fock-sized recursion) resolved via an abstract typed positivity helper.
  D3 does NOT depend mathematically on OP1C0 positivity.

## Exact source/API discovery and novelty

Toolchain Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
`OrthonormalBasis.toBasis`/`coe_toBasis` in pinned
`Analysis/InnerProductSpace/PiL2.lean` (480–485);
`Basis.constr`/`constr_symm_apply`/`constr_basis` in pinned
`LinearAlgebra/Basis/Defs.lean` (508–545);
`Module.End.toContinuousLinearMap` in pinned
`Topology/Algebra/Module/FiniteDimension.lean` (314–320).

**Precedent, METHOD ONLY:** `OAI.NumberTheory.ArithmeticGroups.Lattices.EndomorphismHilbertSchmidt`,
blob `10d8c30c750ef3f5eb240f1f13e2d8f4f5109c24`,
already composes finite-continuous operator inverse and `Basis.constr`
in REAL coordinates. This is not the BFSS complex carrier.

**Later candidate, no import here:** `OAI.RowColumn.hilbertSchmidtSq_eq_sum`
and `norm_sq_le_hilbertSchmidtSq`, blob
`0fd282a5d4e54733288b267dfd7916302a7968fb`.
Source inspected under the 11/08 proof-reuse, 11/09 Interface-First,
11/10 Proof-DAG-First and 11/12 pre-gate protocols; not an exhaustive
all-branch/FCP scan.

D3's single NEW type-level connection is
`(Fermion 2 →L[ℂ] Fermion 2) ≃ₗ[ℂ] (ι → Fermion 2)`
for arbitrary finite original `b : OrthonormalBasis ι ℂ (Fermion 2)`,
constructed by `originalFockEndAlgEquiv.symm.toLinearEquiv.trans
((b.toBasis.constr ℂ).symm)`.
Prove `originalFockColumns b T i = T (b i)`.
Independent consumer checks inverse column realization and
`(∀ i, T (b i) = 0) → T = 0`.

## Gate contract, stop rules and scientific ceiling

One source file, one independent consumer, one isolated strict workflow.
Freeze all original **61 OP1C0 historical blob pins**, add exactly two
D3 blobs (**63**); pinned toolchain, cold source build, warning-as-error
consumer and `#print axioms` roots, retained diagnostic/artifact.
No edits to accepted source, workflow, main, or physical definitions.
Red: inspect first cause; two substantively similar elaboration failures
require architectural review, never larger recursion/heartbeats.

D3 does NOT establish a Hilbert–Schmidt norm or norm equivalence,
trace definiteness, continuous source Spin(9), source SU2 left-output
compatibility, original physical `L²` columns, exact closed Hamiltonian
domains, point spectrum or a mass gap. Those remain separately gated.
