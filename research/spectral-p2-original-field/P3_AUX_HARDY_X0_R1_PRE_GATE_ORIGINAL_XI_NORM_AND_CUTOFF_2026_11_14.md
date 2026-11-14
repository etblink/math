# HARDY-X0 R1 prospective gate — original Xi norm and actual cutoff coupling

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT LEAN QUALIFIED.
Reviewed existing source ref e406851deadc1d5b90ed2f609232d75ebb9e162e.
CERT-P0 #43621045697 accepted/checkpointed at ee82be1c4e4a161a49abf11222e56c2f7de43331 before new proof work.

## 1. Observation and source readiness

The [existing Hardy B1 primitive map](P3_AUX_HARDY_B1_SOURCE_ALGEBRA_PRIMITIVE_MAP_2026_11_13.md) separated group-independent coefficient algebra from the unresolved physical spinor-sector theorem. Fresh source review found that CliffordSymbols.lean already provides a stronger direct donor for the Xi part than rebuilding finite CAR sums.

On the unchanged original M : AlgebraData 2, define
\[
 \Xi_\alpha^M(X)=M.\mathrm{principalSymbol}(\mathrm{Pi.single}\ \alpha\ 1)(X).
\]
Existing principalSymbol_basis_apply identifies its action with the literal source
\[
 \Xi_\alpha(X)v=\sum_{i,A,\beta}
   (\gamma_i{}_{\alpha\beta}X_{iA}:\mathbb C)\,\theta_\beta^A v.
\]
The unit-spin-row principal-symbol norm gives
\[
 \|\Xi_\alpha(X)v\|^2=\tfrac12\|X\|^2\|v\|^2,\qquad
 \sum_{\alpha=1}^{16}\|\Xi_\alpha(X)v\|^2=8\|X\|^2\|v\|^2.
\]
The same existing symbol is the actual derivative coefficient in charge_realCutoff on original SmoothCore 2. This is a concrete algebraic input to Hardy analysis, not merely a conditional Cauchy–Schwarz wrapper.

External calibration only: Michel–Scheinpflug–Yin, arXiv:2611.09837v1 Appendix B (B.8) uses sum Xi_alpha squared =8 R squared. Its formula was inspected at https://arxiv.org/html/2611.09837v1. The gate proves the stated native norm/action/cutoff identities, not a cross-publication unitary equivalence or the full B.8 tau identity.

## 2. Exact donor disposition and coverage

| Source | Exact pin | Use |
| --- | --- | --- |
| Core.lean | 9882359ced78b0a3bd7e2f057974bd0a031b3e60 | Actual Boson 2, Fermion 2, SmoothCore 2, gamma/theta and theta_CAR normalization |
| CliffordSymbols.lean | cc01379653404c4ede3d551fd8d823e079543b21 | DIRECT REUSE principalSymbol basis action, unit/general norm, cliffordLinear norm and charge_realCutoff |
| Original G4J | e20c76fb22bc09d16dbcd8657333227cb34ed1ea | Literal pairedAlgebraData native consumer |
| Earlier Hardy primitive map | dca7e43a8005d449e199cb02050afd6e108d22ad | Existing research plan; refine Xi primitive to exact source reuse |
| DeformedCharge.averaged_core_energy | source inspected | Separately remains an averaged identity, not individual closed Q_alpha squared =H |
| TD-C1A/Spin9 physical joins | preserved diagnostic history, source status unchanged | DEFERRED; no such premise is used by the selected finite/core algebra |

Coverage: live roadmap/state, original Core/DeformedCharge/CliffordSymbols source, both prior Hardy/weighted-source memos, current spectral and top-down research inventories, all 498 OperatorDependencies filenames for likely Clifford/kinetic donors, and the paper's Appendix B. Not an exhaustive historical branch census. Some generic donors are source-present with historical strict provenance not separately adjudicated here: the new cold source/independent actual consumer explicitly re-audits the relevant named roots at current frozen bytes.

## 3. Fixed smallest source contract

Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyX0OriginalXiNormAndCutoff.lean
Namespace: FCP.BFSSP3AuxHardyX0OriginalXiNormAndCutoff
Import only OAI.MathematicalPhysics.BFSS.CliffordSymbols.
Five named roots in order:
- originalHardyXi
- originalHardyXi_apply
- originalHardyXi_norm_sq
- originalHardyXi_sum_norm_sq
- originalHardyXi_charge_realCutoff

- Definition uses the existing original principalSymbol, not a new Clifford/Fock realization.
- Exact source gamma/theta/coordinate expansion; retain source row/column order.
- Per-row norm square with coefficient 1/2.
- All-sixteen norm sum with coefficient 8.
- Exact existing original charge-realCutoff identity rewritten using this Xi, including -i phase and cutoffGradient.

Use the unit Pi.single row proof and finite cardinality 16, not an operator/Fock table expansion. All current donors and existing source bytes remain frozen.

## 4. Falsifiers, controls and strict acceptance

Independent consumer: lean/diagnostics/BFSSP3AuxHardyX0OriginalXiNormAndCutoffIndependentConsumer.lean
Strict workflow: .github/workflows/bfss-p3-aux-hardy-x0-original-xi-norm-cutoff-strict.yml
Consumer imports candidate plus original G4J; exercise all five roots with actual pairedAlgebraData, Boson 2/Fermion 2/SmoothCore 2 and literal FullL2 anchor.
Controls: Xi at X=0 is zero, via existing principalSymbolLinear; for nonzero actual X and v the norm sum cannot equal the incorrect doubled coefficient 16. These are exact universally quantified Lean controls, not numerical samples or a separate Python mathematical experiment.
Print five new plus five donor roots (cliffordLinear_norm_sq, principalSymbol_norm_sq/unit_norm_sq, principalSymbol_basis_apply, charge_realCutoff).

Freeze all existing transitive OAI imports to reviewed e406851deadc1d5b90ed2f609232d75ebb9e162e; explicit Core/G4J/CliffordSymbols hashes. Only new source and consumer may differ; measure actual closure count in CI.
Pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Cold OAI candidate plus G4J prerequisite, fresh warning-as-error source and complete independent consumer; exact five/ten report order, standard axioms only; retain existing budgets/package-notice allowlist and evidence capture.

Wrong theta_CAR factor, source gamma orientation, phase, principal-symbol/domain substitution, factor 16, removed origin/nonzero control, or failed native source/consumer/warning/axiom audit blocks qualification. Source-present is not source-qualified until this audit passes.
Compiler red is RED_UNQUALIFIED, not mathematical falsification; preserve first causal layer and after two related reds isolate a typed minimal interface.

## 5. Stop line and scientific payoff

GREEN qualifies only the original Xi coefficient norm, literal source action and its existing smooth-core cutoff role. It does not qualify tau/Ypsilon algebra, full supercharge square or anticommutator, source physical Spin(9), highest-weight/isotypic restriction, anisotropic expectation, Hardy inequality, closed-domain extension, fidelity certificate, zero mode or gap.

The native norm identity is ready independently of these physical-sector obligations and feeds their future Cauchy–Schwarz estimate. The gamma-trace/tau and symmetry steps keep their separate proof contracts. Do not substitute the original averaged 16-charge form for an unproved individual Q_alpha spectral identity.

Commit this prospective receipt before the first new source/consumer.

## Exact launch binding — 2026-11-14 Pacific

Source review/preregistration committed at `aa30430d1f95df181f0c3c2b4052daab90731883` before candidate source/consumer. [Strict #43623576828](https://github.com/etblink/math/actions/runs/43623576828) tests exact `47e36232762e707d3b72ccb1dacbe9ca2c4f0fb5`, job #132534392755. Source `a84f1413524f894b364b1eb274f6d5edb47ad9f5`, consumer `1c81d54d3d14c13d0b4bcaddea0a8602d20e73b8`, workflow `b4a2b26f0a0fc53307ebddac8dad812892ea96f5`. Checkout/preflight pending at binding; administrative #43623576778 separate. **UNQUALIFIED pending complete native source/consumer and exact five/ten reports.**
