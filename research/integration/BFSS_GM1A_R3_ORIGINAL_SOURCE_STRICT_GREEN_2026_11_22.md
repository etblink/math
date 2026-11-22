# GM1A R3 — original source exact a.e. gauge transport strict GREEN, 2026-11-22

**Independently qualified:** [original workflow run #45069397982](https://github.com/etblink/math/actions/runs/45069397982), attempt 1, source exact unified commit `1dd100cb7794f4af6f92680770539180614b3fb4`.

- Original source and isolated consumer preflight: **PASS**; Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
- Native original source import and **9,080 jobs**: **PASS**, both original GM1A theorems print only `[propext, Classical.choice, Quot.sound]`.
- Independent strict compiled consumer `FCP.BFSSGM1AIndependent.pairedSourceMasslessActionGaugeAETransport`: **PASS**, only same accepted Lean axioms, sentinel `BFSS_GM1A_ORIGINAL_SOURCE_AE_STRICT_GREEN`, no `sorryAx` or compiler errors.
- Original [artifact #14773221982](https://github.com/etblink/math/actions/runs/45069397982/artifacts/14773221982) independently downloaded; 11,959 bytes, ZIP SHA-256 **`2f3641f4a2b779c846788680bb06f94e1eca81a331f2f80ea8d2e25c66b6bb5b`**; ZIP CRC PASS for all six entries, `tested-sha.txt` exact match. Full native, consumer, cache and preflight files preserved.
- **Exact mathematical statement:** for arbitrary genuine source GaugeData, original massless Fock multiplication field applied to `U_gψ = G.fiberAction g (G.bosonPullback g⁻¹ ψ)` agrees almost everywhere with `x ↦ G.fermion g (originalMasslessAction M ψ (G.boson g⁻¹ x))`. Specialized to literal paired SU(2) 48-Majorana Fock, not proxy carrier.
- Historical native REDs preserved in `BFSS_GM1A_R1_NATIVE_REWRITE_RED_2026_11_22.md` and `BFSS_GM1A_R2_BOSON_INVERSE_NATIVE_RED_2026_11_22.md`. R1: source wrapper `rw` mismatch; R2: group inverse vs isometry `.symm` mismatch; R3: original source type-alignment followed by original MonoidHom inverse law qualified.
- **Scope restriction:** GM1A has no `MemLp` transformed-output conclusion. It does **not** yet prove natural maximal domain preservation, closed-operator graph intertwining, physical Gauss state invariance or spectral/topological conclusions.
- GM2A, a distinct independently audited candidate, uses `MemLp.toLp`, source `Lp` actions and GM1A's AE equality to test the domain-preservation gap. No automatic promotion of GM2A before strict CI.
