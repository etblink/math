# G14 R1 — preregister original core anticommutator collapse

REGISTERED_NOT_EXECUTED. Commit after G13 acceptance and before proof code. Accepted predecessor G13 #43746155492, exact `d065dda605b28120e10c347efa9afc07ddbb8147`; G10 orbital CAR and G12 derivative bilinear are accepted dependencies.

## Exact target

For actual AlgebraData2, distinct i,j, SmoothCore2 f and Boson2 X, prove the summed original kinetic/tau pair is

    sum B [ (X(i,B):Complex) smul coordinateDerivative(j,B,f)(X)
            - (X(j,B):Complex) smul coordinateDerivative(i,B,f)(X) ]
    + sum B,beta,delta [ (1/4:Complex) * ((M.gamma i * M.gamma j) beta delta:Complex) ]
        smul M.theta beta B (M.theta delta B (f X)).

Then consume G13 to multiply this exact sum by -Complex.I, yielding the original charge/tau core identity. Preserve order theta_beta then theta_delta. This is a literal coordinate/operator formula, not a new physical Spin9 action, an unbounded self-adjoint generator or an automatic identification with a separately named rotation operator.

## Six source roots and architecture

New P3AuxHardyG14OriginalCoreAnticommutatorCollapse.lean imports accepted G13 only. Namespace FCP.BFSSP3AuxHardyG14OriginalCoreAnticommutatorCollapse. Six roots:

1. originalOrbitalCoefficient_sum_apply — finite coordinate-selector sum collapses to the two literal orbital derivative terms.
2. originalKineticTauCore_orbital_sum_apply — apply accepted G10 CAR to the alpha sum, then the selector identity.
3. originalKineticTauCore_derivative_sum_apply — reindex alpha/k/B into the exact G12 operator application and use the accepted ordered quarter-gamma bilinear.
4. originalKineticTauCore_sum_apply — sum accepted G13 core kinetic pair; separate orbital and derivative sums and insert roots2/3.
5. originalChargeTauCore_sum_apply — consume G13 summed potential cancellation and root4, retaining -i.
6. originalChargeTauCore_sum_distributed_apply — distribute that -i over the literal orbital and fermionic terms, without renormalizing the quarter coefficient or identifying a physical generator.

Use symbolic AlgebraData2 and typed vector-valued finite sums. No concrete Fock expansion, no source Hamiltonian replacement or domain claim. Existing finite contraction helpers suffice; a new generic helper is not planned. Use explicit sum distribution/order and accepted source evaluation interfaces.

## Native controls, evidence and stop

Twelve literal paired controls: first six exact source statement substitutions; original charge identity at typed origin (generalize zero before applying source); swapped plane; zero input; original charge-of-tau FullL2 carrier; original tau-core evaluation; existing original charge-to-kinetic reduction. Six donor reports: G10 operator/vector CAR, G12 operator/vector derivative bilinear, G13 kinetic pair and summed original charge reduction. Require new source6/native12/all12 and early helpers1+3+1.

Strict workflow freezes all existing donors to tested G13. Expected recursive168-pin closure removes G13 consumer and adds new source/consumer. Fresh CI must recompute it. Preserve Lean4.34.1/Mathlib pins, autoImplicit=false, warning/axiom audits, overall120/cold3600/compiler500 and existing helper limits; no escalation or removed control.

Before publication: exact roots/imports/statements/carriers/order/sign, source/consumer/donor hashes, YAML/bash/five Python blocks, literal preflight assertions, positive and six negative auditor fixtures, guarded checkpoint. No local Lean; static checks are not qualification.

On red preserve first cause. A repeated native conversion/source assembly boundary requires an isolated preregistered diagnostic before another full retry; two analogous reds require architecture review. No unchanged retry or resource increase. On green accept only the literal core collapse, then preregister tau norm and audit any named rotation identification separately. Physical Spin9/energy-domain feasibility remains highest forward research.
