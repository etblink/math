# V10H-F4 Gate 1 RED — typed identity coercion correction (2026-10-31 PDT)

## Verified failure

- [GitHub Actions strict Gate 1 run #41260509990](https://github.com/etblink/math/actions/runs/41260509990), job `124712621398`, attempt 1, `completed/failure`, tested exact Git HEAD `3586d508c04e6389484884839c76cee040d846f4`.
- Preflight source SHA and pinned source prerequisites PASS; pinned Lean `leanprover/lean4:v4.34.1` + Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; accepted F3 source recompiled PASS. Fresh F4 `-DwarningAsError=true` compiler FAIL. Independent five-type/axiom audit SKIPPED. Immutable artifact [#13065356272](https://github.com/etblink/math/actions/runs/41260509990/artifacts/13065356272), SHA-256 `5e91890f91ea05eb6f1f53c52960db05a1778d48e53966d0a4109c193e9cd6ee`.
- Exact first and only compiler diagnostic: `...SU2BFSSPairedSpin9V10HF4OrientationNormalSubgroupProbe.lean:42:2: error: Type mismatch: After simplification, term hd has type (↑(source9SpinGammaOrthogonalHom 1)).det = (↑1).det but is expected to have type (↑(source9SpinGammaOrthogonalHom 1)).det = 1`.
- Root cause: `simp only [Matrix.det_one]` alone does not match `((1 : Matrix.orthogonalGroup SpinIndex ℝ) : GammaMatrix).det` while the subtype coercion remains unapplied. This is a **proof-interface/coercion** failure, NOT a mathematical contradiction or a source gamma/paired-label issue.
- All five `#print axioms` results from this failed compiler include `sorryAx` due to dependency on the first unqualified `gammaDet_one` proof; none were accepted. The earlier V10H original character reds `#41257058496` and `#41257744030` remain independent preserved negative knowledge.

## Narrow corrective experiment

Pinned Mathlib `Mathlib/Algebra/Group/Submonoid/Defs.lean` defines `Submonoid.coe_one` for the underlying `1`; the pinned `Mathlib/LinearAlgebra/UnitaryGroup.lean` defines `Matrix.orthogonalGroup` as the `unitaryGroup` Submonoid (not a distinct untransported matrix identity). Therefore at exactly the failing line change

```lean
simpa only [Matrix.det_one] using hd
```

to

```lean
simpa only [Submonoid.coe_one, Matrix.det_one] using hd
```

and touch no other Lean source lines. This explicitly performs the necessary subtype one-coercion before applying `Matrix.det_one`. The previously accepted `map_one` → matrix determinant evidence is unchanged.

Re-pin the strict workflow's exact Git blob of this 1-line corrective source and rerun fresh F4 source compile, five independent **exact theorem/definition/instance type** elaborations and allowed axiom whitelist `[propext, Classical.choice, Quot.sound]`. This correction remains a CANDIDATE until a full strict green run; do not infer acceptance from preflight alone. No changes to Lean options, no `sorry`/`admit`/`axiom`, no weakened statements, no source predecessor changes, and no default branch/upstream publishing.

## Scope guard

Even if F4 succeeds, `source9OrientationSubgroup` being normal and containing all source group squares is **not** the assertion `source9OrientationSubgroup=⊤` and is not an unconditional Spin9→SO(original paired48) map. Source topology/continuity, original Spin48 lift/cover, original Fock implementation and BFSS physical/spectral conclusions remain OPEN. Exact source F1-F3 successes remain accepted.
