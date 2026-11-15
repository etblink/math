# HARDY-G10 R3 — pointwise orbital CAR accepted

Reviewed November 15, 2026 Pacific. Verdict: GREEN_QUALIFIED, limited to the six named original-source roots. Strict Lean qualification is not peer review or a physical conclusion.

[Strict #43702235044](https://github.com/etblink/math/actions/runs/43702235044), attempt1, job `132775658384`, succeeds at exact tested commit `7d5f8f74b9d922a6e7628b7d05e30d2d2d6ab73d`. R2 red evidence and the [R3 contract](P3_AUX_HARDY_G10_R3_PRE_GATE_EXPLICIT_NATIVE_CONTROL_TAILS_2026_11_15.md) were committed first at `11b9619e376875e8c06b7bc05e7131e2cf73aaba`; [launch binding](P3_AUX_HARDY_G10_R3_LAUNCH_BINDING_2026_11_15.md).

## Verified evidence

- Preflight163 recursive source pins; manifest SHA256 `65142f6ef1c9f0233eddf42729c09ba4f7cc55403add65bcdbec58b76922534d`.
- Pinned Lean4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold original9,085-job build PASS.
- Early generic helper1 and entry helper3 fresh strict audits PASS. Fresh source6/native12 exact root reports PASS, all with only propext/Classical.choice/Quot.sound. All twelve native examples and final scope audit PASS.
- Source `59aaed1da894e8b91b2df51eda6f47a37cf4c517`; complete consumer `4f5ad59752d744a8e1dd218b36b7f15b6250ab3e`; workflow `bf74a5a1bc304924b8b24334ab5dab9f3a398e53`.
- Artifact `14157550157`,22,246 bytes; independently rehashed SHA256 `d7acb15fac710626dbb608cbf7c929091b6ad716521e4ff51b989f3ffd4ebb6c`, matching GitHub's digest. [Complete fourteen-file ZIP](diagnostics/P3_AUX_HARDY_G10_R3_43702235044_evidence.zip); [independent audit and every member hash](diagnostics/P3_AUX_HARDY_G10_R3_GREEN_43702235044_AUDIT_2026_11_15.json).

Tested SHA, manifest and source/consumer/workflow hashes were independently checked. Rerunning the original workflow auditor on the downloaded logs reproduced a byte-identical scope receipt. Administrative CI is separate from this mathematical receipt.

## Accepted scope

Namespace `FCP.BFSSP3AuxHardyG10OriginalKineticTauCAR`:

1. `originalKineticFermion`: literal original complex principal symbol at a coordinate basis vector.
2. `originalKineticFermion_apply`: exact original kinetic-symbol action.
3. `originalKineticCoefficient_basis`: original gamma entry and color-selector coefficient.
4. `originalKineticTauCoefficient_trace`: same-index coefficient pairing equals the orbital coordinate expression, using source gamma symmetry and accepted Y trace.
5. `originalKineticTau_anticommutator`: actual pointwise complex Fock operator identity.
6. `originalKineticTau_anticommutator_apply`: exact vector evaluation of that identity.

For K the original principal symbol and i != j, the qualified identity is

\[
 \sum_\alpha\{K_{\alpha,k,B},\tau^{ij}_\alpha(X)\}
 =\bigl(X_{iB}\delta_{kj}-X_{jB}\delta_{ki}\bigr)I.
\]

The complete paired-source consumer includes +1/-1 coordinate coefficients, transverse zero, plane swap, origin and distinct-color controls. These check the source CAR normalization and orbital sign without introducing a substitute model. The full kinetic charge's `-Complex.I` factor still belongs to later core assembly.

## Negative knowledge and next obligation

R1's deprecated identity-evaluation lemma was replaced with the compiler-recommended current name. R2 then exposed four native proof-tail issues: reverse inequality was not discharged automatically in two examples, and an explicit basis simp lemma was unused in two others. R3 leaves the clean source and every example statement fixed, supplies the exact inequality proof and removes only compiler-flagged arguments. All red artifacts remain preserved.

Next audit: the coefficient-derivative contraction across all colors. G9 binds literal complex entry derivatives to original Y coordinate-basis values; G3's existing contraction is stated for matching color. Prove the off-color behavior and the resulting exact spin/color contraction before assembling the full fermion bilinear. Keep those coefficient identities, finite Fock assembly and actual smooth-core assembly separate and explicitly typed.

No coefficient-derivative fermion contraction, full smooth-core charge/tau rotation identity, tau norm, physical Spin(9)/singlet covariance, supercharge energy/domain identity, Hardy estimate, fidelity certificate, zero-mode existence theorem or BFSS mass gap is qualified here. The fixed-positive-regulator certificate remains conditional. The physical symmetry/energy-domain audit remains the highest forward-research priority; G9, G8 and original-H M5BF0 remain distinct accepted dependencies.
