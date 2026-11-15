# G13 R1 — original smooth-core kinetic/tau assembly

November 15, 2026 Pacific. REGISTERED_NOT_EXECUTED; commit before code. Accepted predecessor: G12 #43740253917, tested `8b54ce6b150d8f3689342dd6bf80179414ab95fa`; acceptance committed at `b705a00e54ff67aadcd6149ea3c6c4a796bf9acb`.

## Bounded target and source bindings

Use the actual AlgebraData2 charge, original SmoothCore2 and original tau core. Let L_alpha f be the existing BFSSKinetic.kineticDerivative (M.kineticSymbol alpha) f, T_alpha the accepted originalHardyTauCore M i j alpha, K_alpha,kB the accepted originalKineticFermion, and dT the actual originalHardyTauDerivative. These are explanatory abbreviations only: candidate statements must name the literal original declarations; do not introduce a replacement charge or carrier.

For each alpha, bind L to sum(k,B) K_alpha,kB times coordinateDerivative(k,B) on the original core, then prove the actual tau Leibniz expansion. In vector evaluation at X:

    L_alpha(T_alpha f)(X)
      = sum(k,B) K_alpha,kB [tau_alpha(X)(partial_kB f(X))]
        + sum(k,B) K_alpha,kB [dT_kBalpha(X)(f(X))].

Also evaluate T_alpha(L_alpha f) using complex-linear tau action on the finite sum. Add both sides without changing the order of any fermion product.

Use the original charge decomposition Q_alpha=-I L_alpha+bracketPart_alpha. Retain -Complex.I exactly. Prove the per-charge paired decomposition and then use accepted G7 potential cancellation to obtain

    sum alpha [Q_alpha(T_alpha f)(X) + T_alpha(Q_alpha f)(X)]
      = (-I) • sum alpha [L_alpha(T_alpha f)(X) + T_alpha(L_alpha f)(X)].

No i!=j hypothesis is needed for these assembly identities. G10 orbital CAR and G12 derivative bilinear will subsequently collapse the remaining kinetic sum; that collapse and the full source rotation identification are not part of G13. Tau norm, closed-domain equality and physical conclusions remain separate.

## Architecture and exact six roots

New source P3AuxHardyG13OriginalCoreKineticTauAssembly.lean, namespace FCP.BFSSP3AuxHardyG13OriginalCoreKineticTauAssembly, imports accepted G12 only. Six roots:

1. originalKineticDerivative_apply — literal original kinetic derivative as finite original symbol actions.
2. originalKineticDerivative_tauCore_productRule_apply — actual original core tau derivative expansion.
3. originalTauCore_kineticDerivative_apply — actual tau action on the original kinetic output.
4. originalKineticTauCore_pair_apply — combine the ordered pair, preserving derivative contribution.
5. originalChargeTauCore_pair_apply — per-charge kinetic-plus-potential paired decomposition with original -I factor.
6. originalChargeTauCore_sum_eq_kinetic_apply — sum original charges and consume G7 potential cancellation.

Reuse accepted Kinetic.kineticDerivative_pointwise, G10 kinetic action, G7 tau evaluation/potential cancellation and G8 actual product rule. Prove finite vector sum identities by explicit mapping/distribution and additive normalization; no new analytic or generic helper is needed. Keep all existing donor bytes pinned to accepted G12. The real-linear source kinetic symbol and complex Fock action are bridged by the accepted source evaluation theorem; do not assert an unproved change of scalar structure.

## Consumer, evidence and stop

New native consumer imports candidate source and original G4J paired data. Twelve literal controls: six interfaces; aggregate identity at origin; equal-plane aggregate identity; zero input aggregate; actual FullL2 charge-of-tau carrier; original tau core evaluation; original source charge/potential decomposition. Six named donor reports: original kinetic pointwise formula, G7 tau evaluation, G7 potential cancellation, G8 derivative rule, G10 orbital CAR and G12 derivative bilinear. Require source6/native12 and all twelve examples, plus previously accepted early helpers1+3+1.

New strict workflow freezes original donors to tested G12 baseline. Expected recursive closure167 replaces old G12 consumer with new source and consumer; CI independently recomputes it. Keep Lean4.34.1/Mathlib pins, warning-as-error, standard axioms, overall120/cold3600/compiler500 and existing helper limits. No resource escalation or additional unbounded phase. Preserve full logs/manifests/first-causal artifacts and explicit scope receipt.

Before publication require exact imports, root/example/report counts, candidate/donor hashes, YAML/bash/five Python blocks, preflight and strict-auditor rejection fixtures, and checkpoint binding. No local Lean is available; static checks are not qualification. Any mismatch of core/carrier/scalar/output/order falsifies the candidate at its stage.

On green qualify only these original core-evaluation assembly identities, then preregister final kinetic collapse/rotation identification. On red preserve first causal evidence; repeated native conversion requires a separately preregistered isolated source-shaped diagnostic before another full retry, and two analogous reds trigger architecture review. No unchanged retry, warning suppression, removed control or alternate model.

Physical Spin9/reducing spinor sector/charge covariance and original supercharge energy/domain audit remain highest forward research. This stage closes no physical Hardy/fidelity/zero-mode/gap assumption. G12 acceptance closes a named derivative Fock obligation; further green counts must not substitute for that physical feasibility audit.
