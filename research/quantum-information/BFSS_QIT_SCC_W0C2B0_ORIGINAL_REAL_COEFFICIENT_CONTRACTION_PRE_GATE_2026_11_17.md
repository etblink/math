# BFSS × QIT × SCC — W0C2B0 exact original real coefficient contraction pre-gate

Date: 2026-11-17 Pacific. **FROZEN RESEARCH/PRE-GATE PLAN; NOT NATIVE LEAN-QUALIFIED.**

Only `integration/bfss-unified-research-20261108`. Keep `main` and accepted donors unchanged. Last qualified gate W0C2A R1: strict [#44213315719](https://github.com/etblink/math/actions/runs/44213315719) GREEN tested `48e7e58b23c19643c905d16fe69e46d0a7c0a73e`, source blob `51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb`, independent ZIP/log preservation [#44216554946](https://github.com/etblink/math/actions/runs/44216554946) GREEN at `cc85d51dcbb128db833fdaca7399506f327663a6`, canonical acceptance `7c3834651ebd328bd8b8f8f95cba64269ba6a353`, independent post-acceptance roadmap [#44217096057](https://github.com/etblink/math/actions/runs/44217096057) GREEN.

## Source-exact forward research

- Qualified original LB1C1 [#43901524171](https://github.com/etblink/math/actions/runs/43901524171) (source `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`, blob `c2e7a7c665121283cde13ae5dabc183362b6b420`) establishes `[K(A),γ_k]=∑_p (A p k : ℝ) • γ_p` for real skew `A` and original `Source48Label` normalized Fock Majoranas.
- Original `Op := Fermion 2 →L[ℂ] Fermion 2`, `γ_k := sourceNormalizedGamma k`, and `Source48Label = Fin 24 × Fin 2` remain literal source constructions. `FCP.BFSSS1V52L9E5B0.originalFockOperator_real_smul_eq_complex_smul` is the qualified source bridge for real coefficient action.
- Qualified QTC0A [#44001621836](https://github.com/etblink/math/actions/runs/44001621836) source `P3M4QTC0AOriginalFockWeightedQuadraticCovariance.lean` blob `b0b519e46566856e100bf6aa882f9fcdf37d397e` establishes `originalFock_commutator_complex_smul`. Qualified QTC0C [#44016807302](https://github.com/etblink/math/actions/runs/44016807302) and QTC0D [#44018395393](https://github.com/etblink/math/actions/runs/44018395393) provide a proven coefficient-reindexing pattern, but no QTC1 original real/complex specialization is assumed.
- Accepted W0C2A establishes the original defect `D(A,B)=[K(A),K(B)]-K(A*B-B*A)` has `originalFockTrace D=0`, and **conditional** on `∀ k, Commute D γ_k`, `D=0`. This is not yet an unconditional Lie bracket theorem.

## First bounded gate: W0C2B0

Freeze **three** named source theorem roots and **three** independently importing consumer roots with **three** original Fock/source48 controls:

1. `originalFock_commutator_real_smul`: for `T,X : Op`, `c : ℝ`, `[T,c•X]=c•[T,X]`. Use the accepted real-to-complex source scalar bridge and qualified QTC0A complex commutator smul. NO hand-installed real scalar tower or fake commutativity.
2. `originalFock_real_matrix_bracket_contraction`: for any finite index `ι`, original `Op` family `x : ι → Op`, real matrices `A,B`, and index `k`, contract
   `(∑ p, B[p,k]•(∑ q, A[q,p]•x[q])) - (∑ p, A[p,k]•(∑ q, B[q,p]•x[q])) = ∑ q, (AB-BA)[q,k]•x[q]`.
   First prove the left-contraction lemma as a private original Fock helper using `Finset.smul_sum`, `smul_smul`, `Finset.sum_comm`, and `Matrix.mul_apply`. Only additive operator reindexing, no operator multiplication swap.
3. `originalSource48_gamma_real_bracket_contraction`: instantiate root 2 at exact original `Source48Label` and `sourceNormalizedGamma`; this is a **literal original 48-Majorana coefficient identity**, not the still-open statement that the Lie defect is central.

Frozen provisional source and independent consumer:
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2B0OriginalRealFockCoefficientContraction.lean`, Git blob **`4846915b6d6f99e765a1ec28f9286295d7db2571`**.
- `lean/diagnostics/BFSSP3M4W0C2B0OriginalRealFockCoefficientIndependentConsumer.lean`, Git blob **`ee6224071561e675d276e9d3a8d2bd865e87d7d6`**, **one import** of W0C2B0 original source, three independently restated theorem roots, three actual original source examples.

## Native qualification contract

Pin Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; exact source, consumer, workflow blobs; W0C2A accepted source/consumer/evidence; QTC0A and LB1C1 source; and retained W0C1 R1 original native RED. Strict workflow: exact-source preflight, cold original Lean build, `-DautoImplicit=false -DwarningAsError=true` original source + separate importing consumer; **3 original and 3 independent consumer `#print axioms`** reports with only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`; three original source controls; six deliberately bad auditor mutations. No additional axioms, `sorry`, `admit`, unsafe, special recursion/heartbeat increases.

On native RED: preserve provider-original ZIP and complete job log with hash manifest, diagnose at exact tested SHA. After two analogous native mathematical failures stop and decompose further; preflight/toolchain/harness failures remain separately preserved and do not count as proof failures.

Strict GREEN alone is not acceptance: independently preserve six-member original ZIP, full Actions log and all member digests/CRC in Git, then promote `BFSS_GATE_STATE.json` and independent roadmap guard. `full_bivector_bracket_qualified=false` remains frozen until separately qualified W0C2B1 (nested commutator and gamma centrality) and W0C2B2 (join to W0C2A) prove a full original bracket.

**No unqualified QTC1/CT1 adapter may be treated as accepted. No BMN proof, physical Spin(9), gauge/parity-admissible witness, BFSS spectral or ground-state claim is made.**

**W0C2B0 currently FROZEN, NOT QUALIFIED.**
