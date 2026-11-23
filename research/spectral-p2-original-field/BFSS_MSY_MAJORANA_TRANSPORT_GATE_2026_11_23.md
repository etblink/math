# Reflected Appendix A Majorana transport

23 November 2026 · Unified integration · Strict candidate R1

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

## Next source comparison

Check whether the external action supplies a multiplicative representation of the same SU(2), with the same adjoint color coefficients on all 48 Majoranas. That covariance commutes with the spinor basis change. The existing S1H theorem `original_source_gauge_representation_unique` then fixes the full transported action, including the scalar phase. If the external evidence supplies the infinitesimal action first, use the contracted color operators to compare the normalized generators. The original L6G7K theorem `sourceFermionColorFlow_eq_actualGauge_apply` identifies the integrated source color flow exactly. After the gauge comparison, the common smooth-core charge comparison must use the ninth-axis reflection in the coordinate pullback and the matrix \(O\) on the charge output.

For internal reviewers and future project leads, this gate supplies a finite-dimensional interface for the original physical-ground-state work. Its claim ends at unitary CAR transport and the color contraction. The exact closure comparison and positive original kernel weight remain later obligations. The 0.9.1 edition has a documented cutoff at GM5E9. Record this step in the repository evidence and revisit the monograph boundary when the gauge and smooth-core comparison can be stated together.
