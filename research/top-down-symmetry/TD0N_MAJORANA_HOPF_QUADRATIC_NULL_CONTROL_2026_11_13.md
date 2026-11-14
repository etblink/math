# TD0N — why the naive Hopf quadratic of original BFSS Majoranas is zero

**Date:** 2026-11-13 Pacific. **Status:** ANALYTIC NULL CONTROL; not yet a qualified native Lean root. Do not promote as a physical spectral theorem. Refers to frozen exact original `AlgebraData 2` source gamma/θ and real-48 source labels.

## 1. Classical source candidate and its limitation

Let `S=R^16` be the **commuting** real Spin9 spinor representation, with symmetric real Clifford matrices Γ_i, and define `h_i(s)=Σ_{αβ} s_α Γ_i[αβ] s_β`. The standard octonionic Hopf map can be written in such coordinates under a correct orthogonal equivalence. One may color-contract `H_i(s_1,s_2,s_3)=Σ_a h_i(s_a)`, a quadratic on `R^3⊗S` invariant under the SO3 adjoint action and equivariant under Spin9 **if those exact source actions have been matched**.

This color-contracted map is **not a fibration** of the unit real 48-sphere by normalization: in standard octonionic Hopf coordinates let `s₊=(1,0)`, `s₋=(0,1)` in `O⊕O`. Their Hopf vectors are `+e9` and `−e9`; therefore for `s=(s₊/√2,s₋/√2,0)∈S^47` one gets `H(s)=0`. Thus `H/‖H‖` is undefined on a nonempty source-like subset. Do not invent a global `S^47→S^8` by simply summing three Hopf spinors.

## 2. The genuine original CAR forces the naive quantized vector to vanish

In source `lean/OAI/MathematicalPhysics/BFSS/Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, the original finite-dimensional complex Fock operators `θ_{αa}:F→L[C]F` satisfy

`{θ_{αa},θ_{βb}} = δ_{αβ}δ_{ab} I`, and the original real `16×16` gamma `Γ_i` are symmetric and satisfy `{Γ_i,Γ_j}=2δ_{ij}I`.

Define the **naive** un-ordered fermionic Hopf-vector candidate

`O_i = Σ_a Σ_{α,β} Γ_i[αβ] θ_{αa} θ_{βa}`.

By gamma symmetry, swapping α and β and averaging:

`2 O_i = Σ_a Σ_{αβ} Γ_i[αβ](θ_{αa} θ_{βa}+θ_{βa} θ_{αa})`
`      = Σ_a Σ_{α} Γ_i[αα] I = 3 Tr(Γ_i) I`.

For any fixed i choose j≠i (possible with nine original spatial indices). The Clifford relations give `Γ_j²=I` and `Γ_j Γ_i Γ_j = −Γ_i`. By cyclicity of finite matrix trace, `Tr Γ_i = Tr(Γ_j Γ_i Γ_j) = −Tr Γ_i`, hence `Tr Γ_i=0` in characteristic zero. Therefore

`O_i=(3/2) Tr(Γ_i) I = 0` exactly.

This conclusion is independent of representation basis and uses only the literal original gamma symmetry, Clifford and normalized θ-CAR. No `θ` commutativity or classical spinor substitution is allowed. Because the expression is zero, it cannot produce a new nonzero Spin9 vector observable nor a source realization of the Hopf map by such a direct Majorana replacement.

## 3. What to test instead

Fermionic angular momentum is plausibly represented by **antisymmetric** gamma products `Γ_{ij}=(Γ_i Γ_j−Γ_j Γ_i)/2`, source `AlgebraData.gammaTwo`, contracted with appropriately **ordered** original Majorana bilinears and correct factors of i. These do not vanish by the symmetric-CAR argument and live naturally in so(9), not in the nine-vector module. This provides a source-bound route to the Spin9 Noether generators and perhaps (via integration of a finite-dimensional Lie-algebra action on the true Fock vector fiber) the missing continuous Spin9 representation. **No such original source Lie-vector implementation is asserted qualified by this memo.**

## 4. Exact Lean proof contract (not yet staged)

- Input original `pairedAlgebraData.gamma_symmetric`, `.gamma_clifford`, `.theta_CAR` with exact original `SpinIndex=Fin16`, `ColorIndex 2=Fin3`; prove `Matrix.trace (pairedAlgebraData.gamma i)=0` from j≠i.
- Prove `O_i=0` as an equality in `Fermion 2 →L[ℂ] Fermion 2` by summand transposition and the true CAR; independent consumer must check the original source types and permitted axioms only.
- Keep a separate classical real16 `h` in a distinct namespace/type; never conflate real spinor coordinates and noncommuting quantum Majorana operators.
- Null verdict does NOT rule out other quartic, mixed-color or ordered Clifford bilinears, a genuine classical Hopf map, or a different valid category/fibration route. It only falsifies this specific naive transfer.

## 5. Provenance and use

Cross-reference [TD0 top-down plan](TD0_BFSS_SPIN9_SU2_ORBIT_HOPF_SOURCE_BOUND_RESEARCH_2026_11_13.md), the internal BFSS monograph edition 0.4 Chapters 7–9 (historical snapshot), and [source Noether/Clifford commutator study](../spectral-p2-original-field/P3_NOETHER_RADIAL_WEIGHT_CLIFFORD_COMMUTATOR_SOURCE_REUSE_2026_11_13.md).
