# IBI forward research — rank-two incidence restores seven lost local directions

**Date:** 2026-11-14 Pacific / 2026-11-15 UTC.
**Track:** candidate-neutral mathematical forward research on the isolated
`research/bfss-incidence-unified-20261114` branch.
**Status:** exact finite symbolic/integer tests plus conventional
Lie-group slice argument; **NOT a new Lean-qualified source theorem,
original physical Hilbert quotient, quantum/operator theorem, or
accepted ontology**. G0A is strict GREEN #43689689837; G0B0 strict
#43691017217 was separately running when this investigation began.

## Scientific question and falsifier

Could the Gram-only bosonic incidence tensor `G_ij=<x_i,x_j>`
be a sufficiently faithful local coordinate system for the effective
classical SO(3) BFSS gauge quotient?

**Falsifier:** exhibit two configurations with identical G but
distinct proper SO(3) orbits, and show that G collapses actual tangent
directions where the effective quotient is smooth. The original
2026-11-11 IBI pilot already supplies the rank-three global reflection
counterexample. Here we isolate and quantify its rank-two local effect.

## Exact transverse family

Use nine real vectors in R^3 and the conventional SO(3) diagonal
action. In zero-based Python row indices,

  X(z) = (e_1, e_2, z_0 e_3, ..., z_6 e_3),  z in R^7.

The rank-two base is X(0), and the first two fixed orthonormal rows
orient the color plane. Direct algebra gives

  G_00 = G_11 = 1; G_01 = 0;
  G_0k = G_1k = 0 for k >=2;
  G_(k+2)(l+2) = z_k z_l;
  D_(0,1,k+2) = det(e_1,e_2,z_k e_3) = z_k.

Therefore G(X(z))=G(X(-z)), but all seven selected oriented
incidence coordinates D_(0,1,k+2) recover z exactly. If z != 0,
X(z) and X(-z) are NOT related by a proper SO(3) color rotation:
any such rotation fixing both e_1 and e_2 fixes e_3 as well.
An improper reflection diag(1,1,-1) DOES relate them.

The mixed-minor identity restricts in this family to
D_(0,1,k+2) D_(0,1,l+2)=G_(k+2)(l+2).
The bosonic wedge sum is the explicit even function
sum_(i<j) ||x_i × x_j||² = 1+2 sum_k z_k².
This distinguishes interaction-potential invariance from
the *completeness* of gauge orbit coordinates. It is not yet
a source-normalized BFSS potential equality.

## First-order diagnostic — the key new result

At z=0, the derivative of every entry of G(X(z)) in the
seven z directions is zero, because those entries are quadratic.
The 7x7 derivative matrix of
z -> (D_(0,1,2),...,D_(0,1,8)) is the identity.
Thus:

  rank D_z(G∘X)|_(z=0) = 0,
  rank D_z(D_01,*∘X)|_(z=0) = 7.

This is not just loss of a discrete orientation *label*;
a Gram-only presentation loses the full first-order local
coordinate chart in these seven transverse directions.
The 84 signed triples are still redundant globally; only
seven are needed in this chosen transverse family.

## Local orbit geometry: correct distinction between SO(3) and O(3)

SO(3) acts freely on configurations spanning a color subspace
of rank at least two: a proper rotation fixing two independent
vectors pointwise is the identity. Since SO(3) is compact, the
action is proper; the quotient of the rank >= 2 open locus
is a smooth 27-3=24-dimensional manifold.

At X(0), the rank-two configuration submanifold has
dimension 2(9+3-2)=20. Its SO(3)-quotient stratum is
20-3=17 dimensional; the seven transverse coordinates above
complement it. Rank two is **not** a singular orbit type of
the effective SO(3) quotient: its stabilizer is trivial,
just as at rank three.

For the larger O(3) action, the rank-two stabilizer is
{I, diag(1,1,-1)} ~= Z/2. On a slice, that reflection
fixes the 17 tangent-to-rank-two quotient directions and
negates the seven transverse directions. The ordinary
compact-group slice theorem therefore gives a local
Gram/O(3) quotient model

  R^17 × (R^7 / {z~ -z}),

whereas the actual effective SO(3) quotient has a
smooth local 24-dimensional model. The local normal link
of the Gram-only model is RP^6, rather than S^6.
**The apparent rank-two singularity is introduced by
forgetting orientation via O(3), not by the underlying
effective SO(3) gauge quotient.**

This local product is a conventional slice-theorem deduction,
not an explicit certified original BFSS Lean quotient atlas.
For the full original SU(2) group, its central Z2 fixes
bosonic adjoint configurations; the original Fock-fiber
action of that center must be audited separately before any
physical quotient claim.

## Smooth scalar observables versus full quantum physics

D_(0,1,k+2) is a smooth SO(3)-invariant polynomial that is odd
under the extra improper reflection. Any function solely of G
on the above family is even in z. Thus Gram-only observables
exclude legitimate smooth orientation-sensitive SO(3)-invariant
scalar observables, even before considering fermions.

The classical first fundamental theorem for SO(3) vector
invariants suggests that pairwise inner products G and
oriented triple determinants D generate the polynomial invariant
algebra; Schwarz's smooth-invariant theorem then gives a
route to factoring smooth scalar invariant functions through
these generators. This stronger **classical** result is
an established external mathematics route; exact source-specific
transport and a full smooth-coordinate theorem are not yet
our Lean-qualified results.

- David R. Richman, *The fundamental theorems of vector
  invariants*, Advances in Mathematics 73 (1989), 43–78,
  https://doi.org/10.1016/0001-8708(89)90059-5
- Gerald W. Schwarz, *Smooth functions invariant under the
  action of a compact Lie group*, Topology 14 (1975), 63–68,
  https://doi.org/10.1016/0040-9383(75)90036-1
- Smooth free/proper action quotient theorem (standard):
  https://www.math.utoronto.ca/selick/fibre.pdf

Even G+D scalar invariant sufficiency would not reconstruct
the source gauge groupoid, isotropy representations, original
Fock gauge action, SU(2) center signs, quotient measure,
kinetic operator, or supercharge/Hamiltonian domains.
An O(3)-quotient measure/operator cannot simply replace
the source SU(2)-gauge physical Hilbert space.

## Exact diagnostic and independent method

Reproducible Python 3 stdlib script:
`research/incidence-before-identity/tools/bfss_ibi_rank2_transverse_exact.py`.

It tests three fixed integer z tuples including z=0 and mixed signs,
both z and -z, all 7x7 mixed-minor products in the family, bosonic
wedge potential, the complete 45-entry Gram derivative and the
seven signed triple derivatives by exact central-difference arithmetic
(quadratic/linear expressions only), and ranks by exact rational
Gaussian elimination. Executed locally in the research workspace:
all checks PASS. The independent SymPy symbolic calculation gave
Gram derivative rank 0, D derivative rank 7 and the same mixed minors.
Finite checks and the conventional proof are distinct evidence types.

## Consequences for the proof roadmap

1. **Do not build a physical scalar quotient or kinetic operator on G
   alone.** Rank-two local data can be spuriously folded and smooth
   odd-in-D observables omitted.
2. **G0B0/G0B1 and G0C stay prerequisites.** Exact source
   determinant-one and image-surjectivity must precede a source
   SO(3)-orbit claim. The running G0B0 polynomial gate is not altered.
3. **Promote G1 signed triple invariance as high-value next source
   mathematics** after source orientation is qualified. A small
   explicit original-boson counterexample to Gram sufficiency
   and a seven-transverse-direction witness are good consumer tests.
4. **At G2:** prove source orbit classification with BOTH G and D.
   Separate orbit-point separation from smooth-algebra generation,
   Jacobian regularity, and effective-quotient atlas construction.
5. **At G3/G4:** original-Fock equivariant section and actual
   quantum kinetic/charge domains are indispensable. A potentially
   smooth bosonic quotient does not settle Fock or gauge-center
   phase and does not select a physical ontology.

Scientific meaning: invariant incidence can *restore* genuine local
degrees that a coarser representation collapses, but the result does
not show that incidence is pre-mathematical or ontologically
fundamental. Preserve both counterexamples and successes.
