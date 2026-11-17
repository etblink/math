# BFSS M4 QTC0B R2 — STRICT RED, exact original evidence sealed

**Date:** 2026-11-16 Pacific (completed 2026-11-17 UTC).
**Branch:** `integration/bfss-unified-research-20261108`.

**RED / UNQUALIFIED.** [Original strict Actions run #44014529416](https://github.com/etblink/math/actions/runs/44014529416), job `133809148410`, tested commit `7bef2507e243824b0b8bcba9893d292c8d93fc88`.

Accepted QTC0A donor, exact preflight, Lean 4.34.1 and pinned Mathlib restoration **PASS**. Roadmap [#44014529377](https://github.com/etblink/math/actions/runs/44014529377) GREEN but governance only. The **new QTC0B native source failed**, so independent QTC0B consumer never ran. Both source `#print axioms` reports contained `sorryAx`; **zero** QTC0B roots qualified.

**First causal diagnostic:** source `P3M4QTC0BOriginalFockQuadraticTensorContraction.lean:113:28`: `rw [Matrix.mul_apply, Matrix.transpose_apply]` cannot find `Matrix.transpose` pattern in the displayed expression `∑ j, (b i j * a p j) • (x i * x p) = (∑ j, b i j * a.transpose j p) • (x i * x p)`.

**Second diagnostic:** source line `155:34`: `rw [Matrix.add_apply, add_smul]` cannot find `(?r + ?s) • ?x` pattern. The displayed goal is the coefficient-transport equation `c • X + d • X = (c+d) • X`; backwards use of `add_smul` (or exact scalar-module equality) would be appropriate in a separately typed lemma.

**Comparison:** [R1 #44012367725](https://github.com/etblink/math/actions/runs/44012367725) had an unrestricted `mul_comm` rewrite motive failure and several unclosed finite sum steps. The R2 source successfully eliminated those earlier diagnostics and now reaches just two rewrite-elaboration blockers. **No recurrence of recursion-depth failure and no mathematical counterexample** were observed. Nevertheless two consecutive native monolithic source-rewrite attempts have remained unqualified. As Project Lead, halt this method for architecture review; do not launch an unchanged QTC0B R3.

**Original provider artifact preservation:** [Actions artifact #14297929785](https://github.com/etblink/math/actions/runs/44014529416/artifacts/14297929785) exact 3,984-byte original ZIP, independently SHA-256 checked `f7fa7726865600cab92e1270b558dcc856ad0cfc28318f2bb7d95e74b7ab8dbb`, exact Git blob `485d47d68a5425a79d720248a4b64b972da619ab`, archived at `research/spectral-p2-original-field/diagnostics/BFSS_M4_QTC0B_R2_44014529416_evidence.zip`; ZIP integrity check PASS. Complete original workflow job log Git blob `6290b76858d5e736b04af723532d94fec6b3e532` archived at `research/spectral-p2-original-field/diagnostics/BFSS_M4_QTC0B_R2_44014529416_complete_job.log`. [Member manifest](research/spectral-p2-original-field/diagnostics/BFSS_M4_QTC0B_R2_44014529416_evidence_manifest.json) binds preflight, tested commit and cold-source log member SHA-256 hashes. R1 source, artifact and log remain separately immutable.

**Governance:** preserve QTC0A strict GREEN #44001621836 as last qualified gate. QTC0B R1/R2 are `RED_UNQUALIFIED`, not falsified; original physical fidelity, source-real K bridge (QTC1), source Lie bracket (QTC2) and global physical Spin9 all remain unproved. [Architecture review](BFSS_M4_QTC0B_R1_R2_TWO_REDS_ARCHITECTURE_DECISION_2026_11_16.md) selects an abstract coefficient first path, without further native source staging. No `main` modifications.
