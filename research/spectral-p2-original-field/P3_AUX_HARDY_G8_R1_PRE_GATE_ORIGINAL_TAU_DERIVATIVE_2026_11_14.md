# P3-AUX-HARDY-G8 R1 — prospective original tau derivative gate

Status: REGISTERED_NOT_EXECUTED / source not staged. This contract precedes candidate code.

Accepted predecessor: [G7 #43670114014](https://github.com/etblink/math/actions/runs/43670114014), tested `b46d2246c05c43e866b9c4c0b405eb133093ae40`; acceptance checkpoint committed at `ed88ce156b69fc3f8bac552ff57740709acc7764` before this next gate. G7 source stays `d7320101971790d7fe56bfda1b011ae3e5d1b9d9`.

## Observation and recovered reuse

Original CliffordSymbols already proves coordinateDerivative_multiplier for arbitrary smooth complex scalar fields and actual SmoothCore. Original Core proves fermionAction_derivative_commute. Combine these in an early helper importing only CliffordSymbols, with AlgebraData2 variable; it must not import native paired data, theta construction or tau. This avoids duplicating the existing product-rule proof. G3's Y derivative/contraction is accepted but contracting the resulting finite CAR expression is a later obligation.

## Prospective exact identity

For original M, original tau T, coordinate derivative D along (k,B), original core state f and point X, prove D(Tf)(X)=T(Df)(X)+T_deriv(X)(f(X)). Define T_deriv only as the finite sum over (A,beta) of the literal real-Frechet derivative of the complex original Y entry in direction EuclideanSpace.single(k,B)1, multiplied by original theta(beta,A). No coefficient normalization, source action or tensor index changes. Derive the subtraction identity and its vanishing when f(X)=0. All plane labels are allowed; impose no unproved diagonal-plane vanishing.

Source roots proposed: `originalHardyTauCoefficientDerivative`, `originalHardyTauDerivative`, `originalHardyTauDerivative_apply`, `originalHardyTauCore_coordinateDerivative_apply`, `originalHardyTauCore_derivative_commutator_apply`, `originalHardyTauCore_derivative_commutator_zero_at`. Early helper has one audited theorem; fresh source has six roots; independent native consumer has those six plus six donors and twelve examples. Pin full original OAI import closure. Only propext, Classical.choice and Quot.sound allowed. Exact donor declarations:

- `OAI.BFSSQuantum.AlgebraData.coordinateDerivative_multiplier`
- `OAI.BFSSQuantum.AlgebraData.fermionAction_derivative_commute`
- `FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyY_entry_contDiff`
- `FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore`
- `FCP.BFSSP3AuxHardyG7OriginalTauSmoothCore.originalHardyTauCore_apply`
- `FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply`

## Fixed controls and procedure

Keep all accepted sources, Lean4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` and strict audit policy. Build and fresh-check the product-rule helper before native paired data; fresh check500s, early stage20min, native build3600s. Then remove OAI build objects, rebuild source/helper and literal paired assembly, fresh-check source and independent native consumer. Twelve examples cover original helper instantiation, correction formula/action, derivative/subtraction identities, pointwise locality and original carriers. Full helper/source/consumer success is required; early results alone cannot qualify the gate. No recursion/heartbeat increase.

Fail on source drift, warnings outside narrow package-status allowlist, forbidden axioms, wrong report lists, or any consumer error. A native recursion requires first-causal preservation and a typed diagnostic; do not blindly repeat native inference. Static YAML/shell/Python/hash checks are not Lean proof.

## Claim ceiling and follow-up

This gate qualifies only the original coordinate derivative/core tau product rule and explicit coefficient correction. Next obligations: bind scalar-entry derivatives to accepted G3 linear Y coefficients; contract CAR finite sums and identify the full kinetic/charge anticommutator. No full charge/tau differential identity, bounded L2 extension, norm bound, physical Spin9, Hardy/fidelity, zero mode or mass gap is claimed.
