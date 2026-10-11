# Kotler BFSS SU(2) upstream port — staging inventory

**Status: PORTED / NOT YET INDEPENDENTLY LEAN-QUALIFIED.**

- Original researcher and formalization contributor: Evan T. Kotler
- Independent research record: https://doi.org/10.5281/zenodo.23291242
- FCP source commit: `b60baa806dab3f0b296229a78f70e07b787544ab`
- Upstream repository: openai/math, Apache-2.0
- Copyright in the contributed formalization retained by its author; source definitions credited to OpenAI.
- All source files have original proof statements and tactics preserved except import-path rewriting.
- Discovered BFSS Lean modules: 140
- Selected import-closed modules: 130
- Other modules not included: 10

## Qualified FCP source roots (NOT qualification of this upstream port)
- `SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe`
- `SU2BFSSPhysicalDomainS3K1ExactPhysicalGaugePreservationProbe`
- `SU2BFSSPhysicalDomainS3L2SourceGammaTwoSpatialCovarianceProbe`
- `SU2BFSSPhysicalDomainS3L3ASourcePositionDerivativeCommutatorProbe`

The original source roots previously passed pinned FCP Lean gate(s).
The import-renamed upstream copies must be independently compiled and axiom-audited.
No statement of a full Hamiltonian rotational symmetry, a global Spin(9) action, or positive eigenvalues is claimed.

## Included modules and source hashes

| Module | FCP source SHA-256 | Lines |
|---|---|---:|
| `SU2BFSSFullAlgebraDataProbe` | `acb74b6fe256a5ef91ee8e4eee456480c9c97d0fcb85a3d9fee76b5e6cb6baa1` | 61 |
| `SU2BFSSG1APairedThetaProbe` | `d9f2815ed8e1f3a1e83525f1a88f421000420fe2a87ed75e4f6c22855a79244d` | 167 |
| `SU2BFSSG1BColorAnnihilatorProbe` | `23acb2f14c21ca4b1b963c2edf98bc2f92130424e0c65352c0f983f16e8fc6ac` | 113 |
| `SU2BFSSG2ABosonGaugeProbe` | `c1e9b371f0ecd71fcb1845b8fd73ceac319b52e65406a6ff2559f7bb0ab9f315` | 129 |
| `SU2BFSSG2BBosonGaugeContinuityProbe` | `3dd3bacf0737b8f3580300e92c0345337d2d32b92ed3640ca6d6fee7234ae4ef` | 58 |
| `SU2BFSSG3AAdjointColorRepresentationProbe` | `639005774c303239ca6b9e78543910d3657584f52faffcf778593892777e83bf` | 156 |
| `SU2BFSSG3B24ModeOrthogonalLiftProbe` | `040a8e5a0bd12879552cadb0b852458de38982d1466dd9c9c3d9673629b7bdbf` | 136 |
| `SU2BFSSG3CComplexOneParticleUnitaryProbe` | `17842e0669574e7ab77c7661f0d4d1cdf1066438502647401314cb6c6fa9536f` | 144 |
| `SU2BFSSG4AExteriorGaugeActionProbe` | `c98f46dd89c455fa817d0f01bb765ea0e1982ac67281fc2f850c9288c936eb78` | 130 |
| `SU2BFSSG4BFermionLinearTransportProbe` | `0ef5915af9f9e4d7cc5f80707c6a5f5b187b104321849d35b66c75e4ff33ce8b` | 110 |
| `SU2BFSSG4CFermionOperatorCovarianceProbe` | `f8dca0bb2f2330952cfa60ea94731dd31e6c6d66e38cf62ac1b0919ec64a008e` | 81 |
| `SU2BFSSG4DExteriorOccupationIsometryProbe` | `c566daab6725ff5e57f64dccbee99eb538889bd837e3755504a26b4c747f1f6f` | 108 |
| `SU2BFSSG4EFermionHilbertUnitaryProbe` | `788babffcdbd4a954c22f027019cfb2070c10c7f92174f398698650a10de55cc` | 110 |
| `SU2BFSSG4FRealColorAnnihilatorForwardProbe` | `337652de9cf0fe6315d425cef4e9a59f98b75fb1b5e6694fa6625f8e5a128653` | 82 |
| `SU2BFSSG4GMajoranaModeCovarianceProbe` | `2721757515ec2bdd86e3faa6b6ae7fe9da39a81960e6594e5f82d73b052ecf37` | 110 |
| `SU2BFSSG4HExactThetaCovarianceProbe` | `b4b7e3f117e41a4f26a603121b9030c34026ff8dca0f9c4127c8d11e8221b9dd` | 153 |
| `SU2BFSSG4IAOneParticleContinuityProbe` | `0bd6dcb87cacf894614ae7940b5719dc0bd5ba387144799c57394d257281ebe6` | 74 |
| `SU2BFSSG4IB1ExteriorFockSeedContinuityProbe` | `4c9f1367fc730894a24ba47f702fca905c422569ce2cec757ef687bfd7df5f7c` | 105 |
| `SU2BFSSG4IB2ExteriorFockTwoWedgeContinuityProbe` | `89539c0cd9406e035ba982608605b5a801d27b548f3a21dd835fb2e9c85db444` | 145 |
| `SU2BFSSG4IB3ExteriorFockAllContinuityProbe` | `6b122efb062838bc6280df5672386756ec2a4a191208395b6b62fc47a8b1c3f5` | 174 |
| `SU2BFSSG4IC1FermionParameterContinuityProbe` | `fa525eb0e4fe78c32c61355b4612ed7a34fc8404841201f6cedd4d722cbf1ac2` | 56 |
| `SU2BFSSG4IC2FermionJointContinuityProbe` | `fe7bee078344d2ab97fc426d7cd92535bd12960085ce48f97efa9a46e396c39b` | 94 |
| `SU2BFSSG4JExactGaugeDataAssemblyProbe` | `9a185b79e4bb3eab4db426eb4908dc2d37334d27c9610e41263a9a641c03c71a` | 69 |
| `SU2BFSSG4K10ASourceClosedJointChargeGraphProbe` | `bccc8216684246a0e95342116fbd11da50c9622eaab39d45a671cfea78939736` | 81 |
| `SU2BFSSG4K1PhysicalSpaceCoreProbe` | `a6a188f6fae6d54c86f42f96400e3cc55fc646b939447b11d3fe57b4c1a3e9b9` | 65 |
| `SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe` | `1b8c2b707849abfd70b53b37cad42a89b7200fa87b9aecb7dd0d9be458f07597` | 98 |
| `SU2BFSSG4K2BNonzeroPhysicalL2Probe` | `14120a9f8736ea228df96480aba9c10f698ce28104a094139d98fe3f24a2b526` | 176 |
| `SU2BFSSG4K3NonzeroSmoothInvariantCoreProbe` | `74cffb97d17b1f79314c31ce64c05b69425cf3cbcc6b67eff3ab95eead696bae` | 136 |
| `SU2BFSSG4K4ClosedChargeGraphProbe` | `4f5e147752647384a0df89f13008ceb2a54d20b06d48d659ec4639b9c345400e` | 107 |
| `SU2BFSSG4K5ConcreteEnergyDensityProbe` | `c3ef5376d621c2047bf067bda43abd8caa45171eb68b89f437a61a286b6db015` | 195 |
| `SU2BFSSG4K6PhysicalTrialEnergyLowerProbe` | `cbdbe96ead015e318cf9209f86c3800e75d670311ac19256abc4c0d86a8d9505` | 144 |
| `SU2BFSSG4K7EnergySumOfSquaresCorrectionProbe` | `e3549e915f21f255f503ef365d59034ce16750bd1be50838dbe8d890e46e84bb` | 130 |
| `SU2BFSSG4K8ANonzeroDerivativeProbe` | `a0562313115429cc1ef56b3536b1ac134983278f418983b0731c650266ff7f6f` | 104 |
| `SU2BFSSG4K8BNonzeroCoordinateL2Probe` | `b6611fe223cf5a89028515207bc04a1021b9aa8cbf8609f8be24802da645b7af` | 124 |
| `SU2BFSSG4K8CZeroParameterChargeProbe` | `9dd66219e4540fa4b9a6bbb606b850ccca2046529f7dc8fb5ab2882950a36e4a` | 148 |
| `SU2BFSSG4K8DPositiveCouplingAlternativeProbe` | `390318044fe8fe257584e8cb4faafbf86342ac0ab8161ca32f9a901440ecddc5` | 159 |
| `SU2BFSSG4K8E1MasslessPotentialParityProbe` | `6ab14b93bbdc864e76c5eea22172dc3b21e028784446a1e8e81d578ff339acc3` | 155 |
| `SU2BFSSG4K8E2KineticOddParityProbe` | `2ad30a1ef968aabca34c3cec45ef92e6fa5a20c9c8e63a6ee6e220a1fb757892` | 139 |
| `SU2BFSSG4K8E3CoreNoncancellationProbe` | `3d6a4c879a3fe4e50c3363b6021b3ac7ee0fa0391cd71c476dce7b0633bf62a9` | 123 |
| `SU2BFSSG4K9ASourceChargeCoefficientCrosswalkProbe` | `5a16d324f448e3d06680801681f052145ad5bee5a990f9722f172acb15f26172` | 62 |
| `SU2BFSSG4K9BSourcePairAndChargeReductionProbe` | `7fce8c3cad95b269ad0b9b702bdd133b89e5f91ff0596fc7a918b9e5a73d0995` | 93 |
| `SU2BFSSG4K9COrderedPairCoefficientProbe` | `398acbcc60bbc2e79ceffa38e0570ce00971ae65587b6f536d1c6fd3ff356ab0` | 156 |
| `SU2BFSSG4K9DSourcePotentialMultiplierProbe` | `d498e84354e56c08a4fe9ad42e1c3585ebd3678240814071b3f477efeea323e0` | 196 |
| `SU2BFSSPhysicalDomainD1RestrictedSourceGraphProbe` | `df45159ef413a089d7a544661e60a1ca03c068c62bafbeed9ea20dde2f0289fc` | 88 |
| `SU2BFSSPhysicalDomainD2AClosedPhysicalGraphProbe` | `6172f9918e778febea162723d2cbd25c0910b8825714ac97dfb9966757ad2e3f` | 95 |
| `SU2BFSSPhysicalDomainD2B10AProjectedSmoothCoreDensityProbe` | `4ddb039c3237b68917cc27b4e49a80cf220bbd7668b37b940c5996a5e4b41c15` | 118 |
| `SU2BFSSPhysicalDomainD2B10B1JointHaarFubiniIntegrabilityProbe` | `af887ed7ed5e3e85c6fb486bc8a2246e27fe917d25f901541ec6e6a7e9f1fc4c` | 110 |
| `SU2BFSSPhysicalDomainD2B10B2SmoothTestInnerFubiniProbe` | `2a88505f86e654cb0e925a34bcc4d2bedc1cfe1d365280c9a4128d9267df8aa3` | 127 |
| `SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe` | `611356a5a2ab0d9c3c691f5cf9ac9737bfac01269fd68a2abc6ec60ce70eb785` | 146 |
| `SU2BFSSPhysicalDomainD2B11OriginalPhysicalClosedChargeColumnProbe` | `533b4c9e1e45d0f2df7503b5a1abfefcbac89707540aec346a57f48ea0ff8f23` | 130 |
| `SU2BFSSPhysicalDomainD2B12OriginalPhysicalChargeLinearPMapProbe` | `3f8be18d285ec53ab081640230c417d38a3d21833340ab6acc615d75a9eaf655` | 116 |
| `SU2BFSSPhysicalDomainD2B13OriginalSmoothCoreChargeGraphClosureProbe` | `4aa7c3b86f1e63aa8d069d98a7a169232509a64a0ccb635b7b4b7c4b9678b33f` | 128 |
| `SU2BFSSPhysicalDomainD2B14ExactClosedChargeQuadraticEnergyProbe` | `4a713e4e7da291712957d09562492af3355f0e29a5eee01ce7580e88aa3ee867` | 112 |
| `SU2BFSSPhysicalDomainD2B15ClosedPhysicalEnergyFormLimitProbe` | `1b2bd648a30b9775bd3e942d2b7d0e1ba98800734ef6b6339356ee2c18bf6819` | 106 |
| `SU2BFSSPhysicalDomainD2B16PhysicalHilbertRebasedChargeOperatorProbe` | `b012cb6ac5adeefd50d868c85ae7f0a2f13da48463103df05171b29c254ef698` | 155 |
| `SU2BFSSPhysicalDomainD2B17TruePhysicalChargeAdjointProbe` | `99b04f2b918cca22c9440abcc67edc753e1e1166f03e75398dd20c189d436845` | 201 |
| `SU2BFSSPhysicalDomainD2B18NaturalChargeAdjointSquareProbe` | `d51ddd43b81ca8ae7978aa7d8a7dc0dccb07ccd41cea92bd90e1c53f50d410c4` | 129 |
| `SU2BFSSPhysicalDomainD2B19NaturalChargeSquarePositiveProbe` | `223fc73f9bfba3e9709041af4173ac46d40557c34a6fc867987a7aa43e4909e8` | 114 |
| `SU2BFSSPhysicalDomainD2B1SourceHaarEquivariantAverageProbe` | `03b3858b78b74b8bde3e14d4094da102c3c0497e61a1e000e8ecce14757f09d1` | 131 |
| `SU2BFSSPhysicalDomainD2B20VonNeumannGraphSurjectivityProbe` | `4f0499ffbf6dacec76fcbb88175ab9153e8bb88f782138781a97545b82dcf8b8` | 117 |
| `SU2BFSSPhysicalDomainD2B21SelfAdjointChargeSquareProbe` | `2dbb67d9616a5d5edae1b4f027971a03b8557c8dc54bb18e3d754dc4381c738b` | 135 |
| `SU2BFSSPhysicalDomainD2B22ExactHilbertEnergyFormTransportProbe` | `a13127ec2b97ec2ef578fa4f883b53515fad870885a1fb09109de23f22770dfd` | 138 |
| `SU2BFSSPhysicalDomainD2B23ExactFormGraphNormEquivalenceProbe` | `475e6591efd77eebec6759a392c24828a454de34871527b8927aa463c1d953a3` | 89 |
| `SU2BFSSPhysicalDomainD2B24WeightedClosedFormGraphProbe` | `1f1f7d58af4a265804e59b74f5309489aa3954e00d51cd22f5e7f08289766dc8` | 123 |
| `SU2BFSSPhysicalDomainD2B25WeightedFormDomainExactnessProbe` | `e8df72e9441065310622f4d27e306180dee99e464e3f17e6d44d1c19297f287d` | 115 |
| `SU2BFSSPhysicalDomainD2B26WeakFormAssociatedOperatorProbe` | `5ea125649567cdb2f8eb10b4f7e209f0dc62ee9f16f2d08299dff9723c91bf4b` | 168 |
| `SU2BFSSPhysicalDomainD2B27NormalizedHamiltonianSelfAdjointProbe` | `43af2454bee559209417cf2556c2503a0749ec7e2d7f34279849aee3026b0a2c` | 148 |
| `SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe` | `25fedbe3cf2ab0bffef88108d489e6d794b13135b32747bb1a920820d98af4eb` | 100 |
| `SU2BFSSPhysicalDomainD2B2HaarAverageContinuitySupportProbe` | `7ca3bdba125008f1c50348302a2c801d6a91f8a2d8d7dba38ab2114e3f134b0d` | 144 |
| `SU2BFSSPhysicalDomainD2B3JJointOperatorSmoothHaarProbe` | `333ca34d8b63d361e0a248eaa7cdfe441d92243cef6afdfd773e1888f5062424` | 106 |
| `SU2BFSSPhysicalDomainD2B3SmoothHaarReductionProbe` | `ec7727ccbc3bf393587fafdcef1e580ad7606babeb5d73c066d82c5d41cab729` | 88 |
| `SU2BFSSPhysicalDomainD2B4SourceSmoothInvariantCoreProbe` | `0ddd2d749f526af5b19bed1de66e2eb85e2017389aac089847e18e2d56c204a5` | 115 |
| `SU2BFSSPhysicalDomainD2B5SourceProjectionAlgebraProbe` | `4924a0cdaca5afe409e23893a4251aa8b8764792142345fa9e5a9609ab5af3e0` | 112 |
| `SU2BFSSPhysicalDomainD2B6SourceFullL2GaugeActionProbe` | `0966718f7286cec3b0d5918b80e152162bf3706996b16b1de83e55808ea7544d` | 94 |
| `SU2BFSSPhysicalDomainD2B7SourceFullL2GaugeIsometryAndFixednessProbe` | `a2064f66a3fa5da1faae65ef5e63daa0a698eb43cb78812cd0909fa1991b89fb` | 125 |
| `SU2BFSSPhysicalDomainD2B8AFixedPointSpaceProbe` | `57cc3fdc4ff28ff694aec308c07c7e92c3c14af924bb6d3728d0edfdb1da9a05` | 54 |
| `SU2BFSSPhysicalDomainD2B8BFermionContinuousReductionProbe` | `cb119c1a84ff060a022e5df48b24a2ac99a83640efa4153869be3eeec1ad4d4d` | 106 |
| `SU2BFSSPhysicalDomainD2B8CBosonStrongContinuityProbe` | `04dc08658af15ee8fd06609c9d7b3ba213a93f30a0b8e69034bb599626d37e84` | 82 |
| `SU2BFSSPhysicalDomainD2B9AFullL2HaarExistenceBoundProbe` | `f69d428034c4a0ca8543f0f199a489034b08eaee6b109a85b1808ba04ed660d1` | 78 |
| `SU2BFSSPhysicalDomainD2B9BFullL2HaarCLMProbe` | `8bb9d57335ec8d23ae613d3147cc7785ee18b278d50f0b21138b2dddc5d540e0` | 110 |
| `SU2BFSSPhysicalDomainD2B9CGenuineGaugeHaarProjectionProbe` | `edcd4919c6cc02c3f69601c51f15548c64e9efc7dbed4fb1bc230b99cef51183` | 139 |
| `SU2BFSSPhysicalDomainD3AKineticGaugeContractionProbe` | `14afd3f0a373492a4fee7bb1dfb6e09f9c7b5dcd3aff866719bd1bcf47a8e026` | 167 |
| `SU2BFSSPhysicalDomainD3BFullChargeGaugePreservationProbe` | `94dd263324deb285b76cda564993248a0a3ea51dc7ef1cbf3e765946648e0037` | 134 |
| `SU2BFSSPhysicalDomainS1COneParticleSpecialUnitaryProbe` | `79fa9d450f612e155b806f06851e3b90a280ef4864dad1e3be4d3390fc2e7d1d` | 86 |
| `SU2BFSSPhysicalDomainS2ASpatialWedgePotentialProbe` | `76bf7d569fd5b387293f9fa74e12c5e80cc4510be16546a02f3570f79c27f6a7` | 83 |
| `SU2BFSSPhysicalDomainS2BPotentialChargeEnergyBridgeProbe` | `b92a7460b61825733b4e5d4041c6296e6faa0703ed1e304da4e5423f898adcd6` | 92 |
| `SU2BFSSPhysicalDomainS2CCoreFormLinearFermionBoundProbe` | `92cb8ed8bbca746d3fa45707b3c9b202f80cd2d5611638497881539ff4704a34` | 142 |
| `SU2BFSSPhysicalDomainS2DTransverseSliceWedgeProbe` | `20ba6af8b00598bc8d2cba36370aab705ff47d707656bdae4afb1dd92bcc53aa` | 182 |
| `SU2BFSSPhysicalDomainS3AActualGammaPlaneRotationProbe` | `a2e5a86b3976c54ed93ada0ccc0fb20a5c21036acff34d6c92f059cb858172c3` | 108 |
| `SU2BFSSPhysicalDomainS3BFullPlaneSpinVectorCovarianceProbe` | `1f53b76450029fb6824f2cdc1d0758cdbccbc1493e40b83eadfd0836252b0983` | 64 |
| `SU2BFSSPhysicalDomainS3CActualMajoranaQuadraticCommutatorProbe` | `fce1e0b95f68befecf08b2bdea547e442fd4a1c28e35faabba0e23ed1d89373d` | 74 |
| `SU2BFSSPhysicalDomainS3DActualFermionSpinQuadraticGeneratorProbe` | `8436fa6f146152aa19c7aff2be3ca0deed34508615e3c9d16d59491303445409` | 74 |
| `SU2BFSSPhysicalDomainS3EActualFermionSpinRotationLawProbe` | `1b0ce93a53b8709424f4a2513eee32a39a39181452cfeb6e49de9f116fd5d9f5` | 173 |
| `SU2BFSSPhysicalDomainS3FActualFermionSpinSkewAdjointProbe` | `3341fbe3d58493a156fdbf29f60638572ecd84c0bc5be3e24ad35d8d18b77472` | 133 |
| `SU2BFSSPhysicalDomainS3G2GaugeInvariantMajoranaPairsProbe` | `e62995e4f8412c2d041ab8cdef8103dda63b512579bf99343d78c7757babf7a0` | 143 |
| `SU2BFSSPhysicalDomainS3G3FullQuadraticGaugeCommutationProbe` | `3def9492f3d540d1c2da6654ab11f557a00b67e8b1b8fbecfa017168f4759f44` | 118 |
| `SU2BFSSPhysicalDomainS3GActualFermionSpinGaugeCompatibilityProbe` | `5246be60d26945f8a05e60595eb731ec3eb307426d7c7ff170505c9d9e097bff` | 95 |
| `SU2BFSSPhysicalDomainS3HActualFockPlaneUnitaryFlowProbe` | `31472eabd9def855e26309a8284edac5c1250166b19871a3844072a699970d00` | 111 |
| `SU2BFSSPhysicalDomainS3IActualFockPlaneFlowGaugeCommutationProbe` | `71ae40d553d76b2710e72ed26a7509862ca8c2fda55050383d588aeec9b817e8` | 91 |
| `SU2BFSSPhysicalDomainS3K0SourceSpinFullL2LiftProbe` | `7fa5e8bbc48cb6078bb893d20951c685557d46a4bd2a2313d51dcb1656b707cf` | 65 |
| `SU2BFSSPhysicalDomainS3K1ExactPhysicalGaugePreservationProbe` | `c384ab4f7b81c051e95da31a3a6be538d1fdef13c547d9161dc93fd8a7a688ab` | 127 |
| `SU2BFSSPhysicalDomainS3L0SourceKineticSpinorCoefficientProbe` | `c9aa2001f09cb347d4a0c1909686ce4e127caa6d8c20a9923764b6d22d400019` | 45 |
| `SU2BFSSPhysicalDomainS3L1SourceOrbitalSmoothCoreProbe` | `47420264262112e9f6468ec6390f397d34ca71d180bc849ab20216fa2b44e2d4` | 74 |
| `SU2BFSSPhysicalDomainS3L2SourceGammaTwoSpatialCovarianceProbe` | `2208f72944a317d2905dddb2484ec051936ec3783e38991a9c74afa870ddba02` | 89 |
| `SU2BFSSPhysicalDomainS3L3ASourcePositionDerivativeCommutatorProbe` | `a2dba42b2b8c2a128df5290de20e6ea91064e7ece056c605e114b101abe1352e` | 72 |
| `SU2ColorCrossProbe` | `1e0280ae8ef8479dac2cc70c2cc1de1a6e7d7eca3ea9a27a1af557f4702845e3` | 489 |
| `SU2FermionF2B2ImagProbe` | `d8a0f090e471ee68899f0dc7672bb5e440dbdc190df4279c68d0505e47b930c8` | 118 |
| `SU2FermionF2B2IndexedProbe` | `19134a993b2eb4ecfb7527eb00d96352e0ffd8ef97eb058c9b15050a0fa21028` | 79 |
| `SU2FermionF2B2MixedAllProbe` | `ceed8d8bdce1f28e2799757b17e4a071135f97d7bd46838d22a43cc88584515f` | 35 |
| `SU2FermionF2B2MixedDiagProbe` | `1ec550cde86b63d730dd7b7d55526339ed6093a424af7ac89330505d0e15f796` | 86 |
| `SU2FermionF2B2MixedProbe` | `c878ec28ce2ecd8d8b51ededb545c37751560896dfdec0913284903a19a10c1f` | 127 |
| `SU2FermionF2B2Probe` | `736b7790e8c9fa4a8446da3011a3bc538f3b6bcaccccdd458559eae3f848f6d4` | 77 |
| `SU2FermionF2B2ThetaProbe` | `9b2450d7ba6583da5ea9cd1e459b7d963066567890c42e00e59df0be75ddc992` | 55 |
| `SU2FermionF2BProbe` | `d004bce39445e364fec326076409b8589f54f00d3da7be1b0c0371021f649cf9` | 94 |
| `SU2FermionF2Probe` | `a0c9d51dd455893b27c86b13380eed43313162da04a3e8a1e9610c58ea240055` | 149 |
| `SU2FermionF3B1OccupationProbe` | `1e86029a9286e16abc33bb04a42412c23f8ef38786721a7c4c7ff77bb54ec5d5` | 58 |
| `SU2FermionF3B2BasisActionProbe` | `d4c21a37d18bc531a6c58e4aebe0a58738a8874625c803f0aaa7c6b238b77ee8` | 78 |
| `SU2FermionF3B3ProjectorProbe` | `4ba3d3bc24b9e107b64cedd7900412a796f0ca086aa30e62eaa6a2294b950ed6` | 63 |
| `SU2FermionF3B4SelectorProbe` | `5bf36111471d36049d366a19b236670b58e135019791ccd7216e2942e7121350` | 144 |
| `SU2FermionF3B5CoordinateProbe` | `969d967bbe000e9ccda47dd23a588ee4e26031f982efd2f29c2102e0116c285c` | 183 |
| `SU2FermionF3B6NonzeroKetProbe` | `4671dcf18aa7260f288e4f4a323170ecd78da43429c3a740c071a4b3187ae20a` | 71 |
| `SU2FermionF3B7SignedModeProbe` | `6e496fea0430dc285a0cf34879b2ae796ed80863d65c7399b9e1f1fc87840813` | 75 |
| `SU2FermionF3B8LocalReachabilityProbe` | `07b68873e81eaf96ef0c337b0e59db02d5f3b94c871c3f85ee85fc179d34ffa5` | 66 |
| `SU2FermionF3B9FiniteReachabilityProbe` | `69a14f12f083c37f5922459594479ffe08b5fbb1ff2cacb3cdcceccc25621491` | 75 |
| `SU2FermionF3C1SubmoduleDichotomyProbe` | `3f6c41e281e0968d0171ff2c0d5ccf2d2cfa8b6c5130c540260b8f7d1a32f1f0` | 75 |
| `SU2FermionF3C2ThetaFieldsProbe` | `4a0e5789b7ca6ad38c98eed8f4fea08af5db6326e37b0944af9878da4c11e4fe` | 49 |
| `SU2FermionF3InvariantProbe` | `cdf204e681b079cdb12408c5a4f2a94fc963e379f25b60405026b45eea615782` | 68 |
| `SU2FermionF3RecoveryProbe` | `1f9a384c4d2ad7747873041c7f16557b6382f18a2c730129425aff1f575a386a` | 116 |
| `SU2FermionFockProbe` | `08f6df52f768586a290294862b2d9474cf847c8295f505a5bfad12c4f021bab4` | 186 |
| `SU2RealGammaProbe` | `f48e2d67a4a33e37e639bfcf383d463b79e86968a72d63eb82c18de0d10b72b3` | 231 |

## Excluded source modules (not in the requested dependency closure)

- `SU2BFSSConcretePotentialProbe`
- `SU2BFSSG4K8E4L2BridgeProbe`
- `SU2BFSSPhysicalDomainD2B29ConcretePositiveSourceFormTrialProbe`
- `SU2BFSSPhysicalDomainGate28AcceptedCacheSmoke`
- `SU2BFSSPhysicalDomainGate47AcceptedCacheSmoke`
- `SU2BFSSPhysicalDomainS1ASchurScalarCommutantProbe`
- `SU2BFSSPhysicalDomainS1BRelativeGaugeImplementerProbe`
- `SU2BFSSPhysicalDomainS3L3BSourceOperatorHeisenbergProbe` — explicitly unqualified
- `SU2BFSSPotentialAverageFlatProbe`
- `SU2BFSSSingleColorMultiplierZeroProbe`

## Static proof hazards

Modules with leading axiom/sorry/admit tokens (must adjudicate): 0


## Next gate

Topologically compile all selected original-source Lean modules using the fork's pinned
Lean 4.34.1 / Mathlib revision, audit \u0060#print axioms\u0060 for all
new public theorem declarations and compare against existing FCP gates.
Do not open a PR against openai/math or merge this staging branch without separate authorization.
