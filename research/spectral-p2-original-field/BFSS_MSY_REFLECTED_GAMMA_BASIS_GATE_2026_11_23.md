# Reflected Appendix A gamma basis

23 November 2026 · Unified integration · Strict qualification candidate

The [original physical ground-state crosswalk](BFSS_ORIGINAL_PHYSICAL_GROUND_STATE_CROSSWALK_2026_11_23.md) identifies a sign difference in the ordered product of the nine gamma matrices. The original paired algebra uses the Gamma9 source with product \(-I\). Appendix A of Michel–Scheinpflug–Yin has product \(+I\) in its displayed tensor order. An exact basis map \(P/2\) pairs the two after a reversal of the ninth spatial axis. The [independent reproduction](tools/bfss_reproduce_msy_gamma_and_gaussian.py) derives the external tables from Appendix A and checks all nine generator equations, the Gram normalization, and the failed identity-axis comparison. [arXiv:2611.09837v1, Appendix A](https://arxiv.org/html/2611.09837v1#A1)

The Lean candidate ties a finite integer table definitionally to the original Gamma9 source. It verifies that \(P^\mathsf T P=4I\) and the reflected identities
\[
A_iP=s_iPS_i,\qquad (A_i A_j)P=s_i s_j P(S_i S_j),
\qquad s_i=1\ (i\ne9),\quad s_9=-1.
\]
The independent importing file exercises the positive first axis, the negative ninth axis, a mixed-sign plane, and the Gram normalization. The external table transcription has a separate reproducibility check against the paper's equations.

The single-generator identity is the coefficient comparison needed for the first-order kinetic term. The product identity is the corresponding check for the quadratic position terms. A future smooth-core transport needs the actual Fock unitary intertwining all 48 CAR generators, the associated gauge action, and derivative and multiplication compatibility under the spatial reflection. Those are independent interfaces. Any mismatch in a literal coefficient or the gauge action stops the physical transport. The gate's scope ends at the finite gamma coefficient comparison.

## Fock pairing check

In both conventions the complex modes pair consecutive spinor labels. Let \(J\) be the direct sum of eight copies of the real two-dimensional complex structure, and \(O=P/2\). The exact integer check shows that the Gram matrix of \(B=(O+JOJ)/2\), the complex-antilinear component of the selected map, is an orthogonal projector of real rank eight. Its complex rank is four per color. In these occupation conventions the transformation mixes creators and annihilators, so the finite CAR unitary must implement the actual Majorana transformation. The generator-preserving unitary in [the existing independent Clifford construction](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3JIndependentUnitaryExistenceProbe.lean) is the reuse target. Its remaining inputs here are Hermiticity, the delta-one CAR and irreducibility for the rotated external generators on their actual Fock module. The independent external calculation and the source Lean gamma check do not construct that lift.
