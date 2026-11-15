# G15 next-stage forward research — source four-plane gamma trace contraction

**2026-11-15; PROSPECTIVE / NOT LEAN-QUALIFIED.** G15 R4 strict [#43763173942](https://github.com/etblink/math/actions/runs/43763173942) is in progress at exact tested `4d45f9c3bd1b3b2e94c7d23e2576a8fb87a65166`. G14 remains last qualified full gate. Do not promote the present calculation to verified physical Hardy or even a new Lean theorem until exact source and consumer pass.

## Source-exact target (1-based physics indices)

The [source G2 originalHardyY](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG2OriginalPlaneCoefficientTrace.lean) uses original real symmetric nine gamma matrices and the literal coefficients
```text
Y_a^{ij} = (X_ai Γ_j - X_aj Γ_i)/16
           + (1/56) ∑_{k≠i,j} X_ak Γ_k Γ_i Γ_j .
```
Take four disjoint ordered planes `(1,2),(3,4),(5,6),(7,8)`, leave axis 9. Let `A_a = Σ_planes Y_a^{ij}`. Conditional on source gamma/trace orthogonality as described below, the predicted exact **finite real coefficient identity** is
```text
Σ_{α,β} (A_a)_{αβ}²
   = (61/784) * Σ_{i=1}^8 X_ai²
     + (16/784) * X_a9² .
```
Consequently, consuming the G15 original Fock norm reduction (once qualified),
```text
Σ_α ‖(Σ_planes τ_α^{ij}(X)) v‖²
   = [ (61 R² - 45 Σ_a X_a9²)/1568 ] * ‖v‖²
R² = Σ_{a,i=1}^9 X_ai² .
```
This matches the normalization and anisotropic term of Appendix B.8 in Michel–Scheinpflug–Yin, arXiv:2611.09837v1 (November 6, 2026), but is currently **an algebraic derivation proposal, not a checked source theorem**. The source uses zero-based `SpaceIndex` `Fin 9`; convert the four-plane pair map to literal source indices 0..7, leaving `Fin 8` as the ninth axis. Check signs and binder ordering in a literal consumer.

## Compact coefficient derivation

Use Frobenius pairing `⟨U,V⟩_F = tr(UᵀV)`; for the nine source real symmetric Clifford gamma matrices, `‖Γ_i‖_F²=16`. Every three-distinct-index gamma word `Γ_k Γ_i Γ_j` is skew-symmetric with Frobenius norm squared 16, orthogonal to all single gamma matrices. Different unordered triple-index sets are orthogonal if the even-length residual Clifford product (length 2, 4, or 6) has trace zero. The length-six trace case must be supplied as an exact source lemma: conjugate by an included gamma generator to reverse the sign of a distinct six-word; cyclicity forces trace zero. Do not pretend existing trace-word lemmas already cover length six without inspection.

For the four disjoint planes, each of axes 1..8 occurs once in a single-gamma component (coefficient magnitude `1/16`) and in three distinct three-gamma components (each `1/56`). The ninth axis occurs in zero single-gamma and four triple-gamma components. Thus the Frobenius norm-squared coefficient per axis is
```text
axes 1..8: 16*(1/16)^2 + 3*16*(1/56)^2 = 61/784;
axis 9:    4*16*(1/56)^2                   = 16/784.
```
G15's literal CAR factor `1/2` converts this to `61/1568` and `16/1568` in the action norm. Pure arithmetic independently checks `(61-16)/1568 = 45/1568`.

## Economical candidate gate after R4 full qualification

1. Prove exact orthogonality of source gamma **single words and the 28 triple words** from the four fixed planes, including six-distinct-index trace zero, on the original `GammaMatrix`. Keep this as a small mathematics-facing proof layer; no fresh alternate gamma representation.
2. Prove finite coefficient counting independently: each axis 1..8 contributes one single and three triple monomials; axis 9 contributes four triple monomials. Use `Fin 9` and `Fin 4` typed incidence counts with source literal indexing.
3. Bridge the resulting scalar Frobenius identity to the actual `originalHardyY pairedAlgebraData` and G15 four-plane norm theorem, retaining all cross terms until orthogonality has been proved.
4. Independent native consumer: unit coordinate at an axis in 1..8 gives predicted `61/1568`, ninth-axis unit coordinate gives `16/1568`, and a two-axis vector checks vanishing mixed coefficient. Negative controls: change `1/56`, drop a plane, swap gamma order without sign correction, or break the distinctness hypothesis.
5. Strict axiom/pin/source report and cold consumer gate as usual. Avoid full physical sector or spectral imports.

The broad pointwise inequalities `R²/98 ≤ (61 R² - 45 Σ_a X_a9²)/1568 ≤ 61 R²/1568` follow algebraically if the exact identity qualifies, but the **sharp Spin(9) spinor Hardy bound requires the retained anisotropic expectation and physical representation assumptions**. Do not replace a representation-theoretic averaged identity by a whole-sector scalar bound. Energy/domain, covariance, self-adjointness, spectral resolvent and fidelity remain separate.

## Explicit stop line

If native gamma traces, CAR normalization or plane enumeration disagree, preserve a red counterexample and correct the derivation before broadening the gate. G15 R4 must finish and be independently accepted before this is promoted. This memo records prospective research only, and no Lean/CI for this new coefficient formula has been run.
