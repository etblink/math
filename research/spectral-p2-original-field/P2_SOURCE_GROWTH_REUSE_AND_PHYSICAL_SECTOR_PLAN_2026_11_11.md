# BFSS P2 forward research — reuse the original growth theorem and physical-sector building blocks

**Recorded:** 2026-11-11 Pacific, while strict P2-C0 run #43169341680 was in progress.
**Track:** source-audited, candidate-neutral forward research, not new Lean proof qualification.
**Branch:** research/bfss-p2-original-field-20261111; **unified parent:** b603f4c1715e15f5f92c69d7fb071992dbaa9f40.
**Governance:** no new branch or original Lean edit; continue directly on unified integration after any duly authorized qualifying fast-forward. Incidence-before-identity remains isolated on its own pilot branch.

## 1. The original source ALREADY proves a general linear field-growth bound

Exact source: lean/OAI/MathematicalPhysics/BFSS/PotentialBounds.lean, Git blob
06afe0a2fa0c6d65439ad15e4e6031f1d43260b7.

The file defines the **literal original** massless-and-massive source operators as polarized real-linear maps on the actual Boson N and Fermion N carriers; it does not substitute the newer normalized Gram observable.

Named source declarations:
- OAI.BFSSQuantum.AlgebraData.bracketBilinear (line 22);
- OAI.BFSSQuantum.AlgebraData.massLinear (line 31);
- OAI.BFSSQuantum.AlgebraData.deformedRealField_polarized (line 37);
- OAI.BFSSQuantum.AlgebraData.deformedRealField_derivative_bound (line 71);
- OAI.BFSSQuantum.AlgebraData.fermionGrowthConstant (line 96);
- OAI.BFSSQuantum.AlgebraData.fermionGrowthConstant_nonneg (line 100);
- OAI.BFSSQuantum.AlgebraData.deformedFermionField_growth (line 104);
- OAI.BFSSQuantum.AlgebraData.deformedFermionField_inner_lower (line 136).

Let M0 = FCP.BFSSSU2Full.concreteAlgebraData : AlgebraData 2, the actual original normalized-Pauli/real-gamma/48-Majorana source from SU2BFSSFullAlgebraDataProbe.lean, blob de8242615e4b2959e2dfa57cf0c6fdf43896acb7. Write C0=M0.fermionGrowthConstant. Its source value is a finite real sum:

    C0 = (1/16) sum_(alpha,p) ||M0.kineticSkewSymbol alpha p||
         (2 ||M0.bracketBilinear alpha|| + ||M0.massLinear alpha||).

It is nonnegative without any extra hypothesis. Substitution into the EXISTING general growth lemma at coupling 1 and mass 0 gives the proposed exact original concrete field statements:

    ||M0.deformedFermionField 1 0 X|| <= C0 ||X||
    -C0 ||X|| ||z||² <= inner_R z (M0.deformedFermionField 1 0 X z).

These are **mathematical specializations of the source's existing proofs**, not a new signed coefficient identification or newly strict-checked Lean theorem. The massLinear norm remains in C0 even at mass zero because the general source estimate absorbs both terms; it is a harmless loose upper bound. No assertion C0<=96 or C0=8sqrt(3) is licensed without a separate bound.

### Proposed minimal concrete source theorem after C0 integrates

Import (a) OAI.MathematicalPhysics.BFSS.PotentialBounds and (b) the actual SU2BFSSFullAlgebraDataProbe.lean module; use only their existing declarations. A minimal candidate Lean design (UNCOMPILED) is:

    theorem originalMasslessFermionField_growth (x : Boson 2) :
        ||M0.deformedFermionField 1 0 x|| <= M0.fermionGrowthConstant * ||x|| := by
      simpa only [abs_one, abs_zero, one_mul, add_zero] using
        (OAI.BFSSQuantum.AlgebraData.deformedFermionField_growth M0 1 0 x)

The actual Lean proof uses the norm symbols and a concrete M0 abbreviation or fully-qualified expression; exact syntax and namespace/API are to be checked by the cold compiler. A second theorem instantiates deformedFermionField_inner_lower. The two independent consumers should check C0 >= 0 and deduce M0.deformedFermionField 1 0 (0 : Boson 2) = 0 from the growth bound; neither consumer should reprove a generic field lemma.

First enforce exact source blobs and imports; then source build + separate consumer + allowed axiom report; never infer strict qualification merely because the generic proof is printed in a repository.

## 2. Immediate original smooth-core consequence — not coercivity

The exact source massless_coreForm_energy from
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean,
blob 3a8dd27bb573e62c8f86b79b83e0ab96f391602a, gives for original smooth core f:

    coreForm_M0(f) =
      (1/2) sum_p ||derivative_p f||_(L2)^2
      + integral [ V_M0(X) ||f(X)||²
                   + inner_R(f(X), B_M0(X) f(X)) ].

Combined with the concrete growth theorem (once its source consumer is qualified), the pointwise field term is bounded below by -C0 ||X|| ||f(X)||². Therefore the conditional core-level inequality is

    coreForm_M0(f) >= (1/2) sum_p ||derivative_p f||_(L2)^2
                       + integral [ (V_M0(X)-C0 ||X||) ||f(X)||² ].

This **does not imply** global coercivity or compact resolvent: V vanishes on commuting valleys while the negative linear term remains. The missing ingredient remains transverse oscillator exclusion on a genuine physical high-Spin reducing sector and passage to the original closed physical form.

For any finite C0 and fixed 0<beta<1, one can choose an integer oscillator cutoff m high enough that sqrt(beta)*(m+9)>C0. This proves only numerical feasibility of the **conditional** margin. It does not prove nonempty source-exact physical sectors with lambda_2>m+6, source Spin9/Fock-vector action, slice-to-core intertwining, or closed-form preservation.

## 3. Reuse an EXISTING gauge-fixed Fock vacuum — no new model

lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean,
blob a16d3573b737bb4453e42b0b543d63cbbac1cd1b, already contains:

- originalFermionVacuum_ne_zero;
- originalFermionVacuum_fixed(g), for every actual source SU(2) gauge element;
- originalFermionVacuum_mem_fixed;
- originalFermionGaugeProjection_vacuum.

These are on the LITERAL original Fermion 2 Hilbert fiber, not a substitute spinor model. This narrows the gauge-nonemptiness obstacle to using the exact original gauge action on a suitable smooth-core bosonic multiplier. Gauge invariance of a spatial polynomial, multiplied by a nonzero gauge-fixed fiber vector and a smooth radial compact cutoff, can give a nonzero original gauge-fixed core candidate once the source action is explicitly matched.

CAUTION: an original gauge-fixed vector is not necessarily a Spin(9)-invariant vector, nor an automatic reducing-sector vector. Do not import the operator-algebra Spin9 action as though it were a continuous Fock-vector implementation.

## 4. High-type polynomial via already existing bosonic Gram invariants

Previously preserved analytical construction in
contributions/bfss-kotler/BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md,
section 7. Define complex isotropic linear forms w1=e1+i e2, w2=e3+i e4 on spatial R9 and color vectors x^a in R9. Put

    y_a=w1·x^a,  z_a=w2·x^a,
    P(X) = sum_(a<b) (y_a z_b-y_b z_a)^2.

All squares and dot products here are complex BILINEAR, not Hermitian absolute squares. The finite Lagrange identity gives

    P(X) = (sum_a y_a²)(sum_a z_a²) - (sum_a y_a z_a)^2
         = G_C(w1,w1) G_C(w2,w2) - G_C(w1,w2)^2,

where G_C is the complex-bilinear extension of the source bosonic spatial Gram matrix G_ij=sum_a X_i^a X_j^a.

The existing source module
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean,
blob 5633ef2ed7cf182edaee171fb45273d325103b94,
proves the original real spatial Gram is SU(2)-gauge-invariant. This provides a **source reuse path** to P's gauge invariance, without importing or promoting the separate incidence pilot. P is nonzero on x^1=e1,x^2=e3,x^3=0; it vanishes on commuting rank-one valleys. Its powers P^k are prospective bosonic highest-weight (2k,2k,0,0) polynomials in the November 7 ANALYTICAL argument.

Taking a suitable nonzero smooth radial compactly supported cutoff chi, the actual gauge-fixed Fock vacuum v, and f_k(X)=chi(||X||²)P(X)^k v gives an explicit **candidate original gauge-physical test-function family**. A rigorous source claim still requires the exact gauge action and a nonzero compatible cutoff. The resulting f_k need not be a single Spin9 type unless the genuine Fock-vector Spin9 action and its decomposition are constructed; the conditional operator-algebra construction in the November 7 memo is **not** sufficient to promote physical vector-isotypic membership.

This is the key distinction: original SU2 gauge covariance and nonzero gauge-fixed **fiber** are largely source-proved; original Spin9 action on Fock **vectors**, source Spin8 stabilizer identification, correct vector weight-six bound, and reduction of the original closed Hamiltonian remain open.

## 5. Revised sequencing after current C0 strict acceptance

**C0:** finish pinned P2-C0 source/consumer acceptance. Do not let the latest green alone silently authorize promotion.

**Integration:** verify ancestry and audited diff, obtain explicit owner approval, non-force fast-forward the qualified C0 package into integration/bfss-unified-research-20261108. Preserve the current research branch and original strict evidence. **Return to direct forward development on unified integration branch** by owner's instruction. Create no P2-C1 or P2-C2 research branch for routine incremental proof work.

**C2 first:** qualify the source-concrete linear-growth theorem and inner-lower statement by importing existing PotentialBounds.lean, with independent consumers (including x=0) and cold source pins. Preserve the signed -8 coefficient route separately as an optional sharp-normalization crosscheck, not a gate prerequisite for existence of finite C0.

**Physical join:** combine OP2c source vacuum, VLY0A spatial Gram invariant and conditional P^k highest-weight construction. Then prove the genuine continuous source Spin9 Fock-vector implementation, source Spin8 branching and charge/form covariance. Gate the source high-weight nonemptiness and the physical closed form together; no leap from a coarse bosonic quotient or operator-valued star action.

**Form closure:** bring the resulting same-sector radial moment estimate into the actual BH historical physical Hamiltonian closed form, preserving exact domain and independent present-tree qualification boundaries. Avoid replacement Hamiltonians.

**Hard stop:** do not claim a spectral gap, mass gap, eigenpair, compact resolvent or source physical high-type reducing sector merely from growth, vacuum and bosonic polynomials. All exact current-tree strict evidence and unproved hypotheses remain separately docketed.

## 6. Evidence/governance of this note

Source-based analysis only, no new Lean/CI run or source change. In particular, it does not alter the currently running P2-C0 strict workflow's source and consumer inputs, and it cannot itself establish strict source qualification. All future mathematical source writes occur on the unified branch **after** authorized integration, consistent with the owner's requested return to that workflow.
