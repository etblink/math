# K1D18V10C — acceptance, source-exact next boundary and V10D candidate (2026-10-31)

**Disposition:** V10C ACCEPTED, V10D NOT QUALIFIED until an independently passing strict gate. Earlier red evidence is preserved, no physical hypothesis is promoted.

## Verified V10C source and evidence

- Exact successful [GitHub Actions run #41251410920](https://github.com/etblink/math/actions/runs/41251410920), job `124685526458`, attempt 1, completed success on immutable SHA `d4638ff15d5b3407b1711895fd0e0f13925df80b`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean`, blob `f53d7c52559d8e00061716d2746a87154e35e3fa`.
- Original nine signed-permutation gamma source SHA `b9b8192055c70f0d001d7982669b9823c55562ed`; original accepted V10B one-parameter SO(48) source SHA `6cfd2b7fd2c240818350da5b41ce6a5446b12e20`.
- Toolchain `leanprover/lean4:v4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Exact preflight, dependency restore, antecedent source compile, fresh `-DwarningAsError=true` V10C source compile, independent typed elaboration for four declarations and explicit declaration-level axiom whitelist all passed.
- Accepted declarations `source9Quadratic_eq_dot`, `gammaNineRealLinear_sq`, `source9GammaCliffordAlgHom`, `source9GammaCliffordAlgHom_generator`. Each uses only `propext`, `Classical.choice`, `Quot.sound`; **no `sorryAx`**.
- Immutable preserved green artifact [#13061124258](https://github.com/etblink/math/actions/runs/41251410920/artifacts/13061124258), SHA256 `03e785084bec663a0721917ed5fd758e48772cfc36ae32fbec80ffd61b0c15ef`; nonexpired at review.

## Scientific interpretation and boundary

V10C gives the actual positive nine-source-coordinate quadratic form `source9Quadratic`, the exact accepted nine real gamma linear combination, the **all-vector** gamma-square equation and an actual algebra homomorphism `CliffordAlgebra source9Quadratic →ₐ[ℝ] GammaMatrix` agreeing with each generator. This is an algebraic theorem; it does **not** itself imply an image in matrix units, orthogonality or SO(48), a global Spin9 group action, source-group continuity, a topological Spin48 covering or the exact physical Fock action.

## Next bounded V10D candidate: genuine global algebraic source Spin9 → GL16

Pinned `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` defines the original `spinGroup Q` as a subgroup-like `Submonoid` with `Group` and `spinGroup.toUnits : spinGroup Q →* (CliffordAlgebra Q)ˣ`. Pinned `Mathlib/Algebra/Group/Units/Hom.lean` defines `Units.map` of a `MonoidHom`. Pinned `Mathlib/Algebra/Algebra/Hom.lean` coerces the actual V10C `AlgHom` to a `MonoidHom`.

V10D therefore constructs an **entire source-group**, rather than fixed-real-parameter, homomorphism `spinGroup source9Quadratic →* GammaMatrixˣ` by composing the two genuine units maps, then proves exact evaluation on the original Clifford algebra and `IsUnit` of all images. **V10D is a strict-gate candidate only.** It is algebraic GL(16) and must **not** be called the promised original global SO(48) representation before the additional source-exact 16-to-48 paired transport, orthogonality and determinant-one proofs.

Risk controls: do not assume `star (ι Q v)` equals the adjoint of the real gamma matrix (pinned Clifford star gives the negative sign on odd generators), do not assert a source topological Spin(9) structure, and preserve the actual original G1A `pairedLabelEquiv` rather than color-major indexing. After V10D qualification, the next highest-value independent obligations are genuine image orthogonality and faithful same-label paired 48 transport, plus the exact image of central `-1`; original Spin48 covering/lift and Fock/gauge/spectral statements remain **OPEN**.

This publication only adds a new audit record, V10D candidate source, and its strict workflow. Existing qualified results, upstream repository, canonical main and frozen FCP provenance remain unchanged.
