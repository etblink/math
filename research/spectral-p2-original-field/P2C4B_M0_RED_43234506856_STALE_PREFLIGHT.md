# P2-C4B-M0 third strict red — stale lexical preflight after consumer proof change

**Date:** 2026-11-12 Pacific. **Run:** https://github.com/etblink/math/actions/runs/43234506856
**Failed job:** 131238157564. **Exact tested SHA:** eb16a2a78e3619bd333a07f3c118e7e8d20be089
**Artifact:** https://github.com/etblink/math/actions/runs/43234506856/artifacts/13950079841
**Artifact SHA-256:** 8f162c82ef0091abbee3bc32ad70877006a2dd6f408ac746a6e86b44ca413ba3.
**Status:** strict RED at workflow PRE-FLIGHT, not at Lean source/consumer; no new mathematical evidence from this run.

## First causal failure and original-source status

Git SHA preflight returned the expected exact M0 source blob 68b20c8d6cc0b752ceda20cfd3eb6bdba93c315f and independent consumer blob 5936073b1007dc1fdaed685f95d226cfa00ee7cc. Pinned Mathlib and Lean 4.34.1 contract checks were present. The Python script then raised `AssertionError` at its line 44: `assert "Pi.add_apply" in consumer`. This assumption was left over from the earlier consumer proof using `simpa only [Pi.add_apply]`. The currently committed consumer now directly proves the exact pointwise identity by

    exact congrFun (originalActualDensity_eq_sourceSum f) x

and intentionally contains NO `Pi.add_apply`. Thus the preflight text check was stale and failed before any Lean/Mathlib restore or compilation.

The M0 original density-equality SOURCE had previously compiled with permitted axioms only and a full cold source build in #43227613296 and #43232000116. Its independent consumer has **not** passed strict compilation at its current blob, so M0 remains UNQUALIFIED and full P2-C4B remains UNQUALIFIED.

## Minimal bounded correction under Pre-Gate protocol

Fix ONLY the stale consumer **lexical preflight contract** in `.github/workflows/bfss-p2c4b-density-interface-strict.yml`. Replace

    assert "Pi.add_apply" in consumer

with

    assert "congrFun (originalActualDensity_eq_sourceSum f) x" in consumer

Keep *all* exact pin hashes, root declaration checks, two independent consumer examples, no-sorry/unsafe/axiom checks, source and consumer Lean bytes, cold build, warnings-as-errors and allowed axioms exactly unchanged. Do not suppress failures or weaken the strict full Lean consumer check. This is a verifier-contract repair only, not a new theorem or reason to revise the existing Pre-Gate Evidence Receipt.

After another strict GREEN, preserve full acceptance for M0 and only then return to the pre-gate-reviewed P2-C4B full integrability transfer using the ORIGINAL public `MassiveMoments.bosonic_core_integrable` and `fermion_core_integrable` plus the M0 exact equality. Never reconstruct already-proven original integrability witnesses. No Hamiltonian replacement, closed-domain coercivity, high-Spin9 sector or mass gap is claimed.
