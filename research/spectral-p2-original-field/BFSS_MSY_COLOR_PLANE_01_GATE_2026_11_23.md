# Appendix A color-plane comparison

23 November 2026 · Unified integration · R1 and R2 native RED; architecture stop

[Strict run #45260614151](https://github.com/etblink/math/actions/runs/45260614151) tests commit `7eea73abee40ea3998b3939b361fce28be5cd81e`. The frozen-source preflight and local roadmap check pass. A local typed interface prescreen checks the new proof bodies with the donor signatures. The original R1 native source build failed; neither the source nor the independent Fock consumer qualified. A bounded R2 candidate retains the original theorem statements and independent consumer obligations. See the R1 failure receipt.

This comparison starts from the [qualified reflected Majorana transport](BFSS_MSY_MAJORANA_TRANSPORT_GATE_2026_11_23.md) and works on the actual native positive-\(i\) Pauli-Z curve. Color labels are zero-based here. The plane \((0,1)\) is the paper's color plane \((1,2)\).

In the paper, \(E_{01}\) has entry \(+1\) in row 0, column 1, and \(-1\) in row 1, column 0. The native \(+iT_2\) curve is the previously checked native \(Z\) witness at angle \(-\sqrt{2}\,t\) in the standard real Z-rotation convention used by that witness. The explicit sine and cosine entries in the Lean statement are those of \(\exp(\sqrt{2}\,t E_{01})\) in the paper's convention. The independent consumer checks that at \(t=\pi/(2\sqrt2)\) the first color basis vector is sent to minus the second. [MSY, Eq. (7) and the following plane-action convention](https://arxiv.org/html/2611.09837v1#S2) · [Qualified incidence-track Z image](../incidence-before-identity/IBI_G0C_Z_IMAGE_R2_GREEN_43755443223_ACCEPTANCE_2026_11_15.md)

The source bounded generator is \(i(-i/2)\sum_{\alpha,a,b} f_{ab2}\theta_{\alpha a}\theta_{\alpha b}\). The accepted Pauli formula gives \(f_{ab2}=\sqrt2\,\epsilon_{ab2}\). The two nonzero summands are the ordered \((0,1)\) and \((1,0)\) terms, which agree after applying the off-diagonal CAR. The native operator is therefore \(\sqrt2\) times the bilinear in the paper's Eq. (4). Conjugation by the Fock isometry commutes with the operator exponential. The previously checked L6G7K identity equates that native exponential with the actual original exterior-Fock action. This yields a finite action comparison for every real time in this plane, conditional on the all-generator Majorana intertwiner. [MSY, Eq. (4)](https://arxiv.org/html/2611.09837v1#S2)

The importing consumer uses the literal paired Fock space and checks one isometry for every plane time, in addition to the independent bosonic quarter-turn check. The external Appendix A spherical occupation realization, the second plane needed for an Euler extension, and the smooth-core charge comparison remain open. The native time sign is relevant when those comparisons are combined with the inverse bosonic pullback.

## Occupation-basis controls for the next source comparison

For zero-based flavor \(A\), color \(c\) and spin \(\rho\), the spherical creation mode has label \(6A+2c+\rho\). The original Cartesian creation mode has label \(6A+3\rho+a\). Appendix A.4 gives \(f_{\mathrm{cart}}=U f_{\mathrm{sph}}\) on annihilation columns, so a spherical creation mode maps to the indicated column of \(U\) in the Cartesian creation basis. The one-particle map has entries

\[
W_{6A+3\rho+a,\,6A+2c+\rho}=U_{ac}.
\]

Exact symbolic checks give \(W^* W=I_{24}\) and send the ordered exterior basis element on spherical modes 1 and 2 to

\[
-\tfrac1{\sqrt2}e_2\wedge e_3-\tfrac{i}{\sqrt2}e_2\wedge e_4
\]

in Cartesian order. This tests the reorder sign and the complex conjugation convention together. The column of Cartesian annihilator components transforms infinitesimally by \(-E_{01}\), while the bosonic color matrix uses \(+E_{01}\). The same symbolic calculation gives \(U^*(-E_{01})U=\operatorname{diag}(-i,0,i)\), in agreement with Eq. (A.8). [MSY, Eqs. (A.7)–(A.9)](https://arxiv.org/html/2611.09837v1#A1.SS4)

Reuse the existing exterior-algebra creation map and contraction identity from G4A. Generalize the occupation-inner-product induction from G4D to this explicit unitary matrix. It uses the orbital unitarity relation and the vacuum and contraction identities. The resulting map can check the literal Appendix A occupation action on the original Fock fiber. If that realization supplies the full adjoint covariance, S1H fixes the entire transported gauge representation and its phase. The native ZYZ factorization remains available as a separate route using two finite color planes.

## Current strict status

The bounded [R2 strict run #45271008022](https://github.com/etblink/math/actions/runs/45271008022) failed at `0b791ba369332de53f0f139d79f4ac788c3beffb`; source-native elaboration and fixed-color-sum proof errors remain. The independent consumer did not qualify. The [R1/R2 RED receipt](BFSS_MSY_COLOR_PLANE_01_R1_NATIVE_RED_AND_R2_BOUNDED_REPAIR_2026_11_23.md) records the original provider artifact hashes, exact native diagnostics, two-native-RED architecture stop, and prospective isolated finite table/generator/action proof boundaries. Do not infer a physical counterexample or promote a theorem from a partial axiom report.

## Isolated bosonic adjoint comparison

The joined R2 native log contains a standard-axiom report for the bosonic adjoint declaration. The native failure elsewhere prevented its importing quarter-turn control. The isolated source uses the same adjoint proof with the two matrix donor imports. Its independent consumer tests the `(1,0)` entry at native time `π / (2√2)` against `−1`. The stopped joined gate remains the record of the fermionic proof obligations.

The isolated proof is staged for a fresh strict run. The exact source and consumer preflight passes with the seven donor blobs pinned and explicit `Fin 3` indices in the independent check. The R2 axiom report controls the extracted proof body. The new strict run must establish the standalone source build and the independent result together.

The next fermionic calculation can use the two-entry support of `epsilon3 a b (2 : Fin 3)` over a generic additive module before substituting the source operators. The specialization should check the Pauli structure constant, off-diagonal CAR and complex scalar normalization separately before the finite exponential comparison.
