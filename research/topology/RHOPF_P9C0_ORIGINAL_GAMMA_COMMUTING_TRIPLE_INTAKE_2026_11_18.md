# RHOPF-P9C0 — source-exact commuting triple and involution gate

**Date:** 2026-11-18 (Pacific). **Status:** PROSPECTIVE / UNQUALIFIED.
**Branch:** `integration/bfss-unified-research-20261108`.
**Motivation:** RHOPF-P9 relational-projector forward-research memorandum,
`RHOPF_P9_RELATIONAL_PROJECTOR_FOCK_FORWARD_RESEARCH_2026_11_18.md`.

## Bounded native goal

Reuse the already accepted P9A0 original gamma complex structure squares
and F10AN disjoint original Gamma9 bivector commutation to prove six
source-exact claims on the original 16-real gamma representation:

1. The three full original generators
   K13=gamma1*gamma3, K25=-(gamma2*gamma5), K46=-(gamma4*gamma6)
   commute pairwise.
2. Their three pairwise products square to +I.

No private gamma imports, original matrix entry expansion, alternate
gamma representation or resource-limit increases. The generic product
square lemma is proved in the original noncommutative matrix ring,
with commutation used explicitly rather than presumed.

## Why this is a genuine predecessor, not the whole projector theorem

For the relational projector
P=(I-K13*K25)(I-K13*K46)/4,
the proposed proof needs the involutions and their commutation. This
gate provides the source-exact first half. A later P9C1 must prove
the projector is idempotent, has trace four, and
K13*P=K25*P=K46*P using those accepted native lemmas.

Original indexed four-plane equality / Hopf fiber restriction is NOT
derived by these statements. The prior P9A1B R1/R2/D0 three REDs are
preserved, no qualified P9A1B common-action theorem exists. P9A1A
full-generator inequivalence and P9A0 skew complex structures remain
accepted regardless of this run.

## Proof governance

Strict original pinned Lean 4.34.1, Mathlib d13f23b7,
source hash checks, fresh warning-as-error native Lean build,
an independently compiling Lean consumer of all six original types,
strict standard-axiom reports, original signed-permutation integer
consumer, and retained CI artifact (including failures).

No source BFSS Core, original Fock operators, physical Hamiltonian,
FCP canon, or retired NFC theories changed. No inference to protected
3D hopfions, charge/current conservation, or Standard Model fields.
