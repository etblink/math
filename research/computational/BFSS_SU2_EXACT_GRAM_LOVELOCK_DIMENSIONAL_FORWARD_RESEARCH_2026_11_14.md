# BFSS SU2 exact-Gram / Lovelock dimensional research — Python evidence

**Date:** 2026-11-14 Pacific. **Status:** EXPLORATORY_FINITE_EXACT_CALCULATIONS, **NOT** an original-source Lean theorem, source-complete fermion/Hamiltonian result, emergent-gravity proof, auxiliary gap, or BFSS mass-gap claim. No active Lean gate/consumer/workflow/checkpoint changed. Experiment seed `20261114`; 32 exact integer 9×3 fixtures; SymPy rational arithmetic. Independent runnable Python script, full CSV fixtures and JSON digest were exported as conversation artifacts along with this memo; not embedded as repo code in this commit.

## Source context

- Original `lean/OAI/MathematicalPhysics/BFSS/Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` has `SpaceIndex = Fin 9`, `ColorIndex N=Fin(N²−1)`, hence 9×3 real coordinates at original `N=2`; it defines original `M.charge`, sixteen spinor directions, gauge algebra and original quantum Hilbert space. **Python did not evaluate `M.charge` nor the fermion sector.**
- Independent new paper: Kabir Bajaj and Henry W. Lin, *Solving the SU(2) BFSS model*, 2026-11-10, [arXiv:2611.14512](https://arxiv.org/abs/2611.14512), §2.1, Eq. 2.3 and following orbital measure: normalized bosonic `V=Σ_{a<b} s_a² s_b²`, `J(s)=Π s_a⁶ Π_{a<b}(s_a²−s_b²)`.
- Lovelock maximally symmetric density `L_k(D,r)=D!/(D−2k)! r^(−2k)` for `D≥2k`; see [CERN text eq. 3.2](https://cds.cern.ch/record/197078/files/198906325.pdf). Its normalization to the Euler number in critical even dimensions uses `[(4π)^k k!]^(−1)`.

## Experiment, outcomes and controls

1. Three independent exact implementations agree for **32/32** integer fixtures: `V=Σ_{i<j}||X_i×X_j||²=[(tr Q)²−tr(Q²)]/2=Σ_{i<j,a<b}(X_ia X_jb−X_ib X_ja)²`, `Q=XᵀX`. Mathematically Cauchy–Binet provides universal proof; finite fixtures validate implementations only.
2. Exact rational `SO(3)` right color rotation and `SO(9)` left spatial rotation preserve `V` for **32/32** fixtures. Deliberately incorrect plus-sign formula `[(tr Q)²+tr(Q²)]/2` rejected **32/32**.
3. For `X=uvᵀ`, rank one, `V=0` at arbitrarily large radius. In explicit test `||X||²=3990,399000,39900000,3990000000`, each `V=0`.
4. **Noncommuting near-valley adversarial family:** `s=(t,t^(−2),1/(2t²))` has `||X||²=t²+5/(4t^4)` and `V=5/(4t²)+1/(4t^8)>0`, hence `V→0` as `||X||→∞`. Exact `t=2: V=321/1024`; `t=4: V=20481/262144`; `t=32: V≈0.00122070312523` with `||X||²≈1024`. This rules out global **bosonic potential alone** radial coercivity, not coercivity of any genuine quantum weighted supercharge or auxiliary operator.
5. Sharp algebraic invariant inequality `0≤V/||X||⁴≤1/3` for `X≠0`; upper equality at equal three singular values, lower equality at rank ≤1. Algebraic proof is positivity and `Σ λ²≥(Σλ)²/3` for squared singular values.
6. Gauge-invariant 9×9 bilinear candidate `h=XXᵀ` has rank ≤3 identically, so it **cannot by itself** be a nondegenerate 9D metric in SU2. Explicit rank3 fixture: 3×3 leading minor 1, 4×4 leading minor 0; `I_9+h` rank9 only **by adding a background Euclidean metric**. Not a no-go theorem for all possible emergent metrics or tensor-valued observables.
7. Exact constant-positive-curvature sphere checks `χ(S²)=χ(S⁴)=χ(S⁶)=χ(S⁸)=2` from normalized `L_{D/2}`. For quartic `L4`, scaling sphere radius from 1 to 2 multiplies integrated density by **1** at `D=8` (critical Euler/topological), versus **2** at `D=9` (noncritical). Only constant-curvature examples tested, not classification of arbitrary metrics.
8. Independent `SO(9)×SU(2)` singular-value Jacobian dimensional control: `J(s)` has homogeneous degree `18+6=24`; with `d³s` total degree 27. Exact `s=(7,4,2)`, `t=3`: `J(3s)/J(s)=3^24`; including `d³s`, `3^27`, matching original 27 bosonic coordinate count.

## Scientific interpretation and future use

- **Near-valley countercontrol** should accompany any future candidate coercivity inequality, norm estimate or localization proof, including the regulated `Sε` charge: specify domain, source fermionic contribution, physical SU2 and Spin(9) sectors, asymptotic regime and positive/negative controls. The bosonic potential-only result cannot be promoted to a claim about the closed Hamiltonian, auxiliary spectral gap or existence of physical eigenstates.
- **Lovelock applicability gap** remains: BFSS nine transverse matrix labels are not a nine-dimensional metric, and `Spin(9)`/SU2 symmetry is not diffeomorphism invariance. A genuine metric, Levi-Civita connection, curvature, local action and divergence identity must be constructed before a Lovelock gravitational classification transfers.
- **Possible future bounded mathematical gate:** rederive the exact Gram invariant and `1/3` ratio bound in Lean on source `Boson 2`, matching all original SU2 matrix-generator normalizations first; keep separate from the strict weighted-domain proof and from emergent-gravity interpretations.
- **Versioning:** This is an exploratory evidence memo, no source/consumer/CI/checkpoint modification. Parent methodology notes on [Lovelock](../theory-bridges/BFSS_LOVELOCK_THEOREM_CLASSIFICATION_AND_EMERGENT_GEOMETRY_2026_11_14.md) remain the theory context.
