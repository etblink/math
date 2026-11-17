# BFSS × QIT × SCC — W0A0 all-48-label source-axis bridge, pre-gate contract

Date: 2026-11-16 Pacific. Project Lead contract **before** formal implementation.
Branch: `integration/bfss-unified-research-20261108`; baseline HEAD `d4fb229c736df3ff2cc2fce8d44cc52676a1b647`. Never write to `main`.

## Exact bounded mathematical target

Convert OP3-A2's existing exact equality at `(j : Fin 8) (s : Fin 2) (A : ColorIndex 2)` into a single theorem quantified over **every** literal original `p : Source48Label`:

```lean
theorem originalComplexEquiv_allLabelAxis_eq_activeGamma (p : Source48Label) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
        (1 ⊗ₜ[ℝ] (Pi.single p (1 : ℝ)))) =
      sourceNormalizedGamma p
```

The proof is ONLY the `sourceBlockColorEquiv.symm p` reindexing, `apply_symm_apply`, and `sourceBlockColorAxis = Pi.single` rewrite, followed by `originalComplexEquiv_sourceAxis_eq_activeGamma`. No 48-term elaboration, no new CAR, no K(A), no Jacobi, no Clifford-to-Fock reconstruction, no new axioms.

**This theorem is not yet generator spanning, scalar commutant, or witness completeness.** Its value is a verified label-exact join that removes a hidden untyped-indexing obligation from W0.

## Fixed exact donors

- OP3-A2 `OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk.lean` Git blob `a9db27fc28379b35ca85515d733cc0bc43376592`: `originalComplexEquiv_sourceAxis_eq_activeGamma`.
- S1V5 `SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe.lean` Git blob `fad0eab5014aa038ddb0bf8411b0e81c358e7908`: `sourceBlockColorEquiv`, `sourceBlockColorAxis`.
- M3I `OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean` Git blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b`, strict GREEN [#42547700192](https://github.com/etblink/math/actions/runs/42547700192).
- Toolchain `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Pinned source directly checked: `CliffordAlgebra.adjoin_range_ι` exists, but is not required in W0A0.
- Latest exact last-qualified QTC1G0 R1 [#44024718712](https://github.com/etblink/math/actions/runs/44024718712); source K/Q and source Lie bracket remain OPEN.

## Verification and stop rule

One public original-source theorem and one independently importing original-source consumer, with at least one separate arbitrary-label control; both must compile on the actual original `Fermion 2 →L[ℂ] Fermion 2`. Strict cold build, original source and independent consumer `#print axioms`, exactly approved `propext`, `Classical.choice`, `Quot.sound`, frozen donor Git blob checks, pinned Lean/Mathlib, six auditor negative mutations, provider ZIP and full log preservation before qualification. A green workflow alone is not final acceptance without the verified original evidence.

Do not alter the stopped CT1G0 R1/R2 [#43988822460](https://github.com/etblink/math/actions/runs/43988822460), [#43991790285](https://github.com/etblink/math/actions/runs/43991790285) or the stopped QTC1 R1/R2 [#44020471704](https://github.com/etblink/math/actions/runs/44020471704), [#44022359538](https://github.com/etblink/math/actions/runs/44022359538). On two analogous W0A0 source REDs, stop and redesign. No recursive or heartbeat budget escalation to conceal a proof-architecture mismatch.

## Dependency DAG after W0A0

1. W0A1: exact finite real coordinate-axis expansion; source-gamma commutator linear extension to every real `Source48Vector`.
2. W0A2: transfer from real axes through the complex tensor product to canonical Clifford generators, then pinned `CliffordAlgebra.adjoin_range_ι`.
3. W0B: show a commuting Fock operator defines an `A`-linear endomorphism; apply M3C's `originalComplexCliffordFock_scalarCommutant` with the **exact original module instance**.
4. W0C: prove trace of original Fock identity is nonzero and separate the scalar defect. Full W0 injective witness map only AFTER these source/consumer audits.
5. W1/W2: remain separately prospective. W0 completion does not prove BFSS physical-domain, gauge-singlet, mass-gap, or SCC ontology claims.

Decision gate: if even the small label reindexing triggers native elaboration failures or requires unqualified imports, do not scale to the 48-vector algebraic-generation theorem; preserve the negative record and compare cost against QTC1G1.
