# BFSS M4 — CT1-G0 two-RED architecture review and route decision

Date: 2026-11-16 Pacific. This is a **governed research decision**, not a qualified theorem, new Lean module, consumer or CI run. Sole branch `integration/bfss-unified-research-20261108`.

## 1. Two distinct failures of one source-bound proof architecture

| Attempt | Exact tested commit | Strict verdict | First causal error | Verified positives |
| --- | --- | --- | --- | --- |
| CT1G0 R1 [#43988822460](https://github.com/etblink/math/actions/runs/43988822460) | `a04d3240b8e1649ca058772af7a98f73095a177c` | RED | Native expanded Jacobi declaration, source line 53:0 maximum recursion depth | exact preflight + toolchain PASS; opaque generic Jacobi and commutator-sub had only standard axiom printouts |
| CT1G0 R2 [#43991790285](https://github.com/etblink/math/actions/runs/43991790285) | `f6b651c8b60afbb5821c4439111babd4278b4f9a` | RED | Typed Fock-commutator native Jacobi application, source line 79:8 maximum recursion depth | exact preflight + toolchain PASS; same generic standard-axiom printouts |

In both the source module failed cold compilation, so **no source theorem is independently qualified** by these runs; no consumer was compiled. R2's abbreviated bracket removed most repeated expanded source notation and moved the failure into proof application, but that does **not** remove the source-binding recursive elaboration mechanism. This is evidence about Lean normalization and elaboration under the pinned source, not a contradiction of noncommutative Jacobi.

Preserved original R1 ZIP: Git blob `3af05171c5865f120bd1b93fd99c7be37ba52acb`, artifact 14287816678 digest `c03e06d90de7d0a7e946a55d27f5bd2c2d7e03981355d80ad512ff8dbe61d75e`, independent rehash [#43991194687](https://github.com/etblink/math/actions/runs/43991194687). Preserved R2 original ZIP: blob `95cef252603501aa9cca2e2fba1339b90e6bb7dc`, artifact 14288643341 digest `a4611075b4eb0ce42f010e2530e1b2d351c5adc3eee43a3709c091b296a2efe8`, independent rehash [#43994555555](https://github.com/etblink/math/actions/runs/43994555555). Both complete job logs are committed.

## 2. Routes still open and their real proof obligations

**A. Continue the same native CT1G0 adapter: STOPPED.** R1 and R2 are analogous failures at the same original Source48 K/Gamma boundary. No direct R3, no recursion/heartbeat/memory increase, no alternate huge native K expansion, and no donor mutation. A genuinely different source abstraction/interface architecture would require a new contract and an explicit independent consumer plan, not an unchanged retry.

**B. Sparse P1 original four-Majorana path: recommended next mathematical *candidate*, not launched.** The [existing P1 contract](BFSS_M4_LB1P1_PROSPECTIVE_FOUR_MAJORANA_CONTRACT_2026_11_16.md) begins with an opaque conditional noncommutative commutator/Leibniz lemma and then binds only four original gamma factors using accepted original LB0 and LB1L2. Unlike CT1G0, it does **not** apply a huge native `K(A)` in the first theorem. The algebraic goal for arbitrary original source labels `i,j,k,l` is

```text
[Gamma_i Gamma_j, Gamma_k Gamma_l] =
  2 delta_{jk} Gamma_i Gamma_l
- 2 delta_{ik} Gamma_j Gamma_l
+ 2 delta_{jl} Gamma_k Gamma_i
- 2 delta_{il} Gamma_k Gamma_j.
```

This still requires type-exact original gamma and repeated-label controls and may encounter its own source elaboration issues. A GREEN P1 would not yet prove a real 48×48 K bracket, since sparse-plane normalization, real-to-complex coefficients and finite matrix linear extension remain separate.

**C. CT1-G1 generic finite-index covariance: viable parallel *paper/preflight* route, not launched.** [G1 contract](BFSS_M4_CT1G1_FINITE_INDEX_COVARIANCE_NEXT_CONTRACT_2026_11_16.md) composes assumed complex coefficient actions on opaque Fock operators using Jacobi, finite sum reindexing and central scalar action. Its generic mathematical statement is credible, and the two R1/R2 generic Jacobi printouts offer helpful diagnostics. However G0's source adapter is unqualified, and a generic G1 GREEN by itself cannot supply the missing source adapter. Do not promote G1 to native defect or automatic advancement without new qualified input.

**D. Original Clifford/Schur + CT0 trace: conditional downstream shortcut only.** The original full-complex-Clifford scalar commutant M3C and OP3A2 source-axis crosswalk are existing donors. Once a source-exact defect commutes with every gamma, scalar commutant plus CT0's qualified `Tr K(A)=0` can eliminate a central error. **This does not bypass the missing native covariance composition**. Trace alone never proves the full Lie bracket.

**E. Physical Gauss/charge-square and fixed-positive-regulator fidelity: independent physical priority.** The objective remains an actual physical-state auxiliary-energy/fidelity certificate, not growing the theorem atlas without removing a named physical obstacle. The equal-norm charge-square difference/Gauss route is an explicitly conditional alternative; the original gauge/singlet/spinor core, resolvent and Hardy/fidelity inputs are still open. Continue its source-level interface audit separately without claiming the spectral goal has been achieved.

## 3. Project Lead decision and stop condition

1. **Freeze CT1G0 R1/R2.** Accept zero native Jacobi roots from these runs. Preserve exact source, consumer, strict workflows, original ZIPs, full logs, failure manifests and separate rehash checks; all CT0 and earlier GREEN anchors remain canonical.
2. **Next proposed bounded proof lane: P1 sparse four-Majorana**, beginning with a **read-only source/donor/type boundary audit** of LB0/LB1L2/P0B and a small source-shaped theorem/independent-consumer contract, *before* any new strict gate. Only proceed when it can bind literal original gamma factors without expanding full K(A); otherwise pursue generic finite-index G1 solely as an independent math helper while reassessing physical priorities.
3. Preserve *one-gate-at-a-time* discipline. Two analogous original-source conversion REDs on P1 also stop that route; no increased resource limits, unchecked global scalar instances, implicit axiom relaxation or unbounded CI series.
4. Keep long-term claim hierarchy explicit: G0 Jacobi (source join blocked), P1 original four-Majorana (prospective), full K Lie homomorphism (not proved), original Spin(9) physical action and gauge/charge domains (separate), G16 Hardy/auxiliary regulator positivity and trial energy (separate), genuine ground-state fidelity (conditional).

**Decision:** CT1G0 is CLOSED/BLOCKED due to proof-engineering stop, not mathematically refuted. P1 is **prospective only**. No new proof run is authorized by this memorandum, and `main` remains untouched.
