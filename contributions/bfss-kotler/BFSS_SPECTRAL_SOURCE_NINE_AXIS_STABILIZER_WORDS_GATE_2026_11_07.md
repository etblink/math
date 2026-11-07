# Original source axis-stabilizer exact-eight-word gate

Status: CANDIDATE. The complete original-source iff and its independent consumer
require a separate strict run. Earlier structural success is not acceptance of
this original-source theorem.

Exact parent: `a9c84b0194f02304f45bc6ae37eec10dad8700fe`.
Branch: `research/bfss-original-gamma-faithfulness-20261107`.
Research input: BFSS_SPECTRAL_SOURCE_SPIN8_STABILIZER_FORWARD_RESEARCH_2026_11_07.md.

## Exact public result

Namespace `FCP.BFSSSourceNineAxisStabilizerWords`:

```lean
source9Axis8Stabilizer_perpendicularWord (g : spinGroup source9Quadratic) :
  source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8
  ↔ ∃ w : Fin 8 → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧
      (∀ i, w i 8 = 0) ∧
      (g : CliffordAlgebra source9Quadratic) =
        source9CliffordWord (List.ofFn w)
```

There is no new mathematical premise. All carriers, labels, the positive
quadratic form, embeddings, source Spin group, gamma map, vector action and
Clifford algebra are the existing original definitions. Ten supporting roots
prove the same-label axis-inner-product identity, normalization support,
supported Cartan factorization, reflection-word fixed axis, even-word fixed
axis, two-sign supported word, padding support, exact-eight list and the
original gamma8 commutator / supported-word equivalence.

## Route decision and source binding

Use Approach B. At the pinned fixed-space induction step, x = v - phi(v) lies
perpendicular to the entire current fixed space. The correction reflection
fixes the original axis and the next fixed space contains the previous one.
This retains the original ambient Euclidean space and product order. Approach A
would additionally require restriction, subspace-to-ambient reflection transport
and reassembly on the axis and perpendicular subspace; those interfaces are
unnecessary here. No new Clifford algebra is constructed.

The exact generic support lemma and its independent consumer passed diagnostic
42419684762 at a9c84b0194f02304f45bc6ae37eec10dad8700fe. That byte-identical
source is imported and cold rebuilt; it is not renamed or silently promoted
into an original-source identification. Its accepted evidence is recorded in
BFSS_AXIS_STABILIZER_RECOVERY_PLAN_2026_11_07.md, including both earlier reds.

The source composition makes the remaining obligations explicit:

1. The inner product with the transported original e8 is literally coordinate 8.
2. The checked generic nine-dimensional theorem applies to the actual original
   transported action because it fixes the nonzero original axis.
3. Delete zero normals and normalize the others using the unchanged accepted
   normalization. Prove perpendicular support survives this operation. Only
   then use actual ambient determinant +1 to establish even parity.
4. Return through the original same-label Euclidean equivalence. All normals
   now satisfy original Q = 1 and original coordinate 8 = 0.
5. Reuse the ordered even-list lift. The actual original two-sign fibers give
   g = h or g = source9NegativeCentral * h, hence the exact literal signed word.
6. Pad with repeated original e0 pairs to length eight before absorbing a
   negative sign in the first vector. Named list-case equalities transport
   unit, support, length and signed-word hypotheses together. This handles the
   identity/empty list and actual negative center. Negation preserves Q and
   perpendicular support.
7. Transport the entire dependent witness to Fin 8 by equality elimination.
   In reverse, the accepted even-list lift and subtype equality recover the
   original element; every perpendicular hyperplane reflection fixes e8.

Each native reflection product keeps the pinned multiplication convention:
the rightmost factor acts first. No list reversal or conversion of a single
positive Clifford vector into a Spin element is used.

## Independent consumers

Sixteen examples restate the exact iff, consume each direction separately,
test identity and the actual negative center with distinct gamma image -I,
test e0e1, derive the actual mixed e0e8 action e8 -> -e8 and exclude its
perpendicular-word witness, and test all parameters of the original (0,1) and
(6,7) plane rotors. Further examples check support-preserving first-factor
negation, literal neutral padding, an explicit eight-vector negative-central
word, the exact reflection-pair order, and original gamma8 centralizer binding.

Mixed-pair exclusion uses the independently derived original gamma/pair action,
not an assumed Spin(8) classification. Consumer proofs use no compiler-private
names from imported modules. Both central signs remain actual source elements.

## Exact closure and strict verification

The manifest has 167 pinned inputs: 125 original modules, ten checked inherited
source modules, two new candidates and 30 environment/verification controls.
The ten inherited sources are the structural Cartan diagnostic, Lipschitz
representation, orientation, reflection pair, unit Cartan, even-list lift,
signed word, exact-eight word, global gamma covariance and gamma faithfulness.
Each inherited source was matched against its existing qualification manifest.
The 135 ancestors include no OperatorDependencies. All are cold rebuilt.

The original Lean 4.34.1 toolchain, Mathlib
`d13f23b723b8a846827a245b89c10fc7d3f11612`, all 42 package revisions,
checkout/upload action pins and environment restoration mechanism are unchanged.
No BFSS proof-object cache is used. Delete all 137 controlled objects before
compiling. Compile the ten inherited sources and both candidates strictly, with
warnings-as-errors and default proof budgets. Require all 107 ordered axiom
reports, twelve exact markers, zero failed compiler exits, no recovery axiom,
and only propext, Classical.choice, Quot.sound. Preserve complete per-module
logs, source/control inputs, compiler/dependency provenance and final receipt.

The qualifier and ten adversarial report-validator tests reuse the accepted
source-nine procedure. Static preflight checks imports, full closure, all
input hashes, declaration and consumer inventories and source options. These
checks are preparation, not a substitute for Lean compilation. Local compiler
startup remains blocked by the previously documented numeric-PID proc lookup.

The workflow retains the existing limits: 600 seconds per file, 70 minutes for
the cold build, 35 minutes for environment restoration and 110 minutes overall.
No heartbeat/recursion increase, linter waiver or global instance setup occurs.
The owner reports terminal CI outcomes; do not poll for results.

## Acceptance and scope boundary

Do not accept this candidate on a partial source compile, printed marker,
incidental clean root report or skipped consumer. Classify the first failure
and preserve its evidence. Unsupported support, reversed order, zero-normal
parity, collapsed central signs, a failed mixed-pair exclusion, extra premise,
unexpected axiom or resource failure holds the gate.

The result, if qualified, is the actual source-axis stabilizer's supported-word
characterization. It does not yet establish connectedness, an SO(8) double
cover, topological Spin(8) classification, common torus/root-data binding,
operator-algebra action, Hamiltonian-domain identification, coercivity or
spectral existence. Those remain separate later gates.
