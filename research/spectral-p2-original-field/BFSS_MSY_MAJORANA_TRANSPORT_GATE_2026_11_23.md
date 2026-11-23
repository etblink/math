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

MSY specifies the normalized fermionic color bilinear \(\mathcal G_{ab}\) in Eq. (4) and the finite plane action \(\mathcal U(e^{tE_{ab}},1)=e^{t\mathcal G_{ab}}\) below Eq. (7). Appendix A.3 uses the same Cartesian annihilator convention as the source real and imaginary Majorana pair. Appendix A.4 adds a unitary change on the color index to define the spherical modes used by the released coefficients. The occupation signs and mode order in Eq. (A.9) are explicit. The data crosswalk must account for that color basis. [MSY, Sec. II and Appendix A](https://arxiv.org/html/2611.09837v1)

On the native \(+iT_c\) curve, the generator is \(\tfrac12\sum_{ab} f_{abc}\mathcal G^{\rm orig}_{ab}\). The existing Pauli-color theorem gives \(f_{abc}=\sqrt2\,\epsilon_{abc}\). For a cyclic triple this gives \(\sqrt2\,\mathcal G^{\rm orig}_{ab}\) by CAR, with adjoint tangent \(\sqrt2 E_{ab}\) in row-output, column-input convention. The predicted time match is therefore \(t_{\rm MSY}=\sqrt2\,t_{\rm orig}\). Test that sign and scale in Lean against a single literal native plane before generalizing to all axes. L6G7K already identifies the original exponential and exact exterior-Fock operator. The exact native ZYZ theorem can then extend the plane comparison to the whole source SU(2) via its adjoint map. S1H remains available if the external representation is supplied with full Majorana covariance. The next comparison must then transport the common smooth-core charges with the ninth-axis reflection on coordinates and \(O\) on the charge output.

For internal reviewers and future project leads, this gate supplies a finite-dimensional interface for the original physical-ground-state work. Its claim ends at unitary CAR transport and the color contraction. The exact closure comparison and positive original kernel weight remain later obligations. The 0.9.1 edition has a documented cutoff at GM5E9. Record this step in the repository evidence and revisit the monograph boundary when the gauge and smooth-core comparison can be stated together.
