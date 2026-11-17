# BFSS QIT perspective pivot — incidence, physical information, and source-exact proof economy
Date: 2026-11-16 Pacific. Project Lead research memo. **Research only; no new Lean theorem.**
Repository: `etblink/math`, branch `integration/bfss-unified-research-20261108`; baseline HEAD `2de9d213c3aa238ef68b3f71e8ad4e0534ce7f82`.

## Decision and evidence ceiling
The original-Fock conditional tensor covariance QTC0D is strictly qualified at [#44018395393](https://github.com/etblink/math/actions/runs/44018395393). The original Source48 specialization of real `K(B)` to complex `Q_gamma(B)` was **NOT** qualified in QTC1 R1 [#44020471704](https://github.com/etblink/math/actions/runs/44020471704) or R2 [#44022359538](https://github.com/etblink/math/actions/runs/44022359538); both fail at analogous large source-specialization joins. These are failures of Lean proof integration, not mathematical counterexamples. Direct R3 stays stopped.

QTC1G0 [strict run #44024718712](https://github.com/etblink/math/actions/runs/44024718712), commit `2de9d213c3aa238ef68b3f71e8ad4e0534ce7f82`, is **CI GREEN** for one standalone original-Fock generic real-to-complex 1/4 identity and one independent consumer; original Source48 K/Q identification remains OPEN. Until the exact provider-original ZIP is committed and ledger evidence reconciled, the canonical `BFSS_GATE_STATE.json` remains **pending strict acceptance**. Its original provider artifact [#14302906791](https://github.com/etblink/math/actions/runs/44024718712/artifacts/14302906791) is 3718 bytes, SHA-256 `1422a97396d306c6ec130eb4940d61425fe8004474cc2d25ef54d0996ecbd031`, independently rehashed from downloaded bytes. CI build: 8960 jobs; 1 source + 1 consumer approved-axiom roots; 7 controls; 6 negative auditor checks. Preserve the two earlier QTC1 REDs.

**Temporary pivot:** no QTC1G1 or QTC2 implementation until a QIT architecture decision. This is a research freeze, not a claim that physics or mathematics is solved.

## Main question: does QIT change the problem formulation?

### QIT-A — physical distinguishability first
Given a physical observable algebra `A_phys`, two states are operationally equivalent when their restrictions to that algebra coincide: `rho|_Aphys = sigma|_Aphys`. This may be much weaker than equality of vectors/density matrices on the extended Hilbert space. In a gauge theory first identify the physical algebra and the representation of Gauss-law constraints. **Counterexample control:** gauge-invariant operators on the full extended Hilbert space are not identical to the algebra of operators on the singlet sector; invariance of an operator does not make an arbitrary input state physical. Test the effect of compressing by the singlet projector.

### QIT-B — observables before implementers
Our existing source-Fock star automorphisms (historical B3 #42764649026; trace/HS T1 #42769361446) suggest a conceptual route: verify a continuous complex-linear *-automorphism action on the full `End_C(Fermion 2)`, then use finite-dimensional inner implementation (Skolem–Noether) to obtain implementers up to U(1) phase. If it is genuinely a continuous Spin(9) action, investigate lifting its projective representation. This can change **which intermediate objects are needed**, but does not by itself establish original `K(A)` equality, the central sign on Fock vectors, strong continuity on the full bosonic-fermionic Hilbert space, or closed Hamiltonian covariance.

A sharper *source-exact* test: for candidate generators `T` and `S`, first prove `[T,x_k]=[S,x_k]` on all original Majorana generators. If the complex Clifford representation is irreducible and generated as the full matrix algebra, then `T-S` is central: `T-S=lambda I`. A separate **trace/normalization** condition can sometimes force `lambda=0`. On skew coefficients, trace zero might help; on unrestricted matrices diagonals contribute scalar terms and cannot be dismissed. Whether this route is actually cheaper than a typed kernel join is OPEN. It is not a substitute for the exact QTC1G1 theorem.

QTC0D itself gives, **conditionally on generator covariance**, the closed quadratic-subspace derivation `ad_T(Q(B))=Q(AB+BA^T)`; if `A^T=-A`, this becomes `Q([A,B])`. This is a genuinely different question from computing every 48x48 sum at once: determine the induced action on an observable subspace first.

### QIT-C — distinguish group twirling and physical projection
For a finite-dimensional unitary SU(2) representation `U_g`, the Haar average `E(A)=int U_g A U_g^* dg` is a unital trace-preserving conditional expectation onto the invariant **operator** algebra. In contrast `P=int U_g dg` is a projection on invariant **vectors**. Generally `E(A) != PAP`; they agree in physical singlet matrix elements. This difference can expose incorrect shortcuts in source gauge proofs. Existing G4E Fock gauge action and historical SU2 fixed-vacuum results offer source adapters. Full physical L2 still needs its own treatment.

### QIT-D — fidelity converts one existence/overlap certificate into many observable bounds
For a normalized `psi` with `p=||P_ker(H) psi||^2>0`, put `phi=P_ker(H) psi/sqrt(p)`. Pure-state trace distance is `sqrt(1-p)`; for every bounded observable `O`, `|<O>_psi-<O>_phi| <= 2 ||O|| sqrt(1-p)`. This is a small independent mathematical candidate **conditional on the physical spectral projection and overlap**; it does not prove existence of `ker H` or handle unbounded operators without domain/moment estimates. The published Michel–Scheinpflug–Yin SU(2) result `p >= 0.999997` belongs to the paper, not to this Lean branch; use it as an external target only.

### QIT-E — incidence before identity, without claiming emergent geometry
Begin with a specified physical observable algebra and faithful state, then test relational and information-theoretic quantities before choosing coordinates or subregions. Entropy, mutual information and split/factorization assumptions are **not automatically gauge invariant or canonical**; an arbitrary correlation graph does not determine a metric. Compare multiple candidate subalgebras/quantum reference frames, look for inequivalent results and counterexamples. Finite N=2 BFSS should not inherit large-N holographic conclusions without separate hypotheses.

## Bounded investigation and decision gate
1. **Source audit:** identify the exact B3, T1, C48/Clifford equivalence, G4E, and QTC0D declaration types and state whether they live on original Fock `Fermion 2`, a surrogate, operator space, or physical L2. No type substitution.
2. **Compare two paths:** (i) QTC1G1 typed opaque-kernel direct equality; (ii) commutant/trace observational route. For each list missing exact hypotheses and size of independent source/consumer gate. If route (ii) adds a harder irreducibility or trace theorem, retain path (i).
3. **Fidelity microlemma:** test if Mathlib already provides pure-state trace distance and bounded observable estimate; specify finite vs full physical Hilbert, domain assumptions and expected consumer. Do not promote paper fidelity as native.
4. **Gauge counterexample:** one finite-dimensional representation where twirling `E(A)` differs from `PAP`. Require this negative control before claiming physical-algebra equivalence.
5. **Report and return:** after two or three focused research sessions produce one decision: resume QTC1G1 unchanged; replace a specific adapter with an information-algebraic theorem; or retain QIT as a separate bounded analytic tool. Record failed routes. No QIT Lean expansion or new branch by default.

## Adversarial stopping rules
- Do not substitute equality of observable restrictions for equality of source operators when the physical theorem requires the latter.
- Do not infer a Fock-vector unitary, its central character, or original Hamiltonian symmetry from Fock-operator star invariance alone.
- Do not call entanglement a geometry without a proved algebra-to-geometry reconstruction and gauge-reference independence.
- No spectral existence, mass gap, original ground-state fidelity or TOE claim.
- Do not repeat the stopped QTC1 R1/R2 definitional-join architecture under a new name.

## Literature inspected (interpretation is ours, not a claim of formal transfer)
- Casini, Huerta, Rosabal, *Remarks on entanglement entropy for gauge fields*, Phys. Rev. D 89 (2014), https://doi.org/10.1103/PhysRevD.89.085012 : factorization and centers.
- Gautam, Hanada, Jevicki, *Operator algebra, quantum entanglement, and emergent geometry from matrix degrees of freedom*, JHEP 01 (2025) 019, https://doi.org/10.1007/JHEP01(2025)019 : matrix/subalgebra perspective.
- Fliss and Frenkel, *Matrix Quantum Mechanics and Entanglement Entropy: A Review*, Entropy 28 (2026) 58, https://www.mdpi.com/1099-4300/28/1/58 : large-N matrix model and gauge-subsystem caveats.
- Michel, Scheinpflug, Yin, *99.9...% of the SU(2) BFSS ground state*, arXiv:2611.09837 (2026), https://arxiv.org/abs/2611.09837 : external ground-state target, no native proof transfer.
- Skolem–Noether theorem, https://encyclopediaofmath.org/wiki/Skolem-Noether_theorem : finite-dimensional inner automorphisms. Continuous group lifts require separately checked hypotheses.
