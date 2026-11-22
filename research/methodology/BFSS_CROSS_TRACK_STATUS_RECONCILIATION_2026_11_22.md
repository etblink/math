# BFSS cross-track source/status reconciliation — 2026-11-22

**Status:** Current operational interpretation / qualified-evidence index only. **This document is not a new Lean theorem, CI qualification, a broad repository audit, or a modification of historical results.** Canonical source remains Git tree + exact original CI receipts; `BFSS_GATE_STATE.json` retains its M4 anchor register and now contains a dated cross-track pointer. No history was rewritten.

## Why a reconciliation is necessary

Source-file headers and chronological notes often say `PROSPECTIVE`, `UNCOMPILED`, `PENDING` or `NOT STAGED` **as of the time the candidate was written**. These are not current verdicts after a later successful exact source/independent-consumer audit. Conversely, a source carrying a theorem-like declaration, or a previous native source GREEN without independent consumer GREEN, must **not** be called qualified. The research aim remains truth seeking, not BFSS advocacy.

The legacy top-level M4 `BFSS_GATE_STATE.json` `active`, `last_qualified` and 27 accepted anchors refer to the M4 W0C2B2 branch of work, as of its prior November 18 checkpoint. **Do not overwrite those M4 anchors with independent GM gates or pretend W0C2B2 has qualified.** That legacy track remains blocked in its stated scope, but it is *not the global latest work*. `BFSS_ACTIVE_ROADMAP.md` is append-style chronology with old introductory sections; this dated pointer supersedes old global-status interpretations, not their original historical truth.

## Reconciled source-exact chain

| Workstream | Current verified qualification | Exactly what is supported |
|---|---|---|
| Massless14 + Gamma9 D69 integration | [#45059474635](https://github.com/etblink/math/actions/runs/45059474635) GREEN; tested `df9bc7ec663565de94020ebd7b38b35c70eae36c` | Two separately qualified original source results; no coupling from parallel import |
| Original SU(2) covariance | GM0A [#45061916954](https://github.com/etblink/math/actions/runs/45061916954), GM0B [#45063336191](https://github.com/etblink/math/actions/runs/45063336191), GM1A R3 [#45069397982](https://github.com/etblink/math/actions/runs/45069397982) GREEN | Original color/Fock gauge covariance and almost-everywhere transport, exact source conventions |
| Original natural-domain / operator covariance | GM2A [#45070954807](https://github.com/etblink/math/actions/runs/45070954807), GM3A [#45072663919](https://github.com/etblink/math/actions/runs/45072663919) GREEN | Original massless maximal-domain preservation and multiplier intertwining |
| Original graph preservation | GM3B [#45074131733](https://github.com/etblink/math/actions/runs/45074131733), GM3C [#45076208150](https://github.com/etblink/math/actions/runs/45076208150) GREEN | Original graph forward and two-sided gauge invariance |
| Gauge-fixed original massless operator | GM4A [#45078834611](https://github.com/etblink/math/actions/runs/45078834611) GREEN | Complex-linear partial operator on the exact original SU(2) physical-space domain |
| Physical massless nontriviality and density | GM4B0 [#45080704292](https://github.com/etblink/math/actions/runs/45080704292), GM4B1 [#45082278440](https://github.com/etblink/math/actions/runs/45082278440) GREEN | Explicit nonzero domain witness; dense natural physical domain |
| Physical massless graph closedness | GM4B2 R1 [#45083711948](https://github.com/etblink/math/actions/runs/45083711948) **native RED**; R2 [#45085548204](https://github.com/etblink/math/actions/runs/45085548204) **candidate, not accepted at record creation** | R1 invalid graph preimage rewrite; do **not** promote graph closedness until R2 independent source/consumer/axiom/artifact success |
| Original physical sixteen-charge domain | P3-M3W0D0 R2 [#43484147197](https://github.com/etblink/math/actions/runs/43484147197) GREEN | Original physical charge natural domain dense and nonzero; not an eigenvector |
| Original normalized physical Hamiltonian | P3-M5BE0 R2 [#43493125150](https://github.com/etblink/math/actions/runs/43493125150) GREEN | Genuine original `H=(1/16)T†T`: exact natural domain, self-adjoint, closed, dense; 21 audited source and consumer roots |
| Original source gauge graph and H identity | P3-M5BF0 R1 [#43498649514](https://github.com/etblink/math/actions/runs/43498649514) GREEN | Exact original BF gauge-source graph rebasing, same accepted physical H, nonzero natural H-domain vector |
| Legacy M4 W0C2B2 | `BFSS_GATE_STATE.json` status **BLOCKED**, 27 M4 anchors | Separate original all-48 gamma/Lie-defect centrality obligation; no 28th anchor |
| Historical original-vs-historical Hamiltonian BG/BH | **Not current-source qualified by these receipts** | Do not infer those further operator/domain equivalences from BE/BF |

**Physical ceiling:** Neither `V_F` nor `H` has a newly proved mass gap or a certified zero-energy eigenstate from these gates. Gauge-fixed physical SU(2) does not equal complete Spin(9) singlet reduction, and mathematical proof does not identify a Standard Model or GUT. Keep the original gamma/carrier dimension distinction: `Boson 2` is 27-dimensional (9 spatial × 3 color); the fermionic fiber arises from 48 Majoranas / 24 complex modes.

## Specifically stale-looking labels, with their correct interpretation

| Source / record | Label still found | Current interpretation |
|---|---|---|
| `lean/.../P3M3W0D0OriginalNonzeroPhysicalChargeDomain.lean` | `PROSPECTIVE` / unqualified-until | Historical preflight warning; qualified #43484147197, original blob `86823abdddb70d1c2158f8e215fb35760e107fd5` |
| `lean/.../P3M5BE0OriginalNativeHamiltonianPort.lean` | `PROSPECTIVE, UNQUALIFIED` | Historical; exact integrated source and original BE independently qualified #43493125150, blobs `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1`, `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5` |
| `lean/.../P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean` | prospective gate header | Historical; accepted #43498649514, source blob `f954917f21669fd68befc12f48a2b092b71a9044` |
| `lean/.../OperatorDependencies/SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe.lean` | `PROSPECTIVE / UNCOMPILED` | Historical; imported unchanged source blob `7b116f1efa2dd62cc5188b3ff2d2cf38ecd7bd9a` with independent #43484147197 and GM4B1 strict #45082278440 root audits |
| `research/integration/BFSS_MASSLESS14_D69_CANDIDATE_MANIFEST_2026_11_22.json` | `CANDIDATE_UNQUALIFIED_PENDING_INDEPENDENT_INTEGRATION_CI` | Correct **at candidate creation**, superseded by separately retained exact target GREEN #45059474635; not a live status file |
| Top of `BFSS_ACTIVE_ROADMAP.md` | multiple Nov 18 `PENDING` / `PROSPECTIVE` labels | Historical entries. New dated top pointer + this ledger supply the current cross-track view |
| `BFSS_GATE_STATE.json` M4 `last_qualified` / `active` | W0C2B1 GREEN, W0C2B2 BLOCKED | Still accurate **within legacy M4 checkpoint**. They must not be silently reinterpreted as last global BFSS qualification |

## Negative knowledge that must not be relabeled as physical counterexample

- GM4B2 R1 [#45083711948](https://github.com/etblink/math/actions/runs/45083711948): preflight and environment PASS, native source RED line 76 due to invalid `heq ▸ hraw` through a `Set.preimage` membership goal, downstream `sorryAx`; [original preserved failure record](../integration/BFSS_GM4B2_R1_ORIGINAL_PHYSICAL_GRAPH_NATIVE_RED_2026_11_22.md). Candidate R2 changes exactly this elaboration step; qualification still conditional.
- GM4A R0 [#45078747924](https://github.com/etblink/math/actions/runs/45078747924): a frozen-source blob-pin transcription error before Lean, corrected by qualified GM4A #45078834611. Preserve [original administrative RED](../integration/BFSS_GM4A_R0_INITIAL_SOURCE_PIN_MISMATCH_2026_11_22.md).
- Historical W0C2B2 R1/R2, M4 CT1G0 two analogous recursion REDs, massless D0b1 R1/R2 recursion REDs, and earlier D1F/D1S4 remain negative research evidence. Do not reclassify their proof-attempt failure as theorem falsification or fabricate a new qualification.
- Same-root stop rule after two analogous native REDs is unchanged.

## Bookkeeping policy / next safe update

1. Keep the **immutable chronology**. Don't replace `PROSPECTIVE` text inside frozen original Lean source or copy later GREEN into earlier pre-gate documents; those labels report the state at creation.
2. Maintain **one dated cross-track status overlay** in `BFSS_GATE_STATE.json`, pointing to this document, without modifying the legacy M4 `active`, `last_qualified`, `accepted_anchors`, `next_planned`, or 27-anchor count.
3. Add a short *current* pointer to the top of `BFSS_ACTIVE_ROADMAP.md` rather than rewriting its chronological narrative. Verify the existing five-minute `bfss-roadmap-watch.yml` consistency checker after the push.
4. Revise this live overlay only after **new exact original run evidence** is independently checked (native, independent consumer, allowed axioms, original artifact SHA/CRC). A source label alone is never a reason to promote a gate.
5. Do not modify `SM_GATE_STATE.json`, `research/methodology/BFSS_EXPERIMENT_REGISTRY.json`, original source theorem bytes, the original BFSS Hamiltonian donor, `main`, or historical negative records in this bookkeeping transaction.

**Current epistemic priority:** join source-exact physical massless fermionic multiplication to the independently qualified original sixteen-charge energy identity with exact signs, domains and normalizations. Distinguish numerical benchmarks and external papers from mathematical formalization and from empirical validation.
