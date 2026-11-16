# BFSS M4 forward research — Yukawa-incidence normalizer, Spin(9) × SU(2) orbits and the 2,066-state singlet reduction

**Research date:** 2026-11-16 (Pacific). **Canonical repository:** `etblink/math`, unified integration branch `integration/bfss-unified-research-20261108`. **Status:** forward-research memorandum, NOT an accepted new Lean theorem or an altered physical BFSS definition. Retain independently qualified LB1C1 source byte SHA `c2e7a7c665121283cde13ae5dabc183362b6b420`, strict GREEN #43901524171. Existing LB1L0 and D0/D1 diagnostic REDs remain separate.

## Executive research conclusion

The physical continuous symmetry algebra of relative SU(2) BFSS, `spin(9) ⊕ su(2)`, has dimension **36+3=39**. Our previous **finite canonical/source-gamma rank experiments**, with 48 real modes and a 27-dimensional Yukawa incidence span, independently found a 39-dimensional skew-operator normalizer. New November 2026 SU(2) BFSS ground-state papers exploit the very same **39-dimensional Spin(9) × SU(2) group**, with a generic **15-dimensional continuous stabilizer** to reduce **27 bosonic variables to 3 singular values**, and a lifted **SU(4) × Z₂ × Z₂** fermionic stabilizer to reduce the full **2²⁴-dimensional Fock fiber to 2,066 invariant states**.

This is a substantial *connection*, **not yet an equivalence theorem**: the Yukawa normalizer was computed in finite incidence models (including source-literal 16×16 gammas), **not source-exact 48 paired Fock labels nor the original Hamiltonian**; the singlet reduction comes from external physics manuscripts. The dimension 39 does **not** establish conservation of the larger `so(48)` nor prove source group lifts, physical Gauss invariance or closed 16-charge domains.

## Sources, scope and scientific status

1. **Michel, Scheinpflug, Yin,** “99.9...% of the SU(2) BFSS ground state,” arXiv:2611.09837 (submitted **2026-11-06**), https://arxiv.org/abs/2611.09837. Uses an auxiliary supercharge Hamiltonian, symmetry reduction, and an explicitly certified variational ground-subspace overlap `≥0.999997`; crucially this auxiliary gap does **not** establish a positive spectral gap for original BFSS `H`. See paper §III and appendix for the 2066-state structure. This paper had already been considered under M5.
2. **Bajaj and Lin,** “Solving the SU(2) BFSS model,” arXiv:2611.14512 (submitted **2026-11-10**), https://arxiv.org/abs/2611.14512. Presents numerical SU(2) ground state and correlator comparison, asymptotic tails, nonperturbative scattering estimates, positive-energy bound states in some SO(9) representations, and resonances. These are paper-reported numerical/scattering/existence results, not Lean results or a new original BFSS mass gap.
3. **Sanjurjo and Zikopoulos,** “Bound States of Two D0-Branes and the Three-Graviton Coupling,” arXiv:2611.17325 (submitted **2026-11-12**), https://arxiv.org/abs/2611.17325. Appendix C derives the symmetry orbit SVD, exact generic stabilizer and Schur/Howe-dual fermionic invariant count; the paper reports a numerical ground-state estimate and a code/data repository https://github.com/ssanjurjo/su2-bfss. Distinguish its reported >99% numerical overlap from Michel et al.'s stronger rigorous auxiliary bound.

Review the exact source, physical normalization and any preprint updates before importing any numerical data or operator statement into our Lean project.

## Incidence-first algebraic candidate — physically selected 39-dimensional normalizer

Let `S=ℝ¹⁶` be the real Spin(9) spinor and `C=ℝ³` the SO(3) color vector. The 48 real fermionic mode space is `U=S⊗C` with `so(U)` of dimension `48·47/2=1128`. For nine literal real symmetric Clifford gamma matrices `γ_I` and three real color skew generators `L_a`, define the **candidate** 27-dimensional Yukawa incidence space

```text
W = span_ℝ { γ_I ⊗ L_a : I=1..9, a=1..3 } ⊂ so(U).
N(W) = { A ∈ so(U) : [A,W] ⊂ W }.
```

Earlier **finite exact-integer/modular experiments** on the canonical gamma model and independently transcribed original `SU2RealGammaProbe.lean` gamma entries produced rank **1089** for the normalizer constraint map (same over primes 97,101,103,1009) and **39** independent exactly verified kernel generators, namely `γ_Iγ_J⊗I₃` (36 directions) and `I₁₆⊗L_a` (3 directions). In this finite canonical model, these two inequalities show rational/real nullity exactly 39. This is **not yet source exact Lean** for our original 48 paired Fock representation nor a theorem of the physical Hamiltonian. Preserve original probes:
- `research/spectral-p2-original-field/BFSS_M4_incidencenormalizer_canonical_rank_probe_2026_11_16.py`
- `research/spectral-p2-original-field/BFSS_M4_incidencenormalizer_source_gamma_rank_probe_2026_11_16.py`
- `research/spectral-p2-original-field/BFSS_M4_INCIDENCE_NORMALIZER_SOURCE_GAMMA_39D_RANK_EXPERIMENT_2026_11_16.md`.

### New conceptual proof candidate: representation decomposition, not a 30,456×1,128 kernel

For real Spin(9) spinor `S=16` and color `C=3`, the exterior-square tensor identity implies

```text
so(S⊗C) ≅ Λ²S⊗Sym²C ⊕ Sym²S⊗Λ²C.
```

Under Spin(9), the standard spinor bilinear decomposition is

```text
Λ²S ≅ Λ²ℝ⁹ ⊕ Λ³ℝ⁹ = 36 ⊕ 84,
Sym²S ≅ 1 ⊕ ℝ⁹ ⊕ Λ⁴ℝ⁹ = 1 ⊕ 9 ⊕ 126.
```

For SO(3) color, `Sym²C=1⊕5` and `Λ²C=3`. Hence the `so(48)` dimension check is

```text
(36⊕84)⊗(1⊕5) ⊕ (1⊕9⊕126)⊗3,
(36+84)(1+5)+(1+9+126)·3 = 720+408 = 1128.
```

The Yukawa span `W` transforms as `9⊗3`. The obvious subalgebra normalizing it is `(36⊗1) ⊕ (1⊗3)`, dimension `39`. **Prospective structural proof**: the normalizer condition is Spin(9) × SO(3)-equivariant; prove that its kernel has no component in the remaining pairwise inequivalent irreducibles `84⊗1`, `36⊗5`, `84⊗5`, `9⊗3`, `126⊗3`, e.g. by an explicitly nonzero off-W bracket for one highest-weight/test vector in each. This can replace the huge rank computation with a finite representation-theoretic argument, though formalizing these irreducible decompositions in Lean is not yet budgeted or qualified.

**Important qualification:** `W` is a span of *fermion bilinear coefficient matrices*; `N(W)` is a kinematic normalizer of that span. To infer a genuine BFSS dynamical symmetry one must also specify bosonic transformations, preserve the Yukawa coupling tensor and bosonic potential, implement the Gauss constraint, and check the closed operator domains. No blanket 'hidden SO(48) symmetry' is justified.

## Orbit and stabilizer incidence yields three coordinates — external physical result

In the cited SU(2) papers, the bosonic coordinate is a `9×3` real matrix `q`, with `Spin(9)×SU(2)` acting on it through `SO(9)×SO(3)`:

```text
q ↦ U q Vᵀ;
q = U Σ Vᵀ;
Σ = [diag(r₁,r₂,r₃); 0_(6×3)],  r₁ ≥ r₂ ≥ r₃ ≥ 0.
```

A generic full-rank `q` with distinct positive singular values has connected stabilizer `SO(6)` (dimension 15), together with a discrete `ℤ₂×ℤ₂`. Consequently the orbit dimension is `39-15=24`, leaving `27-24=3` gauge+rotation-invariant bosonic coordinates. On generic slice `Σ`, invariant fermions must lie in the **lifted** `SU(4)×ℤ₂×ℤ₂` fixed space, with `SU(4)≅Spin(6)` acting on six orthogonal spatial directions. The exact measure/Jacobian (up to constant) is

```text
J(r) = ∏_(i<j)|r_i²-r_j²| · ∏_i r_i⁶.
```

On walls `r_i=r_j` or `r_i=0`, stabilizers enlarge and regularity imposes additional boundary conditions. This matters for any source-equivalent geometric reduction and cannot be ignored because such walls have measure zero. One cannot infer a closed-operator domain or a ground-state theorem merely from a generic orbit decomposition.

## Fermionic invariant fiber 2,066: exact independent arithmetic check and representation prerequisite

In the cited papers' choice of polarization, the original 48 real modes become 24 complex modes arranged as `ℂ⁴⊗ℂ⁶`, where `SU(4)` acts on `ℂ⁴` and residual color/spin index resides in `ℂ⁶`. The full Fock space is `Λ•(ℂ⁴⊗ℂ⁶)` of dimension `2²⁴`. Skew Howe duality gives SU(4) singlets only at fermion numbers `4k` with `k=0..6`, in Schur functors `S_(4^k)(ℂ⁶)`, dimensions

```text
dₖ = [1,126,1764,4116,1764,126,1], sum = 7898.
```

Under the three nonidentity `ℤ₂×ℤ₂` elements, character traces (as in Sanjurjo–Zikopoulos Appendix C.2) are

```text
χₖ = [1,6,36,36,36,6,1].
nₖ=(dₖ+3χₖ)/4=[1,36,468,1056,468,36,1],
sum nₖ = 2066.
```

The arithmetic was independently recomputed in a small Python calculation; this validates only the numerical projection identity given the listed representation dimensions and character values, not their underlying representation-theoretic derivation. All 4k sectors have even Fock parity, which the paper uses to resolve its spin-lift sign ambiguity on the singlet fiber. **Do not silently equate** this polarization with our original `Source48Label=Fin 24 × Fin 2` paired creation/annihilation ordering: an explicit source-exact CAR/Fock equivalence and central-sign test would be required.

## Practical Project Lead implications and proposed order

1. **Keep accepted M4-LB1C1 frozen.** The qualified native `K(A)=¼∑A[p,q]Γ_pΓ_q` skew action and source covariance `[K(A),Γ_k]=∑_p A[p,k]Γ_p` form a strong original-Fock representation interface.
2. **Do not let LB1L0 proof elaboration consume the entire program.** The generic noncommutative associative Leibniz theorem compiled; the failures R1 (recursion), R2 (kernel timeout), and D0 (transparent-let calc recursion) isolate source instantiation, not failed mathematics. The current D1 generalized-atom diagnostic is a narrowly falsifiable test. It has independent operational preflight failures recorded; its clean scientific outcome must be checked separately. Do not touch existing production LB1L0 or original accepted donor while D1 runs.
3. **Explore a smaller *physical 39-generator* source adapter** parallel to the full 1128-dimensional `so(48)` route. Define the 36 spin and 3 color directions on the actual original 48-label space via source gamma/color maps, prove skewness and that they normalize original Yukawa coefficient tensors, then use **accepted LB1C1** to obtain their Majorana action. Compare this exact adapter against the 39-dimensional computational normalizer; never infer Hamiltonian invariance from the tensor normalizer alone.
4. **Treat generic orbit/stabilizer reduction as a separate bounded geometry task.** First qualify linear-algebra facts about `9×3` singular values, Gram invariants, stabilizer dimension, and the 27−24=3 count, then handle degenerate strata and domains. This is a testable mathematical target for 'incidence before identity'.
5. **Use the 2,066 count as a strict regression benchmark**, not immediate replacement of original Fock. Formalize the finite arithmetic and the `ℤ₂×ℤ₂` projector before attempting the explicit `SU(4)` Fock basis and source-equivalent polarization. Keep `(-1)^F`/Spin central sign explicit. This provides an economical physical-state construction route connected to the M3 SU(2) gauge and M5 auxiliary method.
6. **After** coherent group actions and exact original source equivalence, revisit full 16 original charge common invariant domains, closed quadratic forms, and physical spectral statements. The auxiliary method produces certified overlap bounds despite continuum at zero; positive-energy eigenstates in spin sectors do **not** imply an original Hamiltonian mass gap.

### Proof architecture alternative for original Lie bracket

**Generic finite associative proof (unqualified in Lean):**

```text
[K(A),K(B)]
 = ¼∑_(p,q)B[p,q]([K(A),Γ_p]Γ_q + Γ_p[K(A),Γ_q])
 = ¼∑_(r,q)(A B)[r,q]Γ_rΓ_q
   +¼∑_(p,r)(B Aᵀ)[p,r]Γ_pΓ_r
 = K(A B - B A).
```

Instead of letting Lean unfold native `originalSource48BivectorK A` at each `calc` boundary, first create an abstract typed theorem for `T : Fermion 2 →L[ℂ] Fermion 2`, `x : ι→Op`, and arbitrary real matrices `A,B` with an explicit assumption `∀k, [T,x k]=∑_p A[p,k]•x p`. Prove entire finite-sum/product expansion **on opaque quantified variables**, then specialize **once** with `T=originalSource48BivectorK A`, `x=sourceNormalizedGamma`, and accepted LB1C1. An alternative basis approach uses elementary skew planes `E_ij-E_ji`, where `K(E_ij-E_ji)=½Γ_iΓ_j`; only small CAR identities are needed before linear extension. As an **independent 4-mode sanity check**, 2-qubit Jordan–Wigner gammas were checked numerically for all 36 ordered pairs of the six elementary skew planes: maximum bracket discrepancy exactly zero at floating arithmetic precision. This is **not** proof of source 48-mode Lie closure or a substitute for a strict Lean gate.

## Decision point

The important strategic possibility is to **align the mathematics with the 39-dimensional physical incidence symmetry before pursuing all 1128 kinematic `so(48)` generators**. This is a research prioritization, not permission to declare the normalizer equivalence or the physical singlet theorem proved. Reserve formal acceptance exclusively for exact checked original source+independent consumer CI receipts.

This memo is documentation-only. No changes to original main, accepted Lean source modules, historical REDs, or live D1 diagnostic.
