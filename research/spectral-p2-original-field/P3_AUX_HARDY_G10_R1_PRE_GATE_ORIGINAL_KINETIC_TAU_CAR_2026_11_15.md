# HARDY-G10 R1 — original kinetic/tau orbital CAR contraction

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit before new proof code. Predecessor: G9 strict #43681465949, exact `e22dda02233c1e703cbb092e2ee705c3b169519a`.

## Bounded target and source binding

For the actual `M : AlgebraData 2`, define K_alpha,k,B as the existing complex `M.principalSymbol (Pi.single alpha 1)` evaluated at `EuclideanSpace.single (k,B) 1`. This is an alias of an original source object. Its action must equal the literal real `M.kineticSymbol alpha (k,B)` action, using `kineticSymbol_apply`. Do not introduce an independent Clifford representation.

For i != j and original X, prove

\[
 \sum_\alpha\{K_{\alpha,k,B},\tau^{ij}_\alpha(X)\}
 =\bigl(X_{iB}\delta_{kj}-X_{jB}\delta_{ki}\bigr)I.
\]

Use actual `cliffordLinear_mixed`, whose Majorana normalization is `{theta,theta}=delta`, and the accepted `originalHardyY_trace`. The same-index scalar coefficient must be related to the trace using the original gamma symmetry, with indices and transposes checked explicitly. No factor two is permitted.

This is the pointwise multiplier of the first-order derivative contribution. The full kinetic charge has the original factor `-Complex.I`, to be included during later core assembly. G10 does not contract the coefficient-derivative fermion term supplied by G9, apply a product rule to the whole kinetic expression, or identify a full rotation generator.

## Proposed files and six source roots

Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG10OriginalKineticTauCAR.lean`, namespace `FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR`.

1. `originalKineticFermion`: alias of the original complex principal symbol at the coordinate basis.
2. `originalKineticFermion_apply`: literal original kinetic-symbol action.
3. `originalKineticCoefficient_basis`: principal coefficients equal the color selector times the original gamma entry.
4. `originalKineticTauCoefficient_trace`: same-index CAR scalar pairing equals the accepted coordinate/trace expression.
5. `originalKineticTau_anticommutator`: pointwise complex Fock operator identity above.
6. `originalKineticTau_anticommutator_apply`: the exact vector-evaluation identity, using the accepted helper's congrArg/finite-evaluation proof pattern. The existing G5 helper is zero-only and cannot directly consume this nonzero scalar identity; do not claim that its statement provides a nonzero evaluation theorem.

Import accepted G9 and original Kinetic explicitly. Consumer: `lean/diagnostics/BFSSP3AuxHardyG10OriginalKineticTauCARIndependentConsumer.lean`, using the exact paired source and actual carriers. Require all six source roots and six independent donor reports: original kinetic-symbol action, principal-coefficient basis, mixed CAR, original Y trace, original tau action and G9 coefficient-derivative basis binding.

## Controls and acceptance

Twelve native examples: six exact interface controls, then coordinate-basis coefficient +1, coefficient -1, transverse zero, swapped-plane sign, origin zero and distinct-color zero. The +1/-1 controls independently reject an extra factor two or reversed orbital sign. Every control uses original paired gamma and Boson/Fock types.

Workflow: `.github/workflows/bfss-p3-aux-hardy-g10-original-kinetic-tau-car-strict.yml`. Freeze all existing source bytes to the accepted G9 baseline. Expected recursive closure count 163 follows from replacing the G9 consumer by the new source/consumer while retaining G9 as a donor; CI must independently recompute it. Retain pinned Lean4.34.1/Mathlib, cold build, warning-as-error, standard axioms only, early generic helper1 and matrix-entry helper3 audits, fresh source6/native12 reports, all twelve examples and a scope receipt excluding later conclusions. No resource increase.

## Falsifier and stop

A coefficient, sign, transpose, color-selector or source-carrier mismatch falsifies the proposed source binding at that boundary. Static checks are not Lean verification. Preserve the first causal failure and all reports. On a repeated native conversion boundary, stop full-gate retries and preregister an isolated typed comparison; on two analogous reds, review the architecture before another attempt. No unchanged retry, suppressed warning, copied gamma table, alternate Hamiltonian or stronger hypothesis replacing the actual source is permitted.

G9 remains accepted. Coefficient-derivative fermion contraction, actual smooth-core rotation assembly, tau norm, physical Spin(9)/singlet covariance, energy domains, Hardy, fidelity, zero modes and mass-gap conclusions remain outside this gate. The physical symmetry/energy-domain audit remains the highest forward-research priority.

Pre-implementation donor check: the zero-only scope of `finiteOperatorAnticommutator_apply` was inspected before new proof code. Root 6 must use the explicit evaluation pattern on the new nonzero operator identity. No helper source modification or extra hypothesis is authorized by this clarification.
