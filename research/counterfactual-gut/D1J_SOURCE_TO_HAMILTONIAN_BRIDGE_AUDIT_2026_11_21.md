# D1J — D1I explicit Fock trial: original-source gauge, energy and form-domain bridge audit

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Audited D1I commit:** `b0f7d38c076aca6d04dd716f444589f9dc1660f6`.  
**Status:** source-read audit + analytic consistency check; **NO NEW LEAN QUALIFICATION, CI, PHYSICAL BFSS SPECTRUM OR HOPFION THEOREM**. Only counterfactual research documentation/ledger may be added; original sources, workflow, main and live RHOPF remain unmodified.

## Executive decision

D1I has a genuine explicit eight-particle reference seed and plausible gauge-equivariant spatial-patch family, but the *new* obstruction is **not** lack of an original 24-mode BFSS Fock gauge implementer: the repository already contains one. The unproved atoms are (i) equality of the D1I exterior-power color action with the existing original `pairedGaugeData.fermion` on the exact `Fermion 2` carrier, (ii) a source-typed smooth lift of the spatial Gamma rotor and Berry/derivative identities, (iii) source-exact expectation of the massless original fermionic multiplier in that state, and (iv) compactly-supported **gauge-invariant smooth-core/form-domain** construction and full energy bound. A form-variational strategy may avoid the stronger operator-domain membership required for an operator Weyl sequence.

### 1. Original gauge action is already constructed; the D1I-to-source *identification* is open

Frozen original `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b` defines `AlgebraData.GaugeData` and `physicalSpace = ⋂_g ker(bosonPullback g − fiberAction g)`. The following files exist, with exact checked branch blobs:

- `OperatorDependencies/SU2BFSSG3B24ModeOrthogonalLiftProbe.lean` (`3cdf867357ea2955bf9d88ec6f5f6a0f9228e92a`): `oneParticleMatrix g` is the eight-by-three block color representation on the original 24 complex modes. G3B alone does **not** implement Fock gauge.
- `OperatorDependencies/SU2BFSSG4AExteriorGaugeActionProbe.lean` (`141fbe74fc4883f686e05dbc702efb12c6fb8fab`): `exteriorGauge g = ExteriorAlgebra.map (orbitalGauge g)`; creation/annihilation covariance, vacuum fixed, group law.
- `OperatorDependencies/SU2BFSSG4EFermionHilbertUnitaryProbe.lean` (`7247844122ab870d31e92903db4c2ab561f98112`): `fermionGaugeUnitaryHom : GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)`, transported by `fockAlgebraToBFSS`; exact 24-mode exterior gauge unitary, not a replacement carrier.
- `OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean` (`e20c76fb22bc09d16dbcd8657333227cb34ed1ea`): `pairedGaugeData : pairedAlgebraData.GaugeData` and `pairedGaugeData_fermion_exact : pairedGaugeData.fermion = fermionGaugeUnitaryHom` by `rfl`.
- `Contrib/Kotler/OP2aOriginalFockGaugeSource.lean` (`328d607ee2bb45edd4268e5592d784c4c84488a7`): alias `originalFockGaugeUnitaryHom` to G4E's true Fock implementation.

Thus D1I's statement “source GaugeData Fock implementer missing” should be **narrowed**: *the existing representation is present*, but the explicit D1I seed/spatial rotor has not been transported and proved equivariant against it. The first source-exact target is an intertwining equality on original `Fermion 2` via `fockAlgebraToBFSS`, checked on the source's creation operators and occupied orbitals. The color stabilizer `exp(i θ ∑s_j)=1` is useful evidence, but does not substitute for this typed equality.

No fresh exact source+independent consumer gate was run for this D1J audit. Source declarations are inspected, not newly promoted.

### 2. Massless original core energy and the Hamiltonian are available separately

- `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a` provides `AlgebraData.massless_coreForm_energy`: on `SmoothCore N`, `coreForm f = (1/2) Σ ‖∂f‖² + ∫(deformedBosonicPotential 1 0 · ‖f‖² + inner_ℝ(f, deformedFermionField 1 0 · f))`. Historical strict source+consumer gate: #42325087575, as recovered in D1E; source unchanged on this branch.
- `P3M5BE0OriginalNativeHamiltonianPort.lean` blob `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1` gives the *original paired physical* normalized `H=(1/16)T†T`, natural operator domain, closed/self-adjoint action and weak-form characterization. Historical strict green: #43493125150, as recovered in D1E. This is a separate root.
- Original `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280` contains `deformedFermionField_bracket` at massless `h=1,m=0`, original `cubicFermionComponent`, and the massive `deformedFermionField_quantized` donor. The D1F specific massless `quantizeFrequency` comparison remains UNQUALIFIED after R1/R2/R3 red. The first required **physical** identity is the *actual source energy expectation* `⟨Ω, deformedFermionField 1 0 X Ω⟩`, which could be attacked using the already compiled massless bracket expression directly, without routing through D1F's unsuccessful massive-minus-zero proof. This is a proposed proof route, not a proved bypass.

Do not confuse a theorem for the smooth core, a separate self-adjoint H, and the missing fact that the **specific D1I trials** lie in the exact physical form domain with the desired energy estimate.

### 3. Independent check of the leading D1I Gaussian cancellation

A seemingly missing positive radial Born–Huang term is **already included** in D1H's exact selected scalar energy. For transverse dimension `d=16`, `ω=√2 r`, `φ_r(Y)=(ω/π)^4 exp(−ω‖Y‖²/2)`,

`∂_r log φ_r = 4/r − (√2/2)‖Y‖²` and flat-Gaussian expectation `(1/2)E|∂_r log φ_r|² = 1/r²`.

The same Gaussian has quartic `E det(YᵀY)=7/r²`. The leading nonflat SVD Jacobian `j=1−‖Y‖²/r²+det(YᵀY)/r⁴` modifies the leading transverse oscillator/frozen-fermion cancellation by `−8/r²`. These `+1+7−8=0` terms cancel in the **selected Gaussian model**, consistent with D1H's exact
`E_selected(r)=−13(2√2 r³−7)/(r²(r⁶−4√2 r³+7))=O(r⁻⁵)`.

The separate D1I leading cutoff integrals recompute:
- `I_8/I_10 = 0.40944312140`;
- radial cutoff `(1/2)∫t¹⁰(χ′)²/∫t¹⁰χ² = 17.39253562074`;
- leading Fock angular `12 I_8/I_10 = 4.91331745676`;
- with flat-endpoint C∞ step `β(z)=s((z−0.15)/0.45)`, `s(v)=e^(−1/v)/(e^(−1/v)+e^(−1/(1−v)))` for `0<v<1`, patched by 0 and 1, `C_β≈18.33784582865`, spatial cutoff `(C_β/2)I_8/I_10 = 3.75415241788`.
- **Selected leading prescreen total remains** `K=26.06000549538`, *not* `26.4694486`. The latter mistakenly double-counts the Gaussian radial term without its compensating Jacobian/transverse-potential contributions.

This cross-check **does not** bound the exact residual from every cutoff, chart/frame derivative, original fermion expectation or Berry connection. K is not yet the certified full physical quadratic-form coefficient.

### 4. Smooth-core and form-only route: exact missing propositions

The original `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` defines `SmoothCore N = TestFunction ⊤ (Fermion N) ⊤`, not generic H¹ or a convenient standalone oscillator Hilbert space. Work on the simple top singular-value chart `r>σ_max(Y)` and `u_8>0.15` with `r∈(R,2R)`; ensure a truly C∞, flat-endpoint angular cutoff (not a merely polynomial cubic “smoothstep”) and a C∞ tube cutoff equal to 1 near Y=0. For every finite R:

1. Construct `Ω(u,n)` in original `Fermion 2`, prove it smooth as a **vector**, not just a ray/covariance, and prove its source `pairedGaugeData.fermion` covariance including the SU2 center.
2. Prove `Ψ_R` extends by zero through chart/cutoff boundaries to an element of original `SmoothCore 2`, has nonzero norm and lies in `pairedGaugeData.invariantCore`, hence in the physical charge-form domain. Prove phase/Berry and angular/tube derivatives on the full chart, not only Y=0.
3. Use the already-qualified smooth-core massless energy identity to calculate or bound the *full* normalized `q[Ψ_R]`, with the source scalar and original Fock multiplier. Prove `q[Ψ_R]≤C/R²+o(R⁻²)` for disjoint supported `R→∞` or a weaker `q[Ψ_R]→0` sufficient for the goal.
4. Establish normalized pairwise orthogonality by disjoint radial supports in `r(X)`, and use the nonnegative closed form and associated self-adjoint physical H to infer 0 in essential spectrum by the form min-max/spectral projection principle. This **does not require** each Ψ_R ∈ `Dom(H)` or `‖HΨ_R‖→0` (those stronger conditions would be needed for a direct operator Weyl sequence).

If any step fails, preserve the specific source/type/analytic obstruction without converting a technical RED into a physical no-go. Even if successful, it would address a continuum/escape mechanism, **not** a physical hopfion, a mass gap, an SM fermion family or unification.

## D1J decision / stop rule

**Next bounded gate D1K:** original paired Fock gauge intertwiner and smooth vector construction, then source massless trial expectation and full form estimate. Begin with source-text/independent algebra checks and one typed microtheorem at a time; do **not** rerun D1F R4 or launch broad CI from this note. Reuse all three historical D1F REDs and existing accepted massless/physical-H sources. No new original source changes, no direct RHOPF work and no spectral claim.
