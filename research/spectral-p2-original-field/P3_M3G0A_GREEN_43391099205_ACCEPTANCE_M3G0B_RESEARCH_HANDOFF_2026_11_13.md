# P3-M3G0A strict GREEN acceptance — next M3G0B research-only handoff
**Verified:** 2026-11-13 Pacific. **Decision:** ACCEPT M3G0A, *only* within the named algebraic transport scope. Canonical integration branch `integration/bfss-unified-research-20261108`; frozen old proof files, main, FCP and Edition 0.7 unchanged.

## 1. Independent, exact test verification
- Strict [#43391099205](https://github.com/etblink/math/actions/runs/43391099205) is **completed/success** at immutable tested SHA `f5fffd4aa3ad0ddfda499f87a5e358cf83e83b2f` (attempt 1), workflow `.github/workflows/bfss-p3-m3g0a-original-fock-gauge-column-strict.yml`, workflow blob `01339242a437da51153a64f97b55e077e73e01c5`.
- Job `original-source-and-independent-consumer` **#131770921489**: exact 459-pin check GREEN; pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore GREEN; cold source compilation, independent source-real consumer and nine named axiom checks GREEN; evidence preservation GREEN.
- Final checked log markers `BFSS_P3_M3G0A_ORIGINAL_SOURCE_459_PIN_PREFLIGHT_PASS`, `BFSS_P3_M3G0A_MANIFEST_AUDIT_PASS`, `BFSS_P3_M3G0A_459_PIN_ORIGINAL_GAUGE_COLUMN_STRICT_GREEN` all present. No `sorryAx`, `sorry`, unapproved axioms or warnings passed the strict job.
- Exact file blobs confirmed: original operator-Lp M3 source `cc40839076eb980dab54f57af9c95b9d9e33da2c`, independent actual Boson2/Fermion2 consumer `b66dcf427baf572a44de3bd72566857803accbea`. The historical source L6G7U–Z six byte matches and the accepted M2C0/1 pins are in the audit.
- Immutable [459-pin manifest #43390427806](https://github.com/etblink/math/actions/runs/43390427806): GREEN, `e4ddc105f17e47f78bcf9ab60b5c822a9fab2e36`; 96 old M2C1 pins; 225 transitive gauge `OAI` modules; full deduplicated 459-pin union. Manifest audit JSON digest `sha256:7f38d8694b56656b08007af17212ddd724f2fa71815aa84375df53345e05c130`.
- Strict artifact **#14021737638**, 55,979 bytes, `sha256:f839289bb99d87777f7d61c19398809d80762e0e49d8f9f88eb388f4ea86df8b`, captured on 2026-11-13T08:32:51Z.
- Prior M2C1 acceptance #43379713104 (tested `88c0a1f5efef0418b12645cb05ff7eefac7e4fb2`) remains qualified as predecessor and must not be conflated with this gate.
- Administrative watchdog reds #43388694442 and #43389407971 were both the stale research-handoff check. Bounded repair #43389658087 and follow-up consistency #43391099137/#43391800403 were green; those earlier red events were not a Lean theorem failure.

## 2. Qualified mathematical declarations — exactly nine
`originalFockDiagonalGaugeUnitary`, `originalFockOperatorGaugeEquiv`, `originalFockOperatorGaugeEquiv_columns`, `originalFockOperatorGaugeEquiv_column_apply`, `originalFockDiagonalGaugeUnitary_one_apply`, `originalFockDiagonalGaugeUnitary_mul_apply`, `originalFockOperatorGaugeEquiv_one_apply`, `originalFockOperatorGaugeEquiv_mul_apply`, `originalFockOperatorGaugeEquiv_inv_cancel`.
All nine are audited with **only** `propext`, `Classical.choice`, and `Quot.sound` in the strict source and independent-consumer log reports.

## 3. What the result says
For finite Fock output index `ι`, a genuine original orthonormal basis `b` of the actual `Fermion 2` fiber, and actual source SU(2) group element `g : GaugeGroup 2`:
- The original L6G7Z `FullL2 2` unitary representation acts diagonally on finite `PiLp 2` genuine Fock output columns.
- Conjugating the **carrier equivalence** `C_b` with this diagonal unitary yields a continuous-linear automorphism `Γ_b(g)` of actual original operator-valued `OriginalFockOperatorLp` with its original bounded-operator norm; `C_b(Γ_b(g) f)=Δ_g(C_b(f))`.
- Exact componentwise, identity, multiplication and inverse-cancellation laws hold.
- `Γ_b` is a source-derived algebraic action, not yet identified in Lean as the basis-independent original pointwise physical field action.

**Not qualified:** original operator-norm Lp isometry, pointwise a.e. operator equality `Γ_g f (x)=ρ_F(g)∘f(β(g⁻¹)x)`, basis independence, strong SU(2) parameter continuity, L6G7V physical fixed-space iff genuine Fock columns fixed, explicit nonzero physical witness, original closed operator/Hamiltonian source domain, physical spectrum/mass gap/GUT/ToE.

## 4. Handoff and falsifiable M3G0B research
**Next:** `P3-M3G0B` is **RESEARCH_DESIGN_NOT_STAGED**, no Lean source/independent consumer/workflow. Before staging its pre-gate receipt, identify exact current a.e.-representative interfaces: M2C0 `originalFockOperatorLpColumnsEquiv_apply_ae`, L6G7U `actualOriginalFullL2GaugePairCLM` formula, L6G7Z `actualOriginalFullL2GaugeUnitaryHom`, original bosonic pullback and actual fermion left-output action. Derive a common a.e. null set across the **finite** genuine Fock basis so operator equality follows from pointwise equality on all basis vectors. Treat pointwise norm isometry and basis independence as separately named obligations.

**Falsifiers:** wrong inverse `g` vs `g⁻¹`; pointwise *operator conjugation* instead of left-output composition; silently replacing the original bounded-operator field norm by Hilbert-Schmidt; assuming a.e. equality from unequal null sets without finite union; assuming measurable field or inverse pullback without a qualified API; assuming a genuine physical fixed state exists; source Spin9/closed-Hamiltonian/spectrum promotion.

**Project Lead rule:** freeze M3G0A blobs; research and preregister M3G0B before any new source; no additional unrelated source searches or modifications to other project branches. Preserve first causal failures and exact CI receipts.
