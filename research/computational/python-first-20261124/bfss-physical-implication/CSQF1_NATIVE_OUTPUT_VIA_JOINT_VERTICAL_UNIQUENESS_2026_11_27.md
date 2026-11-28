# CSQ-F1 prospective research — native output via joint vertical uniqueness

2026-11-27 Pacific. Source audit anchored at 0af166ebd5b46630edc48379a00781930589c0b3; CSQ-F0 R3 strictly qualified at 29289558cb056620275ec8277fe0047ea82c3af0. Analytical deduction and pre-implementation interface plan only. No new Lean theorem or CI run; no physical existence promotion.

## 1. Avoid physical-output construction and concrete cast recursion

Let M,G be the literal paired SU(2) data. Let P be the originalMinimalClosedGraph M G, T the AY originalMinimalPhysicalHilbertChargeColumn M G, A_a the NAG0 individualPhysicalOperator M G a, and D the AY domain. NAG1 paired_native_domain_eq identifies Dom(A_a)=D. Write E for originalMinimalHilbertOutputEquiv. For u:D define u_a as the same physical input, transported to Dom(A_a) using that equality.

The desired output identity is E(Tu)(a) = (A_a u_a : FullL2 2).

Proof (a shorter adapter that does not construct a new physical output subtype):
1. T.mem_graph u, AY originalMinimalPhysicalHilbertChargeColumn_graph_eq, and originalMinimalPhysicalHilbertChargeGraph_mem_iff give ((u:physicalSpace):FullL2 2, E(Tu)) in P.
2. A_a.mem_graph u_a and NAG0 paired_individual_graph_iff give the literal individual graph point at the same ambient input with output (A_a u_a : FullL2 2).
3. ICD-C0 paired_component_graph_iff (specialization of ICD-B0) lifts that individual graph point to some y with (u,y) in P and y(a)=(A_a u_a:FullL2 2).
4. Both points embed into M.fullClosedGraph via originalMinimalClosedGraph_le_full. Their difference has first coordinate zero; M.fullClosedGraph_vertical forces the entire output difference to vanish. Thus y=E(Tu). Evaluate at a and use the lifting equality.

The abstract helper should take a submodule of E0 x F0 and its vertical-zero property, and prove uniqueness of two outputs for the same input by sub_mem. Specialize only after the generic proof. This avoids separately proving that E(Tu)(a) belongs to the physical space, constructing that subtype, or rewriting concrete operator definitions. Domain proof irrelevance handles u_a.

## 2. Exact normalized complex pairing

For u,v:D, use AY graph memberships from step 1. CSQ-F0 paired_closed_joint_pairing states that inner(E(Tu)(a),E(Tv)(a)) is independent of a. PiLp.inner_apply gives the finite sum of the sixteen coordinate inner products, and the AY equivalence is the canonical coordinate map (definitional, not an isometry to the sup-norm function space). Hence

  inner(A_a u_a,A_a v_a) = (1/16 : C) * inner(Tu,Tv).

The left inner product agrees with ambient L2 by the physical subtype inner product. Prove the finite constant-sum arithmetic at an abstract Hilbert output type, with a separate exact SpinIndex cardinality=16 check. Do not replace PiLp 2 with the ordinary product norm. This is the complete target of the next bounded native-output/normalized-form gate. Suggested independent consumer instantiates both identities on the paired physical carrier, with no hypothetical source data.

## 3. Final natural-square gate: precise two directions

Use the BE weakRepresentative_iff_naturalAdjointSquare for A_a with NAG1 paired_native_domain_dense and the same CompleteSpace instance used by NAG2. Use originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff for T. For each u:D and w in the physical space, the preceding pairing identity makes the two weak representative predicates equivalent: each test vector in Dom(A_a) is the identical vector of D and conversely.

For a graph point of naturalComp A_a.adjoint A_a, naturalComp_mem_domain implies input in Dom(A_a)=D. For a graph point of H, BE originalMinimalPhysicalNormalizedHamiltonian_domain and the definition of the natural adjoint square imply input in D. Apply the weak representative equivalences in both directions at that input. The resulting graph membership equivalence yields equality via LinearPMap.eq_of_eq_graph; NAG2 paired_native_selfAdjoint rewrites A_a.adjoint=A_a. NAG3 paired_native_core_closure then identifies the closure of the literal original core with A_a. Final output: actual partial-map equality naturalComp A_a A_a = originalMinimalPhysicalNormalizedHamiltonian M G, and hence exact natural domains and actions. Not merely formal core squares. Check the original CompleteSpace instance and conjugate-linear-first convention throughout.

## 4. Evidence boundaries and parallel track

This note supplies an explicit source-interface proof route, not native qualification. Prior qualified sources remain untouched. No finite raw contractions or integral replay performed in this interval. The 52-row/12-core candidate remains the preferred finite replay target; 56/12 is fallback. The NAG4 interval coverage audit is the starting inventory; its 41 ordered pairs in completed low/high rank-two square aggregates do not imply the other 103 are all unreplayed. Union partial receipts first, then missing rank-two rectangular derivatives, rank-three derivatives, complete design coverage, and literal weighted integrals. The archived positive fixed-regulator bounds are conditional; zero-energy existence, uniqueness, mass gap, and empirical validity remain open.

Truth-first: qualification of the common square is an operator-theoretic milestone, not validation of BFSS or the Hypothesis of Everything.
