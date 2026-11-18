# BFSS × QIT × SCC W0C2B0M R2 — explicit complex-module identities, frozen pre-gate contract

Date: 2026-11-17 Pacific. **R2 DESIGN ONLY; NOT A QUALIFIED MATHEMATICAL RESULT.**

Branch: `integration/bfss-unified-research-20261108` only; `main` untouched. This is the **single bounded native repair** after the first original complex-carrier native RED, not a retry of the stopped original real-source W0C2B0 R1/R2. Retain R1 source `19e20ca4138c0303c28e3ab46d4b2fcf3a496bb0`, importing consumer `14f366562c5986f58fd282a09e28720e7ea171b5`, and failed original strict workflow `90492c571e555267d560aba6c910fef43ae52faf` immutable.

## Exact original failure

Original W0C2B0M R1 strict [#44252646318](https://github.com/etblink/math/actions/runs/44252646318) **NATIVE SOURCE RED** at tested commit `113b4dbc7850152442b2303be70c82858504848c`. Source-exact preflight PASS, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored, original compilation FAILED, independent consumer not run. The exact failing source lines 47 and 59 are:

- `∑ p, (A q p * B p k) • x q = (∑ p, A q p * B p k) • x q`: `simp only [Matrix.mul_apply, Finset.sum_smul]` rewrote the matrix but left the scalar sum goal, with unused `Finset.sum_smul` warning.
- `(A * B) q k • x q - (B * A) q k • x q = ((A * B) q k - (B * A) q k) • x q`: `simp only [Matrix.sub_apply, sub_smul]` rewrote the matrix but left the scalar subtraction goal, with unused `sub_smul` warning.

These unsolved goals also caused `sorryAx` in both theorem reports. This is one native RED in the **new** complex-carrier architecture. Earlier [#44251761371](https://github.com/etblink/math/actions/runs/44251761371) was preflight-only, not native. Historical original real-source W0C2B0 R1 [#44218523669](https://github.com/etblink/math/actions/runs/44218523669) and R2 [#44222678258](https://github.com/etblink/math/actions/runs/44222678258) are two other stopped native REDs, never to be retried unchanged.

## Evidence preserved before repair

Original W0C2B0M R1 native RED artifact `14404568563`, ZIP 3,779 bytes, SHA-256 `e9242ef864e6f7bdacb76386f94595b1c67b5eb471f0c485de795bd2970d1529`, and complete Actions job log `134626770690` were independently preserved by [#44253870183](https://github.com/etblink/math/actions/runs/44253870183) GREEN, repository commit `f01760a1f278e278a2afdbb86fe9941a11cee503`.

Original Git blobs (all under `research/quantum-information/diagnostics/`):

- `BFSS_M4_W0C2B0M_R1_44252646318_NATIVE_RED_evidence.zip`: `277b934810e6a999c974917d23a199ccd0be3ddd`
- `BFSS_W0C2B0M_R1_44252646318_complete_job.log`: `043fb4d1cffaca05166825fcd5923e0278fb8b36`
- `BFSS_W0C2B0M_R1_44252646318_NATIVE_RED_evidence_manifest.json`: `32def22a3c715395de8950be6001a0549d00920b`

R1 source/consumer/workflow must not be overwritten.

## Mathematical R2 contract

Carry forward EXACTLY the same two theorem statements and genuine original carrier `Op := Fermion 2 →L[ℂ] Fermion 2`. Name the new source `P3M4W0C2B0MOriginalFockComplexNestedCoefficientR2.lean` and its separately importing consumer `BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientIndependentConsumerR2.lean`. Preserve the matrix coefficient sign/order and all index binders.

Only the two failed local proof fragments change:

```lean
      rw [Matrix.mul_apply]
      exact (Finset.sum_smul).symm
```

and

```lean
  rw [Matrix.sub_apply]
  exact (sub_smul _ _ _).symm
```

The exact pinned Mathlib `Mathlib/Algebra/Module/BigOperators.lean` has `Finset.sum_smul` with orientation `(∑i,f i) • x = ∑i, f i • x`; `sub_smul` has `(r-s) • x = r • x - s • x`. This direct application should be tested by original CI; it has **not** been locally Lean-qualified.

Do not modify any source-exact original gamma data, source48 label, CAR, `K(A)` or normalized scalar donor, previous original provider artifacts, or accepted 24 anchors. No new axioms, `sorry`, `admit`, resource escalation, or warning suppression.

## Qualification and stopping rule

R2 is PENDING until a **new** exact tested-sha native strict GREEN (source cold build, two source and two independent importing consumer axiom reports; at least two original Fock controls; six negative auditor mutants; only allowed axioms `propext, Classical.choice, Quot.sound`). Then independently preserve provider original ZIP/full Actions log with per-member SHA-256/CRC, promote canonical checkpoint and acceptance receipt, and require independent post-acceptance roadmap GREEN.

If R2 also fails in **the same original complex-module proof architecture**, enforce the two-comparable-native-RED stop rule: preserve the second original RED before any redesign; do not produce R3 of the same architecture. If a harness-only failure happens instead, classify separately, preserve, and repair only the harness.

Until full source-exact centrality joins LB1C1/Jacobi and accepted W0C2A, the original bivector Lie bracket remains **UNPROVED**. No Spin(9) global symmetry, physical BFSS spectral, ground-state, mass-gap, or SCC operational claim follows from this microgate.
