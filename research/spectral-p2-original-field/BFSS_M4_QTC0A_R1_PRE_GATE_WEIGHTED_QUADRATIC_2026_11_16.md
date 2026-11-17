# BFSS P3-M4-QTC0A R1 — bounded original Fock quadratic Leibniz pre-gate

Date 2026-11-16 Pacific. Single unified branch `integration/bfss-unified-research-20261108`. **PENDING STRICT CI, NOT QUALIFIED.**

## Evergreen source discipline

This gate follows [Project Lead evergreen reuse ledger](../../contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md): exact pinned source types, reuse previously GREEN LB1L2 (do not rewrite noncommutative Leibniz), one mathematical atom per cold gate, distinct independently importing consumer, standard-only `#print axioms`, preserve all original REDs, and never promote from generic algebra to original physical symmetry by analogy.

The latest qualified mathematical gate is **P1 R2 #43998813826**, actual original normalized four-Majorana commutator on `Fermion 2`, with complete original source + consumer and archive separately rehashed by #44000111416. Its original positive evidence and P1 R1 source-name syntax RED remain preserved. The stopped CT1-G0 R1/R2 original native K(A) elaboration REDs and their complete evidence remain immutable.

## Frozen new QTC0A theorem contract

On genuine `Op := Fermion 2 →L[ℂ] Fermion 2` and generic finite index `ι`, with arbitrary `a,b : ι → ι → ℂ`, assume **explicitly**

```text
hcov(k): T*x_k - x_k*T = ∑_p a[p,k] • x_p.
```

Define `Q_x(b) := (1/4:ℂ) • ∑_i ∑_j b[i,j] • (x_i*x_j)`. Prove exactly TWO public source roots:

1. `originalFock_commutator_complex_smul`: `[T,c•X]=c•[T,X]`, complex central scalar on the actual original Fock operator algebra.
2. `originalFock_quadratic_covariance_expanded`: `[T,Q_x(b)] = (1/4) • ∑_{i,j}b[i,j]•((∑_p a[p,i]•x_p)*x_j + x_i*(∑_p a[p,j]•x_p))`.

Private finite-sum lemmas use `Finset.mul_sum`, `Finset.sum_mul`, `Finset.sum_sub_distrib`, then **qualified LB1L2** `originalFock_product_covariance_from_two_hypotheses` for each term. No CAR needed, no fake commutation of Fock operators, no generic source spin lift, no explicit original K(A) expansion. The source definition's `1/4` remains complex in this *generic math* gate; real-source normalization, matrix coefficient contraction, full original `K` bracket and physical Hamiltonian claims are separate.

This is deliberately smaller than the full conceptual [QTC contract](BFSS_M4_QUADRATIC_TENSOR_COVARIANCE_DIRECT_K_LIE_BRACKET_FORWARD_RESEARCH_2026_11_16.md). **QTC0B** must prove exact `[T,Q_x(b)]=Q_x(a*b+b*a.transpose)` by reindexing the two triple sums, plus skew reduction and adversarial non-skew 2×2 coefficient case, before **QTC1** original real/complex scalar bridge and **QTC2** source-exact gamma/K bind. The P2 all-index sparse-plane route remains fallback.

## Strict pins and controls

| Role | Path | Git blob |
|---|---|---|
| QTC0A source | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4QTC0AOriginalFockWeightedQuadraticCovariance.lean` | `b0b519e46566856e100bf6aa882f9fcdf37d397e` |
| Independent consumer | `lean/diagnostics/BFSSP3M4QTC0AOriginalFockWeightedQuadraticIndependentConsumer.lean` | `9d1dc845bea73d8e07549c69d9ef07804509f52e` |
| Strict workflow | `.github/workflows/bfss-m4-qtc0a-original-fock-quadratic-strict.yml` | `f765eab05612b9f4ea0ec94ec8f981fe19b130d2` |
| Accepted LB1L2 donor | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1L2AbstractOriginalFockCovarianceLeibniz.lean` | `b4012951a26aa7573db513adab3d7ce27396db7e` |
| Accepted LB1C1 source covariance | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean` | `c2e7a7c665121283cde13ae5dabc183362b6b420` |
| Accepted P1 four-Majorana source | `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P1OriginalFourMajoranaCommutator.lean` | `9a2899e24c02cb5a5dd58159605a34195fce3856` |
| Evergreen Project Lead ledger | `contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md` | `4a8604acb431247694eb0a34bef1086a66e27af7` |

The workflow pins eleven files in total including LB1C0, LB1S, LB0 and exact `lean/lean-toolchain` (Lean 4.34.1), `lean/lake-manifest.json` (Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`). Independent consumer repeats both public theorem statements and adds 4 explicitly finite-index controls for `Fin 0, Fin 1, Fin 2, Fin 3` (empty, repeated, arbitrary nonskew capable, larger index). These are imported source exact theorem checks, not separate Clifford evaluations.

Acceptance requires exact donor/consumer/source bytes and preserved P1 original ZIP plus CT1 stop history, cold mathematical source within 1100 sec, separate warning-as-error source+consumer under 360 sec each, 2+2 standard-only `propext`, `Classical.choice`, `Quot.sound` axiom reports, four consumer controls, positive and six negative strict auditor checks, and complete original provider artifact preservation even on failure.

**Stopping/claim discipline:** A RED is evidence and requires exact first causal error and original ZIP/log archive before further edits. Two analogous source-binding recursion failures stop the route. Do not increase Lean resource bounds, alter accepted donors or treat clean generic CI as physical QTC1/QTC2 proof. No QTC0B proof workflow staged. `main` untouched.
