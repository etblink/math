# BFSS M4-CT0 — original-trace skew K(A) pre-gate contract

Date: 2026-11-16 Pacific. **Design only: NOT STAGED, NOT COMPILED, NOT QUALIFIED.** This is a source-shaped microgate derived from [the commutant/trace versus P1/Gauss decision](BFSS_M4_COMMUTANT_TRACE_P1_GAUSS_SOURCE_DECISION_2026_11_16.md) after inspection of original sources and **pinned Mathlib** at `d13f23b723b8a846827a245b89c10fc7d3f11612`. Keep all edits, if later authorized, on `integration/bfss-unified-research-20261108`.

## Purpose and precise ceiling

Discharge the trace-normalization part of the candidate commutant/trace proof *without* invoking a 48×48 native K commutator expansion. CT0 aims only at

```lean
-- On the literal original Op := Fermion 2 →L[ℂ] Fermion 2.
theorem originalFockTrace_mul_comm (X Y : Op) :
    originalFockTrace (X * Y) = originalFockTrace (Y * X)

theorem originalSource48BivectorK_skew_trace_zero
    (C : Matrix Source48Label Source48Label ℝ)
    (hC : C.transpose = -C) :
    originalFockTrace (originalSource48BivectorK C) = 0
```

Names are illustrative source-shaped targets. The actual native scope must fully qualify namespaces and reused definitions before freezing code.

CT0 **does not prove** `D(A,B)=0`, a central-commutant join, the full bivector bracket, physical Spin(9), or a spectral theorem. A RED may reflect a Lean conversion/instance mismatch rather than a mathematical counterexample.

## Exact accepted-source inputs

- **T1 actual original operator trace**: `T1OriginalFockTraceInvariance.lean` Git blob `3be6c9a6f2898484df66690f94fdfa1877660897`. The definition `originalFockTrace : Op →ₗ[ℂ] ℂ` is transported through `originalFockEndAlgEquiv : Module.End ℂ (Fermion 2) ≃ₐ[ℂ] Op`. *Group trace invariance alone is not cyclic trace; do not misuse it.*
- **LB1S literal original K**: `P3M4LB1SOriginalSource48SkewMatrixFockBivector.lean`, blob `d7d460fc8d2806234816e8bd2088f9cebb6addd4`. Preserve `K(C)=∑p∑q (C p q / 4 : ℝ) • (sourceNormalizedGamma p * sourceNormalizedGamma q)`; preserve real skew transpose convention and paired source labels.
- **Source real-to-complex scalar bridge**: `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul`, already used in qualified LB1C1 `c2e7a7c665121283cde13ae5dabc183362b6b420`. Pin the precise original donor blob before source staging.
- **Genuine gamma field**: `SU2BFSSSource48NormalizedFockGammaProbe.lean`, blob `7abc03723b3111e4a03389b722054e50d6a9bf30`.

**Pinned library APIs, directly source-inspected** (no inference from a newer Mathlib):

1. `Mathlib/LinearAlgebra/Trace.lean`, blob `aead033d4d6f66f283cd51f072c24a2f5b16a97e`: `LinearMap.trace_mul_comm` (near line 105), `LinearMap.trace_lie` (near line 132), and `LinearMap.trace_one` (near line 193).
2. For subsequent CT2 only: `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean`, blob `fbcf362039a1c89e3e3344372fc6f723435d003e`, `CliffordAlgebra.induction` (near line 197) and `CliffordAlgebra.hom_ext`; `CliffordAlgebra/Fold.lean`, blob `6f9d861cf30001ce2a922fb3be2daee23641ae5a`, `right_induction` and `left_induction`. These *are present*, but do not establish that the active-generator-to-all-Clifford bridge is already proved.

## Generic root before native source

For a finite type `ι` and functions `c : ι → ι → ℝ`, `f : ι → ι → ℂ`, assume
`∀ p q, c p q = -c q p` and `∀ p q, f p q = f q p`.
Target the independent, typed finite sum statement

```text
∑ p : ι, ∑ q : ι, ((c p q : ℂ) * f p q) = 0.
```

Proof: swap dummy summation indices, use skewness and symmetry to show the sum equals its own negative; char zero implies zero. This root has no Fock operator, Clifford, CAR or source matrix expansion. It requires no diagonal exclusion and handles coincident labels.

For the native root, set
`f p q := originalFockTrace (sourceNormalizedGamma p * sourceNormalizedGamma q)`.
Prove `f p q = f q p` by transporting `LinearMap.trace_mul_comm` across the *exact* `originalFockEndAlgEquiv`. Use complex linearity of `originalFockTrace` and the accepted real-to-complex operator scalar bridge to transport the immutable K double finite sum to the abstract root. `C/4` is still real skew; **do not** change the factor or replace the active gammas.

## Consumer and negative-control contract

After successful source-shaped statement review, freeze a *separately imported, independently compiled* consumer of both native roots. The consumer should restate cyclicity and `Tr K(C)=0` on the literal source carrier. Controls:

- zero skew matrix (including all diagonal terms);
- one elementary original skew plane `E(i,j)` and its reversed orientation, tested with distinct original paired labels;
- generic skew input, with no unjustified distinct-label assumptions.

Use explicit original source-to-consumer paths, full donor, consumer and workflow Git blob pins, cold pinned Lean 4.34.1/Mathlib build, warning-as-error, standard-only axiom reports (`propext`, `Classical.choice`, `Quot.sound`), and negative auditor controls. Retain unchanged accepted P0B/LB1C1/OP3A2/M3C sources and proof receipts. Preserve original artifacts, first causal RED and SHA-256 hashes before any bounded repair. Pause after two analogous native source-conversion failures; no extra heartbeats, increased memory/time budget, global scalar instances, new axioms or a second attempt with unchanged code. No concurrent expensive P1/Gauss strict gate.

## Explicit next decision

If CT0 can be source-bound and independently strict-qualified within one small gate, test CT1 (Jacobi gamma defect) next and audit CT2 (generator-commutant-to-original-M3C scalar). If CT0 repeats the same native finite-sum/scalar conversion failure as prior LB1L0, do not spend further CI resources on a full K(A) expansion: return to the existing P1 four-Majorana contract or prioritize the source Gauss contraction.

Current canonical checkpoint remains **P0B R3 GREEN #43962066769**. CT0 and P1 remain **PROSPECTIVE**. No change to the original physical fidelity assumptions, domains, G16/Hardy, spectral or unification claim ceilings.
