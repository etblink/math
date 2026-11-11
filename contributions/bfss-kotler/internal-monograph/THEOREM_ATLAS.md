# Source-verified mathematical theorem and dependency atlas

**Status:** internal working inventory, not a new theorem or a fresh CI acceptance.

**Source snapshot:** `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`. The machine-readable companion is `THEOREM_ATLAS.json`.

The *dependencies* listed below are **narrative/scientific prerequisites**, not necessarily the exact Lean import DAG. A strict-green receipt is always tied to its tested commit; the source blob identifies the file inspected for this manuscript.

## Evidence status vocabulary

| Status | Meaning |
|---|---|
| `SOURCE_DEFINITION` | Definition present in original source; not a standalone strict theorem receipt |
| `HISTORICAL_STRICT` | Historical FCP green for original source; current port requires separate confirmation |
| `INTEGRATED_STRICT` | Strict green in etblink/math at cited tested commit, not necessarily latest exact branch head |
| `SOURCE_PRESENT_REQUIRES_RECEIPT` | Current source read and declaration verified; exact strict receipt not independently checked here |
| `PENDING_STRICT_GATE` | Candidate present; no qualification conclusion as of snapshot |
| `ANALYTICAL_CONDITIONAL` | Conventional argument under stated assumptions, not a Lean-qualified physical source theorem |
| `OPEN_PROOF_OBLIGATION` | Research target, no exact accepted Lean theorem |

## Theorem and definition index

| ID | Ch. | Object or result | Evidence | Dependencies |
|---|---:|---|---|---|
| `D-01` | 2 | The original carriers and dimensions | `SOURCE_DEFINITION` | — |
| `D-02` | 3 | Original gamma, theta, and CAR source data | `SOURCE_DEFINITION` | `D-01` |
| `D-03` | 4 | The original 16 charge operators and quadratic core form | `SOURCE_DEFINITION` | `D-01`, `D-02` |
| `G-01` | 5 | The original gauge-invariant physical Hilbert subspace | `SOURCE_DEFINITION` | `D-01`, `D-02` |
| `G-02` | 5 | Nonzero normalizable physical radial bump | `HISTORICAL_STRICT` | `G-01` |
| `G-03` | 5 | Nonzero SU2-invariant original Fock vacuum and projection | `INTEGRATED_STRICT` | `D-02` |
| `H-01` | 6 | Density of the original physical charge domain | `HISTORICAL_STRICT` | `D-03`, `G-01` |
| `H-02` | 6 | The original normalized self-adjoint physical Hamiltonian | `HISTORICAL_STRICT` | `H-01` |
| `H-03` | 6 | Identity of the native and historical paired physical Hamiltonians | `HISTORICAL_STRICT` | `H-02` |
| `F-01` | 3 | Faithfulness of the original Clifford-to-Fock operator map | `INTEGRATED_STRICT` | `D-02` |
| `F-02` | 3 | Original complex Clifford/Fock algebra equivalence | `INTEGRATED_STRICT` | `F-01` |
| `S-01` | 7 | Connectedness of the exact source ninth-axis stabilizer | `INTEGRATED_STRICT` | `D-01` |
| `S-02` | 7 | Compact source stabilizer and its quotient parameterization | `INTEGRATED_STRICT` | `S-01` |
| `S-03` | 8 | Original active Majorana covariance under source Spin(9) operator action | `INTEGRATED_STRICT` | `F-01`, `S-01` |
| `S-04` | 8 | Original Fock operator Spin(9) physical-star action | `INTEGRATED_STRICT` | `S-03` |
| `S-05` | 8 | Trace invariance of the original Fock operator action | `INTEGRATED_STRICT` | `S-04` |
| `S-06` | 9 | Source Spin(9) and SU2 color commute on 48 labels | `SOURCE_PRESENT_REQUIRES_RECEIPT` | `S-03`, `G-01` |
| `A-01` | 10 | Original massless core-energy identity | `INTEGRATED_STRICT` | `D-03` |
| `A-02` | 11 | Uniform first radial moment gives L2 tightness | `INTEGRATED_STRICT` | `D-01` |
| `A-03` | 11 | Smooth-core local/global compactness from gradients and moment | `INTEGRATED_STRICT` | `A-02` |
| `A-04` | 11 | Weighted closure compactness | `INTEGRATED_STRICT` | `A-03` |
| `N-01` | 12 | Uniformly bounded original normalized Fock Gram field | `INTEGRATED_STRICT` | `D-02` |
| `N-02` | 12 | Pointwise image belongs to original vector L2 | `INTEGRATED_STRICT` | `N-01`, `D-01` |
| `N-03` | 12 | Original representative-safe carrier bridge | `INTEGRATED_STRICT` | `N-02` |
| `N-04` | 12 | Direct original Fock L2 output a.e. identity | `INTEGRATED_STRICT` | `N-03` |
| `N-05` | 12 | Image transport under a.e.-equal input representatives | `PENDING_STRICT_GATE` | `N-04` |
| `O-01` | 9 | Continuous original physical Spin9 symmetry and full 16-charge covariance | `OPEN_PROOF_OBLIGATION` | `S-02`, `S-04`, `S-06`, `H-02` |
| `O-02` | 10 | Source-typed unnormalized fermionic linear-growth inequality | `OPEN_PROOF_OBLIGATION` | `A-01`, `F-02` |
| `O-03` | 13 | Whole-sector low oscillator exclusion on the exact source carrier | `OPEN_PROOF_OBLIGATION` | `S-02`, `S-05`, `O-01` |
| `O-04` | 13 | Physical high-type coercive first-moment estimate | `OPEN_PROOF_OBLIGATION` | `O-02`, `O-03`, `H-02`, `A-01` |
| `O-05` | 13 | Compact resolvent and positive eigenpairs in original physical sector | `OPEN_PROOF_OBLIGATION` | `O-04`, `A-04` |
| `C-01` | 13 | Analytical whole-isotypic oscillator exclusion | `ANALYTICAL_CONDITIONAL` | `S-02`, `S-05` |
| `C-02` | 13 | Conditional full-space coercivity and radial tail | `ANALYTICAL_CONDITIONAL` | `A-01`, `A-04` |

## Source and qualification cards

### D-01 — The original carriers and dimensions

**Status:** `SOURCE_DEFINITION`. **Chapter:** 2.

Nine spatial labels, three adjoint colors at N=2, 27 real configuration coordinates, original 2^24-dimensional complex fermion Hilbert space, and its vector-valued L2 carrier.

**Exact declarations:** `SpaceIndex`, `ColorIndex`, `Boson`, `Fermion`, `FullL2`, `SmoothCore`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Core.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Core.lean)

**Inspected file blob:** `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.

**Boundary:** Configuration-space dimension is not spacetime dimension. The 11D M-theory interpretation is not an axiom of these definitions.

### D-02 — Original gamma, theta, and CAR source data

**Status:** `SOURCE_DEFINITION`. **Chapter:** 3.

Source assumptions of real gamma Clifford relations, 48 labeled fermion operators, and source irreducibility.

**Exact declarations:** `AlgebraData`, `AlgebraData.gamma`, `AlgebraData.theta`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Core.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Core.lean)

**Inspected file blob:** `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.

**Boundary:** A structure declaration with fields is not a proof that a chosen concrete instance exists; concrete source witness is separate.

### D-03 — The original 16 charge operators and quadratic core form

**Status:** `SOURCE_DEFINITION`. **Chapter:** 4.

The source charge vector and normalized (1/16) sum of squared charge norms on original smooth compact core.

**Exact declarations:** `AlgebraData.charge`, `AlgebraData.chargeVector`, `AlgebraData.coreForm`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Core.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Core.lean)

**Inspected file blob:** `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.

**Boundary:** The core expression is not by itself a self-adjoint full physical Hamiltonian.

### G-01 — The original gauge-invariant physical Hilbert subspace

**Status:** `SOURCE_DEFINITION`. **Chapter:** 5.

The kernel-intersection definition of the original physical SU2 invariants as a closed subspace of FullL2.

**Exact declarations:** `AlgebraData.GaugeData.physicalSpace`, `AlgebraData.GaugeData.physicalSpace_closed`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean)

**Inspected file blob:** `e4990dadf1d8bde849e351467282ab3f14989c3b`.

**Boundary:** Definition of an invariant subspace alone does not give nonzero physical states.

### G-02 — Nonzero normalizable physical radial bump

**Status:** `HISTORICAL_STRICT`. **Chapter:** 5.

An actual nonzero, normalizable and SU2-invariant original FullL2 state (not only a nonzero pointwise function).

**Exact declarations:** `FCP.BFSSSU2GaugeG4K2B.radialBumpL2_ne_zero`, `FCP.BFSSSU2GaugeG4K2B.radialBumpL2_mem_physicalSpace`, `FCP.BFSSSU2GaugeG4K2B.pairedPhysicalSpace_ne_bot`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K2BNonzeroPhysicalL2Probe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K2BNonzeroPhysicalL2Probe.lean)

**Inspected file blob:** `a288a1bccb847f9544211709fce75c7c7a519453`.

**Historical FCP gate:** https://github.com/etblink/Foundational-Convergence-Program/actions/runs/37894319431

**Boundary:** Historical strict-qualified result; the rewritten integration-port file is not independently qualified by this row; no supersymmetric ground state or eigenvalue.

### G-03 — Nonzero SU2-invariant original Fock vacuum and projection

**Status:** `INTEGRATED_STRICT`. **Chapter:** 5.

Nonzero gauge-invariant Fock vacuum and nonzero gauge-fixed orthogonal projection on the original fiber.

**Exact declarations:** `FCP.BFSSOriginalGaugeVacuumOP2C.originalFermionVacuum_mem_fixed`, `FCP.BFSSOriginalGaugeVacuumOP2C.originalFermionGaugeProjection_ne_zero`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean)

**Inspected file blob:** `a16d3573b737bb4453e42b0b543d63cbbac1cd1b`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42530241914

**Boundary:** A fiber state is not automatically a nonzero gauge-physical bosonic wavefunction or a Hamiltonian eigenstate.

### H-01 — Density of the original physical charge domain

**Status:** `HISTORICAL_STRICT`. **Chapter:** 6.

The genuine original 16-charge operator has dense domain in the gauge-invariant physical Hilbert space.

**Exact declarations:** `FCP.BFSSSU2PhysicalDomainL6H5E8BA.originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe.lean)

**Inspected file blob:** `3ab254088e3fa2aea7622807b6b10e7eabc6fc8a`.

**Historical FCP gate:** https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39079626713

**Boundary:** Historical qualification, not an automatic integrated-tree qualification.

### H-02 — The original normalized self-adjoint physical Hamiltonian

**Status:** `HISTORICAL_STRICT`. **Chapter:** 6.

The original densely defined physical 16-charge yields a normalized self-adjoint natural-domain (1/16) T†T Hamiltonian and its weak-form interface.

**Exact declarations:** `FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian`, `FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_selfAdjoint`, `FCP.BFSSSU2PhysicalDomainL6H5E8BE.originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean)

**Inspected file blob:** `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`.

**Historical FCP gate:** https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39088799248

**Boundary:** Neither spectral confinement nor positive eigenpair existence follows from self-adjointness.

### H-03 — Identity of the native and historical paired physical Hamiltonians

**Status:** `HISTORICAL_STRICT`. **Chapter:** 6.

Historical FCP BH proves equality on full operator graphs/domains of original source and previously constructed paired normalized Hamiltonians.

**Exact declarations:** `FCP.BFSSSU2PhysicalDomainL6H5E8BH.originalMinimalPhysicalNormalizedHamiltonian_eq_historical`, `FCP.BFSSSU2PhysicalDomainL6H5E8BH.originalMinimalPhysicalNormalizedHamiltonian_domain_eq_historical`, `FCP.BFSSSU2PhysicalDomainL6H5E8BH.pairedOriginalPhysicalNormalizedHamiltonian_eq_historical`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BHOriginalHistoricalPairedHamiltonianEqualityProbe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8BHOriginalHistoricalPairedHamiltonianEqualityProbe.lean)

**Inspected file blob:** `a4818bb38bf22fd629f6b6c3c373c38479525dd4`.

**Historical FCP gate:** https://github.com/etblink/Foundational-Convergence-Program/actions/runs/39096180117

**Boundary:** The present integration port changes imports and one local letI to let; it is source-present but not independently requalified in this exact port.

**Notes:** Historical FCP source blob 05a540772eb1b0e5c8570fd4eca101be76bbdd9b; original letI line was changed to let in this port. The M3H linter warning example cautions against calling this a mathematical failure.

### F-01 — Faithfulness of the original Clifford-to-Fock operator map

**Status:** `INTEGRATED_STRICT`. **Chapter:** 3.

The original 48-Majorana complex Clifford map into original Fermion 2 operators is injective.

**Exact declarations:** `FCP.BFSSS1V52M3H.originalComplexCliffordFock_injective`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3HOriginalComplexCliffordFockFaithfulProbe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3HOriginalComplexCliffordFockFaithfulProbe.lean)

**Inspected file blob:** `0b0b1f06f332cc9da738375e4511c28361c09f72`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42547700192

**Boundary:** This is an operator-algebra statement, not an independent manuscript module comparison.

### F-02 — Original complex Clifford/Fock algebra equivalence

**Status:** `INTEGRATED_STRICT`. **Chapter:** 3.

An actual complex algebra equivalence between the source complex Clifford algebra and the entire original Fermion 2 continuous operator algebra.

**Exact declarations:** `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv`, `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv_apply`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean)

**Inspected file blob:** `754a5f2a13baea90312f6031eb8fa7963dbdf42b`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42547700192

**Boundary:** Does not identify any separately stipulated manuscript Hilbert module; preserves the subtle central Spin signs.

**Notes:** A source-faithful letI with narrowly scoped style-lint setting was used; previous red was a style warning, not failed mathematics.

### S-01 — Connectedness of the exact source ninth-axis stabilizer

**Status:** `INTEGRATED_STRICT`. **Chapter:** 7.

Path-connectedness of the literal source ninth-axis stabilizer in its PBW topology.

**Exact declarations:** `FCP.BFSSSourceNineAxisStabilizerConnectedness.source9Axis8Stabilizer_isPathConnected_pbw`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerConnectedness.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerConnectedness.lean)

**Inspected file blob:** `948d4372be26c69dec4644253b24111a0a864402`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42426258689

**Boundary:** Does not by itself identify its complete representation category with standard Spin(8) branching.

### S-02 — Compact source stabilizer and its quotient parameterization

**Status:** `INTEGRATED_STRICT`. **Chapter:** 7.

A compact exact-word parameterization of the literal source fixed-axis stabilizer with a quotient map.

**Exact declarations:** `FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8Stabilizer_isCompact_pbw`, `FCP.BFSSSourceNineAxisStabilizerQuotient.source9Axis8EightUnitSpinWordToStabilizer_isQuotientMap_pbw`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerQuotient.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerQuotient.lean)

**Inspected file blob:** `677fc02a13affe8784285bffc9d318ce53f64fbf`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42429216538

**Boundary:** No automatic transfer of Spin(8) representation-theoretic branching or physical covariance.

### S-03 — Original active Majorana covariance under source Spin(9) operator action

**Status:** `INTEGRATED_STRICT`. **Chapter:** 8.

The literal 48-real active Majorana gamma map is covariant under the sourced original operator automorphism.

**Exact declarations:** `FCP.BFSSOP3C6COriginalFockActiveGammaCovariance.originalFockGammaRealLinear_eq_activeGammaRealLinear`, `FCP.BFSSOP3C6COriginalFockActiveGammaCovariance.source9Spin_originalFockOperatorAutomorphismHom_activeGamma`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean)

**Inspected file blob:** `2d6f777568b0026737112ff8256e5ed50fc9e6e6`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42728268316

**Boundary:** This is operator-algebra covariance, not a continuous Fock-vector implementation.

### S-04 — Original Fock operator Spin(9) physical-star action

**Status:** `INTEGRATED_STRICT`. **Chapter:** 8.

A genuine homomorphism into star algebra automorphisms of the original Fock continuous operator algebra.

**Exact declarations:** `FCP.BFSSP2bB3OriginalFockStarAutomorphismAction.source9Spin_originalFockOperatorStarAutomorphismHom`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean)

**Inspected file blob:** `b50ef04695587b267ad8519074b1293f98828749`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42764649026

**Boundary:** No source-group continuity, Fock-vector unitary implementation, or Hamiltonian domain covariance is asserted.

### S-05 — Trace invariance of the original Fock operator action

**Status:** `INTEGRATED_STRICT`. **Chapter:** 8.

The sourced Spin(9) star algebra automorphism preserves the ordinary finite-dimensional trace on the actual original operator algebra.

**Exact declarations:** `FCP.BFSST1OriginalFockTraceInvariance.source9Spin_originalFockTrace_invariant`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean)

**Inspected file blob:** `3be6c9a6f2898484df66690f94fdfa1877660897`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42769361446

**Boundary:** Supports but does not complete a continuous Hilbert–Schmidt group representation or its equality with the physical vector space.

### S-06 — Source Spin(9) and SU2 color commute on 48 labels

**Status:** `SOURCE_PRESENT_REQUIRES_RECEIPT`. **Chapter:** 9.

The actual 48-real source spatial and color matrix actions commute under exact label equivalence.

**Exact declarations:** `FCP.BFSSC48C0OriginalSpinGaugeMajoranaCommutation.source9SpinOriginalPaired48_commutes_sourceGauge`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean)

**Inspected file blob:** `9f9a5ce2186ded98a251efbc24c2b66f416044d5`.

**Boundary:** Do not elevate the source matrix commutator to fermionic gauge unitary, projector or full charge-operator commutation without a separate theorem/receipt.

### A-01 — Original massless core-energy identity

**Status:** `INTEGRATED_STRICT`. **Chapter:** 10.

Relates the normalized source core charge norm to original kinetic, bosonic potential, and fermion field terms at (1,0).

**Exact declarations:** `OAI.BFSSQuantum.AlgebraData.massless_coreForm_energy`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean)

**Inspected file blob:** `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42325087575

**Boundary:** Generic AlgebraData theorem; concrete Pauli/color field contraction and sharp growth bound are distinct.

### A-02 — Uniform first radial moment gives L2 tightness

**Status:** `INTEGRATED_STRICT`. **Chapter:** 11.

Abstract global L2 tightness from first radial moment and local compactness.

**Exact declarations:** `OAI.BFSSRellich.linear_moment_tight_compactness`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralLinearMomentCompactness.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralLinearMomentCompactness.lean)

**Inspected file blob:** `17a279f2728dd566c711e04eca7596028f355983`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42315568670

**Boundary:** Assumes a radial-moment estimate; does not obtain it from the physical Hamiltonian.

### A-03 — Smooth-core local/global compactness from gradients and moment

**Status:** `INTEGRATED_STRICT`. **Chapter:** 11.

Under uniform original gradient, L2, and first radial-moment bounds, smooth core image families are totally bounded.

**Exact declarations:** `OAI.BFSSSliceSobolev.core_gradient_l2_local_totallyBounded`, `OAI.BFSSSliceSobolev.core_linear_moment_totallyBounded`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralCoreLinearMomentCompactness.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralCoreLinearMomentCompactness.lean)

**Inspected file blob:** `7604eb127156b9772fad48cb0ad04c8fe488e3c9`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42318037096

**Boundary:** Not an estimate of source charge energy; the hypotheses remain to be supplied.

### A-04 — Weighted closure compactness

**Status:** `INTEGRATED_STRICT`. **Chapter:** 11.

Total boundedness for the original weighted Sobolev closure when its weight dominates a linear radial moment and graph components are uniformly bounded.

**Exact declarations:** `OAI.BFSSSliceSobolev.weightedClosure_linear_totallyBounded`, `OAI.BFSSSliceSobolev.weightedClosure_sqrt_radial_totallyBounded`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralWeightedClosureCompactness.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralWeightedClosureCompactness.lean)

**Inspected file blob:** `68741955a806a30da7b0f9ff168c41b9c29d90cd`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/42320696105

**Boundary:** Physical form-domain identification and coercive bounds are not established by this result.

### N-01 — Uniformly bounded original normalized Fock Gram field

**Status:** `INTEGRATED_STRICT`. **Chapter:** 12.

For fixed real gamma matrix B, a normalized original Fock Gram observable has a uniform operator norm bound.

**Exact declarations:** `FCP.BFSSNORM0COriginalNormalizedFockField.originalNormalizedFockGram_norm_le`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0COriginalNormalizedFockField.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0COriginalNormalizedFockField.lean)

**Inspected file blob:** `84de66e73be2018b03ced898ebf70e691c07b40f`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/43017992525

**Boundary:** Auxiliary quadratic-Gram observable is not the unnormalized original fermionic interaction (linear in bosonic coordinates).

### N-02 — Pointwise image belongs to original vector L2

**Status:** `INTEGRATED_STRICT`. **Chapter:** 12.

Actual original FullL2 2 representatives yield strongly measurable integrable pointwise images by the normalized operator field.

**Exact declarations:** `FCP.BFSSNORM0D2OriginalPointwiseL2Membership.originalPointwiseFock_memLp`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D2OriginalPointwiseL2Membership.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D2OriginalPointwiseL2Membership.lean)

**Inspected file blob:** `597c1e771b2bf0c366a354fcc991a5b77a71ff9f`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/43047181537

**Boundary:** This D1-A strict green does not establish a bounded continuous linear map on the full physical FullL2 carrier.

### N-03 — Original representative-safe carrier bridge

**Status:** `INTEGRATED_STRICT`. **Chapter:** 12.

Canonical original FullL2 class and equality from a.e.-equal MemLp representatives.

**Exact declarations:** `FCP.BFSSNORM0D3AOriginalLpCarrierBridge.originalCarrierLpOfMemLp_congr`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3AOriginalLpCarrierBridge.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3AOriginalLpCarrierBridge.lean)

**Inspected file blob:** `3fc16b042fe51f1e1a8c52260d5bba5135831ffc`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/43084968990

**Boundary:** Generic carrier bridge does not alone prove the complete bounded complex-linear map.

### N-04 — Direct original Fock L2 output a.e. identity

**Status:** `INTEGRATED_STRICT`. **Chapter:** 12.

Wrapper-free original Fock-valued L2 output with source-actual pointwise a.e. representative behavior.

**Exact declarations:** `FCP.BFSSNORM0D3CDirectOriginalFockLpOutput.originalFockLpDirect_ae`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3CDirectOriginalFockLpOutput.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3CDirectOriginalFockLpOutput.lean)

**Inspected file blob:** `bd9146fe825b4675bfb62f772bc02f83e204d30b`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/43091441892

**Boundary:** The representative-class transport successor is not implied by this gate.

### N-05 — Image transport under a.e.-equal input representatives

**Status:** `PENDING_STRICT_GATE`. **Chapter:** 12.

Candidate pointwise representative equality and alternate L2 output membership, with an independent original consumer.

**Exact declarations:** `FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport.originalFockImage_ae_of_rep`, `FCP.BFSSNORM0D3DOriginalFockRepresentativeTransport.originalFockImage_memLp_of_rep`.

**Source:** [lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3DOriginalFockRepresentativeTransport.lean](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3DOriginalFockRepresentativeTransport.lean)

**Inspected file blob:** `cb16f081fb1dbff0f149e94b39145d3ea2dec58b`.

**Integrated gate:** https://github.com/etblink/math/actions/runs/43095354808

**Boundary:** This atlas is pinned to the preceding reviewed snapshot; no pass/fail status is inferred for the queued run.

### O-01 — Continuous original physical Spin9 symmetry and full 16-charge covariance

**Status:** `OPEN_PROOF_OBLIGATION`. **Chapter:** 9.

Bind actual source group and stabilizer to the correctly phased physical Fock/gauge action; establish full charge form and domain invariance.

**Boundary:** Matrix and operator-star covariance are insufficient without a physical-vector/source-domain bridge.

**Notes:** See conditional analysis in BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md and BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md.

### O-02 — Source-typed unnormalized fermionic linear-growth inequality

**Status:** `OPEN_PROOF_OBLIGATION`. **Chapter:** 10.

Prove a finite constant C with |B(X)| <= C |X| in the literal source original fermionic field.

**Boundary:** Numerical and finite-coefficient checks, and normalized auxiliary Gram bounds, are not this theorem.

**Notes:** See conditional analysis in BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md and BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md.

### O-03 — Whole-sector low oscillator exclusion on the exact source carrier

**Status:** `OPEN_PROOF_OBLIGATION`. **Chapter:** 13.

Transfer the conditional Spin9/Spin8 branching argument to the actual physical fiber; distinguish operator-valued 12 from vector-valued 6 first-Cartan thresholds.

**Boundary:** Conditional mathematical note exists, but physical-source transfer and bounded character projection remain unproved.

**Notes:** See conditional analysis in BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md and BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md.

### O-04 — Physical high-type coercive first-moment estimate

**Status:** `OPEN_PROOF_OBLIGATION`. **Chapter:** 13.

Deduce first radial-moment and gradient bounds from the exact native physical closed form on a nonzero reducing sector.

**Boundary:** Decisive source-specific missing estimate. No global physical form-domain reduction currently admitted.

**Notes:** See conditional analysis in BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md and BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md.

### O-05 — Compact resolvent and positive eigenpairs in original physical sector

**Status:** `OPEN_PROOF_OBLIGATION`. **Chapter:** 13.

Join verified compactness to the same historical native physical Hamiltonian and prove sector reduction and nontriviality.

**Boundary:** Not a full BFSS mass gap; not currently established.

**Notes:** See conditional analysis in BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md and BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md.

### C-01 — Analytical whole-isotypic oscillator exclusion

**Status:** `ANALYTICAL_CONDITIONAL`. **Chapter:** 13.

For the operator-valued fiber, under the specified source group and standard Spin8 identifications, lambda_2 > m+12 excludes oscillator levels 0..m on the full smooth isotypic core.

**Source:** [contributions/bfss-kotler/BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/contributions/bfss-kotler/BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md)

**Boundary:** Analytical conditional proof; not Lean-qualified for the original physical-vector Hilbert operator.

**Notes:** Conventional analysis; no Lean theorem claimed.

### C-02 — Conditional full-space coercivity and radial tail

**Status:** `ANALYTICAL_CONDITIONAL`. **Chapter:** 13.

Under explicit P1/P2 source action/core-form hypotheses, the conservative high-type source estimate implies a positive first radial moment coefficient, with rational illustrative constants.

**Source:** [contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md](https://github.com/etblink/math/blob/d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md)

**Boundary:** The earlier Fock-vector 6 threshold cannot be conflated with the endomorphism-fiber 12 bound; P1–P3 remain undischarged.

**Notes:** Conventional analysis; no Lean theorem claimed.
