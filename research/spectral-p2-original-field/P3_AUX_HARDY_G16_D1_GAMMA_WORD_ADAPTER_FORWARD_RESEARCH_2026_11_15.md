# G16 D1 forward research — literal gamma-word Frobenius adapter

**November 15, 2026 | PROSPECTIVE, NOT LEAN-QUALIFIED, DO NOT STAGE D1 UNTIL D0 GREEN.** G15 accepted full strict [#43763173942](https://github.com/etblink/math/actions/runs/43763173942); D0 finite incidence [#43767310379](https://github.com/etblink/math/actions/runs/43767310379) launched against pinned G15. This memo is a proof architecture for *the next* stage, not a claim of new Lean verification.

## Native mathematical bridge

`lean/OAI/MathematicalPhysics/BFSS/Core.lean` pins `SpaceIndex = Fin 9`, `SpinIndex = Fin 16`, `GammaMatrix = Matrix SpinIndex SpinIndex ℝ`, and `AlgebraData.gamma_clifford/gamma_symmetric`. In `GammaWords.lean` (frozen blob `d12051e70de679f5458dbd456667a32c7b407ce4`), `word` uses a sorted `Finset SpaceIndex`; `reverseWord` uses its reversed list, and `trace_reverseWord_word` proves

```lean
Matrix.trace (OAI.BFSSGamma.reverseWord M.gamma s *
              OAI.BFSSGamma.word M.gamma t)
  = if s = t then 16 else 0
```

provided `s.card ≤ 4` and `t.card ≤ 4`. The equality is already a pinned source theorem, so *no new six-gamma trace proof is required*. Its direct Frobenius corollary on the **actual source gamma carrier** is

```lean
Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
              OAI.BFSSGamma.word M.gamma t)
  = if s = t then 16 else 0
```

via `OAI.BFSSGamma.list_transpose M.gamma (fun i => (M.gamma_symmetric i).eq)` on `s.sort (· ≤ ·)`. Test this first as a source-exact independent adapter: its inputs must be `M : AlgebraData 2` (or generic `N` with exact source type), not a rewritten gamma representation. Avoid a fresh `GammaIdentity` copy.

For literal G2 `originalHardyY`, the four fixed planes have **consecutive endpoints** `i=2t, j=2t+1`, `i<j` (`t:Fin4`, zero-based). Every eligible triple word `M.gamma k * M.gamma i * M.gamma j` has `k≠i,j`, which implies **`k<i` or `j<k`**: there is no spatial index strictly between consecutive integers. Therefore the ordered-to-sorted gamma-word sign is always **positive**:

```text
k<i<j  : gamma[k] gamma[i] gamma[j] = +word {k,i,j}, zero swaps
i<j<k  : gamma[k] gamma[i] gamma[j] = +word {i,j,k}, two swaps
```

No middle case `i<k<j` can occur. A fresh exhaustive Python parity check verified all 28 eligible `(t,k)` words: **12 with zero inversions, 16 with two, zero with odd parity**, and 28 unique triple-index supports. Prove the missing-middle-index dichotomy in Lean with integer inequalities / `omega`, and use `OAI.BFSSGamma.gamma_anti` exactly twice for the `k>j` branch. This removes all `-word` branches from the source adapter; do not accidentally apply the simplification to arbitrary nonconsecutive planes.

A singleton support has cardinality 1 and cannot coincide with a triple support of cardinality 3. Among eligible `(t,k)` there are precisely 28 **distinct** triple supports `{i_t,j_t,k}`; independent enumeration is a falsifiable control, not a Lean theorem. The exact native uniqueness proof is still required before promotion.

Thus for each fixed original color (A), the coefficient of each original spatial coordinate (X(k,A)) in the four-plane sum has one singleton word when (k<8), zero when (k=8), plus three triple words when (k<8), four when (k=8). The word-norm is exactly 16, giving

```text
Σ_{α,β} (Σ_{t:Fin4} originalHardyY M i_t j_t X A α β)^2
  = (61/784) Σ_{k=0}^7 X(k,A)^2 + (16/784) X(8,A)^2.
```

This is a **proposed theorem on literal original gamma/source data**, conditional on the pending ordered-word sign/uniqueness bridge. By G15 accepted CAR factor 1/2, the proposed Fock action identity after all colors and charges becomes `(61 R² − 45 Σ_A X(8,A)²)/1568 * ‖v‖²`. A formula matching Appendix B's coefficients in Michel–Scheinpflug–Yin, arXiv:2611.09837v1, is external analytical guidance, not an accepted Lean proof.

## Exact explicit-matrix cross-check — independent but not universal

A deterministic [Python source control](diagnostics/G16_EXACT_OCTONION_GAMMA_MATRIX_CONTROL_2026_11_15.py) constructs a real 16×16 symmetric gamma system via Cayley–Dickson octonion left multiplication, checks all **81** Clifford relation pairs exactly in signed integer arithmetic, then evaluates the literal G2 four-plane formula with denominators 16 and 56 at **nine unit vectors and 64 seeded integer vectors**. Clearing the denominator 112 gives

```text
Σ_{αβ} [112 Σ_t Y^{i_t j_t}(X)_{αβ}]²
  = 16 * (61 Σ_{k=0}^7 X_k² + 16 X_8²).
```

All 73 cases passed without floating-point rounding; the first unit axis gives 976 and the unpaired ninth axis gives 256. The original JSON output from that run was SHA256 `a3d5729c777c351d3666bafab3b96364bd25d7b9dcb35180caa2f1c7a59dd6ff`. This confirms the proposed identity in **one explicit faithful gamma representation**, not the actual repository basis or the universal `AlgebraData 2` theorem. Do not use the test as a substitute for source typed sign/trace adapters, full Lean axiom audit, or physical Spin(9)/domain proofs.

## Minimal falsifiable D1 gate design

1. Source-only gamma Frobenius word pairing, with exact `AlgebraData.gamma_clifford`, `gamma_symmetric`, cardinality ≤4; native independent consumer specializes `pairedAlgebraData` and tests same support, different singleton supports and single/triple support.
2. Separate finite index lemma: prove triple-support uniqueness (`(t,k)` eligible pair uniquely determines `{k,2t,2t+1}`) and literal parity/sign map. Independent controls swap one plane's endpoints and verify the expected sign reverses; a wrong `k=i` case must be rejected.
3. Orthogonal-sum squared norm via `Matrix.trace` and `Matrix.trace_transpose_mul`, without exploding 36×36 proof by `simp_rw`. Pair inner products by support, then count terms using D0. Register an independent native `originalHardyY` basis-coordinate control for axes0 and8 and a two-coordinate mixed test.
4. Full G16 bridge only **after** independent D0/D1 acceptance: consume the unchanged G15 4-plane norm root to obtain the exact source (61/1568) and (16/1568) coefficients. New gate 170+ pinned dependencies, fresh strict CI, independent axiom reports and complete archive review.

Negative stop: a convention difference in triple ordering, `GammaMatrix` transpose, CAR half, or the ninth-axis multiplicity invalidates the proposed target and must trigger a red scope review, *not* a silent sign/normalization rewrite.

## Scientific stop line

Even the accepted numerical coefficient identity would be a pointwise finite Fock-operator theorem, **not** the Spin(9)-spinor-sector Hardy inequality. The physical representation, Gauss law, equal-charge Hamiltonian form/domain, sector averaging, Hardy/resolvent and fidelity trial-state construction remain independent open obligations. Do not infer a global BFSS energy/mass gap from the auxiliary ground-state method.
