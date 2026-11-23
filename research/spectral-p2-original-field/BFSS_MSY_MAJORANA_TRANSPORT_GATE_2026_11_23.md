# Reflected Appendix A Majorana transport

23 November 2026 · Unified integration · Strict candidates R1 and R2

The previous [gamma gate](BFSS_MSY_REFLECTED_GAMMA_BASIS_R1_GREEN_ACCEPTANCE_2026_11_23.md) identifies the literal Appendix A gamma matrices after reversing spatial axis nine. Write \(O=P/2\) for the normalized matrix, with columns giving the original spinor coordinates in the Appendix A basis. The [pairing check](BFSS_MSY_REFLECTED_GAMMA_BASIS_GATE_2026_11_23.md) found a complex-antilinear part of complex rank four at each color. The proof therefore uses real Majoranas and the existing original Fock unitary theorem.

For any finite-dimensional nonzero complex inner-product space with an irreducible Hermitian delta-one CAR family \(\theta^A_{\beta a}\), define

\[
  \widetilde\theta_{\alpha a}=\sum_{\beta} O_{\beta\alpha}\theta^A_{\beta a}.
\]

The column Gram identity gives the same delta-one CAR for \(\widetilde\theta\). The real coefficients preserve Hermiticity. The row Gram identity recovers every \(\theta^A_{\beta a}\), so the two families have the same invariant submodules. The existing M3J theorem then gives a complex-linear isometric equivalence \(J\) from that fiber to the original \(\mathrm{Fermion}(2)\), with \(J\widetilde\theta_{\alpha a}=\theta^{\mathrm{orig}}_{\alpha a}J\).

The same row Gram identity leaves each fermionic color contraction invariant:

\[
  \sum_\alpha\widetilde\theta_{\alpha a}\widetilde\theta_{\alpha b}
  =\sum_\beta\theta^A_{\beta a}\theta^A_{\beta b}.
\]

The independent importing proof uses the existing paired BFSS Fock space and checks the coordinate formula and the contracted color operators on actual Fock vectors. This test exercises the basis direction and both factors in the bilinear. The hypotheses of the unitary theorem still need to be bound to the external Appendix A CAR realization.

## Strict attempts

[R1 run #45252301296](https://github.com/etblink/math/actions/runs/45252301296) at `8b4da474e6dd3dea07d531a8e09d4fcbfde94a88` passed source and environment preflight. Native compilation failed in the 9,123-job build at line 88, column 8 of `BFSSMSYMajoranaTransport.lean`. The Kronecker delta remained inside nested scalar actions, preventing the Gram-sum rewrite in the positive color diagonal case. Lean reported `sorryAx` for the dependent isometry declaration. Native compilation stopped before the independent consumer.

The [original provider ZIP](../integration/evidence/msy-majorana-transport-r1-original-red.zip) from [artifact #14857660761](https://github.com/etblink/math/actions/runs/45252301296/artifacts/14857660761) contains 18,511 bytes. Its six members passed CRC and its tested SHA, Git blobs, environment hashes and first native error were independently checked. SHA-256 is `c461fccfc2fe7a1c1f551b15b708bc1e18e7776c322b85fcf9ebf1a62df644f8`.

R2 reduces the delta pointwise before summing the surviving terms. The repaired algebra compiles locally with the original reflected gamma source. A separate prescreen using the Fock donor interface also compiles the source and consumer proof bodies. The exact [R2 run #45254359502](https://github.com/etblink/math/actions/runs/45254359502) tests commit `4c7aeb721761de4b4cb3642ae22bdb7cd8d4ff1c`. The candidate status is pending strict qualification.

## Next source comparison

MSY specifies the normalized fermionic color bilinear \(\mathcal G_{ab}\) in Eq. (4) and the finite plane action \(\mathcal U(e^{tE_{ab}},1)=e^{t\mathcal G_{ab}}\) below Eq. (7). Appendix A.3 uses the same Cartesian annihilator convention as the source real and imaginary Majorana pair. Appendix A.4 adds a unitary change on the color index to define the spherical modes used by the released coefficients. The occupation signs and mode order in Eq. (A.9) are explicit. The data crosswalk must account for that color basis. [MSY, Sec. II and Appendix A](https://arxiv.org/html/2611.09837v1)

With zero-based labels \((A,c,\rho)\), Appendix A orders spherical modes as \(6A+2c+\rho\). The source Cartesian pairing orders the corresponding labels as \(6A+3\rho+c\). Reuse the source exterior-algebra map on the one-particle unitary, including this order, so the induced map on occupied modes carries the required fermionic signs. Perform this transport before applying the real spinor basis map to Cartesian Majoranas.

On the native \(+iT_c\) curve, the generator is \(\tfrac12\sum_{ab} f_{abc}\mathcal G^{\rm orig}_{ab}\). The existing Pauli-color theorem gives \(f_{abc}=\sqrt2\,\epsilon_{abc}\). For a cyclic triple this gives \(\sqrt2\,\mathcal G^{\rm orig}_{ab}\) by CAR, with adjoint tangent \(\sqrt2 E_{ab}\) in row-output, column-input convention. The predicted time match is therefore \(t_{\rm MSY}=\sqrt2\,t_{\rm orig}\). Test that sign and scale in Lean against a single literal native plane before generalizing to all axes. L6G7K already identifies the original exponential and exact exterior-Fock operator. The exact native ZYZ theorem can then extend the plane comparison to the whole source SU(2) via its adjoint map. S1H remains available if the external representation is supplied with full Majorana covariance. The next comparison must then transport the common smooth-core charges with the ninth-axis reflection on coordinates and \(O\) on the charge output.

Let \(\mathcal R\) reverse the ninth spatial coordinate for every color and let \(Wf(x)=Jf(\mathcal R x)\). In the Appendix A output coordinates the proposed charge equation is

\[
  W(Q^{\mathrm{A}} f)=O\,Q^{\mathrm{orig}}(Wf),
\]

where \(W\) on the left acts separately on each of the sixteen output components. The map from Appendix A to the original charge output is therefore \(O^{\mathsf T}\) after applying \(W\). The signed chain rule cancels the gamma sign in the kinetic term. The two reflected position factors cancel the two gamma signs in the cubic term. The independent kinetic and cubic definitions in `FCPIndependentKineticCharge.lean` and `FCPIndependentCubicCharge.lean` already fix the finite sums and operator order. Their current intertwining theorems assume exact gamma equality and transport only the fiber. The new obligations are spatial pullback on the test core, the signed term identities, and restriction to the actual gauge-fixed core.

## Connection to the positive radial regulator

The reflection preserves \(R(x)=\lVert x\rVert\), and the orthogonal output rotation commutes with multiplication by each scalar radial weight. If the common-core map identifies the unweighted charge graphs, transport of the regularized weighted domain can reuse the original RAD-C3 inverse-image graph and the reciprocal multiplier. RAD-C4B already supplies the normalized weighted adjoint square and its weak form. RAD-C4C identifies its kernel with the original physical Hamiltonian kernel for each fixed positive regulator. [RAD-C3](P3_AUX_RAD_C3_R1_GREEN_43570463487_ORIGINAL_PHYSICAL_WEIGHTED_GRAPH_ACCEPTANCE_2026_11_13.md) · [RAD-C4B](P3_AUX_RAD_C4B_R1_GREEN_43587088274_NORMALIZED_WEIGHTED_OPERATOR_WEAK_FORM_ACCEPTANCE_2026_11_14.md) · [RAD-C4C](P3_AUX_RAD_C4C_R1_GREEN_43589307044_ORIGINAL_WEIGHTED_KERNEL_PRESERVATION_ACCEPTANCE_2026_11_14.md)

For a normalized trial vector in the relevant domains, the squared weight is \(R^2+\varepsilon^2\), so the weighted form satisfies \(q_\varepsilon=q_0+\varepsilon^2 q_H\). At \(\varepsilon=1\), the published bounds imply \(q_1\le 8.63\times10^{-7}\) in the paper's units, compared with the Appendix B threshold \(\kappa^{-1}\approx0.37917\). This arithmetic uses the reported trial bounds. It leaves the trial-domain and singlet checks, the Hardy-to-fidelity argument on the bound source domain, and independent verification of a trial upper bound as separate obligations. The large margin makes a certificate for one trial below the threshold a sufficient existence target. [MSY, Eq. (31) and Appendix B](https://arxiv.org/html/2611.09837v1) · [Fixed-positive-regulator research](../methodology/BFSS_PROJECT_BIRDS_EYE_SYNTHESIS_POST_C4C_2026_11_14.md)

For internal reviewers and future project leads, this gate supplies a finite-dimensional interface for the original physical-ground-state work. Its claim ends at unitary CAR transport and the color contraction. The exact closure comparison and positive original kernel weight remain later obligations. The 0.9.1 edition has a documented cutoff at GM5E9. Record this step in the repository evidence and revisit the monograph boundary when the gauge and smooth-core comparison can be stated together.
