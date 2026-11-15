# HARDY-G11 R1 — original derivative color/spin contraction

Date: November 15, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED. Commit before proof code. Predecessor: G10 strict #43702235044, tested `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`.

## Source audit and bounded target

G9 qualifies the literal complex tau coefficient derivative as original Y evaluated on `EuclideanSpace.single (k,B) 1`. G3 qualifies the gamma-contracted Y basis identity only for matching color. The derivative fermion expression sums independent colors A and B, so its off-color behavior must be proved explicitly before Fock assembly.

For actual `M : AlgebraData 2`, prove the color selector and then, for i != j,

\[
 \sum_{k,\alpha}(\Gamma_k)_{\alpha\beta}
 (\partial_{kB}Y_A^{ij})_{\alpha\delta}
 =\delta_{BA}\,\tfrac14(\Gamma_i\Gamma_j)_{\beta\delta},
\]

with the actual G8/G9 complex coefficient derivative on the left and the source real-to-complex embedding on the right. Check the row/column orientation with source gamma symmetry; do not silently transpose Y or substitute a new gamma model.

Source `P3AuxHardyG11OriginalDerivativeColorContraction.lean` imports accepted G10. Six roots, namespace `FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction`:

1. `originalHardyY_basis_off_color`: original basis evaluation vanishes for B != A.
2. `originalHardyY_basis_color`: exact selector expression for all colors.
3. `originalHardyY_basis_color_contraction`: original matrix contraction for all colors, reducing to accepted G3 at matching color.
4. `originalHardyY_basis_spin_contraction`: exact real entry contraction in kinetic coefficient orientation.
5. `originalHardyY_basis_complex_spin_contraction`: its complex-embedded scalar version.
6. `originalHardyTauCoefficientDerivative_spin_contraction`: actual original complex derivative coefficient contraction, using G9.

This gate qualifies scalar/matrix coefficients, not their final theta-bilinear assembly. It does not prove the full coefficient-derivative Fock multiplier, smooth-core rotation identity, tau norm or any closed-domain/physical-sector assertion.

## Controls, evidence and stop

Complete independent consumer `BFSSP3AuxHardyG11OriginalDerivativeColorContractionIndependentConsumer.lean` uses literal paired original gamma/Boson/color/spin carriers. Twelve examples: six source interfaces; matching-color quarter coefficient; off-color matrix zero; off-color actual complex derivative contraction; swapped-plane sign; base-point independence; factor-four normalization of the actual contraction.

Require six new roots and six donor reports: G3 basis and derivative contractions, G9 coefficient and tau-multiplier basis bindings, and G10 kinetic action and orbital CAR identity. All existing source bytes freeze to accepted G10 baseline. Expected recursive closure164 replaces the old G10 consumer by the new source/consumer while retaining G10 as donor; fresh CI must independently measure it.

Workflow `bfss-p3-aux-hardy-g11-original-derivative-color-contraction-strict.yml` retains pinned Lean4.34.1/Mathlib, early generic helper1 and entry helper3, cold original build, fresh strict source6/native12, all twelve examples and final scope exclusions. Standard axioms only; no warning suppression or resource increase. Local static checks are not Lean qualification.

Any color, transpose, coefficient, cast, source-carrier or native-control mismatch falsifies the candidate at that boundary. Preserve the exact first failure and artifact. Repeated native conversion stops full-gate retries for a separately preregistered typed diagnostic; two analogous reds require an architecture review. No unchanged retry, removed control, altered hypothesis or copied gamma table.

G10 remains accepted. Full Fock bilinear/core assembly and physical Spin(9)/charge covariance, energy domains, Hardy/fidelity and spectral conclusions remain separate obligations. The physical symmetry/energy-domain audit retains highest forward priority.
