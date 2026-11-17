# BFSS CT1-G0 R1 — RED_UNQUALIFIED: oversized source adapter elaboration

Date: 2026-11-16 Pacific, single research branch `integration/bfss-unified-research-20261108`.

**Original strict run [#43988822460](https://github.com/etblink/math/actions/runs/43988822460): RED/FAILURE.** Exact tested commit `a04d3240b8e1649ca058772af7a98f73095a177c`, job `133723847648`. The source, consumer, donor and toolchain preflight **passed**, Lean 4.34.1 / pinned Mathlib restoration **passed**, then the cold native source compile **failed** at the third theorem statement. Consumer compilation and original strict auditor were not reached.

## First causal error

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean:53:0: maximum recursion depth has been reached
```

The failure is at the start of the **expanded native source48 Jacobi theorem**, which repeats `originalSource48BivectorK A`, `originalSource48BivectorK B`, and `sourceNormalizedGamma k` many times. This is an elaboration/recursive typeclass-normalization problem; increasing `maxRecDepth` or `maxHeartbeats` is prohibited. It is **not a counterexample to noncommutative Jacobi**. The two opaque source theorems `originalFock_commutator_jacobi` and `originalFock_commutator_sub` separately printed only `propext`, `Classical.choice`, `Quot.sound`; the failed third adapter printed no axioms because its theorem did not elaborate. **R1 has no qualified source or independent consumer roots.**

## Exact original evidence: preserved and independently rehashed

- Original GitHub artifact [#14287816678](https://github.com/etblink/math/actions/runs/43988822460/artifacts/14287816678) had **17,654 bytes**, SHA256 `c03e06d90de7d0a7e946a55d27f5bd2c2d7e03981355d80ad512ff8dbe61d75e`, exact tested SHA `a04d3240b8e1649ca058772af7a98f73095a177c`.
- Exact provider ZIP committed [here](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R1_43988822460_evidence.zip) (Git blob `3af05171c5865f120bd1b93fd99c7be37ba52acb`), three entries `tested-commit.txt`, `preflight.log`, `cold-source.log`; original ZIP verified with independent full-byte SHA256 and ZIP integrity.
- Complete [original job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R1_43988822460_complete_job.log), Git blob `064789d736abc1c79f8ffbc6de83c842da309d52`.
- Independently rehashed original provider ZIP in **GREEN** [run #43991194687](https://github.com/etblink/math/actions/runs/43991194687), job `133731897600`; complete [rehash log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R1_43991194687_original_zip_rehash.log), Git blob `721153cf754d46510c5070a54db4838945ce6b67`, and entry-hash [manifest](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT1G0_R1_43988822460_evidence_manifest.json), Git blob `687e65abf7b5369d23c106be04a49b3e3886bb7f`.
- Original failed source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT1G0OriginalFockJacobiSource48Adapter.lean`, Git blob `e4837ccb96108ecabcebfd0ba2534398fe0ddb2a`; independent consumer blob `2d38aa70c6b4a55d4b8af3245d6d63b15839d697`; strict workflow blob `379dd974513f3cf327880c2f1d4203805d4bfbcd`; all historical source and donor commits retained.

## Next bounded repair; no proof promotion

R2 should **shorten the theorem elaboration surface**, introducing an explicitly typed original Fock operator commutator abbreviation `originalFock_commutator (X Y:Op) : Op := X*Y-Y*X`, stating source Jacobi through three small applications and using the already clean generic opaque Jacobi lemma. Update the independent consumer's third theorem and two source48 controls to use the same operator abbreviation. Preserve all original gamma and K bytes, scalar normalization, source/consumer root counts and all original accepted gates. Require new exact workflow pins and independent strict source/consumer checks. The R1 structure must remain accessible, with the saved archive and logs; **do not raise resource limits or flatten native 48×48 sums**. Stop after a second analogous native recursive elaboration failure and reconsider proof architecture.

The canonical last qualified gate remains **P3-M4-CT0 R2** (#43983772199), complete original ZIP preserved and independently rehashed (#43987114193). G1 finite-index composition is prospective only. No full bivector bracket, Spin(9) operator group, physical-domain Hardy/fidelity or ground-state claim.
