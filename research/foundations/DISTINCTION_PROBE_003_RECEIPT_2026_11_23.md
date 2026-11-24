# Distinction probe 003 — protection under multiple transformations
2026-11-23 Pacific. Status: executed exhaustive finite Python experiment plus elementary argument; not Lean-qualified or empirical evidence.
Script: DISTINCTION_PROBE_003_2026_11_23.py @ 5457b0beb081bd8a0a0aa1fc1c5d0c945278fedf. Executed the same script with Python 3 in the local container. All assertions passed. No CI launched.

## Definitions and assumptions
Finite nonempty carrier X, deterministic observation partition P, declared family F of total deterministic maps X→X. Same action word applied to both compared states. The action family, common comparison, and availability of observations are stipulated, not derived.
Q: equality of observations after every finite word over F including empty word; coarsest common forward-compatible refinement of P.
R: finest common reversible coarsening of Q (each map induces a permutation on R-classes).
I: finest common pointwise invariant coarsening of Q (each map acts as identity on I-classes).
Refinement order Q finer than or equal to R finer than or equal to I. P and R may be incomparable. R distinctions cannot merge under any common word, but the observable witness for them may require a particular further action word. No universal detection along every schedule, asynchronous phase invariance, noise tolerance, or physical protection follows.

## Elementary argument
Q obtained by iterating simultaneous signature refinement (current class and classes of every successor); induction gives tests through words of bounded length, and finite stabilization gives equality for all words. Common reversible equivalences satisfy x~y iff f(x)~f(y) for every f. Intersection preserves both directions and thus gives an equivalence that induces injective (hence on finite quotient bijective) maps. Intersect all such equivalences containing Q; nonempty family because indiscrete equivalence qualifies. This yields R, finest within the declared category. Similarly intersect all equivalences containing Q and satisfying x~f(x) for every f and x; this yields I and implies I coarsens R. I equivalence can also be built from Q pairs and undirected edges x--f(x) by transitive closure. If a word is constant on X, R is trivial, since an induced permutation cannot be constant on more than one class. For a single f, R agrees with the reversible factor defined in probe 002. This is model-relative mathematics, not an ontology.

## Executed enumeration
All unlabeled set partitions on labeled carriers, all unordered pairs of maps with replacement; no sampling. 20+1890+493440=495350 models. Independent constructive Q check and lattice extremality assertions for each distinct (P, admissible-partition masks): 6,155,13530 respectively. 
n | models | Q nontrivial | R nontrivial | I nontrivial | R nontrivial/I trivial | Q nontrivial/R trivial | both individual R nontrivial/joint R trivial
---|---:|---:|---:|---:|---:|---:|---:
2 | 20 | 10 | 3 | 1 | 2 | 7 | 0
3 | 1890 | 1512 | 270 | 100 | 170 | 1242 | 252
4 | 493440 | 460544 | 50412 | 22902 | 27510 | 410132 | 140760

Four states: 46212 models with nontrivial R and at least one noninjective map; 30084 with nontrivial R and both maps noninjective; 34620 R not determined by P. 489600 models have two distinct maps. Enumeration frequencies depend on chosen counting measure and are not physical probabilities.

## Witnesses
State order a,b,c, output p=(0,1,1), f=(a,a,c), g=(a,b,a): individually nontrivial reversible factors {a,b}|{c} and {a,c}|{b}; jointly Q discrete but R and I trivial. Either composition f∘g or g∘f is constant a. Thus two individually persistent distinctions need not share any protected sector under admissible mixed words. (This is not a claim about persistence of the same distinction under each map.)
p=(0,0,1), f=(a,a,c), g=(c,c,a): both maps noninjective; R={a,b}|{c}, f fixes and g swaps R-classes; I trivial. Genuine common distinguishability protection in this model does not require each value to be invariant.
p=(0,0,1), f=(a,a,c), g=(b,b,c): both maps noninjective; R=I={a,b}|{c}. A nontrivial invariant can coexist with microinformation loss.
Further analytic control: p=(0,1,1), f=id, g swaps a,b and fixes c. Q=R discrete, yet b,c have identical observations forever along the identity-only schedule; the g test separates them. Common reversibility does not guarantee a distinguishing observation along every schedule.

## Decisions
Positive: a finest protected observable-history factor and a finest invariant factor exist within the finite deterministic multi-action model. Negative: individual persistence does not ensure joint protection; protection need not be pointwise invariance; protection does not ensure schedule-independent operational access. No proof of physical charge, topology, particle identity or fundamental dynamics. Preserve distinction between assumed admissible transformations and experimentally grounded ones. Next test: bounded observations, adversarial schedule versus controlled interventions, and probabilistic distinguishability under noise, then inspect quantum channels and established physical conservation examples before importing stronger claims. No Lean, workflow or unified/main changes.
