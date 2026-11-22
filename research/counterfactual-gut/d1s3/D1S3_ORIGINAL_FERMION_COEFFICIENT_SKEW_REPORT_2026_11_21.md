# D1S3 — exact original BFSS fermionCoefficient skewness

**Date:** 2026-11-21 (America/Los_Angeles). **Classification:** analytic consequence of pinned source identities, numerically corroborated; new **SOURCE-ONLY strict Lean candidate**, `PENDING` at launch. Not an independently qualified theorem or physical BFSS claim.

## Research motivation and frozen boundaries

D1S2 established the exact CAR formula
$
Q(K) = Q((K-K^{\mathsf T})/2) + (i/4)\operatorname{tr}(K)I.
$
Although arbitrary real `K` can yield a gauge-covariant non-self-adjoint scalar, BFSS only uses a source-defined physical coefficient `M.fermionCoefficient x`. The next falsifiable question is whether this actual coefficient is **necessarily skew**. Answering it avoids treating an unphysical arbitrary real matrix as a genuine BFSS interaction.

Literal pinned source identities:

- `lean/OAI/MathematicalPhysics/BFSS/Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: real 16-spin gamma matrices, `gamma_symmetric`; original 24-mode SU(2) Fock carrier via `Fermion 2`.
- `lean/OAI/MathematicalPhysics/BFSS/FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`: **literal** `fermionCoefficient` formula, original `quantizeFrequency`.
- `lean/OAI/MathematicalPhysics/BFSS/FrequencyContraction.lean` blob `425edf6d7d0f9d15ce5f8bc92e8788ef60068618`: `structureConstant_cycle`, `structureConstant_swap`.
- `lean/OAI/MathematicalPhysics/BFSS/FermionFrequency.lean` blob `cbb82a42f42b3b3d3695081247bd14d0496abc7d`: original `FrequencyIndex N`, `FrequencyMatrix N`.
- `SU2BFSSG1APairedThetaProbe.lean` blob `152204ef15a6569534e0503824a697cb9ae8e4ce`: genuine `pairedAlgebraData`.
- `BFSSGamma.massT_transpose M.gamma M.gamma_clifford M.gamma_symmetric` is the pinned source spin-mass antisymmetry lemma, already used in `FermionFrequency.lean`.

For frequency indices `r=(α,A)`, `s=(β,B)`:

```text
C(x)[(α,A),(β,B)]
  = δ_{AB} * (3/2) * massT[α,β]
      - Σ_{j,D} structureConstant(B,A,D) * x[j,D] * gamma[j,α,β].
```

The spin mass matrix is skew, each spatial gamma matrix is symmetric, and the structure constants satisfy `f_{BA D}=-f_{AB D}` from `structureConstant_cycle` plus `structureConstant_swap`. Each term therefore changes sign under `(α,A) ↔ (β,B)`:

```text
C(x)ᵀ = −C(x)       for each original real Boson x.
tr C(x) = 0        for each original real Boson x.
```

This is an analytic source consequence, not a new imported BFSS assumption. The **Lean compilation/axiom qualification remains pending**.

## Source-exact Lean proof candidate

New [D1S3 original-source Lean module](../../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/D1S3OriginalFermionCoefficientSkewProbe.lean) at Git blob `26e61ab3598dc469427882f5cda5659fc2d47535`. This is a **new file only**. It proves or attempts five staged root declarations:

| Source root | Obligations |
| --- | --- |
| `sourceStructureFirstTwoSkew` | antisymmetry in the first two source color indices, from cyclicity and last-two swap |
| `sourceGammaEntrySymm` | entrywise source `gamma_symmetric` |
| `sourceMassTEntrySkew` | entrywise `BFSSGamma.massT_transpose` |
| `originalFermionCoefficient_skew` | all-`N` matrix transpose identity on the **original** coefficient |
| `pairedOriginalFermionCoefficient_skew` | literal original SU(2) `pairedAlgebraData` specialization |

A dedicated [D1S3 strict source-only workflow](../../../.github/workflows/bfss-d1s3-original-coefficient-skew-source-strict.yml) blob `b3410a97aa7815a991511a06f802ccc7853e6f62` freezes the original source hashes, Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, checks exact roots, bans `sorry`/`admit`/new axioms, recursion increases and linter disabling, runs native plus warning-as-error compilation and parses allowed axioms only `[propext, Classical.choice, Quot.sound]`. Artifacts upload unconditionally.

**First exact candidate commit:** `ad813db1bd64fe4bfcb79cffb23a37652cc3e71b`. [Original D1S3 R1 run #44976005358](https://github.com/etblink/math/actions/runs/44976005358) **launched; NOT yet qualified** at this report's first checkpoint. It is **source-only**: a future truly independent original-public consumer would need separate qualification, even after a source GREEN.

No edits to original source or D1R0/D1S1/D1T0/D1T1, main, unified integration, RHOPF, or toolchain.

## Numerical prescreen — 40 full coefficient tests with adversarial controls

Run deterministic [reproducer](./d1s3_fermion_coefficient_skew_prescreen.py) with Python + NumPy, seed `20261123`; machine-readable [results](./d1s3_fermion_coefficient_skew_prescreen.json). The full coefficient is **48×48** and uses exactly the source formula (mass term `delta_AB 1.5 massT` and interaction `-f_{BA D} x_{j D} gamma_{j αβ}`), with random real skew `massT`, random real symmetric `gamma_j`, SU(2)-like `ε_{ABC}` and random 9×3 bosons.

| Positive check | Maximum residual |
| --- | ---: |
| `‖C+Cᵀ‖` | `0` |
| `|tr C|` | `0` |
| Full 48×48 color-gauge coefficient covariance | `5.20e-14` |
| `‖TCTᵀ+(TCTᵀ)ᵀ‖` | `1.46e-14` |
| `|tr(TCTᵀ)|` | `2.19e-15` |

| Negative control (min residual across trials) | Result |
| --- | ---: |
| Intentionally break gamma symmetry | `68.23` |
| Intentionally break massT skewness | `15.28` |
| Use wrong color transpose/orientation | `12.49` |
| Physical coefficient magnitude stays nonzero | `69.86` |

**Scope warning:** random skew mass/gamma matrices are **not** the original Clifford matrices; they test only the source identities relevant to this skewness lemma. Proper SO(3) color rotations are not a source-level SU(2) group implementation. These tests do not operate on the original `2²⁴` Fock space, do not test a self-adjoint extension or original `SmoothCore`, and are not substitute Lean proofs.

Local original prescreen files: Python SHA-256 `1e6bcae2ab98d732b5d12b0eec718569f3a4f155d55944d2829877cd7aec6e83`; JSON SHA-256 `5783d6d48ccb77bb7d12f66adcdb9bfd3f45042ac67384732095f2470e5f2027`. Both repository Git blobs were byte-verified against the locally executed files.

## Scientific relevance and stop rules

If original source skewness qualifies, `tr C(x)=0` follows for physical BFSS inputs; together with D1S2 CAR it predicts no imaginary scalar from the original physical quadratic multiplier. A **separate source exact theorem for `quantizeFrequency` self-adjointness** would still need formal proof (the D1S2 decomposition is analytic, not a qualified Lean lemma), and unbounded full BFSS Hamiltonian conclusions require operator-domain analysis beyond finite Fock self-adjointness.

D1S0 is independently strict GREEN. D1S1 original source covariance compiled strictly, but the full independent consumer remains RED/FROZEN. D1T0/D1T1 and D1R0 remain RED/FROZEN. **No physical Hopfion, spectral gap, Standard Model embedding or GUT claim.**

For D1S3, if R1 RED, preserve first-causal error and archive; allow only a bounded repair whose rationale follows directly from that error. After two native REDs, freeze architecture and pivot. Do not silently qualify a source-only GREEN as an independently qualified original-public consumer.


## R1 verified strict RED: native 8,994-job source build PASS; deprecation strict errors only

[Run #44976005358](https://github.com/etblink/math/actions/runs/44976005358) **completed/failure**, exact tested commit `ad813db1bd64fe4bfcb79cffb23a37652cc3e71b`, first attempt, job `137065971549`. Frozen Core, FermionFrequency, FermionQuantization, FrequencyContraction and G1A paired source hashes all **PASS**; exact pinned Lean `4.34.1`/Mathlib environment restored **PASS**; native cold source build **PASS** (`Build completed successfully (8994 jobs)`).

**All five original source declarations compiled and reported only** `[propext, Classical.choice, Quot.sound]` in the native source log, including the general `FCP.BFSSHopfD1S3.originalFermionCoefficient_skew` and paired SU(2) specialization. No source proof elaboration error or `sorryAx` occurred.

The first causal failure occurred in **strict warning-as-error recompile**, `D1S3OriginalFermionCoefficientSkewProbe.lean:60:10` and `:60:26` / `:62:10` and `:62:31`:

```text
error: `if_pos` has been deprecated: Use `ite_eq_left` instead
error: `if_neg` has been deprecated: Use `ite_eq_right` instead
```

These are **deprecated proof rewrite names** inside a mass-term `by_cases`, not a source gamma/structure-constant or skewness counterexample. Strict source sentinel `BFSS_D1S3_SOURCE_ONLY_STRICT_GREEN` did **not** print; original R1 is **RED/UNQUALIFIED** despite the successful native compilation.

Original [artifact #14735923388](https://github.com/etblink/math/actions/runs/44976005358/artifacts/14735923388), GitHub SHA-256 `9978eaf6072c5dc041b05df52ab76ad6f11e9fe5891a9e1a721a0ede08189deb`, 8,308 bytes, independently recorded.

### Bounded R2 repair and exact tested commit — pending independent native verification

R2 updates **only two Lean source lines**, replacing the two `rw` sequences of deprecated lemmas:

```lean
rw [ite_eq_left hc.symm, ite_eq_left hc,
  sourceMassTEntrySkew M r.1 s.1]
rw [ite_eq_right (Ne.symm hc), ite_eq_right hc]
```

All other D1S3 theorem statements, five root names, source identities and proof steps are unchanged. Original source Git blob `26e61ab3598dc469427882f5cda5659fc2d47535` → `f35d70284bec100dc617935cf41a6c933c618e5b`. Frozen strict workflow stays blob `b3410a97aa7815a991511a06f802ccc7853e6f62` with warning-as-error and allowed-axiom parser unchanged.

**R2 exact tested repair commit:** `768446976e6b35e2a23acbcece0c23a97f159e6a`. [R2 run #44976962312](https://github.com/etblink/math/actions/runs/44976962312) started automatically; **IN PROGRESS / NO GREEN CLAIM** at this documentation checkpoint.

**Stop rule:** R2 is the second strict attempt. If RED, preserve its exact first error, native/strict log and original artifact, and **STOP**, without R3 or changing linter options. If GREEN, verify exact tested commit, original native and warning-as-error logs, every one of five permitted-axiom roots and original archived artifact; accept only **source-level skewness**, not an independently qualified new public-source consumer or physical BFSS spectral theorem.
