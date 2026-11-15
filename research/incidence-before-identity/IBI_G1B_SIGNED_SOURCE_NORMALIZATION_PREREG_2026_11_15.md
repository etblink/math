# IBI-G1B — preregister source-normalized signed triple bridge

Date: 2026-11-15 Pacific. Track:
`research/bfss-incidence-unified-20261114`.
Status: P0, prospective, NOT Lean qualified.

## Already accepted prerequisites

- G0A original `Boson 2` Gram invariance: strict #43689689837.
- G1A original `pairedAlgebraData.colorLie` inner triple
  SU(2) invariance: strict #43693100174.
- P2-C0 original normalized-Pauli structure constants:
  `FCP.BFSSP2C0OriginalPauliPotentialBinding.originalPauli_structureConstant`
  with the source's sign `+Real.sqrt 2 * FCP.BFSSSU2.epsilon3`.
- G1A original Fock pairing has literal
  `pairedAlgebraData_color A : pairedAlgebraData.color A =
  concreteAlgebraData.color A`.

## First bounded proof package

On the actual original `ColorVector 2`, derive
```text
pairedAlgebraData.structureConstant A B C =
  √2 * epsilon3 A B C.
```
Then for arbitrary original color vectors `u,v` prove the literal
source color Lie bracket is `√2` times the ORIGINAL
`FCP.BFSSSU2.colorCross`, in the original 0,1,2 color order:
```text
pairedAlgebraData.colorLie u v =
  √2 • WithLp.toLp 2 (colorCross (fun A => u A) (fun A => v A)).
```
Define the original-carrier oriented cross triple
```text
C_ijk(X) = inner_R(
  WithLp.toLp 2 (colorCross
    (fun A => X(i,A)) (fun A => X(j,A))),
  spatialColor X k).
```
Prove the *signed and nonzero-normalized* identity
```text
G1A.originalLieTriple X i j k = √2 * C_ijk(X).
```
A separate finite determinant expansion or source-basis witness
must certify that C_ijk is the conventional signed
`det(x_i,x_j,x_k)` in this exact index convention before calling
the endpoint a literal determinant theorem. The sign `+√2`,
not an absolute value, is essential; the normalized coefficient
must be proved nonzero.

The import graph must use the existing source-exact G1A and P2-C0
theorems; no new stand-in SO(3) action or alternate Pauli basis.

## Consumer and adversarial stop checks

- Independently compiled original-source consumer must use the
  signed normalization theorem on arbitrary
  `x : Boson 2` and three spatial indices, then check at least
  one nontrivial source consequence. Avoid consumers that merely
  restate an abstract surrogate identity.
- Explicit source orientation-positive and negative basis
  examples must be proved **before** claiming the full rank-three
  Gram-only counterexample formally. Cross-triple sign cannot be
  inferred from an unqualified abstract epsilon assignment.
- Exact Lean 4.34.1 and Mathlib
  `d13f23b723b8a846827a245b89c10fc7d3f11612`,
  frozen blob pins, cold build, warning-as-error, three
  named axiom reports or more if named additional roots,
  allowed only `propext`, `Classical.choice`, `Quot.sound`,
  no `sorryAx`.
- Stop after first causal RED; two analogous failures trigger an
  architecture review, not a resource-limit escalation.

## Claim ceiling and integration stop

This is a source-orientation-normalization bridge, not an
accepted source SU2→SO3 image-surjectivity theorem or
rank-split complete orbit classification. No scalar L² toy witness
automatically becomes original physical `FullL2` vector.
No physical ground state, Hardy theorem or ontology is claimed.
A strict green makes the individual theorem reusable, not the
whole incidence HEAD P3-promotable: it must still pass the
project's nontrivial downstream consumer, clean source bundle
and explicit owner-approved promotion audit.
