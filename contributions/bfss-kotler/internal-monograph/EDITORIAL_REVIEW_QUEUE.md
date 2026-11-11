# Internal monograph editorial and scientific review queue (v0.3)

This queue records **tasks for review**, not claims of pending Lean gates. It is independent of GitHub Actions and must not be converted automatically into scientific qualifications.

## Drafted Chapters 2–6 — review before v0.3

- **Chapter 2 (carriers):** Check the displayed matrix-component conventions against exact source `Core.lean` under `N=2`; keep the 27 bosonic coordinates distinct from physical spacetime dimensions, and the `FullL2` a.e. class distinct from a pointwise representative. Source original `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- **Chapter 3 (Clifford/Fock):** Confirm the original `theta_CAR` delta-one normalization, the `theta^2=1/2` consequence, and 48/24/`2^24` dimension count against M3D/M3H/M3I actual source. The source algebra-equivalence gate is integrated strict-green #42547700192; distinguish this from unproved Fock-vector Spin(9) lift and from the independently specified manuscript model.
- **Chapter 4 (charge):** Recheck every coefficient of `AlgebraData.charge`, especially `-Complex.I`, `gammaTwo=1/2[gamma_i,gamma_j]`, `f_ABC`, the ordered `i,j,A,B,C,beta` sum and `1/2`. Historical FCP G4K9D green #38011995220 establishes source parameter `(h,m)=(1,0)` charge/core-form equality. The massless `coreForm_energy` strict green is an additional original-source interface, not a complete physical-sector energy confinement estimate.
- **Chapter 5 (gauge):** Verify pointwise smooth-core invariance is not erroneously extended to arbitrary `L2` representatives; separately distinguish the original full physical `L2` nonzero radial witness (FCP #37894319431), the original finite Fock vacuum/projection (math #42530241914) and the all-three-generator Gauss kernel characterization (FCP #38994451291). Kernel equality does not identify full unbounded generator domains.
- **Chapter 6 (Hamiltonian):** Verify BA density and the exact physical PiLp16 output; BE `T†T` *natural domain* and weak-form equivalence; BH full adjoints/natural-square/operator identity. The historical BH proof is green #39096180117; current imported `letI`→`let` line has not been separately qualified by this v0.2 narrative. Do not infer positive spectrum from self-adjointness.

## Newly drafted Chapters 7–9 — review before v0.4

- **Chapter 7 (source ninth-axis geometry):** Review whether the conventional proof that the source spin stabilizer is a quotient of `(S^7)^8` matches the accepted original eight-unit perpendicular word source and PBW topology; check that the two-sheeted covering and target `H ≃ₜ* SO(8)` are stated separately from unqualified vector-compatible `Spin(8)` representation branching. Accepted strict runs #42426258689, #42429216538, #42452043377 and #42498367504.
- **Chapter 8 (Fock-operator action):** Check original M3I carrier, OP3-C6C original active gamma linear action, P2b-B2/B3 adjoint-star action, and T1 actual finite trace. Hilbert–Schmidt isometry is a conventional mathematical corollary, **not** yet a new Lean theorem on a continuous group representation. Treat the original negative center `z9` as a nontrivial minus action on 48 labels, not a scalar conjugation.
- **Chapter 9 (gauge compatibility):** Verify source C48-0 [#42779878513], S1J identification C48-0B [#42787913738], one-sided active-gamma compatibility C48-1A0 [#42798054277]. No automatic gauge-unitary/projector fixedness, continuous physical `FullL2` Fock-vector action, complete 16-charge covariance, closed form reduction or isotypic spectral theorem. The functional-analysis conditional implication about a closed graph must remain explicitly conditional.

## Remaining chapters — mathematical order and dependency constraints


- **Chapters 10–11:** Use accepted source energy and first-moment compactness as separate blocks. Derive, or label as missing, the actual original unnormalized fermionic growth bound and the coercivity/weighted-closure inclusion on a reducing physical sector.
- **Chapter 12:** Present NORM0C-D1 as bounded **auxiliary** operators and `FullL2` images, not as equivalent to the original unnormalized linear interaction. Require actual D2 and D3 theorem certificates before promotion.
- **Chapter 13:** Maintain separate `lambda_2 > m+6` vector and `lambda_2 > m+12` operator-fiber conditional thresholds, verify exact source Spin(8) branching and a nontrivial physical high-type sector before admitting spectral consequences.
- **Chapter 14:** Summarize established source mathematics, conditional analytical implications, and unresolved original physical spectral problem without prejudging a theorem, M-theory interpretation, or experimental support.

## Reproducibility and publication discipline

- Preserve the original seven-source-file/atlas v0.1 architecture, now extended additively; do not touch accepted mathematical modules or historical handoff files.
- Each accepted theorem must cite its exact source file and tested receipt. In this narrative edition, **formalization records point to sources; they are not a substitute for the displayed conventional mathematics**.
- The future external monograph is a separate publication stage after the substantive research and independently verified proofs; do not repurpose an internal v0.2 scaffold as a completed public research paper.
