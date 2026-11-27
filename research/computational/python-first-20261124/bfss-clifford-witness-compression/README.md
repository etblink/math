# BFSS Clifford witness compression and adaptive rank-one Krylov closure — 2026-11-27

Status: SURVIVED_EXACT_FINITE_TESTS; negative result for naive projected Clifford and repeated Yukawa actions. No native Lean qualification, new physical-domain theorem, ground-state or spectral claim. Owner authorized preservation and continuation as Project Lead; research-only commit on unified integration branch; active LOC6C R1 gate state and workflow untouched.

## Reproducible archive

[research_code.tar.gz](research_code.tar.gz) contains all 11 original executable source/receipt files, including initial failed rank script, original reconstruction, moment kernel, exact audit, adaptive_rank_one.py and its results. Exact Git blob 276c0c828707efbcaa94569257487be80a093419, SHA256 f119d351a5e47782eb4cd67d63fecba07d5de5ef36762b7181ae5533dcd8bbc7, base64 length 18232. Local Git hash independently matched connector-created blob before committing. No derived scratch arrays included. To avoid duplicating the existing frozen inputs, extract the archive into a separate local directory, copy ../bfss-seed-transport/seed_packed.txt there, then run sh run.sh and OPENBLAS_NUM_THREADS=1 python adaptive_rank_one.py. Alternatively copy the already archived source_seed_integer.npz to reconstructed_seed.npz for the adaptive run. The reconstructed seed is byte-identical to the archived NPZ, SHA256 131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7, blob 91c57e1f3f1e856a51bbc11dbb5a01ee9099ecc0. Packed input blob 2ebe56387fad1d79e34bb36e5947832d3f8b1424. The original downloadable ZIP contained the duplicated seed and packed text too; SHA256 a60ca106e201654830de0c2827a78ef3506711b892e4ae69f4dddd16fe4dc582. The archive here includes the source/receipts unchanged, with those two inputs referenced rather than duplicated. Initial dictionary transport timeout and norm-check assertion are documented in archived README and failed rank script.

## Source and external provenance

Frozen source pin efcdd1671070a15136616fdabd7116b687627e53; source paired occupation labels spin*3+color, bit 3*(spin//2)+color; normalized Clifford t=sqrt(2) theta, t_i^2=1. Original Gamma9 and charge convention in bfss-charge-symbolic/audit.py; Yukawa Z=iL=sqrt(2)Y in bfss-covariants/README.md and original qualified packed operator transport. Inspiration: [Bourin finite-witness reduction](https://github.com/1337isnot1337/solved-conjectures/blob/abfdfb383a8eaa1ceea804f47c7bab300555a4ee/results/bourin-crossed-heinz/FINITE-WITNESS.md); not an imported theorem. Other research leads: [isotropic witnesses](https://github.com/1337isnot1337/solved-conjectures/blob/abfdfb383a8eaa1ceea804f47c7bab300555a4ee/results/han-spherical-harmonic-saturation/FINITE-WITNESSES.md), [tree reconstruction](https://github.com/1337isnot1337/solved-conjectures/blob/abfdfb383a8eaa1ceea804f47c7bab300555a4ee/docs/research-results/stanley-tree-subdivisions/LINEAR-LEAF-SURPLUS.md), and [upstream tensor geometry scope](https://github.com/openai/math/blob/3344da59991ed94f9ba711217b29c1d760badfa6/lean/docs/379.md). External proofs not independently qualified. No standing VP/VNP premise adopted.

## Degree-two witness space

Actual integer seed S has support 19136, norm2 8072064. Complete normalized Gram of words of length at most two has rank 1138 (1090 even, 48 odd). 195709 exact moments of degrees 0,2,4; 1385 independent direct checks. Rank lower bound modulo prime 65521; 39 independent exact generator nulls give matching upper bound. Null span precisely original 36 spatial spin and 3 color gauge bivectors; no extra bivector stabilizers, no global stabilizer classification. Even normalized Gram eigenvalue multiplicities: 0:39, 29/42:420, 19/21:378, 1:1, 3/2:180, 34/21:84, 10/3:27. Verified integer annihilating polynomial and modular nullities. Odd Gram exactly identity. 256 exact source scalar jet charge Gram checks and 24 direct generator-commutator controls.

Negative evidence: 51888/54144 individual degree-two Majorana images leak outside K2 (23376 entirely). At rank-one X[2,2]=1, normalized squared norms of ZS and Z^2 S are 160/3 and 194048/33. Projection of Z^2 S onto K2 has squared norm 25600/9, exact lost fraction 587/1137. Naive compressed products are invalid for higher descendants. Do not replace the full CAR carrier or physical graph with K2.

## New adaptive rank-one experiment

Local execution of adaptive_rank_one.py used actual source seed, exact Gaussian integer action with checked component bounds, exact Python integer dot products, SymPy Gram solves, and direct coefficientwise recurrence verification. At X[2,2]=1 (zero based), the 16 terms of Z use 32 distinct Majoranas. For the literal vector S, the cyclic space span{S, ZS, ..., Z^8 S} is exactly 9 dimensional: each new power through 8 has strictly positive Gram residual, power 9 has zero residual. Direct coefficientwise recurrence:
Z^9 S = 480 Z^7 S - 69888 Z^5 S + 3358720 Z^3 S - 37748736 Z S.
Minimal polynomial z(z^2-16)(z^2-64)(z^2-144)(z^2-256). Coordinate operator A on the nonorthogonal power basis satisfies G A = A* G exactly. Spectral weights for z=-16,-12,-8,-4,0,4,8,12,16 respectively 4/1287,928/9009,113/819,113/819,2125/9009,113/819,113/819,928/9009,4/1287 (positive, sum one). All 96 vectors t_i S and t_i ZS have exact Gram rank 96. This is a seed-specific finite Yukawa cyclic representation, not an original CAR representation or proof for generic X, all derivatives or H3/Phi.

Adaptive rank-one results and exact raw output in archive. Next evaluate charge-image space on actual covariant descendants, and whether useful finite moment recurrences extend to rank-three and oblique fixtures; use explicit residual controls, compare against original archived moments and derivatives, do not assume a single rank-one subspace transports to all configurations. Keep Lean reserved for consequential qualification. Current primary objective remains original physical adjoint/ESA and fixed-regulator fidelity certificate. No new CI dispatch requested; active LOC6C gate preserved.

## File digests (SHA256)

README.md 1e3fd494bee28e9a6d58046d88c28866524732907f53a2451f348cf7547a1eec
run.sh e73a7b7d1a3fa15ab698930eb3bb920deb51a261b3a859c8c9fbea6f8c258a5f
reconstruct.py 84933b08c683dcc8009a5af6560fc9c8a9aa8c09055c43288b44e237de1d5b39
moments.cpp 263d37a7ebb44a542dc71b40c9a6adc806a004e27d6753ca583bb5b46814e668
audit.py a6e924cb4a36f77f2bfa302164c7e095115bcc8a451b0bd0c0948890fff3df0a
rank_and_yukawa_initial.py 28bf8f735145e6dd678dfc0b0fa97a18910d57e2a4b664c89b4abaf6fc283586
rank_and_yukawa.py b6b0c8b5f32c5e9c2ec674bb2d2834c4d40143022cf9eebb2348e99b72677457
leakage_exact.py 9eb561a04ad55a940368570b2ad8d9b9fb8a77d2877de03dc374a46c02b97e3c
results.json ed9e86ed9f6f07f114352b76e39838aa946ce294bfe4d2949552056205078d06
adaptive_rank_one.py 70e8f374d334262acab6023b0503768b502af3078a2447da34e4b1791b1f8532
adaptive_rank_one_results.json 5a7dcce00df6e779b5a1d9d8bf9ae08c52660e7066e115d7a8dcea8b13960f55
