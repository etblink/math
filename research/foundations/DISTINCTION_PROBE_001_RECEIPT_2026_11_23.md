# Distinction probe 001 — computational receipt
2026-11-23 Pacific. Status: executed finite exhaustive model experiment; not physical evidence or Lean qualification.
Script: DISTINCTION_PROBE_001_2026_11_23.py, commit 2c5c08b3320309d4a594403e1b1970fe91f6939c. Executed equivalent exact script with Python 3 in local research runtime; integer/tuple enumeration, no floating-point or random sampling. Reproduce with python3 research/foundations/DISTINCTION_PROBE_001_2026_11_23.py. No CI launched.

## Question and assumptions
Can structural roles, operational distinguishability and persistent distinctions be separated? Graph carrier, binary undirected adjacency, finite cardinality, allowed probes and deterministic transition function are explicitly introduced model structures. This does not derive sites, relations, dynamics, time or observerhood from nothing. Vertex labels are computational bookkeeping, not observables. Automorphism orbit is an upper bound on distinctions by invariant single-vertex probes; actual internal physical availability of any such probe remains unestablished.

Historical grounding: retrieved Jan 14–16, 19, 25, 30 IBI conversations emphasize invariance != identity, stabilizer/survivor analogy, weak uniqueness sketches, possible rigid quotients, gap and compression claims, and the need not to introduce observers. NFC frozen Book I supplies test-relative equivalence and refinement; Book III transport compatibility. These are leads, not evidence that a physical ontology is proved.

## A. Graph roles
Enumerate every labeled simple undirected graph of n=1..5, compare partition by degree, stable neighbor-color refinement (1-WL), and exact vertex automorphism orbits computed by all permutations. Graph counts are labeled, not counts of independent physical systems or isomorphism classes.

n | labeled graphs | degree fails to separate all orbits | 1-WL fails | one orbit | all singleton orbits
---|---:|---:|---:|---:|---:
1 | 1 | 0 | 0 | 1 | 1
2 | 2 | 0 | 0 | 2 | 0
3 | 8 | 0 | 0 | 2 | 0
4 | 64 | 0 | 0 | 8 | 0
5 | 1024 | 420 | 0 | 14 | 0

At n=5, degree fails in 420/1024 (41.015625%) labeled cases. 1-WL succeeds for every enumerated graph, but not universally: disjoint triangle and square (7 vertices) has degree signature (0,0,0,0,0,0,0), stable WL same, exact orbit signature (0,0,0,1,1,1,1). A local triangle-membership probe separates the two orbits. Invariant probes can be inadequate even after unlimited iterations of a specified refinement rule. This does not show all local probes fail: triangle membership is itself a bounded neighborhood property. C4 versus C4 with one diagonal: one orbit versus two, so structural role distinctions can change when incidence changes without primitive individuating labels. No proof of emergent physical identity.

## B. Quotient dynamics
For finite carrier X of size n, enumerate all set partitions p and all deterministic maps f:X→X. Current observational equivalence x~y iff p(x)=p(y). Refine via pair (p(x),p(f(x))) repeatedly until stable. Stable iff p(x)=p(y) implies p(f(x))=p(f(y)); equivalently there exists a deterministic quotient map. This is compatibility, NOT preservation of unequal classes. Iterated refinement computes equality of entire forward observation streams, since each step adds one more future observation and the finite partition stabilizes.

n | pairs | initially compatible | intermediate-partition pairs | compatible intermediate | strictly refined | strictly refined to singleton partition
---|---:|---:|---:|---:|---:|---:
2 | 8 | 8 | 0 | 0 | 0 | 0
3 | 135 | 99 | 81 | 45 | 36 | 36
4 | 3840 | 1728 | 3328 | 1216 | 2112 | 1440

Negative witness: X={a,b,c}, p={{a,b},{c}}, f(a)=a,f(b)=c,f(c)=c. Equal present observations of a,b differ after one transition; present quotient does not determine the next observation. All three states become distinguished by observation histories. This f is a model choice, not inferred from graph incidence.

Independent logical control: f constant makes every partition compatible but can erase all distinctions under evolution. Persistent distinguishability of all quotient classes requires injectivity of the induced quotient map, not merely its existence. On a finite quotient injectivity entails permutation and reversibility there. Selected invariants may persist without global reversibility. No claim of fundamental time or thermodynamics.

## Adjudication
Positive: nontrivial distinguishable relational roles are possible without individually named physical objects; equivalence and refinement can be explicitly calculated. Negative: bare incidence does not specify probe adequacy or dynamical congruence; compatible dynamics do not guarantee persistence. Small-size positive 1-WL results do not generalize. Static indistinguishability does not guarantee future indistinguishability. These are exact finite model results, not empirical measurements, and labeled enumeration frequencies are not physical probabilities.

Next: examine minimal probe/transition compatibility and distinguishability-preserving transformations; compare internal accessibility against mathematical orbit separation, with an explicit information budget and no privileged global observer. Test object-first, relation-first and joint-emergence realizations of the same operational model before attributing ontological priority. No new Lean or CI changes, no promotion to unified.
