# P3-M2B1 — small original-Fock HS L² field-column gate blueprint
**Date:** 2026-11-12 Pacific
**Status:** EXACT SOURCE PLAN; NO NEW LEAN GATE OR QUALIFICATION
**Predecessors:** M1 B4B [#43343959865](https://github.com/etblink/math/actions/runs/43343959865) and M2A [#43351955062](https://github.com/etblink/math/actions/runs/43351955062).

## Aim and falsifier
On a finite original Fock orthonormal basis indexed by `ι`, let `HS ι := OriginalFockHSFiber ι` be the transparently named `PiLp 2 (fun _ : ι => Fermion 2)` Hilbert space. For a measurable source `X` with measure `μ`, construct an actual complex linear isometric equivalence
`Lp (OriginalFockHSFiber ι) 2 μ ≃ₗᵢ[ℂ] PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)`.
It must literally reuse B4B `originalFockL2ColumnsEquiv μ`, preserving the D5B0 projection forward law and B4B two inverse laws. Consumer must specialize `μ` to the genuine original `(volume : Measure (Boson 2))`. Accept only if original source/consumer, cold build, 83 source pin manifest and axioms pass on one exact tested SHA.

**Falsifier:** `OriginalFockHSFiber` alias fails to synthesize source Hilbert instances in Lp; forward projection does not match accepted D5B0; chosen `Boson 2` consumer fails; non-standard axioms; drift in 81 inherited pins.

## What this does and does NOT mean
The M2B1 L² field is a Hilbert field of *original operator columns*; its pointwise fibers `OriginalFockHSFiber` are transparently `PiLp2`. It is **not automatically** a theorem that `Lp` of the original operator-*norm* continuous-map carrier is isometrically that space. M2A has a fiber linear equivalence between `HS ι` and source operators but not a source operator-norm isometry.

## Later M2B2 join (do not conflate)
Prove measurability, integrability and almost-everywhere reconstruction of the *actual original bounded operators* from their source-Fock Hilbert columns. Precisely distinguish an L² class of HS-valued fields from an L² class of original bounded-operator-norm fields; finite dimensional norm equivalence is a separate theorem if needed, and does NOT identify norms. Only then discuss exact source operator fibers in dynamics.

## Gate controls
- Expected source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M2B1OriginalFockHSFieldColumns.lean`.
- Expected independent consumer `lean/diagnostics/BFSSP3M2B1OriginalFockHSFieldColumnsIndependentConsumer.lean`.
- Imports: exact qualified `P3M2AOriginalFockHSFiber`, `P3D5B4BOriginalFockL2ColumnEquiv`; no new representation or scalar-field substitution.
- Preserve six M2A qualified declarations, exact source `Fermion 2`, no changing `OriginalFockHSFiber` from `abbrev` to opaque `def`.
- First proof: by definitional equality of source HS-fiber with finite `PiLp2`, reuse `originalFockL2ColumnsEquiv μ`. Check pinned `Lp` elaboration abstract-first, never increase heartbeat/recursion as first response.
- Strict workflow with new source & independent consumer pins (81→83), pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact cold build and `#print axioms`.
- **Non-goals:** full operator-field a.e. correspondence, SU(2) left-output gauge, continuous source Spin9 operator action, original H domain, reducing sector, coercivity, eigenpair or mass gap.
- Decision: **GO to bounded M2B1 mathematical construction after accepting M2A; NO GO to M3–M8 or unqualified 84/128 superspin promotion**.

## Retrospective process compliance addendum (2026-11-12 Pacific)

The gate was staged at `f3d741f8aedd9dbda5839e768e9d6bb41a0bcfb6` **before** a fully labeled Pre-Gate Evidence Receipt had been recorded. This timing gap is acknowledged rather than concealed. The [retrospective evidence receipt](P3_M2B1_RETROSPECTIVE_PRE_GATE_EVIDENCE_RECEIPT_2026_11_12.md) audits the exact accepted donors, first-causal reds, reuse decision and scope ceiling. It does not retroactively constitute a pre-staging approval or a strict-green result. Future source gates must complete the receipt before their first candidate commit.
