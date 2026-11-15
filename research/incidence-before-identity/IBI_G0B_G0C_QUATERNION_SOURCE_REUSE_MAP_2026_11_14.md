# IBI-G0B/G0C forward-research map — original quaternion route, not surrogate rotations

Date: 2026-11-14 Pacific. Track: read-only source investigation recorded
on isolated IBI research branch. **Not a Lean qualification, theorem of
physical ontology, or change to the active G9 spectral gate.**

## Newly recovered donor chain
1. `SU2BFSSG3AAdjointColorRepresentationProbe.lean` already proves
   `adjointColorMatrix_orthogonal` for the literal original
   `pairedAlgebraData` color rotation, with B=output and A=input.
2. `SU2BFSSPhysicalDomainS1V52C1OriginalNativeGaugeQuaternionCoordinatesProbe.lean`
   defines `originalNativeQuaternionCoords (g : GaugeGroup 2)` and states
   `originalNativeQuaternion_norm_one`, derived from original SU2.
3. `SU2BFSSPhysicalDomainS1V52L9C1OriginalPauliQuaternionTracePolynomialProbe.lean`
   defines `originalQuaternionAdjointPolynomial p` explicitly as a 3x3
   real polynomial in original normalized-Pauli quaternion coordinates.
4. `SU2BFSSPhysicalDomainS1V52C2CNativeSU2RealQuaternionMatrixBridgeProbe.lean`
   supplies the candidate whole-matrix reconstruction
   `originalNativeQuaternion_matrix_reconstruction`.
5. `SU2BFSSPhysicalDomainS1V52L9C3OriginalNativeColorAdjointMatrixBridgeProbe.lean`
   states the especially useful *exact native* identification
   `originalNativeAdjointColorMatrix_eq_quaternion`.
6. Prior `SU2BFSSPhysicalDomainL6H5E8TSourcePositiveIYColorRealRotationProbe.lean`
   derives a source Y-plane real rotation, a potential concrete sign-flip
   witness. It is not by itself a global image-surjectivity theorem.

These earlier module comments include STAGED/UNQUALIFIED warnings.
Do **not** automatically import them as certified donors merely because
they are present in the tree. Match every donor theorem to an exact
source+consumer green receipt before promotion.

## Proposed small proof DAG
**G0B-1:** In a generic real 4-tuple `p`, prove by exact
polynomial arithmetic that for the source quaternion coefficient
matrix `R(p)`,

```text
det R(p) = (p.a^2 + p.b^2 + p.c^2 + p.d^2)^3.
```

This formula is a candidate and should be independently checked with
explicit exact-integer positive and wrong-sign controls before Lean.
No group argument or physical projection is needed for the scalar
identity.

**G0B-2:** Audit and qualify the *literal* native source chain
`originalNativeQuaternion_norm_one` and
`originalNativeAdjointColorMatrix_eq_quaternion`, then combine
them with G0B-1 to obtain
`Matrix.det (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) = 1`.
Use source-coordinate order B=output, A=input. No unlinked textbook
SO3 definition or determinant-sign assumption.

**G0B-3:** Construct a nontrivial concrete
`g : GaugeGroup 2` with original G2A/G3A action sending a fixed nonzero
source color unit vector to its negative. Check full 2x2 special
unitarity and exact source adjoint coefficients. A finite abstract
rotation witness alone does not discharge this gate.

**G0C:** After G0B, prove that the exact G3A hom image is all SO(3).
Candidate methods: source-verified unit quaternions / SU2 covering, or
generation from source gauge curves and Euler decomposition. First
inspect pinned Mathlib APIs and audit original-source C2A/C2B/C2C
normalizations. Do not silently assume surjectivity from orthogonality.

## Scientific falsifiers and stop conditions
- An incorrect Pauli order, quaternion sign, transposed source matrix
  or nonunit quaternion disproves a naive bridge: preserve diagnostics.
- `det=1` plus orthogonality only shows image containment in SO(3);
  it does not establish surjectivity.
- A successful bosonic source classification is a *coarse orbit*
  theorem, not a full gauge groupoid or Fock/physical-Hilbert
  equivalence.
- An exploratory module or numerical polynomial check cannot be
  promoted without a separately qualified source+consumer proof.

**Recommended dependency order:** finish G0A strict qualification,
then audit existing quaternion donor receipts before writing any new
G0B Lean consumer. Preserve the accepted G9 roadmap and avoid
duplicate source construction.
