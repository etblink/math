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

The isolated proof is strict-qualified at `759c4d76c333d9913f6bc7b17d510a5c1cbbbd63` in [run #45300860475](https://github.com/etblink/math/actions/runs/45300860475), job `138132726775`. Seven donor blob checks, pinned Lean 4.34.1 and Mathlib restoration, the 9,202-job native build, the independent quarter-turn compilation, and the strict success sentinel passed. Each declaration reports exactly `propext`, `Classical.choice` and `Quot.sound`.

The independently downloaded [original archive](../integration/evidence/msy-bosonic-plane-01-r1-original-green.zip) has 28,943 bytes. The recomputed SHA-256 is `b2b328d8b6aef6a9c52d3887a895f734c5b0e5199517288b25c9e78ccf4c70e9`, matching [provider artifact #14880051609](https://github.com/etblink/math/actions/runs/45300860475/artifacts/14880051609) and the upload log. All seven ZIP members pass CRC. Its tested SHA, source, consumer and workflow Git blobs, toolchain and manifest hashes, and both axiom reports match the checked run.

## Typed color contraction

The finite contraction uses the original `epsilon3 a b (2 : Fin 3)` in a complex module. For every summand family \(T\) and complex scale \(s\), the ordered color sum is \(s\mathbin{\cdot}(T_{01}-T_{10})\). The independent consumer uses the original `ColorIndex 2` and selects only the reversed ordered pair, obtaining \(-s\). Both statements keep the color indices explicit as `Fin 3`.

The source and independent importing consumer compile locally with Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. All three declarations report only `propext`, `Classical.choice` and `Quot.sound`. The first local consumer elaborated two identically printed but nonmatching sums. Naming the selector on `ColorIndex 2` and changing the finite sum to `Fin 3` before applying the contraction resolves the mismatch. [Strict run #45305437974](https://github.com/etblink/math/actions/runs/45305437974) qualifies the source and independent consumer at `4d03ff3b0bae8cc19a62c57dd3920e55d52cbba3`, job `138148038009`. The frozen-source preflight, pinned environment, 8,933-job native build, independent consumer, and strict success sentinel passed. The archived [original provider ZIP](../integration/evidence/msy-typed-color-table-r1-original-green.zip) has 6,502 bytes and seven CRC-checked members. Its independently recomputed SHA-256 `c18482a62002dbcd2a41c500a9d0624b03bf7ecde1a796dd353157fa55b8068b` matches [artifact #14881276595](https://github.com/etblink/math/actions/runs/45305437974/artifacts/14881276595) and the upload log. The artifact also matches the tested SHA, source, consumer and workflow blobs, and environment hashes. The two source declarations and the independent consumer report only the three standard Lean axioms.

The generator comparison can reuse `pairedColor_structureConstant` from the qualified IBI-G1B theorem. Unified integration carries its exact qualified source blob `b42291fe0aa5f8b22a31bad19b9de5c775372a71`. Its coefficient is already \(+\sqrt{2}\,\epsilon_{ab2}\) for the actual paired algebra. Once substituted, the original off-diagonal CAR reduces the difference of the two Majorana products, and the original \(i(-i/2)\) prefactor fixes the generator scale. The bounded source generator and finite exponential comparison remain separate proof obligations. [IBI-G1B qualification](../incidence-before-identity/IBI_G1B_R4_GREEN_43703395473_ACCEPTANCE_2026_11_15.md)
