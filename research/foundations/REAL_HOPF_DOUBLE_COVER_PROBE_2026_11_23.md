# Real Hopf double-cover probe
2026-11-23 Pacific. Owner proposed exploring the real Hopf fibration in connection with distinction and protected persistence. Status: established covering-space mathematics plus executed finite combinatorial control; no physical or ontology claim.

## Mathematical bridge
Real Hopf fibration S^0 -> S^1 -> RP^1 ≅ S^1, represented by p(z)=z². Antipodal points have the same projection. The lift of one base winding from z ends at -z; two windings return to z. General antipodal covering S^n -> RP^n is a related family, not all members of the classical four Hopf fibrations. The map p is a quotient and a locally trivial double covering; an arbitrary observation quotient need not be a covering. Absolute fiber sign is not observable through p; relative transport parity is invariant under local sheet relabeling when transport is supplied. No in-model measurement of this parity is derived. Base-only probes with only projected dynamics cannot distinguish trivial and twisted covers. The sign is not evidence for a fermion, particle, spin-statistics or BFSS physical sector. Compare native SU(2) -> SO(3) adjoint surjection/center and Spin-lift work only after checking exact source action and physical observables.

Sources: https://ncatlab.org/nlab/show/real%2BHopf%2Bfibration ; https://ncatlab.org/nlab/show/Hopf%2Bconstruction ; https://matfiz.github.io/topologija/en/lectures/4/

## Finite test and negative control
Take base cycle C_n and two sheets per vertex, with edge signs a_i in Z/2 specifying whether transport swaps sheets. Lift along the edge (i,s)->(i+1,s+a_i). Under local sheet relabeling g_i, a_i becomes a_i+g_i+g_(i+1). Their sum mod 2 is unchanged; even sum yields the trivial disconnected double cover (two cycles), odd sum the connected double cover (one cycle of length 2n), a combinatorial analogue of the real Hopf fibration. Both have identical base graph, fiber cardinality and projected successor. The difference is global transport, not a primitive absolute sheet label. The two-sheet structure, cycle and transport are assumed and not derived. The exact experiment executed locally in Python 3:

```python
from itertools import product
for n in (3,4,5,6,8):
    counts={0:0,1:0}
    for signs in product((0,1), repeat=n):
        def lift(v,s,k):
            for _ in range(k):
                s ^= signs[v]
                v=(v+1)%n
            return v,s
        parity=lift(0,0,n)[1]
        counts[parity]+=1
        assert lift(0,0,2*n)==(0,0)
        for g in product((0,1),repeat=n):
            transformed=tuple(signs[i]^g[i]^g[(i+1)%n] for i in range(n))
            assert sum(transformed)%2==parity
    print(n,counts)
```

Results (even, odd): n=3 (4,4), n=4 (8,8), n=5 (16,16), n=6 (32,32), n=8 (128,128). All assertions passed. Counts describe sign assignments, not independent cover types or physical probabilities. Algebraic explanation: local g_i terms cancel pairwise around the loop. The parity classes are the two equivalence classes under local relabeling: choose g recursively to set all but the last edge sign to zero. An allowed modification of one edge toggles parity, so protection is relative to allowed transformations; relabeling is not arbitrary physical change.

## Decision
The real Hopf cover provides an excellent minimal nontrivial test laboratory for IBI, observational quotient, transport, global versus local distinction, and SCC. Negative witness: identical fiber cardinality and local base observations do not force a twisted cover. Do not reinstate NFC's retired forced Hopf tower or infer geometry from quotient alone. Next test: distinguish genuinely internal relative transport probes from analyst access to a lifted state; assess admissible transformations that preserve winding parity and whether physical source-exact observables detect a comparable structure. No Lean or CI modifications.
