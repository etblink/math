# BFSS M4-LB1P2 — sparse-plane Lie bracket, all-index forward contract

Date: 2026-11-16 Pacific. **RESEARCH ONLY; NO Lean source, consumer, workflow, or proof gate staged.** Sole branch `integration/bfss-unified-research-20261108`. Prepared while P1 strict [#43996551474](https://github.com/etblink/math/actions/runs/43996551474) was running, and **P1 is not assumed qualified**. Last accepted proof remains CT0 R2 #43983772199.

## 1. Exact source matrices and original Fock generators

The accepted P0A source defines `E(i,j) := originalSource48SkewPlane i j`, with

```text
E(i,j)[p,q] := (if p=i ∧ q=j then 1 else 0) -
               (if p=j ∧ q=i then 1 else 0)
```

for all `i,j,p,q : Source48Label`, and proves `E(i,j).transpose=-E(i,j)`. Thus **E(i,i)=0**. Accepted P0B proves, on the *actual* original `Fermion 2 →L[ℂ] Fermion 2`, **for all indices including repeats**,

```text
K(E(i,j)) = (1/4 : ℝ) • (Γ_i Γ_j - Γ_j Γ_i).
```

Only when `i≠j` does P0B supply the stronger `K(E(i,j)) = (1/2 : ℝ) • (Γ_i Γ_j)`. **Never use this half-product representation with coincident labels**, since `K(E(i,i))=0` while `Γ_i²=1`.

## 2. Target sparse-plane Lie algebra identity (unproved in Lean)

Let `B(i,j) := K(E(i,j))` with the existing exact P0B source normalization. The P2 target on the original continuous-linear Fock carrier is

```text
[B(i,j),B(k,l)] =
  δ(j,k) • B(i,l)
  - δ(i,k) • B(j,l)
  + δ(j,l) • B(k,i)
  - δ(i,l) • B(k,j),
```

where `δ` is the real 0/1 label equality indicator (and its scalar action on original Fock operators must be bridged explicitly to the correct complex scalar when needed). The signs and index order agree with the *real matrix* commutator `E(i,j)*E(k,l)-E(k,l)*E(i,j)`. Do **not** accidentally replace the third term `B(k,i)` with positive `B(i,k)`, because `B(k,i)=-B(i,k)`.

Potential consumer controls: four pairwise distinct indices give zero, j=k gives the expected `B(i,l)` when other matches are absent, reversed pairs give zero, first/second diagonal generators vanish, and fully repeated inputs do not create central scalar remnants.

## 3. Why all-index handling is genuinely delicate

The prospective P1 four-Majorana formula yields contributions such as `(1/2)δ(j,k)Γ_iΓ_l`. **These contributions individually do not equal** `δ(j,k) B(i,l)` when `i=l`; the missing scalar halves cancel only **after the four terms are combined**, by the full CAR relation.

P2 must therefore keep *all four* antisymmetrized source factors together, or prove a generic bilinear commutator lemma with exact Kronecker deltas and a separate central-cancellation lemma. Do not prematurely rewrite each gamma product to an elementary plane under an unproved distinctness condition. This is a concrete source-level regression risk, not an aesthetic simplification.

**Independent symbolic sanity:** in a separate formal four-generator Clifford algebra with `Γ_i²=1` and pairwise anticommutation for distinct generators, a bit-mask exterior-basis multiplication enumerated all `4^4=256` ordered quadruples `(i,j,k,l)`; the above plane formula agreed identically in every case, including repeated indices. The preceding four-factor gamma identity also passed all 256 combinations. This **does not qualify a theorem** on original 48-label Fock operators, establish source pins, or replace Lean source/consumer CI. It is an algebraic sign/index control only.

## 4. Proposed bounded architecture if and only if P1 qualifies

1. A generic **opaque Fock-algebra** lemma for commutator bilinearity and real-to-complex scalar transport. Use the accepted `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`, and existing `mul_smul_comm`/`smul_mul_assoc`; never assume Fock operator multiplication commutes.
2. Apply **one** qualified P1 native four-gamma root to each antisymmetrized term, then combine/cancel central terms **before** rewriting to the `B(i,j)` source plane. Avoid opening arbitrary `K(A)=∑_{p,q}` or a 48-label nested matrix sum.
3. Bind to exact P0A/P0B plane and separately prove the *real source matrix* `[E(i,j),E(k,l)]` entry identity; do not infer the arbitrary-source matrix bracket from only elementary planes.
4. Only after independent source theorem+consumer CI with all equality cases can P3 investigate finite real-linear spanning/extension to arbitrary skew `A,B`. The full `K([A,B])=[K(A),K(B)]` and physical Spin(9) transport are separate acceptance decisions.

## 5. Donors, controls and stop

- Accepted LB0 literal Source48 CAR: `P3M4LB0OriginalSource48MajoranaBivectorCAR.lean`, Git blob `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`.
- Accepted P0A skew elementary plane: `P3M4LB1P0AOriginalSource48SkewPlane.lean`, blob `7eb090ab82be47ecae18ae0d091716188cb2db79`.
- Accepted P0B source plane norm: `P3M4LB1P0BOriginalSource48SkewPlaneNormalization.lean`, blob `1c47a8645bb8ae18110f29083c95887b8a0e3a15`.
- Accepted LB1L2 opaque Fock Leibniz: `P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean`, blob `b4012951a26aa7573db513adab3d7ce27396db7e`.
- P1 candidate original four-Majorana source R1 staged at commit `c34911208aae4964283b39454ed41d990eb1306e` with source blob `c30f23f118cea33c388f391e81b406495d52de99`; **unqualified until strict and independent original evidence pass**.
- Frozen Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, separate warning-as-error source+consumer checks, standard-only axiom auditor, original ZIP/log preservation and no resource escalation.
- CT1-G0 R1/R2 previously STOPPED after analogous native expansion recursion failures. The P2 design must **not** revive arbitrary `K(A)` expansion. Stop P2 after two analogous source-binding failures and perform a fresh route review rather than changing resource limits or accepted donors.

**Physical and theoretical ceiling:** even verified P2 elementary-plane closure is not the general skew-matrix K Lie algebra, not a global Spin(9) representation on Fock vectors, and not the physical SU(2) gauge/reduced-domain or G16/Hardy fidelity certificate. The principal physics endpoint remains a fixed-positive-regulator ground-state fidelity certificate for the original physical Hamiltonian. Keep the independent Gauss energy comparator active. Edition 0.8 monograph remains a dated snapshot; `main` untouched.
