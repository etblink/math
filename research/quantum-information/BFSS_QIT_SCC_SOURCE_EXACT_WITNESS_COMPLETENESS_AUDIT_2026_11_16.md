# BFSS × QIT × SCC — source-exact witness-completeness audit and old-Jacobi stop
Date: 2026-11-16 Pacific. **Forward research; no Lean theorem qualified, no original gate reopened.**
Source checkpoint: `8e3acd2b1b4cf21f3bfce0502e29dde83afcc359` on `integration/bfss-unified-research-20261108`.

## 1. An exact and falsifiable structural witness statement

Let `V` be a finite-dimensional nonzero complex vector space and `Gamma_i ∈ End_C(V)` be a finite family generating the full unital algebra `End_C(V)`. Define the structural witness signature for an arbitrary endomorphism `T` by
```
Witness(T) = (([T,Gamma_i])_{i∈I}, Tr(T)).
```
**Abstract mathematical proposition (proof sketch, not a project Lean theorem):** `Witness` is injective.

If `Witness(T)=Witness(S)`, then `D=T-S` commutes with each `Gamma_i`; by generation it commutes with all endomorphisms; since the center of the full complex matrix algebra consists of scalars, `D=lambda I`. Equal traces yield `0=Tr(D)=lambda dim(V)`; as `dim(V)>0` in characteristic zero, `lambda=0`.

This makes explicit the **central defect** invisible to commutator witnesses: `T` and `T+lambda I` have identical adjoint actions but different traces. In SCC language, a witness family is *complete* only after this defect is separated. This is a mathematical witness signature, **not** a claim that the trace is an experimentally accessible BFSS measurement.

## 2. The important direct-bracket corollary

Suppose `K(A)` is a family of endomorphisms indexed by skew matrices satisfying the source covariance law
```
[K(A),Gamma_k] = sum_p A[p,k] Gamma_p.
```
Then for real skew `A,B`, Jacobi gives
```
[[K(A),K(B)],Gamma_k] = sum_p (A*B-B*A)[p,k] Gamma_p.
```
Since the real commutator `[A,B]` is also skew, covariance applied to `K([A,B])` shows that
```
Defect(A,B) = [K(A),K(B)] - K([A,B])
```
commutes with every `Gamma_k`. Full-algebra generation makes the defect scalar. Trace cyclicity gives `Tr([K(A),K(B)])=0`, and skew-trace-zero gives `Tr(K([A,B]))=0`; hence the scalar vanishes and
```
[K(A),K(B)] = K([A,B]).
```
**This is an abstract argument, not a qualified source-exact BFSS Lie-homomorphism theorem.** It suggests the QTC2 target *might* be reachable without passing through the QTC1G1 literal `K(B)=Q_gamma(B)` bridge, provided all source exactness and generation hypotheses are proven together on the true carrier.

It remains necessary to check all sign/normalization conventions in the source, the exact complex Clifford-to-End generator correspondence, finite-dimensional nonzero trace normalization, and that all `Source48Label` coordinates span the required Clifford generator space.

## 3. Source inspection: real reusable foundations

| Exact existing module | What the code says | Evidence ceiling |
| --- | --- | --- |
| `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`, blob `c2e7a7c665121283cde13ae5dabc183362b6b420` | `originalSource48BivectorK_skew_commutator_gamma`: the exact `A[p,k]` covariance on original `Fermion 2 →L[ℂ] Fermion 2` and `Source48Label`, including a transpose-skew version | Strict GREEN #43901524171; not the K-K bracket |
| `P3M4CT0OriginalSkewBivectorTrace.lean`, blob `a6f93c62c83bf51a0b89691196f875399d2896fa` | `originalFockTrace_mul_comm`; `originalSource48BivectorK_skew_trace_zero` | Strict GREEN #43983772199; no central commutant theorem |
| `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean`, blob `a9db27fc28379b35ca85515d733cc0bc43376592` | maps the original complexified Clifford axes into `sourceNormalizedGamma` via M3I Clifford/Fock `AlgEquiv` | Exact source axis relation exists; check qualified original run and completeness of axis crosswalk before using it as a new gate |
| `OP3C6AOriginalFockOperatorSpinAction.lean`, blob `94ba1beb876aaf9af7eaa50b444dc45c9ec9bc69` | algebraic Spin(9) automorphism action on original Fock operators via M3I | Does not supply Fock-vector implementing unitaries, trace of defect, or Hamiltonian symmetry |
| `P2bB3OriginalFockStarAutomorphismAction.lean`, blob `b50ef04695587b267ad8519074b1293f98828749` | source Spin(9) star automorphism, original Fock operator carrier | Not a projective/vector lifting theorem |
| `P3M4QTC1G0OriginalFockGenericRealQuarter.lean`, blob `3a2015658d8d9f20d0a9ab4ae7deb9061949a256` | one generic coefficient normalization atom | Strict GREEN #44024718712, original ZIP preserved. No original K/Q identification |

The qualified M3I original Clifford-endomorphism equivalence is cited by the evergreen reuse ledger at earlier strict run #42547700192; **a new source generation/center theorem still needs its own independently checked current-source consumer and pins.**

## 4. Critical negative precedent: DO NOT re-run the stopped CT1G0 architecture

The previously attempted `P3M4CT1G0OriginalFockJacobiSource48Adapter.lean` already pursued opaque original-source Jacobi:
- R1 [#43988822460](https://github.com/etblink/math/actions/runs/43988822460): recursion at the third native theorem statement.
- R2 [#43991790285](https://github.com/etblink/math/actions/runs/43991790285): recursion at final specialization `exact originalFock_commutator_jacobi (K A) (K B) (Gamma k)`.
- Original ZIPs and complete logs are frozen with **TWO_ANALOGOUS_NATIVE_RECURSION_FAILURES**. No CT1G0 R3 is justified.

The present proposal does **not** make those REDs disappear and does not claim abstract Jacobi alone is a new technique. Its distinct contribution is the **structural witness-completeness statement**, central-defect separation, and an alternative modular order. But even that may fail to produce an inexpensive original-source adapter. Any future test should put the abstraction on a small, truly source-independent algebraic carrier **before** attempting an independent source consumer; do not repeat literal K/gamma substitution as a leaf proof.

## 5. Route comparison, before any implementation

| Route | Benefits | Blocking burdens and costs |
|---|---|---|
| QTC1G1 typed-kernel K/Q adapter | Direct exact source equality; feeds QTC0D/QTC2; narrow stated target | Two analogous QTC1 R1/R2 literal-join REDs; need new opaque *source kernel* |
| Witness-complete direct K bracket | May bypass QTC1G1 for skew coefficient bracket; uses qualified LB1C1+CT0 | New full-generation/center theorem, complex End/CAR axis binding, source-real coefficient Jacobi contraction, trace dimension; prior CT1G0 R1/R2 recursion warns against native final specialization |
| QIT observable-only action | A potentially cheaper physically motivated equivalence or sufficiency target | A weaker result: equality of observable actions is not literal equality of K; central shifts may matter for energy/spectrum |
| QIT fidelity bounds | Small independent tool translating overlap into observable error bounds | Does not provide original physical `ker H`, overlap, or domain analysis |

### Decision

**Do not resume a QTC implementation yet.** The conceptual comparison has produced a serious alternative to the source-specific route, but it also exposed an existing two-RED failure in a related architecture. The recommended *next read-only task* is a typed dependency audit of the Clifford generator-to-End relationship, original center/trace lemmas, exact matrix commutator orientation, and whether a small abstract witness signature could be proved *without* expanding original `K(A)`/gamma terms. If the proof-adapter cost remains high, return to QTC1G1 rather than duplicating CT1G0.

Preserve SCC's MCS/WeakGlue/UC/TSI as conditional external research obligations. This note does not verify the original SCC framework, claim a BFSS physical result, or assert emergence of geometry/consciousness.
