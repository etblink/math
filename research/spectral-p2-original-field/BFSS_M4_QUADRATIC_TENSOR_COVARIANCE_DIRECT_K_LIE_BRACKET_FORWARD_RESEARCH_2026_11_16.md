# BFSS M4 — quadratic tensor covariance: shorter source-exact Lie bracket route

Date: 2026-11-16 Pacific. **FORWARD RESEARCH ONLY — no new Lean theorem, independent consumer, workflow, source gate or physical result qualified by this memorandum.** Sole research branch `integration/bfss-unified-research-20261108`. Written while P1 R2 strict [#43998813826](https://github.com/etblink/math/actions/runs/43998813826) was still running. The original P1 R1 RED evidence and CT1G0 two-RED stop remain untouched.

## 1. The central discovery: tensor-square covariance implies the full bracket

Let `I` be any finite label type, `Op` any associative noncommutative complex algebra (first proof target: the **actual** `Fermion 2 →L[ℂ] Fermion 2` continuous-linear Fock operator space), `T : Op`, and `x : I → Op`. For arbitrary coefficient matrices `a,b : I → I → ℂ` assume the **explicit** covariance hypothesis

```text
hcov(k) : [T, x_k] = ∑_p a[p,k] • x_p.
```

Define a quadratic operator with the source's unchanged one-quarter normalization

```text
Q_x(b) := (1/4) ∑_{i,j} b[i,j] • (x_i*x_j).
```

Then **without any Clifford anticommutation, trace, Schur/commutant argument, or skewness hypothesis**:

```text
[T, Q_x(b)] = Q_x(a*b + b*a.transpose).                (QTC)
```

Proof: using the ordinary commutator derivation and central complex scalars,

```text
[T,Q_x(b)]
 = (1/4)∑_{i,j} b[i,j]([T,x_i]x_j + x_i[T,x_j])
 = (1/4)∑_{p,j}(∑_i a[p,i]b[i,j])x_p x_j
 + (1/4)∑_{i,p}(∑_j b[i,j]a[p,j])x_i x_p
 = Q_x(a*b + b*a.transpose).
```

The second coefficient is `(b*a.transpose)[i,p]` **not** `(b*a)[i,p]`; dropping the transpose is the most important prospective false proof. All sums are finite; operator multiplication remains NONCOMMUTATIVE; no reordering of `x_i*x_j` occurs.

When `a.transpose = -a`, this immediately reduces to

```text
[T, Q_x(b)] = Q_x(a*b - b*a).                         (QTC-skew)
```

This requires no skewness assumption on `b`, and the stronger arbitrary-`b` statement is a useful adversarial theorem target.

## 2. Why this can bypass BOTH the blocked CT1 adapter and P1/P2

The previously qualified original source theorem in
`P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`
(Git blob `c2e7a7c665121283cde13ae5dabc183362b6b420`) states, for real entrywise skew `A`,

```text
[originalSource48BivectorK A, sourceNormalizedGamma k]
  = ∑_p (A[p,k] : ℝ) • sourceNormalizedGamma p.
```

The actual original source
`P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean`
(Git blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`)
defines, for **every** real `B` (no skew requirement),

```text
originalSource48BivectorK B
  = ∑_{i,j:Source48Label} (B[i,j]/4 : ℝ) •
      (sourceNormalizedGamma i * sourceNormalizedGamma j).
```

Use the already qualified explicit real-to-complex scalar bridge
`FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`
to interpret original real coefficients inside the generic complex `Q_x`. For `T=K(A)`, `x_i=Γ_i`, and `a=(A:ℂ)`, QTC-skew would yield

```text
[K(A), K(B)] = K(A*B - B*A)                            (SOURCE TARGET)
```

for **A real skew, B any real 48×48 matrix**. This is strictly stronger than the needed Lie-homomorphism statement for skew A and skew B. Since `K` is already defined on all real matrices, this stronger statement has no source-definition ambiguity. The full Lie bracket still requires exact independent Lean compilation and source/consumer tests.

The critical implementation change: **the generic proof uses only a covariance hypothesis, and the source exact join uses one previously qualified hcov**. There is no `[[K(A),K(B)],Γ_k]` Jacobi source adapter, no gamma commutant, no scalar trace elimination, and no native expansion of `K(A)` inside the proof. It also does not require the proposed P1 four-Majorana result or P2 plane closure.

## 3. Exact donors, proof layering and failure budget

**QTC0 (generic math, first suggested new gate, NOT STAGED):**
- State a theorem on original `Op` with finite generic index `ι`, `T : Op`, `x : ι → Op`, and `a,b : ι → ι → ℂ`.
- Use the **accepted LB1L2** two-hypothesis product Leibniz theorem (Git blob `b4012951a26aa7573db513adab3d7ce27396db7e`). Do not build a new operator representation or assume CAR. Reuse small finite-sum commuting of indices and `smul_mul_assoc`, `mul_smul_comm`, `Finset.sum_comm`, `Finset.sum_sub_distrib`.
- Prove first the coefficient-level **general** form `a*b + b*a.transpose`; derive the skew specialization in a separate small theorem. Keep transpose and matrix product typed at `ι` before source `Source48Label`.
- Standalone strict source+independent consumer, source root axiom reports, and adversarial tiny finite-index controls. A 2×2 nonskew `a` must *not* be incorrectly simplified to a commutator; verify `a=I`, `b=E_00` gives `a*b+b*aᵀ=2b`, whereas `a*b-b*a=0`.

**QTC1 (real scalar bridge, separately bounded):**
- Prove `(r : ℝ) • X = (r : ℂ) • X` with the **already accepted** source bridge, and the compatibility of original finite sum `K(B)` with `Q_x((B:ℂ))`.
- Prove `Complex.ofReal` commutes with coefficient matrix multiplication, transpose and finite sums by existing algebra lemmas. Do not infer a global `Module ℝ Op` or `IsScalarTower` instance. Keep original `B[i,j]/4` exact, no shift in source 1/4 normalization.
- An alternative is a generic REAL-coefficient QTC theorem on `Op` with local bridge lemmas, following the already qualified LB1C0 scalar interface; choose whichever has fewer source typeclass conversions.

**QTC2 (native source binding, separately bounded):**
- Locally bind `T : Op := originalSource48BivectorK A` and `x : Source48Label → Op := sourceNormalizedGamma`.
- Build one fully typed covariance hypothesis from the ACCEPTED LB1C1 theorem. Keep arbitrary native `K(A)` opaque throughout the generic QTC proof; never expand a 48×48 Fock sum.
- Identify original `K(B)` and `K(A*B-B*A)` with the generic quadratic sums at the *boundary only*. Source theorem and separately imported independent consumer must pass cold warning-as-error CI and standard-only axiom audit. Retain the previous CT1G0 two-source-binding-RED stop as a **warning**, not a license to repeat it under a new name.
- If the first native adapter fails recursively, preserve exact logs/artifact and audit whether the type equivalence is necessary. A second analogous native source binding failure stops this route; no recursion/heartbeats escalation.

**QTC3 (only if QTC2 is qualified):**
- State final skew-to-skew Lie homomorphism and transport to the actual source Spin(9) subgroup only after a **separate** source embedding/differential agreement. Do not conflate an so(48) Lie-algebra identity with global Spin(9), physical SU(2) gauge invariance, closed unbounded Hamiltonian covariance or ground-state existence.

## 4. Independent adversarial sanity checks (not Lean verification)

1. Pure **free noncommutative word algebra** on four symbols `x_0,…,x_3`: choose deterministic non-skew `a,b∈Mat₄(ℚ)`; compute the coefficient of each ordered word `x_u*x_v` after the derivation on `Q(b)`. It equals `(a*b+b*a.transpose)[u,v]/4` for all 16 words. For skew `a`, the same check gives `(a*b-b*a)/4`. No Clifford quotient was used.
2. Exact rational **five-generator Clifford algebra** with `Γ_i²=1`, pairwise anticommutation: direct checks over 125 ordered generator-action triples and 625 ordered plane-bracket quadruples passed. For a nonzero skew 5×5 `A`, a nonzero skew 5×5 `B` and six independently generated arbitrary (often nonskew) matrices `B`, `[K(A),K(B)]=K(AB-BA)` passed.
3. These checks are algorithmic sign/index evidence in small surrogate algebras only. No claim is made about original 48-label Fock, Lean's exact imports, mathematical peer review, or the physical model.

## 5. Non-obvious structural interpretation and scientific priorities

The general transformation `B ↦ aB+Ba.transpose` is the induced action on **rank-two tensors**. Skewness turns this into the **adjoint commutator** `B ↦ [a,B]`. This structural representation-theoretic fact is the source of the full bracket, not a mysterious trace cancellation. It lets us preserve the original normalized basis, avoid an early ontology commitment and separate the abstract algebra from exact BFSS physical binding.

As an orthogonal spin representation sanity reference, D'Hoker's UCLA *Group Theory* notes, §6.2 (https://pa.ucla.edu/faculty-websites/dhoker-lecture-notes/graduate-courses/group-theory.pdf), and Woit's *Clifford Algebras and Spin Groups* notes (https://www.math.columbia.edu/~woit/LieGroups-2012/cliffalgsandspingroups.pdf) discuss quadratic Clifford spin generators; they do **not** establish any of our current source-exact Lean claims. The QTC tensor derivation above is proved on paper in this memorandum and only proposed for Lean.

**Project Lead comparative decision:** Treat QTC0/QTC1 as potentially *higher-value next research targets* than a P2 sparse-plane bracket because they use qualified LB1C1 and LB1L2 already and potentially bypass P1. Do not alter or interrupt the currently running P1 R2 #43998813826, and do not stage QTC CI concurrently. After the P1 verdict/evidence, choose the smallest independent generic theorem gate based on the proof surface and source-bridge risk. Retain P1 and P2 as fallback/independent regression routes. The ultimate physics objective remains the fixed-positive-regulator ground-state fidelity certificate on the **original** physical Hamiltonian; full G16 Hardy, physical singlet/Spin(9), gauge/charge domains and nonzero trial energy remain open.

Canonical last qualified mathematical gate remains **CT0 R2 #43983772199**. CT1G0 R1/R2 remain permanently stopped, with original RED ZIPs preserved. P1 R1 original RED ZIP and syntax diagnosis retained. No negative knowledge deletion, theorem inflation, mass-gap claim, or writes to `main`.
