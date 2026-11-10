# BFSS three-by-sixteen and three fermion generations — candidate-neutral feasibility test

**Date:** 2026-11-10 (America/Los_Angeles)
**Disposition:** EXPLORATORY MATHEMATICS / RESEARCH HYPOTHESIS / NOT LEAN QUALIFIED / NO PHYSICAL REALIZATION ESTABLISHED.
**Branch:** `integration/bfss-unified-research-20261108`, `etblink/math`.
**Question:** Could the original SU(2) BFSS three bundles of 16 real Majorana operators be a structural precursor of the Standard Model's three chiral Spin(10) `16` generations?

**Scientific rule:** Investigate *reality*, not BFSS confirmation. Preserve exact representation-theoretic positives and disqualifying negatives separately. The analysis does not alter the active C48-1A0 strict proof, the FCP canonical corpus, or any accepted BFSS source.

## 1. What the literal original source says

The actual `lean/OAI/MathematicalPhysics/BFSS/Core.lean` declares `SpinIndex = Fin 16`, `ColorIndex N = Fin (N^2-1)`, `Fermion N`, `AlgebraData.theta : SpinIndex -> ColorIndex N -> Fermion N ->L[C] Fermion N`, and the true delta-one CAR. At `N=2` this gives:

```text
  real original Majorana labels:  SpinIndex × ColorIndex 2
                               = Fin 16 × Fin 3
                               = 48 real fermion generators.
  representation content: Spin(9) real spinor 16 × SU(2) adjoint real 3.
  original Fock Hilbert dimension: 2^(48/2) = 2^24 (complex).
```

The color triplet is the *gauge adjoint*, not three independent flavor labels. Its physically relevant gauge action is source-faithfully pinned by G3A, G4H, C48-0, C48-0B: the original S1J real 48-label SU(2) matrix acts on `Fin 24 × Fin 2`. Strict receipts [C48-0 #42779878513](https://github.com/etblink/math/actions/runs/42779878513) and [C48-0B #42787913738](https://github.com/etblink/math/actions/runs/42787913738).

External BFSS source: [Michel, Scheinpflug and Yin, *99.9...% of the SU(2) BFSS ground state*](https://arxiv.org/abs/2611.09837), Section II, confirms `theta_{alpha a}` has 16 Spin(9) and 3 SU(2) adjoint labels with the original `{theta,theta}=delta` convention.

## 2. Positive structural lead — Spin(9) 16 really is related to Spin(10) 16

There is a true branching fact, beyond equal numerical dimensions:

```text
  Spin(9) ⊂ Spin(10);
  [16_plus of Spin(10)] restricted to Spin(9)
      ≃ complexification of the real 16-dimensional Spin(9) spinor.
  [16_minus of Spin(10)] has the same Spin(9) restriction.
```

The subgroup restriction is *not* a Spin(10) chiral 16 construction from original BFSS dynamics. The `16` of Spin(10) is genuinely **complex**, while the original 16 Spin(9) spinor is **real**. Restricting forgets the distinction of the two Spin(10) chiralities. Lifting the Spin(9) representation to a specific chiral Spin(10) action requires an additional ninth-to-tenth-axis generator structure, a chosen complex extension, and actual source dynamics/physical interpretation. A spinor of Spin(10) is an *internal GUT gauge representation* of four-dimensional Weyl fields, not automatically the same thing as an original BFSS supersymmetric fermionic generator carrying a *spacetime rotational* Spin(9) index.

Source: [*Chiral Spin(10) and Spin(9) branching in a particle-physics analysis*, Physical Review D 93, 065036 (2016)](https://doi.org/10.1103/PhysRevD.93.065036), explicitly states that the two chiral Spin(10) 16s restrict to the same Spin(9) 16. The difference between the complex chiral GUT `16` and real Spin(9) `16` must never be suppressed.

**Potential mathematical gate:** isolate a candidate-neutral Lean construction proving these representation restrictions, with correct global Spin group central-sign actions, complexification and chirality. Do **not** assume an extension of actual BFSS `Spin(9)` action to `Spin(10)` on any original Fock vector/operator.

## 3. Strong negative result — BFSS gauge triplet cannot be three gauge-invariant family projectors

The real adjoint representation of SU(2) factors through the standard SO(3) rotation representation, irreducible over `R`. Let `J_i` be its three real infinitesimal rotation matrices:

```text
 J1 = [ [0, 0, 0], [0, 0,-1], [0, 1, 0] ]
 J2 = [ [0, 0, 1], [0, 0, 0],[-1, 0, 0] ]
 J3 = [ [0,-1, 0], [1, 0, 0], [0, 0, 0] ].
```

For unknown real `P ∈ Mat_3(R)`, the exact linear commutator equations

```text
  J1 P - P J1 = 0;
  J2 P - P J2 = 0;
  J3 P - P J3 = 0
```

give a 27-by-9 coefficient system of rank **8**, nullity **1**, with sole solution `P = lambda * I_3`. The common fixed vector space `ker J1 ∩ ker J2 ∩ ker J3` is zero. An independent symbolic SymPy calculation confirmed both ranks. This is the elementary concrete instance of the real irreducibility/Schur-commutant result.

**Consequence:** there is no set of three *distinct nonzero rank-one color projectors* commuting with the full original SU(2) adjoint gauge symmetry. The three color-coordinate copies of the real 16 Spin(9) spinor are continuously gauge mixed. Treating color `a=1,2,3` as three separately identifiable, gauge-invariant particle families is invalid at this literal source level.

**Scope ceiling:** this disproves the *naive direct family-label identification only*, not every possible emergent three-family mechanism. Gauge-invariant Fock composites, dynamically selected backgrounds, flux/chiral-index constructions or a new independent flavor multiplicity could behave differently. Those are **new hypotheses** requiring source-faithful dynamics and physical selection. No three-family BFSS construction is known qualified by this project.

**Independent follow-up no-go gate:** for source G3A `adjointColorMatrix : GaugeGroup 2 -> Mat_3(R)`, show any real `P` commuting with `adjointColorMatrix g` for all `g` is scalar. Prove no three distinct invariant rank-one color projections, with an independent consumer using the genuine G3A source coefficients. This would be an exact-source mathematical obstruction, not a physical theory verdict. A separate bridge to source `S1J.sourceRealMajoranaMatrix` may use accepted C48-0B.

## 4. One particularly important hidden ambiguity

Even if a matching complex 16-dimensional `Spin(10)` representation is constructed *abstractly*, the observed **three generations** require three independent physical chiral sectors:

```text
 (16_GUT ⊗ C^3_family) ⊗ (4d Lorentz Weyl field).
```

In the original BFSS algebra the putative `R^3` factor is instead the *gauge adjoint* `ad_SU2`. These are different representations of different symmetry groups, with different quotient and observable properties. Gauge invariance means this factor cannot be silently relabeled as a physical family index. In addition, the BFSS 16 index is a transverse/spacetime-rotation spinor, whereas the Spin(10) 16 is a proposed internal GUT gauge spinor; identification would conflate external and internal symmetries without a dimensional-reduction/physical-realization theorem.

**Missing physical requirements:** actual 3+1D Lorentz chiral fermions, gauge-invariant family multiplicity, exact SM branching/hypercharge, masses/Yukawas/mixing, anomaly consistency, physical observables and a concrete mechanism selecting exactly three. None follow from `3 × 16` alone.

## 5. Honest decision and next experiment

- `GENERIC_MATHEMATICS`: `Spin(10) 16|Spin(9) ≅ Spin(9) 16_C` branching; true and worth formalizing in a separate type-safe representation library.
- `SOURCE_DERIVED`: the original BFSS 48 real Majorana labels are `Spin(9) 16_R ⊗ ad_SU2 3_R`, with source-gauge color action.
- `COUNTERMODELED / NONFORCED`: the bare 48 count and real triplet color factor **do not imply** three physical chiral `Spin(10)` generations; no three gauge-invariant individual color projectors exist.
- `OPEN`: any physically justified mechanism producing three gauge-invariant chiral generations from a larger BFSS/IKKT/string/M-theory or unrelated setting.
- `EMPIRICAL`: no new observational discriminator or independent prediction has been established by this candidate.

**Research priority:** First prove or refute the minimal source-specific family-projector identification (quick and likely negative) rather than attempt a full GUT model around the numerical coincidence. In parallel, formalize the meaningful Spin(9)↔Spin(10) chiral restriction abstractly, and compare with a topological family-index mechanism. Require a separately stated physical-emergence bridge before promoting either result to evidence about nature.

This record is **read-only conceptual/symbolic research plus documentation**; no original BFSS Lean source, CI workflow, active run, accepted theorem or canonical FCP record is modified.
