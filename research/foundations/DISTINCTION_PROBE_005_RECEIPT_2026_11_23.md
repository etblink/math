# Distinction probe 005 — relative transport as an observable
2026-11-23 Pacific. Status: executed numerical matrix checks and elementary analytic identity; established quantum mechanics applied to earlier model, not a derivation of quantum mechanics or physical IBI. Script DISTINCTION_PROBE_005_2026_11_23.py @ c80b6e9aa148525ef75417b9bc14e7e619040083; Python 3 / NumPy execution completed locally with all assertions passed. Floating-point checks, not formal proofs.

## Setup and scope
Take the Z2 edge transport of probe 004 and choose either the sheet-permutation representation rho_rep(1)=X (Pauli swap), or sign representation rho_rep(1)=-I (two copies of the one-dimensional sign representation). These are distinct representations of the same group; the covering itself does not force either physical realization. Two equal-endpoint paths carry unitaries A,B; an assumed path register is prepared in |+>, with a separate internal density matrix rho. Coherently apply A or B conditioned on the path, partially dephase path coherence by factor v in [0,1], then apply Hadamard on path and read path bit. Splitting, coherent control, common preparation, phase reference, readout interaction and quantum probabilities are stipulated, not derived. No primitive individual sheet label need be measured, but a path degree of freedom and comparison apparatus are assumed. No copying unknown quantum states.

## Analytic identity and local covariance
The path off-diagonal block before recombination is v A rho B†/2, giving P(0)=(1+v Re Tr(rho A†B))/2. If a local frame change acts by unitaries G_start,G_end, both A and B become G_end A G_start† and G_end B G_start†, and rho becomes G_start rho G_start†. The trace is unchanged. The relative transport operator is covariant by conjugation; its trace with the transformed state is invariant. For Z2 scalar transport, A†B=(-1)^h I for loop parity h. For swap transport, A†B=X^h. These are conditional operational witnesses, not evidence of a BFSS physical sign.

## Executed checks
All edge sign assignments and all local relabelings on cycles of length 3,4,5,6, both representations: 10,880 operator covariance assertions. Independently computed 4x4 density matrix evolution and compared analytic probabilities for visibility v=0,.25,.5,.75,1; checked trace 1 and positive semidefiniteness within numerical tolerance. All passed.
At v=1:
representation / preparation | even P(0) | odd P(0) | absolute probability difference
---|---:|---:|---:
swap / localized sheet | 1 | .5 | .5
swap / symmetric | 1 | 1 | 0
swap / antisymmetric | 1 | 0 | 1
swap / maximally mixed | 1 | .5 | .5
sign / localized | 1 | 0 | 1
At v=0 all these outputs equal .5: complete path dephasing erases the readout. At intermediate v the contrast scales linearly with v. The symmetric preparation is blind even with perfect coherence. The localized or mixed case is only statistical in this path-only readout; other measurements may supply more information.

## Critical negative witnesses
1. Bare channels U rho U† and (-U) rho (-U)† coincide for every rho. An uncontrolled overall phase is not observable. A controlled implementation can make a branch phase relative, but such a coherent implementation is additional data, not determined by the bare channel. If a sign is pure gauge in a physical theory, do not silently turn it into an observable by controlling a gauge redundancy.
2. With an unknown relative arm phase phi, the sign model measures cos(phi+pi h) times v; (h=0,phi) and (h=1,phi+pi) are indistinguishable by this readout. Four phase pairs verified numerically. Even complete fringe scans cannot distinguish those hypotheses without an independent phase reference or additional constraints on transport. A phase-shift witness is not necessarily a topology witness.
3. Z2 topology alone does not select a representation, a preparation, coherent control, admissible comparisons or physical interpretation. The symmetric subspace is trivial as a representation of the swap. A detectable holonomy is not yet a protected physical particle.
4. Recording the result in a physical path bit need not require an in-model conscious observer; however, the preparation, split and comparison operations must themselves be independently justified. This does not derive observation from primitive distinction.

## Independent physical context
IBM Quantum Learning, Limitations on quantum information: https://quantum.cloud.ibm.com/learning/en/courses/basics-of-quantum-information/quantum-circuits/limitations-on-quantum-information ; phase estimation: https://quantum.cloud.ibm.com/learning/en/courses/fundamentals-of-quantum-algorithms/phase-estimation-and-factoring/phase-estimation-procedure . Encyclopedia of Mathematics, Bohm-Aharonov effect: https://encyclopediaofmath.org/wiki/Bohm-Aharonov_effect . These supply established relative-phase/holonomy context, not independent confirmation of NFC or IBI.

## Decision
Promote only the model-level conditional statement: global relative transport can be read out by an appropriate gauge-covariant coherent comparison, but can be invisible to another preparation, under dephasing, or without a reference. Next bounded inquiry: formulate operational equivalence of complete preparation/transport/readout processes; compare classical endpoint comparison, coherent quantum comparison, gauge-redundant sign and physical projective symmetry. Audit exact BFSS physical gauge and Spin(9) actions before any central-sign claim. Do not assume a higher Hopf tower. No Lean, CI, NFC, unified integration or main modifications.
