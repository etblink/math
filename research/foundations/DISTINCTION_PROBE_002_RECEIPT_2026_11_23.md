# Distinction probe 002 — persistent observable distinctions
2026-11-23 Pacific. Status: executed exact finite enumeration and elementary mathematical argument; not Lean-qualified or empirical evidence.
Script: DISTINCTION_PROBE_002_2026_11_23.py, commit 6f08d6b1810b6a724d33853892b18cdb72069168. Reproduce with python3. The script's definitions and audit loop were executed in Python 3 in the research runtime, using integer/tuple enumeration; no sampling. Probe 001 was independently rerun from its recovered source; all prior numerical counts reproduced.

## Model and explicit assumptions
Finite nonempty set X, n=|X|; deterministic autonomous total transition f:X→X; deterministic observation p:X→A (only equality of outcomes matters). Shared discrete step index and an observation family are stipulated, not derived. No in-model observer, clock mechanism, storage, quantum behavior, or physical ontology is established.

Three partitions: P (equal present observation); Q (equal entire forward observation streams: p(f^t x)=p(f^t y) for all t>=0); R (eventual equality of aligned observation streams: equality for every t>=T for some T). R-equivalence ignores finite transient differences but retains phase with respect to the common stipulated step index. Distinction in R means arbitrarily late distinguishing observations, not a different outcome at every step. The labels in enumeration carry no physical meaning.

## Elementary argument (not dependent on numerical counts)
Iterate refinement by (current class, class of successor). After k refinements the partition records observations from t=0 through k. It stabilizes on finite X in at most n-1 strict refinements; a non-strict step is a fixed point. The limit is Q, the finest observation history partition / coarsest forward-compatible refinement of P. The quotient dynamics on Q are well-defined because dropping the initial observation preserves equality of streams.

For finite X, f^n(X) is contained in the periodic subset of X. On that subset f is a permutation. Hence any two aligned observation streams starting there are periodic, so eventual equality implies equality at every subsequent step (take a common period). Consequently R(x)=R(y) iff Q(f^n x)=Q(f^n y). R coarsens Q and is forward and backward compatible: eventual equality is unchanged by a one-step shift. Thus its induced finite map is a permutation.

Maximality in the specified category: if S coarsens Q and f induces a permutation of S-classes, R(x)=R(y) implies Q(f^n x)=Q(f^n y), hence S(f^n x)=S(f^n y), hence S(x)=S(y) by injectivity. Every reversible factor of the Q quotient therefore factors through R. This is a finest reversible factor of the observational-history quotient, not necessarily a refinement or coarsening of the current P partition. With full-state observations the factor is the eventual coalescence quotient and has as many classes as periodic states. With a constant observation it is trivial, even on a nontrivial reversible system. No physical significance claimed for universality in this category.

## Exhaustive checks
All set partitions and total deterministic maps of n=1..4; for each pair compute Q by iterative refinement, R via f^n and Q. Independently compare to explicit forward histories of length 2n (including the last n observations for the tail). Enumerate all reversible partitions and assert every reversible coarsening of Q also coarsens R. Assert universal full-state factor likewise. All assertions passed.

n | models | Q nontrivial | R nontrivial | Q strictly finer than R | Q nontrivial but R trivial | Q finer and R nontrivial | noninjective f and R nontrivial
---|---:|---:|---:|---:|---:|---:|---:
1 | 1 | 0 | 0 | 0 | 0 | 0 | 0
2 | 8 | 4 | 2 | 2 | 2 | 0 | 0
3 | 135 | 108 | 60 | 72 | 48 | 24 | 36
4 | 3840 | 3584 | 2232 | 2864 | 1352 | 1512 | 1896

At n=4, P does not determine R in 1416 cases and R does not determine P in 2864 cases. Counts are enumeration counts of labeled transition functions and unlabeled partitions; no inferred probability in nature.

## Concrete witnesses and limits
Take f(a)=b, f(b)=a, f(c)=a, p(a)=0,p(b)=1,p(c)=0. Streams a=0101..., b=1010..., c=00101... (c starts 0, then a starts 0). a and c agree initially but are persistently distinguishable; b and c start different but have identical future observations after one step. The microdynamics are noninjective, yet R has two classes {a}, {b,c} exchanged by f. Change p to a constant and R collapses to one class despite the same incidence/dynamics. If f is constant, R is always trivial. This shows compatibility, persistence, and adequacy of observation are separate.

A persistent phase class is not automatically a localized object, invariant individual label, conserved charge, robust state under perturbations, or physical ground state. A permutation of quotient classes preserves distinguishability but not each class's value. A change of clock origin can identify phases under different equivalence choices; the current aligned comparison assumes a common step index. Nor does the finite maximality theorem automatically extend to infinite, nondeterministic, stochastic or quantum dynamics.

## Project decision
Positive: finite irreversible microdynamics can support nontrivial reversible observable sectors; the persistent quotient is canonical relative to the specified dynamics and probes. Negative: distinction need not persist, persistence is probe-dependent, and the common step index, transition rules and admissibility are still assumed. This provides a precise model-level bridge between IBI, NFC observational quotients and persistence/transport, not independent evidence for a physical unification hypothesis.
Next: test whether distinctions persist under an ensemble of admissible perturbations/controls rather than one chosen transition; separate robust invariants from synchronized phase. Then examine how stochastic/quantum observations alter the equivalence and whether internal accessibility can be realized without privileged external labels or a clock. Do not import Lean or promote to unified until a consequential well-posed claim warrants it.
