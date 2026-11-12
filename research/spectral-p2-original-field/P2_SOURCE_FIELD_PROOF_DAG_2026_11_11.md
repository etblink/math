# P2 original SU(2) BFSS massless field — source-exact proof contract

**2026-11-11 Pacific.** Exploratory and conventional mathematics, not a new Lean-qualified theorem.  
**Parent SHA:** b603f4c1715e15f5f92c69d7fb071992dbaa9f40 (unified integration after Edition 0.7).  
**Objective:** Bind the original unnormalized field appearing in the exact source smooth-core form, prove its signed skew-Majorana coefficient identity, then qualify a finite linear-growth bound on the literal Fermion 2 carrier. No GUT/ToE or original eigenpair theorem is asserted.

## Source-pinned definitions

- Core.lean (blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60): original AlgebraData N, 16 source charges, delta-one CAR, original gammaTwo and 1/16 coreForm.
- PotentialBasis.lean (blob bc9b526284166efcba5a8e296adc79ba88e6764d): source potential matrix, beta-alpha column, source bosonic potential with exact factor 1/2.
- MixedEnergy.lean (blob cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e): original ordered remainderField is kineticSkewSymbol multiplied by the real Fréchet derivative of the potential field.
- DeformedCharge.lean (blob c27c913c44090100f0c714e3eb34e25205f4d2d3): source kineticSkewSymbol contains -i, and deformedFermionField is (1/16) times the real-linear remainderField.
- SU2RealGammaProbe.lean (blob b9b8192055c70f0d001d7982669b9823c55562ed): public 9 real symmetric signed-permutation Clifford gamma matrices.
- SU2BFSSFullAlgebraDataProbe.lean (blob de8242615e4b2959e2dfa57cf0c6fdf43896acb7): original normalized Pauli colors, actual source 48 Majoranas and gamma.
- BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean (blob cfd3e1eeed420ce92ca54821816f4a53e073ad4a): reusable actual original Fock color quadratic, NOT the same as original source linear fermionic field.
- SpectralMasslessCoreFormIdentity.lean source blob 3a8dd27bb573e62c8f86b79b83e0ab96f391602a, integrated strict run #42325087575.
- Historical BH closed original physical Hamiltonian: FCP strict run #39096180117. Its current import differs only by two import paths and one letI/let statement; no current-port strict requalification is claimed.

## P2-C0: original bosonic potential

For the pinned positive normalized Pauli convention f_abc=sqrt(2) epsilon_abc and spatial color vectors x_j in R^3,

    coordinateBracket(x,j<k,a)=sqrt(2) sum_(b,c) epsilon_abc x_j^b x_k^c
    deformedBosonicPotential(1,0,x)
       = 1/2 sum_a sum_(j<k) coordinateBracket(x,j<k,a)^2
       = sum_(j<k) ||x_j cross x_k||^2
       = sum_(a<c) ||X^a wedge X^c||^2.

The source factor 1/2 cancels sqrt(2)^2. This equality is conventional algebra and exactly integer-checked, not yet an independently qualified specialization of the existing color-cross theorem to literal concreteAlgebraData. A nonzero rank-two consumer should catch a missing factor 2.

## P2-C1: signed contraction — general Clifford proof

Factor sqrt(2) out of the source massless potential matrix, using the real symmetric source gamma_i, with i,j,k,l in 0,...,8:

    P_c(X) = - sum_(j<k) sum_(b,d) epsilon_cbd X[j,b] X[k,d] gamma_j gamma_k.
    V_alpha(X) = sqrt(2) sum_(c,delta) P_c(X)[delta,alpha] theta_(delta,c).
    A_(alpha,i,a) = -i sum_beta gamma_i[alpha,beta] theta_(beta,a).

The original ordered remainder has coefficient

    H[(beta,a),(delta,c)]
      = sum_(alpha,i) gamma_i[alpha,beta] (partial_(i,a)P_c)[delta,alpha].

Its exact signed coefficient theorem is

    H[(beta,a),(delta,c)](X) = -8 K0[(beta,a),(delta,c)](X),
    K0[(beta,a),(delta,c)] = sum_(d,l) epsilon_dac X[l,d] gamma_l[beta,delta].

Proof: the derivative of the source j<k product is

    partial_(i,a)P_c =
      -sum_(k>i,d) epsilon_cad X[k,d] gamma_i gamma_k
      -sum_(j<i,d) epsilon_cda X[j,d] gamma_j gamma_i.

Because gamma_i is symmetric, the alpha contraction multiplies the derivative matrix by gamma_i on the RIGHT. For each fixed l,d, i<l contributes +epsilon_cad gamma_l using gamma_i gamma_l gamma_i=-gamma_l. For i>l the contribution is again +epsilon_cad gamma_l using gamma_i^2=1 and epsilon_cda=-epsilon_cad. There are l+(8-l)=8 contributions. Finally epsilon_cad=-epsilon_dac and gamma_l is symmetric, proving H=-8K0.

Restoring the source -i, sqrt(2) and 1/16 factors gives the candidate exact operator identity

    B_source(X) = (i/2) sum_(p,q) K_pq(X) theta_p theta_q,
    K_pq(X)=sqrt(2) K0_pq(X),
    p=(beta,a), q=(delta,c).

This is SIGN-SENSITIVE: a norm check alone cannot detect the wrong sign. The actual source deformedFermionField has type Fermion 2 ->L[R] Fermion 2, but the quadratic RHS naturally has type Fermion 2 ->L[C] Fermion 2. The Lean equality must compare the original real-linear field with the RHS after restrictScalars R, and must establish the derivative of the literal source operator-valued potential. No new surrogate model or change in ordered theta multiplication is admissible.

## P2-C2: coarse growth gate before sharp optimization

Original delta-one CAR and self-adjoint theta imply theta_p^2=I/2 and ||theta_p theta_q||<=1/2. The coefficient normalization gives

    ||K(X)||_HS^2=64||X||^2
    ||B_source(X)||_op <= (1/4) sum_(p,q)|K_pq|
                       <= (1/4)*sqrt(48*48)||K||_HS
                       =96||X||.

This is a proposed conservative original-source bound, contingent on first proving P2-C1 and the source-typed coefficient trace identity. No global Spin(48) implementer is needed for this elementary operator estimate. The previously audited 8 sqrt(3) bound is sharper but invokes a skew normal form and should remain a later optimization. At beta=0.49, C=96 and m=129 the conditional moment margin is 0.7*(129+9)-96=0.6, but this **does not** establish an actual nonempty high-weight physical sector, the vector weight-six cutoff, source exclusion or form-domain reduction.

## Verification performed and exact limitations

The companion test script uses exact integer matrices and the literal source gamma signed-permutation tables:
- all 9 gamma matrices exactly match the source permutation/sign rows and satisfy Clifford symmetry/anticommutators;
- original potential equality on 67 exact integer configurations, including a missing-half adversarial mutation;
- all 243 ordered color/spatial derivative blocks satisfy H=-8K0;
- all 27x27=729 coefficient-basis pairings satisfy <K0_d,l,K0_e,m>=32 delta; wrong sign and missing factor 2 controls fail.

**No local Lean compiler or the complete pinned source dependency closure was available.** These diagnostics are a falsification check, not source mathematical qualification, and do not show any physical bound state.

## Smallest Lean source/consumer dependency DAG

1. C0a: exact normalized Pauli structure constants (+sqrt(2) epsilon), with orientation-specific consumer.
2. C0b: instantiate original source deformedBosonicPotential 1 0 on literal concreteAlgebraData; rank-two factor-two consumer.
3. C1a: source P_c as the actual beta-alpha potential matrix, with swapped-index sign consumer.
4. C1b: actual Fréchet derivative of quadratic P_c, preserving both j<i and i<k sums, with basis-vector consumer.
5. C1c: gamma contraction H=-8K0 via public symmetric Clifford lemmas, independent signed basis consumer.
6. C1d: original deformedFermionField 1 0 equality to restrictScalars R of the ordered complex Fock quadratic, no theta reordering.
7. C2a: original coefficient HS trace normalization for source gamma + Pauli, orthogonality consumer.
8. C2b: original delta-one theta product norm + finite Cauchy-Schwarz -> 96 r, genuine Fermion 2 consumer.

**Stop rules:** mismatched index orientation, missing one-half, wrong signed -8, use of the auxiliary normalized Gram field, or a real/complex source-type mismatch. One new lemma/independent consumer per strict gate. Reuse the accepted importable source modules, not unimportable diagnostics (JOIN-0B3 historical red). Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; strict source/consumer cold compilation, no new axioms, exact hashes and accepted green are required before any qualification promotion. Keep the physical Fock-vector weight 6 separate from operator-algebra weight 12.

**Governance:** documentation and a reproducible diagnostic only. No existing Lean, accepted CI, FCP, unified, manuscript, or main state is modified here.
