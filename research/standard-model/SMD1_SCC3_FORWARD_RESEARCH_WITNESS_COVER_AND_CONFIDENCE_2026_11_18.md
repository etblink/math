# SM-D1-SCC3 — research note: witness incidence, minimum covers and confidence

**2026-11-18 | FORWARD RESEARCH ONLY. NOT A QUALIFIED GATE.**

## Native checkpoint and governance

The currently staged SM-D1-SCC2 source/consumer is being tested in original run #44406382070 at tested commit `8e7a22baea868f3fa6803d29abb60c8c14b6e1e2`; no original strict result is implied by this memorandum. Do not alter source or consumer based on this prospective note. Accepted SCC1 R3 original run #44403273333 and independent preservation #44404925679 remain protected, along with qualified SM-Y0, empirical SM-D0, finite Python SCC0 and 27 BFSS anchors. Full physical SM-D1 is prospective.

## Structural incidence equivalence

Fix two explicit nonempty finite scenario families `A` and `B`, and a finite set of admissible witnesses `W`. For deterministic predictions `p(m,w)`, define the cross-family universe `U=A×B` and the coverage family for one witness:

`C(w) = { (a,b)∈U | p(a,w) ≠ p(b,w) }`.

Then `UniformlySeparates(p,A,B,W)` is equivalent to the finite covering condition

`U ⊆ ⋃_(w∈W) C(w)`.

This is a proof *interface*, not new physics. It converts family-level distinguishability to a finite incidence matrix (rows model pairs; columns witnesses; entries distinguish / do not distinguish).

## The nontrivial minimality lemma

A witness set `W` is **inclusion-minimal** as a separating cover iff it covers all cross-family pairs and, for each `w∈W`, there exists a *private pair* `(a_w,b_w)∈U` that no remaining witness in `W.erase w` separates. The forward direction is the negation of uniform coverage after deleting `w`; the reverse direction follows upward monotonicity. This gives a concrete independent consumer check for every experiment's necessity.

The SCC2 test fixture uses `A={0,1}`, `B={2}`, `W={true,false}`, predictions `p(0,w)=w`, `p(1,w)=¬w`, `p(2,w)=false`. The `(0,2)` pair requires `true`, and the `(1,2)` pair requires `false`; deleting either witness breaks uniform separation. A local arithmetic enumeration confirms that the empty set and both singletons fail, and `W` succeeds.

**Do not conflate:** inclusion-minimal witness sets need not be unique, and an inclusion-minimal cover need not have the smallest possible cardinality or cost. A future experimental design can apply practical budgets, expected information and statistical uncertainty only after predictions are source-derived and nuisances declared.

## Definitional firewall and negative controls

1. If either scenario family is empty, universal separation is vacuous. Candidate *physical* model comparisons must reject such an empty-domain "success"; the generic Lean definition need not be changed.
2. Distinct model IDs can still produce identical outcomes on all selected witnesses. Reject identity-only discrimination.
3. Two differing predicted *marginals* already witness distinct ideal predictive distributions; missing unrelated predictions cannot cancel that positive witness. However, absent joint likelihood and correlated-systematic information precludes a numerical significance calculation.
4. The finite incidence picture assumes deterministic total predictions; partially defined or probabilistic models require separate typed semantics and finite exact probability lemmas. Do not retroactively modify SCC0's qualified bytes.
5. Infinitely many parameters can exhibit pairwise differences with arbitrarily weak sensitivity. A quantitative margin is a further physical/statistical premise, not a consequence of mere finite separation.

## Proposed staged roadmap

After SCC2 qualifies through original CI **and** independent ZIP/full-job preservation, next theorem gate SCC3A would prove the incidence-cover and private-pair equivalences in Lean with an independent consumer. SCC3B could add finite rational categorical distributions and total-variation positivity; SCC3C could then study weighted witness selection or explicit joint-distribution interfaces. Promote none of these until source, consumer, exact tested commit and original artifact are independently checked.

Our purpose is to subject *all* candidate explanations to the same opportunity for disconfirmation, not to prove BFSS, SCC, NFC, or another preferred framework.
