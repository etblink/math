# TD-C1A R4 decision — change the proof architecture after three source elaboration REDs

**Date:** 2026-11-13 Pacific. **Status:** SOURCE-BOUND ARCHITECTURE DESIGN ONLY, NOT YET STAGED AS A LEAN THEOREM. No fourth cold CI launched without a focused feasibility check. TD-C1A remains RED/UNQUALIFIED.

## Evidence from three strict failures

- R1 [#43536957727](https://github.com/etblink/math/actions/runs/43536957727) source failure in real scalar compatibility of `L:Source48Vector→ₗ[ℝ] Fermion 2` and heavy basis `change`; [first-causal evidence](TD_C1A_R1_RED_43536957727_FIRST_CAUSAL_2026_11_13.md).
- R2 [#43539398734](https://github.com/etblink/math/actions/runs/43539398734) both `simpa [map_smul,Complex.coe_smul]` and `change L/R` exceeded recursion depth; [first-causal evidence](TD_C1A_R2_RED_43539398734_FIRST_CAUSAL_2026_11_13.md).
- R3 [#43541591975](https://github.com/etblink/math/actions/runs/43541591975) still exceeded recursion depth at source `:45:59`, `:79:8`, `:82:4` even with `ContinuousLinearMap.restrictScalars ℝ`, named source-axis equality and `Pi.basisFun_apply`; [first-causal evidence](TD_C1A_R3_RED_43541591975_FIRST_CAUSAL_2026_11_13.md).

All runs had frozen source/toolchain preflight GREEN, original C48C1A1d0 axis theorem compiled, and failed **new** TD-C1A source before the native independent consumer. None proves mathematical failure; all three disallow promoting the full-48 statement.

## A. Preferred architecture: operator-valued real-linear maps

Use the actual original Fock-operator algebra `Op := Fermion 2 →L[ℂ] Fermion 2` as the **codomain** for the finite 48-source linear extension, rather than turning every basis step into an original Fock **vector** evaluation.

Let `Γ : Source48Vector →ₗ[ℝ] Op = sourceGammaRealLinear`, `U : Op = (fermionGaugeUnitaryHom q).toContinuousLinearMap`, and `C : Source48Vector →ₗ[ℝ] Source48Vector` the real-linear map defined by the **literal** `sourceRealMajoranaMatrix q`.

Define real-linear maps on the same original `Source48Vector` (no replacement Clifford module):

`Lop(v) = U * Γ(v)`  and  `Rop(v) = Γ(C v) * U`.

These are linear by source Γ/C linearity and associativity/distributivity/centrality of the real scalar in the *complex continuous Fock operator algebra*. This avoids applying `U` to a Fock vector while proving `map_smul'`. A focused microcheck must verify exact pinned Mathlib lemmas for real scalar/mul commutation (`mul_smul_comm`, `smul_mul_assoc` or source equivalents) **without unfolding U**.

Apply the proven operator-valued basis pattern from `OP3C6COriginalFockActiveGammaCovariance.lean` (blob `2d6f777568b0026737112ff8256e5ed50fc9e6e6`): `apply (Pi.basisFun ℝ Source48Label).ext; intro p; rw [Pi.basisFun_apply]`, recover the original `sourceBlockColorAxis` using `sourceBlockColorEquiv.symm`, then prove **operator equality** on each basis via `ContinuousLinearMap.ext ψ` and the already accepted source `C48C1A1d0.originalGaugeUnitary_S1J_gamma_axis_forward`. Avoid the full `L/R:Source48Vector→ₗ[ℝ] Fermion2` map that recursively expands original Fock evaluation.

Once `Lop=Rop` is established on actual source, evaluate it at an arbitrary original `ψ` using `congrArg (fun T:Op => T ψ)`, then `mul_apply_eq_comp` (or exact pinned equivalent). This recovers **the unchanged TD-C1A theorem statement**. The independent consumer and original source theorem name remain identical.

**Prospective microcheck C1A4-P0:** one source probe that constructs the operator-valued real-linear `Lop` and `Rop` and checks their linear map coefficients and correct source G4E-to-Op coercion, with no theorem or root accepted. **P1:** source operator-level basis equality via one exact original axis lemma and `ContinuousLinearMap.ext`, only then full strict native independent consumer. Avoid another ten-minute full cold build on a cosmetic rewrite; if dedicated cheap preflight unavailable, provide a concrete proof plan and use no CI until the interface is independently reviewed.

## B. Alternative source already present: native Spin(48) Fock all-vector route

Earlier chronological source contains **another candidate proof-DAG**:

- `S1V52L9E5F13OriginalNativeSixteenSpin48UnitaryFockMajoranaCovarianceProbe.lean` blob `778cb87de23a6743876fdcd92610633e7f6dfc6f`: an all-`Source48Vector` covariance for the **native sixteen-block Spin48 Fock unitary**, not automatically the actual G4E Fock gauge operator.
- `S1V52L9E5F18BOriginalNativeFockSourceVectorCovarianceProbe.lean` blob `bde9ac2a17406d80a1301a2d2bcb0dbfe7f864e0`: original pairedTheta covariance candidate intended for S1H's `hV`.
- `S1V52L9E5F18COriginalNativeFockSourceGaugeIdentificationProbe.lean` blob `1535651a4f57feb6b9177dc9c2a220f07faa2fc1`: candidate application of S1H to prove **native Spin48 Fock SU2 representation = true `fermionGaugeLinearHom`**.
- `OP3C6COriginalFockActiveGammaCovariance.lean` is a source example of an **all-vector** extension proved at the operator-algebra level rather than Fock-vector level.

**Critical provenance restriction:** F13, F18B and F18C explicitly label themselves `PROSPECTIVE/UNQUALIFIED` in their source comments; no matching strict workflow for F18C was seen in current integration workflow inventory. Source existence is not qualification, and their construction represents a *different native gauge model until original S1H identification is itself proved*. Do not shortcut TD-C1A by importing F18C and silently upgrading it. Instead treat the full F18 chain as a **separate qualification audit**, recovering exact source/consumer/CI receipts before any dependency is admitted.

## C. Why not just increase recursion depth?

Three different formulations failed on source-definitional equality at essentially the same stage; increasing `maxRecDepth` may hide exponential kernel elaboration and make strict CI unreliable. A small, explicitly localized recursion limit may be an admissible fallback **after** proving that an operator-level interface is mathematically adequate, but is not our first intervention. The project requires frozen original source bytes and reproducible small proof DAGs.

## D. Next Project Lead decision

1. Keep `TD-C1A` **RED_UNQUALIFIED**, R1/R2/R3 immutable, and exact original theorem/consumer/workflow unchanged until a genuinely distinct proof is staged.
2. Test operator-valued `Lop`/`Rop` construction using the existing OP3C6C Lean pattern and source C48C1A1d0 axis theorem; use literal original G4E unitary and S1J matrix, not F18C as substitute.
3. In parallel, audit actual qualification provenance of F13→F18C historically; do not count pending source as completed.
4. Only after a successful narrow interface test prepare R4 and full native strict source+consumer+sole standard-axiom audit.
5. Continue independently accepted P3-AUX-G0B2→prospective G0B3 physical-space route and TD-A1 Gram reduction; never make unqualified TD-C1A a dependency of the accepted physical Hamiltonian.

**No new BFSS physical theorem, Spin9 fixed gauge projection, ground-state fidelity, mass gap, M-theory unification, or NFC result is claimed by this architecture decision.**
