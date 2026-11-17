# BFSS P3-M4-LB1P1 R2 — STRICT GREEN accepted original four-Majorana commutator

Date: 2026-11-16 Pacific. Formal source-exact Lean strict-gate qualification; not external peer review.

## Exact original strict qualification and pin closure

- [Strict run #43998813826](https://github.com/etblink/math/actions/runs/43998813826): **SUCCESS** at tested commit `de3af5cd0f7aa82de8aa9c7439bee46d02a37a02`, job `133757449826`, original Fock cold source build **8965/8965 PASS**. Source/consumer/donor/toolchain/CT1 stop preflight PASS.
- Two original source theorem roots: conditional `originalFock_fourFactor_commutator_from_two_covariances` and exact Source48 `originalSource48_fourMajorana_commutator`, both **standard-only Lean axioms** `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Independent import and restatement: `originalFock_fourFactor_conditional_consumer` and `originalSource48_fourMajorana_consumer`, both same standard-only allowed axioms. Four original Source48-label controls: fully distinct, shared index, same bivector, diagonal/repeated index; six strict negative auditor controls PASS.
- Original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB1P1OriginalFourMajoranaCommutator.lean`, Git blob `9a2899e24c02cb5a5dd58159605a34195fce3856`; independent consumer `lean/diagnostics/BFSSP3M4LB1P1OriginalFourMajoranaIndependentConsumer.lean`, blob `5822a7290c04e5fc88b297ad14d9d16b8c290bbd`; original strict workflow `.github/workflows/bfss-m4-lb1p1-four-original-majorana-strict.yml`, blob `24c143df6ddf8fb4c9254b7f3a1738d34dbbdc37`.
- Pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original source normalized gamma CAR, 1/4 real K coefficient and all accepted donors unchanged.

## Exact original evidence archived and independently rehashed

- GitHub original provider artifact [#14290894037](https://github.com/etblink/math/actions/runs/43998813826/artifacts/14290894037), **3888 bytes**, SHA256 `6bcfef6696d6399c3f03ade5c0f97a732ee2f802ba9ab8ff13e6e6734d0db9a6`.
- Original binary [ZIP evidence](research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P1_R2_43998813826_evidence.zip) permanently stored in Git blob `ccaa3ba1e0b75053c705cc1b15e77055bd486954`: five complete original entries `tested-commit.txt`, `preflight.log`, `cold-source.log`, `source-axioms.log`, `consumer.log`.
- [Complete original strict job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P1_R2_43998813826_complete_job.log), Git blob `f00c39817bffae684805d260a8f5e58542342ceb`.
- Original artifact independently **re-downloaded from GitHub and fully rehashed** by [GREEN preservation run #44000111416](https://github.com/etblink/math/actions/runs/44000111416), job `133761755925`. Provider hash, exact tested SHA, ZIP integrity, five original entries, 8965 cold jobs, all 2+2 theorem/axiom reports confirmed. [Full preservation log](research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P1_R2_44000111416_preservation_job.log), Git blob `36c7ec86128fb2012552977e70ea85bf381f6bb6`; [manifest and per-file SHA256](research/spectral-p2-original-field/diagnostics/BFSS_M4_LB1P1_R2_43998813826_evidence_manifest.json), Git blob `5614445f15bd95f9305a6236b2883fefdf326078`.
- Independent preservation verifies evidence identity/integrity, not a separate human review of the mathematical proof.

## Mathematical result and explicit claim ceiling

For **all** four original `Source48Label` indices `i,j,k,l`, including every repeated/diagonal case, on the actual complex original `Fermion 2` Fock operator carrier:

```text
[Γ_iΓ_j, Γ_kΓ_l] =
  (if j=k then 2:ℂ else 0) • Γ_iΓ_l
  - (if i=k then 2:ℂ else 0) • Γ_jΓ_l
  + (if j=l then 2:ℂ else 0) • Γ_kΓ_i
  - (if i=l then 2:ℂ else 0) • Γ_kΓ_j.
```

This is exactly the original source four-Majorana CAR commutator, **not** the full `[K(A),K(B)]=K(AB-BA)`, not sparse plane Lie closure and not a representation theorem for the physical Spin(9) group, gauge/charge domains, G16 Hardy/fidelity or BFSS ground-state existence. The conditional opaque root retains its explicit covariance hypotheses.

## Preserved RED predecessor, stopped CT1 and next route

P1 R1 [#43996551474](https://github.com/etblink/math/actions/runs/43996551474) was RED at source line 41 due to broken qualified donor reference split across newline; its [negative receipt](BFSS_M4_LB1P1_R1_RED_43996551474_LINE_SPLIT_DONOR_IDENTIFIER_2026_11_16.md), original 3547-byte ZIP (SHA256 `0d873a2259c24bc4ccdbb3be175869ad413504dcd0cd12fe8b25830e557e7420`), independent rehash [#43998088476](https://github.com/etblink/math/actions/runs/43998088476), and all logs remain preserved. R2 changed **only donor identifier syntax**, preserving source theorem statements and independent consumer exact bytes. CT1G0 R1/R2 analogous native recursion failures #43988822460 / #43991790285 remain STOPPED and their complete artifacts preserved.

New recommended **prospective, NOT STAGED** [QTC0 quadratic tensor covariance](BFSS_M4_QUADRATIC_TENSOR_COVARIANCE_DIRECT_K_LIE_BRACKET_FORWARD_RESEARCH_2026_11_16.md) uses already qualified LB1C1 + LB1L2 and the generic identity `[T,Q(B)]=Q(AB+BAᵀ)` to pursue the full original `K` Lie bracket through a separate source-exact bridge; it may bypass sparse-plane P2, which remains a documented fallback. No QTC Lean source, consumer or CI launched. The principal physical objective remains the original Hamiltonian fixed-positive-regulator ground-state fidelity certificate. `main` untouched.

**VERDICT: P3-M4-LB1P1 R2 STRICT GREEN — last qualified original four-Majorana theorem, source+independent consumer+exact original ZIP.**
