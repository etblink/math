# SM-P0N7 — Cross-channel neutrino GIM null control and BFSS proof-architecture transfer

**Date:** 2026-11-18. **Repository target:** `etblink/math@integration/bfss-unified-research-20261108`. **Predecessor:** SM-P0N6, verified HEAD `a1ce9da7dd40c2942b425875d967160382fd4b9b`.

**Status:** `SOURCE_BOUND_CONDITIONAL_NULL_CONTROL; INDEPENDENT_LOCAL_CONSUMER_PASS; NO_CI_PROOF_GATE; NO_FIT_OR_EXCLUSION`. This is a bounded Standard Model comparison study, not a new BFSS physical-map theorem, not a formal Lean acceptance, and not an FCP framework comparison phase.

## 0. Why we selected this target

The previous SM-P0N3–P0N6 neutrino study found legitimate mass mechanisms and a genuinely restrictive pre-JUNO TM1 relation, but not a complete contemporary physical prediction with defensible 2026 likelihood. Instead of using more parameter fitting to rescue one flavor construction, apply BFSS's most successful techniques to a **separate observable channel**: the charged-lepton-flavor-violating process `μ⁺→e⁺γ`. This process has a measured direct search limit (MEG II), and the three-light-neutrino Standard Model extension supplies a source-defined, highly suppressed one-loop baseline.

**Scientific question:** Is the light-only oscillation-input amplitude intrinsically insensitive to absolute neutrino mass offsets and CP texture choices in a way that permits a robust cross-channel *null bound*, and can this be independently consumed without importing undocumented BFSS/NFC physics?

**Finding:** YES for the **leading light-only one-loop expression under exact three-light-neutrino unitarity**. The observed mass-squared splittings alone force an extremely small upper envelope. **NO present discrimination:** MEG II sensitivity is about 40 orders of magnitude higher. The relevant lesson is a *separately quantified null competitor*, not confirmation of a proposed neutrino texture or any general seesaw.

## 1. Four layers, directly adapted from successful BFSS proof DAG work

| Layer | Source / task | What actually passed | What cannot be promoted |
|---|---|---|---|
| L0 — abstract algebraic atom | Two orthonormal rows `u,v ∈ ℂ³`; real diagonal `λ_i` | Given `Σ conj(u_i)v_i=0`, for any `c`, `Σ conj(u_i)v_i(λ_i+c)=Σ conj(u_i)v_iλ_i`; choosing `c=−(maxλ+minλ)/2` yields `|Σ conj(u_i)v_iλ_i|≤(maxλ−minλ)/2` | Not a physical QFT calculation, no lepton identification |
| L1 — **source-defined physical adapter** | Standard charged-current `U_PMNS`, three light neutrinos, `W` loop, `m_i² ≪ M_W²`; explicit source expression `3α/(32π)|Σ U*ei Uμi (m_i²/M_W²)|²` | Source-matched leading-order amplitude and unit conversions; independent explicit PDG-form PMNS consumer | Cannot transfer to finite-heavy-mixing seesaw without full nonunitary 5×5/sterile-loop amplitude |
| L2 — independent source/consumer | `sm_p0n7_clfv_core.py` and `sm_p0n7_clfv_independent_consumer.py` with separate PDG PMNS and expanded analytic amplitude | **Local Python 3.13 standard-library execution PASS**, two mass orderings, 24 `(θ23,δ)` fixtures; source and independent consumer Git blobs verified byte-identical to executed local scripts | Not Lean kernel acceptance; fixtures are not measured atmospheric or CP parameters |
| L3 — physically sourced data + measured channel | Dated September 2026 JUNO 207.2d solar/atmospheric splittings; historical Daya Bay reactor angle for consumer; MEG II 2021–2022 searched limit published 2025 | Central-input **conditional leading-loop envelope** and descriptive sensitivity comparison | Not a joint likelihood, 90% CL limit on the *theory* or full seesaw, nor experimental model exclusion |

BFSS **successful practice deliberately retained**: smallest original-source atom; exact type/unit boundary; distinct consumer with a different calculation pathway; frozen Git bytes/branch HEAD; positive AND mutation/negative tests; stop at the accepted proof/evidence ceiling. BFSS-specific lessons from S3G/OP and source/consumer gates warn that a proof of a convenient surrogate, missing conversion/coefficients, or a green harness is not original physical source qualification. Reuse the method; **do not import the BFSS mathematical object into neutrino phenomenology by name or dimensional analogy**.

## 2. Explicit source identity and literature formula

1. Particle Data Group, *Neutrino Masses, Mixing, and Oscillations* (2026 review, section 14.3, Eq. 14.34) — source 3×3 unitary PMNS parameterization (conventions given there), `https://pdg.lbl.gov/2026/reviews/rpp2026-rev-neutrino-mixing.pdf`.
2. Calibbi and Signorelli, *Introduction to Charged Lepton Flavor Violation*, Universe 8, 299 (2022), **Eqs. (17)–(18)** — leading light-only loop branching formula, GIM subtraction, and the warning that type-I seesaws with sterile-heavy states generally produce nonunitarity and must use the proper full one-loop function, `https://www.mdpi.com/2218-1997/8/6/299`.
3. JUNO Collaboration, *Measurement of Neutrino Oscillation Parameters at JUNO and Indication of the Neutrino Mass Ordering*, submitted 2026-09-29; **207.2 live days, 8294 IBD candidates**, `https://arxiv.org/abs/2609.37895`. The NO/IO atmospheric values were obtained in fits incorporating Daya Bay constraints. This new source **overlaps**, not independently replicates, the earlier 59.1-day JUNO result.
4. MEG II Collaboration, *New limit on the μ⁺→e⁺γ decay with the MEG II experiment*, `https://arxiv.org/abs/2504.15711` and corresponding 2025 publication. **2021–2022** data yield `B(μ⁺→e⁺γ)<1.5×10^-13` at **90% CL**. This is not a limit derived from the full later dataset; 2026 data taking ended in September and subsequent analysis must not be presumed published.
5. Electroweak mass context: Gfitter, May 2026 LHC–Tevatron combined W mass `80.3625±0.0077 GeV`, `https://project-gfitter.web.cern.ch/Standard_Model/index.html`. We deliberately use **`M_W≥80 GeV`** solely as a looser conservative calculation assumption, **not** its measured 90%-CL lower endpoint.
6. Fine-structure input: **`α≤1/128` is a declared conservative electroweak input cap**, not a source-derived probability interval. Its purpose is to avoid feigned precision. Neither choice is promoted into a global uncertainty statement.

The primary formula sourced under the exact light-only assumptions is

```text
BR_light(μ→eγ) ≈ (3 α / 32π) ×
                |Σ_{i=1..3} conj(U_ei) U_μi m_i² / M_W²|².
```

This is the **leading term** of a physical one-loop calculation and is not by itself a complete all-orders bound on the measured process. The exact *mathematical bound* below applies to that leading term.

## 3. Mathematical kernel and original-source specialization

Let `u_i=U_ei`, `v_i=U_μi`, `λ_i=m_i²−m_1²`. From unitary charged-current mixing, `Σ conj(u_i)v_i=0` and `Σ |u_i|²=Σ |v_i|²=1`.

For arbitrary real `c`, `A(c)=Σ conj(u_i)v_i(λ_i+c)=A(0)`; a common mass-squared offset is an **exact algebraic null direction**. Let `λ_min, λ_max` be the minimum and maximum of the three `λ` values, and `c=−(λ_max+λ_min)/2`. Then by triangle inequality and Cauchy–Schwarz:

```text
|A| ≤ max_i |λ_i+c| × Σ_i |u_i| |v_i|
    ≤ (λ_max−λ_min)/2 × 1.
```

The result is **basis-independent under rephasings** and requires neither `θ23` nor `δ_CP`. The mass-squared offset cannot be fixed by oscillations, and it does not matter here.

The separate **source-specialized PMNS consumer** uses 2026 PDG Eq. 14.34 and independently evaluates the equivalent explicitly expanded amplitude:

```text
A = c13 [s12 c12 c23 Δm²21
          + s13 s23 exp(iδ) (Δm²31−s12² Δm²21)].
```

The `θ23` and `δ` fixtures in the executable consumer are deliberately **synthetic test vectors**, not model fits or measured angles. The exact envelope is independent of them.

## 4. Conditional arithmetic and experimental comparison

**Fixed oscillation-source central inputs**: `Δm²21=+7.388×10^-5 eV²`; `Δm²31=+2.509×10^-3 eV²` (NO) or `−2.482×10^-3 eV²` (IO). We set the reference first mass-squared `λ_1=0` using *GIM shift invariance*, even for IO: the negative IO `λ_3` is a difference, **not** a negative physical mass-squared.

Take the conservative scenario caps `α_max=1/128` and `M_W,min=80×10^9 eV`; then

```text
BR_light,leading ≤ (3 α_max / 32π)
                   × [(max_i λ_i−min_i λ_i)/(2 M_W,min²)]².
```

| Ordering and source central splittings | Spectral range `max λ−min λ` (eV²) | Conditional leading BR envelope | Gap to MEG II's *published limit* |
|---|---:|---:|---:|
| NO | `2.50900×10^-3` | `8.9576237647×10^-54` | `1.6746×10^40` |
| IO | `2.55588×10^-3` | `9.2954926959×10^-54` | `1.6137×10^40` |

These are **input-conditioned analytical upper envelopes**, not measured or 90%-confidence limits on a full quantum field theory. Only the leading loop contribution in the stated low-energy model is bounded. A separate source-verified loop calculation already establishes the relevant coefficient. The gap-to-limit ratio is simply a sensitivity-scale diagnostic: it does **not** mean MEG II has statistically confirmed the light-only theory to 40 orders of magnitude.

The source-derived splitting values are fitted experimental inputs, **not model-predicted numerical constants**. The source has external atmospheric fit dependencies; no joint covariance is imported or fabricated. No attempt to extract a physical `δ`, `θ23` or a high-scale sterile-neutrino mixing angle was made.

## 5. BFSS-style negative knowledge, mutation tests and stop boundaries

**Executed locally (Python 3.13; no GitHub Actions):**

- **Positive** — independent PMNS direct sum agrees with the separately expanded analytic formula under 3 fixture values of `sin²θ23`, 4 fixture values of `δ`, 2 mass orderings = **24** parameter fixtures, all while verifying unitary row normalization/orthogonality.
- **Positive** — additive mass-squared shift by `+17.25 eV²` leaves the unitary amplitude unchanged within the declared floating-point tolerance, and each fixture stays below the analytic spectral envelope.
- **Negative / mutation** — adding `0.05` to one physical muon-row matrix entry fails the row-orthogonality guard; the raw mutant amplitude responds to a common mass-squared shift. This demonstrates that unitarity is **load-bearing**.
- **Negative / units** — misreading `80 GeV` as `80 eV` is explicitly rejected by the computational guard, rather than yielding a plausible-looking branching result.
- **Separate scripts** — `research/standard-model/tools/sm_p0n7_clfv_core.py` and `research/standard-model/tools/sm_p0n7_clfv_independent_consumer.py` are **distinct, exact Git blobs**. The local executed core has blob `656cdf7a3f86693daf75392ca0a6c2c1ea8ffcfd`; executed consumer `68fa5c1da519f633819137e7aa5eb0f2a717cf39`. The commit reuses the byte-identical blobs, not retyped approximations. The machine-readable experimental-source JSON is independently semantically verified after Git fetch.
- **Failure classification** — an initial local path resolution failure in the consumer was due to staging the JSON outside the intended `tools/../data/` directory; it was corrected **without changing physical math**. Keep this small diagnostic, because BFSS taught us not to interpret an infrastructure/path RED as a theorem counterexample.

**Explicit countermodel to generalization:** with nonunitary light charged-current mixing, `Σ conj(U_ei)U_μi` need not vanish. Then a common mass-squared shift need not cancel in the isolated light-sector partial amplitude. A proper heavy-neutrino source requires *all* active and sterile loop contributions, finite-mass loop functions, the physical total-unitarity relationship, and operator normalizations. The point is not that a nonunitary truncated amplitude is itself physical; it **falsifies the unjustified transfer of the light-only identity** to an unqualified seesaw.

**Unchanged qualification ceilings:** original SU(2) BFSS and frozen NFC **lack** a qualified four-dimensional lepton/muon observable map; no framework-specific convergence, physical ground state, mass gap, or spectral claim follows. Accepted BFSS anchors remain 27; blocked W0C2B2 remains blocked. SM-D1 full physical gate remains `PROSPECTIVE_UNSTAGED`. `SM-D0`, `SM-P0N0` through `SM-P0N6`, and FCP canonical `main` remain unchanged.

## 6. Scientific route decision after this bounded control

**Classification: `VALID_CONDITIONAL_PHYSICAL_NULL_CONTROL; NO_MEANINGFUL_CURRENT_DISCRIMINATION`.**

This is a **successful example of extracting a real result from familiar mathematics and independent physical sources**, while rejecting a premature theory-selection claim.

The next best scientific route should prioritize a cross-channel witness **within experimental reach**: for instance the light-Majorana-exchange `0νββ` effective mass floor under inverted ordering and explicit nuclear-matrix/extra-mechanism caveats (already source-scoped at SM-P0N3), or a **fully specified heavy-neutral-lepton model** with independently fixed masses/mixings and a computed CLFV amplitude. Do not undertake an unconstrained high-scale seesaw scan; it would dissolve the independent prediction. Require a model-to-observable proof DAG and an independently testable witness **before** any new Lean gate or expensive simulation.

The immediate choice is **preserve this null baseline**, then perform a source/likelihood-readiness comparison for candidates with actual near-term sensitivity. No background work, automation, CI workflow or experimental model acceptance is implied.

## Sources and live provenance

- PDG 2026 PMNS conventions: https://pdg.lbl.gov/2026/reviews/rpp2026-rev-neutrino-mixing.pdf
- Calibbi and Signorelli 2022 charged LFV loop formula and seesaw caveats: https://www.mdpi.com/2218-1997/8/6/299
- JUNO 207.2-day September 2026 source: https://arxiv.org/abs/2609.37895
- MEG II collaboration 2025 paper / verified as current at 2026-11-18: https://arxiv.org/abs/2504.15711
- Gfitter May 2026 W mass context: https://project-gfitter.web.cern.ch/Standard_Model/index.html
- BFSS qualified-reuse evergreen: `contributions/bfss-kotler/BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER_2026_11_10.md`.
- BFSS proof DAG: `contributions/bfss-kotler/BFSS_C48_VLY_BIL_INTEGRATION_BOUNDARY_PROOF_DAG_2026_11_10.md`.
- FCP Project Lead evergreen (historic research ref): `etblink/Foundational-Convergence-Program@research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md`.
