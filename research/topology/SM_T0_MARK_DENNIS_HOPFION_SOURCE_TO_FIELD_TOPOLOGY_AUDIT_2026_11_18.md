# SM-T0 — Mark R. Dennis, optical skyrmionic hopfions, and source-qualified topological inference

**Date:** November 18, 2026. **Branch:** integration/bfss-unified-research-20261108. **Parallel but separate from** SM-P0N9 nuclear mechanism research.

**Classification:** QUALIFIED_LITERATURE_RELEVANCE and CONDITIONAL_HOPF_SPINOR_ALGEBRA_CONSUMER_PASS, but **NO** Maxwell apparatus replication, independent optical Skyrme metrology, physical particle existence theorem, energy-stability proof, BFSS or NFC model confirmation, or 0νββ mechanism.

## Research purpose

Mark R. Dennis and collaborators have demonstrated how a designed and measured physical field can realize topological particle-like structures. We should study **what precisely was measured, which topology was defined, which mathematical invariants persisted, and what the physical dynamics did or did not establish**. This is a productive source of transferable *methods* for any new theory of field structure, including possible future NFC/Hopf or other topological alternatives. It does not choose a winning ontology or imply that a photon field texture is an elementary massive particle.

This is a truth-first comparison with BFSS and Standard Model physics, **not an attempt to validate any one framework**.

## Original source facts (not assumptions to import into unrelated physics)

1. Sugic, Droop, Otte, Ehrmanntraut, Nori, Ruostekoski, Denz & Dennis, **Particle-like topologies in light**, Nature Communications 12, 6785 (2021), https://doi.org/10.1038/s41467-021-26171-5 . The team produced a free-space light field with spatially varying amplitude, phase and polarization and used full volumetric reconstruction to characterize a three-dimensional optical skyrmionic hopfion. Their measured finite-volume Skyrme number was approximately **0.945**, while the source quotes a theoretical value approximately **0.997 under the same experimental boundary conditions**. These near-integers are not exact integer-valued measurements of an ideal map on all compactified space.
2. Ehrmanntraut, Droop, Sugic, Otte, Dennis & Denz, **Optical second-order skyrmionic hopfion**, Optica 10, 725–731 (2023), https://doi.org/10.1364/OPTICA.487989 . A distinct experimental higher-order 3D polarization-and-phase realization: the approach is not restricted to one simplest linking configuration.
3. Parmee, Dennis & Ruostekoski, **Optical excitations of Skyrmions, knotted solitons, and defects in atoms**, Communications Physics 5, 54 (2022), https://doi.org/10.1038/s42005-022-00829-y . Uses optical excitation to engineer rich atomic texture analogues, highlighting how topology can be transported to a *new physical carrier only through an explicit interaction map*.
4. Mark Dennis, 2024 SPICE workshop abstract, https://www.spice.uni-mainz.de/tba-58/ , explains the full optical hypersphere versus polarization-only Poincaré-sphere relation and specifically discusses linked and knotted higher-degree configurations.

**Crucial reading:** The full optical state contains **two complex circular-polarization components**, so when normalized and nonvanishing it takes values in a 3-sphere S³ (four real components with one norm constraint). Its *projective polarization* lives on S², obtained via the Hopf map. Omitting the optical phase loses information required for the full S³ Skyrme-degree characterization. A photograph of a loop, knot or pair of linked polarization singularities is not by itself a certified topological degree.

## Layer 0: reusable explicit S³→S² mathematics

Take a smooth complex spinor ψ=(z1,z2) with |z1|²+|z2|²=1, hence ψ∈S³. Its polarization direction (Bloch/Poincaré sphere) is

n=(2 Re[z1 conjugate(z2)], 2 Im[z1 conjugate(z2)], |z1|²−|z2|²) ∈ S².

For any real phase χ, n(e^{iχ}ψ)=n(ψ). The **full spinor** and its projective direction are different carriers: the common optical phase is visible to the full hypersphere map but invisible to the Stokes n.

On real 3-space, let r²=x²+y²+z². A mathematically exact **toy** normalized spinor is

z1=2(x+i y)/(1+r²),       z2=(r²−1+2i z)/(1+r²).

The algebraic identity |z1|²+|z2|²=1 holds at every finite point. As |r|→∞, ψ→(0,1) independent of direction, so the map extends continuously from the one-point compactification R³∪{∞}≅S³ to S³. This is a standard stereographic parameterization, **not** a source reproduction of the 2021 laboratory beam.

Under the Hopf projection:
- The **north pole** of S² has inverse image z2=0, equivalently z=0 and x²+y²=1: a closed circle in 3-space.
- The **south pole** has inverse image z1=0, equivalently x=y=0: the z-axis completed at the compactification point ∞.
- On compactified S³ these two regular fibers are linked once (up to orientation). This is the canonical Hopf-fibration example of nontrivial linking; the local consumer checks the analytic fiber equations at sample points, **not** a numerical linking integral or a formal theorem about all fibers.

The classical homotopy classes [S³,S³] and [S³,S²] carry integer invariants (mapping degree and Hopf invariant). **Do not conflate their definitions** or assume that one measured near-integer equals an exact infinite-domain invariant. Identifying a Hopf projection is also different from establishing an original field's gauge, energy, or time-evolution dynamics.

## What the local independent consumer tested

File: research/standard-model/tools/sm_t0_hopf_fibration_consumer.py, with machine-readable provenance research/standard-model/data/SM_T0_DENNIS_HOPF_MATH_BRIDGE_2026_11_18.json.

Local Python standard-library execution **PASS** for:
- ψ has exactly unit S³ norm at tested 3D locations.
- n has unit S² norm and is unchanged under a common complex phase.
- Analytic north/south fiber samples satisfy the projected pole condition.
- The spinor tends toward the same limiting state along three distinct large-radius directions.

**Intentional negative controls:** a raw optical field with E_R=E_L=0 makes its normalized spinor undefined at that point; a normalized oscillating field without a unique boundary value at spatial infinity cannot be one-point compactified as assumed. Therefore neither warrants an unqualified global integer charge from the toy formula. No actual Maxwell beam reconstruction, Skyrme-density integral, numerical Hopf integral or stability calculation was run.

## FCP/BFSS source-to-physics counterfactual test

| Object | What survives abstractly | Missing physical premise | What cannot follow |
|---|---|---|---|
| Optical ψ:R³→S³ of Dennis et al. | Can support measured, near-integer finite-domain Skyrme texture; Hopf-fiber polarization topology | Full experimental boundary/reconstruction needed to assign measured charge | A new elementary particle identity, mass spectrum or gravity |
| Toy smooth ψ and n | Exact normalized spinor and Hopf projection identities; canonical linked fibers | No Maxwell solution or measured optical dynamics | A light-beam apparatus or stable skyrmionic particle |
| Magnetic or atom-field hopfions | Similar target-space topology can occur for different field carriers | Material-specific Hamiltonian, coupling, energetic terms | That they share identical physical particles/dynamics |
| Existing NFC S⁸ and Hopf-tower ideas | Formal topology and fibrational constructions may motivate tests | Original 3+1D field carrier, source maps, constraints, equations of motion, stability and observational discriminants | Three lepton families, neutrino mass, PMNS or TOEs from topology alone |
| BFSS original SU(2)/Spin(9) SU(2) matrix mechanics | Source-qualified Clifford/Fock/operator results on particular types | Specific 3+1D lepton map and original physical dynamics / observables | A direct identification of an optical S³ spinor with 48 Majorana operators or a BFSS mass gap |

**Adversarial topological counterfactual:** keep the same S³→S² Hopf map, but put it on a distinct physical field with a different kinetic term or boundary energy. The *abstract topology* remains while the stability, size, dispersion, mass and observable interactions change. Thus **topological equivalence is not physical equivalence**. A theory claiming topological particles must identify what actually stabilizes them, including boundary energies, nontrivial nonlinearities or external confinement and relevant variational/Derrick-scaling issues.

**SCC methodology reuse:** change field normalization, remove a component, change boundaries, change the dynamics, or add zeros; record which invariants can persist and which observables change. Preserve failed invariant reconstructions as negative knowledge rather than fitting a desired winding number.

## Most promising actual transfer

The strongest contribution from Dennis's work is an **experimental topological-metrology program**, not a particle identity claim:

1. Select a *specific physical field carrier* and a measurable complete set of complex components.
2. Define boundary compactification and locate all zeros/singularities.
3. Specify exact map and invariant (S³ degree, S² Hopf charge, knot/link type); do not use those labels interchangeably.
4. Build an independent numerical/topological consumer for measured field samples; stress-test sampling, missing phase, zeros, noise and boundary truncation.
5. Prove or measure a *physical dynamics* and protection mechanism before labeling a texture a stable soliton; derive a separate channel-specific observable if proposing a fundamental particle.
6. Compare candidate topological models with non-topological competitors under the same experimental information. Develop a new original model **only** if it makes additional independent falsifiable predictions existing models do not.

This is suitable as a stand-alone exploratory topology workstream subordinate to the truth-first program; it should not interrupt the current FCP governance window or reopen frozen NFC conclusions as established physics. No new physical claim was admitted and no new proof/CI gate was launched.
