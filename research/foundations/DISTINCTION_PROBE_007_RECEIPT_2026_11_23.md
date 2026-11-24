# Distinction probe 007 — composition, tomography and operational independence
Date: 2026-11-23 Pacific. Status: exact symbolic model checks executed; established quantum mathematics applied to distinction-first inquiry; no physical theory or Lean qualification.
Script: DISTINCTION_PROBE_007_2026_11_23.py @ 36116effdf98a7419945f5b8e27a9c88f691d409. Executed local Python/SymPy source before committing, exit 0, all assertions passed.

## Question and assumptions
Does equality under all product-local tests imply equality of composite physical states? Compare finite-dimensional real symmetric density matrices with ordinary real tensor composition, and standard complex Hermitian density matrices with ordinary complex tensor composition. Born rule, tensor factors, local observable algebra and joint measurements are stipulated model choices, not derived. Local tomography uses joint correlations of arbitrary product-local measurements, not merely separate marginal measurements. A failure is relative to this chosen local probe family, not a failure of all possible observations.

## Exact witness
Let Y=[[0,-i],[i,0]], W=Y tensor Y. W is real symmetric with eigenvalues +1,-1 each twice. For -1<=a<=1 let rho_a=(I4+a W)/4. This is a real density matrix. All local real symmetric matrices are linear combinations of I,X,Z. W is orthogonal in trace pairing to their tensor products; hence all joint product-local outcome distributions are identical to those of rho_0=I2/2 tensor I2/2. rho_{+1} and rho_{-1} are not product states. Both have spectrum {1/2,1/2,0,0}. A global real measurement E+=(I4+W)/2 distinguishes them perfectly: P(+)=1,1/2,0 for a=1,0,-1. The Bell basis (Phi+,Phi-,Psi+,Psi-) consists of real vectors and diagonalizes W with eigenvalues (-1,+1,+1,-1). Executed output:
a=1 Bell probabilities [0,1/2,1/2,0]
a=0 Bell probabilities [1/4,1/4,1/4,1/4]
a=-1 Bell probabilities [1/2,0,0,1/2]
This is an explicit operational independence versus product independence witness. It is not evidence of undetected correlations in a real experimental source. In complex QM Y is a legal local observable, so jointly measuring Y on both components already distinguishes the examples; hidden here means hidden under standard real product-local probes, not globally inaccessible or supernatural.

## Exact dimension accounting
Pauli strings form an orthogonal Hermitian basis; a string is real symmetric iff its count of Y factors is even. Product-local real probes use only I,X,Z. For n rebits: full unnormalized real symmetric space has dimension (4^n+2^n)/2; product-local span dimension 3^n; difference is linear directions invisible to product-local tests. Trace normalization subtracts one from both full and visible dimensions, not the difference. Full complex span dimension 4^n with all four Pauli factors locally allowed. Script enumerated strings through n=6 and checked formulas.
n | real local span | real global span | invisible directions | complex full/local span
1 | 3 | 3 | 0 | 4
2 | 9 | 10 | 1 | 16
3 | 27 | 36 | 9 | 64
4 | 81 | 136 | 55 | 256
5 | 243 | 528 | 285 | 1024
6 | 729 | 2080 | 1351 | 4096
Every invisible direction can be paired with sufficiently small positive/negative perturbations of the maximally mixed state, so these are genuine local-tomography deficiencies, not merely dimension counting outside the positive cone. All matrices with an even Y count can be assembled from products of single-site I/X/Z and two-site Y⊗Y factors on disjoint pairs; hence allowing joint measurements on pairs (with arbitrary pairings) closes the real probe deficit in this model. This is an elementary basis argument, not a separately executed physical protocol.

## Realification control
For M=A+iB, R(M)=[[A,-B],[B,A]]. A complex density matrix becomes R(rho)/2 and a Hermitian effect becomes R(E); Tr(R(rho)R(E)/2)=Tr(rho E). Exact checks for a Y eigenstate and all single-qubit Pauli observables passed. Realification preserves these probabilities but does not preserve naive subsystem dimensions or ordinary independent product structure; no inference of equivalent multipartite theories from this single-system check.

## Independent research anchors
- Barnum & Wilce, Local tomography and the Jordan structure of quantum theory, https://arxiv.org/abs/1202.4513 (2012 preprint, 2014 journal): complex QM with superselection under their specified Jordan, non-signalling composite, local tomography and qubit hypotheses. Not a derivation of local tomography from distinction.
- Renou et al., https://doi.org/10.1038/s41586-021-04160-4 (2021): separation of standard real and complex quantum models with independent product sources in networks. Wu et al., https://doi.org/10.1103/PhysRevLett.129.140401 (2022): experimental violation of relevant real bound by 5.30 standard deviations under stated assumptions including fair sampling.
- Hoffreumon & Woods, https://arxiv.org/abs/2603.19208 (March 19, 2026 preprint): authors claim equivalence for finite networks and sequential protocols if independence is operational rather than product-state. Treat as reported result, not independently audited proof.
- Barrios Hita et al., https://doi.org/10.1103/4k13-sdjh (Physical Review Letters, June 18, 2026): authors construct a real-number formulation with a different physically motivated composite postulate and report reproducing multipartite quantum predictions. Abstract inspected, full proof not audited. These results address different assumptions; do not imply the 2021/22 conditional theorem/experiments were invalid. Nor do they settle which ontology is physically fundamental.

## Decision
Retain conditional positive witness: mathematical product structure and product-local observable independence differ in standard real quantum theory. Negative: local independence does not force global product state; local tomography is not automatic; single-system representability does not force a unique composite algebra. Relevance to NFC/IBI/SCC: explicitly distinguish equivalence under local tests from equivalence stable under lawful composition and joint operations. Do not impose local tomography, complex numbers, division algebras or Hopf geometry as universal necessities. This probe does not derive quantum theory, test quaternionic composite models, or explain nature. Next: study operational equivalence under admissible composition, calibration and auxiliary systems; audit the assumptions of cited reconstruction results before trying to select an algebra. No Lean, CI, unified integration, NFC or main changes.
