# BFSS M4 QTC0A R1 — STRICT GREEN qualification and original artifact preservation

Date: 2026-11-16 Pacific (Actions finished 2026-11-17 02:22 UTC).
Branch: `integration/bfss-unified-research-20261108`.

**STRICT GREEN / QUALIFIED WITH EXACT SCOPE** on [run #44001621836](https://github.com/etblink/math/actions/runs/44001621836), original job `133766836613`, tested SHA `c2697826a7ebd258f604e60def408a84f52a61b9`. The companion roadmap [#44001621614](https://github.com/etblink/math/actions/runs/44001621614) was GREEN on the same SHA, but is governance only.

- Cold native original Fock source build: **8963 jobs**, completed.
- Axiom reports: exactly **2 source** (complex scalar commutator, weighted quadratic covariance expansion) and **2 independent consumer**; each depends only on `propext`, `Classical.choice`, `Quot.sound`.
- Four compiled finite-index controls: `Fin 0`, `Fin 1`, `Fin 2`, `Fin 3`. Strict auditor positive fixture and **six negative** mutants all passed.
- Exact theorem source Git blob: `b0b519e46566856e100bf6aa882f9fcdf37d397e`. Independent consumer: `9d1dc845bea73d8e07549c69d9ef07804509f52e`. Strict workflow: `f765eab05612b9f4ea0ec94ec8f981fe19b130d2`. Accepted donors and Lean/Mathlib pins unchanged.
- Strict marker: `BFSS_M4_QTC0A_ORIGINAL_FOCK_WEIGHTED_QUADRATIC_2_SOURCE_2_CONSUMER_4_CONTROLS_STRICT_GREEN`.

**Provider-original evidence**, not a regenerated archive: [Actions artifact #14292159303](https://github.com/etblink/math/actions/runs/44001621836), 3785-byte ZIP; independently computed SHA-256 `bf8d93fe00846c9ea26815d32ee331424d9510d1816b66cd98c90ef82baf724c`, equal to GitHub provider's published digest. Exact preserved Git blob `7cebb61b36ba22283cbd27a8d5f91b301b7303e2` (checked against downloaded bytes), at `research/spectral-p2-original-field/diagnostics/BFSS_M4_QTC0A_R1_44001621836_evidence.zip`. The complete original job log is retained separately with Git blob `011eeb3550c549979e2bc46357fd198e311f0d69`; [manifest](diagnostics/BFSS_M4_QTC0A_R1_44001621836_evidence_manifest.json) lists all five ZIP entries and their individual SHA-256 digests. The canonical checkpoint validator rehashes the committed archive.

**Ceiling:** This proves `[T,Q_x(b)]` expands by Leibniz under an explicit covariance assumption, on the actual original `Fermion 2 →L[ℂ] Fermion 2` carrier. It does **not** yet prove `Q_x(a*b+b*aᵀ)`, skew reduction, source real `K(A)` equality, complete so(48) bracket, original global Spin(9), an original physical-domain Hamiltonian symmetry, or any ground-state/fidelity claim.

Next **QTC0B** remains PROSPECTIVE / NOT STAGED: prove the general ordered coefficient contraction before skew specialization, with non-skew `A=I, B=E₀₀` adversarial control. CT1G0 two analogous native recursion REDs remain STOPPED. Preserve P1 R2 #43998813826 and its separately verified original artifact. No change to `main`.
