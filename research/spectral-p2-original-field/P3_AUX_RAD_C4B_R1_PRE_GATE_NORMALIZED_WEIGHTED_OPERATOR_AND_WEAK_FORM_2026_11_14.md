# P3-AUX-RAD-C4B R1 — pre-gate evidence receipt: normalized weighted operator and full weak form

**Date:** 2026-11-14 Pacific. **Decision:** Project Lead GO after verified C4A R2 acceptance; no new Lean qualification.
**Branch:** integration/bfss-unified-research-20261108. **Reviewed existing-source baseline:** `3ade52a124e51356000246b0f5689dfd4829ff25`.
This receipt is committed before the first C4B source/consumer commit.

## Exact contract

For literal `M:AlgebraData 2`, `G:M.GaugeData`, `hε:0<ε`, let E=G.physicalSpace, K=PiLp 2 (SpinIndex→FullL2 2), Sε the accepted weighted charge, Aε=originalWeightedPhysicalAdjointSquare M G hε.
Define exactly
`originalWeightedPhysicalNormalizedAdjointSquare M G hε : E →ₗ.[ℂ] E := (1/16:ℂ) • Aε`.
Call it Hε here; it is distinct from the original unweighted source H.

Seven public roots under `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare`:
1. `originalWeightedPhysicalNormalizedAdjointSquare_eq`: literal Hε=(1/16:ℂ)•Aε.
2. `originalWeightedPhysicalNormalizedAdjointSquare_domain`: Hε.domain=Aε.domain.
3. `originalWeightedPhysicalNormalizedAdjointSquare_apply`: for u:Aε.domain, Hε on the corresponding natural-domain subtype equals (1/16:ℂ)•Aε u.
4. `originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint`: with existing originalPhysicalHilbertComplete M G instance, IsSelfAdjoint Hε.
5. `originalWeightedPhysicalNormalizedAdjointSquare_closed`: Hε.IsClosed.
6. `originalWeightedPhysicalNormalizedAdjointSquare_domain_dense`: Dense (Hε.domain:Set E).
7. `originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff`: for u:Sε.domain and w:E,
```lean
(∀ v : Sε.domain,
  inner ℂ w (v : E) = (1 / 16 : ℂ) * inner ℂ (Sε u) (Sε v)) ↔
  ∃ h : (u : E) ∈ Hε.domain, w = Hε ⟨u,h⟩
```
Full native signatures will be in source and independent consumer. No restriction to only smooth-core test vectors, no added domain-invariance assumption.

## Retrieval and source evidence

Actually inspected at the reviewed branch: complete current BB/BC/BD/BE sources, accepted C4A source/independent paired consumer/strict workflow, exact R2 run/job/logs and artifact metadata; C3DC density; M5BE0 original normalization source, independent consumer and receipt in preceding context; forward C4B/kernel/regulator memo; R1 red diagnostic and the successful R2 proof change. The current source inventory and earlier retrieval found no weighted C4B implementation. This is exact-ref source inspection, not an exhaustive all-branch/FCP census. Local Lean/lake are unavailable.

| Candidate / exact interface | Evidence | Type disposition |
| --- | --- | --- |
| C4A originalWeightedPhysicalAdjointSquare + selfAdjoint | blob 3202d27cbe9c27ea2d559cb0a1966c4a6d974920; strict #43585322863 at c2ff95769d65b45e002118eac6e12f910866373f | DIRECT REUSE: literal original E, Sε and natural domain |
| C3DC originalWeightedPhysicalChargeColumn_domain_dense_unconditional | blob 5ed2b3bfc6add8b50e25d43db3252ee7848caed9; strict #43579923559 | DIRECT REUSE: needed by full weak-representative iff |
| BE normalizedWeakRepresentative_iff_naturalAdjointSquare | blob 0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5; generic root audited in M5BE0 #43493125150 | DIRECT REUSE with T:=Sε, not the original-T specialization |
| BE selfAdjoint_smul_real / adjoint_smul_of_dense | same BE blob and M5BE0 audit | DIRECT REUSE at nonzero real c=1/16, including exact operator domain |
| BE one_sixteenth_inner_smul | same BE blob and M5BE0 audit | DIRECT REUSE of conjugate-linear first-slot normalization |
| M5BE0 original H and BE original-T specializations | independently accepted original H | METHOD ONLY / preserved baseline; not an equality to Hε |
| D2B26 and H4E3B1/B2 historical weak forms | inspected in prior forward memo; extra source/representation data | NOT NEEDED; avoid unnecessary imports and unproved historical aliases |

## Novelty and bounded proof

The missing source interface is application of existing BE generic normalization/weak-form theorems to this newly accepted weighted Aε/Sε. No new Riesz theorem, graph projection, spin/gauge action, Clifford construction or paper-source comparison.
Define scalar normalization, retain domain by the accepted BE definitional pattern, apply BE selfAdjoint_smul_real, inherit closedness/density, and instantiate BE normalizedWeakRepresentative_iff_naturalAdjointSquare with exact accepted Sε density.
The weak-form iff logically needs density alone; normalized self-adjointness separately consumes accepted C4A self-adjointness.

## Negative knowledge and falsifiers

- R1 C4A #43583785009 failed on native generic norm rewriting and proof letI lints. Use proposition-proof `let` and explicit existing source namespaces; do not rewrite through giant semireducible terms or suppress lints.
- M5BE0 R1 missed the BB completeness namespace; open it explicitly and retain the actual source instance.
- Exact 1/16 and its complex conjugation must remain; no convention changes to force a match.
- Wrong E/K, replacement of original unweighted H, extra source representation premises, testing only smooth vectors, a changed natural domain, source/consumer compile failure, or disallowed axiom block qualification.
- After two same-cause reds: stop, preserve first causal failure, and isolate a typed source interface; no tactic cycling or proof-budget escalation.
- Self-adjointness/full weak form do not establish normalized energy/kernel equality, graph-core density, maximal multiplier domain, regulator convergence, Hardy gap or eigenstate.

## Minimal strict acceptance

Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.lean`.
Consumer `lean/diagnostics/BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquareIndependentConsumer.lean`.
Workflow `.github/workflows/bfss-p3-aux-rad-c4b-original-weighted-normalized-adjoint-square-strict.yml`.
Source imports only C4A and BE. Consumer imports only new source and exact original G4J paired data. Independently exercise **all seven** public statements at literal pairedAlgebraData/pairedGaugeData, with the original FullL2/Boson/Fermion anchor.

Seven source and thirteen consumer root reports: seven new + BE normalized weak iff / one_sixteenth_inner_smul / adjoint_smul_of_dense / selfAdjoint_smul_real + accepted C4A selfAdjoint + accepted C3DC density.
Freeze every existing transitive OAI source against the reviewed baseline; explicitly pin original Core, G4J, BB, BE, accepted C4A and C3DC. Only the two new candidate files may differ. Let CI measure the closure count.
Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; cold OAI target, fresh warning-as-error source and original paired consumer; exact root order/allowed axioms [propext, Classical.choice, Quot.sound], no sorryAx or unexpected warnings; retain manifest/logs.

## Decision consequences

GREEN: record exact tested SHA/run/pins/source/consumer/axioms before any successor. Then consider the short graph-zero/kernel bridge from the forward memo.
RED: preserve first causal layer and the unchanged C4A acceptance; repair only that layer.
No source/consumer/workflow is staged by this receipt; no external gap or ε=0 claim.

## Launch binding — no contract change

[Strict #43587088274](https://github.com/etblink/math/actions/runs/43587088274) started at exact source SHA `08afa5c57b1f90daa621b938e778bb2ffb7770a2`; administrative #43587088273 is separate. Pre-gate receipt commit `bc175d114927d8a8a3df9882e4f2c2f0cef4b6ab` is the parent of the first source commit. Source `0fe927b9709bd0e359aafb691aca086c6e4a5c46`, consumer `f31c84b53f812efd41906e524604e49c1a4ab12b`, workflow `a3b59a8d21bae2f4f0be58a98a4e27ddf1b0c594`. No verdict or source-closure pin count is assumed from launch.
