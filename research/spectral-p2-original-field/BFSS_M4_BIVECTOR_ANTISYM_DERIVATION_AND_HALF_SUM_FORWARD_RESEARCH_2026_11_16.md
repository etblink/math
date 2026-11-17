# BFSS M4 — antisymmetrized bivector derivation and half-sum extension

Date: 2026-11-16 Pacific. **FORWARD RESEARCH ONLY. No Lean theorem, CI or original physical conclusion is qualified here.** Unified branch: `integration/bfss-unified-research-20261108`.

## Scientific finding

The source-normalized bivectors form a potentially more direct path to the full original skew-matrix Lie bracket than CT1's generic `[K(A),K(B)]` Jacobi adapter. **Use antisymmetrization before commutation, not four individually expanded products.** This also handles all equal-index cases automatically.

Put `Op := Fermion 2 →L[ℂ] Fermion 2` (genuine original Fock carrier),
```text
Γ_i := sourceNormalizedGamma i
E_ij := originalSource48SkewPlane i j
B_ij := K(E_ij)
      = (1/4 : ℝ) • (Γ_i*Γ_j - Γ_j*Γ_i).
```
The **last equality is already a qualified P0B original-source theorem** for all labels, including `i=j`. Thus `B_ii=0`. The alternative `B_ij=(1/2)•Γ_iΓ_j` requires `i≠j` and must NEVER be used at diagonal indices. The real/complex scalar bridge in the qualified original Fock donors remains mandatory.

## A. Elementary generator covariance, source exact but new goal

For all `i,j,k : Source48Label`, the intended identity is
```text
[B_ij, Γ_k] = δ(j,k) • Γ_i - δ(i,k) • Γ_j.
```
There are two source-respecting routes:

- **A1 (minimal native binding):** use accepted LB1C1 `[K(A),Γ_k]=∑_p A[p,k]•Γ_p` with `A=E_ij` and accepted P0A skewness; apply a GENERIC two-indicator finite contraction to the sum; do not unfold arbitrary `K(A)`. The original native K appears once. Verify elaboration cost before investing in a proof.
- **A2 (no K in the proof until final identification):** use accepted LB0's pair commutator twice and the antisymmetric definition. The algebraic identity
  ```text
  [(Γ_i Γ_j - Γ_j Γ_i)/4, Γ_k]
  = ( [Γ_iΓ_j,Γ_k] - [Γ_jΓ_i,Γ_k] ) / 4
  = δ(j,k) Γ_i - δ(i,k) Γ_j
  ```
  follows from the qualified LB0 scalar-2 CAR and the complex/real quarter bridge. Only after A2 qualifies, identify the result with source `K(E_ij)` via P0B. This avoids the original source48 general K binding that blocked CT1-G0 twice.

Prefer A2 if a small source-adapter preflight indicates A1 would reintroduce original K recursion. Do not enlarge recursion/heartbeat limits; the STOPPED CT1-G0 R1/R2 source and consumers stay untouched.

## B. Generic original-Fock alternating commutator derivation

For arbitrary opaque original `T,X,Y:Op` and any central `c:ℂ`, let
```text
alt_c(X,Y) := c • (X*Y-Y*X).
```
Prove entirely by accepted LB1L2 twice:
```text
[T, alt_c(X,Y)] = alt_c([T,X],Y) + alt_c(X,[T,Y]).
```
This follows from the Leibniz law on `XY` and `YX`. Crucially it never assumes original Fock multiplication commutes, and the coefficient commutes with operator multiplication only because it is a **central complex scalar**.

Use the actual `c=1/4` complex scalar, explicitly related to the accepted original real quarter coefficient. Give this abstract lemma an independent consumer with arbitrary opaque operators before any source substitution. It is strictly smaller than the four-factor P1 native proof, though P1 remains a useful separate regression gate.

## C. All-index sparse-plane closure, including diagonals

Set `B_ij=alt_{1/4}(Γ_i,Γ_j)`. From A and B:
```text
[B_ij,B_kl]
  = alt_{1/4}([B_ij,Γ_k],Γ_l)
    + alt_{1/4}(Γ_k,[B_ij,Γ_l])
  = δ(j,k) B_il - δ(i,k) B_jl
    + δ(j,l) B_ki - δ(i,l) B_kj.
```
This is the precise bracket of the original real source elementary planes `E_ij`. The third coefficient is **`+δ(j,l)B_ki`**, not `+δ(j,l)B_ik`. Antisymmetry `B_ij=-B_ji` and `B_ii=0` follow definitionally, so equal-index cases do not require special disjointness assumptions or individually rewriting gamma products.

The matrix companion is
```text
[E_ij,E_kl] = δ(j,k) E_il - δ(i,k) E_jl
                + δ(j,l) E_ki - δ(i,l) E_kj.
```
Qualify separately via **generic matrix-unit multiplication** before source `Source48Label`. Only then align the two exact 4-term formulas.

## D. The important no-ordering extension identity

For every real skew `A:Matrix Source48Label Source48Label ℝ`,
```text
A = (1/2) ∑_{i,j : Source48Label} A[i,j] • E_ij
K(A) = (1/2) ∑_{i,j : Source48Label} A[i,j] • B_ij.
```
This uses **all** ordered pairs, not just `i<j`. Entrywise:
```text
(1/2) ∑ A_ij E_ij[p,q]
= (A[p,q]-A[q,p])/2 = A[p,q].
```
The second equality follows from the actual source K's real-linearity and exact P0B `K(E_ij)=B_ij`, not from assuming an unqualified universal representation. An independent algebraic check gives the same result:
```text
(1/2) ∑ A_ij B_ij
= (1/8) ∑ A_ij (Γ_iΓ_j-Γ_jΓ_i)
= (1/4) ∑ A_ij Γ_iΓ_j = K(A),
```
where the second term is reindexed and real skewness is used.

**Why this matters:** After a qualified all-index B bracket, `[K(A),K(B)]=K([A,B])` may follow by generic finite-sum bilinearity, four-delta contraction, and the half-sum decomposition, without the CT1-G0 commutant/Schur/trace elimination route at all. This remains an *unproved Lean obligation*; the proof cost is finite-index algebra and exact real/complex scalar handling, rather than a gigantic native Fock K product. CT0 original trace zero is an independently accepted consistency property but is **not logically required** for this particular direct basis-extension proof.

## E. Independent exact arithmetic evidence, not a proof

A separate 6-generator Clifford algebra implementation (basis bitmasks, associative multiplication with the exact swapping sign, exact rational coefficients; `Γ_i²=1`) gave:
- **216 of 216** vector-action triples `[B_ij,Γ_k]`: pass.
- **1,296 of 1,296** sparse-plane quadruples `[B_ij,B_kl]`: pass, including all repeated labels.
- A deterministic nonzero real skew `6×6` pair `A,B`: exact `K(A)=(1/2)∑ A_ij B_ij`, `K(B)` likewise, source coefficient covariance, and `[K(A),K(B)]=K(AB-BA)`: all pass with `Fraction` arithmetic.

This is a sign/index/combinatorics sanity test in a finite **surrogate algebra only**, never original Source48 Fock proof qualification, and cannot validate Lean source, consumer, axiom reports, or physical BFSS claims.

## F. Evidence from reference geometry

Standard Clifford algebra sources characterize grade-two bivectors as closed under commutators and describe `M_ij=1/4[Γ_i,Γ_j]` as rotation Lie-algebra generators. See D'Hoker, *Group Theory* lecture notes, §6.2 (https://pa.ucla.edu/faculty-websites/dhoker-lecture-notes/graduate-courses/group-theory.pdf) and Hestenes–Sobczyk, *Clifford Algebra to Geometric Calculus*, Chapter 1 (https://math.mit.edu/~dunkel/Teach/18.S996_2022S/books/Hestenes-Sobczyk1984_Book_CliffordAlgebraToGeometricCalc.pdf). These are mathematical background, **not** verification of this repository's source exact Lean declarations.

## G. Governance, priorities, and stopping rule

- Current last qualified original physical-Fock algebra result: **CT0 R2 STRICT GREEN #43983772199**. It proves original skew K(A) trace zero, not complete K-Lie closure.
- The attempted CT1-G0 general K Jacobi source binding is **STOPPED** after its two analogous recursion REDs #43988822460 / #43991790285 with original ZIPs and full logs preserved.
- P1 R1 strict #43996551474 subsequently returned RED from **line-split donor identifiers**, starting at its line 41. This is a source syntax/type resolution failure, **not** a CAR contradiction. Its two source declarations/consumer remain unqualified. Preserve the original run and artifact first, then repair only donor identifiers in a bounded R2. The new antisymmetric route is a prospective alternative even if P1 later qualifies.
- **Decision for next research milestone:** Prefer to formalize abstract alternating-commutator Leibniz and elementary B covariance as tiny independent gates, then all-index plane closure; only then attempt generic finite skew-matrix half-sum and linearity. Do not begin with a 48⁴ native sum and do not automatically launch P2 if P1 has not qualified.
- Keep original SU(2) gauge and physical Spin(9) core, G16 Hardy/fidelity, fixed-positive-regulator ground-state certificate and nonzero physical trial-state estimates as **separate open physical obligations**. This algebraic route must be compared with the independent Gauss energy lane and reallocated if it ceases removing a named obstruction.
- Read-only/default for accepted donor sources; any new staged Lean source requires frozen blob pins, independent consumer, strict standard-only axiom reports (`propext`, `Classical.choice`, `Quot.sound`), 4+ source controls, negative auditor and complete original artifact preservation. No CT1-G0 R3, recursion/heartbeat escalation, hidden assumptions, or writes to `main`.
