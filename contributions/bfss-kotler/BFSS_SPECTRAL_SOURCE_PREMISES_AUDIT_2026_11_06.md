# BFSS physical source-premise audit — 2026-11-06

**Status: source inventory, exact finite polynomial diagnostics, and next-gate decision; zero new Lean-qualified roots.**
Exploratory parent: `d4dea721fbc4ff7a8d49ae823fe025c299fd5782`.
The six qualified compactness-analysis interfaces remain unchanged. This
record does not import the separate operator package, reopen an upstream
PR, construct a physical Spin(9) action, or admit confinement/eigenpairs.

## Lead finding and decision

The next question is source binding, not another compactness wrapper.
The original source already has `AlgebraData.averaged_core_energy` for its
deformed charges. A separate, pinned operator snapshot also contains the
complete massless multiplier/charge/core-form crosswalk. Reproving that
crosswalk from scratch would discard useful work. Recover and requalify the
small source-generic chain on this exploratory branch, then compose the
original energy identity at `(h,m)=(1,0)` with the actual `Core.coreForm`.

The accompanying diagnostic now reconstructs the fermionic remainder from
the **original source definitions**, rather than starting at the paper's
pre-contracted remainder. Its exhaustive finite coefficient checks support
the earlier normalization but are not a Lean translation or operator-norm
proof. The full P2 confinement premise is therefore not discharged.

The [evergreen guide](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md)
was reread at unchanged blob `f5b53f680e7b3c119491be01306a33d83586bd9a`.
Its structure/specialization/discharge/composition distinction governs this
decision. No routine gate outcome was added to that guide.

## 1. The source premises are composite obligations

| Slice | Existing source evidence | Remaining obligation on this branch |
|---|---|---|
| P1: physical Spin(9) action | Accepted geometry includes the source group and native 16-real representation/differentiability interfaces. The earlier D audit rejects the scalar-central Clifford shortcut. | Construct/bind the actual full Fock action, its gauge compatibility, covariance and correctly normalized stabilizer weights. Geometry alone is insufficient. |
| P2a: actual massless charge | Separate G4-K9A–D source chain declares multiplier equality and `deformedCoreCharge 1 0 = charge`, without an extra potential-agreement premise in K9D. | Recover and independently requalify the minimal source-generic chain here; preserve every coefficient, transpose, ordered sum and parameter. |
| P2b: normalized core energy | Original `DeformedCharge.averaged_core_energy` is present in the original modules cold-compiled by the accepted gates. | Compose P2a with this exact identity to obtain the literal `Core.coreForm` decomposition. Do not replace the left side by a differently defined charge norm. |
| P2c: SU(2) bosonic potential | `SU2ColorCrossProbe.deformedBosonicPotential_one_zero_eq_wedge` has an explicit normalized-Pauli color hypothesis. The separate paired model preserves its concrete color/gamma choices. | Bind the concrete instance and exact spatial/color minors. A generic conditional color hypothesis is not its own discharge. |
| P2d: fermionic remainder | The new direct source diagnostic exhausts the actual potential's quadratic coefficient monomials and the remainder's linear coefficient blocks; normalization agrees. | Formalize the original field's equality with the named skew-CAR quadratic expression, not just a paper formula or finite-array reconstruction. |
| P2e: sharp bound | A/B gives an analytical normalized-CAR derivation of `8√3‖X‖`, with exact Hilbert–Schmidt normalization. | A source-typed Lean operator-norm bound remains open. A crude growth constant is not the sharp constant. |
| P3a: actual normalized Hamiltonian | Separate D2B27 defines the source physical `H=(1/16)T†T` on its natural domain; D2B28 specializes to the literal paired gauge model and states self-adjointness/weak-form/domain results. | Reuse those interfaces with their actual provenance and domains when needed. Do not rebuild an unrelated Hamiltonian and call it the same operator. |
| P3b/c: coercive domain and sector | The weighted-closure compactness lane is now qualified; the separate physical operator source exists. | Prove the high-type physical form estimate, weighted-closure inclusion and sector reduction for that same Hamiltonian. Neither source presence nor our compactness results identifies these domains. |

Thus P2 and P3 should not be read as assertions that *no relevant source
work exists*. They are composite holds on the proposed confinement and
spectral argument. Several essential algebraic/operator interfaces already
exist in a separate snapshot; sharp bounds, global action and sector/domain
composition remain substantive obligations.

## 2. Snapshot and provenance boundaries

The separate reader snapshot is
[`etblink/math@fa00aa36e770ca516f57b41f5b02229a5033d50f`](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f),
the fixed contribution-branch head associated with PR #77. Its operator
dependencies are absent from this exploratory working tree. This audit
fetched Git objects for read-only inspection, without importing or checking
out those files, moving that branch, or touching the PR.

The [receipt](evidence/spectral-confinement-2026-11-06/source-premises-diagnostic-receipt.json)
pins ten local inputs and eleven separate-snapshot readers. It also checks
that all nine original BFSS/gamma/color source inputs have identical Git
blobs in both snapshots. The local A/B gamma reader is separately pinned.

Readers under `Contrib/Kotler/OperatorDependencies/` include:

- `SU2BFSSG4K9ASourceChargeCoefficientCrosswalkProbe.lean`: negative
  massless matrix and the beta-alpha column/pair-skew sign cancellation.
- `SU2BFSSG4K9BSourcePairAndChargeReductionProbe.lean`: pair notation
  crosswalk and explicitly conditional charge/form reductions.
- `SU2BFSSG4K9COrderedPairCoefficientProbe.lean`: symmetric zero-diagonal
  half-ordered sum, with both original factors antisymmetric.
- `SU2BFSSG4K9DSourcePotentialMultiplierProbe.lean`: actual six-sum
  regrouping, `sourcePotentialMultipliers_equal`,
  `sourceUnconditionalCoreCharge_equal`, `sourceUnconditionalCoreForm_equal`.
- `SU2BFSSFullAlgebraDataProbe.lean` and `SU2BFSSG1APairedThetaProbe.lean`:
  concrete color/gamma selection and the literal paired-theta substitution.
- `SU2BFSSG4JExactGaugeDataAssemblyProbe.lean`, physical D1, D2B27 and D2B28:
  literal gauge data, restricted graph, normalized operator and weak form.

The eleventh reader is `Contrib/Kotler/CLAIMS.md`. It explicitly separates
historical source checks from combined-package acceptance and preserves
the premises of the operator/eigenpair transport results. Historical
qualification artifacts for this separate package were **not re-audited in
this task**. Prospective headers are not current-state certificates, and a
source declaration or proof body is not fresh acceptance on this branch.

## 3. Direct reconstruction of the original fermionic field

Write `X[a,i]=x_i^a`. Let `g_i` be the actual nine integer gamma matrices
and use the actual normalized-Pauli convention `f_cbd=√2 ε_cbd`.
Define the source massless matrix with its `√2` removed:

\[
 P_c(X)=-\sum_{j<k}\Big(\sum_{b,d}\epsilon_{cbd}X_{bj}X_{dk}\Big)g_jg_k.
\]

`PotentialBasis.deformedPotentialCoefficients` uses its **beta-alpha
column**, so the source potential field is
`V_α=√2∑_(δ,c) (P_c)_(δ,α) θ_δ^c`.
`DeformedCharge.kineticSkewSymbol` supplies
`A_(α,i,a)=-i∑_β(g_i)_(α,β)θ_β^a`.
`MixedEnergy.remainderField` is the ordered product
`∑_(α,i,a) A_(α,i,a) ∂_(i,a)V_α`, and the original
`deformedFermionField` multiplies this by `1/16`.

For `p=(β,a)`, `q=(δ,c)`, the resulting integer coefficient is

\[
 H_{pq}(X)=\sum_{\alpha,i}(g_i)_{\alpha\beta}
                   \partial_{ia}(P_c(X))_{\delta\alpha}.
\]

The script derives the homogeneous quadratic coefficients of every `P_c`
from the strict-pair source expression. It compares all 378 coordinate
monomials with the half-weighted original ordered-charge expression:
1,134 exact color/matrix equalities. It then differentiates that coefficient
table and contracts the original kinetic gamma indices, obtaining

\[
 H=-8K_0,\qquad
 (K_0)_{(\beta,a),(\delta,c)}
   =\sum_{d,\ell}\epsilon_{dac}X_{d\ell}(g_\ell)_{\beta\delta}.
\]

All 27 linear-coordinate matrices, equivalently 243 ordered spin/color
blocks, agree exactly. Restoring the **original** prefactors gives

\[
 \frac{-i\sqrt2}{16}H=\frac{i\sqrt2}{2}K_0,
 \qquad B=\frac i2\sum_{p,q}K_{pq}\theta_p\theta_q,
 \quad K=\sqrt2K_0.
\]

The exact 729-entry basis Gram check gives `‖K‖_HS²=64‖X‖²`, matching A/B.
The output preserves the ordered theta labels; it allocates no full Fock
matrix and assumes no global Spin implementer. It reuses only the pinned
literal gamma parser, not A/B's paper-remainder contraction routine.

Controls reject omission of the negative massless-matrix sign, substitution
of a row for the source column, omission of the ordered-pair half factor,
and doubling of the `1/16` scaling. These are four mistakes in two sign/
factor-two error classes. A sign error could preserve an operator norm;
norm-only experiments cannot establish this exact energy identity.

**Evidence limit.** This is an exhaustive finite coefficient check for the
pinned gamma/Pauli convention and a reviewed source reconstruction. The
script is not a Lean interpreter or theorem about Fréchet derivatives of
the actual operator-valued field. It does not prove the formal operator
norm bound, source-action covariance, physical domains, or eigenpairs.

## 4. Selected next formal milestone

Recover the minimal existing K9A–D proof chain with explicit import/source
mapping; discard only unrelated chronological dependencies, not hypotheses
or proof obligations. Require an exact diff, fresh strict compilation and
independent consumers. Do not import the entire operator package merely
to use these source-generic identities. Preserve the original package.

Compose its massless charge equality with the original energy theorem to
qualify this exact full-space statement for arbitrary `M : AlgebraData N`
and `f : SmoothCore N`:

\[
\begin{aligned}
 M.\mathrm{coreForm}(f)
  &=\frac12\sum_{p=(i,a)}\|\mathrm{coreToL2}(\partial_{ia}f)\|^2\\
  &\quad+\int\Big(M.\mathrm{deformedBosonicPotential}(1,0,X)\|f(X)\|^2
    +\langle f(X),M.\mathrm{deformedFermionField}(1,0,X)f(X)\rangle_{\mathbb R}\Big)dX.
\end{aligned}
\]

The left side must be the original named `coreForm`, with no assumed
potential-agreement premise. The right side initially retains the literal
source fields. This is a source-generic equality, not existence/discharge
of a particular `AlgebraData`, the Pauli wedge identification, the sharp
fermionic bound, P1, or a closed physical operator theorem. Keep those
remaining tasks explicit instead of claiming all of P2 from this bridge.

Acceptance must independently consume actual charge equality, the
`1/16` charge-norm formula and the full core-energy expression. Stop on
sign/normalization mismatch; diagnose conversion/resource failures without
altering the original definitions or increasing budgets by default. Only
after this source binding is qualified should its finite-field contraction
and sharp-bound implementation be selected as the next P2 discharge.

## 5. Reproduction

If the immutable reader objects are absent in a fresh clone, fetch them
without changing branches, then run the offline diagnostic:

```sh
git fetch --depth=1 origin fa00aa36e770ca516f57b41f5b02229a5033d50f
python contributions/bfss-kotler/tools/audit_spectral_source_premises.py
```

The [script](tools/audit_spectral_source_premises.py) checks every source
pin and records its own SHA-256. Two runs produced byte-identical receipts.
No Lean source, accepted gate, original branch, upstream PR or guarded-cache
contract is changed by this audit.
