# MASSLESS-D0b1 forward research — actual complex-linear maximal-domain multiplier and source graph

**Status:** READ-ONLY FORWARD DESIGN, NOT A LEAN THEOREM OR CI. Prepared while D0b0 [original strict R1 #44998375996](https://github.com/etblink/math/actions/runs/44998375996) is pending. **Do not launch** D0b1 until original D0b0 independently strict qualifies.

## Starting type contract

The original `FullL2 N` is `Lp (Fermion N) 2 (volume : Measure (Boson N))`. Candidate D0b0 `FCP.BFSSMasslessD0b0.originalMasslessDomain M : Submodule ℂ (FullL2 N)` is **defined by** `MemLp (originalMasslessAction M ψ) 2 volume` for the *original complex-linear* source Fock field `V(x)=M.quantizeFrequency(M1a.masslessSourceFrequency M x)`. D0b0 source is **unqualified** until strict GREEN; no staged clause is to be promoted before then.

D0a has **independently strict qualified** `MemLp` and explicit `FullL2` output for smooth compact input. Original `Core.coreToL2_dense` proves `DenseRange (coreToL2 : SmoothCore N →ₗ[ℂ] FullL2 N)` in source `Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`. Upon D0b0 strict GREEN, smooth-core inclusion + original dense range should immediately yield a **densely defined** natural-domain operator, with a small source-only consumer (not a new approximation project).

## Minimal D0b1 mathematical construction and proof interface

```lean
-- PROSPECTIVE, NOT COMPILED; exact signatures to be checked at gate time
noncomputable def originalMasslessMultiplier (M : AlgebraData N) :
    (originalMasslessDomain M) →ₗ[ℂ] FullL2 N where
  toFun ψ := (ψ.property).toLp (originalMasslessAction M ψ.val)
  map_add' ψ φ := by
    -- Use D0b0.originalMasslessAction_add_ae and
    -- pinned MemLp.toLp_congr + MemLp.toLp_add
    ...
  map_smul' c ψ := by
    -- Use D0b0.originalMasslessAction_smul_ae and
    -- pinned MemLp.toLp_congr + MemLp.toLp_const_smul
    ...
```

Because `Dom(V)` is a subtype of the actual complex Hilbert `FullL2`, this creates a **partial unbounded operator**, *not* a `ContinuousLinearMap FullL2→L[ℂ]FullL2`. The correct a.e. action theorem uses `MemLp.coeFn_toLp`; the correct graph is
\[
  \mathcal G(V)=\{(\psi,\eta)\in\mathrm{FullL2}\times\mathrm{FullL2}:
  \psi\in\mathcal D(V),\ \eta=\mathcal V\psi\}.
\]
Prove original `SmoothCore` domain inclusion at source and actual paired SU2 consumer. Preserve all a.e. representative equivalence and source `h=1,m=0`; no hidden finite measure or operator-valued unweighted `L²` assumption.

**Strict acceptance:** one exact source-path file and original source consumer on top of accepted D0b0, pinned all donor blobs, true native compile, warning-as-error, exact axiom roots, original ZIP/digest. No extra generic CAR/quantization recap. If D0b0 fails twice, stop instead of writing D0b1 as if its domain were available.

## Distinct later claims; do not conflate

1. **Graph closure** `IsClosed (graph(V))` is a *new* analytical assertion, not implied by a `Submodule` domain or mere complex linearity. For a strongly measurable family of bounded Fock-fiber operators, a standard route uses a.e.-convergent subsequences of (L²)-convergent graph sequences and fiber continuity, then rep-identification. Need source exact Mathlib subsequence/graph closure APIs; no theorem admitted here.
2. **Fiber Hermiticity** comes from original `FrequencyOperators.quantizeFrequency_selfAdjoint`, which requires `K.transpose = -K`. The accepted M1a source `K_{1,0}(x)=-sourceBracketCoefficient M x` is built from original structure constants and symmetric gamma; inspect original `M.structureConstant_cycle`, `M.structureConstant_swap`, `M.gamma_symmetric` to establish **source-typed skewness** before applying that theorem. This is plausible, **not presently independently strict qualified for K_{1,0}**.
3. **Global maximal-domain self-adjointness** is logically stronger than each fiber being self-adjoint. It requires a measurable family and an actual Hilbert-space multiplication-operator theorem; cannot be claimed from `IsSelfAdjoint(V(x))` pointwise alone.
4. **Gauge domain**: original `CovariantFields.GaugeData.deformedFermionField_covariant` **already proves** the precise (h=1,m=0) pointwise intertwiner on genuine paired SU2. To reach `G.physicalSpace`, prove a.e.-pullback transport of the partial graph and its `MemLp` domain using `Lp.coeFn_compMeasurePreserving` and the paired Fock action. Do not repeat the original pointwise gauge theorem.
5. **Physical normalized Hamiltonian**: existing closed/self-adjoint `H=(1/16)T†T` [strict GREEN #43493125150](https://github.com/etblink/math/actions/runs/43493125150) lives on its own genuine Gauss-invariant domain. No automatic equality between this H and source V-multiplication or a gap/SM/GUT/Hopfion result.

## Pinned Mathlib and original source evidence already checked

Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`:
- `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`: `MemLp.toLp`, `MemLp.coeFn_toLp`, `MemLp.toLp_congr`, `MemLp.toLp_add`, `MemLp.toLp_const_smul`, `Lp.ext`, `Lp.coeFn_add`, `Lp.coeFn_smul`, `Lp.coeFn_compMeasurePreserving`.
- `Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean`: `memLp_congr_ae`, `MemLp.ae_eq`.
- `Mathlib/MeasureTheory/Function/LpSeminorm/TriangleInequality.lean`: `MemLp.add`.

Existing `FrequencyOperators.lean` blob `8d18da2d1c8de554e6ad3da01cd5f930d8695681` contains source `quantizeFrequency_selfAdjoint (K) (K.transpose=-K)`. Existing `FrequencyContraction.lean` blob `425edf6d7d0f9d15ce5f8bc92e8788ef60068618` supplies original structureConstant cycle/swap identities. These are future analysis donors, not present D0b0 proof dependencies.

**Research governance:** D0b0 source proof first, then D0b1 partial map, then distinct closure/fiber-adjoint and gauge-domain gates. Preserve counterfactual red/green evidence; append only source-qualified new files to the [unified-selective import manifest](./MASSLESS_SOURCE_TO_UNIFIED_INTEGRATION_MANIFEST_2026_11_22.md), never merge exploratory branches wholesale.


## D0b1 candidate implementation and original strict R1

After independently accepting D0b0 original [strict #44998375996](https://github.com/etblink/math/actions/runs/44998375996) (source blob `84853fb624289121938e0fb4d2b45afdc16a74c6`, original artifact #14745166078 ZIP independently SHA-256 verified `48bc9d5fb1d2089e33ff8934c371ffbf4048740498b566c2e345e7421178b74c`), implemented `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMasslessD0b1OriginalPartialMultiplierGraph.lean` at [`a4e516a9f218954b0e9a75e382a3b585aaafa155`](https://github.com/etblink/math/commit/a4e516a9f218954b0e9a75e382a3b585aaafa155), source Git blob **`a1b0f6e9a3cf4a6f8f107dcd2854c28a05cfb92d`**. Exactly one import: original independently strict D0b0.

**Five candidate roots**: (1) `originalMasslessMultiplier : originalMasslessDomain M →ₗ[ℂ] FullL2 N` with original `MemLp.toLp_congr`, `toLp_add` and `toLp_const_smul`; (2) `originalMasslessMultiplier_ae` verifying the literal massless quantizer action a.e.; (3) `originalMasslessGraph : Submodule ℂ (FullL2 N × FullL2 N)` as range of the paired original domain subtype and new partial map; (4) `originalMasslessGraph_mem` source graph membership for any admissible original input; (5) `pairedOriginalMasslessMultiplier_ae`, direct original paired SU2 48-Majorana independent consumer. NO claim of a graph that is closed, fiber/global self-adjointness, physical gauge domain or energy.

Dedicated original pinned source-path strict workflow `.github/workflows/bfss-massless-d0b1-original-partial-multiplier-graph-strict.yml` at exact tested SHA [`bd581010aa384b66f1e6d64e172bf132b6165a6f`](https://github.com/etblink/math/commit/bd581010aa384b66f1e6d64e172bf132b6165a6f); [**strict R1 #44999415076**](https://github.com/etblink/math/actions/runs/44999415076), **QUEUED/PENDING / UNQUALIFIED at launch**. Pins literal original BFSS Core/MixedEnergy/DeformedCharge/FermionFrequency/FermionQuantization/FrequencyContraction, M0→M1c+D0a+D0b0, paired theta, Lean 4.34.1 and original Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original native build; warning-as-error; exactly five permitted `#print axioms` roots only `[propext, Classical.choice, Quot.sound]`, no `sorryAx`; `BFSS_MASSLESS_D0B1_PARTIAL_GRAPH_STRICT_GREEN`; unconditional original six-file evidence archive on RED or GREEN. **Do not promote or merge D0b1 without independent native and original archive SHA verification.** First strict native RED allows at most one exact-evidence proof-only R2; second RED STOP; never relax source pins or original workflow checks.

**Future boundary after this gate:** Separate actual original `Dom(V)` density, closure, measurable-fiber adjointness, and gauge domain/graph invariance from original massless identity. Existing `coreToL2_dense` in `Core.lean` can be reused, but is not itself a proof of the multiplier's closed graph or spectra.
