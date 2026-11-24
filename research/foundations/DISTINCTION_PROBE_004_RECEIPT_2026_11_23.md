# Distinction probe 004 — loop transport and composition constraints
2026-11-23 Pacific. Status: executed exact Python enumeration; established graph/cohomology mathematics applied to IBI questions, not a novel topology theorem or empirical evidence.
Code: DISTINCTION_PROBE_004_2026_11_23.py @ a98e4639944cdec4ced358631d7c4f8f10752734. Executed functionally identical source locally with Python 3; all assertions passed. No Lean or CI changes.

## Assumptions
Finite simple undirected graph G=(V,E), two-element fiber over each vertex, invertible edge transport represented by a bit a_e (0 preserves, 1 swaps), independent local sheet relabelings g_v. These are stipulated, not derived from primitive distinction. Equivalence is switching over a fixed labeled base, not quotient by base automorphisms. Loop orientation is immaterial for Z2. Absolute sign labels are not observables.

## Mathematical classification
Switching changes a by the coboundary delta g with (delta g)_ij=g_i+g_j mod 2. Cycle parity is unchanged, since vertex terms cancel. For n vertices, m edges, c components, the coboundary space has dimension n-c (kernel consists of locally constant g), so the quotient has dimension b=m-n+c and 2^b classes. Equivalently use a spanning forest to remove all signs on tree edges; remaining edge signs specify independent fundamental cycles. This is standard graph H^1(G;F2), not a proof that topology emerges from no assumptions. For connected bases the zero class yields disconnected two-copy cover; any nonzero loop parity connects the two sheets and yields a connected double cover.

Introduce an extra model assumption: every triangle is a filled face, with parity zero around its boundary. This imposes linear equations B a=0 where rows of B are triangle boundaries. Coboundaries are in ker B. The quotient of flat signings has dimension b-rank_F2(B)=dim H^1(K;F2) where K is the clique complex (higher faces irrelevant to H^1). A nonzero parity on a contractible triangle cannot extend to a flat double cover of its filling. This is a restriction on admissible models, not physical decay or dynamics. Without the flatness constraint, adding an edge can increase cycle rank.

## Executed enumeration
All 1099 labeled simple graphs of 1..5 vertices; all 59809 edge signings. Enumerated switching orbits, independently tested connectedness of each representative lift for connected bases, explicitly enumerated flat signings and checked rank formula with binary elimination.
n | graphs | signings | switching classes | connected bases | connected bases permitting nonzero twist | connected bases permitting nonzero flat twist | connected double-cover classes
1 | 1 | 1 | 1 | 1 | 0 | 0 | 0
2 | 2 | 3 | 2 | 1 | 0 | 0 | 0
3 | 8 | 27 | 9 | 4 | 1 | 0 | 1
4 | 64 | 729 | 108 | 38 | 22 | 3 | 40
5 | 1024 | 59049 | 3969 | 728 | 603 | 172 | 2725
Counts are enumeration frequencies, not probabilities. In this simple-graph, all-triangles-filled model, chordless square is minimal connected example with nonzero H^1; three-cycle is enough in graph-only model. No claim of universal minimum over arbitrary complexes, multigraphs or groupoids.

## Explicit controls
path on four vertices: b=0, filled rank 0.
triangle: b=1, filled rank 0.
square: b=1, filled rank 1.
square with diagonal: b=2, filled rank 0 (two triangle boundaries span cycle space).
K4: b=3, filled rank 0.
Thus additional incidence PLUS local compatibility can forbid an old twist; more relationships alone do not imply more protected structure. Trivial cover permitted even when nontrivial cover possible. Real Hopf analogy: C_n with odd parity, connected lift C_2n. No forced Hopf tower.

## Observation and internal accessibility
Any sequence of projected edge transports yields identical base observations for both sheets and for every signing. Holonomy is not thereby observable. If a common-origin preparation, two path transports and comparison of endpoint equality at same fiber are operationally available, the equality result distinguishes relative path parity; absolute labels cancel. This is a conditional analytical protocol, not an executed physical measurement or proof of internal probe availability. Coherent interference is another candidate realization to examine separately. Merely switching labels is not a physical perturbation; changing a transport sign or imposing new face relations may invalidate protection. Independent justification of transformations and comparisons remains necessary.

## External reference and disposition
Established signed-graph switching classification: Characterizations of line graphs in signed and gain graphs, https://doi.org/10.1016/j.ejc.2021.103479 (cycle basis criterion and 2^(m-n+1) connected-base classes). Treat this experiment as rediscovery/application and validation, not original proof of known topology.
Next: operational path comparison without a privileged label, assess what constitutes a physical witness of relative transport in classical and quantum settings; compare to BFSS central sign only after exact source and gauge status audit. Do not infer physics from graph counts. Preserve prior branch history; no NFC, unified integration, main, Lean or workflow modifications.
