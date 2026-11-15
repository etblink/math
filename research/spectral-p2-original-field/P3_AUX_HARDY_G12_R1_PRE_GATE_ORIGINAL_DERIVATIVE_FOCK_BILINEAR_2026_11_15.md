# HARDY-G12 R1 — ordered original derivative Fock bilinear

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit before proof code. Predecessor: G11 strict #43708533905, tested `7459e472085a6ef9b3c5c8352073ea1bafa6645e`.

## Exact pointwise target

Let K be G10's literal original complex kinetic symbol and D_tau G8's actual tau coefficient-derivative multiplier. Define the original ordered derivative Fock operator

\[
 D^{ij}(X)=\sum_{k,\alpha,B}K_{\alpha,k,B}\,(D_\tau)^{ij}_{kB\alpha}(X).
\]

For i != j, use accepted G11 to prove

\[
 D^{ij}(X)=\sum_{B,\beta,\delta}
 \left[\tfrac14(\Gamma_i\Gamma_j)_{\beta\delta}\right]
 \theta^B_\beta\theta^B_\delta.
\]

The product order is K followed by D_tau, then theta_beta followed by theta_delta. No commutation/reversal of Fock operators is allowed. The original kinetic charge's `-Complex.I` factor remains for later actual smooth-core assembly. No alternate charge, Fock representation or Hamiltonian is introduced.

## Isolated helper before native data

New Mathlib-only `P3AuxHardyG12FiniteCoefficientContraction.lean`, namespace `FCP.BFSSP3AuxHardyG12FiniteCoefficientContraction`, root `finiteOperatorCoefficientContraction`: for finite I,P,Q, arbitrary normed complex E, coefficient c:I->P->Q->Complex and continuous-linear T_p,U_q,

\[
 \sum_{i,p,q}c_{ipq}(T_pU_q)
 =\sum_{p,q}\left(\sum_i c_{ipq}\right)(T_pU_q).
\]

Prove by finite sum commutation and scalar distributivity only, preserving product order. Run its independent strict one-root audit before the cold original-source build. Retain the previously accepted early generic helper1 and entry helper3 audits; the new helper adds one. No concrete paired data or OAI import in this helper.

## Six original-source roots

Source `P3AuxHardyG12OriginalDerivativeFockBilinear.lean`, namespace `FCP.BFSSP3AuxHardyG12OriginalDerivativeFockBilinear`, imports accepted G11 and the new helper:

1. `originalKineticFermion_eq_sum`: operator equality obtained from the accepted original kinetic action.
2. `originalKineticTauDerivativeFermion`: the literal ordered operator D above.
3. `originalKineticTauDerivativeFermion_expand`: finite expansion with original gamma, complex coefficient derivative and theta products.
4. `originalKineticTauDerivativeFermion_eq_contracted`: gather only scalar coefficients using the new helper on product index types.
5. `originalKineticTauDerivativeFermion_eq_bilinear`: apply G11's color/spin contraction and remove off-color terms.
6. `originalKineticTauDerivativeFermion_apply`: exact vector evaluation of the resulting bilinear.

The old G5 evaluation helper is zero-only; do not misapply it to this nonzero identity. Use direct operator evaluation and current lemma names.

## Native controls, evidence and stop

Consumer `BFSSP3AuxHardyG12OriginalDerivativeFockBilinearIndependentConsumer.lean` has twelve original paired-data examples: six source interfaces; base-point independence; the bilinear at the origin (the derivative term is retained there); swapped-plane sign; factor-four normalization; evaluation on an actual SmoothCore vector; actual FullL2 carrier identity. Six donor reports: original kinetic action, tau derivative action, G9 tau basis binding, G11 real/complex derivative contractions and G10 orbital CAR.

Workflow `bfss-p3-aux-hardy-g12-original-derivative-fock-bilinear-strict.yml` freezes all existing source bytes to accepted G11. Expected recursive closure166 replaces the old G11 consumer by new source/consumer/helper; CI must recompute it independently. Require early helper reports1+3+1, cold original build, fresh source6/native12, all twelve examples and explicit final scope exclusions. Keep Lean4.34.1/Mathlib pins, standard axioms, warning-as-error and existing job/cold/compiler limits. The new isolated helper uses the same bounded helper limits, not raised limits.

Any index/color, scalar coefficient, product-order, actual-carrier, helper or native mismatch falsifies the candidate at its stage. Static checks are not Lean qualification. Preserve exact first failure and full artifact. Repeated native conversion stops full-gate retries for a separately preregistered typed diagnostic; two analogous reds require architecture review. No unchanged retry, warning suppression, removed control or substitute model.

G11 remains accepted. G12 is pointwise ordered Fock assembly only; actual smooth-core charge/tau rotation, tau norm, physical Spin(9)/singlet covariance, energy domains, Hardy/fidelity and spectral conclusions remain separate. Physical symmetry/energy-domain research retains highest forward priority.
