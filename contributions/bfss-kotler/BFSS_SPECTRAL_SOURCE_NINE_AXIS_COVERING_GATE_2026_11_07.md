# Original source ninth-axis stabilizer: bounded covering gate

Status: CANDIDATE; strict source and independent consumer qualification pending.
Exact parent: `2bbc67c4f15207dfb87c07a05e33dc8cebbafadb`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.

## Qualified inputs and mathematical scope

The actual original stabilizer projection and its exact two-sign fibers/kernel
qualified at tested commit `d8ff8d32982a341d39745360a2b1b434f305e6f8`, run
[42448494747](https://github.com/etblink/math/actions/runs/42448494747).
Original-source path connectedness, compactness and the restricted original
SO(9)-projection continuity qualified separately in runs 42426258689,
42429216538 and 42435908276. This gate composes those results without changing
their declarations or adding a mathematical premise.

Use EXACTLY the subgroups from FCP.BFSSSourceNineAxisProjection:

```lean
K := source9Axis8SpinStabilizer
H := source9Axis8MatrixStabilizer
p := source9Axis8ProjectionHom
```

Here K consists of original g : spinGroup source9Quadratic fixing the original
source9CoordinateVector 8 under source9SpinVectorRepresentation. H consists of
the actual source-labelled SO(9) matrices fixing that same vector. The map p
is the original source9SpinVectorSpecialOrthogonalHom restricted to those exact
carriers. Neither H nor K is replaced by an abstract SO(8) or Spin(8) model.

Retain the qualified PBW-coordinate topology on the original Clifford algebra,
its inherited original Spin subgroup topology, and the inherited stabilizer
subgroup topology. Enable only the existing source9PBWNormedAddCommGroup and
source9PBWNormedSpace values, locally. CompactSpace, PathConnectedSpace and
IsTopologicalGroup results are named theorem values; their proof consumers use
local let bindings when a typeclass premise is needed. No new global instance,
topological-space definition, norm or action is introduced.

## Exact proposed theorem boundary

The new namespace is FCP.BFSSSourceNineAxisCovering. Its twelve public roots
transfer CompactSpace K, PathConnectedSpace K and IsTopologicalGroup K, prove
continuity/closedness/quotient-map status of p, prove kernel finiteness,
discreteness and cardinality, and state:

```lean
source9Axis8ProjectionHom_isQuotientCoveringMap_pbw :
  IsQuotientCoveringMap (source9Axis8ProjectionHom : K → H)
    source9Axis8ProjectionHom.ker

source9Axis8ProjectionHom_isCoveringMap_pbw :
  IsCoveringMap (source9Axis8ProjectionHom : K → H)

source9Axis8ProjectionHom_fiber_ncard (A : H) :
  {g : K | source9Axis8ProjectionHom g = A}.ncard = 2
```

All roots are unconditional on these literal carriers. There is no covering,
quotient, continuity, compactness or discreteness hypothesis assumed from a
consumer. The kernel group action in the first theorem is the existing subgroup
multiplication action on K. No Fock-vector or Fock-operator lift is involved.

## Inspected proof architecture

1. Transfer compactness and path connectedness to the bundled subgroup carrier
   by definitional equality with the already qualified literal subtype.
2. Locally supply the qualified source9Spin_isTopologicalGroup_pbw and use
   Mathlib's inherited Subgroup topological-group structure for K.
3. Give an explicitly typed SO(9)-valued continuous map on K from the qualified
   source9Axis8Stabilizer_vectorSO9_continuous_pbw. Apply subtype_mk to obtain
   continuity into H. The underlying function is definitionally the unchanged p.
4. Compact K and Hausdorff H make this continuous map closed. Combine closedness,
   continuity and the qualified genuine target surjectivity to obtain a quotient
   map. The parameter quotient theorem is not substituted for this projection.
5. Rewrite the ACTUAL kernel carrier with the qualified pair theorem. Singleton
   finiteness followed by finite insertion proves finiteness; in the inherited
   Hausdorff source topology, finite sets are discrete.
6. Apply the pinned monoid-hom quotient-covering criterion with that discrete
   actual kernel and the qualified source topological group. Its isCoveringMap
   consequence is the proposed covering theorem.
7. Separately use exact two-sign fibers and their distinctness to prove every
   fiber has cardinality two. This argument does not assume a covering theorem;
   the set-theoretic fiber count alone is not offered as a covering proof.

Pinned Mathlib revision: `d13f23b723b8a846827a245b89c10fc7d3f11612`.
Inspected primary declarations:

| File and Git blob | Interface used |
| --- | --- |
| Topology/Algebra/Group/Subgroup.lean, `ceab93a581fca840ad52cd60c0aa59baf45dcbef` | Inherited IsTopologicalGroup S for a subgroup of a topological group |
| Topology/Maps/Basic.lean, `363703f1c317ab357689082bc3ba98132f3f1cfa` | IsClosedMap.isQuotientMap with explicit continuity and surjectivity |
| Data/Set/Finite/Basic.lean, `40f8afca47062f1c7b3bcb90fe17761ceb927773` | finite_singleton and Set.Finite.insert |
| Topology/Separation/Basic.lean, `2d39660bfd78f367e80c7ee07b36871de306e3f2` | Set.Finite.isDiscrete under T1Space |
| Topology/Covering/Quotient.lean, `c82fdbbdefcc9d0ccaa3c8de9fe4e783a1916150` | Topology.IsQuotientMap.isQuotientCoveringMap_of_isDiscrete_ker_monoidHom; IsQuotientCoveringMap.isCoveringMap |
| Data/Set/Card.lean, `2028a5bbeb5ef5b207a08ccc2c5c375fa215d515` | ncard_pair, ncard_eq_two and definitional Nat.card_coe_set_eq |

The covering criterion requires an actual topological-group domain. It does
not require a separately installed topological-group target instance in its
displayed signature. H retains its actual matrix subgroup topology regardless.

## Independent consumers and failure conditions

The consumer imports only the new source. Its 26 examples check literal source
and target carrier equalities, original projection value and full vector action,
continuity into H and into the original SO(9), compactness, path connectedness,
an independently inferred subgroup topological-group value, closedness,
quotient-map status and its universal continuity test, finite/discrete exact
kernel, kernel cardinality two, quotient covering by that kernel, covering and
openness, arbitrary fiber set cardinality and Nat.card of the full fiber subtype.

The consumer also checks exhaustive distinct sign-related fibers, the genuine
negative central source and Clifford value -1, its distinctness from identity,
its identity projection, rejection of projection injectivity, and continuity
of inversion in the same original K. No local section or continuously chosen
Cartan factorization is claimed or assumed.

Reject a topology/carrier change, replacement projection, collapsed source signs,
one-point fiber, missing target, unproved compactness/continuity/covering premise,
diagnostic, unexpected axiom or resource failure. Preserve the first causal
failure and stop for an interface diagnosis before any bounded repair. Existing
negative knowledge applies: typed intermediate maps and explicit conversions
precede simplifier expansion or resource changes. No proof budgets may increase.

## Exact dependency closure and verification

The manifest is the exact union of the two qualified input source closures:
125 unchanged original modules and nineteen qualified inherited source modules,
including the earlier fixed-axis Cartan diagnostic as an already qualified
source dependency. The topology branch contributes its exact-eight,
gamma-faithfulness, source word continuity, connectedness and compact quotient
ancestry. The projection branch contributes the arbitrary-target Euclidean
bridge, original preimages and exact algebraic projection. Each listed module
is reachable from the new source imports; no old independent consumer or unrelated
donor package is imported. All inherited bytes and qualified pins are immutable.

The two new modules make 146 cold builds. Require 176 exact input pins,
192 strict axiom reports and 21 completion markers. Preserve all 27 shared
environment controls and replace only the new runner, test and workflow pins.
All sixteen inherited adversarial validator checks remain, including exact local
PBW setup and rejection of global or foreign instance registration. Each strict
module uses warningAsError and the same default proof resource limits.

Preserve Lean 4.34.1, all 42 package revisions, action pins, 600 seconds per file,
70 minutes for cold compilation, 35 minutes for restoration and the 110-minute
job. Remove every controlled BFSS proof object before rebuilding the complete
ordered closure. Retain exact proposed inputs, every compiler log, compiler and
environment hashes, dependency revisions, axiom reports and receipt even on red.
No BFSS proof-object cache, linter waiver or new mathematical axiom is permitted.
Only propext, Classical.choice and Quot.sound are allowed in root reports.

Local Lean startup remains unavailable in this execution environment. The
compiler is not modified or bypassed. Static preflight, Python/YAML/shell syntax
and validator tests prepare a candidate; only the complete strict CI source and
independent consumer PASS receipt at one exact tested commit qualifies it.
Confirm creation of one run, then await the owner's terminal report without
polling its result.

## Failed candidate and bounded alias repair

Run [42450508588](https://github.com/etblink/math/actions/runs/42450508588)
tested `8a457461ab73d16b8fce40e4a35c6bc9f6b357c7`. All 144 original and
qualified ancestor modules compiled, with zero original compiler warnings.
The sole strict source diagnostic was at line 102: Set.mem_setOf_eq is a
deprecated alias, and warningAsError correctly rejects its use. The independent
consumer was not reached. All twelve source reports listed only permitted
axioms, with no recovery axiom, but those reports and the completion marker
do not qualify a source compilation whose return code is nonzero.

The one-line repair replaces Set.mem_setOf_eq with Set.mem_ofPred_eq. Pinned
Mathlib Data/Set/Operations.lean, blob
`f5d18fca655f6bf3079f859060f3738b5f2bc089`, declares the successor as
`(x ∈ {y | p y}) = p x := rfl` and declares the former name as its deprecated
alias (since 2026-07-09). The exact logical rewrite is preserved. No theorem
type, carrier, topology, projection, mathematical hypothesis, import, independent
consumer, dependency revision, warning/linter control or proof budget changes.
Only the changed source's Git blob and SHA-256 manifest pins are refreshed.

The retained artifact
[13605434634](https://github.com/etblink/math/actions/runs/42450508588/artifacts/13605434634)
has verified ZIP SHA-256
`fe3909436e3a0a18f468422d1d2854d26bfbb1e54c6ce0c551016b0ad5fc9f16`.
All 176 archived input blob/SHA-256 pins, 145 ordered compiler-log digests,
nineteen strict inherited root/marker checks, and 42 package revisions were
verified against retained evidence. The INCOMPLETE receipt SHA-256 is
`997a8fe27ced9bbf669d3ca688f7e82ac6adf28adb8c0f71dbb14cf1924a7223`;
the failed strict source log SHA-256 is
`65524d80ccc79376cc0b6b3ad01c7848b4745a490ba9345be4e1e0efa3c86678`.
Object hashes are receipt records, not independently rehashed binary artifacts.

The candidate remains unqualified until the repaired source and every independent
consumer pass the unchanged strict gate at one exact tested commit. Preserve
this deprecation failure as negative knowledge; use the pinned successor rather
than suppressing deprecation diagnostics.

## Boundaries and next research stage

If qualified, this establishes a connected compact source group covering the
actual fixed-axis SO(9) matrix subgroup, with exactly two elements per fiber.
It does not identify H with coordinate SO(8), classify K as a separately
constructed Spin(8), or authorize triality-sensitive representation transfer.
The next separate milestone is the coordinate-exact topological group equivalence
from H to SO(8) on original coordinates 0 through 7, preserving the actual vector
projection. Its last-row/column, block multiplication and determinant interfaces
must be audited before implementation.

Source torus/root-data binding, B4/D4 branching, complex Fock-operator action,
physical domains, coercivity, confinement and positive eigenvalue existence
remain separate unproved obligations. No physical spectral claim follows here.
