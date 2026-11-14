# TD-C1A — original gauge full-48 source Majorana intertwiner (prospective)

**Date:** 2026-11-13 Pacific. **Status:** PENDING FULL STRICT TEST, no source theorem qualified merely by staging.

## First top-down mathematical gate

Original `C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.lean` blob `4d418ade58f8c3c1d998f623f5a5697723cb3d29` already proves the genuine G4E SU(2) Fock-vector unitary covariance for each of the literal source 48 real Majorana coordinate axes. The new theorem `originalGaugeUnitary_S1J_gamma_allVector_forward` extends exactly that statement to arbitrary `Source48Vector` using two real-linear maps and `Pi.basisFun` extension; no 48-Majorana matrix is rebuilt.

The genuine original color source is `FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix`; the genuine original normalized Fock Majorana map is `FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear` and original implementing unitary `FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom`. The original `sourceBlockColorEquiv` reindexing is retained; no color/spin swap or sign modification.

## Core scientific necessity

The Nov. 11 internal BFSS monograph (ed. 0.4, Chapter 9) and Nov. 12 gauge-projection shortcut identify the source Spin(9) Fock-algebra star automorphism and source `S1H` gauge-implementation uniqueness. To apply `S1H` to the conjugated gauge operators, we first need source-exact gauge covariance on every original 48-vector, not merely a finite list of informal axes. This microgate supplies one side of that future proof-DAG join.

**This theorem alone does not establish** that the Spin(9) star automorphism fixes the gauge operators, that the original fermionic gauge projection is Spin-invariant, or that a continuous Spin(9) Fock-vector action exists. It does not imply original physical-space reduction, sixteen-charge covariance, a ground-state theorem, or a spectral gap.

## Strict contract

- Exact source and native independent consumer cold compile, pin Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
- Freeze original Core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, original `C48C1A1d0` `4d418ade58f8c3c1d998f623f5a5697723cb3d29`, original `C48C1A0` `4c9a7d183e65d13b33ab9694653f3e0a74741747`, original OP3C6C `2d6f777568b0026737112ff8256e5ed50fc9e6e6`, and source S1H `eacab43f1b9112e9e1920e656bdf1166f824a5a8`.
- One root, exact original Fock-vector consumer, permitted axioms only `propext, Classical.choice, Quot.sound`; no sorry/axiom/unsafe or source substitution.
- Any RED first causal is preserved before repair; CI compilation and mathematical validity do not follow from this prospective note.
