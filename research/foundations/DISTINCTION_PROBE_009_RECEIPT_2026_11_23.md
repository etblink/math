# Distinction probe 009 — minimal auxiliary context and noise
Date: 2026-11-23 Pacific. Status: executed exact symbolic checks, numerical binomial-tail calculations, and elementary model-level proof; no novel physical discovery or Lean qualification.
Code: DISTINCTION_PROBE_009_2026_11_23.py @ 57c79c5e35c83d6818f86d1509cbe7d309de7de0. Local executed script SHA-256 eebfe5088f6749c76d2ec43ac6fd856c6f1e70f0b1d877552dc4da1b780f111e. Python 3.13.5, SymPy 1.14.0, SciPy 1.17.0. Initial run failed at endpoint matrix equality due to Python integer division producing floats; repaired by sympifying t before computing weights. Subsequent run exited 0 with all assertions passed. No CI.

## Scope
Continue probe 008's real two-dimensional channels C_t, t in [-1,1]. Assume ordinary real Hilbert-space composition, all real density matrices, a single use on the first rebit, permitted global real measurements, and the given channel family. A one-dimensional auxiliary system is trivial; a second rebit suffices. This is minimal auxiliary Hilbert dimension within this setup, not a universal minimum over alternative protocols, coherent implementations or physical theories.

## Arbitrary-state identity and exact resource
Let J=[[0,-1],[1,0]], W=-J tensor J=Y tensor Y, w=Tr(rho W), rho_B=Tr_A rho. Symbolic calculation on all ten independent entries of a real symmetric 4x4 matrix verifies:
(C_t tensor id)(rho)=I/2 tensor rho_B + t w W/4.
For normalized rho, |w|<=1 since W is a real symmetric involution. Output difference between t and u is (t-u)w W/4. Its trace distance is |t-u||w|/2 (four eigenvalues of W have magnitude one); the projectors (I±W)/2 attain this optimal discrimination distance. For t!=u the channels are distinguishable with this fixed input iff w!=0. For equal prior endpoint hypotheses t=±1, ideal single-shot success is (1+|w|)/2. All product-local real observables annihilate the W direction, even with correlated input. All real separable inputs have w=0 by antisymmetry of J and convexity. Caves–Fuchs–Rungta's established two-rebit concurrence formula C_R(rho)=|Tr(rho W)| additionally implies that real entanglement is necessary and sufficient for this input's ideal distinguishability (with a suitable joint measurement). Cite theorem rather than claim to derive separability characterization: https://doi.org/10.1023/A:1012215309321 ; https://arxiv.org/abs/quant-ph/0009063. Probe 008 endpoint process witness credited to Chiribella, https://doi.org/10.3390/sym13111985.

## Representation-sensitive negative control
rho_±=(I4±W)/4 have eigenvalues 1/2,1/2,0,0, and w=±1. They enable perfect endpoint discrimination in the model. They are maximally entangled according to real concurrence but separable in standard complex quantum theory: with P±=(I±Y)/2, rho_+=(P+ tensor P+ + P- tensor P-)/2 and rho_-=(P+ tensor P- + P- tensor P+)/2. Both decompositions checked exactly. P± are complex and are not legal single-rebit real states. Thus entanglement depends on the admissible preparation algebra; not all apparent resource differences are representation-independent. Complex quantum mechanics also permits isolated Y inputs and can distinguish the channels without ancilla. No conclusion about fundamental real versus complex ontology.

## Noise, finite resources, calibration
Prepare rho_v=(I4+vW)/4, v in [0,1], equivalently mix rho_+ with maximally mixed state at weight 1-v. Use effect E_eta=(I4+eta W)/2, eta in [0,1]. Exact identity P(+|t)=(1+eta t v)/2. Endpoint probability contrast d=eta v; any d>0 gives statistical distinguishability if calibration and stable repeated preparation are assumed. Complete loss of either correlation or readout contrast gives d=0. Without independent calibration, observed bias only determines the product eta*t*v; unknown sign of w or readout orientation can confound endpoint identification. Repetition does not recover a genuinely zero contrast.

Equal priors, known positive d, independent identical trials and odd n, majority decision: success P(Binomial(n,(1+d)/2)>n/2). SciPy numerically computed smallest odd n achieving at least .95 under this decision rule, checked predecessor:
d | one-shot success | n | attained success
1 | 1 | 1 | 1
.5 | .75 | 9 | .95107269
.25 | .625 | 43 | .95309608
.1 | .55 | 269 | .95009492
.05 | .525 | 1081 | .95004990
0 | .5 | impossible | .5
These are ideal model decision probabilities, not physical measurements, device specifications or confidence intervals.

## Decision
Distinguish (a) existence of an admissible witness, (b) resource cost of implementing it, (c) reliable finite-data identification, (d) calibration and alternative explanations. This is a quantitative SCC-compatible extension: a single relational degree is necessary/sufficient within a defined model, yet its interpretation is representation-dependent. Do not equate relational indistinguishability, symmetry redundancy, finite measurement uncertainty and absence of physical identity. Next: consolidate probes 001–009 into an assumption/witness ledger, investigate independently justified relational reference frames and calibration (including gauge-invariant comparison with no privileged absolute orientation), and decide whether a controlled physical bridge exists before more toy-model proliferation. No Lean, CI, unified integration, NFC or main modifications.
