# FCP–BFSS original gauge-invariant Majorana bilinears and twisted Spin(9)/RP8 quadratic bundles

**Date:** 2026-11-10 (America/Los_Angeles).  
**Branch:** `integration/bfss-unified-research-20261108` in `etblink/math`.  
**Program:** Foundational Convergence Program, candidate-neutral BFSS research.  
**Status:** EXACT PINNED-SOURCE INTEGER ARITHMETIC + ABSTRACT REPRESENTATION-THEORY DEDUCTIONS + CONDITIONAL STANDARD TOPOLOGY. **NOT** a newly Lean-qualified bilinear/topology theorem, physical Hilbert-space sector, spectral theorem, chiral generation index, or empirical result.  
**Trigger:** A Grok exploratory handoff was considered informally; its conclusions were **not** adopted or promoted. This memorandum preserves the independent subsequent research, not an endorsement of the handoff.

## 0. Prior source and reproducibility

Literal [nine real original gamma matrices](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean): Git **blob `b9b8192055c70f0d001d7982669b9823c55562ed`**, a fixed collection of nine symmetric \(16\times16\) signed permutations. The source already proves their real Clifford anticommutators. All new finite matrix counts reported here were performed using **exact integer operations on this particular source**, not numerical diagonalization or an alternate textbook Clifford model. The source gamma real-linear square law is in [SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean); actual group covariance is recorded in [SpectralSourceNineGammaCovariance.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean).

A new [source-Git-blob-pinned Python 3 stdlib checker](tools/bfss_majorana_bilinear_rp8_exact_check.py) is supplied. From repo root:

```sh
python3 research/unification/tools/bfss_majorana_bilinear_rp8_exact_check.py
```

It reads and rejects drift of the **literal gamma source**; checks all Clifford squares/anticommutators, 120 skew gamma words and Gram orthogonality, rank 56/64 and polarization 64/56 split, exact Fock SU(2) singlet parity counts, and finite mod-two binomial polynomials. **The script is provided for reproducibility and has not passed a new independent CI execution in this research pass; it does not prove the bundle topology or physical claims.**

Prior related documents, *not superseded*: [original 3×16 family no-go](BFSS_THREE_BY_SIXTEEN_SPIN9_SPIN10_FAMILY_FEASIBILITY_2026_11_10.md), [real source Spin9 commutant](SPIN9_SOURCE_GAMMA_COMMUTANT_SYMMETRY_LADDER_2026_11_10.md), [original Hopf clutching and color tripling](SPIN9_EQUIVARIANT_HOPF_BUNDLE_CLUTCHING_AND_COLOR_TRIPLING_2026_11_10.md), [RP8 physical-gauge and no-descent distinctions](CATEGORY_THEORY_GAUGE_DESCENT_HOPF_NO_GO_2026_11_10.md), and [Fock polarization/S2](BFSS_SOURCE_FOCK_POLARIZATION_SINGLET_TOPOLOGY_RESEARCH_2026_11_10.md).

External generic Spin(9) cross-check: [The Role of Spin(9) in Octonionic Geometry](https://www.mdpi.com/2075-1680/7/4/72), Section 3, states \( \Lambda^2\mathbb R^{16} = \Lambda^2_{36}\oplus\Lambda^2_{84}\) and identifies the two- and three-gamma products as bases. This is a *known representation-theoretic fact*, not an original discovery of the representation decomposition. The original-source finite exact certificate and its gauge/quotient implications are the new analysis.

## 1. The complete 120 real gauge-invariant quadratic Majorana coefficient directions

The literal original SU(2) gauge Majorana real-label module, transported through the existing G1A source equivalence (do **not** replace the actual `Fin 24 × Fin 2` labeling in Lean), is abstractly

\[
V_{48}=C\otimes S,\qquad C=\mathbb R^3_{\mathrm{adj}},\quad S=\mathbb R^{16}_{\mathrm{Spin}(9)}.
\]

The full real antisymmetric quadratic coefficient space is \(\Lambda^2V_{48}\). Characteristic-zero tensor decomposition gives

\[
\Lambda^2(C\otimes S)
\cong (\Lambda^2 C\otimes\operatorname{Sym}^2 S)
\oplus(\operatorname{Sym}^2 C\otimes\Lambda^2 S).
\]

For the irreducible **real** SU(2) adjoint \(C\), \((\Lambda^2C)^{SU(2)}=0\) and \((\operatorname{Sym}^2C)^{SU(2)}=\mathbb R\cdot\delta_C\). Thus

\[
\boxed{(\Lambda^2V_{48})^{SU(2)}\cong\Lambda^2S
\cong\mathfrak{so}(16),\qquad \dim=120.}
\]

The natural candidate bounded original-Fock operators are color-contracted Majorana commutators

\[
B_{\alpha\beta}=\tfrac12\sum_{A=1}^{3}
[\theta_{\alpha A},\theta_{\beta A}],\qquad \alpha<\beta.
\]

They use **actual** original theta operators on `Fermion 2`, not an abstract Clifford substitute. The source G4E Fock gauge unitary, G4H original paired-theta covariance, and G3A output-\(B\)/input-\(A\) adjoint orthogonality suggest

\[
U_qB_{\alpha\beta}U_q^{-1}=B_{\alpha\beta}.
\]

This covariance **is a candidate, not qualified here in Lean**; its Fock realization, source normalized CAR basis map/injectivity, and independent consumer require a separate strict gate. Even if true it only gives *gauge-invariant bounded operators*, not operators commuting with the original Hamiltonian nor reducing any gauge-physical closed domain. This claim is about quadratic **Majorana coefficient** invariants; it does not classify arbitrary interacting/composite Fock observables.

## 2. Exact original gamma skew basis: 36 + 84

For the nine exact original symmetric \(\gamma_i\) with \(\gamma_i^2=I\), \(\gamma_i\gamma_j+\gamma_j\gamma_i=0\) for \(i\ne j\), form

- \(M_{ij}=\gamma_i\gamma_j\) for \(i<j\): **36** matrices;
- \(T_{ijk}=\gamma_i\gamma_j\gamma_k\) for \(i<j<k\): **84** matrices.

Each of the 120 is **real skew-symmetric**. The exact signed-permutation source arithmetic gives \(\langle X,X\rangle_{\mathrm F}=16\) and \(\langle X,Y\rangle_{\mathrm F}=0\) for every distinct pair of these matrices, where \(\langle X,Y\rangle_{\mathrm F}=\operatorname{tr}(X^TY)\). They form an orthogonal basis for \(\mathfrak{so}(16)\).

Under the actual Spin(9) action, this is the known two-irreducible representation decomposition

\[
\boxed{\Lambda^2S\simeq\Lambda^2\mathbb R^9\oplus
\Lambda^3\mathbb R^9=\mathbf{36}\oplus\mathbf{84}.}
\]

An immediate **scope-limited negative**: on this specific SU(2)-invariant quadratic Majorana coefficient module with **unbroken full Spin(9)**, there are no three distinct nonzero *fixed irreducible* family types. This does **not** prohibit higher-degree gauge-invariant Fock composites, configuration-dependent equivariant sectors or symmetry breaking. The physical generation count is **not derived**.

## 3. Moving, antipodal-invariant projectors over the full RP8

Let \(n\in S^8\) be a unit vector in the *original* nine-dimensional spatial representation and write \(G(n)=\sum_i n_i\gamma_i\). Its Clifford square is \(I_{16}\); it is symmetric and has eigenspaces \(S_+(n),S_-(n)\) of real dimensions 8 and 8. The individual eigenspace bundles \(E_+\), \(E_-\) over \(S^8\) are exchanged by \(n\mapsto-n\), and the earlier source-clutching obstruction prevents an ordinary individually labeled \(E_+\) descent to \(\mathbb{RP}^8\).

Now take the **distinct carrier** \(\Lambda^2S\), and define

\[
K(n)=\Lambda^2(G(n)),\quad K(n)^2=I,\quad
K(-n)=K(n).
\]
\[
Q_\pm([n])=\tfrac12(I\pm K(n)).
\]

The equalities show that \(Q_\pm\) are well-defined **continuous smooth real projector families on \(\mathbb{RP}^8\)**. On \(\Lambda^2S\), \(\gamma_8\)-conjugation has the following checked eigenvalue counts:

| Original gamma words | \(K=+1\) | \(K=-1\) |
| --- | ---: | ---: |
| \(\gamma_i\gamma_j\): 36 bivectors | 28 | 8 |
| \(\gamma_i\gamma_j\gamma_k\): 84 trivectors | 28 | 56 |
| **Total** | **56** | **64** |

For general \(n\), the ranks follow from \(S_+\oplus S_-=\mathbb R^{8+8}\):

\[
\Lambda^2S=(\Lambda^2S_+\oplus\Lambda^2S_-)
\oplus (S_+\otimes S_-);
\quad \dim Q_+=28+28=56,\quad \dim Q_-=64.
\]

The projectors transform as a family under Spin(9), rather than being fixed full-Spin(9)-invariant subspaces. They do not contradict the previous no-descent of the **rank-eight** \(E_+\) or the rank-24 color triple; the carrier and descent problem differ. These 56/64 real quadratic bundles must not be conflated with the distinct **complex mixed-two-fermion rank-16 projector over special \(S^2\)** in our earlier Fock-polarization memorandum.

## 4. Topological derivation and independently checkable algebra

Set \(X=\mathbb{RP}^8\), let \(L\to X\) be its tautological **real** line, and \(Q=L^\perp\) the real rank-eight orthogonal complement in the trivial rank-nine spatial bundle:

\[
L\oplus Q\cong\underline{\mathbb R}^9.
\]

The source gamma square defines an **explicit algebraic** bundle isomorphism

\[
c:L\otimes\underline{\mathbb R}^{16}\xrightarrow{\;\cong\;}
\underline{\mathbb R}^{16},\quad c(v\otimes s)=\Gamma(v)s,
\]
with inverse fiberwise given by multiplication by \(\Gamma(v)\) for unit \(v\) (globally well-defined because the formula is linear in the tautological-line vector). Hence **\(16L\) is trivial**. This is a standard Clifford-module construction; its complete source-bundle formalization is not yet Lean-qualified.

With the Clifford identification from §2, the descended eigenspace bundles have natural real bundle descriptions:

\[
\boxed{\mathcal E_{56}\simeq\Lambda^2Q\oplus
(L\otimes\Lambda^2Q)}
\]
\[
\boxed{\mathcal E_{64}\simeq(L\otimes Q)\oplus\Lambda^3Q.}
\]

**Derivation:** at a chosen unit \(n\), conjugation by \(G(n)\) is positive on the gamma bivectors in \(\Lambda^2 n^\perp\) and on gamma trivectors with exactly one \(n\) index, and negative on bivectors with one \(n\) and trivectors entirely in \(n^\perp\). The \(n\)-slot transforms as the tautological line \(L\); the perpendicular directions form \(Q\). The individual summands are not artificial new physical fields.

Let \(x=[L]-1\in\widetilde{KO}^0(X)\). Apply the ordinary lambda-ring identity

\[
\lambda_t(Q)=\frac{(1+t)^9}{1+Lt},\qquad [L]^2=1.
\]
Consequently,
\[
[\Lambda^2Q]=37-9[L],\qquad
[\Lambda^3Q]=93-37[L].
\]
Substitution into the two bundle formulas yields
\[
[\mathcal E_{56}]=28+28[L],\quad
[\mathcal E_{64}]=92-28[L],
\]
and therefore
\[
\boxed{[\mathcal E_{56}]-56=28x,\qquad
[\mathcal E_{64}]-64=-28x.}
\]

The explicit \(16L\) trivialization gives \(16x=0\). Conversely \(w(kL)=(1+a)^k\), \(a=w_1(L)\) and \(H^*(\mathbb{RP}^8;\mathbb F_2)=\mathbb F_2[a]/(a^9)\); for **every** \(1\le k<16\), some positive-degree binomial term survives. Hence \(kx\neq0\) for these \(k\), and **\(x\) has exactly order 16**. The two reduced classes are \(12x\) and \(4x\), both order **four**.

Stable Stiefel–Whitney naturality gives

\[
w(\mathcal E_{56})=(1+a)^{28}=1+a^4+a^8,\quad
w(\mathcal E_{64})=(1+a)^{-28}=(1+a)^4=1+a^4
\]
in \(H^*(X;\mathbb F_2)\). Both have nonzero \(w_4=a^4\) and are **nontrivial real vector bundles**. Their direct sum is the trivial 120-dimensional skew-matrix bundle; no contradiction.

**Evidence ceiling:** Gamma identities and ranks were checked from literal integer source data; the lambda-ring identities, projective cohomology, SW calculations and KO logic are **standard mathematical deductions** contingent on the prescribed source-equivariant bundle identifications. The *complete* corresponding source-specific real bundle and Spin(9) equivariance theorem has **not** been checked in Lean. The [KO/RP8 computation in algebraic topology lecture notes](https://math.uchicago.edu/~amathew/256y.pdf) independently identifies \(\widetilde{KO}(\mathbb{RP}^8)\cong\mathbb Z/16\), consistent with the argument.

## 5. Existing Fock polarization gives a different 64+56 decomposition

The **G1A original Fock pairing complex structure** is \(J_{\rm pair}=\gamma_0\gamma_7\gamma_8\); the literal source signs give \(J_{\rm pair}^2=-I\) and \(J_{\rm pair}\gamma_8=\gamma_8J_{\rm pair}\). Its conjugation action on \(\mathfrak{so}(16)\) has eigenspace dimensions 64 and 56:

\[
\mathfrak{so}(16)=\mathfrak u(8)\oplus\mathfrak m,\qquad 64+56=120.
\]

Exact original gamma-word classification:

| Gamma words | \(J\)-commuting | \(J\)-anticommuting |
| --- | ---: | ---: |
| 36 bivectors | 18 | 18 |
| 84 trivectors | 46 | 38 |
| **Total** | **64** | **56** |

These are fixed-polarization number-preserving vs pairing-type **quadratic coefficients**. In contrast, the RP8 \(K(n)\)-classification is **56+64** and moves with \(n\). The decompositions do not coincide; neither should silently be treated as conserved physical particle species. Pairing labels do not automatically yield a source Spin(9) **Fock-vector** unitary.

## 6. A separate Fock-singlet parity obstruction

The original 24 complex Fock modes are eight copies of the complexified SO(3) color triplet, \(W=(\mathbb C^3_{\rm adj})^{\oplus8}\). The invariant metric and volume form give an **SU(2)-equivariant complex-linear degree-reversing map** \(\Lambda^k\mathbb C^3_{\rm adj}\simeq\Lambda^{3-k}\mathbb C^3_{\rm adj}\). Applying it on one of the eight factors exchanges even and odd total exterior parity and commutes with the SU(2) action. Thus isolated Fock even and odd parity pieces, and in particular their SU(2)-invariant singlet subspaces, are representation-isomorphic.

Independently, with complex adjoint SU(2) weights \(-2,0,+2\), the exact graded character is
\[
(1+t)^8(1+tz^2)^8(1+tz^{-2})^8.
\]
The SU(2)-singlet multiplicity in degree \(k\) is weight-zero minus weight-two; computing the integer coefficients gives **366,080** isolated Fock gauge singlets, split **183,040 even and 183,040 odd**. Thus the **isolated fermionic singlet parity superdimension** is exactly zero.

This is **not** a Witten index, not a theorem about the complete boson-dependent joint gauge-physical `FullL2` Hilbert space, and not a proof that the original BFSS Hamiltonian preserves a hypothetical parity-reversing intertwiner. It only removes a naive finite-Fock-singlet explanation for a nonzero integer family count.

## 7. Pin geometry and integer-index limits

For \(\mathbb{RP}^8\), \(w(TX)=(1+a)^9\); therefore \(w_1(TX)=a\neq0\) and \(w_2(TX)=\binom92a^2=0\). Abstractly \(X\) admits a \(\mathrm{Pin}^+\) structure but no Spin/Spin-c structure; a \(\mathrm{Pin}^-\) structure is obstructed by \(w_2+w_1^2=a^2\). A Pin-type geometric Dirac operator is a possible *mathematical question*, **not** a four-dimensional chiral Weyl index or an original BFSS operator constructed here.

The reduced real KO classes \(28x\) and \(-28x\) are torsion (order four). Any **additive homomorphism** from that torsion subgroup to \(\mathbb Z\) vanishes. Therefore these classes, alone, cannot yield a nonzero integer index of three through such a homomorphism. This is a precise stop condition, **not** a universal no-go against twisted equivariant indices, another background, an operator on a larger physical space, or independent emergent four-dimensional chirality.

The color factor of 3 in earlier \(\widetilde{KO}(S^8)\) results remains the original adjoint **color** multiplicity, not three observed families. Neither present obstruction nor new bundle topology establishes a physical theory of generations.

## 8. Proof-DAG-First next steps and adversarial checks

**Two independent research lanes, neither automatically launched by this exploratory memorandum:**

- **BIL-0 (cheapest operator atom):** Use actual G4H `pairedAlgebraData_fermion_adjoint`, G4E `fermionGaugeUnitaryHom`, and G3A `adjointColorMatrix_orthogonal` to prove the source bounded operator identity \(U_qB_{\alpha\beta}=B_{\alpha\beta}U_q\) on *original* `Fermion 2`. Distinguish color input/output orientation, explicit commutator scalars, and independent downstream consumer. Do not turn this into an unbounded-Hamiltonian claim.
- **BIL-1:** Independently construct a literal source 120-element gamma skew basis in Lean (36 two-products, 84 three-products), prove exact linear independence and the Spin9 submodule types. Avoid a bulk all-vector proof or expensive unbounded import if smaller finite certificates suffice.
- **TOP-0:** Formalize \(K(-n)=K(n)\), idempotence and ranks 56/64; then verify Spin9 *family equivariance* and source-index reindexing, separate from Fock action.
- **TOP-1:** Only after inspecting pinned Mathlib bundle/KO characteristic-class APIs, formalize the \(L,Q\) bundle identifications, classes and obstruction; keep the RP8 coarse quotient distinct from the **full SU(2) gauge action groupoid**.
- **PHYS:** Determine if any resulting operator is compatible with the original gauge-physical Hilbert space, original closed quadratic form and domains; seek real physical observables and a genuinely selected 3+1D chiral index, rather than relying on numerical 3.

**Hard falsifiers / red flags:** source gamma blob drift; loss of output/input color ordering; missing real-vs-complex/Fock normalization; claiming fixed Spin9 invariance for moving \(Q_\pm([n])\); conflating complex S2 mixed projector with real RP8 quadratic bundles; treating coarse RP8 as the full physical quotient; treating torsion KO as integer chiral index; claiming SU2 gauge-invariant bilinears commute with the Hamiltonian without a separate source proof.

**Governance:** Read-only source and exact finite arithmetic exploration produced this memo; committing the document and checker does **not** modify original BFSS Core, source Majorana definitions, frozen strict CI manifests, FCP canonical source window, framework adjudications, or publication claims.
