# HARDY-G11 R3 — original derivative color/spin contraction accepted

Reviewed November 15, 2026 Pacific. Verdict: GREEN_QUALIFIED, limited to the six named coefficient identities. This is strict Lean qualification, not peer review or a physical conclusion.

[Strict #43708533905](https://github.com/etblink/math/actions/runs/43708533905), attempt1, job `132794815882`, succeeds at exact tested commit `7459e472085a6ef9b3c5c8352073ea1bafa6645e`. R2 red evidence, two-red review and the [R3 contract](P3_AUX_HARDY_G11_R3_PRE_GATE_EXPLICIT_MATCHING_COLOR_REWRITE_2026_11_15.md) were committed first at `9f79c202888e40d59064b77bb62abc2434439c17`; [launch binding](P3_AUX_HARDY_G11_R3_LAUNCH_BINDING_2026_11_15.md).

## Verified evidence

- Preflight164 recursively pinned original-source paths; manifest SHA256 `9b58bf7f93dbcf7586da0c39d89741e77b723cdfe1f354e2191708145da34d2a`.
- Pinned Lean4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold original9,086-job build PASS.
- Early generic helper1 and entry helper3 fresh strict audits PASS. Fresh source6/native12 exact root reports PASS, all using only propext/Classical.choice/Quot.sound. All twelve native examples and final scope audit PASS.
- Source `fae4dc32dee27c5542f7fffddf217b276ed2bfef`; consumer `27b63114ea4635beed31bc9cef954b8499e8194e`; workflow `d0f14e9aa39fe01e1c7d5f41a3d0fe31cb26c75c`.
- Artifact `14159937387`,22,543 bytes; independently rehashed SHA256 `021dc41236d246ecfcf503d273effe46f7e06b5b9b105b522cc8f3bb435ada35`, matching GitHub's digest. [Complete fourteen-file ZIP](diagnostics/P3_AUX_HARDY_G11_R3_43708533905_evidence.zip); [independent audit and all member hashes](diagnostics/P3_AUX_HARDY_G11_R3_GREEN_43708533905_AUDIT_2026_11_15.json).

Tested SHA, source/consumer/workflow bytes and manifest were independently checked. Reexecuting the original workflow's final auditor on the downloaded logs reproduced a byte-identical scope receipt. Administrative CI is separate from this mathematical receipt.

## Accepted declarations and meaning

Namespace `FCP.BFSSP3AuxHardyG11OriginalDerivativeColorContraction`:

1. `originalHardyY_basis_off_color`.
2. `originalHardyY_basis_color`.
3. `originalHardyY_basis_color_contraction`.
4. `originalHardyY_basis_spin_contraction`.
5. `originalHardyY_basis_complex_spin_contraction`.
6. `originalHardyTauCoefficientDerivative_spin_contraction`.

The final identity uses the actual original complex tau coefficient derivative:

\[
 \sum_{k,\alpha}(\Gamma_k)_{\alpha\beta}
 (\partial_{kB}Y_A^{ij})_{\alpha\delta}
 =\delta_{BA}\,\tfrac14(\Gamma_i\Gamma_j)_{\beta\delta},\qquad i\ne j.
\]

The source proves off-color vanishing, all-color matrix contraction, kinetic row orientation using original gamma symmetry, complex embedding and the literal G8/G9 derivative binding. The paired-source consumer checks matching/off color, plane-swap sign, base-point independence and factor-four normalization.

## Preserved lessons and next obligation

R1's unused simp argument and deprecated conditional aliases are preserved in its full artifact. R2 resolves those warnings and reaches the native consumer; one limited `simpa only` transfer retains an unreduced true conditional. R3 replaces only that tail by direct source/branch rewriting, leaving the clean source and all twelve statements fixed. Both red artifacts and the two-red review remain preserved.

Next: assemble the actual ordered Fock product of original kinetic symbol and tau-derivative multiplier. Isolate finite coefficient/product sum rearrangement independently before native data; preserve theta product order and apply the accepted color/spin contraction. This does not yet assemble the full smooth-core charge/tau identity.

No final derivative Fock bilinear, full core rotation, tau norm, physical Spin(9)/singlet covariance, supercharge energy/domain identity, Hardy estimate, fidelity certificate, zero-mode existence theorem or BFSS mass gap is qualified here. G10/G9/G8 and original-H M5BF0 remain distinct accepted dependencies. The fixed-positive-regulator certificate remains conditional; physical symmetry/energy-domain research retains highest forward priority.
