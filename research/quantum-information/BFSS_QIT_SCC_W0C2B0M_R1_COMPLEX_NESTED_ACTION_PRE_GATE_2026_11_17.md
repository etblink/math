# BFSS × QIT × SCC — P3-M4-W0C2B0M R1 complex nested coefficient action: frozen pre-gate contract

Date: 2026-11-17 Pacific. **DESIGN FROZEN; MATHEMATICAL QUALIFICATION NOT YET CLAIMED.**

Owner authorization: project-lead work on `integration/bfss-unified-research-20261108` only. No changes to `main`, accepted original donor bytes, preserved original green/red artifacts, or historical source. This is **a new mathematical architecture**, NOT W0C2B0 R3. The old W0C2B0 real-coefficient attempts R1 [#44218523669](https://github.com/etblink/math/actions/runs/44218523669) and R2 [#44222678258](https://github.com/etblink/math/actions/runs/44222678258) remain native RED/BLOCKED; original evidence already independently Git-pinned by #44221612711 and #44224922749.

## Provenance and motivation

Last accepted original gate: **P3-M4-W0C2A R1**, strict [#44213315719](https://github.com/etblink/math/actions/runs/44213315719), tested `48e7e58b23c19643c905d16fe69e46d0a7c0a73e`, original source blob `51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb`; preserved by #44216554946. Accepted anchors: 24. Original W0C2A proves trace-zero for the bivector Lie defect and **conditionally** reduces its vanishing to commutation with all 48 original normalized Majoranas. The centrality premise remains OPEN.

Accepted complex-algebra precedents are QTC0A source `b0b519e46566856e100bf6aa882f9fcdf37d397e`, QTC0C source `9448c9a47c605cb6aba2cfc798ae28a0213c9411`, and QTC0D source `e52b8ca7a440e04ab3c3a93187e5100daa39e074`. QTC0C proves related **two-index** complex-module coefficient contraction, not the precise single-index result below. Do not advertise QTC0C as already proving this contract. Use QTC0A for the genuine original `Op` type and qualified QTC0C/QTC0D as architectural precedents, not as false theorem dependencies.

## First atom: two root theorems only

Exact carrier, never a replacement algebra:

```lean
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2
```

For `{ι : Type*} [Fintype ι]`, `x : ι → Op`, `A B : Matrix ι ι ℂ`, and `k : ι`, first prove:

```lean
(∑ p : ι, B p k • (∑ q : ι, A q p • x q)) =
  ∑ q : ι, (A * B) q k • x q
```

Second prove:

```lean
(∑ p : ι, B p k • (∑ q : ι, A q p • x q)) -
(∑ p : ι, A p k • (∑ q : ι, B q p • x q)) =
  ∑ q : ι, (A * B - B * A) q k • x q
```

The coefficient ordering `(A * B) q k` is essential: defining `L_A(x)(k)=∑p A p k • x p` gives `L_B(L_A(x))=L_(A*B)(x)`. Avoid operator multiplication or rearrangement of noncommuting Fock operators; this gate uses only complex scalar action, finite sums, and the genuine original operator carrier. No real casted sums, new real-module instance, `Source48Label`, gamma family, skew hypothesis, or K(A) joins.

Use tiny typed finite-sum subproofs, `Finset.smul_sum`, `smul_smul`, `Finset.sum_comm`, `Matrix.mul_apply`, `Finset.sum_smul`, and `sub_smul`. Do not increase recursion/resource limits or conceal diagnostics.

## Independent qualification

Stage a new source file `P3M4W0C2B0MOriginalFockComplexNestedCoefficient.lean` and separately importing `BFSSP3M4W0C2B0MOriginalFockComplexNestedCoefficientIndependentConsumer.lean`. Two original `#print axioms` roots and two independently importing consumer roots; at least two actual original `Op` controls and six negative auditor mutations. No `sorry`, `admit`, custom axioms, `unsafe`, unqualified experimental QTC1/CT1 imports, source replacement or weakened `-DwarningAsError=true`. Allow only `propext`, `Classical.choice`, `Quot.sound`.

A **new** strict workflow must pin source, consumer, this contract, accepted W0C2A, qualified donor sources, and both stopped original RED artifacts, and assert a new `PENDING_STRICT_CI` gate state. Preserve independent watchdog behavior and distinct workflow concurrency. Pin Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

Do not label the gate GREEN based on local compilation, preflight GREEN, or roadmap GREEN. Accept only after exact tested-sha native strict GREEN with no `sorryAx`, independent consumer and negative-auditor PASS; separately preserve original six-member provider ZIP, full job log, per-member SHA-256/CRC manifest in Git; then promote in `BFSS_GATE_STATE.json` and `BFSS_ACTIVE_ROADMAP.md`, and require post-promotion independent roadmap GREEN.

## Subsequent gates and claim ceiling

Next separate atom is a thin original real-to-complex matrix-coefficient adapter, independently qualifying `ℝ→ℂ` and `Matrix.mul_apply` with typed small lemmas. Only then use accepted LB1C1, Jacobi and W0C2A to attempt `∀k, Commute (D(A,B)) (sourceNormalizedGamma k)`. The final full original bivector bracket is still unproved.

No unconditional original Lie bracket, group-level Spin(9), physical gauge/parity witness, ground state, mass gap, BMN transfer, or SCC operational capacity is claimed by this pre-gate contract.

## Stop and preservation

One first-causal native RED permits a genuinely bounded typed repair preserving the original attempt; two analogous native REDs of this new architecture stop it. No resource escalation, unprincipled retries, deletion of negative records, or workflow bypasses. Distinguish *workflow preflight* RED from *native Lean* RED and *evidence-preservation* RED. Preserve every original provider artifact regardless of mathematical verdict.
